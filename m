Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AB1BCF1D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 23:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FA889AEA;
	Tue, 28 Apr 2020 21:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A441D6E868
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 21:51:25 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N7AAk-1j6MzP3hIC-017VGL; Tue, 28 Apr 2020 23:51:08 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] sun6i: dsi: fix gcc-4.8
Date: Tue, 28 Apr 2020 23:50:51 +0200
Message-Id: <20200428215105.3928459-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZCiPoCu8/855vOssuIX2vsSYggCrutxY7YqutVaEtw8vkoiYlac
 WBX5+ko8ZP9Ip4FKT0MD3GhktaC1cPL2IQ/BknsVuZM+TiljwqGtrD0srufseUoHu89z5Zy
 B9vIsYQ6+OhLLthZXlwg0U6/H2FsXn9Fsq0g/DLuoFxAs8R6HWuMtU6O5Ss32iwmSHhNMTn
 8QChzsiIHvoJLoeSnUlNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dMrOdCxlzLU=:gyzdDk8yRNLgMLyznqO5J5
 2u4nv6+y1voA0toC7pcEB0shGPEY7bcFHPBhCb9lL06AVSNCgfnX/Ah5gZaJqHB2ppweEtb66
 KhZz/UQrBkiQEQ2jEBVlVkhSE1Y6Nn9opIr7E80c1v6lASPoK2kWw48cC5Q/9xj8pJazIstgC
 ra8kBoWhD4lHUSqZtj5CkD5Dx8nQ5olWf6z7ddi/7AjsWy/9RT+LExYKyhDI7oXhgHt8iJtEA
 zUrq40Ye2C7gZwROwgBqeiu6uABIYDcu2P03FXLPNsL/rdBYLGTd3VYm713gQSlo8qU/plOX6
 yQiWIY2R9PRItx+72ib11XgMkxu8lEll/ey2+ZW6vHD+QotiQOWAfddDBao7L/7EOsGF/myUZ
 AtlAJIE5esPdGU03yUQC6rWrDl9TPTs8vc5D9UZb9GGWN9B4llvED1sb7cKGW3NHNEeUtg9Kw
 ASzXZnF4Jxhm33PyYjXsvfoGlBj5P19yAo9+le0pjF/OUcBhbpIBHlkp/1yFDaA7W1og7g2k7
 p8Dysp5TKkcYN04Js4i7V45sC9fb3cQ+SBDySBUiCqLjox+6onOF2qUn9LKPdla9zlA6FOMPr
 vdOPj55nP30K0XPCKFlwu8Pj8VsQbajs+vSIrnlJuGEghxQPIJs/nhqA4H3miLQU974BluVEx
 LZXFES/9HCeUpodhbq5Lt8npFg4eIKAgLYLvwVLSCRhJLICfwdVDhuzT3VBpnUtpUBSV82bkB
 XF9b6cLO2/SCNuZDk3kX16LJBS3II6eYoOvjnH59rF8+MFAUOLMt12qtgn7vJtDcvVvFXibIn
 5iyJ7OiXAUxDVksg7wwQVYTYaSQU9c8G6Ej9fbvqgRyVVUph+g=
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, Arnd Bergmann <arnd@arndb.de>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older compilers warn about initializers with incorrect curly
braces:

drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c: In function 'sun6i_dsi_encoder_enable':
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:720:8: error: missing braces around initializer [-Werror=missing-braces]
  union phy_configure_opts opts = { 0 };
        ^
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:720:8: error: (near initialization for 'opts.mipi_dphy') [-Werror=missing-braces]

Use the GNU empty initializer extension to avoid this.

Fixes: bb3b6fcb6849 ("sun6i: dsi: Convert to generic phy handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index f6c67dd87a05..aa67cb037e9d 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -718,7 +718,7 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
 	struct mipi_dsi_device *device = dsi->device;
-	union phy_configure_opts opts = { 0 };
+	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
 	u16 delay;
 	int err;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
