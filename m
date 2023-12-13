Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2818110E2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 13:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD53910E275;
	Wed, 13 Dec 2023 12:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF15410E275
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 12:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 613DACE1DBB;
 Wed, 13 Dec 2023 12:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F0BC433C8;
 Wed, 13 Dec 2023 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702469877;
 bh=iwv6QjlzhU/3lqKybKin6YBmQgef/lB3nAcvuDWpn2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctonY1pD3cVqUnD3wCzZr2rWQ6aR3CISED2vL7hpLsSaR5RCWaijqq45PfJy0lpZn
 GxeHxtDm3D6FPNvjsLDaCJeTqxuQJVBVjszBs663aieCxmLUNF9Ar1ScENexe41rOL
 /QTTx4y+ySrpwVhldfwnk/Xj6ub/N3qAI/HdFOybU0obhe04DICyQgRsNt3iX1mEaG
 PrN6xab2DiQbpGNSQN3xAS/KnOyJAqrPqgPyzzxnSPSGDI1AGT8aq1foHtyls41nm8
 92C0vFGrOHcUYsriJyPztZCtJIXliOtp29B/iUNG4IIqtYRk8cbd1oGaRRSeHtgeUr
 bbCJZvMTWV3og==
Date: Wed, 13 Dec 2023 13:17:54 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge
 disable logic
Message-ID: <wepxz7qfph5cqxa7jnxiwdya3znaljqng7flggn65bmqrkwqyj@hjklrehup452>
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
 <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
 <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
 <CAOf5uwm_YmXz0A6nuCbJh+iszwqWyQkRRKATKyWZ33YUgZmEnw@mail.gmail.com>
 <CABGWkvpryv=bKsro1=6AG9kH9mU63JdWkG4xyyKvr_Rq0iADHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5iaexn55qchqkucz"
Content-Disposition: inline
In-Reply-To: <CABGWkvpryv=bKsro1=6AG9kH9mU63JdWkG4xyyKvr_Rq0iADHg@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5iaexn55qchqkucz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:59:05PM +0100, Dario Binacchi wrote:
> Hi Jagan and Dave,
>=20
> On Wed, Dec 6, 2023 at 2:57=E2=80=AFPM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi Jagan
> >
> > On Wed, Dec 6, 2023 at 2:31=E2=80=AFPM Jagan Teki <jagan@amarulasolutio=
ns.com> wrote:
> > >
> > > Hi Dario,
> > >
> > > On Wed, Dec 6, 2023 at 6:57=E2=80=AFPM Dario Binacchi
> > > <dario.binacchi@amarulasolutions.com> wrote:
> > > >
> > > > Hi Dave and Jagan,
> > > >
> > > > On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
> > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > >
> > > > > Hi Dario
> > > > >
> > > > > On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> > > > > <dario.binacchi@amarulasolutions.com> wrote:
> > > > > >
> > > > > > The patch fixes the code for finding the next bridge with the
> > > > > > "pre_enable_prev_first" flag set to false. In case this conditi=
on is
> > > > > > not verified, i. e. there is no subsequent bridge with the flag=
 set to
> > > > > > false, the whole bridge list is traversed, invalidating the "ne=
xt"
> > > > > > variable.
> > > > > >
> > > > > > The use of a new iteration variable (i. e. "iter") ensures that=
 the value
