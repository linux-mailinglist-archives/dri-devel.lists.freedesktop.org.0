Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91DF82A987
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AA410E846;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id E83D610E085;
 Thu, 11 Jan 2024 03:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=V+U+dM4OmVoTS2YC8A
 HkHWnI+5wCPS12G/XIW6Y2PUA=; b=djDg4L3hZ0Xx/UqfoqIRFXLMjig4SvZ43D
 CNSAuDuagp3i4ferjDOHRpAe6FVO6FylnFkcrerNamkqwJWJrN2+FQfSXIpHQBKn
 0frf5QvpBYft/UaAtjGcm+ZNSoS7KgHKpvlW9wZZGLVkb6W+/mriuxUKK/aGPhzf
 rHGZI+VsU=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wD3P8UAXJ9lO5guAA--.26719S2;
 Thu, 11 Jan 2024 11:09:53 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 alexander.deucher@amd.com, airlied@gmail.com
Subject: [PATCH] drm/amd/include/vega10_ip_offset:Clean up errors in
 vega10_ip_offset.h
Date: Thu, 11 Jan 2024 03:09:51 +0000
Message-Id: <20240111030951.7046-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P8UAXJ9lO5guAA--.26719S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kGF1xAF1DJw1kKFW8Xrb_yoWfJrc_Ca
 4xXwn3GFWxZFnIqF12kF1xC34jk3WruFn3Ww1SyFyftrZrAr1UW3y5GrnrXr4ruasxCFs7
 Aa48XFy3ZrnagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQRixWVLYT7npQAAsJ
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/vega10_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/vega10_ip_offset.h b/drivers/gpu/drm/amd/include/vega10_ip_offset.h
index 3a22a5d16919..1e1ca69f21f7 100644
--- a/drivers/gpu/drm/amd/include/vega10_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/vega10_ip_offset.h
@@ -24,13 +24,11 @@
 #define MAX_INSTANCE                                       5
 #define MAX_SEGMENT                                        5
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 };
 
-- 
2.17.1

