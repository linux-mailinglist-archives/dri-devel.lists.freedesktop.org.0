Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFA7D820E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 13:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1776A10E7BB;
	Thu, 26 Oct 2023 11:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B62A10E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 11:53:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E629CE3ED4;
 Thu, 26 Oct 2023 11:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C18C433C7;
 Thu, 26 Oct 2023 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698321232;
 bh=je+DADXCoX+kCTmWmZq0ysK4G7kIaCSpTWt8Az7jl+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WthaQ/2T2IwZQyvxbjc8i6TLCZH6R0bxGgKm3P19AQmdfpQ6FpjwwvQFGWuJlmFZh
 tm7fXvL65CzQ5c33upmgr/CpnC+NcEfl7NPZYHB61Dli32HyEHjHTAEm7TVcOCAW6u
 WX/pzPDujgTi+qekKeBkEKa/w3xdlsSoHtKQqepic+zDucRuItVq9HOI76c1zy0Fnj
 tcQZxaUmgfx/DxBjhYrjFnhrEajLGZHbOZ1pNFf23+sav93OnPXQUIreqClHVVFSWC
 4P6xH7xxp6pLnMn6QqN5PTG1/GsT6u4FVHAjey/Jdqt/t8/DPsiwi5Y8eT5xbu0gKF
 PO2YZ9C1j9ydw==
Date: Thu, 26 Oct 2023 13:53:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
 <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ydghz6j3eeoumtu"
Content-Disposition: inline
In-Reply-To: <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
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


--6ydghz6j3eeoumtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 11:57:22AM +0300, Dmitry Baryshkov wrote:
> On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > > +static int starfive_hdmi_register(struct drm_device *drm, struct s=
tarfive_hdmi *hdmi)
> > > > +{
> > > > +   struct drm_encoder *encoder =3D &hdmi->encoder;
> > > > +   struct device *dev =3D hdmi->dev;
> > > > +
> > > > +   encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev=
->of_node);
> > > > +
> > > > +   /*
> > > > +    * If we failed to find the CRTC(s) which this encoder is
> > > > +    * supposed to be connected to, it's because the CRTC has
> > > > +    * not been registered yet.  Defer probing, and hope that
> > > > +    * the required CRTC is added later.
> > > > +    */
> > > > +   if (encoder->possible_crtcs =3D=3D 0)
> > > > +           return -EPROBE_DEFER;
> > > > +
> > > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_f=
uncs);
> > > > +
> > > > +   hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> > > > +
> > > > +   drm_connector_helper_add(&hdmi->connector,
> > > > +                            &starfive_hdmi_connector_helper_funcs);
> > > > +   drmm_connector_init(drm, &hdmi->connector,
> > > > +                       &starfive_hdmi_connector_funcs,
> > > > +                       DRM_MODE_CONNECTOR_HDMIA,
> > >
> > > On an embedded device one can not be so sure. There can be MHL or HDMI
> > > Alternative Mode. Usually we use drm_bridge here and drm_bridge_conne=
ctor.
> >
> > On an HDMI driver, it's far from being a requirement, especially given
> > the limitations bridges have.
>=20
> It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
> are not widely used in the wild and are mostly non-existing except
> several phones that preate wide DP usage.

And those can be supported without relying on bridges.

> Using drm_connector directly prevents one from handling possible
> modifications on the board level. For example, with the DRM connector
> in place, handling a separate HPD GPIO will result in code duplication
> from the hdmi-connector driver. Handling any other variations in the
> board design (which are pretty common in the embedded world) will also
> require changing the driver itself. drm_bridge / drm_bridge_connector
> save us from those issues.

And we have other solutions there too. Like, EDIDs are pretty much in
the same spot with a lot of device variations, but it also works without
a common driver. I'd really wish we were having less bridges and more
helpers, but here we are.

> BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
> asking because we heavily depend on the bridge infrastructure for HDMI
> output. Maybe we are missing something there, which went unnoticed to
> me and my colleagues.

A bridge cannot extend the connector state or use properties, for
example. It works for basic stuff but falls apart as soon as you're
trying to do something slightly advanced.

Maxime

--6ydghz6j3eeoumtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTpTTAAKCRDj7w1vZxhR
xbLFAP4unIAE0v+sEMAKIEHtzqjUKfaDRvFMhet0vamy7Zof+QD/dgmnLOex7TJ1
wA5XuQ2uivS+Cv7xrc3HS7yTI5xVjAE=
=5wik
-----END PGP SIGNATURE-----

--6ydghz6j3eeoumtu--
