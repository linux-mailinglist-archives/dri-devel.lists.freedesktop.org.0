Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A791C2F8CE4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABCE6E570;
	Sat, 16 Jan 2021 10:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D41A6E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 12:57:32 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 76F755807B7;
 Fri, 15 Jan 2021 07:57:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Jan 2021 07:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=6gYzmOivzp7MS
 xyXbD8sgU2sHJpnQmpMn5WcWney0Ao=; b=jzSt1Dy/urI2hMQqW3avjNzNh7GBQ
 r+jj5TKNI6vEt8KESUl3p/YvcQbgVbk5XWTDMikgN2ISdsMFiNvhXP5hPb6DfkjP
 Hjf2rJ8KIgq43I+X48Eh/1dVJd8/5JdxcI4hdPzMrAKfUxYTgay5dONmMoh++LYE
 CR8VsxqLXqSvJ6n7kpPTC2jJzwo1t6qioUG8uJl1d1redxvRq4wI7op3zgJY9Apv
 H0UZzIquD37ag+YtImOiD2abKyzwfBElEgxFigw2HXp+bM3xyymUCkCb+cvIpA2b
 jZS3JWrRJkQ/XJolCuF/1K3eDUYwNVrKgmCL8Ms/TIsBPavZaWcOl3eHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=6gYzmOivzp7MSxyXbD8sgU2sHJpnQmpMn5WcWney0Ao=; b=nMp5c2lT
 9YBD3JdPKXloIsmo3uorsMLM6xh92SmPN5MvldK812btFd88cHE2nxlVH5U9sMl0
 Ne1FNGc6/kzWtYdLclJXsB/aZzxuKhAUHAf0fBaH/mxBBJEWbR6Vl8oRiZFtBZCw
 mCzJawWygjU605CPAM2tWZm0W2BE53WZKDk3qNwEFg+nZHcV7I/MbfZrsO1xx0GI
 wgghzrkb/xxK4EMn0tKK/cL4zsWZqpBIWY7rxBJcyZ4fYh1gHJfxgLD0zvE+iUxo
 HPkf4dUavbGTgwTtH5znVp7smaccxS3AUtguk8aJF9LOQiZyRE7xjhZPcVlsgaz3
 6bAZJKO4ZPfBrA==
X-ME-Sender: <xms:OpEBYLyQ-cVnHmxLL8WNw2d6RcUCTSiD7gQ9DewPRd_O2sipdBn9Zw>
 <xme:OpEBYIfPGyluobjZrMxdCD9s5VJiekbv6ZepjXUNjSp-hMEXlY7yz6tqlySJMaV8H
 NvcLf0RUvXqdJ--3KE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OpEBYIsuKf9XKeEQ-tDN3OpYkDdt3zuBFNYXDiiwu4n9nsmlfXr3iQ>
 <xmx:OpEBYFDym7RdhjdQWZiKK5K3DvwBriOIdPytx5EvQkEeuBWcixiTPg>
 <xmx:OpEBYIGfVaaKpBsCNn2ROacJIBndtR2ksLIqy0qr3xCAm3iWZl0E2w>
 <xmx:O5EBYDSvQifVcCHcEBlAwHR5lBS4sCGP8FY50qM5IrlZWq46kgk-6A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B0BE108005F;
 Fri, 15 Jan 2021 07:57:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 09/10] drm/atomic: Pass the full state to planes atomic
 disable and update
Date: Fri, 15 Jan 2021 13:57:01 +0100
Message-Id: <20210115125703.1315064-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115125703.1315064-1-maxime@cerno.tech>
References: <20210115125703.1315064-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Edmund Dea <edmund.j.dea@intel.com>, virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Dave Airlie <airlied@redhat.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Philippe Cornu <philippe.cornu@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current atomic helpers have either their object state being passed as
an argument or the full atomic state.

The former is the pattern that was done at first, before switching to the
latter for new hooks or when it was needed.

Let's start convert all the remaining helpers to provide a consistent
interface, starting with the planes atomic_update and atomic_disable.

The conversion was done using the coccinelle script below, built tested on
all the drivers.

