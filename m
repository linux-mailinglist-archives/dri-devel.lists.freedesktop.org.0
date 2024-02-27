Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CB868FAF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 13:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9E910E48A;
	Tue, 27 Feb 2024 12:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rPcOhAiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB010E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 12:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D20661539;
 Tue, 27 Feb 2024 12:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9B4C43390;
 Tue, 27 Feb 2024 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709035697;
 bh=ACaz7oj5ReqFoIR72ebNJXl994t4BOU7shgO5K8CUjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPcOhAiN2PtkNLYRBMqmRiMbDR6p59SbOgdUHY6MdY/GfepvdtHrN4RR9v1sZYqf6
 jGI2QQj99JWnXpmDj76LwUn5WOEnN2l8plI/Woy9JymhacQ8VopW5b3x8MDmW6BR3I
 1mhXEPNwYTypLA8EvT5QrKq5WyQSqfjz/WuF4zmZbFCzvBEEroimeIedS523uwhWc0
 uq2irP6Mmsab/1y0zyVOZI3iqcQ1Tt+elVYtsRMaL5qiHIHNgePfxDPrjcFVWcmbyP
 nzPJdHwMz3keyVrdNrECnvtckEFIcLNcawWXousAOSunIXQ/sdzf7RMhsqiuz0ENoH
 NKhxbGiV9gDEw==
Date: Tue, 27 Feb 2024 13:08:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 25/36] drm/connector: hdmi: Add Infoframes generation
Message-ID: <lxvyfigepzg4jhqub6lg6lmffen4puf477zjxmi766f3hu6trn@nnvg6htufsjn>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-25-8f4af575fce2@kernel.org>
 <CAA8EJpri_whY8YfX2BsBjMN_4JvFsU-ogfr1W-KUKrasRoH-WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ocit6yam46alzc5t"
Content-Disposition: inline
In-Reply-To: <CAA8EJpri_whY8YfX2BsBjMN_4JvFsU-ogfr1W-KUKrasRoH-WQ@mail.gmail.com>
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


--ocit6yam46alzc5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 05:02:51PM +0200, Dmitry Baryshkov wrote:
> > @@ -476,6 +478,7 @@ EXPORT_SYMBOL(drmm_connector_init);
> >   */
> >  int drmm_connector_hdmi_init(struct drm_device *dev,
> >                              struct drm_connector *connector,
> > +                            const char *vendor, const char *product,
> >                              const struct drm_connector_funcs *funcs,
> >                              const struct drm_connector_hdmi_funcs *hdm=
i_funcs,
> >                              int connector_type,
> > @@ -485,6 +488,13 @@ int drmm_connector_hdmi_init(struct drm_device *de=
v,
> >  {
> >         int ret;
> >
> > +       if (!vendor || !product)
> > +               return -EINVAL;
> > +
> > +       if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
> > +           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> > +               return -EINVAL;
> > +
> >         if (!(connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> >               connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> >                 return -EINVAL;
> > @@ -500,6 +510,12 @@ int drmm_connector_hdmi_init(struct drm_device *de=
v,
> >                 return ret;
> >
> >         connector->hdmi.supported_formats =3D supported_formats;
> > +       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> > +       strtomem_pad(connector->hdmi.product, product, 0);
> > +
> > +       ret =3D drmm_mutex_init(dev, &connector->hdmi.infoframes.lock);
>=20
> I'd suggest moving this call to the generic __drm_connector_init().
> This way no matter how the rest of the drm code (mis)uses the
> connector, the lock is always present and valid.

Yeah, that makes sense, I'll change it.

Thanks!
Maxime

--ocit6yam46alzc5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd3QrgAKCRDj7w1vZxhR
xUw4AQDY/7kZ7wFpO+/Ak/W0YWywU3LNZ5pkN4Om9GBNtAUK6wD/YV9OiFjDhmlL
sW/aBGeDNa/yzjkkc0NKa5D6dGQe5Qc=
=FJc2
-----END PGP SIGNATURE-----

--ocit6yam46alzc5t--
