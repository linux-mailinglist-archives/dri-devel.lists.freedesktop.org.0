Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334A135FC7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA0C6E93E;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B456E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 12:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 18140292E2E
Date: Wed, 8 Jan 2020 07:56:45 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Message-ID: <20200108125645.GA3057@kevin>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2053649692=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2053649692==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patches 1,2,3,6 are:

	Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

The remaining patches in the series are Acked-by.

Reportedly the kernel should work on certain Bifrost boards more or less
as-is, but I'm not positive about the details. It's possible some of
these are G72-specific or MT-specific issues; Robin and Stephen will
know more.

Very nice work so far!

Alyssa

On Wed, Jan 08, 2020 at 01:23:30PM +0800, Nicolas Boichat wrote:
> Hi!
>=20
> Sorry for the long delay since https://patchwork.kernel.org/patch/1113238=
1/,
> finally got around to give this a real try.
>=20
> The main purpose of this series is to upstream the dts change and the bin=
ding
> document, but I wanted to see how far I could probe the GPU, to check tha=
t the
> binding is indeed correct. The rest of the patches are RFC/work-in-progre=
ss, but
> I think some of them could already be picked up.
>=20
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>=20
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>=20
> Probing logs looks like this, currently:
> [  221.867726] panfrost 13040000.gpu: clock rate =3D 511999970
> [  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:130=
40000.gpu
> [  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:130=
40000.gpu
> [  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:130=
40000.gpu
> [  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor =
0x3 status 0x0
> [  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues=
: 00000000,00000400
> [  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00=
000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  221.872449] panfrost 13040000.gpu: shader_present=3D0x7 l2_present=3D0=
x1
> [  221.873526] panfrost 13040000.gpu: error powering up gpu stack
> [  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu=
 on minor 2
> [  221.940817] panfrost 13040000.gpu: error powering up gpu stack
> [  222.018233] panfrost 13040000.gpu: error powering up gpu stack
> (repeated)
>=20
> So the GPU is probed, but there's an issue when powering up the STACK, not
> quite sure why, I'll try to have a deeper look, at some point.
>=20
> Thanks!
>=20
> Nicolas
>=20
> v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
>  - Add dt-bindings changes
>  - Stacking patches after the device tree change that allow basic
>    probing (still incomplete and broken).
>=20
> Nicolas Boichat (7):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>   drm/panfrost: Add support for a second regulator for the GPU
>   drm/panfrost: Add support for multiple power domain support
>   RFC: drm/panfrost: Add bifrost compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>=20
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
>  8 files changed, 267 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.24.1.735.g03f4e72817-goog
>=20

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl4V0YcACgkQ/v5QWgr1
WA2z0Q//WX513kQuB2ztPrVdeEsNW0mXDe8s1n5AKMDsEY0qTeR48HQjPkug4+vX
RCioXDCqH4EJDlQ+JSJZHD+Ehsy9NgMxFpBeJZNO/S9yh05ThDuxi1Cpp0jAan5L
Xe1DqD9LeyOeH3UIOUkiUASyKs7JVozgO6x40jYa2z8bt4WN1aI4GOrJ0s0CpSOh
2oaN9oSPeCZYkAPk40m1Ygk/MNa+mpaVA5kDOF90YyhSh8fjXfhCopjRRTQh7koH
O94imgpCBY6WPDSQGQv9itX54ZR41JUTjE+APpGMG4wnoVt7bdRF/YZdePz8LNlZ
IqFWQ1e0EM0/BkoIGje9DO+jdC+Gu3ADBNrs67kqDlwaHMS7yb7q7HfGVYyS0+tF
cJylSj1GQ2ChQXu6KwyMf44IEloUfFZ7y2oJWBp1BMvLbu+Sgdr6uEBu2tYJ0AYA
L4WnOrEADX6BWjbo1BjKRflVYyjiz1SWptE4BrADD7aDuXH9w0OSE70x1fCscVBN
hhyT6aZSESsKSilhgCwrnacA+9htvu3uEmDS0YWpCZ9UpVw9a7rb/S4T6wUJZBBG
MoGXDDbLnFq2JcI48k45gp2HTGnjHwTsLmTpxrEo+QfnawFRVmnqWyPrHFJ1lVVO
BE0kDN4lbWYYZCZ4vKT4GLHwXGBLTaTI6b7/V2ZaLQtv4tCuHzM=
=jsFA
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============2053649692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2053649692==--
