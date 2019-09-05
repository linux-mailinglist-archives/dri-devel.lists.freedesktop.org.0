Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC5A9EF6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59BD89FEA;
	Thu,  5 Sep 2019 09:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57889FEA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:56:31 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 73BB11C001F;
 Thu,  5 Sep 2019 09:56:23 +0000 (UTC)
Date: Thu, 5 Sep 2019 11:57:57 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190905095757.gg6s5pse5tvivxbs@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <20190827002422.GQ5031@pendragon.ideasonboard.com>
 <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
 <20190827163423.GB5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190827163423.GB5054@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1977165461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1977165461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vshdzxkdbqvaeroa"
Content-Disposition: inline


--vshdzxkdbqvaeroa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Aug 27, 2019 at 07:34:23PM +0300, Laurent Pinchart wrote:
> Hi Laurent,
>
> On Tue, Aug 27, 2019 at 04:56:19PM +0200, Jacopo Mondi wrote:
> > On Tue, Aug 27, 2019 at 03:24:22AM +0300, Laurent Pinchart wrote:
> > > On Sun, Aug 25, 2019 at 03:51:48PM +0200, Jacopo Mondi wrote:
> > > > Add a driver for the R-Car Display Unit Color Correction Module.
> > > >
> > > > In most of Gen3 SoCs, each DU output channel is provided with a CMM=
 unit
