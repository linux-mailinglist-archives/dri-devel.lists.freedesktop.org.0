Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B710A14D73
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1210E2FB;
	Fri, 17 Jan 2025 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ujh/o19S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950410E2FB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F2BAA41F5F;
 Fri, 17 Jan 2025 10:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D95DC4CEDF;
 Fri, 17 Jan 2025 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737109421;
 bh=jSwb2wZFFYhuuFvDBoxLHK554RSrZreFZDxgoQ2J7R8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ujh/o19S6Vqu1kuMTO8hRnxKfWHi4+Xct04NzVhA2lyP8EBYpayiCnvepWWIIzt5N
 XqBYEop5QaigJC4ZfkfwgIuvUi4i7JrUR7AY+1ZwHpXJeiypf0o1vHCr/4G3Vu+m3m
 08q8EY6HSrsuqj5hZjGHsLZHfVHOY4b43+04aliZldi2eyjB+vnhNMaumEd8B/0cZO
 Fu739I247+6CnJMcp8fjXJs9DlZ5HEEt08tgKqBJ0amk1Zqq4aslWWIkAumO7NaM1R
 htvBgb3IgzW7E0P2ebA3gk9MZv85IzCElOoKc27DR4+uFybMQQJvc9IVwXdP+nyijO
 dyij3wJUF0/qw==
Date: Fri, 17 Jan 2025 11:23:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-bright-passionate-ibis-804a8a@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zxxlu2wrbjxf7qrg"
Content-Disposition: inline
In-Reply-To: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
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


--zxxlu2wrbjxf7qrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

Hi,

On Thu, Jan 16, 2025 at 07:52:30PM +0100, Sasha Finkelstein wrote:
> On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +     ret =3D drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_EN=
CODER_DSI);
> >
> > This is being deprecated, please use drm_encoder_init() /
> > drmm_encoder_init() instead.
>=20
> I seem to be unable to find any documentation or a mailing list post
> to this effect. If you are referring to this patchset:
> https://patchwork.kernel.org/project/linux-samsung-soc/patch/202003132017=
44.19773-3-sam@ravnborg.org/
> according to my understanding, it has not been applied.
> In this case, the simple encoder api provides all functionality i need,
> and a replacement would just be a simple encoder, except copied and pasted
> into this driver.

a drmm_encoder_(alloc|init)'d encoder with a NULL funcs pointer is
strictly equivalent and doesn't require any extra infrastructure or work
on your side compared to what you have here.

> > > +static void adp_remove(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct drm_device *drm =3D dev_get_drvdata(dev);
> > > +     struct adp_drv_private *adp =3D to_adp(drm);
> > > +
> > > +     adp_disable_vblank(adp);
> >
> > Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> > after DRM device unregistration and shutdown.
>=20
> Not sure i follow, as this call disables generation of vblank interrupts,
> shouldn't it be done before all drm structures are torn down, to prevent
> the interrupt handler from potentially operating on objects that are in
> an invalid state?

Your adp_crtc_atomic_disable() function calls drm_crtc_vblank_off()
already. drm_atomic_helper_shutdown() will call the CRTC disable hook if
relevant, so you're effectively disabling vblank twice here.

Maxime

--zxxlu2wrbjxf7qrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovpgAKCRAnX84Zoj2+
dl/PAYCi6eiO7nJHixv6cIn7PybRAsm1pSznLtuB/wQE6J2GK7apdsfDdL8u9qWw
Mda3RRsBgIBwNFvsUc+ukeNozHhxEQcjinnckbPigAQcK0ltVOYGaD+kpoiteW0y
yiwJc/mqQg==
=Uyb0
-----END PGP SIGNATURE-----

--zxxlu2wrbjxf7qrg--
