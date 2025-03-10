Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3412A58CDC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0510E3A5;
	Mon, 10 Mar 2025 07:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="IEqtXiRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8863 seconds by postgrey-1.36 at gabe;
 Mon, 10 Mar 2025 07:25:27 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.79.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CA10E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1741591469;
 bh=Wy+jnUoivwyS60gpTT9Uw9KftbsOYh42amALLbDE8D8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=IEqtXiRpvSLTLZCdYEECw7CbNez1RDCfH55X9M3fKj3uhvEXofzRyi6ho1OpOrW99
 5XS/mdxHNX2+kI+CWbnAcDyUQ4DzEGXyQBoKWsRxrXFrk3g/FRxtI39zjzvFLXd+J+
 dNODXZJxUqauTCEXtfxK8dUiVxyeYiYr41kNQcyQ=
X-QQ-mid: bizesmtpip3t1741591455tlup6ji
X-QQ-Originating-IP: C5l8J16DYC9HptF8KBT0mnAZGyZbnYXd4QOp+OU39QY=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 10 Mar 2025 15:24:13 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6406034055523155332
From: WangYuli <wangyuli@uniontech.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com, WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] drm/arm: Suppress "ARM devices" menu if not essential
Date: Mon, 10 Mar 2025 15:23:57 +0800
Message-ID: <D20815A68EE4902F+20250310072357.52841-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OAOHw7tUGLQOmUO5QGLUlZ0rTas9nWoVLFV94VzqTjHvUXGxUVCBub1I
 rbYvbxq4GlQ/OCoGI7YWfLGRbej9vqQ5mWNKIdUHKvMxY7bzYipsKRT7tdv1kccdDUlMtXY
 DXal1fBG8Jb/KcWjK46ImzTfm/EDbNe+39Z1wQTv1L+Qeuj5Xsa0rpd5RZuMNV/xw7yS9SL
 nS2tS8oMeMZ0yNP32mQhaWzP5YWHMW4XMSeh7GDCW+q+tuxgT3MkaUsU9cP11HImjLkan5q
 VR5EORQ71CIzhffhc2JYma5xmrMuY0Vz/h8Cx0ObXKyg3y14s44VYaCehfoR6hm9239Hyds
 oOCyH2NfcAb7KXYBjMxowryYy+4WwdY48k0wb+GjbDKMVd2cr1U6joHMBulNsa8TQIS5wOO
 vE4HmsO4A1YYBUczWKx9DzGh7JMcv4/6uQfjEjGY1Gcg38xPbrmMvwPpzmNaZeKZW3Bb72A
 G7F8HJOQgSYeBR6RG7CWCYjEjuaC+Qu9AghNVdnpKHFrprq6w1Ia4m4RimRGrvs9Vva2MXx
 Js6vEKs3Mo9gP04Hx0x61/J4FfpuEQiQ87jk/3BTX4IMuF4h/dmzHQGuAgpG+ilU7ziKUFu
 lHKOZSa+A0vpDqrer35l93Bkc9JE6m5p4CJgBNaW0PqKRhsi6g76PmwFkP5zalO2stT5B2d
 8rxwD5qvJCPctjVBsFWfcMU9xaYVQK8Fxjiy/QGsvEC1ehZxAk1Qef5vD1D2Co6PHm4sstN
 09JIrlPDrJqSU5bt0bRppk+RbL8R+dzFbRqIppDQVkCwy+92H/m9Jv1JgQkwG8jN6SYPhN1
 74+ZxVofxeNOBX1ZCUiyf/8mcFnBWjEHMqWw9uFJ+bz9XMLltEw7dft5828hyNF5I8ufHas
 FuWdkz5WRryNmy7wgZaRDmZkF55FQ+DzEaBPRihUilPmN8gOgf9LqVjs8rbCZ4yZAhQk8E+
 KFq5ubBC1Y35n3y+NtE8murbJM2fg5yMISLyAKlkdgIdiZZaX23QiLEifHos+9RuxKO306N
 BFuRqX/cCPCV7TUPewBYzjBb2N8mBPI4NDy3Agjw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Manifestly, the "ARM devices" menu is appropriate only for the ARM
architecture.

Inasmuch as every single item in this menu is predicated on
(ARM || ARM64 || COMPILE_TEST), it is therefore illogical for the
"ARM devices" menu itself not to be predicated upon
(ARM || ARM64 || COMPILE_TEST), and displaying a blank menu in other
architectures is unwarranted.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index c901ac00c0c3..0aa6a54567b6 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menu "ARM devices"
-	depends on DRM
+	depends on DRM && (ARM || ARM64 || COMPILE_TEST)
 
 config DRM_HDLCD
 	tristate "ARM HDLCD"
-- 
2.47.2

