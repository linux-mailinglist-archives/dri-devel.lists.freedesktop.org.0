Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD475B23F7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C72210EB78;
	Thu,  8 Sep 2022 16:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2524810EA02
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:51:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso2269411wmr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=e5KYqEBWQ8THQ17spmw0xDJTw5S+n1XJ78rOUrMQLWE=;
 b=mrMqJeHL2N1h5YAyTrrec9CeEwKwlyw0SO1YzY2f9pfRJGSVdOlHcFrmGSKiXw1Apo
 ScBrula6ozGf+tln/IXFTkzWqIP/D5NYEEBu7NoJUhGqkzh9AoM28r6qzDtTZnh0n+3O
 GZL9ws3a8VAdYQSSBtB2J6kXuKlcmNF+TpVV2dV+XviwVdibSwcjpfjg9Gl9Y9DvmMrQ
 3vKTmRGcutvFGjffbl1PsGbkYZnm8Kp2ARj2Lt2IQCHG31+8QjhbI/CKAH4dd5s1Qrrq
 +f9+ZubY6dtkvfoydCQWiLB3p5YYO1z5Ko+pcWcIhAej+JfYw/33EgEj+9qNBA8a/AOM
 +upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e5KYqEBWQ8THQ17spmw0xDJTw5S+n1XJ78rOUrMQLWE=;
 b=cQGhFpQuDthgFegxrRp9hPyhOaStmWtAxbO22tfxVKGvEu/f2uH0kD/kSGOHby7LTD
 EYPEUdo/VYdhEbHFuQftOJtZN40JKxXr4ADXVmLHMQ3SIcxxuLlZfUnFSFIJumUNjHR0
 MWf5Q9HJFGrROAuTKmxtTV4IG9f+4Nt+jUT3cqaIVYhbwZSUgzLw5DcbjDodA2cLjpd6
 i450j6Q5RoVCPRU034nxceyI1U3pHRekjcdl8qyR6sCCGij3Id0xDIfBUnHb80HJAfYI
 9UZg2yF9LXH8gJAC7GhgFCb8zlfwxqtVKrqwj+YWNACdp3gJ3Q4fhY6tOWOe9TxYZbeA
 Heog==
X-Gm-Message-State: ACgBeo3x23W07M0YyhL+kYh8TLjnlbaeXsemweIqQMHJ5vHcIr0f8ib1
 3zDrgu3vBYAwm5l5NFqM8sI=
X-Google-Smtp-Source: AA6agR7PpD+198B5Y3yHlP3CrDqe+4xxzwp+pmGtD3TVKQAJdPtBsk5cDvgpY5VnGVgDIaunPcagbQ==
X-Received: by 2002:a05:600c:3309:b0:3b2:973d:b533 with SMTP id
 q9-20020a05600c330900b003b2973db533mr2951570wmp.105.1662655900588; 
 Thu, 08 Sep 2022 09:51:40 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003a342933727sm3814303wmq.3.2022.09.08.09.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 09:51:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: Re: Re: [PATCH v4 3/5] arm64: dts: allwinner: h6: Add GPU OPP
 table
Date: Thu, 08 Sep 2022 18:51:38 +0200
Message-ID: <2313716.NG923GbCHz@kista>
In-Reply-To: <1800669.atdPhlSkOF@kista>
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <CAJiuCceZg_6p4yo89e0X3fD9aXFs9Xik8b8KUM+Psdy_4paKPw@mail.gmail.com>
 <1800669.atdPhlSkOF@kista>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne =C4=8Detrtek, 08. september 2022 ob 18:26:31 CEST je Jernej =C5=A0krabe=
c napisal(a):
> Dne torek, 06. september 2022 ob 21:26:34 CEST je Cl=C3=A9ment P=C3=A9ron=
 napisal(a):
