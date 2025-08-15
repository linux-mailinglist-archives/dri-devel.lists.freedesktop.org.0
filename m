Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB30B28572
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 20:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2610E359;
	Fri, 15 Aug 2025 18:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="BdYhSOg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B9F10E359
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 18:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755280843; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NlbByFuhXezVODUStqQ84WvMGy+5YsDPBL0TKQQe4bOJ44hdUPmGFkqP/C5av+VhyVcYF/2FfVMm1YwAXWs2qVD/Q/0JxkJkxYdPWJWPuem3Q2O5LwvkKSVyjHQlrzcGu5h8gDJU57UdrriPjViyqdKb5fHJYB7xx8B1PmCYav0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755280843;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=h6WWDsR1xkHievKSbr8PoalxXKVtmn2ufWXDQEvTs+o=; 
 b=Suh3tTS5T5LP6oKAr347zBroRiVDrqH0kptirEwqvIl+XoJMnVcBSR5HC4eMGw86h8yjbz3ZLvfc/L9ahvb4YNSsjaHbeWRk3j/uxet+9R2kMdhdbt43IziKti4tPU5J+d9RfGdQKsB6F2Dj+dHwyqfbkpiqERYGles2H0y9NBk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755280843; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=h6WWDsR1xkHievKSbr8PoalxXKVtmn2ufWXDQEvTs+o=;
 b=BdYhSOg6YW1MJKsvAoDqN9fVKJXyPo9eERlXwyI/MrIxnKWLdh25YWMnZUTzviPt
 kN5sqMK+2cvjeL+Hc8AtkwhRaNJFLMgMiZWxAFZeAUByqrZUgkpdcuXVe56cCHJPsDx
 9E7ioB1GPTNUnVpj14wulRpNUylptS11YXjvrZ0Y=
Received: by mx.zohomail.com with SMTPS id 1755280840867964.6365292186097;
 Fri, 15 Aug 2025 11:00:40 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id B581A180FE9; Fri, 15 Aug 2025 20:00:35 +0200 (CEST)
Date: Fri, 15 Aug 2025 20:00:35 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org, 
 heiko@sntech.de, stephen@radxa.com, dri-devel@lists.freedesktop.org, 
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 yubing.zhang@rock-chips.com, 
 naoki@radxa.com, Laurent.pinchart@ideasonboard.com, 
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
Message-ID: <xhoi2lqzef5qeissr6oboxp6bqgxrk5hzkrgs5wrv3kjuiausm@3ypollf6gdme>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-10-andyshrk@163.com>
 <hbvwlucm5mnjpve6hb6h7dusgrokvdxzbpq5zrwib4yesrdakp@v77ofq7u2vv2>
 <5deac95c.8ec2.1985b428b0b.Coremail.andyshrk@163.com>
 <6c84556c.29cb.1985e658afb.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="woxxqm7gbt6grmgk"
Content-Disposition: inline
In-Reply-To: <6c84556c.29cb.1985e658afb.Coremail.andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/255.239.27
X-ZohoMailClient: External
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


--woxxqm7gbt6grmgk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
MIME-Version: 1.0

Hi,

On Thu, Jul 31, 2025 at 10:52:49AM +0800, Andy Yan wrote:
>=20
> Hello Sebastian=EF=BC=8C
>=20
> =E5=9C=A8 2025-07-30 20:15:44=EF=BC=8C"Andy Yan" <andyshrk@163.com> =E5=
=86=99=E9=81=93=EF=BC=9A
> >
> >
> >Hello Sebastian=EF=BC=8C
> >
> >At 2025-07-30 01:09:41, "Sebastian Reichel" <sebastian.reichel@collabora=
=2Ecom> wrote:
> >>Hi,
> >>
> >>On Mon, Jul 28, 2025 at 04:28:34PM +0800, Andy Yan wrote:
> >>> From: Andy Yan <andy.yan@rock-chips.com>
> >>>=20
> >>> Enable the Mini DisplayPort on this board.
> >>> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> >>> but it will trigger a dtc warning like "graph node unit address error,
> >>> expected "a"" if we use it directly after endpoint, so we use "a"
> >>> instead here.
> >>>=20
> >>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >>The graph currently looks like this:
> >>
> >>VOP <-> DP controller <-> DP Connector
> >>
> >>IIUIC this does not work for USB-C and needs to look like this,
> >>because the USBDP PHY handles the lane muxing and thus must be
> >>the thing connected to the USB-C controller/connector:
> >
> >I previously tests USB-C Altmode on Linux 5.15 using Rock 5b,  this func=
tion works well.=20
> >However, when the same dts configuration is used on Linux 6.16 and teste=
d with Rock 5b in USB-C Altmode,=20
> >the HPD interrupt of DP cannot be triggered. I'm not sure yet what chang=
es have occurred between them.
> >Moreover, I noticed that on your test branch[1], the DTS configuration h=
as also changed compared to before.
> >I would greatly appreciate it if you could share some details.
>=20
> Some updates:
>       After comment out pd-version(Your previous DTS didn't include this =
property.) on linux 6.16[2]
>      //pd-revision =3D /bits/ 8 <0x2 0x0 0x1 0x2>;
>     The USB-C Alt Mode output can work as before=E3=80=82
>     I still have relatively limited knowledge about USB-C, so I hope to h=
ear more of your opinions.

I got a bit distracted by some regressions introduced during the
merge window. It does not really make sense, that limiting the
pd-revision breaks DP AltMode. I did get it working once, but I
think there is some race condition involved in the USB-PD area.

