Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111D76AABC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BC710E323;
	Tue,  1 Aug 2023 08:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 564 seconds by postgrey-1.36 at gabe;
 Tue, 01 Aug 2023 07:33:23 UTC
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1630510E312
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 07:33:23 +0000 (UTC)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.trvn.ru (Postfix) with ESMTPSA id 4172040533;
 Tue,  1 Aug 2023 12:23:55 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
 t=1690874635; bh=VhWQpWeIJVaQvR+nN49f/eZhHGqk9eDHFxbkhszFyA4=;
 h=From:Date:Subject:To:Cc:From;
 b=1W0NZRPcadFBVEftL/GjHwF9GdM7bSlMIx9k9pKG9xsQIj+VDPo/rfFyWGk1eddR+
 1s+nL3DtAl41MM/2WBpFxNQHj94VVeeGJQy2sCcSHAGX3KybtEovHzDC9uIKagyjDc
 jcKjXz5+roEJTq+v7XiVle4gtKrgYZK/b/v+dMfQ6reF64iR7ZIZbFLOdFuGYAE1hN
 EXhsl+e25/GWnUCRT6/UuGGeZ9sre6+yt4pcK4+u4JO35elZMTRuOSVZ5RkUzJgljV
 oKEF58aUAqPIS2oC5P7VO9MvsxEumymC4VX2XZ/dc90aT5jzbAEkgdjawRpbzp2E/n
 1g2ra2NEgnGyw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Tue, 01 Aug 2023 12:23:37 +0500
Subject: [PATCH] drm/panel-edp: Add enable timings for N140HCA-EAC panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230801-aspire1-cmn-panel-v1-1-c3d88e389805@trvn.ru>
X-B4-Tracking: v=1; b=H4sIAPiyyGQC/x3MMQqAMAxA0auUzAYSCyJeRRxqjRrQWloQoXh3i
 +Mb/i+QJalkGEyBJLdmvUIFNwb87sImqEs1tNRa6onR5ahJGP0ZMLogBxKzny11brEEtYtJVn3
 +5zi97wezIFnaYwAAAA==
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=VhWQpWeIJVaQvR+nN49f/eZhHGqk9eDHFxbkhszFyA4=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBkyLMKWSdW28gw82xgTC6GdvJqTpnSx5WXJfeCE
 KbOkNY29r6JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZMizCgAKCRBDHOzuKBm/
 dRSPEACpgkqyf44BIvqZ/fy8s0uXHLEPBwZ/UyoP/pv5eI0bQEfAM0lAtiiCZO+8uF4oeveyvJJ
 6fpISLee5tC8+CWd6+TFTkCbKS21HZfE5NBtgdR7jnh/ghNYmxc418rr3DlZE3DJT/Qu7FchzVn
 oNaxKSvNqt8uVS8E/XPDNKS3/z1AW0s33cUnxyreGlcyHe3Fevca5J0x1Czb24fF6BAMzE6qjBR
 ONUQibqTmTCA5tzSwmGrk6XtVO9ex4Drly3ttiRYAeOhaGsny+W4RKstwjrVd42s77uGbqTnlkD
 jj8+GAf01aPyLh2sGI5QvjYaOoYQYGsEXXSXQr+hOISN1twlhgGl2obUOUN0nwtePX1IGb9keks
 mit29eIwLh09d62x7J8c9JDn61ZZ477x140wUgZVwP1om+cAFEQoTWhkT9SLfj2rQz4xe1ErNAP
 1iTGd1APFcqqSvi9Y2Hb9nSrVf/hK3lc4xBz5jNLhxVpMb/YoAjsQQ3nfyyclU0qedMRT2uvBiF
 4yVelQO8N9H/qDfUIu9qhzynRGs8gO9gewXS2z//zM9NvQvo/ptq+4XSVnFAw3vm6BODtxoH3pt
 PZa/bEjA4KAMrz0bWQVQi3etfOByuDGIr7ozKdeB7DtP6uq5NEKTFu6i+txN1xXM9eH5SB2hhFr
 fJxMu4SNHKL989g==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75
X-Mailman-Approved-At: Tue, 01 Aug 2023 08:18:42 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add timings for InnoLux N140HCA-EAC. This panel is found on some laptops
such as Acer Aspire 1.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Timings taken per datasheet:
http://www.58display.com/ggs/20180713155310173_N140HCA-EAC_Rev.C1_Ver3.0_20170121_201710238414.pdf
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index df7e3cff004c..feb665df35a1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1890,6 +1890,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),

---
base-commit: a734662572708cf062e974f659ae50c24fc1ad17
change-id: 20230801-aspire1-cmn-panel-011cb306ad30

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>

