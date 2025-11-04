Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B989DC3325C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE66D10E67C;
	Tue,  4 Nov 2025 22:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DzHmzXed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABFD10E679
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41A5C448BB;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15A0CC116B1;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294575;
 bh=tPw8QQtkgQ/ubzRfXEkVGYixKgB6MJOxqmk7tX3ogMw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=DzHmzXedMuO81RjbAynWr2b6TupVquttktUSNQry65OsF0IC6aUuzLxVb8NTu26zS
 pUXhuX5kc8b3L7oGN/wJDLc2XCPlpnf0s3dg/8EMSUuyly0VqGJ5eSMB57rMouwFXJ
 DEnao42SljziSu0/NGCATHN1B8pkfYrm0NfL8wPz2/poajO25sTijUjJc7TPxtSFLT
 opp8lNYgiAJJS7xR3PlLe1BKSVyoW3HeaS92H+u0YRfQFl5KR6CKk5amwqQI0q4SMH
 46wQdmFSctm4SA1GXczpxLYhjkdStbCMcOasW2A9dWU2f/9T6fVyZy2PMoKVf10xvr
 JENzKYbBaf9wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDE7CCFA07;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:17 +0100
Subject: [PATCH 09/12] drm/panel: sofef00: Name of compatible should
 correspond to the panel used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-9-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Q1+rieBGQ6VeDwGqVLQ0Szo7yx1/bCpLNjnwi01dWXI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssjt1R0WlC9R9CBT7rMfF1j9rawbA1vgPw5
 uF09VOMmhWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 ciIjEACdLKpaSOqpuNGJ6mcYFlJ/2DUTm7OCUG17xINWOVjF0L1sPhuNVtoA0DHr4P+0yAp56is
 kHxWCa6Mq3ggsm37Oz0NSg5U4M+7+PpUycKv4EMIBuThrGtKeTR+Pnq1UbcjPfQKuYFCQduC7Jq
 d8XeGsC+rb2FDqmhbF5CRzUZWbhs0XoAFh1wJb4TUNAzJ1pI1WAcbDyQnVUA0ISyV69ceVq6Yqd
 tqGRCj5UKf5RRUQh2HwIHDclrvH52UiWXYuRcSAEyPAGKpK+94wrWDDVX4WA7yTHWyGUBjveY+i
 Toy/fRW5vXowSJSYPE2gxDCWL3cLw4vIWorLpRqboJ6PIUHR7RRyRTUajRaETtJ8r6AyjIjxA55
 CPXvbsPFbeWqiuam7PZTTPomDAw7e+xHSES4rkPOGE7oq/f7X3ot/gSKgvHCsDEfMUnK9dIzAqb
 dlupjSQ19/upqeygiGnbZ00TvaW4oiTF+NY51R5UPOuqxg7oYAWuWd3D1TngiGfKZQ2ogbubbOg
 xHVowEPtSQXM/JpBA5tEKDa32c9dA7fA7s9xet1eKixQLMxssoT1ukkh6zbXD1knL340Yw0DsQv
 rHEj7kkL+tiTVWEvzPZdtsQ3sESa3lZrZoWDQp51pWpYcD9OdfUbyFeVZ09YO3fwg9twNYrO8Rn
 cdiSK2g2Wcwn94g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

At this moment we support only AMS628NW01 panel.

Adapt also the internal driver structures to reflect the name.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index d1e5340d7e337..7947adf908772 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -141,7 +141,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode enchilada_panel_mode = {
+static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
@@ -159,7 +159,7 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
+	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
 	if (!mode)
 		return -ENOMEM;
 
@@ -274,7 +274,9 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id sofef00_panel_of_match[] = {
+	/* legacy compatible */
 	{ .compatible = "samsung,sofef00" },
+	{ .compatible = "samsung,sofef00-ams628nw01" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);

-- 
2.51.0


