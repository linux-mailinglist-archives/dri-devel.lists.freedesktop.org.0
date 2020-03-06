Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9717CD89
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B86E13D;
	Sat,  7 Mar 2020 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6DE6ECFA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:35:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id EE776297096
Date: Fri, 6 Mar 2020 07:35:43 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 0/4] Add dts for mt8183 GPU (and misc panfrost patches)
Message-ID: <20200306123543.GA1821@kevin>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1826193039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1826193039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Series has my r-b :)

On Fri, Mar 06, 2020 at 12:13:41PM +0800, Nicolas Boichat wrote:
> Hi!
>=20
> Follow-up on the v4: https://patchwork.kernel.org/cover/11369777/, some
> of the core patches got merged already (thanks Rob!).
>=20
> The main purpose of this series is to upstream the dts change and the
> binding document, but I wanted to see how far I could probe the GPU, to
> check that the binding is indeed correct. The rest of the patches are
> RFC/work-in-progress.
>=20
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>=20
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>=20
> Probing logs looks like this, currently. They look sane.
> [  501.319728] panfrost 13040000.gpu: clock rate =3D 511999970
> [  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:130=
40000.gpu
> [  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:130=
40000.gpu
> [  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:130=
40000.gpu
> [  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor =
0x3 status 0x0
> [  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues=
: 00000000,00000400
> [  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00=
000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  501.321752] panfrost 13040000.gpu: shader_present=3D0x7 l2_present=3D0=
x1
> [  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu=
 on minor 2
>=20
> Some more changes are still required to get devfreq working, and of course
> I do not have a userspace driver to test this with.
>=20
> I believe at least patches 1 & 2 can be merged (2 depends on another
> patch series, so maybe we could start with 1 only for now...).
>=20
> Thanks!
>=20
> Nicolas Boichat (4):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   RFC: drm/panfrost: Add mt8183-mali compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>=20
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  11 ++
>  6 files changed, 166 insertions(+)
>=20
> --=20
> 2.25.1.481.gfbce0eb801-goog
>=20

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl5iQ5oACgkQ/v5QWgr1
WA2Wfg/5Acx01qtWt1r6N8Am7rBvPeoVpmq9TkjjQ4RxwOUOdNmY0EdHiFThQMh+
IcRWZd7FYzM43WLebWWFVxcPgajS9PXB6MPiJcYwxVGvck0F6AW1SbZysoLdY4S8
AkaNQ5FLVHdr0sa5dkD80nAbLEnIyzkE48WXg7g1hIbdOjompFKdsHyv8UllLDdh
exBzqdVkfCd4UWCF+89cxDhGFUB/KFKdzk3jezMTCzkFzH6U0NWSn54oRJNFYdn8
x+1IscTm8NEZ9ghuldVcTLkiw+HDeEJ7tOgIq9REuUelwk312INaju2cxhF60Id0
JgIrNn+p7G9E3sEMlrrfDkEAm2kzS9WDVQGJ2vG2hNpwAZZBmLPnGQuV0pFuUSCB
Te5JrsafvUHZVWa3WrwFAxWM6F1iIfPlSXSQ1OYE6TrcSE2jWTZpWfXrHTg1oZOn
vTg+ZPyg7VfH/VtI/BmjIGeCPDVvPwCmlIbLv351H/uZ+sLWbT0Q1c9Y8qptg0MY
ldn2eRHR//yugNzH1QIWr6aPz0HTRHhEomrckZONP+40n1LinxHZEapOeTQnw0Ch
IoQjaQCaNW615SGOd3z2ncpg84xcc9SS3xb8Lb2WZZb9GHCIP3479jdCj52fnlQG
hYdjTL7nX7jwJkAXIUza7jiC2KIw7J8AfU10nxdyM9F5pHU9KS4=
=SWdB
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

--===============1826193039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1826193039==--
