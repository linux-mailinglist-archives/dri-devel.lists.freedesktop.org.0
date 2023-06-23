Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4073BE1E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53C110E69A;
	Fri, 23 Jun 2023 17:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A895E10E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=77BjZ9A29P7dE7Z5Bn0sFSJX8ONf8zrlPGtc7/oQu2g=;
 b=WrnCGA0P/ppSRrBGV3aLTajfVZWs6pzo/qqFCilQ5NNTBWbX5QGIzBpfZPjHWcm7v3MDl4+URk5bC
 B4EOVWZzi4wHkf+k+K+f64hGWspnDPE8a2ul2OfYxmsyFCeYAijzOvrLwcsXEZCno5pgKRYdPhktVe
 k0cJXNODeb+gcLZPv9Z+A6IKq7SuilVYQBNWOrujupiRbWz4VVqalscL3eulsDc/ALQeG6SEhKB1C6
 VGGfHLtxLKA+ZQNDnyRvixFmjDdsL7QH94VwcBgeJWIEq6waWnnt5sBQMvm6yuxkTj9tETpTzp0xy6
 0fKoNrF2eyETkQpukqYUeLO4K+mQH0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=77BjZ9A29P7dE7Z5Bn0sFSJX8ONf8zrlPGtc7/oQu2g=;
 b=ZGOISAjKd/ahljp9mT1oyuB2f2q4F1F9lF/XXyFTYrjwIRb6jkHv+nB3rgH7pwJ8xYsDcHu+a3UO1
 e1UR1GUAA==
X-HalOne-ID: f385b4f0-11ee-11ee-92ac-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id f385b4f0-11ee-11ee-92ac-99461c6a3fe8;
 Fri, 23 Jun 2023 17:54:10 +0000 (UTC)
Date: Fri, 23 Jun 2023 19:54:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 39/39] drm: renesas: shmobile: Add DT support
Message-ID: <20230623175409.GA2534204@ravnborg.org>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2759075c94c011b0f15cb610f39f8fa9b3736600.1687423204.git.geert+renesas@glider.be>
 <20230623175019.GO2112@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623175019.GO2112@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 08:50:19PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Thu, Jun 22, 2023 at 11:21:51AM +0200, Geert Uytterhoeven wrote:
> > Add DT support, by:
> >   1. Creating a panel bridge from DT, and attaching it to the encoder,
> >   2. Replacing the custom connector with a bridge connector,
> >   3. Obtaining clock configuration based on the compatible value.
> > 
> > Note that for now the driver uses a fixed clock configuration selecting
> > the bus clock, as the current code to select other clock inputs needs
> > changes to support any other SoCs than SH7724.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> > SH-Mobile AG5 (SH73A0) support is untested.
> > 
> > Unbind crashes when drm_encoder_cleanup() calls drm_bridge_detach(), as
> > the bridge (allocated by devm_drm_panel_bridge_add()) has already been
> > freed by that time.
> > Should I allocate my encoder with devm_kzalloc(), instead of embedding
> > it inside struct shmob_drm_device?
> 
> That shouldn't be needed, if you manage the memory for shmob_drm_device
> with the DRM managed helpers.
> 
> Lifetime management of bridges is currently completely broken, there's
> nothing that prevents bridges from being freed while still in use.
> That's an issue in DRM, not in your driver.
> 
> > ---
> >  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 101 +++++++++++++++---
> >  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |   1 +
> >  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  27 ++++-
> >  .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |   6 ++
> >  4 files changed, 118 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > index 17456dde57637ab8..1ec87841658de4f0 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > @@ -9,12 +9,16 @@
> >  
> >  #include <linux/clk.h>
> >  #include <linux/media-bus-format.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_runtime.h>
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_atomic_state_helper.h>
> >  #include <drm/drm_atomic_uapi.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_crtc_helper.h>
> >  #include <drm/drm_fb_dma_helper.h>
> > @@ -23,6 +27,7 @@
> >  #include <drm/drm_gem_dma_helper.h>
> >  #include <drm/drm_modeset_helper.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_panel.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -35,10 +40,6 @@
> >  #include "shmob_drm_plane.h"
> >  #include "shmob_drm_regs.h"
> >  
> > -/*
> > - * TODO: panel support
> > - */
> > -
> >  /* -----------------------------------------------------------------------------
> >   * Clock management
> >   */
> > @@ -129,7 +130,6 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
> >  		value |= LDMT1R_VPOL;
> >  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> >  		value |= LDMT1R_HPOL;
> > -
> 
> This could be moved to one of the patches in the series that touch this
> code.
> 
> >  	lcdc_write(sdev, LDMT1R, value);
> >  
> >  	value = ((mode->hdisplay / 8) << 16)			/* HDCN */
> > @@ -191,7 +191,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
> >  {
> >  	struct drm_crtc *crtc = &scrtc->base;
> >  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
> > -	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
> > +	unsigned int clk_div = sdev->config.clk_div;
> >  	struct device *dev = sdev->dev;
> >  	u32 value;
> >  	int ret;
> > @@ -220,17 +220,17 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
> >  	lcdc_write(sdev, LDPMR, 0);
> >  
> >  	value = sdev->lddckr;
> > -	if (idata->clk_div) {
> > +	if (clk_div) {
> >  		/* FIXME: sh7724 can only use 42, 48, 54 and 60 for the divider
> >  		 * denominator.
> >  		 */
> >  		lcdc_write(sdev, LDDCKPAT1R, 0);
> > -		lcdc_write(sdev, LDDCKPAT2R, (1 << (idata->clk_div / 2)) - 1);
> > +		lcdc_write(sdev, LDDCKPAT2R, (1 << (clk_div / 2)) - 1);
> >  
> > -		if (idata->clk_div == 1)
> > +		if (clk_div == 1)
> >  			value |= LDDCKR_MOSEL;
> >  		else
> > -			value |= idata->clk_div;
> > +			value |= clk_div;
> >  	}
> >  
> >  	lcdc_write(sdev, LDDCKR, value);
> > @@ -479,7 +479,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
> >  }
> >  
> >  /* -----------------------------------------------------------------------------
> > - * Encoder
> > + * Legacy Encoder
> >   */
> >  
> >  static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
> > @@ -508,9 +508,43 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> >  	.mode_fixup = shmob_drm_encoder_mode_fixup,
> >  };
> >  
> > +/* -----------------------------------------------------------------------------
> > + * Encoder
> > + */
> > +
> > +static int shmob_drm_encoder_init(struct shmob_drm_device *sdev,
> > +				  struct device_node *enc_node)
> > +{
> > +	struct drm_bridge *bridge;
> > +	struct drm_panel *panel;
> > +	int ret;
> > +
> > +	/* Create a panel bridge */
> > +	panel = of_drm_find_panel(enc_node);
> 
> Using drm_of_find_panel_or_bridge() would allow supporting platforms
> that connect a non-panel device to the SoC, in additional to the already
> supported panels.

From the documentation of drm_of_find_panel_or_bridge():

 * This function is deprecated and should not be used in new drivers. Use
 * devm_drm_of_get_bridge() instead.

I suggest to go that route.

> > @@ -147,11 +148,13 @@ static int shmob_drm_remove(struct platform_device *pdev)
> >  static int shmob_drm_probe(struct platform_device *pdev)
> >  {
> >  	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
> 
> How about dropping non-DT support ? That would simplify the driver.
+1 for that, without knowing the implications.

	Sam
