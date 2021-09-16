Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A7440E1B9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B726EBA4;
	Thu, 16 Sep 2021 16:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Thu, 16 Sep 2021 12:57:46 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CDA6EDA4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1631797066; x=1663333066;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6plUJPuIO09066G85hIHzTnYEmymxOdL/SU9LjssE8Y=;
 b=WYkCUle6JmtH08G9xubITuNGBkCNPGA9trKQEmhsQFZpb/daTayYDea5
 OClePY6XL5HX/d/GU9pCQqNpf1okTJKxhMjQOdcaDkhN2WerkGClR2+qp
 7vlcJRp9VopUNaAAIMwDEI+KXBGA2OicFjBILbxN/VYNh1aXsp0V6XqWn
 Rg5QSCVOOOMq/8i/zAEIXu1hYfjLPdRQAmYWRMEP0Id/61mBVPPurQjUH
 EduqQEjABsIJr+to69maqe8pJLTFwjQgNM+8Ess0+dWkoVqSLXxTEBvMx
 dd5L3zEAyXho8Oat4cTeekl/3+BM/2N1ud/CXTdMq9MvL/vg/gcyzoNpw w==;
X-IronPort-AV: E=Sophos;i="5.85,298,1624312800"; d="scan'208";a="19552601"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 Sep 2021 14:50:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 16 Sep 2021 14:50:33 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 16 Sep 2021 14:50:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1631796633; x=1663332633;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6plUJPuIO09066G85hIHzTnYEmymxOdL/SU9LjssE8Y=;
 b=hRMXot9k3BMTciaVtF4OIeBasZDAfh0foXzHJVq4KiTHtS6UJM5agMpq
 1OoX1MQnjKbY360ibL6np05SuahCXp3bc8JIjLt2+ZdRsj8Fseq2Ntr+K
 pm6IYtUOklVgIPOFQ0xDqY/ZxDL03t/Ffc5bhy+0FZwX4GQjnHzquu2mB
 1q2iEuIzOAnZUNZidPcoAes1Z06IvNVFo4qH2nZpVv5Uyvzb+i7go+IyZ
 ApRhsU6FPJEoOLLnhR7YS/GSQz31UwSHXlcR8N8fXP48G4XTDd0wWhs7O
 AJR2QcAX427EW1Wz3FcvuKWxgpoldJnQVtHb8jwft0EvRchfTrUQryKdT Q==;
X-IronPort-AV: E=Sophos;i="5.85,298,1624312800"; d="scan'208";a="19552599"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Sep 2021 14:50:28 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A2C88280070;
 Thu, 16 Sep 2021 14:50:27 +0200 (CEST)
Message-ID: <5015d9c9fe02733f8dfb2714a903ab725e7cdd7f.camel@ew.tq-group.com>
Subject: Re: [PATCH] drm: fsl-dcu: enable PIXCLK on LS1021A
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, sboyd@kernel.org, mturquette@baylibre.com
Cc: Alison Wang <alison.wang@nxp.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 16 Sep 2021 14:50:27 +0200
In-Reply-To: <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
References: <20200820105832.22331-1-matthias.schiffer@ew.tq-group.com>
 <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 16 Sep 2021 16:56:50 +0000
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

On Fri, 2020-08-21 at 15:41 +0200, Stefan Agner wrote:
> Hi Matthias,
> 
> On 2020-08-20 12:58, Matthias Schiffer wrote:
> > The PIXCLK needs to be enabled in SCFG before accessing the DCU on LS1021A,
> > or the access will hang.
> 
> Hm, this seems a rather ad-hoc access to SCFG from the DCU. We do
> support a pixel clock in the device tree bindings of fsl-dcu, so ideally
> we should enable the pixel clock through the clock framework.
> 
> On the other hand, I guess that would mean adding a clock driver to flip
> a single bit, which seems a bit excessive too.
> 
> I'd like a second opinion on that. Adding clk framework maintainers.

It's been a while, and nobody else has given their opinion. How should
we proceed with this patch?

Matthias


> 
> --
> Stefan
> 
> > 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 25 +++++++++++++++++++++++
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
> >  3 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
> > index d7dd8ba90e3a..9e5a35e7c00c 100644
> > --- a/drivers/gpu/drm/fsl-dcu/Kconfig
> > +++ b/drivers/gpu/drm/fsl-dcu/Kconfig
> > @@ -8,6 +8,7 @@ config DRM_FSL_DCU
> >  	select DRM_PANEL
> >  	select REGMAP_MMIO
> >  	select VIDEOMODE_HELPERS
> > +	select MFD_SYSCON if SOC_LS1021A
> >  	help
> >  	  Choose this option if you have an Freescale DCU chipset.
> >  	  If M is selected the module will be called fsl-dcu-drm.
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > index abbc1ddbf27f..8a7556655581 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > @@ -51,6 +51,23 @@ static const struct regmap_config fsl_dcu_regmap_config = {
> >  	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
> >  };
> >  
> > +static int fsl_dcu_scfg_config_ls1021a(struct device_node *np)
> > +{
> > +	struct regmap *scfg;
> > +
> > +	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> > +	if (IS_ERR(scfg))
> > +		return PTR_ERR(scfg);
> > +
> > +	/*
> > +	 * For simplicity, enable the PIXCLK unconditionally. It might
> > +	 * be possible to disable the clock in PM or on unload as a future
> > +	 * improvement.
> > +	 */
> > +	return regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
> > +				  SCFG_PIXCLKCR_PXCEN);
> > +}
> > +
> >  static void fsl_dcu_irq_uninstall(struct drm_device *dev)
> >  {
> >  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> > @@ -70,6 +87,14 @@ static int fsl_dcu_load(struct drm_device *dev,
> > unsigned long flags)
> >  		return ret;
> >  	}
> >  
> > +	if (of_device_is_compatible(fsl_dev->np, "fsl,ls1021a-dcu")) {
> > +		ret = fsl_dcu_scfg_config_ls1021a(fsl_dev->np);
> > +		if (ret < 0) {
> > +			dev_err(dev->dev, "failed to enable pixclk\n");
> > +			goto done;
> > +		}
> > +	}
> > +
> >  	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
> >  	if (ret < 0) {
> >  		dev_err(dev->dev, "failed to initialize vblank\n");
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > index e2049a0e8a92..566396013c04 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> > @@ -160,6 +160,9 @@
> >  #define FSL_DCU_ARGB4444		12
> >  #define FSL_DCU_YUV422			14
> >  
> > +#define SCFG_PIXCLKCR			0x28
> > +#define SCFG_PIXCLKCR_PXCEN		BIT(31)
> > +
> >  #define VF610_LAYER_REG_NUM		9
> >  #define LS1021A_LAYER_REG_NUM		10

