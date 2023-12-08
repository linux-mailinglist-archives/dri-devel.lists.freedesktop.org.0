Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A33B809EF7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFFF10E0CE;
	Fri,  8 Dec 2023 09:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED10C10E0CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 09:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3127ACE213F;
 Fri,  8 Dec 2023 09:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E997C433C7;
 Fri,  8 Dec 2023 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702026862;
 bh=PpqkV81OadB/h6MWWmM9uepUUBI4O85xxP4qkQ1Svng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c6kPkn7C4GMyEI0IstxPAmJl+5gtuWg9EvwvwW+IgUrErh0VwVr6MkcTST66NuYny
 jYC6UwgLdz8QGoz2D8pU2gRmKjH8hh1FalxlQnWwM4WhdncRiQ/Ihttua20jlBJpcU
 KgIROty+rbO3i0wmTkI9aN0mxcFcd7OXIF9cVGtdI4sdfQwFiCJp47R6m9VPsXoN42
 Cv770NYTWFTDiltQsX+DFu0l4OEGsIK5HoXh8NwD8gMKiCvVyley9c00h5farkpYiu
 GXt1o9sHdq1eYrpph9nWc9FDlN2mXFUUdTS/Q2lst8jO7708rLH9y39SZDy+cpjmEM
 ab6dZPzpB71GA==
Date: Fri, 8 Dec 2023 10:14:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Message-ID: <xevxqusbizjfs4qt5rufhntd3vd656o2smocvivvulzceh3aeu@uuihphhat5wi>
References: <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
 <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
 <e1c362dc-8aac-4d13-9356-8b7ccae4727f@starfivetech.com>
 <5a79a4b9.1bd7.18c4773c1ea.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mclzxbyf7a4jkefy"
