Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B8B9D803
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 07:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B8510E83D;
	Thu, 25 Sep 2025 05:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="W+0SrnW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F410E107;
 Thu, 25 Sep 2025 05:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758779836; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U6ZLX1d+9sstgdgClpCgIBei3zIQM/guRuz1GLnt26Us1/05cfAtMafYiXKQTeqRiz3CsdEyTKIgIrbxuMzMIlytouIoKrhRvR36p+6SaRqYLfH9LjsD124H28ORUA/kLe7kzl40z0RoL8gDzJlL1QK6BvGeYt/XXDQbwb+Xv2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758779836;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NKm8NkZ2qj+imDCLFws1C9XKGcGIxvlKibeXZJUbrZY=; 
 b=cLouTp1bc05SrTcsyLJShR0wI1rHodZutbJmtoL/SpZ4SMZY5hxsRfKwGa81IVNjd8zy0UjOOQWZaWZBJAZCepun0TnnshBgKETZSPGL9cAmUD5QVQBFYl5x+qSSb5/SW4DXDlAOh2+QkykpxEYqgsQWhbx08nKd99sS8lVHn7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758779836; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=NKm8NkZ2qj+imDCLFws1C9XKGcGIxvlKibeXZJUbrZY=;
 b=W+0SrnW41EjFX94PCseZsg/F2j5G7tOI/r+tl6hYk4/+sRBBXmBdYSDc6FK8yv2l
 zUA/83DzsBGAg/Yhwb3syxeEyZthkV+tWHyYSiZ4D02QWnNmE577xb41zVPk/nfql8g
 Zw7U9GePJWANowgTU5QCphN5Si9ACXN2dIPDrtLLKE/jy9XsEq4SP2sl6M4Lq90lQaJ
 OJXvQD6Nz51Jbfai9uH0J1vDZU6FKolqNPZQDuQyH2MyhyoinFS2ZBJh8kmbwZF3hFI
 7nLkJnTJhl3CdYqDcLtvbcvkFrjn9CmGBZov1FnNupA3LO8k+nuRLyAsy6OIx6+hCdp
 OB63Oji5Vw==
Received: by mx.zohomail.com with SMTPS id 1758779834319455.8321043269757;
 Wed, 24 Sep 2025 22:57:14 -0700 (PDT)
Message-ID: <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, moderated for non-subscribers
 <etnaviv@lists.freedesktop.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Thu, 25 Sep 2025 13:57:03 +0800
In-Reply-To: <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-3-uwu@icenowy.me>
 <20250922204349.GA1290045-robh@kernel.org>
 <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
 <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

=E5=9C=A8 2025-09-24=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 20:15 +0200=EF=BC=
=8CChristian Gmeiner=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Verisilicon has a series of display controllers prefixed with
> > > > > DC
> > > > > and
> > > > > with self-identification facility like their GC series GPUs.
> > > > >=20
> > > > > Add a device tree binding for it.
> > > > >=20
> > > > > Depends on the specific DC model, it can have either one or
> > > > > two
> > > > > display
> > > > > outputs, and each display output could be set to DPI signal
> > > > > or
> > > > > "DP"
> > > > > signal (which seems to be some plain parallel bus to HDMI
> > > > > controllers).
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Fixed misspelt "versilicon" in title.
> > > > > - Moved minItems in clock properties to be earlier than
> > > > > items.
> > > > > - Re-aligned multi-line clocks and resets in example.
> > > > >=20
> > > > > =C2=A0.../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 127
> > > > > ++++++++++++++++++
> > > > > =C2=A01 file changed, 127 insertions(+)
> > > > > =C2=A0create mode 100644
> > > > > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > >=20
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/display/verisilicon,dc.ya
> > > > > ml
> > > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.ya
> > > > > ml
> > > > > new file mode 100644
> > > > > index 0000000000000..07fedc4c7cc13
> > > > > --- /dev/null
> > > > > +++
> > > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.ya
> > > > > ml
> > > > > @@ -0,0 +1,127 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > > http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Verisilicon DC-series display controllers
> > > > > +
> > > > > +maintainers:
> > > > > +=C2=A0 - Icenowy Zheng <uwu@icenowy.me>
> > > > > +
> > > > > +properties:
> > > > > +=C2=A0 $nodename:
> > > > > +=C2=A0=C2=A0=C2=A0 pattern: "^display@[0-9a-f]+$"
> > > > > +
> > > > > +=C2=A0 compatible:
> > > > > +=C2=A0=C2=A0=C2=A0 const: verisilicon,dc
> > > >=20
> > > > This needs an SoC specific compatible. Generally licensed IP
> > > > compatibles
> > > > are useless because the specs aren't public and there's always
> > > > integration quirks.
> > >=20
> > > This mimics the GPU IPs by the same vendor, see
> > > gpu/vivante,gc.yaml ,
> > > which contain the exact same set of identification registers
> > > (including
> > > a "customer id" one that can differienate the same configured IP
> > > on
> > > StarFive JH7110 and T-Head TH1520).
> > >=20
> > > If we can get vivante,gc to work w/o SoC specific compatible,
> > > then we
> > > should be able to get verisilicon,dc to work too.
> >=20
> > Well maybe I should add etnaviv people to the recipient list, to
> > allow
> > them to tell us the magic behind vivante,gc .
> >=20
>=20
> Vivante GPUs are special because they contain registers that allow
> them to
> be fully identified - see etnaviv_hw_identify(..).
>=20
> We can read out the following information:
> =C2=A0- model
> =C2=A0- revision
> =C2=A0- product_id
> =C2=A0- customer_id
> =C2=A0- eco_id

Well Verisilicon DCs (sometimes also called Vivante DCs because Vivante
is now part of Verisilicon) except DCNano have the same set of ID
registers (In fact the registers before 0x1500 seem to have mostly the
same meaning with GPUs, see [1], here the registers are even named
GC{,REG}_xxx), so it's why I assume "verisilicon,dc" will work here.

An example of identification registers readout on TH1510 is shown
below: (the register names are from etnaviv state_hi.xml)
```
root@lpi4a66 [ ~ ] # busybox devmem 0xffef600020 # MODEL             =20
0x00008200
root@lpi4a66 [ ~ ] # busybox devmem 0xffef600024 # REV
0x00005720
root@lpi4a66 [ ~ ] # busybox devmem 0xffef600028 # DATE
0x20210201
root@lpi4a66 [ ~ ] # busybox devmem 0xffef60002c # TIME
0x11133000
root@lpi4a66 [ ~ ] # busybox devmem 0xffef600030 # CUSTOMER_ID
0x0000030A
root@lpi4a66 [ ~ ] # busybox devmem 0xffef6000a8 # PRODUCT_ID
0x02082000
root@lpi4a66 [ ~ ] # busybox devmem 0xffef6000e8 # ECO_ID
0x00000000
```

But as Rob pointed out, maybe acquiring informations from the IDs
cannot solve all the problem of integration quirks? As these IDs are
already determined when Verisilicon generates the RTL for the customer,
it's possible for them to reuse the RTL twice, mess up something in one
silicon and have the issues fixed in another.

[1]
https://github.com/milkv-megrez/rockos-u-boot/blob/c9221cf2fa77d39c0b241ab4=
b030c708e7ebe279/drivers/video/eswin/eswin_dc_reg.h

>=20
> This information, in combination with a hardware database (hwdb) in
> kernel/userspace, is enough to support these GPUs/NPUs across
> different SoC vendors.
>=20