@@
identifier plane, plane_state;
symbol state;
@@

 struct drm_plane_helper_funcs {
 	...
	void (*atomic_update)(struct drm_plane *plane,
-			      struct drm_plane_state *plane_state);
+			      struct drm_atomic_state *state);
 	...
 }

@@
identifier plane, plane_state;
symbol state;
@@

 struct drm_plane_helper_funcs {
	...
	void (*atomic_disable)(struct drm_plane *plane,
-			       struct drm_plane_state *plane_state);
+			       struct drm_atomic_state *state);
	...
 }

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

(
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_update = func,
	...,
 };
|
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_disable = func,
	...,
 };
)

@@
struct drm_plane_helper_funcs *FUNCS;
identifier f;
identifier crtc_state;
identifier plane, plane_state, state;
expression e;
@@

 f(struct drm_crtc_state *crtc_state)
 {
 	...
 	struct drm_atomic_state *state = e;
 	<+...
(
-	FUNCS->atomic_disable(plane, plane_state)
+	FUNCS->atomic_disable(plane, state)
|
-	FUNCS->atomic_update(plane, plane_state)
+	FUNCS->atomic_update(plane, state)
)
 	...+>
 }

@@
identifier plane_atomic_func.func;
identifier plane;
symbol state;
@@

 func(struct drm_plane *plane,
-    struct drm_plane_state *state)
+    struct drm_plane_state *old_plane_state)
 {
	<...
-	state
+	old_plane_state
	...>
 }

@ ignores_old_state @
identifier plane_atomic_func.func;
identifier plane, old_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
	... when != old_state
 }

@ adds_old_state depends on plane_atomic_func && !ignores_old_state @
identifier plane_atomic_func.func;
identifier plane, plane_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	...
 }

@ depends on plane_atomic_func @
identifier plane_atomic_func.func;
identifier plane, plane_state;
@@

 func(struct drm_plane *plane,
-     struct drm_plane_state *plane_state
+     struct drm_atomic_state *state
     )
 { ... }

@ include depends on adds_old_state @
@@

 #include <drm/drm_atomic.h>

@ no_include depends on !include && adds_old_state @
@@

+ #include <drm/drm_atomic.h>
  #include <drm/...>

@@
identifier plane_atomic_func.func;
identifier plane, state;
identifier plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
 	...
 	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	<+...
-	plane_state->state
+	state
 	...+>
 }

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c             |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  2 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  6 ++++--
 drivers/gpu/drm/armada/armada_overlay.c       |  8 ++++++--
 drivers/gpu/drm/armada/armada_plane.c         |  8 ++++++--
 drivers/gpu/drm/ast/ast_mode.c                | 12 +++++++----
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
 drivers/gpu/drm/drm_atomic_helper.c           |  8 ++++----
 drivers/gpu/drm/drm_simple_kms_helper.c       |  4 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  6 ++++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  4 ++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  4 ++--
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  6 ++++--
 drivers/gpu/drm/imx/ipuv3-plane.c             |  6 ++++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  4 ++--
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |  4 ++--
 drivers/gpu/drm/kmb/kmb_plane.c               |  8 +++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  8 ++++----
 drivers/gpu/drm/meson/meson_overlay.c         |  4 ++--
 drivers/gpu/drm/meson/meson_plane.c           |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  6 ++++--
 drivers/gpu/drm/omapdrm/omap_plane.c          |  4 ++--
 drivers/gpu/drm/qxl/qxl_display.c             | 12 +++++++----
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  4 +++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 12 +++++++----
 drivers/gpu/drm/sti/sti_cursor.c              |  6 ++++--
 drivers/gpu/drm/sti/sti_gdp.c                 |  8 ++++++--
 drivers/gpu/drm/sti/sti_hqvdp.c               |  8 ++++++--
 drivers/gpu/drm/stm/ltdc.c                    |  6 ++++--
 drivers/gpu/drm/sun4i/sun4i_layer.c           |  7 +++++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  8 ++++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  8 ++++++--
 drivers/gpu/drm/tegra/dc.c                    | 14 ++++++++-----
 drivers/gpu/drm/tegra/hub.c                   |  8 +++++---
 drivers/gpu/drm/tidss/tidss_plane.c           |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         | 14 +++++++++----
 drivers/gpu/drm/vc4/vc4_plane.c               |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  8 ++++++--
 drivers/gpu/drm/vkms/vkms_plane.c             |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  7 +++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +++-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            | 20 ++++++++-----------
 drivers/gpu/drm/zte/zx_plane.c                |  8 +++++---
 include/drm/drm_modeset_helper_vtables.h      |  4 ++--
 58 files changed, 211 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 8907442f473d..f29ab08550e0 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -145,7 +145,7 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 };
 
 static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *state)