Content-Disposition: inline
In-Reply-To: <5a79a4b9.1bd7.18c4773c1ea.Coremail.andyshrk@163.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mclzxbyf7a4jkefy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 08, 2023 at 11:23:37AM +0800, Andy Yan wrote:
> =E5=9C=A8 2023-12-08 11:00:31=EF=BC=8C"Keith Zhao" <keith.zhao@starfivete=
ch.com> =E5=86=99=E9=81=93=EF=BC=9A
> >
> >
> >On 2023/12/8 8:37, Andy Yan wrote:
> >> Hi Keth=EF=BC=9A
> >>=20
> >>=20
> >>=20
> >>=20
> >>=20
> >>=20
> >> =E5=9C=A8 2023-12-07 18:48:13=EF=BC=8C"Keith Zhao" <keith.zhao@starfiv=
etech.com> =E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>>
> >>>On 2023/12/7 17:02, Andy Yan wrote:
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>> Hi Keith=EF=BC=9A
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>>=20
> >>>> At 2023-12-06 22:11:33, "Keith Zhao" <keith.zhao@starfivetech.com> w=
rote:
> >>>>>
> >>>>>
> >>>>>On 2023/12/6 20:56, Maxime Ripard wrote:
> >>>>>> On Wed, Dec 06, 2023 at 08:02:55PM +0800, Keith Zhao wrote:
> >>>>>>> >> +static const struct of_device_id starfive_hdmi_dt_ids[] =3D {
> >>>>>>> >> +	{ .compatible =3D "starfive,jh7110-inno-hdmi",},
> >>>>>>> >=20
> >>>>>>> > So it's inno hdmi, just like Rockchip then?
> >>>>>>> >=20
> >>>>>>> > This should be a common driver.
> >>>>>>>
> >>>>>>> Rockchip has a inno hdmi IP. and Starfive has a inno hdmi IP.
> >>>>>>> but the harewawre difference of them is big , it is not easy to u=
se the common driver
> >>>>>>> maybe i need the inno hdmi version here to make a distinction
> >>>>>>=20
> >>>>>> I just had a look at the rockchip header file: all the registers b=
ut the
> >>>>>> STARFIVE_* ones are identical.
> >>>>>>=20
> >>>>>> There's no need to have two identical drivers then, please use the
> >>>>>> rockchip driver instead.
> >>>>>>=20
> >>>>>> Maxime
> >>>>>
> >>>>>ok, have a simple test , edid can get . i will continue=20
> >>>>=20
> >>>> Maybe you can take drivers/gpu/drm/bridge/synopsys/dw-hdmi as a refe=
rence=EF=BC=8C this
> >>>> is also a hdmi ip used by rockchip/meson/sunxi/jz/imx=E3=80=82
> >>>> We finally make it share one driver=E3=80=82
> >>>>>
> >>>hi Andy:
> >>>
> >>>dw_hdmi seems a good choice , it can handle inno hdmi hardware by defi=
ne its dw_hdmi_plat_data.
> >>>does it means i can write own driver files such as(dw_hdmi-starfive.c)=
 based on dw_hdmi instead of add plat_data in inno_hdmi.c
> >>>
> >>=20
> >> I think the process maybe like this=EF=BC=9A
> >>=20
> >> 1. split the inno_hdmi.c under rockchip to  inno_hdmi.c(the common par=
t), inno_hdmi-rockchip.c(the soc specific part)
> >> 2. move the common part inno_hdmi.c to drivers/gpu/drm/bridge/innosili=
con/
> >> 3. add startfive specific part, inno_hdmi-startfive.c
> >>=20
> >> bellow git log from kernel three show how we convert  dw_hdmi to a com=
mon driver:=20
> >>=20
> >>=20
> >>=20
> >> 12b9f204e804 drm: bridge/dw_hdmi: add rockchip rk3288 support
> >> 74af9e4d03b8 dt-bindings: Add documentation for rockchip dw hdmi
> >> d346c14eeea9 drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_spare
> >> a4d3b8b050d5 drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_phy_=
wait_i2c_done
> >> 632d035bace2 drm: bridge/dw_hdmi: add mode_valid support
> >> 0cd9d1428322 drm: bridge/dw_hdmi: add support for multi-byte register =
width access
> >> cd152393967e dt-bindings: add document for dw_hdmi
> >> b21f4b658df8 drm: imx: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
> >> aaa757a092c2 drm: imx: imx-hdmi: split phy configuration to platform d=
river
> >> 3d1b35a3d9f3 drm: imx: imx-hdmi: convert imx-hdmi to drm_bridge mode
> >> c2c3848851a7 drm: imx: imx-hdmi: return defer if can't get ddc i2c ada=
pter
> >> b587833933de drm: imx: imx-hdmi: make checkpatch happy
> >>=20
> >hi Andy:
> >I got you means,=20
> >as I don't have a rockchip board on hand , to split the inno_hdmi.c can =
not be tested.
> >
> >how adout this idea:
> >1=E3=80=81split the starfive_hdmi.c under verisilicion to  inno_hdmi.c(t=
he common part), inno_hdmi-starfive.c(the soc specific part)
> >2. move the common part inno_hdmi.c to drivers/gpu/drm/bridge/innosilico=
n/
> >3. In the future, inno hdmi.c under rockchip will reuse the public drive=
r.
>=20
> I am not sure if drm maintainers are happy with this=E3=80=82

Not really, no.

Because we would still have two drivers for the same controller, and a
common one that haven't really been tested on anything but a single
platform. So arguably a worse situation than what you were suggesting in
the first place.

The best solution would be to find someone with a Rockchip board to test
your changes, or to get one if it's doable so you can test yourself.

Maxime

--mclzxbyf7a4jkefy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXLeZgAKCRDj7w1vZxhR
xX+VAQCDN8mU1ig+h/k3GOiSARtjlUBm/gfNxSrc+w8Z+uccaQEAiaFT6xKN1A/R
YHgxfBULnV+2196VN7w4qNeVghA3BA0=
=oX5D
-----END PGP SIGNATURE-----

--mclzxbyf7a4jkefy--
