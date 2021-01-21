Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2A2FFE90
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289326E9D5;
	Fri, 22 Jan 2021 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024D6E910;
 Thu, 21 Jan 2021 16:35:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 657A0580541;
 Thu, 21 Jan 2021 11:35:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Jan 2021 11:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gHewKGu1OEOPd
 mVQlXfOWsnmU4VLA/X8FACVPP6hUtg=; b=QafbK7XxRIj5Etu/2Def2Wkh7K8x6
 Whi2UqEmQo7D250VXKSXA7KDIrmMr0P9ITq2Gq8XMqmDbdyt5g9KhcKWKInIM0Ds
 yl8cuh1x+U6uNcWFEXluWePOTHAojAoOCW2tztswoRDUTCBVHkp9EFtnr2QdFr3o
 dmlbj2slwm38szOxbvPsVjYPxGa8+rDp1e+1wBnPadeRo3f0U20vmC7Z4rwOQX3F
 k+Hsgwiho9mlDoFc/a/XWa83Cm4+aZDQr3nrxxp7aoinkJVizLm4SltWC4aWrXbM
 iYUPtgDfK80BQuGuUHwBAcTRuXnsDTeDMpOhd431SvE/LCBgg9ZtAQ7Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gHewKGu1OEOPdmVQlXfOWsnmU4VLA/X8FACVPP6hUtg=; b=o4GcUGMp
 MxUM3pGXkbLl5zDHmwl6Kp8LDsN1bVk1i/UBkBA0P0KXoOq0aMCuFpepo79tUQYh
 WeX4jYYfJzswWodbNjW0S3TgRBM/L3LT4JeLVPBpFA3RbzeI1SHlXFbpXR3fbaHD
 llJhyANu70vtvbFVFBvRFmMtv4C8ZiIvSblyqrlDNp3PTttvnGW+ZOxEO3ow4s57
 qygGKEfo+SBMG7BH3EP9asnG3mSrn6Au32pHQ0Xv8lk//E/jfFJnkvJkWpgUVQbB
 gIrTg/dSHNofmOU6+5241V0SPIfPt6uUkI/t9yT6qge92v1Squcsy5vH3I+J8t8N
 4q4adRR3bbqXyA==
X-ME-Sender: <xms:bq0JYMAEZG7kFEvn6q8tQfFiJzmr6bGALPCPwYHcgOJu8WnDXbD6MA>
 <xme:bq0JYOih0AXCnLwiauT8SBkFd20GVM4WRiKWHmfpw_ZWsWihjezgxRvK-RBknaO7H
 KGpiVABrByWw9O7n68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b60JYPm3i1TIn582BlynkySknLbAI0SFKSx30m7JB-mWFUp-3GFSpg>
 <xmx:b60JYCx3NlOOcsEeWkzH0xi6wf7B5OGTlX-mWtc-4Vn43i2-lgfIcg>
 <xmx:b60JYBQKFp7NdLFnUPSn_AGK19Opr9rvFhFGWDmE4i8L64vQlYZd7Q>
 <xmx:b60JYEvLjKhezRsnVbOuc2-f1YPj1F8oOh0iFsbE3u6IWFwHrXRwYw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7525F108005F;
 Thu, 21 Jan 2021 11:35:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/11] drm: Store new plane state in a variable for
 atomic_update and disable
Date: Thu, 21 Jan 2021 17:35:32 +0100
Message-Id: <20210121163537.1466118-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121163537.1466118-1-maxime@cerno.tech>
References: <20210121163537.1466118-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, Melissa Wen <melissa.srw@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Roland Scheidegger <sroland@vmware.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to store the new plane state in a subsequent helper, let's move
the plane->state dereferences into a variable.

This was done using the following coccinelle script, plus some hand
changes for vmwgfx:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

(
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_disable = func,
	...,
 };
|
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_update = func,
	...,
 };
)

@ has_new_state_old_state @
identifier plane_atomic_func.func;
identifier plane;
identifier new_state;
symbol old_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
 	...
 	struct drm_plane_state *new_state = plane->state;
	...
 }