+					struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = plane->state;
 	struct arcpgu_drm_private *arcpgu;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 4cc4800f0ae5..2de20f25f7e1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -118,7 +118,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
  */
 static void
 komeda_plane_atomic_update(struct drm_plane *plane,
-			   struct drm_plane_state *old_state)
+			   struct drm_atomic_state *state)
 {
 }
 
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3f050a52e07a..2500bf189420 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -260,7 +260,7 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void hdlcd_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = plane->state;
 	struct drm_framebuffer *fb = new_plane_state->fb;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 646b27a42452..1cb207bb8dcd 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -791,8 +791,10 @@ static void malidp_de_set_plane_afbc(struct drm_plane *plane)
 }
 
 static void malidp_de_plane_update(struct drm_plane *plane,
-				   struct drm_plane_state *old_state)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct malidp_plane *mp;
 	struct malidp_plane_state *ms = to_malidp_plane_state(plane->state);
 	struct drm_plane_state *new_state = plane->state;
@@ -909,7 +911,7 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 }
 
 static void malidp_de_plane_disable(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_atomic_state *state)
 {
 	struct malidp_plane *mp = to_malidp_plane(plane);
 
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index f5e75c96b476..393e4ea841f9 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -66,8 +66,10 @@ static inline u32 armada_csc(struct drm_plane_state *state)
 
 /* === Plane support === */
 static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
-	struct drm_plane_state *old_state)
+	struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
@@ -214,8 +216,10 @@ static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void armada_drm_overlay_plane_atomic_disable(struct drm_plane *plane,
-	struct drm_plane_state *old_state)
+	struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	unsigned int idx = 0;
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 3be7b3cfd251..31d312d7ceef 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -161,8 +161,10 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void armada_drm_primary_plane_atomic_update(struct drm_plane *plane,
-	struct drm_plane_state *old_state)
+	struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
@@ -248,8 +250,10 @@ static void armada_drm_primary_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void armada_drm_primary_plane_atomic_disable(struct drm_plane *plane,
-	struct drm_plane_state *old_state)
+	struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	unsigned int idx = 0;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 31c82a1fe0f6..d83933b54e91 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -568,8 +568,10 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void
 ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_device *dev = plane->dev;
 	struct ast_private *ast = to_ast_private(dev);
 	struct drm_plane_state *new_state = plane->state;
@@ -600,7 +602,7 @@ ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 static void
 ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct ast_private *ast = to_ast_private(plane->dev);
 
@@ -686,8 +688,10 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
@@ -707,7 +711,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 static void
 ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct ast_private *ast = to_ast_private(plane->dev);
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index cff52098e087..2c6d71faa268 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -712,7 +712,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 }
 
 static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
-					     struct drm_plane_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 
@@ -731,7 +731,7 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 }
 
 static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
-					    struct drm_plane_state *old_s)
+					    struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_s = p->state;
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
@@ -743,7 +743,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 		return;
 
 	if (!hstate->base.visible) {
-		atmel_hlcdc_plane_atomic_disable(p, old_s);
+		atmel_hlcdc_plane_atomic_disable(p, state);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 037cf3387a11..8d49be8af923 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2571,9 +2571,9 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 			    no_disable)
 				continue;
 
-			funcs->atomic_disable(plane, old_plane_state);
+			funcs->atomic_disable(plane, old_state);
 		} else if (new_plane_state->crtc || disabling) {
-			funcs->atomic_update(plane, old_plane_state);
+			funcs->atomic_update(plane, old_state);
 		}
 	}
 
@@ -2645,10 +2645,10 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 
 		if (drm_atomic_plane_disabling(old_plane_state, new_plane_state) &&
 		    plane_funcs->atomic_disable)
