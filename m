Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D55630939
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566B310E241;
	Sat, 19 Nov 2022 02:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9F10E1F9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 02:12:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82EFC62832;
 Sat, 19 Nov 2022 02:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D3DC433B5;
 Sat, 19 Nov 2022 02:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823932;
 bh=k8lrQeCvaTJykMFGCQm8vcB1H/Ui9AwSIVF6Zts0x1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rq2xopwnbrs7BhVoTMlgSSgP1g2IENdoAGIuCKOfhM0xY4/A8DZEs9u7HOC2v37YP
 M35xL7PNWZnuiczNxSaKOaOUpVtdlKkaLLEXftmLPO2W0PF0Sc4ddFuON9CKzRxXZn
 UGWh7YWmg6h9GwArK8wdj7DoDMsepIL65FI18q0Qx1YIkjud791Eg7eKORPita0xcD
 LxNIz2VjAmVAPvjAyY3Z/wSiuQhLI62WM/32XEXji8UppkN4HfagAjipQTpsyur32m
 RKrbxK8IGL4nKFKHODRjHTLYsxE6IEO76HVVOlL6Pa7wRTDlbx9FtypMTL7iKlgPGD
 jfiA6IsJE1Srw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 25/44] drm: panel-orientation-quirks: Add quirk
 for Nanote UMPC-01
Date: Fri, 18 Nov 2022 21:11:05 -0500
Message-Id: <20221119021124.1773699-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 308451d9c7fece33d9551230cb8e5eb7f3914988 ]

The Nanote UMPC-01 is a mini laptop with a 1200x1920 portrait screen
mounted in a landscape oriented clamshell case. Add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Simon Ser <contact@emersion.fr>
Link: https://patchwork.freedesktop.org/patch/msgid/20220919133258.711639-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 8a0c0e0bb5bd..f0f6fa306521 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -319,6 +319,12 @@ static const struct dmi_system_id orientation_data[] = {
 		 DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Nanote UMPC-01 */
+		.matches = {
+		 DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
+		 DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* OneGX1 Pro */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
-- 
2.35.1