@ depends on !has_new_state_old_state @
identifier plane_atomic_func.func;
identifier plane;
symbol old_state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	<+...
-	plane->state
+	new_state
	...+>
 }

@ has_new_state_state @
identifier plane_atomic_func.func;
identifier plane;
identifier new_state;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *state)
 {
 	...
 	struct drm_plane_state *new_state = plane->state;
	...
 }

@ depends on !has_new_state_state @
identifier plane_atomic_func.func;
identifier plane;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct drm_plane_state *new_plane_state = plane->state;
 	<+...
-	plane->state
+	new_plane_state
	...+>
 }

@ has_new_state_old_s @
identifier plane_atomic_func.func;
identifier plane;
identifier new_state;
symbol old_s;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_s)
 {
 	...
 	struct drm_plane_state *new_state = plane->state;
	...
 }

@ depends on !has_new_state_old_s @
identifier plane_atomic_func.func;
identifier plane;
symbol old_s;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_s)
 {
+	struct drm_plane_state *new_s = plane->state;
 	<+...
-	plane->state
+	new_s
	...+>
 }

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Wrapping change suggested by Laurent in omapdrm
---
 drivers/gpu/drm/arc/arcpgu_crtc.c             |  7 ++--
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  7 ++--
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  5 ++-
 drivers/gpu/drm/kmb/kmb_plane.c               | 19 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      | 26 ++++++------
 drivers/gpu/drm/omapdrm/omap_plane.c          |  6 +--
 drivers/gpu/drm/qxl/qxl_display.c             | 20 +++++----
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  5 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  3 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c           |  3 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  5 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  5 ++-
 drivers/gpu/drm/tegra/dc.c                    | 42 ++++++++++---------
 drivers/gpu/drm/tegra/hub.c                   | 25 +++++------
 drivers/gpu/drm/vboxvideo/vbox_mode.c         | 22 +++++-----
 drivers/gpu/drm/vkms/vkms_plane.c             | 11 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 19 +++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  5 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  7 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  9 ++--
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  7 ++--
 drivers/gpu/drm/zte/zx_plane.c                | 19 +++++----
 22 files changed, 151 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 895cdd991af6..2cea17a96d5c 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -147,14 +147,15 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
+	struct drm_plane_state *new_plane_state = plane->state;
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!plane->state->crtc || !plane->state->fb)
+	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return;
 
-	arcpgu = crtc_to_arcpgu_priv(plane->state->crtc);
-	gem = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
+	arcpgu = crtc_to_arcpgu_priv(new_plane_state->crtc);
+	gem = drm_fb_cma_get_gem_obj(new_plane_state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
 }
 
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 028ec39c8484..3f050a52e07a 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -262,7 +262,8 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *state)
 {
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *new_plane_state = plane->state;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct hdlcd_drm_private *hdlcd;
 	u32 dest_h;
 	dma_addr_t scanout_start;
@@ -270,8 +271,8 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	if (!fb)
 		return;
 
-	dest_h = drm_rect_height(&plane->state->dst);
-	scanout_start = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
+	dest_h = drm_rect_height(&new_plane_state->dst);
+	scanout_start = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
 
 	hdlcd = plane->dev->dev_private;
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_LENGTH, fb->pitches[0]);
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index a32d45bcc386..cff52098e087 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -733,12 +733,13 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 					    struct drm_plane_state *old_s)
 {
+	struct drm_plane_state *new_s = p->state;
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_plane_state *hstate =
-			drm_plane_state_to_atmel_hlcdc_plane_state(p->state);
+			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
 	u32 sr;
 
-	if (!p->state->crtc || !p->state->fb)
+	if (!new_s->crtc || !new_s->fb)
 		return;
 
 	if (!hstate->base.visible) {
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9a8cf2991fb4..05e1a7a2c075 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -280,6 +280,7 @@ static void config_csc(struct kmb_drm_private *kmb, int plane_id)
 static void kmb_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
+	struct drm_plane_state *new_plane_state = plane->state;
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *kmb;
 	unsigned int width;
@@ -293,10 +294,10 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	int num_planes;
 	static dma_addr_t addr[MAX_SUB_PLANES];
 
-	if (!plane || !plane->state || !state)
+	if (!plane || !new_plane_state || !state)
 		return;
 
-	fb = plane->state->fb;
+	fb = new_plane_state->fb;
 	if (!fb)
 		return;
 	num_planes = fb->format->num_planes;
@@ -313,10 +314,10 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 	spin_unlock_irq(&kmb->irq_lock);
 
-	src_w = (plane->state->src_w >> 16);
-	src_h = plane->state->src_h >> 16;
-	crtc_x = plane->state->crtc_x;
-	crtc_y = plane->state->crtc_y;
+	src_w = (new_plane_state->src_w >> 16);
+	src_h = new_plane_state->src_h >> 16;
+	crtc_x = new_plane_state->crtc_x;
+	crtc_y = new_plane_state->crtc_y;
 
 	drm_dbg(&kmb->drm,
 		"src_w=%d src_h=%d, fb->format->format=0x%x fb->flags=0x%x\n",
@@ -333,7 +334,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
 		      (width * fb->format->cpp[0]));
 
-	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
+	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
 		      addr[Y_PLANE] + fb->offsets[0]);
 	val = get_pixel_format(fb->format->format);
@@ -345,7 +346,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
-		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
+		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state,
 							U_PLANE);
 		/* check if Cb/Cr is swapped*/
 		if (num_planes == 3 && (val & LCD_LAYER_CRCB_ORDER))