-			plane_funcs->atomic_disable(plane, old_plane_state);
+			plane_funcs->atomic_disable(plane, old_state);
 		else if (new_plane_state->crtc ||
 			 drm_atomic_plane_disabling(old_plane_state, new_plane_state))
-			plane_funcs->atomic_update(plane, old_plane_state);
+			plane_funcs->atomic_update(plane, old_state);
 	}
 
 	if (crtc_funcs && crtc_funcs->atomic_flush)
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index b8decdafccd7..bbd284d62a08 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -196,8 +196,10 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void drm_simple_kms_plane_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *old_pstate)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(state,
+									    plane);
 	struct drm_simple_display_pipe *pipe;
 
 	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 673f8a1d9010..c0f733e6ed9e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -252,7 +252,7 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void exynos_plane_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(new_state->crtc);
@@ -266,8 +266,10 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(old_state->crtc);
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 4272e121a185..d9efa6d1b2d4 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -60,7 +60,7 @@ static int fsl_dcu_drm_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
-					     struct drm_plane_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
 	unsigned int value;
@@ -76,7 +76,7 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
-					    struct drm_plane_state *old_state)
+					    struct drm_atomic_state *state)
 
 {
 	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index a4b54e841c76..4f643fbc68fb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -99,7 +99,7 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void hibmc_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	u32 reg;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index ab85c238cec5..a63cd1b95939 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -805,7 +805,7 @@ static int ade_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void ade_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct kirin_plane *kplane = to_kirin_plane(plane);
@@ -818,7 +818,7 @@ static void ade_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void ade_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct kirin_plane *kplane = to_kirin_plane(plane);
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 06ecfff8d3c3..d6bc9fb71756 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -264,8 +264,10 @@ static bool dcss_plane_needs_setup(struct drm_plane_state *state,
 }
 
 static void dcss_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
@@ -346,7 +348,7 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void dcss_plane_atomic_disable(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index dfcae066b389..c546ada188ec 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -501,7 +501,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void ipu_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
 
@@ -546,8 +546,10 @@ static void ipu_calculate_bursts(u32 width, u32 cpp, u32 stride,
 }
 
 static void ipu_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct ipu_plane_state *ipu_state = to_ipu_plane_state(new_state);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index add4b3ce3c6a..db23ccebdbe3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -441,7 +441,7 @@ void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane)
 }
 
 static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
-					     struct drm_plane_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 
@@ -539,7 +539,7 @@ static void ingenic_drm_update_palette(struct ingenic_drm *priv,
 }
 
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
-					    struct drm_plane_state *oldstate)
+					    struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_plane_state *newstate = plane->state;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 58325c4cffa7..5aaf624fa019 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -282,7 +282,7 @@ static inline bool osd_changed(struct drm_plane_state *state,
 }
 
 static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
-					    struct drm_plane_state *oldstate)
+					    struct drm_atomic_state *state)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 	struct drm_plane_state *newstate = plane->state;
@@ -593,7 +593,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void ingenic_ipu_plane_atomic_disable(struct drm_plane *plane,
-					     struct drm_plane_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 05e1a7a2c075..f837962474b1 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -110,7 +110,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void kmb_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *state)
+				     struct drm_atomic_state *state)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	int plane_id = kmb_plane->id;
@@ -278,8 +278,10 @@ static void config_csc(struct kmb_drm_private *kmb, int plane_id)
 }
 
 static void kmb_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct drm_plane_state *new_plane_state = plane->state;
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *kmb;
@@ -294,7 +296,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	int num_planes;
 	static dma_addr_t addr[MAX_SUB_PLANES];
 
-	if (!plane || !new_plane_state || !state)
+	if (!plane || !new_plane_state || !old_plane_state)
 		return;
 
 	fb = new_plane_state->fb;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index b665bd498a4a..26b61085826b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -506,7 +506,7 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 }
 
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
-			       struct drm_plane_state *new_state)
+			       struct drm_atomic_state *state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	const struct drm_plane_helper_funcs *plane_helper_funcs =
@@ -515,7 +515,7 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 	if (!mtk_crtc->enabled)
 		return;
 
