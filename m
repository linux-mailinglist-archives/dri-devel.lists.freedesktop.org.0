Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48376224D42
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 19:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BC188B6C;
	Sat, 18 Jul 2020 17:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFA488B6C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 17:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5B64DFB03;
 Sat, 18 Jul 2020 19:14:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZrIF0sHGSa6; Sat, 18 Jul 2020 19:14:08 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BF41542576; Sat, 18 Jul 2020 19:14:07 +0200 (CEST)
Date: Sat, 18 Jul 2020 19:14:07 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/mxsfb: Make supported modifiers explicit
Message-ID: <20200718171407.GA72952@bogon.m.sigxcpu.org>
References: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
 <d39209a3664179f895a7dfabbd02d27a6adb9895.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d39209a3664179f895a7dfabbd02d27a6adb9895.camel@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Mar 23, 2020 at 04:51:05PM +0100, Lucas Stach wrote:
> Am Montag, den 23.03.2020, 15:52 +0100 schrieb Guido G=FCnther:
> > In contrast to other display controllers on imx like DCSS and ipuv3
> > lcdif/mxsfb does not support detiling e.g. vivante tiled layouts.
> > Since mesa might assume otherwise make it explicit that only
> > DRM_FORMAT_MOD_LINEAR is supported.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> =

> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Can i do anything to get this applied?
Cheers,
 -- Guido

> =

> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/=
mxsfb_drv.c
> > index 762379530928..fc71e7a7a02e 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -73,6 +73,11 @@ static const uint32_t mxsfb_formats[] =3D {
> >  	DRM_FORMAT_RGB565
> >  };
> >  =

> > +static const uint64_t mxsfb_modifiers[] =3D {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	DRM_FORMAT_MOD_INVALID
> > +};
> > +
> >  static struct mxsfb_drm_private *
> >  drm_pipe_to_mxsfb_drm_private(struct drm_simple_display_pipe *pipe)
> >  {
> > @@ -334,8 +339,8 @@ static int mxsfb_load(struct drm_device *drm, unsig=
ned long flags)
> >  	}
> >  =

> >  	ret =3D drm_simple_display_pipe_init(drm, &mxsfb->pipe, &mxsfb_funcs,
> > -			mxsfb_formats, ARRAY_SIZE(mxsfb_formats), NULL,
> > -			mxsfb->connector);
> > +			mxsfb_formats, ARRAY_SIZE(mxsfb_formats),
> > +			mxsfb_modifiers, mxsfb->connector);
> >  	if (ret < 0) {
> >  		dev_err(drm->dev, "Cannot setup simple display pipe\n");
> >  		goto err_vblank;
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