@@ -367,7 +368,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 				      ((width) * fb->format->cpp[0]));
 
 			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
-								plane->state,
+								new_plane_state,
 								V_PLANE);
 
 			/* check if Cb/Cr is swapped*/
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 37489a086ca8..cd143a34bd60 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -175,7 +175,8 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 static void mtk_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
+	struct drm_plane_state *new_state = plane->state;
+	struct mtk_plane_state *state = to_mtk_plane_state(new_state);
 
 	state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
@@ -185,9 +186,10 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 static void mtk_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
-	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
-	struct drm_crtc *crtc = plane->state->crtc;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct mtk_plane_state *state = to_mtk_plane_state(new_state);
+	struct drm_crtc *crtc = new_state->crtc;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
 	struct mtk_drm_gem_obj *mtk_gem;
 	unsigned int pitch, format;
@@ -196,7 +198,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return;
 
-	if (!plane->state->visible) {
+	if (!new_state->visible) {
 		mtk_plane_atomic_disable(plane, old_state);
 		return;
 	}
@@ -207,18 +209,18 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	pitch = fb->pitches[0];
 	format = fb->format->format;
 
-	addr += (plane->state->src.x1 >> 16) * fb->format->cpp[0];
-	addr += (plane->state->src.y1 >> 16) * pitch;
+	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
+	addr += (new_state->src.y1 >> 16) * pitch;
 
 	state->pending.enable = true;
 	state->pending.pitch = pitch;
 	state->pending.format = format;
 	state->pending.addr = addr;
-	state->pending.x = plane->state->dst.x1;
-	state->pending.y = plane->state->dst.y1;
-	state->pending.width = drm_rect_width(&plane->state->dst);
-	state->pending.height = drm_rect_height(&plane->state->dst);
-	state->pending.rotation = plane->state->rotation;
+	state->pending.x = new_state->dst.x1;
+	state->pending.y = new_state->dst.y1;
+	state->pending.width = drm_rect_width(&new_state->dst);
+	state->pending.height = drm_rect_height(&new_state->dst);
+	state->pending.rotation = new_state->rotation;
 	wmb(); /* Make sure the above parameters are set before update */
 	state->pending.dirty = true;
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 0df1d35504ad..b08880915d5e 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -88,12 +88,12 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 static void omap_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 
-	plane->state->rotation = DRM_MODE_ROTATE_0;
-	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
-			   ? 0 : omap_plane->id;
+	new_state->rotation = DRM_MODE_ROTATE_0;
+	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
 
 	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
 }
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 2985b3634ea2..66b704f7c10a 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -528,14 +528,15 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 static void qxl_primary_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct qxl_device *qdev = to_qxl(plane->dev);
-	struct qxl_bo *bo = gem_to_qxl_bo(plane->state->fb->obj[0]);
+	struct qxl_bo *bo = gem_to_qxl_bo(new_state->fb->obj[0]);
 	struct qxl_bo *primary;
 	struct drm_clip_rect norect = {
 	    .x1 = 0,
 	    .y1 = 0,
-	    .x2 = plane->state->fb->width,
-	    .y2 = plane->state->fb->height
+	    .x2 = new_state->fb->width,
+	    .y2 = new_state->fb->height
 	};
 	uint32_t dumb_shadow_offset = 0;
 