> > > > > > of the "next" variable is not invalidated.
> > > > >
> > > > > We already have https://patchwork.freedesktop.org/patch/529288/ t=
hat
> > > > > has been reviewed (but not applied) to resolve this. What does th=
is
> > > > > version do differently and why?
> > > >
> > > > My patches only affect drm_atomic_bridge_chain_post_disable(), wher=
eas
> > > > Jagan's patch affects both
> > > > drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_=
pre_enable().
> > > > I tested Jagan's patch on my system with success and I reviewed with
> > > > Michael Trimarchi the
> > > > drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
> > > > We also believe that our changes to post_disable() are better, as we
> > > > set the 'next' variable only when required,
> > > > and the code is more optimized since the list_is_last() is not call=
ed
> > > > within the loop.
> > > > Would it be possible to use Jagan's patch for fixing
> > > > drm_atomic_bridge_chain_pre_enable() and mine for
> > > > fixing drm_atomic_bridge_chain_post_disable()?
> > > >
> > >
> > > Can you please share the post-disabled bridge chain list with the
> > > below example before and after your change?
> >
> > We have already git commit the description in how the patch affects
> > the post_disable. As Dario
> > reported your patch is ok even in our use case. We don't have a real
> > use case as the one you describe.
> >
> > Can we know how you test it in this use case here? Can you test our
> > patches of post_disable?
> >
> > Thanks
> > Michael
> >
> > >
> > > Example:
> > > - Panel
> > > - Bridge 1
> > > - Bridge 2 pre_enable_prev_first
> > > - Bridge 3
> > > - Bridge 4 pre_enable_prev_first
> > > - Bridge 5 pre_enable_prev_first
> > > - Bridge 6
> > > - Encoder
> > >
> > > Thanks,
> > > Jagan.
>=20
> Starting from my use case:
>=20
> # cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
> encoder[36]
> bridge[0] type: 16, ops: 0x0, OF:
> /soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
> bridge[1] type: 16, ops: 0x8, OF:
> /soc@0/bus@32c00000/dsi@32e10000/panel@0:sharp,ls068b3sx0
>=20
> I developed a pass through MIPI-DSI bridge driver to try to test your cas=
e:
> # cat /sys/kernel/debug/dri/32e00000.lcdif/bridge_chains
> encoder[36]
> bridge[0] type: 16, ops: 0x0, OF:
> /soc@0/bus@32c00000/dsi@32e10000:fsl,imx8mn-mipi-dsim
> bridge[1] type: 16, ops: 0x0, OF: /pt_mipi_dsi1:amarula,pt-mipi-dsi
> bridge[2] type: 16, ops: 0x0, OF: /pt_mipi_dsi2:amarula,pt-mipi-dsi
> bridge[3] type: 16, ops: 0x0, OF: /pt_mipi_dsi3:amarula,pt-mipi-dsi
> bridge[4] type: 16, ops: 0x0, OF: /pt_mipi_dsi4:amarula,pt-mipi-dsi
> bridge[5] type: 16, ops: 0x0, OF: /pt_mipi_dsi5:amarula,pt-mipi-dsi
> bridge[6] type: 16, ops: 0x8, OF: /pt_mipi_dsi5/panel@0:sharp,ls068b3sx02
>=20
> The pre_enable_prev_first flag is set through the
> "amarula,pre_enable_prev_first" dts property I put
> in my dts.
> Your and my patches give the same results (result: OK) in both your
> use case and mine.
> But If I test my new "enlarged" use case:
>=20
> - Encoder
> - bridge[0] (samsung-dsim)
> - bridge[1] pre_enable_prev_first
> - bridge[2] pre_enable_prev_first
> - bridge[3] pre_enable_prev_first
> - bridge[4] pre_enable_prev_first
> - bridge[5] pre_enable_prev_first
> - bridge[6] pre_enable_prev_first (Panel)
>=20
> the result is:
> my patches: KO
> your patch: OK
>=20
> So, I will remove my patches from the series.
>=20
> Can the driver I implemented to test the use cases (pass through
> MIPI-DSI) be considered useful for testing these
> bridge pipelines?
> Does it make sense to send its patch?

As it is, not really, but kunit tests would be very welcome

Maxime

--5iaexn55qchqkucz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXmg8gAKCRDj7w1vZxhR
xYE2AP9DlpeRBMf5MCKhgytRMJVkb5u7GKYMYVH7gCg/rEd2nAD8DFqluSPThfWf
bNOau9D9SzHLHPj3BnTraUtdMZoiYAY=
=k9+E
-----END PGP SIGNATURE-----

--5iaexn55qchqkucz--