-	plane_helper_funcs->atomic_update(plane, new_state);
+	plane_helper_funcs->atomic_update(plane, state);
 	mtk_drm_crtc_hw_config(mtk_crtc);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index a2b4677a451c..de0479cd1e72 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -22,6 +22,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
-			       struct drm_plane_state *plane_state);
+			       struct drm_atomic_state *plane_state);
 
 #endif /* MTK_DRM_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 6ae24058ec35..7f876b6c9615 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -128,7 +128,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	swap(plane->state->fb, new_state->fb);
 	new_plane_state->pending.async_dirty = true;
 
-	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
+	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
 }
 
 static const struct drm_plane_funcs mtk_plane_funcs = {
@@ -173,7 +173,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void mtk_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
@@ -183,7 +183,7 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static void mtk_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
@@ -198,7 +198,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	if (!new_state->visible) {
-		mtk_plane_atomic_disable(plane, old_state);
+		mtk_plane_atomic_disable(plane, state);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 902b5711a2b8..4b12a53e27c8 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -468,7 +468,7 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 }
 
 static void meson_overlay_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct meson_overlay *meson_overlay = to_meson_overlay(plane);
 	struct drm_plane_state *new_state = plane->state;
@@ -721,7 +721,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 }
 
 static void meson_overlay_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct meson_overlay *meson_overlay = to_meson_overlay(plane);
 	struct meson_drm *priv = meson_overlay->priv;
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index c2df7eca6808..78bd3e9be3bf 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -130,7 +130,7 @@ static u32 meson_g12a_afbcd_line_stride(struct meson_drm *priv)
 }
 
 static void meson_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct meson_plane *meson_plane = to_meson_plane(plane);
 	struct drm_plane_state *new_state = plane->state;
@@ -395,7 +395,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void meson_plane_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct meson_plane *meson_plane = to_meson_plane(plane);
 	struct meson_drm *priv = meson_plane->priv;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 56eb22554197..2830af65e705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -576,7 +576,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	 * of those planes explicitly here prior to plane flush.
 	 */
 	drm_atomic_crtc_for_each_plane(plane, crtc)
-		dpu_plane_restore(plane);
+		dpu_plane_restore(plane, state);
 
 	/* update performance setting before crtc kickoff */
 	dpu_core_perf_crtc_update(crtc, 1, false);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 82a69d2cf20d..31071f9e21d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1241,7 +1241,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
-				struct drm_plane_state *old_state)
+				struct drm_atomic_state *state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *new_state = plane->state;
@@ -1257,7 +1257,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-void dpu_plane_restore(struct drm_plane *plane)
+void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	struct dpu_plane *pdpu;
 