@@ -550,9 +551,9 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 
 	if (bo->is_dumb)
 		dumb_shadow_offset =
-			qdev->dumb_heads[plane->state->crtc->index].x;
+			qdev->dumb_heads[new_state->crtc->index].x;
 
-	qxl_draw_dirty_fb(qdev, plane->state->fb, bo, 0, 0, &norect, 1, 1,
+	qxl_draw_dirty_fb(qdev, new_state->fb, bo, 0, 0, &norect, 1, 1,
 			  dumb_shadow_offset);
 }
 
@@ -574,10 +575,11 @@ static void qxl_primary_atomic_disable(struct drm_plane *plane,
 static void qxl_cursor_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct drm_device *dev = plane->dev;
 	struct qxl_device *qdev = to_qxl(dev);
-	struct drm_framebuffer *fb = plane->state->fb;
-	struct qxl_crtc *qcrtc = to_qxl_crtc(plane->state->crtc);
+	struct drm_framebuffer *fb = new_state->fb;
+	struct qxl_crtc *qcrtc = to_qxl_crtc(new_state->crtc);
 	struct qxl_release *release;
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_cursor *cursor;
@@ -660,8 +662,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		cmd->type = QXL_CURSOR_MOVE;
 	}
 
-	cmd->u.position.x = plane->state->crtc_x + fb->hot_x;
-	cmd->u.position.y = plane->state->crtc_y + fb->hot_y;
+	cmd->u.position.x = new_state->crtc_x + fb->hot_x;
+	cmd->u.position.y = new_state->crtc_y + fb->hot_y;
 
 	qxl_release_unmap(qdev, release, &cmd->release_info);
 	qxl_release_fence_buffer_objects(release);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 7afe7442214b..639db6e3fbfb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -620,11 +620,12 @@ static int rcar_du_plane_atomic_check(struct drm_plane *plane,
 static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct rcar_du_plane *rplane = to_rcar_plane(plane);
 	struct rcar_du_plane_state *old_rstate;
 	struct rcar_du_plane_state *new_rstate;
 
-	if (!plane->state->visible)
+	if (!new_state->visible)
 		return;
 
 	rcar_du_plane_setup(rplane);
@@ -638,7 +639,7 @@ static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 	 * bit. We thus need to restart the group if the source changes.
 	 */
 	old_rstate = to_rcar_plane_state(old_state);
-	new_rstate = to_rcar_plane_state(plane->state);
+	new_rstate = to_rcar_plane_state(new_state);
 
 	if ((old_rstate->source == RCAR_DU_PLANE_MEMORY) !=
 	    (new_rstate->source == RCAR_DU_PLANE_MEMORY))
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index ab82fda22b70..659f6e3072ab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -279,10 +279,11 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
 	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
 
-	if (plane->state->visible)
+	if (new_state->visible)
 		rcar_du_vsp_plane_setup(rplane);
 	else if (old_state->crtc)
 		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index acfbfd4463a1..fd7eda2c105d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -83,7 +83,8 @@ static void sun4i_backend_layer_atomic_disable(struct drm_plane *plane,
 static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
 					      struct drm_plane_state *old_state)
 {
-	struct sun4i_layer_state *layer_state = state_to_sun4i_layer_state(plane->state);
+	struct drm_plane_state *new_state = plane->state;
+	struct sun4i_layer_state *layer_state = state_to_sun4i_layer_state(new_state);
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 	struct sun4i_backend *backend = layer->backend;
 	struct sun4i_frontend *frontend = backend->frontend;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7bcc8c4561a6..c0da3ba9fbdf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -281,12 +281,13 @@ static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
 static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 					 struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
-	unsigned int zpos = plane->state->normalized_zpos;
+	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!plane->state->visible) {
+	if (!new_state->visible) {
 		sun8i_ui_layer_enable(mixer, layer->channel,
 				      layer->overlay, false, 0, old_zpos);
 		return;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index b5a82930e272..04709beb9bae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -384,12 +384,13 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 					 struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
-	unsigned int zpos = plane->state->normalized_zpos;
+	unsigned int zpos = new_state->normalized_zpos;
 	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!plane->state->visible) {
+	if (!new_state->visible) {
 		sun8i_vi_layer_enable(mixer, layer->channel,
 				      layer->overlay, false, 0, old_zpos);
 		return;
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index bd2ee94f6f52..9231c6ef602a 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -708,34 +708,35 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 static void tegra_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
-	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct drm_framebuffer *fb = new_state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc_window window;
 	unsigned int i;
 
 	/* rien ne va plus */
-	if (!plane->state->crtc || !plane->state->fb)
+	if (!new_state->crtc || !new_state->fb)
 		return;
 
-	if (!plane->state->visible)
+	if (!new_state->visible)
 		return tegra_plane_atomic_disable(plane, old_state);
 
 	memset(&window, 0, sizeof(window));
-	window.src.x = plane->state->src.x1 >> 16;
-	window.src.y = plane->state->src.y1 >> 16;
-	window.src.w = drm_rect_width(&plane->state->src) >> 16;
-	window.src.h = drm_rect_height(&plane->state->src) >> 16;
-	window.dst.x = plane->state->dst.x1;
-	window.dst.y = plane->state->dst.y1;
-	window.dst.w = drm_rect_width(&plane->state->dst);
-	window.dst.h = drm_rect_height(&plane->state->dst);
+	window.src.x = new_state->src.x1 >> 16;
+	window.src.y = new_state->src.y1 >> 16;
+	window.src.w = drm_rect_width(&new_state->src) >> 16;
+	window.src.h = drm_rect_height(&new_state->src) >> 16;
+	window.dst.x = new_state->dst.x1;
+	window.dst.y = new_state->dst.y1;
+	window.dst.w = drm_rect_width(&new_state->dst);
+	window.dst.h = drm_rect_height(&new_state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
 	window.reflect_x = state->reflect_x;
 	window.reflect_y = state->reflect_y;
 
 	/* copy from state */
-	window.zpos = plane->state->normalized_zpos;
+	window.zpos = new_state->normalized_zpos;
 	window.tiling = state->tiling;
 	window.format = state->format;
 	window.swap = state->swap;
@@ -867,15 +868,16 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 static void tegra_cursor_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
-	struct tegra_dc *dc = to_tegra_dc(plane->state->crtc);
+	struct drm_plane_state *new_state = plane->state;
+	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	u32 value = CURSOR_CLIP_DISPLAY;
 
 	/* rien ne va plus */
-	if (!plane->state->crtc || !plane->state->fb)
+	if (!new_state->crtc || !new_state->fb)
 		return;
 
-	switch (plane->state->crtc_w) {
+	switch (new_state->crtc_w) {
 	case 32:
 		value |= CURSOR_SIZE_32x32;
 		break;
@@ -894,7 +896,7 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 
 	default:
 		WARN(1, "cursor size %ux%u not supported\n",
-		     plane->state->crtc_w, plane->state->crtc_h);
+		     new_state->crtc_w, new_state->crtc_h);
 		return;
 	}
 
@@ -921,8 +923,8 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
 
 	/* position the cursor */
-	value = (plane->state->crtc_y & 0x3fff) << 16 |
-		(plane->state->crtc_x & 0x3fff);
+	value = (new_state->crtc_y & 0x3fff) << 16 |
+		(new_state->crtc_x & 0x3fff);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index e5b22508e09a..e9d86aec5ee8 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -427,20 +427,21 @@ static void tegra_shared_plane_atomic_disable(struct drm_plane *plane,
 static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 					     struct drm_plane_state *old_state)
 {
-	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
-	struct tegra_dc *dc = to_tegra_dc(plane->state->crtc);
-	unsigned int zpos = plane->state->normalized_zpos;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
+	unsigned int zpos = new_state->normalized_zpos;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
 	dma_addr_t base;
 	u32 value;
 	int err;
 
 	/* rien ne va plus */
-	if (!plane->state->crtc || !plane->state->fb)
+	if (!new_state->crtc || !new_state->fb)
 		return;
 
-	if (!plane->state->visible) {
+	if (!new_state->visible) {
 		tegra_shared_plane_atomic_disable(plane, old_state);
 		return;
 	}
@@ -484,17 +485,17 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	tegra_plane_writel(p, state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
-	value = V_POSITION(plane->state->crtc_y) |
-		H_POSITION(plane->state->crtc_x);
+	value = V_POSITION(new_state->crtc_y) |
+		H_POSITION(new_state->crtc_x);
 	tegra_plane_writel(p, value, DC_WIN_POSITION);
 
-	value = V_SIZE(plane->state->crtc_h) | H_SIZE(plane->state->crtc_w);
+	value = V_SIZE(new_state->crtc_h) | H_SIZE(new_state->crtc_w);
 	tegra_plane_writel(p, value, DC_WIN_SIZE);
 
 	value = WIN_ENABLE | COLOR_EXPAND;
 	tegra_plane_writel(p, value, DC_WIN_WIN_OPTIONS);
 
-	value = V_SIZE(plane->state->crtc_h) | H_SIZE(plane->state->crtc_w);
+	value = V_SIZE(new_state->crtc_h) | H_SIZE(new_state->crtc_w);
 	tegra_plane_writel(p, value, DC_WIN_CROPPED_SIZE);
 
 	tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI);
@@ -506,8 +507,8 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	value = CLAMP_BEFORE_BLEND | DEGAMMA_SRGB | INPUT_RANGE_FULL;
 	tegra_plane_writel(p, value, DC_WIN_SET_PARAMS);
 
-	value = OFFSET_X(plane->state->src_y >> 16) |
-		OFFSET_Y(plane->state->src_x >> 16);
+	value = OFFSET_X(new_state->src_y >> 16) |
+		OFFSET_Y(new_state->src_x >> 16);
 	tegra_plane_writel(p, value, DC_WINBUF_CROPPED_POINT);
 
 	if (dc->soc->supports_block_linear) {
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index d60f7cb5105f..5df1184ce1af 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -274,20 +274,21 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 static void vbox_primary_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct drm_crtc *crtc = plane->state->crtc;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_crtc *crtc = new_state->crtc;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct vbox_private *vbox = to_vbox_dev(fb->dev);
 	struct drm_mode_rect *clips;
 	uint32_t num_clips, i;
 
 	vbox_crtc_set_base_and_mode(crtc, fb,
-				    plane->state->src_x >> 16,
-				    plane->state->src_y >> 16);
+				    new_state->src_x >> 16,
+				    new_state->src_y >> 16);
 
 	/* Send information about dirty rectangles to VBVA. */
 
-	clips = drm_plane_get_damage_clips(plane->state);
-	num_clips = drm_plane_get_damage_clips_count(plane->state);
+	clips = drm_plane_get_damage_clips(new_state);
+	num_clips = drm_plane_get_damage_clips_count(new_state);
 
 	if (!num_clips)
 		return;
@@ -381,13 +382,14 @@ static void copy_cursor_image(u8 *src, u8 *dst, u32 width, u32 height,
 static void vbox_cursor_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct vbox_private *vbox =
 		container_of(plane->dev, struct vbox_private, ddev);
-	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct vbox_crtc *vbox_crtc = to_vbox_crtc(new_state->crtc);
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	u32 width = plane->state->crtc_w;
-	u32 height = plane->state->crtc_h;
+	u32 width = new_state->crtc_w;
+	u32 height = new_state->crtc_h;
 	size_t data_size, mask_size;
 	u32 flags;
 	struct dma_buf_map map;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 2f2ab3c01bf9..a8a675b6a3f7 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -94,18 +94,19 @@ static const struct drm_plane_funcs vkms_plane_funcs = {
 static void vkms_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct vkms_plane_state *vkms_plane_state;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct vkms_composer *composer;
 
-	if (!plane->state->crtc || !fb)
+	if (!new_state->crtc || !fb)
 		return;
 
-	vkms_plane_state = to_vkms_plane_state(plane->state);
+	vkms_plane_state = to_vkms_plane_state(new_state);
 
 	composer = vkms_plane_state->composer;
-	memcpy(&composer->src, &plane->state->src, sizeof(struct drm_rect));
-	memcpy(&composer->dst, &plane->state->dst, sizeof(struct drm_rect));
+	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
+	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
 	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
 	drm_framebuffer_get(&composer->fb);
 	composer->offset = fb->offsets[0];
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index a865ce1509e7..d770f1442c3b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -372,10 +372,11 @@ void
 vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
-	struct drm_crtc *crtc = plane->state->crtc ?: old_state->crtc;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
 	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-	struct vmw_plane_state *vps = vmw_plane_state_to_vps(plane->state);
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	s32 hotspot_x, hotspot_y;
 	int ret = 0;
 
@@ -383,9 +384,9 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	hotspot_x = du->hotspot_x;
 	hotspot_y = du->hotspot_y;
 
-	if (plane->state->fb) {
-		hotspot_x += plane->state->fb->hot_x;
-		hotspot_y += plane->state->fb->hot_y;
+	if (new_state->fb) {
+		hotspot_x += new_state->fb->hot_x;
+		hotspot_y += new_state->fb->hot_y;
 	}
 
 	du->cursor_surface = vps->surf;
@@ -400,8 +401,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 					      hotspot_y);
 	} else if (vps->bo) {
 		ret = vmw_cursor_update_bo(dev_priv, vps->bo,
-					   plane->state->crtc_w,
-					   plane->state->crtc_h,
+					   new_state->crtc_w,
+					   new_state->crtc_h,
 					   hotspot_x, hotspot_y);
 	} else {
 		vmw_cursor_update_position(dev_priv, false, 0, 0);
@@ -409,8 +410,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	if (!ret) {
-		du->cursor_x = plane->state->crtc_x + du->set_gui_x;
-		du->cursor_y = plane->state->crtc_y + du->set_gui_y;
+		du->cursor_x = new_state->crtc_x + du->set_gui_x;
+		du->cursor_y = new_state->crtc_y + du->set_gui_y;
 
 		vmw_cursor_update_position(dev_priv, true,
 					   du->cursor_x + hotspot_x,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 9a9508edbc9e..dfd73f381f04 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -284,16 +284,17 @@ static void
 vmw_ldu_primary_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct vmw_private *dev_priv;
 	struct vmw_legacy_display_unit *ldu;
 	struct vmw_framebuffer *vfb;
 	struct drm_framebuffer *fb;
-	struct drm_crtc *crtc = plane->state->crtc ?: old_state->crtc;
+	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
 
 
 	ldu = vmw_crtc_to_ldu(crtc);
 	dev_priv = vmw_priv(plane->dev);
-	fb       = plane->state->fb;
+	fb       = new_state->fb;
 
 	vfb = (fb) ? vmw_framebuffer_to_vfb(fb) : NULL;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index b0db059b8cfb..498f541b973c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -730,16 +730,17 @@ static void
 vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
-	struct drm_crtc *crtc = plane->state->crtc;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_pending_vblank_event *event = NULL;
 	struct vmw_fence_obj *fence = NULL;
 	int ret;
 
 	/* In case of device error, maintain consistent atomic state */
-	if (crtc && plane->state->fb) {
+	if (crtc && new_state->fb) {
 		struct vmw_private *dev_priv = vmw_priv(crtc->dev);
 		struct vmw_framebuffer *vfb =
-			vmw_framebuffer_to_vfb(plane->state->fb);
+			vmw_framebuffer_to_vfb(new_state->fb);
 
 		if (vfb->bo)
 			ret = vmw_sou_plane_update_bo(dev_priv, plane,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index fbe977881364..b05964d5879d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1577,8 +1577,9 @@ static void
 vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct vmw_plane_state *vps = vmw_plane_state_to_vps(plane->state);
-	struct drm_crtc *crtc = plane->state->crtc;
+	struct drm_plane_state *new_state = plane->state;
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
+	struct drm_crtc *crtc = new_state->crtc;
 	struct vmw_screen_target_display_unit *stdu;
 	struct drm_pending_vblank_event *event;
 	struct vmw_fence_obj *fence = NULL;
@@ -1586,9 +1587,9 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 	int ret;
 
 	/* If case of device error, maintain consistent atomic state */
-	if (crtc && plane->state->fb) {
+	if (crtc && new_state->fb) {
 		struct vmw_framebuffer *vfb =
-			vmw_framebuffer_to_vfb(plane->state->fb);
+			vmw_framebuffer_to_vfb(new_state->fb);
 		stdu = vmw_crtc_to_stdu(crtc);
 		dev_priv = vmw_priv(crtc->dev);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 27c0b849598b..8b87a17e9d56 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1179,11 +1179,12 @@ static void
 zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 				struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
 	bool format_changed = false;
 
 	if (!old_state->fb ||
-	    old_state->fb->format->format != plane->state->fb->format->format)
+	    old_state->fb->format->format != new_state->fb->format->format)
 		format_changed = true;
 
 	/*
@@ -1195,10 +1196,10 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 		if (old_state->fb)
 			zynqmp_disp_layer_disable(layer);
 
-		zynqmp_disp_layer_set_format(layer, plane->state);
+		zynqmp_disp_layer_set_format(layer, new_state);
 	}
 
-	zynqmp_disp_layer_update(layer, plane->state);
+	zynqmp_disp_layer_update(layer, new_state);
 
 	/* Enable or re-enable the plane is the format has changed. */
 	if (format_changed)
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 1d5d35bda249..2db0ace95426 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -353,8 +353,9 @@ static void zx_gl_rsz_setup(struct zx_plane *zplane, u32 src_w, u32 src_h,
 static void zx_gl_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct drm_plane_state *new_state = plane->state;
 	struct zx_plane *zplane = to_zx_plane(plane);
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_cma_object *cma_obj;
 	void __iomem *layer = zplane->layer;
 	void __iomem *csc = zplane->csc;
@@ -373,15 +374,15 @@ static void zx_gl_plane_atomic_update(struct drm_plane *plane,
 	format = fb->format->format;
 	stride = fb->pitches[0];
 
-	src_x = plane->state->src_x >> 16;
-	src_y = plane->state->src_y >> 16;
-	src_w = plane->state->src_w >> 16;
-	src_h = plane->state->src_h >> 16;
+	src_x = new_state->src_x >> 16;
+	src_y = new_state->src_y >> 16;
+	src_w = new_state->src_w >> 16;
+	src_h = new_state->src_h >> 16;
 
-	dst_x = plane->state->crtc_x;
-	dst_y = plane->state->crtc_y;
-	dst_w = plane->state->crtc_w;
-	dst_h = plane->state->crtc_h;
+	dst_x = new_state->crtc_x;
+	dst_y = new_state->crtc_y;
+	dst_w = new_state->crtc_w;
+	dst_h = new_state->crtc_h;
 
 	bpp = fb->format->cpp[0];
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
