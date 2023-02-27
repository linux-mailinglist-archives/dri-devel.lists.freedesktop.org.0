Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149186A36D3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBE510E2BB;
	Mon, 27 Feb 2023 02:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158C710E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:05:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 832D1B80CB9;
 Mon, 27 Feb 2023 02:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0738FC433D2;
 Mon, 27 Feb 2023 02:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463500;
 bh=8aJ0BuC8eFjFvmG12zK43hoaXimGS+Q/sRi3gZOAhAk=;
 h=From:To:Cc:Subject:Date:From;
 b=nWFWekbNlUXKX9i5Gycov6mpcWjIgh5SCw96N8PtCR8ygPDHVFqf5Fq3grOmvkYpO
 zQo61OxfOyHXuPHqXsEHMQywy9F0fw/lzReLhVg/l+fDSmVAH1tCkOWI7pqXKAShkq
 LrjjlQTykn9pbE+v4KSA8H3JsPdD/1AQd+217NEPMdty7vsjRcCsNIlEkih8ZhkVXr
 Vlp9vJWT3pvRSZ77oYdej2wOZyNLG4bksIN5AzvxvfI7k8lXSzlvaybMhSAv0poe7b
 VZYeVbOAFqg+pCPF4Xk0OGc/a7k4xyulQJMwGmRIf35RL/vgcLZ1CPjAMk+4ZlVZ5+
 VNrTXQAvZFGrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/58] drm: panel-orientation-quirks: Add quirk
 for Lenovo Yoga Tab 3 X90F
Date: Sun, 26 Feb 2023 21:03:59 -0500
Message-Id: <20230227020457.1048737-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Sasha Levin <sashal@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 8a238d7f7eea7592e0764bc3b9e79e7c6354b04c ]

The Lenovo Yoga Tab 3 X90F has a portrait 1600x2560 LCD used in
landscape mode, add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20221127181539.104223-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3659f0465a724..23d63a4d42d9c 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -127,6 +127,12 @@ static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1600x2560_rightside_up = {
+	.width = 1600,
+	.height = 2560,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Acer One 10 (S1003) */
 		.matches = {
@@ -331,6 +337,13 @@ static const struct dmi_system_id orientation_data[] = {
 		 DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Yoga Tab 3 X90F */
+		.matches = {
+		 DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+		 DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+		 DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data = (void *)&lcd1600x2560_rightside_up,
 	}, {	/* Nanote UMPC-01 */
 		.matches = {
 		 DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
-- 
2.39.0

