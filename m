Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EE7D7E17
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3E10E776;
	Thu, 26 Oct 2023 08:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E910E775
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 08:07:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99C1561C54;
 Thu, 26 Oct 2023 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C32C433C8;
 Thu, 26 Oct 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698307663;
 bh=MRgZsiUVmIfZKqCwNfNZ0a7KfMg57CWlHCRug7dRYiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h4BZUaWNpPw0JlhG/Aqlkb6iJ3x6gBmrkWVdvfMKm1Vcpsx5D2OFmlCecVVOI60pS
 MPEMTlRIOMTF+mBiaE1Kkjwm6SPOPTJzk7p18x/eSJOtErkRe986WGLnOOiT7j42No
 J2WvuZscQ3o9v89HAWZpvH+SRgCprj9P55k1XTNCKICa39ZENF+0lFSwT3IISmBi7H
 pkL87DzM9AOHRtDt5HgVxkXv74Q2K8zYYnRCc107VAY40bm/myYUM3IqHF/9GfYBtZ
 RJ0YUxhTJdrGN8uP0MC3FE+Rt/4/7h6yprElSn+8KGiRYr2g/JfZ3LHj7wusiScWrG
 zEUttswk1AJJg==
Date: Thu, 26 Oct 2023 10:07:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l2pgpleihh7nbgyu"
Content-Disposition: inline
In-Reply-To: <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--l2pgpleihh7nbgyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > +static int starfive_hdmi_register(struct drm_device *drm, struct starf=
ive_hdmi *hdmi)
> > +{
> > +	struct drm_encoder *encoder =3D &hdmi->encoder;
> > +	struct device *dev =3D hdmi->dev;
> > +
> > +	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_n=
ode);
> > +
> > +	/*
> > +	 * If we failed to find the CRTC(s) which this encoder is
> > +	 * supposed to be connected to, it's because the CRTC has
> > +	 * not been registered yet.  Defer probing, and hope that
> > +	 * the required CRTC is added later.
> > +	 */
> > +	if (encoder->possible_crtcs =3D=3D 0)
> > +		return -EPROBE_DEFER;
> > +
> > +	drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> > +
> > +	hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> > +
> > +	drm_connector_helper_add(&hdmi->connector,
> > +				 &starfive_hdmi_connector_helper_funcs);
> > +	drmm_connector_init(drm, &hdmi->connector,
> > +			    &starfive_hdmi_connector_funcs,
> > +			    DRM_MODE_CONNECTOR_HDMIA,
>=20
> On an embedded device one can not be so sure. There can be MHL or HDMI
> Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector.

On an HDMI driver, it's far from being a requirement, especially given
the limitations bridges have.

Maxime

--l2pgpleihh7nbgyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZToeTAAKCRDj7w1vZxhR
xQohAPsE2kzpXlr9RqQPDtJRNj8AtNNrqzpApALpLI553biaLgD/RpyXbzEyRIo3
cDu23rmpQ4eOQdldwjqobLYIqhayago=
=B4HD
-----END PGP SIGNATURE-----

--l2pgpleihh7nbgyu--
