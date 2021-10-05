Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25974226C9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 14:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CC26F5E0;
	Tue,  5 Oct 2021 12:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D808A6F5E0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633437319; x=1664973319;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j/ehLDdNNVgNGsffUk1Nh+43i9u0AcP1I6qGfU1AJg=;
 b=PGoNLYjpVUfr94YakQseUFRbbj+34UjQzD5NhY1FmcsQuxHY7oFRMQxg
 w82He/hQxf2xSges9zZiXpeiCPL0qTR2osp71+/HJmMconWdqbM00AaES
 HDR5wPBV+H2PjpDfqpVv/ao5gPZDmYtfX/U1A43Fs2RrA75u69DoAthpR
 M1dyUbriXevR+30LCVoNO6CQNVaK67wLqG4eoBq5zLKEgXKbcLri9DPtU
 pZ/3w0OeGnEHE+hEi5B6bj1CaOHKt5ahKeWb20QNMuyOI6hmGlAoADpuP
 aVmnaPBCwXhQNNhPXM5zFTNn+uhg1dLsoV07Hff69QES5Rus99aeb2+Ml w==;
X-IronPort-AV: E=Sophos;i="5.85,348,1624312800"; d="scan'208";a="19872889"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 05 Oct 2021 14:35:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 05 Oct 2021 14:35:15 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 05 Oct 2021 14:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633437315; x=1664973315;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j/ehLDdNNVgNGsffUk1Nh+43i9u0AcP1I6qGfU1AJg=;
 b=pYXMsPigWJ1cikH9iWLxdTD0v5OyY0z1pdSpurnFfJXx/j/elAKAwo9U
 lC48sWtKEzopMv/efOEfpx7MwGs9mdVAdEUTKIiGYQoJvk3QejHvpZdxK
 YyEcR/6kLf2vUp1u0IrG+zTsoITqYSqT7+0BpZINz7CDhblRTUhZKBwYt
 zRjc/03RzDN4GjvuNWzqzqwU7G5vrW88QOXPNPyWQ7MPaO+f0ez9ueUoS
 QLD5dSJD/6AUpKzPzcIjeHjn/ftgW+himaZGHequx/HL3Rgllwkv94lOy
 +6sXQP/e1Cu8uu8dkKFzKMfbjAeFN/1tu7fzUnttLFnCsqbGOW588PfSX w==;
X-IronPort-AV: E=Sophos;i="5.85,348,1624312800"; d="scan'208";a="19872888"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Oct 2021 14:35:15 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id CBF66280065;
 Tue,  5 Oct 2021 14:35:14 +0200 (CEST)
Message-ID: <8e6830c43fbd97bbca59702896b0dd320f83e940.camel@ew.tq-group.com>
Subject: Re: [PATCH] drm: fsl-dcu: enable PIXCLK on LS1021A
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, sboyd@kernel.org, mturquette@baylibre.com
Cc: Alison Wang <alison.wang@nxp.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 05 Oct 2021 14:35:13 +0200
In-Reply-To: <5015d9c9fe02733f8dfb2714a903ab725e7cdd7f.camel@ew.tq-group.com>
References: <20200820105832.22331-1-matthias.schiffer@ew.tq-group.com>
 <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
 <5015d9c9fe02733f8dfb2714a903ab725e7cdd7f.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-09-16 at 14:50 +0200, Matthias Schiffer wrote:
> On Fri, 2020-08-21 at 15:41 +0200, Stefan Agner wrote:
> > Hi Matthias,
> > 
> > On 2020-08-20 12:58, Matthias Schiffer wrote:
> > > The PIXCLK needs to be enabled in SCFG before accessing the DCU on LS1021A,
> > > or the access will hang.
> > 
> > Hm, this seems a rather ad-hoc access to SCFG from the DCU. We do
> > support a pixel clock in the device tree bindings of fsl-dcu, so ideally
> > we should enable the pixel clock through the clock framework.
> > 
> > On the other hand, I guess that would mean adding a clock driver to flip
> > a single bit, which seems a bit excessive too.
> > 
> > I'd like a second opinion on that. Adding clk framework maintainers.
> 
> It's been a while, and nobody else has given their opinion. How should
> we proceed with this patch?
> 
> Matthias

This patch is still blocked on a maintainer decision. Should I send a
rebased version of the current solution, or do we want to have a proper
clk driver to flip this bit?


> 
> 
> > 
> > --
> > Stefan
> > 
> > > 
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
> > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 25 +++++++++++++++++++++++
> > >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
> > >  3 files changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
> > > index d7dd8ba90e3a..9e5a35e7c00c 100644
> > > --- a/drivers/gpu/drm/fsl-dcu/Kconfig
> > > +++ b/drivers/gpu/drm/fsl-dcu/Kconfig
> > > @@ -8,6 +8,7 @@ config DRM_FSL_DCU
> > >  	select DRM_PANEL
> > >  	select REGMAP_MMIO
> > >  	select VIDEOMODE_HELPERS
> > > +	select MFD_SYSCON if SOC_LS1021A
> > >  	help
> > >  	  Choose this option if you have an Freescale DCU chipset.
> > >  	  If M is selected the module will be called fsl-dcu-drm.
> > > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > > index abbc1ddbf27f..8a7556655581 100644
> > > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > > @@ -51,6 +51,23 @@ static const struct regmap_config fsl_dcu_regmap_config = {
> > >  	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
> > >  };
> > >  
> > > +static int fsl_dcu_scfg_config_ls1021a(struct device_node *np)
> > > +{
> > > +	struct regmap *scfg;
> > > +
> > > +	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> > > +	if (IS_ERR(scfg))
> > > +		return PTR_ERR(scfg);
> > > +
> > > +	/*
> > > +	 * For simplicity, enable the PIXCLK unconditionally. It might
> > > +	 * be possible to disable the clock in PM or on unload as a future
> > > +	 * improvement.
> > > +	 */
> > > +	return regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
> > > +				  SCFG_PIXCLKCR_PXCEN);
> > > +}
> > > +
> > >  static void fsl_dcu_irq_uninstall(struct drm_device *dev)
> > >  {
> > >  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> > > @@ -70,6 +87,14 @@ static int fsl_dcu_load(struct drm_device *dev,
> > > unsigned long flags)
> > >  		return ret;
> > >  	}
> > >  
> > > +	if (of_device_is_compatible(fsl_dev->np, "fsl,ls1021a-dcu")) {
> > > +		ret = fsl_dcu_scfg_config_ls1021a(fsl_dev->np);
> > > +		if (ret < 0) {
> > > +			dev_err(dev->dev, "failed to enable pixclk\n");
> > > +			goto done;
> > > +		}
> > > +	}
> > > +
> > >  	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
> > >  	if (ret < 0) {
> > >  		dev_err(dev->dev, "failed to initialize vblank\n");
> > > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > > index e2049a0e8a92..566396013c04 100644
> > > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > > @@ -160,6 +160,9 @@
> > >  #define FSL_DCU_ARGB4444		12
> > >  #define FSL_DCU_YUV422			14
> > >  
> > > +#define SCFG_PIXCLKCR			0x28
> > > +#define SCFG_PIXCLKCR_PXCEN		BIT(31)
> > > +
> > >  #define VF610_LAYER_REG_NUM		9
> > >  #define LS1021A_LAYER_REG_NUM		10

