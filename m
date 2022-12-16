Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CC64EBC3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 14:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1110E5CA;
	Fri, 16 Dec 2022 13:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F41210E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:59:58 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p6AJf-0001D7-T8; Fri, 16 Dec 2022 13:59:55 +0100
Message-ID: <a588f3e4f943a011497eefcd00be35d598c0e2b0.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: move IPUv3 driver into separate subdirectory
From: Lucas Stach <l.stach@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 16 Dec 2022 13:59:54 +0100
In-Reply-To: <20221216120352.7ke5msphsqfybagb@pengutronix.de>
References: <20221125112519.3849636-1-l.stach@pengutronix.de>
 <20221216120352.7ke5msphsqfybagb@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 patchwork-lst@pengutronix.de, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 16.12.2022 um 13:03 +0100 schrieb Uwe Kleine-K=C3=B6nig:
> On Fri, Nov 25, 2022 at 12:25:19PM +0100, Lucas Stach wrote:
> > diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefil=
e
> > index b644deffe948..909622864716 100644
> > --- a/drivers/gpu/drm/imx/Makefile
> > +++ b/drivers/gpu/drm/imx/Makefile
> > @@ -1,12 +1,4 @@
> > [...]
> >  obj-$(CONFIG_DRM_IMX_DCSS) +=3D dcss/
> > +obj-$(CONFIG_DRM_IMX) +=3D ipuv3/
>=20
> I wonder if it would make sense to rename DRM_IMX to DRM_IMX_IPUV3 ?!

The driver will still called imx-drm in the DRM driver name. We can not
change this without breaking the UAPI. Even though in hindsight imx-drm
was a way too generic name, I don't think renaming the Kconfig symbol
or even the driver is worth it as it would lead to more confusion in
the end.

Regards,
Lucas

>=20
> > diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ip=
uv3/Kconfig
> > new file mode 100644
> > index 000000000000..f518eb47a18e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> > [...]
> > +config DRM_IMX_HDMI
> > +	tristate "Freescale i.MX DRM HDMI"
> > +	select DRM_DW_HDMI
> > +	depends on DRM_IMX && OF
> > +	help
> > +	  Choose this if you want to use HDMI on i.MX6.
> > +
>=20
> Trailing empty line could be dropped.
>=20
> Best regards
> Uwe
>=20