I'm pretty sure this is in the USB-C PD/AltMode handling and thus
more or less independent of this series. Also my question regarding
the proper DT binding effectively affects the USBDP PHY binding, so
I'm fine to see this series merged (It looks like all necessary
Reviewed-by have been collected) and having a closer look at the
USBDP PHY binding separately in the next step.

Greetings,

-- Sebastian

>=20
>=20
> >
> >
> >
> >[0]https://github.com/andyshrk/linux/commit/b9f87a562d431fb59b664b7aed41=
869a8f184de3
> >[1]https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/=
-/commit/0e7e90494482cf77d5bb058a47583b6747b140f4
>   [2]https://github.com/andyshrk/linux/tree/rk3588-dp-upstream-v6
>=20
> >>
> >>VOP <-> DP controller <-> USBDP PHY <-> USB-C Connector
> >>
> >>I wonder if the simple case not involving USB-C should also have
> >>the USBDP PHY described in the graph as a transparent bridge?
> >>Note, that the USBDP PHY DT binding is currently not ready for
> >>this (this also affects the next patch, but should be enough to
> >>discuss this once :)).
> >>
> >>Greetings,
> >>
> >>-- Sebastian
> >>
> >>>=20
> >>> (no changes since v2)
> >>>=20
> >>> Changes in v2:
> >>> - Sort in alphabetical order
> >>>=20
> >>>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++=
++
> >>>  1 file changed, 37 insertions(+)
> >>>=20
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> >>> index 8b717c4017a46..5393c6cc493c3 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> >>> @@ -39,6 +39,18 @@ chosen {
> >>>  		stdout-path =3D "serial2:1500000n8";
> >>>  	};
> >>> =20
> >>> +	dp-con {
> >>> +		compatible =3D "dp-connector";
> >>> +		label =3D "DP OUT";
> >>> +		type =3D "mini";
> >>> +
> >>> +		port {
> >>> +			dp_con_in: endpoint {
> >>> +				remote-endpoint =3D <&dp0_out_con>;
> >>> +			};
> >>> +		};
> >>> +	};
> >>> +
> >>>  	hdmi-con {
> >>>  		compatible =3D "hdmi-connector";
> >>>  		type =3D "d";
> >>> @@ -215,6 +227,24 @@ &cpu_b2 {
> >>>  	cpu-supply =3D <&vdd_cpu_big1_s0>;
> >>>  };
> >>> =20
> >>> +&dp0 {
> >>> +	status =3D "okay";
> >>> +	pinctrl-0 =3D <&dp0m0_pins>;
> >>> +	pinctrl-names =3D "default";
> >>> +};
> >>> +
> >>> +&dp0_in {
> >>> +	dp0_in_vp2: endpoint {
> >>> +		remote-endpoint =3D <&vp2_out_dp0>;
> >>> +	};
> >>> +};
> >>> +
> >>> +&dp0_out {
> >>> +	dp0_out_con: endpoint {
> >>> +		remote-endpoint =3D <&dp_con_in>;
> >>> +	};
> >>> +};
> >>> +
> >>>  &gpu {
> >>>  	mali-supply =3D <&vdd_gpu_s0>;
> >>>  	status =3D "okay";
> >>> @@ -889,3 +919,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> >>>  		remote-endpoint =3D <&hdmi0_in_vp0>;
> >>>  	};
> >>>  };
> >>> +
> >>> +&vp2 {
> >>> +	vp2_out_dp0: endpoint@a {
> >>> +		reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> >>> +		remote-endpoint =3D <&dp0_in_vp2>;
> >>> +	};
> >>> +};
> >>> --=20
> >>> 2.43.0
> >>>=20
> >_______________________________________________
> >Linux-rockchip mailing list
> >Linux-rockchip@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/linux-rockchip

--woxxqm7gbt6grmgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmifdb8ACgkQ2O7X88g7
+ppMng/7BSgjHXMbR9F6+FVwbXlrvZPBmAugkwFvgOVM1xA2L7WMzhAH4zSKHrCp
FUaVyLUsmwwmhl4oFFUxiC5iqM3t5DVt8bYFX/vaRVdWzqss+Eo3/wG2Bye4EBF4
TQhtAxaLSZbUR+Trk1WMJoSAQi0Wi/KeuBe52nIoW+TTLrr/REJCwDCEeKhxJk+w
Vnhv2wHGC1lkSxbDv0ejHuUulZaeUpBeq9fqDkNgfo/pTOWWnqGESuaUCEJp5SxL
JtLd9vvMG7jj051QZjp4WIgy4DhFOCzXDIqMrCesWXo/z/MbP+9QLEBPE9JbtfoL
6+mTn6gGOrsqxt9PHecW9s73urPiNpGMkHC1xQPU9Y57XE/UY9UMJqbj4Snuee2A
O6u+FMq4xFLOvAIFwfiqyNDA4XQ7jFPvwDKmlPHWrCcScNtkbXE+xUkXiXx1jlz2
W5icc7ybnf//1ULy2NqGz2Xe9cXPPZPkCisVHymM/Lv/gHV0IitBehFz7kaLY25T
Spj4ROPpXVl35pj8REYCulS5yF83JV0hiCztVKhcZNFjE5CLgUm0B0GIMiLfTurc
/9vKllwnUmZ8XgYSsdRXh1z8y72ia68yoibVFOyPNTiqe2PHj7iC4HYx0LAWVmhb
rjklRqwtwofHHMJquecoSDUXBrxC/ngidR8Y78c1jQMjU9oQjDw=
=pYFV
-----END PGP SIGNATURE-----

--woxxqm7gbt6grmgk--