@@ -1270,8 +1270,7 @@ void dpu_plane_restore(struct drm_plane *plane)
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
-	/* last plane state is same as current state */
-	dpu_plane_atomic_update(plane, plane->state);
+	dpu_plane_atomic_update(plane, state);
 }
 
 static void dpu_plane_destroy(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 13a983fa8213..03b6365a750c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -88,7 +88,7 @@ void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
  * dpu_plane_restore - restore hw state if previously power collapsed
  * @plane: Pointer to drm plane structure
  */
-void dpu_plane_restore(struct drm_plane *plane);
+void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state);
 
 /**
  * dpu_plane_flush - final plane operations before commit flush
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b4c74c1047ba..5d78bce980a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -112,7 +112,7 @@ static int mdp4_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void mdp4_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	int ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index da1cc66f9f49..4dc82a0c12e9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -426,7 +426,7 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void mdp5_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 6b19a84340e3..980b567043ba 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -419,7 +419,7 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
-					      struct drm_plane_state *old_pstate)
+					      struct drm_atomic_state *state)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	dma_addr_t paddr;
@@ -430,8 +430,10 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 }
 
 static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
-					      struct drm_plane_state *old_pstate)
+					      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(state,
+									    plane);
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_plane_state *new_pstate = plane->state;
 	dma_addr_t paddr;
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 85b4753732c4..cd8cf7c786b5 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -40,7 +40,7 @@ static void omap_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static void omap_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
@@ -87,7 +87,7 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct omap_drm_private *priv = plane->dev->dev_private;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 66b704f7c10a..517e448c835c 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -526,7 +526,7 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 }
 
 static void qxl_primary_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct qxl_device *qdev = to_qxl(plane->dev);
@@ -558,8 +558,10 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 }
 
 static void qxl_primary_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct qxl_device *qdev = to_qxl(plane->dev);
 
 	if (old_state->fb) {
@@ -573,8 +575,10 @@ static void qxl_primary_atomic_disable(struct drm_plane *plane,
 }
 
 static void qxl_cursor_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct drm_device *dev = plane->dev;
 	struct qxl_device *qdev = to_qxl(dev);
@@ -691,7 +695,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 }
 
 static void qxl_cursor_atomic_disable(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct qxl_release *release;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index db23e1feedae..20a86bd6dade 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -618,8 +618,10 @@ static int rcar_du_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void rcar_du_plane_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct rcar_du_plane *rplane = to_rcar_plane(plane);
 	struct rcar_du_plane_state *old_rstate;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 09c75f123e89..c171a05fe983 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -276,8 +276,10 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
 	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 3a389cd756ff..e0e2510bdaac 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -858,8 +858,10 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void vop_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct vop_win *vop_win = to_vop_win(plane);
 	struct vop *vop = to_vop(old_state->crtc);
 
@@ -874,8 +876,10 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static void vop_plane_atomic_update(struct drm_plane *plane,
-		struct drm_plane_state *old_state)
+		struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct drm_crtc *crtc = new_state->crtc;
 	struct vop_win *vop_win = to_vop_win(plane);
@@ -909,7 +913,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	if (!new_state->visible) {
-		vop_plane_atomic_disable(plane, old_state);
+		vop_plane_atomic_disable(plane, state);
 		return;
 	}
 
@@ -1077,7 +1081,7 @@ static void vop_plane_atomic_async_update(struct drm_plane *plane,
 	swap(plane->state->fb, new_state->fb);
 
 	if (vop->is_enabled) {
-		vop_plane_atomic_update(plane, plane->state);
+		vop_plane_atomic_update(plane, state);
 		spin_lock(&vop->reg_lock);
 		vop_cfg_done(vop);
 		spin_unlock(&vop->reg_lock);
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 73e32220a9c4..7172870fa6af 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -256,7 +256,7 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 }
 
 static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
-				     struct drm_plane_state *oldstate)
+				     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
@@ -310,8 +310,10 @@ static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 }
 
 static void sti_cursor_atomic_disable(struct drm_plane *drm_plane,
-				      struct drm_plane_state *oldstate)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 
 	if (!oldstate->crtc) {
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index ecb3d8fb50b1..000329036ae6 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -699,8 +699,10 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 }
 
 static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
-				  struct drm_plane_state *oldstate)
+				  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  drm_plane);
 	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
@@ -864,8 +866,10 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 }
 
 static void sti_gdp_atomic_disable(struct drm_plane *drm_plane,
-				   struct drm_plane_state *oldstate)
+				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 
 	if (!oldstate->crtc) {
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 9eace410bb70..fad813eae7cc 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1109,8 +1109,10 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 }
 
 static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
-				    struct drm_plane_state *oldstate)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  drm_plane);
 	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
@@ -1240,8 +1242,10 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 }
 
 static void sti_hqvdp_atomic_disable(struct drm_plane *drm_plane,
-				     struct drm_plane_state *oldstate)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  drm_plane);
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 
 	if (!oldstate->crtc) {
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 911c56a1f8ee..cb6b839d8356 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -746,7 +746,7 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void ltdc_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *oldstate)
+				     struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = plane_to_ltdc(plane);
 	struct drm_plane_state *newstate = plane->state;
@@ -860,8 +860,10 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void ltdc_plane_atomic_disable(struct drm_plane *plane,
-				      struct drm_plane_state *oldstate)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
+									  plane);
 	struct ltdc_device *ldev = plane_to_ltdc(plane);
 	u32 lofs = plane->index * LAY_OFS;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index fd7eda2c105d..3e985abdfef8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -6,6 +6,7 @@
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  */
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -63,8 +64,10 @@ static void sun4i_backend_layer_destroy_state(struct drm_plane *plane,
 }
 
 static void sun4i_backend_layer_atomic_disable(struct drm_plane *plane,
-					       struct drm_plane_state *old_state)
+					       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct sun4i_layer_state *layer_state = state_to_sun4i_layer_state(old_state);
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 	struct sun4i_backend *backend = layer->backend;
@@ -81,7 +84,7 @@ static void sun4i_backend_layer_atomic_disable(struct drm_plane *plane,
 }
 
 static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
