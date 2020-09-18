Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889D270BEF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343B6E198;
	Sat, 19 Sep 2020 08:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E9A6ECC6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 08:06:56 +0000 (UTC)
IronPort-SDR: Tj5PpekTCSDUGI6qp58za9xUdVnv8QfrskXiee7JYAezdrga31XU7L9vZXGWR8PdpXrMRup+aL
 0DlqOWxsjJia+eoFf9apYPnbRDWnpDu98rAVFDwLmeGs8D7kyU/DYVcyNO4i28BhpHSmBec1Pv
 rxVWg82MDRGr/KBKhdMigGUOvviLYTHS4/iQGDYHPAJgHRZtxBmPw1N0UrVr8U6woPMyutMuZg
 s5wlTJRGWNNz39snlLzd1f/qrkZXMituP6C/ArvC18BcJ082/2CJrOgDS9pbUoz2pKuoY0rjYe
 aW0=
X-IronPort-AV: E=Sophos;i="5.77,274,1596492000"; d="scan'208";a="13919670"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Sep 2020 10:06:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 18 Sep 2020 10:06:51 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 18 Sep 2020 10:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1600416411; x=1631952411;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wyZzvMMDTWnpQFctSpVvEtrwx5dWh5GhDZNJNn8DXGY=;
 b=OKpSv9KipQLGvLhaisXve1f4YdtGBCECRLzjV4cJDdUEw9Inz3pY1rAq
 rfvaZgp1NpMXwcEY9SBZPGJlGEJ3cb35oE1d0U3ojr052RU/GbEZv/W0i
 FQgoAttuWT+NIzIj0jdab8kh95dtHGrw3Lzt1iczheS+kuBbql9pV0LIr
 jl0yahfROKIcZZnmbV5T1imxfLvYntd+NjWFvEFL7n7hZRqdNhTUmqdtE
 YyV+r3gS0wG57gbFSihdSovV6Xw2PA9q6UuRufDOjftvE3I2P+dBlJSPs
 0LApeuRbNWVdGEHb1dnd4Mf+pJs+Qtgb96IBZipoElUUh2h8Z+azMJGCk g==;
IronPort-SDR: bEUj7A7obHd7zLLR1KFO4CAosz0TkLyVtyu2gPZcuStNxCLv7LuaPMtjKx6/zakGxXVOUiRtNo
 LhxEVcWzeBKluruXosnkzXIKfkcftngLBIvFU1DQ5nNbPdF7rEB2qzlvyktG5UMZsNLCXgOEAB
 LkND/kdJzuOEflD2Q465t9FC/mzjddbHPqkrL+iqn4WeG501TvrCP1OR+CKkMHIv6gXGwnpe1m
 kRnaGAUInaOZH+bQ9VzA41ucPHfWS01NxLSd61yalLcmgcWotFBnssWaWrnGzoyU/FeA1FJfuB
 3Js=
X-IronPort-AV: E=Sophos;i="5.77,274,1596492000"; d="scan'208";a="13919669"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Sep 2020 10:06:51 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 1EE5A280070;
 Fri, 18 Sep 2020 10:06:51 +0200 (CEST)
Message-ID: <e9c9b62425bcf83b59540deaa0fbdf1ec617020e.camel@ew.tq-group.com>
Subject: Re: [PATCH] drm: fsl-dcu: enable PIXCLK on LS1021A
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, sboyd@kernel.org, mturquette@baylibre.com
Date: Fri, 18 Sep 2020 10:06:48 +0200
In-Reply-To: <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
References: <20200820105832.22331-1-matthias.schiffer@ew.tq-group.com>
 <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
> 
> --
> Stefan

How do we proceed with this patch?

Kind regards,
Matthias



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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
