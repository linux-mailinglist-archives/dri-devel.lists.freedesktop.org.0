Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7911AE1A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00766E391;
	Fri, 17 Apr 2020 15:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14096E169
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:56:51 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MmU9X-1iyh6f2Ctl-00iQqH; Fri, 17 Apr 2020 17:56:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 4/8] drm/rcar: stop using 'imply' for dependencies
Date: Fri, 17 Apr 2020 17:55:49 +0200
Message-Id: <20200417155553.675905-5-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uo1PKQe5aWNhyhZcFZ9CjgTtBalbZwo94DNn1R7d79M+ZtxL4DH
 DxKpYGp1fptO9Fs4eaFEDRkz5AjVdYui7SxSvwLwJF4Q9shlrUYKfku/gl5u66LWU+BPmXw
 m3dDTjtsoJEuMrowemsBhNyK+S3xKKJP7VpWWzTlEKcaq+VtY6O+sntw1CeLTzsWIrIj1g9
 37OJQujT/P+UU3WH0C1cg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GEpQHVWHcgc=:1g5dy8zUp1/LQRhBEqoGpG
 gNy5o2AjfmNTg/cuJVYhiswPZ+aEvQX4Ihc9fqKE/q4j4Z1fAL0XRhDmLGOonFpnw6BYRe0Yz
 Yn2CEF9hPyze2jzlp0e3vKF++WoAFCYY+gOqN9mVOhTJ06W7q4Lu9sUY9VSLoYpze8DRN24tf
 fBtMmjNOO6KvWelk7ueoJA4/87xZjNJAfFb5xLa7e/rpznyQcwnOUQl+XhgNdZbuMlOU9p5Um
 rZXrK+oO0Dqmzae2Ht4p3X53cZbEEs8MEo6GOOUqTgouPTkbIZ35BwSrvlSXGCl5g6VeYBkZm
 ClfdayJsYpqXMVoD7Cf+8z1TCb5toU023sY2BLsWfxVhGikBl/T7tVKs5Ivo3CNeHfaNwdlwp
 xmQzkAyDdToLZRee/Nx1r8O//2oYEtAjb2AgOQzu1eCuocA1KJ0cyvBuv5qf30/xCCg0OdC/X
 CFE/aadn0Fq0o5Yh9APTuMhEz96YWf2YfnF5s12q1dy1d+phbHgSQuyprHOJF7PzhIMKa5jSV
 RtEzizaYfiJ93ZN8aJd5HumwDJczqso8goqJ2rbXPjaNO/SXLLX9g0o7knTdJavHmeMihpoWI
 cQu3qV0uCE9yXX+gDFLu/0cEwaORh4dGMaG/WfLqaOjZntvmfdKlzyjAO4TrGuGZOFmZuw01l
 hEDycmFhs79laZXuNUKp/OrflzBBI7G1o1J4/WmAIkazkIHL+2xJnLny74hgNbvbhI02QoC1z
 RZXMgnSoTx1I3wglpMTSf4kPrAwgMhvcK2b/0CpGKY6MGBoGIftj/fD8f/38iSdXvIVW6wg9/
 ZPaGliZZ32z/tutY7Xed7XyAzn0RNOPFP2x4ObJi7NpfglY/50=
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
Cc: marex@denx.de, dsd@laptop.org, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, masahiroy@kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 thellstrom@vmware.com, haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The meaning of the 'imply' keyword has changed recently, and neither the
old meaning (select the symbol if its dependencies are met) nor the new
meaning (enable it by default, but let the user set any other setting)
is what we want here.

Work around this by adding two more Kconfig options that lead to
the correct behavior: if DRM_RCAR_USE_CMM and DRM_RCAR_USE_LVDS
are enabled, that portion of the driver becomes usable, and no
configuration results in a link error.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rcar-du/Kconfig | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..d2fcec807dfa 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,8 +4,6 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
-	imply DRM_RCAR_CMM
-	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
@@ -14,13 +12,17 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
-config DRM_RCAR_CMM
-	tristate "R-Car DU Color Management Module (CMM) Support"
-	depends on DRM && OF
+config DRM_RCAR_USE_CMM
+	bool "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM_RCAR_DU
+	default DRM_RCAR_DU
 	help
 	  Enable support for R-Car Color Management Module (CMM).
 
+config DRM_RCAR_CMM
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_CMM
+
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car DU Gen3 HDMI Encoder Support"
 	depends on DRM && OF
@@ -28,15 +30,20 @@ config DRM_RCAR_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 internal HDMI encoder.
 
-config DRM_RCAR_LVDS
-	tristate "R-Car DU LVDS Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
+config DRM_RCAR_USE_LVDS
+	bool "R-Car DU LVDS Encoder Support"
+	depends on DRM_BRIDGE && OF
+	default DRM_RCAR_DU
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
+config DRM_RCAR_LVDS
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_LVDS
+
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