-					      struct drm_plane_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct sun4i_layer_state *layer_state = state_to_sun4i_layer_state(new_state);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index c0da3ba9fbdf..fbd931b1fbb8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -268,8 +268,10 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 }
 
 static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
-					  struct drm_plane_state *old_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
@@ -279,8 +281,10 @@ static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
 }
 
 static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
-					 struct drm_plane_state *old_state)
+					 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 5cc39eeb3cdf..297726c3bc79 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -371,8 +371,10 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 }
 
 static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
-					  struct drm_plane_state *old_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
@@ -382,8 +384,10 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
-					 struct drm_plane_state *old_state)
+					 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4eafd45baa60..c393db21c21a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -691,8 +691,10 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void tegra_plane_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct tegra_plane *p = to_tegra_plane(plane);
 	u32 value;
 
@@ -706,7 +708,7 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static void tegra_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
@@ -720,7 +722,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	if (!new_state->visible)
-		return tegra_plane_atomic_disable(plane, old_state);
+		return tegra_plane_atomic_disable(plane, state);
 
 	memset(&window, 0, sizeof(window));
 	window.src.x = new_state->src.x1 >> 16;
@@ -866,7 +868,7 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 }
 
 static void tegra_cursor_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
@@ -929,8 +931,10 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 }
 
 static void tegra_cursor_atomic_disable(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct tegra_dc *dc;
 	u32 value;
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 1d31086e1cc9..b264c9729d94 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -388,8 +388,10 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
-					      struct drm_plane_state *old_state)
+					      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc *dc;
 	u32 value;
@@ -425,7 +427,7 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
-					     struct drm_plane_state *old_state)
+					     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
@@ -442,7 +444,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	if (!new_state->visible) {
-		tegra_shared_plane_atomic_disable(plane, old_state);
+		tegra_shared_plane_atomic_disable(plane, state);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 90554d0be2d0..b0a4aff56095 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -105,7 +105,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void tidss_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
@@ -137,7 +137,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void tidss_plane_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 1d134a6d9fc6..c7c27f577432 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -76,7 +76,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void tilcdc_plane_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 5df1184ce1af..f796f2dff9c7 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -272,7 +272,7 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 }
 
 static void vbox_primary_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct drm_crtc *crtc = new_state->crtc;
