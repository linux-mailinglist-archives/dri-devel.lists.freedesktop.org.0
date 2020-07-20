Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C92258A0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3E86E140;
	Mon, 20 Jul 2020 07:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7889FAC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:31:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so21218972wmg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 00:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=OVJCr1m5cczEE11Y4OrOEI2+d5VysNb+avvmYGzz5EQ=;
 b=c2blEXv0PV3Forf/ih8O0N/mHD2GxHU2L/pCRcwYxPtM45rL0mRfdPLxH55yIKq/hQ
 A9wJ6pwhd6rMsNEnULADCT0fxYXXijggxfgpwa+AOCL8LW2a6O1iVuYlDSBFXV3uqekV
 OdRhqh8OBMAJvnxn57iZOwlGdigLtnkVQMBpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=OVJCr1m5cczEE11Y4OrOEI2+d5VysNb+avvmYGzz5EQ=;
 b=ENHHpitYaNxTudHMKkpyDxYOTAdv1RKi98HVDJKYAVE9zyeDB+ZuFV4QIbWrXxsNGL
 +KRLF5ThAqGyei8HEcxl09uo+snlbrTChxSbHkDeugBrgJaEHFZvSBkOS6gwecuimbte
 RQTFX0zfF51T4W5qnSQr+IUtMPrG25mg8Vtr9hVAW8d+eBcllIaDWnNV49AS7bmGydP7
 8AEYlwqIMrjaSQRbQc5V0/mC1QHoiiabc8MeF/NovsNc3eVsej0iwTA/0rxHWMtmx226
 FjKJ+V+X3eshMt7jZXhPxtv3aUbYnNlYqfqSbuV5iFxzb1bS5zzOO6WO8AyN1fCdVGJJ
 U2rQ==
X-Gm-Message-State: AOAM532dizWCiqH0FKQIFTRtV/h5YD6OPJJedf9FWfIJE0/iedjYI2cH
 vLOdlyu3olMh0PmSFLl14Vsoxg==
X-Google-Smtp-Source: ABdhPJxN7p0owcN96PIeSqEMA5x15Cm1uEAARNlBA5eLxTQA3ETt1N2u3muHoio5moLJDyia7v05Vw==
X-Received: by 2002:a1c:48e:: with SMTP id 136mr19492056wme.164.1595230274849; 
 Mon, 20 Jul 2020 00:31:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h11sm7051935wrb.68.2020.07.20.00.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 00:31:14 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:31:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] drm/mxsfb: Make supported modifiers explicit
Message-ID: <20200720073112.GU3278063@phenom.ffwll.local>
Mail-Followup-To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
 <d39209a3664179f895a7dfabbd02d27a6adb9895.camel@pengutronix.de>
 <20200718171407.GA72952@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718171407.GA72952@bogon.m.sigxcpu.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Sat, Jul 18, 2020 at 07:14:07PM +0200, Guido G=FCnther wrote:
> Hi,
> On Mon, Mar 23, 2020 at 04:51:05PM +0100, Lucas Stach wrote:
> > Am Montag, den 23.03.2020, 15:52 +0100 schrieb Guido G=FCnther:
> > > In contrast to other display controllers on imx like DCSS and ipuv3
> > > lcdif/mxsfb does not support detiling e.g. vivante tiled layouts.
> > > Since mesa might assume otherwise make it explicit that only
> > > DRM_FORMAT_MOD_LINEAR is supported.
> > > =

> > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > =

> > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> =

> Can i do anything to get this applied?
> Cheers,

Lucas has drm-misc commit rights, I expect him to push.
-Daniel

>  -- Guido
> =

> > =

> > > ---
> > >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsf=
b/mxsfb_drv.c
> > > index 762379530928..fc71e7a7a02e 100644
> > > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > > @@ -73,6 +73,11 @@ static const uint32_t mxsfb_formats[] =3D {
> > >  	DRM_FORMAT_RGB565
> > >  };
> > >  =

> > > +static const uint64_t mxsfb_modifiers[] =3D {
> > > +	DRM_FORMAT_MOD_LINEAR,
> > > +	DRM_FORMAT_MOD_INVALID
> > > +};
> > > +
> > >  static struct mxsfb_drm_private *
> > >  drm_pipe_to_mxsfb_drm_private(struct drm_simple_display_pipe *pipe)
> > >  {
> > > @@ -334,8 +339,8 @@ static int mxsfb_load(struct drm_device *drm, uns=
igned long flags)
> > >  	}
> > >  =

> > >  	ret =3D drm_simple_display_pipe_init(drm, &mxsfb->pipe, &mxsfb_func=
s,
> > > -			mxsfb_formats, ARRAY_SIZE(mxsfb_formats), NULL,
> > > -			mxsfb->connector);
> > > +			mxsfb_formats, ARRAY_SIZE(mxsfb_formats),
> > > +			mxsfb_modifiers, mxsfb->connector);
> > >  	if (ret < 0) {
> > >  		dev_err(drm->dev, "Cannot setup simple display pipe\n");
> > >  		goto err_vblank;
> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
