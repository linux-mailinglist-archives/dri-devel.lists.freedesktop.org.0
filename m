Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEFEB5899B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 02:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCF110E5E4;
	Tue, 16 Sep 2025 00:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rtPGscus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164010E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 00:33:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8AC8A401B4;
 Tue, 16 Sep 2025 00:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67C79C4CEF1;
 Tue, 16 Sep 2025 00:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757982817;
 bh=2kJvMz0dBmm0szegM5HnmZW3wdSVfUl1a4IWQWdik2Q=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=rtPGscusfIYxKisZD1Tym03GoAdh4LPe6Z97QpnKY/CiM0+4QPQ2F510dMPEAHOV+
 ulkEbfqeDBy6x6LAarL/ExFu9DrjKfmwUeXa4lAYIaTomaD3vDjgluuUMZ/TqojSJb
 6UFwucZ+OZcArESAZ1IvNEyAY+p045vjnh16TgyYxNZHE6mb+DUufPlhWhBWpnQF9g
 Tt9dIzZoBxlpjXqASKeMNn5VfOlQDlZu15ZchzMBvWHRA/8A+vVdSdQJ+FKu9viPjl
 2Ag038Hx8ruDo9EYAQqoYlg7HX+u32hjgb4UvVaGRuzrRkMct3PIXW8GzkvlFATkvg
 tW+xYlX1rQqzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 586D1CAC599;
 Tue, 16 Sep 2025 00:33:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 16 Sep 2025 02:33:36 +0200
Subject: [PATCH] drm/panel: samsung-sofef00: clean up panel description
 after s6e3fc2x01 removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-sofef00-cleanup-v1-1-b29e1664e898@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAF+wyGgC/x3MQQqAIBBA0avErBMmw6iuEi3UZmogLJQiCO+et
 HyL/19IFIUSjNULkW5JcoSCpq7AbzaspGQpBo3a4NB0Kh1MjKj8TjZcp/LYG+u5ddoZKNUZieX
 5j9Oc8weA+4LuYQAAAA==
X-Change-ID: 20250916-sofef00-cleanup-c085acf3b2b5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vo30ySEKbwVLd4wJGZXK3DYrwb+5uoOUHN9Z3tkw/RA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoyLBgQisV2RZYzpW9l4L7c2tCagnZkiNAjX5b9
 325Qg8xWkCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaMiwYAAKCRBgAj/E00kg
 cqklEADFxFkk6JcLnrtONGgJ8vcty5k0M/XCKuwWdupm27YgtftI5wqj0uBwNoGJ4XSfqCvhINg
 vTiubUVj/FRdBWl+5NCzRSHFwjLm5UJTbb1+ek5Ie9lfbyF3RWm4/xhKnxxGGwgWYRLA2OHfIP+
 5oexo0x0VQ7DhVy1EWmLcs53SUkAXXvZ/G74LxJyrMQSenvH/VFLi+4KmLA1dogJ3VBKwmdMv9a
 XxLsYrZt/nkp3B9iO1us4d819dvlQ5hKThKHfyUZsPuLHkBWQINLRoGZ4N3tljS7i0ps5d/9L7G
 6MRwWfEnU3lEZzgwqamExt3gkhu7fAi7rdT9aK1ttNxBBSjU+/ePnFFROWBEEkprlbRhcKMqqJJ
 gMXtvclSji21QIy/5zlBmK/5daTgDe800ZxaFMzDuyz31crpRv2WehBMhYOa+m3fRR0X47u2FVC
 1uZe4OkC9E7TGMjR+ZS5NGpRjCmnsB3Ak6ICHdW1eA30GydnphTBXNgIIwbr4LhDoL2yulIla5g
 IgInBT1lxCGLL8fQ0qhsfiu4gpqOP+tkjsNJGqsPU2IXr40YY/J+HGoUpkfHEAvkpaE/5f2wrO9
 fAbtThhZVE2ZDkgQuVa6qYJu/RgDMC2UrJ0CfCf0X+kjeZ6FbOCGLWQ2LsWDn5gN4Yy0R5+Txl+
 8VIp1uv2v5TcARQ==
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

Remove leftover from s6e3fc2x01 support drop.

Fixes: e1eb7293ab41 ("drm/panel: samsung-sofef00: Drop s6e3fc2x01 support")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig                 | 6 +++---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b2ec66e5d0eddae26b3368e4cb2cb..d9c472534214f8bdf74545bc6b439354559d5d12 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -868,16 +868,16 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  DSI protocol with 4 lanes.
 
 config DRM_PANEL_SAMSUNG_SOFEF00
-	tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
+	tristate "Samsung sofef00 OnePlus 6 DSI cmd mode panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
-	  command mode panels found in the OnePlus 6/6T smartphones.
+	  command mode panel found in the OnePlus 6 smartphone.
 
-	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
+	  This panel resolution is 2280x1080@60Hz
 
 config DRM_PANEL_SEIKO_43WVF1G
 	tristate "Seiko 43WVF1G panel"
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 064258217d50ad6f02d27a97f8aff2e298260d4b..c181ff3c7d761263b289a46781a3041372dac656 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -260,5 +260,5 @@ static struct mipi_dsi_driver sofef00_panel_driver = {
 module_mipi_dsi_driver(sofef00_panel_driver);
 
 MODULE_AUTHOR("Casey Connolly <casey.connolly@linaro.org>");
-MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OnePlus 6/6T phones");
+MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panel found in OnePlus 6 phone");
 MODULE_LICENSE("GPL v2");

---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250916-sofef00-cleanup-c085acf3b2b5

Best regards,
-- 
David Heidelberg <david@ixit.cz>


