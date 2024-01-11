Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE582A9B1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E0C10E85B;
	Thu, 11 Jan 2024 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8D4310E7F7;
 Thu, 11 Jan 2024 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=WrxlIiYF4btuCFh0aC
 etWERXHg/rWpEIVM4RgNLUC68=; b=JPAjVZouOCDG7zhICxezC1YJuJUM5ZRwDB
 eB1jqXlmmJwyXgjxkZ3OSA3wkXIiwLmLRgUMv0d/mfVRa/faJsOlS5UIwSMelrNf
 rMynibOsMfZo6BhBjo3t80zFnHpRYs6blRbev1MI0CueP59avdWrDQfL339185UG
 HI7L3pr0o=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDn79nqpp9laF6UAA--.52481S2;
 Thu, 11 Jan 2024 16:29:30 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in rs400.c
Date: Thu, 11 Jan 2024 08:29:29 +0000
Message-Id: <20240111082929.12064-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDn79nqpp9laF6UAA--.52481S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur45CrWxZrWDKry7ur1xXwb_yoWDZrg_WF
 y3uw4kXayIvFn3Z3W8Zw4rKr9F9F45uF4fWa12yry5Kr13Zr1xXFWkGF1UWrWfG3ZrAr9r
 Z3yvkF4SyrnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqA1i1mVOBlCy4AAAs+
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space required before the open parenthesis '('

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rs400.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 922a29e58880..d7f552d441ab 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -86,7 +86,7 @@ int rs400_gart_init(struct radeon_device *rdev)
 		return 0;
 	}
 	/* Check gart size */
-	switch(rdev->mc.gtt_size / (1024 * 1024)) {
+	switch (rdev->mc.gtt_size / (1024 * 1024)) {
 	case 32:
 	case 64:
 	case 128:
@@ -116,7 +116,7 @@ int rs400_gart_enable(struct radeon_device *rdev)
 	tmp |= RS690_DIS_OUT_OF_PCI_GART_ACCESS;
 	WREG32_MC(RS690_AIC_CTRL_SCRATCH, tmp);
 	/* Check gart size */
-	switch(rdev->mc.gtt_size / (1024 * 1024)) {
+	switch (rdev->mc.gtt_size / (1024 * 1024)) {
 	case 32:
 		size_reg = RS480_VA_SIZE_32MB;
 		break;
-- 
2.17.1

