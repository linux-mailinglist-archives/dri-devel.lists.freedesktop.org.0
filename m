Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF437E375C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864B10E080;
	Tue,  7 Nov 2023 09:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607B10E080
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:19:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A83C61171;
 Tue,  7 Nov 2023 09:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE03C433C8;
 Tue,  7 Nov 2023 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699348767;
 bh=VDrXsVNkm+N8iNlJC3ZwEH4c+vJY+PF2deM4StXlHO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYHtnTJnvG6VbnZXS27Xlyz8fAbAUOKKK+C0hD/yaEtP3hsK1Ft/lHn10pWx8x1ar
 lvK7xSDqD7EuZfakWhLeb+ssDHh2t/ywB0jfMWGhw0gQ7PD0kmMLqM52eTbYssUDAU
 0b+6+E6otlZyPvBUDvMpMsvMC80povFl+2nQNBvX7nCWH+5ucojPZNMfaeK1Z076i8
 Mk3Y3AaVvEcXbmZ1safxJou7RShM8a6rP+ur+hRMrkOU4u4ojoBlei0eTHmSOB9+eG
 PxF2bIabLg/DSeV0GPKgiGapHIOaZLvAViYf+VDWadCax+CBHM6PCRQZyguJRXGzRG
 b8tJ6WJhB2NUA==
Date: Tue, 7 Nov 2023 10:19:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <rx7oxrxs6dgwdkdu4l7y74yek4656jejixzccryml6jl6t5elp@jvk7agdcljwg>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
 <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
 <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
 <CAA8EJpomaDoJVkq+_NhcxqOs6X-dFd=Vo9Wtqnp8egNaWzDH2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sx3kokd2nvv34uc7"
Content-Disposition: inline
In-Reply-To: <CAA8EJpomaDoJVkq+_NhcxqOs6X-dFd=Vo9Wtqnp8egNaWzDH2Q@mail.gmail.com>
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


--sx3kokd2nvv34uc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 29, 2023 at 06:52:24PM +0200, Dmitry Baryshkov wrote:
> On Thu, 26 Oct 2023 at 14:53, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Oct 26, 2023 at 11:57:22AM +0300, Dmitry Baryshkov wrote:
> > > On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >
> > > > On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > > > > +static int starfive_hdmi_register(struct drm_device *drm, stru=
ct starfive_hdmi *hdmi)
> > > > > > +{
> > > > > > +   struct drm_encoder *encoder =3D &hdmi->encoder;
> > > > > > +   struct device *dev =3D hdmi->dev;
> > > > > > +
> > > > > > +   encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm,=
 dev->of_node);
> > > > > > +
> > > > > > +   /*
> > > > > > +    * If we failed to find the CRTC(s) which this encoder is
> > > > > > +    * supposed to be connected to, it's because the CRTC has
> > > > > > +    * not been registered yet.  Defer probing, and hope that
> > > > > > +    * the required CRTC is added later.
> > > > > > +    */
> > > > > > +   if (encoder->possible_crtcs =3D=3D 0)
> > > > > > +           return -EPROBE_DEFER;
> > > > > > +
> > > > > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_help=
er_funcs);
> > > > > > +
> > > > > > +   hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> > > > > > +
> > > > > > +   drm_connector_helper_add(&hdmi->connector,
> > > > > > +                            &starfive_hdmi_connector_helper_fu=
ncs);
> > > > > > +   drmm_connector_init(drm, &hdmi->connector,
> > > > > > +                       &starfive_hdmi_connector_funcs,
> > > > > > +                       DRM_MODE_CONNECTOR_HDMIA,
> > > > >
> > > > > On an embedded device one can not be so sure. There can be MHL or=
 HDMI
> > > > > Alternative Mode. Usually we use drm_bridge here and drm_bridge_c=
onnector.
> > > >
> > > > On an HDMI driver, it's far from being a requirement, especially gi=
ven
> > > > the limitations bridges have.
> > >
> > > It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
> > > are not widely used in the wild and are mostly non-existing except
> > > several phones that preate wide DP usage.
> >
> > And those can be supported without relying on bridges.
>=20
> Yes, they likely can, in the way that nouveau handles I2C TV encoders.
> But I don't think this can scale. We can have different devices
> attached to the DSI, LVDS, HDMI and even DP image sources. I don't see
> a scalable solution for either of them. E.g. by switching drm/msm to
> use panel bridges for DSI panels we were able to significantly unify
> and simplify code paths.

I'm glad it worked fine for drm/msm, but what I don't really like is the
current dogma that *everything* should be a bridge, and that's just a
poor guideline.

> > > Using drm_connector directly prevents one from handling possible
> > > modifications on the board level. For example, with the DRM connector
> > > in place, handling a separate HPD GPIO will result in code duplication
> > > from the hdmi-connector driver. Handling any other variations in the
> > > board design (which are pretty common in the embedded world) will also
> > > require changing the driver itself. drm_bridge / drm_bridge_connector
> > > save us from those issues.
> >
> > And we have other solutions there too. Like, EDIDs are pretty much in
> > the same spot with a lot of device variations, but it also works without
> > a common driver. I'd really wish we were having less bridges and more
> > helpers, but here we are.
> >
> > > BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
> > > asking because we heavily depend on the bridge infrastructure for HDMI
> > > output. Maybe we are missing something there, which went unnoticed to
> > > me and my colleagues.
> >
> > A bridge cannot extend the connector state or use properties, for
> > example. It works for basic stuff but falls apart as soon as you're
> > trying to do something slightly advanced.
>=20
> Ack. I agree, we didn't have a necessity to implement properties up to
> now. But that sounds like an interesting topic for DSI-to-HDMI bridges
> and HDCP support. I'll need to check if any of the RB3/RB5/Dragonboard
> bridges are programmed with the HDCP keys.

Aside from HDCP, the current color management work will also require to
expose properties on the connectors.

Maxime

--sx3kokd2nvv34uc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUoBHAAKCRDj7w1vZxhR
xWiBAP4sevvTIl4u+we2L7l/PqToVfQ/nXueZ0RTUgw/AJ/I1wEA+wM7mB5NCTiB
uAat91IEFc4bWWOTLkkDTh9pBOjkfwg=
=28g0
-----END PGP SIGNATURE-----

--sx3kokd2nvv34uc7--