> > > > to perform image enhancement and color correction.
> > > >
> > > > Add support for CMM through a driver that supports configuration of
> > > > the 1-dimensional LUT table. More advanced CMM feature will be
> > > > implemented on top of this basic one.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> > > >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> > > >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 262 +++++++++++++++++++++++++=
++++
> > > >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 +++++
> > > >  4 files changed, 308 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> > > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar=
-du/Kconfig
> > > > index 1529849e217e..539d232790d1 100644
> > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > @@ -13,6 +13,13 @@ config DRM_RCAR_DU
> > > >  	  Choose this option if you have an R-Car chipset.
> > > >  	  If M is selected the module will be called rcar-du-drm.
> > > >
> > > > +config DRM_RCAR_CMM
> > > > +	bool "R-Car DU Color Management Module (CMM) Support"
> > > > +	depends on DRM && OF
> > > > +	depends on DRM_RCAR_DU
> > > > +	help
> > > > +	  Enable support for R-Car Color Management Module (CMM).
> > > > +
> > > >  config DRM_RCAR_DW_HDMI
> > > >  	tristate "R-Car DU Gen3 HDMI Encoder Support"
> > > >  	depends on DRM && OF
> > > > diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rca=
r-du/Makefile
> > > > index 6c2ed9c46467..4d1187ccc3e5 100644
> > > > --- a/drivers/gpu/drm/rcar-du/Makefile
> > > > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > > > @@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+=3D rcar_du_=
of.o \
> > > >  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+=3D rcar_du_vsp.o
> > > >  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) +=3D rcar_du_writeback.o
> > > >
> > > > +obj-$(CONFIG_DRM_RCAR_CMM)		+=3D rcar_cmm.o
> > > >  obj-$(CONFIG_DRM_RCAR_DU)		+=3D rcar-du-drm.o
> > > >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+=3D rcar_dw_hdmi.o
> > > >  obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/r=
car-du/rcar_cmm.c
> > > > new file mode 100644
> > > > index 000000000000..55361f5701e8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > > > @@ -0,0 +1,262 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> > > > + *
> > > > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > + */
> > > > +
> > > > +#include <linux/io.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +
> > > > +#include <drm/drm_color_mgmt.h>
> > > > +
> > > > +#include "rcar_cmm.h"
> > > > +
> > > > +#define CM2_LUT_CTRL		0x0000
> > > > +#define CM2_LUT_CTRL_LUT_EN	BIT(0)
> > > > +#define CM2_LUT_TBL_BASE	0x0600
> > > > +#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
> > > > +
> > > > +struct rcar_cmm {
> > > > +	void __iomem *base;
> > > > +	bool enabled;
> > > > +
> > > > +	/*
> > > > +	 * @lut:		1D-LUT status
> > > > +	 * @lut.enabled:	1D-LUT enabled flag
> > > > +	 * @lut.size:		Number of entries in the LUT table
> > >
> > > Please see my review of patch 13/14, I wonder if we could drop this
> > > field.
> > >
> > > > +	 * @lut.table:		Table of 1D-LUT entries scaled to HW support
> > > > +	 *			precision (8-bits per color component)
> > > > +	 */
> > > > +	struct {
> > > > +		bool enabled;
> > > > +		unsigned int size;
> > > > +		u32 table[CMM_GAMMA_LUT_SIZE];
> > > > +	} lut;
> > > > +};
> > > > +
> > > > +static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> > > > +{
> > > > +	return ioread32(rcmm->base + reg);
> > > > +}
> > > > +
> > > > +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, =
u32 data)
> > > > +{
> > > > +	iowrite32(data, rcmm->base + reg);
> > > > +}
> > > > +
> > > > +/*
> > > > + * rcar_cmm_lut_extract() - Scale down to hw precision the DRM LUT=
 table
> > >
> > > s/hw/hardware/ (and below too)
> > >
> > > > + *			    entries and store them.
> > > > + * @rcmm: Pointer to the CMM device
> > > > + * @size: Number of entries in the table
> > > > + * @drm_lut: DRM LUT table
> > > > + */
> > > > +static void rcar_cmm_lut_extract(struct rcar_cmm *rcmm, size_t siz=
e,
> > > > +				 const struct drm_color_lut *drm_lut)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i =3D 0; i < size; ++i) {
> > > > +		const struct drm_color_lut *lut =3D &drm_lut[i];
> > > > +
> > > > +		rcmm->lut.table[i] =3D drm_color_lut_extract(lut->red, 8) << 16
> > > > +				   | drm_color_lut_extract(lut->green, 8) << 8
> > > > +				   | drm_color_lut_extract(lut->blue, 8);
> > > > +	}
> > > > +
> > > > +	rcmm->lut.size =3D size;
> > > > +}
> > > > +
> > > > +/*
> > > > + * rcar_cmm_lut_load() - Write to hw the LUT table entries from th=
e local table.
> > > > + *
> > >
> > > No need for a blank line
> > >
> > > > + * @rcmm: Pointer to the CMM device
> > > > + */
> > > > +static void rcar_cmm_lut_load(struct rcar_cmm *rcmm)
> > >
> > > I would name this rcar_cmm_lut_write().
> >
> > I won't, as I would like to convey the LUT tables is loaded from the
> > local cache after it has been scaled down to the hardware supported
> > precision.
>
> "load" hints a read though, and here you write the LUT to the hardware.
> Without reading the comments I would have thought this function would
> read the LUT back from the hardware.
>
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i =3D 0; i < rcmm->lut.size; ++i) {
> > > > +		u32 entry =3D rcmm->lut.table[i];
> > > > +
> > > > +		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> > >
> > > You don't need the local entry variable.
> >
> > True, but the code is nicer to read and the compiler should be smart
> > enough to optimize it away
>
> I'm not sure about nicer to read, I find the opposite personally, but
> it's your code :-)
>
> > > > +	}
> > > > +}
> > > > +
> > > > +/**
> > > > + * rcar_cmm_setup() - configure the CMM unit
> > >
> > > s/configure/Configure/ and s/$/./, or the other way around for the ot=
her
> > > functions (I don't mine which one, but let's stay consistent).
> >
> > Oh right, sorry for the confusion
>
> It's just my OCD kicking in :-)
>
> > > > + *
> > >
> > > No need for a blank line (same for the functions below).
> > >
> > > > + * @pdev: The platform device associated with the CMM instance
> > > > + * @config: The CRTC-provided configuration.
> > > > + *
> > > > + * Configure the CMM unit with the CRTC-provided configuration.
> > > > + * Currently enabling, disabling and programming of the 1-D LUT un=
it is
> > > > + * supported.
> > > > + */
> > > > +int rcar_cmm_setup(struct platform_device *pdev,
> > > > +		   const struct rcar_cmm_config *config)
> > > > +{
> > > > +	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> > > > +
> > > > +	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
> > > > +		return -EINVAL;
> > > > +
> > > > +	/*
> > > > +	 * As rcar_cmm_setup() is called by atomic commit tail helper, it=
 might
> > > > +	 * be called when the CMM is disabled. As we can't program the ha=
rdware
> > > > +	 * in that case, store the configuration internally and apply it =
when
> > > > +	 * the CMM will be enabled by the CRTC through rcar_cmm_enable().
> > > > +	 */
> > > > +	if (!rcmm->enabled) {
> > > > +		if (!config->lut.enable)
> > > > +			return 0;
> > > > +
> > > > +		rcar_cmm_lut_extract(rcmm, config->lut.size, config->lut.table);
> > > > +		rcmm->lut.enabled =3D true;
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	/* Stop LUT operations if requested. */
> > > > +	if (!config->lut.enable) {
> > > > +		if (rcmm->lut.enabled) {
> > > > +			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > > > +			rcmm->lut.enabled =3D false;
> > > > +			rcmm->lut.size =3D 0;
> > > > +		}
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Enable LUT and program the new gamma table values.
> > > > +	 *
> > > > +	 * FIXME: In order to have stable operations it is required to fi=
rst
> > > > +	 * enable the 1D-LUT and then program its table entries. This see=
ms to
> > > > +	 * contradict what the chip manual reports, and will have to be
> > > > +	 * reconsidered when implementing support for double buffering.
> > > > +	 */
> > > > +	if (!rcmm->lut.enabled) {
> > > > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> > > > +		rcmm->lut.enabled =3D true;
> > > > +	}
> > > > +
> > > > +	rcar_cmm_lut_extract(rcmm, config->lut.size, config->lut.table);
> > > > +	rcar_cmm_lut_load(rcmm);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> > > > +
> > > > +/**
> > > > + * rcar_cmm_enable() - enable the CMM unit
> > > > + *
> > > > + * @pdev: The platform device associated with the CMM instance
> > > > + *
> > > > + * Enable the CMM unit by enabling the parent clock and enabling t=
he CMM
> > > > + * components, such as 1-D LUT, if requested.
> > > > + */
> > > > +int rcar_cmm_enable(struct platform_device *pdev)
> > > > +{
> > > > +	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> > > > +	int ret;
> > > > +
> > > > +	if (!rcmm)
> > > > +		return -EPROBE_DEFER;
> > >
> > > This function is called in rcar_du_crtc_atomic_enable(), so that's not
> > > the right error code. It seems we need another function for the CMM A=
PI
> > > to defer probing :-/ I would call it rcar_cmm_init(). This check would
> > > then be removed.
> >
> > I agree about the return code, but not the name, as this function
> > actually enables the CMM.
>
> I meant creating a new rcar_cmm_init() function that would just have the
> !rcmm check.
>
> > PROBE_DEFER does not make any sense here, I
> > wonder where it come from, as the probing of CMM and DU has long
> > happened once we get here (at least, I assume so, if we receive a
> > gamma_table, userspace has already been running, and both DU and CMM
> > should have probed. Otherwise, we can exploit the newly created device
> > link, and make sure DU probes after the CMM).
> >
> > I would just change the return value here, and possibly use the device
> > link to ensure the correct probing sequence.
>
> How does device link help here ?
>

Currently it doesn't, as we are creating a stateless link.

But if we go for a managed device link (which is the default, by the
way, you have to opt-out from it) we can guarantee the CMM has probed
before the DU probes, so that we have a guarantee when we get here
!rcmm cannot happen.

https://www.kernel.org/doc/html/v5.2-rc7/driver-api/device_link.html
"The consumer devices are not probed before the supplier is bound to a driv=
er,
 and they=E2=80=99re unbound before the supplier is unbound."

As we create the link, the CMM is the supplier of DU, so we could just
drop the DL_FLAG_STATELESS flag in device_link_add() in 10/14.

Does this match your understanding ?

> > > > +
> > > > +	ret =3D pm_runtime_get_sync(&pdev->dev);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	/* Apply the LUT table values saved at rcar_cmm_setup() time. */
> > > > +	if (rcmm->lut.enabled) {
> > > > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> > > > +		rcar_cmm_lut_load(rcmm);
> > >
> > > You will not like this, but I just realised that we're now reprogramm=
ing
> > > the LUT contents every time the CMM is enabled. Do you think that's
> > > something we should optimise ? And yes, that would require introducing
> >
> > Why so? If we receive an enable after a disable which stops the CMM
> > clock and we have no guarantees the table entries have been kept, or
> > what we receive from userspace has changed or not. Why is this an
> > issue in your opinion?
>
> I thought the hardware preserved the LUT ? Skipping the LUT write is an
> optimisation, so we could do without it in the initial version. I think
> it would become more important with the CLU though, as we'll have more
> data entries there. Maybe we should first check how much time the LUT
> and CLU writes take before deciding to optimise them.
>

Yeah, let's post-pone optimizations...

> > > back an update flag in rcmm->lut :-S Sorry for not realising this whe=
n I
> > > proposed dropping it.
> > >
> > > > +	}
> > > > +
> > > > +	rcmm->enabled =3D true;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rcar_cmm_enable);
> > > > +
> > > > +/**
> > > > + * rcar_cmm_disable() - disable the CMM unit
> > > > + *
> > > > + * @pdev: The platform device associated with the CMM instance
> > > > + *
> > > > + * Disable the CMM unit by stopping the parent clock.
> > > > + */
> > > > +void rcar_cmm_disable(struct platform_device *pdev)
> > > > +{
> > > > +	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> > > > +
> > > > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > > > +
> > > > +	pm_runtime_put(&pdev->dev);
> > > > +
> > > > +	rcmm->lut.enabled =3D false;
> > > > +	rcmm->lut.size =3D 0;
> > > > +
> > > > +	rcmm->enabled =3D false;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> > > > +
> > > > +static int rcar_cmm_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct rcar_cmm *rcmm;
> > > > +	struct resource *res;
> > > > +
> > > > +	rcmm =3D devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> > > > +	if (!rcmm)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	platform_set_drvdata(pdev, rcmm);
> > > > +
> > > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +	rcmm->base =3D devm_ioremap_resource(&pdev->dev, res);
> > > > +	if (IS_ERR(rcmm->base))
> > > > +		return PTR_ERR(rcmm->base);
> > >
> > > You really don't like combining those two calls, do you ? :-)
> >
> > devm_of_iomap() ?
>
> devm_platform_ioremap_resource()
>

Oh stupid, thanks!

Thanks
   j

> > > > +
> > > > +	pm_runtime_enable(&pdev->dev);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int rcar_cmm_remove(struct platform_device *pdev)
> > > > +{
> > > > +	pm_runtime_disable(&pdev->dev);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct of_device_id rcar_cmm_of_table[] =3D {
> > > > +	{ .compatible =3D "renesas,cmm-r8a7795", },
> > > > +	{ .compatible =3D "renesas,cmm-r8a7796", },
> > > > +	{ .compatible =3D "renesas,cmm-r8a77965", },
> > > > +	{ .compatible =3D "renesas,cmm-r8a77990", },
> > > > +	{ .compatible =3D "renesas,cmm-r8a77995", },
> > >
> > > As Geert pointed out, I would drop those entries.
> >
> > yes
> >
> > > > +	{ .compatible =3D "renesas,rcar-gen3-cmm", },
> > > > +	{ .compatible =3D "renesas,rcar-gen2-cmm", },
> > > > +	{ },
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> > > > +
> > > > +static struct platform_driver rcar_cmm_platform_driver =3D {
> > > > +	.probe		=3D rcar_cmm_probe,
> > > > +	.remove		=3D rcar_cmm_remove,
> > > > +	.driver		=3D {
> > > > +		.name	=3D "rcar-cmm",
> > > > +		.of_match_table =3D rcar_cmm_of_table,
> > > > +	},
> > > > +};
> > > > +
> > > > +module_platform_driver(rcar_cmm_platform_driver);
> > > > +
> > > > +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org>");
> > > > +MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
> > > > +MODULE_LICENSE("GPL v2");
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/r=
car-du/rcar_cmm.h
> > > > new file mode 100644
> > > > index 000000000000..b0bb7349ebaa
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > > > @@ -0,0 +1,38 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +/*
> > > > + * rcar_cmm.h -- R-Car Display Unit Color Management Module
> > > > + *
> > > > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > + */
> > > > +
> > > > +#ifndef __RCAR_CMM_H__
> > > > +#define __RCAR_CMM_H__
> > > > +
> > > > +#define CMM_GAMMA_LUT_SIZE		256
> > > > +
> > > > +struct drm_color_lut;
> > > > +struct platform_device;
> > > > +
> > > > +/**
> > > > + * struct rcar_cmm_config - CMM configuration
> > > > + *
> > > > + * @lut:	1D-LUT configuration
> > > > + * @lut.enable:	1D-LUT enable flag
> > > > + * @lut.table:	1D-LUT table entries
> > > > + * @lut.size:	Number of 1D-LUT (max 256)
> > >
> > > s/1D-LUT/1D-LUT entries/
> >
> > ack, I'll change this.
> >
> > > > + */
> > > > +struct rcar_cmm_config {
> > > > +	struct {
> > > > +		bool enable;
> > > > +		struct drm_color_lut *table;
> > > > +		unsigned int size;
> > > > +	} lut;
> > > > +};
> > > > +
> > > > +int rcar_cmm_enable(struct platform_device *pdev);
> > > > +void rcar_cmm_disable(struct platform_device *pdev);
> > > > +
> > > > +int rcar_cmm_setup(struct platform_device *pdev,
> > > > +		   const struct rcar_cmm_config *config);
> > > > +
> > > > +#endif /* __RCAR_CMM_H__ */
>
> --
> Regards,
>
> Laurent Pinchart

--vshdzxkdbqvaeroa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1w3CQACgkQcjQGjxah
VjzbIA/+LgrHbVxVTWMGN8f6AHtJaz4hhI9TQWewAwIjx9A/ZfvtxpOlUVgEXkgM
XYSEtFdQoxhXGIXlkHsoX/G04DXT63OMWJAI153DwYZ+qyiiA2IDrlmHh6BaOEk3
aCLg8esrmjomnStfifVvMHcFQ1owXKhfYOG+kZZctZtk7TCZb99zwNVsjgAeXgsl
1sFocg85PcAFwFv5Lr/ogF+AKa0485rp0tdqMAFrgTojXIiaCNL3VaV+YaydEu6+
EZv66QkqdtFcEYnAxswhNvH7GZ9EO0at7OYQccWRIU+yUgVJbAG6rqJkEQGGRzP+
0IT8thyCUOHLoc+Sh6oC9b2rMVPEBS9YWilH4IU0jQqtor1wIdhgZ/P6TBSiBYJk
+1ADPtK1+owL394Lva9X2J9VgSnpLaOdC7CV4RZZ6Dl0MfN9BiFUQVFAGnk74Rp+
utBTCoWaSsS4kSi6hHYD9bgXyQWHNR8G8L5SjKRyT9m+LENcUz/6oosMn1xVtdRn
VJq4voe+YnBhSBIyx20lfBgZyHNCxXianabJ2G1IjuZFcXWdAVmgXCFt3iukY25C
EXcsGAmLcOwhgGQQ6y2Unm5oKeexNDT20Vi5TcPwOTh8PF6P/Knu9iXYvYLjsl+k
F67nZC9pjbsqE01RVGJM6FBTywThYOxvgrQCdtNZdpqcpvWEElU=
=2dT/
-----END PGP SIGNATURE-----

--vshdzxkdbqvaeroa--

--===============1977165461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1977165461==--
