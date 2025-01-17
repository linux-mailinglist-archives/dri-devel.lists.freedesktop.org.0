Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2AA14D76
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E90010EADD;
	Fri, 17 Jan 2025 10:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XDjUHGhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBDD10EAD1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:24:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A01C5A42B7D;
 Fri, 17 Jan 2025 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC5C4CEDD;
 Fri, 17 Jan 2025 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737109440;
 bh=qzAn1c/k3kESKkXWElYSoijsx7SCYZrltfmSf6A/EVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XDjUHGhhhcftUMtpezf3hANBIPaphR7bvOodUfMNOQC3CJvXfvE6GD6bxwbkuMCLG
 Wes4Ua1XkqLVQMPJwwSs7eruwdSp4QjWHRm2AqWeWiy25ulPhrtg0j2N9cy6sdy7Z1
 Wkq68kBM8c4815iOQVTeQGND6oftcloYIHHcWBnhCqAPotfhQA4chEkydW637taHgr
 gIdN5oyxoYp7KOcOVkKXwGxCvU1xuaZqe4P6L3A0dejnb58pkzHf9xQXggiXoxdmuJ
 DjLsfJmcYRaICdnPOek/a70S+y6avH1c00b7lYidwwZbRkoNjUJPxTu4tfv+Zsh7fH
 issgUmelDZaag==
Date: Fri, 17 Jan 2025 11:23:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-neon-unicorn-of-plenty-bbe639@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vrjre4lk5dsy5ds3"
Content-Disposition: inline
In-Reply-To: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
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


--vrjre4lk5dsy5ds3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 05:43:57AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> > Hi Dmitry,
> >=20
> > On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Re=
lay wrote:
> > > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > > +			       struct mipi_dsi_device *dev)
> > > > +{
> > > > +	struct adp_mipi_drv_private *adp =3D mipi_to_adp(host);
> > > > +	struct drm_bridge *next;
> > > > +
> > > > +	next =3D devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_no=
de, 1, 0);
> > >=20
> > > select DRM_PANEL_BRIDGE for this API to be available.
> > > Also there is an issue of lifetimes. The bridge will be destroyed only
> > > when MIPI driver is unbound, however the panel can be attached and
> > > detached several times.
> >=20
> > Can you expand on that one a bit more? AFAIK, it's always been unsafe
> > and we don't have a good mitigation at the moment, so it's unclear to me
> > what change you want here.
>=20
> I was thinking about using drmm_ here, as the DRM device is also created
> and destroyed each time. But I might be mistaken here.

Ah, right, it makes sense then, thanks!
Maxime

--vrjre4lk5dsy5ds3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovvAAKCRAnX84Zoj2+
drc7AX4lqVMGAHarEVIA1Pcn9ke3TjmZj9h/0P1cE1+WwL9tu59subgCIKYEEgjn
Aw9JlO0BgJrqHXIvHGhiKj6/R5jZ/CPGL5hq7c6TtHTEuGuvElaI8g5bkBCei1SG
lE8HfloWLQ==
=lUDV
-----END PGP SIGNATURE-----

--vrjre4lk5dsy5ds3--
