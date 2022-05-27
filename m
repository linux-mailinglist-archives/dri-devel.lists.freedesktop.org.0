Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C0535816
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 05:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51410F10F;
	Fri, 27 May 2022 03:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 79272 seconds by postgrey-1.36 at gabe;
 Fri, 27 May 2022 03:42:05 UTC
Received: from out203-205-251-27.mail.qq.com (out203-205-251-27.mail.qq.com
 [203.205.251.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F8210F10D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 03:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653622921; bh=Tc5FCCZeEqnBcWCXDPJXsXDMs5vSLuP0zWO089nqAJU=;
 h=From:To:Cc:Subject:Date;
 b=NoNXzFbEq10EuTx01p2AMoqZCbQVJRbVBFweOgPniT3vNc37Mh8Ic5poV+5Zq0+k8
 sb859inOPS1pSw33XNm5IBS+cjPSKFfrwOMMOs9ZhiPBh9acI0LR3ok5WTLW7zaOsP
 6EG76LqNv2k+lvILxTV2Qw4uQCMHDdOHTIE58Vjc=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
 id A7B238B7; Fri, 27 May 2022 11:41:59 +0800
X-QQ-mid: xmsmtpt1653622919t6sdv0cgn
Message-ID: <tencent_E15665F62AAE22B108A00645874D3F53CF07@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCthJDN0SBEBaisZTrDtJZ/56QhrCr/sHDqn7jyMNc93yfePA0xUA
 QczYeHFkTXGXNgFgl4aKEP1eMiBeyO4w5//84v/Sqy2HmMN1A5OJr7Nq4BCz40J0dKF1IqPqR/Qt
 e4uERjmX9qnKsuA0FmA5Co/L4f1Ejyd7gg2xuZGaxlxT6lv6B39ngzaUdnQyKC/EJvfVD7r4FRV0
 Y08RbilgNA/uOCBEU+WxyzQSoAGVzLcLYNHt+aMiE1UaOVhsD6IvuxCRQbJcjgsAXnwciCI0KVLi
 WFz3Gm26vXypj5jUt07iBI/SatRrBb+IdRGG1Ck60Dmq7QB7SAOnXqm8qDtqoerjKDXtaHLrP6tW
 7N6gBFycmbLgfYgPHFAE3Ycg/4ZowG3aNXy5bRCQxH1sI8TH3lFnS9InzG3CPdwpl67atPxa5YiN
 TopoC5Rc4592SEVm6+3NJ0HhIH9HGvpFT7SpqM0qZP491thMH9DVhWRv2jF0m+nw8Ls4R1YPVM9G
 ydeWhfa1AKpA8I0+xnGBGTA5aOKEyX+tfUJGaSOLdS/sK+F6S64i0yzHtZzzBHIAgfgLIeU45+L9
 lm3DrFiZ9UQdqD2llJBEmco4XGuXCfCbc0pv7VjFG4Pi7yLmLqruSIYBfgyKvx3oQL4yQWRQDC2e
 z1PEQrM17JGLwRA/KGSjRO6yrMmtL74gqH972c4OVvQOnCT5NhotK6DVsD7N0YLZdFeNJZ+yFguk
 RVkW6Hjdm7MY09EXNVPWe0TYWKgDNVQpjcD/bHHjaoMpZjoG4KdtCnwL6YaVCZ2L0ilaUURsoscg
 n3KOZJJdstlCJD+n8ITlBpn1dB9vfx2XTjcJGpO5xBER+HyTcGnVGJfVVEEBVr3TFHFQz0MRHN38
 UEc5biYdkqeQ1Yw8HH4GBD1lFswOPupg==
From: 1064094935@qq.com
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 2/5] drm/gma500: Fix spelling typo in comment
Date: Fri, 27 May 2022 11:41:47 +0800
X-OQ-MSGID: <20220527034147.1203944-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
index 600e79744d68..7efbd7c45c90 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
@@ -371,7 +371,7 @@ struct psb_intel_sdvo_tv_format {
 
 #define SDVO_CMD_SET_TV_FORMAT				0x29
 
-/** Returns the resolutiosn that can be used with the given TV format */
+/** Returns the resolution that can be used with the given TV format */
 #define SDVO_CMD_GET_SDTV_RESOLUTION_SUPPORT		0x83
 struct psb_intel_sdvo_sdtv_resolution_request {
     unsigned int ntsc_m:1;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
