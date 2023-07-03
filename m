Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51133745640
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7908410E188;
	Mon,  3 Jul 2023 07:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A7110E0B5;
 Mon,  3 Jul 2023 07:42:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b699a2fe86so67061331fa.3; 
 Mon, 03 Jul 2023 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688370176; x=1690962176;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1fo/4xJmI/v8Apxv9iZE5rA9bnr+7LUJRY6uhOPxrs=;
 b=XTuXbF9NC0ZLUFLxZHbCrh3BmMosYZaCcPoeLni+PwhvONO2MBefRwIVdNhR75bJKG
 XwZKEo9RjfCO7OaaiKzfTjv7G9R17HRp6865LFsLPbmgEc4c1ju6/W9CIOzeuvxOp3im
 IRhzqK25pn8mJWiUqycZyFM/wAT24ZmeUrQaE5kt+P71VKOl4Yl7aqkS4Mw6Vr8WElKy
 lUoWAojpHSEyjyXzzCrdbUWhothijb5FFlUGYgKjbmF4NL3VOmX3/gM4WrEuIximSsrn
 egoeVN2r20c+4kVR/tD+nan5IcPTGaHA46PrObKU8JfE634aoogYUPucgBf066n8gZOh
 XJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688370176; x=1690962176;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1fo/4xJmI/v8Apxv9iZE5rA9bnr+7LUJRY6uhOPxrs=;
 b=MpIJfG59+ERhP4P9KxkdnZuRlgfufU8l8aiA3kp1+kxZTTC2lQYqnl/itUA516n5d/
 N3aH60fYI9jK4MxcOhgn9H3cfE7syL3zlOi8aDczdgNYk311Bz+K6EgeGOO4RTsQnAZ0
 KmRSwAVo3dZ5aqmBGXS1gl6ufi0gst8JQ33G6ZTN3IsK0nIok2oiTqsrsuPpiickeK86
 1FLucB16ZV2kBZHy+23PdT9HH+2OFR9eZ0fPuMzxeo5iuT5oHuZhTAaGFhgB+8C9rqvp
 RK0VwmILxUZ5MzTDWyNWCha/Ahpb76yGkpTkB+KYOKP1qhml0ZgaOVWbT3oQtPG289qQ
 CNeg==
X-Gm-Message-State: ABy/qLZr0dG7SZVXU1nv/K0/oRHz+c9v5ywKmmaYW49bgIVSTJzTfuKH
 9VvuoXpGmAguUrPtUjnybCw=
X-Google-Smtp-Source: APBJJlEihHpYEQV3HBBUGCrGICtVF/Y3mrZuaF6KRazeMHpNXruNvJsym66J/DOXgm+zAeWs8K9cRw==
X-Received: by 2002:a2e:900e:0:b0:2b6:e121:cf68 with SMTP id
 h14-20020a2e900e000000b002b6e121cf68mr2760105ljg.5.1688370176174; 
 Mon, 03 Jul 2023 00:42:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o6-20020a2e7306000000b002b6e77e87fcsm704378ljc.68.2023.07.03.00.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 00:42:55 -0700 (PDT)
Date: Mon, 3 Jul 2023 10:42:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
Message-ID: <20230703104246.7226953a@eldfell>
In-Reply-To: <20230630112649.263331b4@eldfell>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
 <20230630112649.263331b4@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=0TNTkoqRYefLA_rwhlpF9P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=0TNTkoqRYefLA_rwhlpF9P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jun 2023 11:26:49 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Thu, 29 Jun 2023 17:25:06 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>=20
> > Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
> > determine if the plane is solid fill. In addition drop the DPU plane
> > color_fill field as we can now use drm_plane_state.solid_fill instead,
> > and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
> > allow userspace to configure the alpha value for the solid fill color.
> >=20
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 4476722f03bb..11d4fb771a1f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -42,7 +42,6 @@
> >  #define SHARP_SMOOTH_THR_DEFAULT	8
> >  #define SHARP_NOISE_THR_DEFAULT	2
> > =20
> > -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
> >  #define DPU_ZPOS_MAX 255
> > =20
> >  /*
> > @@ -82,7 +81,6 @@ struct dpu_plane {
> > =20
> >  	enum dpu_sspp pipe;
> > =20
> > -	uint32_t color_fill;
> >  	bool is_error;
> >  	bool is_rt_pipe;
> >  	const struct dpu_mdss_cfg *catalog;
> > @@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct dpu_=
plane_state *pstate,
> >  	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
> >  }
> > =20
> > +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_=
fill)
> > +{
> > +	uint32_t ret =3D 0;
> > +
> > +	ret |=3D ((uint8_t) solid_fill.b) << 16;
> > +	ret |=3D ((uint8_t) solid_fill.g) << 8;
> > +	ret |=3D ((uint8_t) solid_fill.r); =20
>=20
> solid_fill.r, g and b are uint32_t, yes?
>=20
> What's the value encoding in the UAPI? That doc was missing.
>=20
> I wouldn't expect the UAPI to use 32-bit variables if it was
> essentially 8-bit, so this conversion looks wrong.
>=20
> Nominal color value 1.0 in u8 is 0xff. The same in u32 is probably
> 0xffffffff? So a simple cast to u8 won't work. You'd want to take the
> upper 8 bits instead.
>=20
>=20
> Thanks,
> pq
>=20
> > +
> > +	return ret;

Btw. if your driver format is ABGR, then this function leaves alpha as
zero. That's confusing.

It would be nice to mention the exact pixel format in the function name
so the consistency is easier to check in both here and in callers.


Thanks,
pq

> > +}
> > +
> >  /**
> >   * _dpu_plane_color_fill - enables color fill on plane
> >   * @pdpu:   Pointer to DPU plane object
> > @@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
> >  	if (pdpu->is_error)
> >  		/* force white frame with 100% alpha pipe output on error */
> >  		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> > -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> > -		/* force 100% alpha */
> > -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> > +	else if (drm_plane_solid_fill_enabled(plane->state))
> > +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->=
solid_fill),
> > +				plane->state->alpha);
> >  	else {
> >  		dpu_plane_flush_csc(pdpu, &pstate->pipe);
> >  		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> > @@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct drm=
_plane *plane,
> >  	}
> > =20
> >  	/* override for color fill */
> > -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> > +	if (drm_plane_solid_fill_enabled(plane->state)) {
> >  		_dpu_plane_set_qos_ctrl(plane, pipe, false);
> > =20
> >  		/* skip remaining processing on color fill */
> >  =20
>=20


--Sig_/=0TNTkoqRYefLA_rwhlpF9P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSie/YACgkQI1/ltBGq
qqdvWg/+IUlRh8UhRQkQoJS25uUvPZS8VcXCmrgzoWzMxdliGqBuuBZYtX4eY1gZ
3E1nEhYylI4RoAF6JuNzoHaegBpK8TmFcx60sj1Y8WQnH6DlWni3FsF/+4T9jwbn
IZDcOl3oihEsOPZgtbHvnpJgpqyVrGG+C7hVIvlLK4j8ngn1FC9aj63mTlluInlS
ER82vqXHRw+QXOYiyj2XmrylS36mXTambq0iJKYQLLIEz0hJvN6ZEBjd06GZWJTW
8R24cX6zSTNC9jY4F7aL21i8eUqLLa79/lYQ+kkv28ClsH2xZGr2R2+KiaDVOYaR
7n74EWWIMyt/f2XYdkzM2K+TMF6P61/CZy9nfW74YeoPadI4oJV5x2Sta3RqtqPH
TpUmikI9n+LwSEqDjXGmxbI+/xAqt5sfpS0wgBH11tD7R0f41LB98aw6zPcxlR4e
n4Rvdpow8UpOZv7WSXkLjkU0qto8DOEHANhCUBPFwuqybjlPjvi7w0dNSs7K32xj
BQiDoBOz2c+8tfpo3KqjJmkxk0r/E0wDwqIh/N/j8Uit6mmbPH62lkwZYLLBkOkg
mPMDAB8wj1lHazzbGJnvTCCXnsWlNv1eNWGelRHlGFaL7DuQPRZReU1SDfjhU2sH
+DXeGFF7jsTt1Muzt/ol9LhgrHTWsP5N1DtGWayklopgc9nZhJU=
=OtQx
-----END PGP SIGNATURE-----

--Sig_/=0TNTkoqRYefLA_rwhlpF9P--