> > Hi Jernej,
> >=20
> > On Tue, 6 Sept 2022 at 21:10, Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom>
>=20
> wrote:
> > > Dne torek, 06. september 2022 ob 17:30:32 CEST je Cl=C3=A9ment P=C3=
=A9ron
>=20
> napisal(a):
> > > > Add an Operating Performance Points table for the GPU to
> > > > enable Dynamic Voltage & Frequency Scaling on the H6.
> > > >=20
> > > > The voltage range is set with minimal voltage set to the target
> > > > and the maximal voltage set to 1.2V. This allow DVFS framework to
> > > > work properly on board with fixed regulator.
> > > >=20
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >=20
> > > >  .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87
> > > >  +++++++++++++++++++
> > > >  1 file changed, 87 insertions(+)
> > > >  create mode 100644
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > > > b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi new file mode
> > > > 100644
> > > > index 000000000000..b48049c4fc85
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > > > @@ -0,0 +1,87 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +// Copyright (C) 2022 Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.co=
m>
> > > > +
> > > > +/ {
> > > > +     gpu_opp_table: opp-table-gpu {
> > > > +             compatible =3D "operating-points-v2";
> > > > +
> > > > +             opp-216000000 {
> > > > +                     opp-hz =3D /bits/ 64 <216000000>;
> > > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-264000000 {
> > > > +                     opp-hz =3D /bits/ 64 <264000000>;
> > > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > > +             };
> > >=20
> > > As mentioned in clock patch review, rates below 288 MHz are deemed
> > > unstable on GPU PLL by vendor GPU kernel driver. At least in the BSP
> > > version that I have. Did you test these points? If not, better to drop
> > > them.
> >=20
> > I changed the governor to userspace and set the freq to 216MHz / 264MHz
> > Run glmark2 and didn't observe any glitch nor issue.
> >=20
> > I'm not sure if it's enough to say it's stable but I didn't observe
> > any strange behavior.
>=20
> Ok then.
>=20
> Forgot to ask, where did you get 1.2 V as an upper limit? H6 datasheet li=
sts
> max. GPU voltage as 1.08 V.

To answer my own question, absolute max. voltage is 1.3 V, so 1.2 V is stil=
l=20
somewhat acceptable and in practice, fixed regulator on Tanix TX6 board is=
=20
around 1.12 V. Boards with PMIC can set lower voltage anyway.

All good.
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
=20
Best regards,
Jernej
=20
> > Regards,
> > Clement
> >=20
> > > Best regards,
> > > Jernej
> > >=20
> > > > +
> > > > +             opp-312000000 {
> > > > +                     opp-hz =3D /bits/ 64 <312000000>;
> > > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-336000000 {
> > > > +                     opp-hz =3D /bits/ 64 <336000000>;
> > > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-360000000 {
> > > > +                     opp-hz =3D /bits/ 64 <360000000>;
> > > > +                     opp-microvolt =3D <820000 820000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-384000000 {
> > > > +                     opp-hz =3D /bits/ 64 <384000000>;
> > > > +                     opp-microvolt =3D <830000 830000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-408000000 {
> > > > +                     opp-hz =3D /bits/ 64 <408000000>;
> > > > +                     opp-microvolt =3D <840000 840000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-420000000 {
> > > > +                     opp-hz =3D /bits/ 64 <420000000>;
> > > > +                     opp-microvolt =3D <850000 850000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-432000000 {
> > > > +                     opp-hz =3D /bits/ 64 <432000000>;
> > > > +                     opp-microvolt =3D <860000 860000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-456000000 {
> > > > +                     opp-hz =3D /bits/ 64 <456000000>;
> > > > +                     opp-microvolt =3D <870000 870000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-504000000 {
> > > > +                     opp-hz =3D /bits/ 64 <504000000>;
> > > > +                     opp-microvolt =3D <890000 890000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-540000000 {
> > > > +                     opp-hz =3D /bits/ 64 <540000000>;
> > > > +                     opp-microvolt =3D <910000 910000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-576000000 {
> > > > +                     opp-hz =3D /bits/ 64 <576000000>;
> > > > +                     opp-microvolt =3D <930000 930000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-624000000 {
> > > > +                     opp-hz =3D /bits/ 64 <624000000>;
> > > > +                     opp-microvolt =3D <950000 950000 1200000>;
> > > > +             };
> > > > +
> > > > +             opp-756000000 {
> > > > +                     opp-hz =3D /bits/ 64 <756000000>;
> > > > +                     opp-microvolt =3D <1040000 1040000 1200000>;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&gpu {
> > > > +     operating-points-v2 =3D <&gpu_opp_table>;
> > > > +};
> > > > --
> > > > 2.34.1


