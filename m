Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37A55427A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224211388E;
	Wed, 22 Jun 2022 05:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A581010E944
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:44:17 +0000 (UTC)
X-QQ-mid: bizesmtp76t1655819046tiho5ors
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:44:03 +0800 (CST)
X-QQ-SSF: 0100000000700060B000D00A0000000
X-QQ-FEAT: im3L/SzDuHb+PBZItGUN4C+pdaOOhthsGIesY3yK58ihyIqmNp54sUmkdtCEa
 QA0tSBX3cSGjcsBF2tKvehCUfKLhLM4/ddodxQcB0JMjzzp92vlxdD0m9L6l4Xb//+QO7+u
 fb6fSEGPfFhzRvj1Wq48aHwboOspe+kGf+5Ht6awAY38fdgvXBzpXqt4orDtaJTLEBhugKQ
 fiBl0EY7mqgwxNTXbfVXgilSoz2EX+PNCkMaDsdK04zNyWyq6H5u+WYx/NZRDhVfZaF4dPm
 5sFu2jNP4YFG3zuQj/xe14Z+LEGG62ogi/n4E8DTjKO4VnVdMvtONOUQYwRgfcD4MMkLC8i
 ylHU0c3qizjAukpLlg3Fb8NCTW5pw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: panel-orientation-quirks: drop unexpected word "the" in
 the comments
Date: Tue, 21 Jun 2022 21:44:01 +0800
Message-Id: <20220621134401.10290-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: Jiang Jian <jiangjian@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/drm_panel_orientation_quirks.c
line: 196
* GPD Pocket, note that the the DMI data is less generic then
changed to
* GPD Pocket, note that the DMI data is less generic then

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index df87ba99a87c..7a9eeed239f3 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -193,7 +193,7 @@ static const struct dmi_system_id orientation_data[] = {
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
-		 * GPD Pocket, note that the the DMI data is less generic then
+		 * GPD Pocket, note that the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
 		 * are quite rare, as are devices which have both board- *and*
 		 * product-id set to "Default String"
-- 
2.17.1