@@ -317,8 +317,10 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
 }
 
 static void vbox_primary_atomic_disable(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
+					struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_crtc *crtc = old_state->crtc;
 
 	/* vbox_do_modeset checks plane->state->fb and will disable if NULL */
@@ -380,8 +382,10 @@ static void copy_cursor_image(u8 *src, u8 *dst, u32 width, u32 height,
 }
 
 static void vbox_cursor_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct vbox_private *vbox =
 		container_of(plane->dev, struct vbox_private, ddev);
@@ -440,8 +444,10 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 }
 
 static void vbox_cursor_atomic_disable(struct drm_plane *plane,
-				       struct drm_plane_state *old_state)
+				       struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct vbox_private *vbox =
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(old_state->crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index aba275863664..944ffbf3ea62 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1060,7 +1060,7 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void vc4_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
 	/* No contents here.  Since we don't know where in the CRTC's
 	 * dlist we should be stored, our dlist is uploaded to the
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 9419aa611af9..4e1b17548007 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -130,8 +130,10 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 }
 
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
-					    struct drm_plane_state *old_state)
+					    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
@@ -242,8 +244,10 @@ static void virtio_gpu_cursor_cleanup_fb(struct drm_plane *plane,
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
-					   struct drm_plane_state *old_state)
+					   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index a8a675b6a3f7..d0056fab01eb 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -92,7 +92,7 @@ static const struct drm_plane_funcs vkms_plane_funcs = {
 };
 
 static void vkms_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct vkms_plane_state *vkms_plane_state;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 173b9d211708..7fbed2826464 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -374,9 +374,12 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 
 void
 vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
-				  struct drm_plane_state *old_state)
+				  struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = plane->state;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
 	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 3d96ce9365bc..4c7687bdeb1c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -460,7 +460,7 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_atomic_state *state);
 void vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
-				       struct drm_plane_state *old_state);
+				       struct drm_atomic_state *state);
 int vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state);
 void vmw_du_plane_cleanup_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 47b1f265e82e..c915774d3b5a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -283,8 +283,10 @@ drm_connector_helper_funcs vmw_ldu_connector_helper_funcs = {
 
 static void
 vmw_ldu_primary_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct vmw_private *dev_priv;
 	struct vmw_legacy_display_unit *ldu;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index daf10cca4096..57e6d6972886 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -728,8 +728,10 @@ static int vmw_sou_plane_update_surface(struct vmw_private *dev_priv,
 
 static void
 vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_pending_vblank_event *event = NULL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 6871824010e1..66179599791b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1575,8 +1575,10 @@ static int vmw_stdu_plane_update_surface(struct vmw_private *dev_priv,
  */
 static void
 vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
+				     struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index e278680b7d5a..39f9e6e76064 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1166,8 +1166,10 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
 
 static void
 zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
-				 struct drm_plane_state *old_state)
+				 struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
 
 	if (!old_state->fb)
@@ -1178,8 +1180,10 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 
 static void
 zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
-				struct drm_plane_state *old_state)
+				struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+								           plane);
 	struct drm_plane_state *new_state = plane->state;
 	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
 	bool format_changed = false;
@@ -1485,20 +1489,12 @@ static void
 zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
 				struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
-									      crtc);
 	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-	struct drm_plane_state *old_plane_state;
 
 	/*
-	 * Disable the plane if active. The old plane state can be NULL in the
-	 * .shutdown() path if the plane is already disabled, skip
-	 * zynqmp_disp_plane_atomic_disable() in that case.
+	 * Disable the plane if active.
 	 */
-	old_plane_state = drm_atomic_get_old_plane_state(old_crtc_state->state,
-							 crtc->primary);
-	if (old_plane_state)
-		zynqmp_disp_plane_atomic_disable(crtc->primary, old_plane_state);
+	zynqmp_disp_plane_atomic_disable(crtc->primary, state);
 
 	zynqmp_disp_disable(disp);
 
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 2c195bd1a231..4024abf12b3a 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -181,7 +181,7 @@ static void zx_vl_rsz_setup(struct zx_plane *zplane, uint32_t format,
 }
 
 static void zx_vl_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct zx_plane *zplane = to_zx_plane(plane);
 	struct drm_plane_state *new_state = plane->state;
@@ -259,8 +259,10 @@ static void zx_vl_plane_atomic_update(struct drm_plane *plane,
 }
 
 static void zx_plane_atomic_disable(struct drm_plane *plane,
-				    struct drm_plane_state *old_state)
+				    struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct zx_plane *zplane = to_zx_plane(plane);
 	void __iomem *hbsc = zplane->hbsc;
 
@@ -351,7 +353,7 @@ static void zx_gl_rsz_setup(struct zx_plane *zplane, u32 src_w, u32 src_h,
 }
 
 static void zx_gl_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state = plane->state;
 	struct zx_plane *zplane = to_zx_plane(plane);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 4f653165f518..76b46a5fdf45 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1256,7 +1256,7 @@ struct drm_plane_helper_funcs {
 	 * transitional plane helpers, but it is optional.
 	 */
 	void (*atomic_update)(struct drm_plane *plane,
-			      struct drm_plane_state *old_state);
+			      struct drm_atomic_state *state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -1280,7 +1280,7 @@ struct drm_plane_helper_funcs {
 	 * transitional plane helpers, but it is optional.
 	 */
 	void (*atomic_disable)(struct drm_plane *plane,
-			       struct drm_plane_state *old_state);
+			       struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_async_check:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
