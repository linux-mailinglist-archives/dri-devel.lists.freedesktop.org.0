Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258F5B2391
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777DC10EB59;
	Thu,  8 Sep 2022 16:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981310EB59
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:26:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so2206827wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8G+gH/ZdR26aobBAiGz/oS5rrDj2ImSoc83kpV+wRO0=;
 b=Lv282Mf3K67NvyFxRebxNkdvzGhqee8D1XGpHHcftviyakUdO3xMzoYCg+7ZenogQZ
 CKFxMJlR8ohcfzJVgJ57xMj+pbdL51FR0qbpIGo3Gn7u/LGkCdtiR3Z3qO4qVPAn9E/o
 noppHKRaRu9xab32KqAAnEjlRkS7oZuRh5NQ9fvmOpGIv+HKAwY6qibOxLkU/jA3+PD8
 1bP5t0dP6u+9zEyBjlP0V8W0yl3RqFf9NckOSqRXIlOPIgU24m6Yl1X9Xx/PMk5z2DXG
 4TxqycZgZG+FXA1teIK6bNRkUpVxIl3aH/qXlJDeBwQFV2uO5kizVoGD+EIcpARKVPsh
 teuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8G+gH/ZdR26aobBAiGz/oS5rrDj2ImSoc83kpV+wRO0=;
 b=q3vMLjhNu+qCotXUAdjZ/8BeBqbMGtKiausUka0MJLQs6F2qtp94tPqIggF4X1wu6/
 a8ydmAo6BQo5nnxP8TuYj795K/GDqTXBO3S7WgSZNbCcSTYDjd/JjqCXjvToJG+j8LuD
 FbgDY1TYBsnGKqkYruso0mGUOocUF+w1J0Ba9UX4YYIe/j1G/z4oN7W95gM+kLk2ERWN
 ++6BUOmVBdcPYrcL5rUFp2IpSB8iLweuUbB9T/4L2fNCtev99K+qwPsv/nY4UxxGq1iD
 GCmsWAVZBuQrQtTmZkan2esCs4CTaE5vQ3gyc73LE9dw3Mhlg2aH2WQHi496JqLscp6/
 HBFw==
X-Gm-Message-State: ACgBeo2l5P4q6Dq0m9L4EwEkzK56Ow/ltxkmmgcXV9ISPZuJTuiheB1b
 at4wb6kduiLo+hUYBNLjF8ApGhWaE0Zc8Q==
X-Google-Smtp-Source: AA6agR5g4fKQwejx0X+xvVpuFLeBu2IKV+p52yPrFDR1V4MFUXBQpznlKeIiBMa6kmzuxVxNcu+yvA==
X-Received: by 2002:a05:600c:1c8f:b0:3b2:541c:dd34 with SMTP id
 k15-20020a05600c1c8f00b003b2541cdd34mr2737551wms.155.1662654393411; 
 Thu, 08 Sep 2022 09:26:33 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 d22-20020a1c7316000000b003a5bd5ea215sm2973670wmb.37.2022.09.08.09.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 09:26:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: Re: [PATCH v4 3/5] arm64: dts: allwinner: h6: Add GPU OPP table
Date: Thu, 08 Sep 2022 18:26:31 +0200
Message-ID: <1800669.atdPhlSkOF@kista>
In-Reply-To: <CAJiuCceZg_6p4yo89e0X3fD9aXFs9Xik8b8KUM+Psdy_4paKPw@mail.gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <12048299.O9o76ZdvQC@kista>
 <CAJiuCceZg_6p4yo89e0X3fD9aXFs9Xik8b8KUM+Psdy_4paKPw@mail.gmail.com>
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

Dne torek, 06. september 2022 ob 21:26:34 CEST je Cl=C3=A9ment P=C3=A9ron n=
apisal(a):
> Hi Jernej,
>=20
> On Tue, 6 Sept 2022 at 21:10, Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om>=20
wrote:
> > Dne torek, 06. september 2022 ob 17:30:32 CEST je Cl=C3=A9ment P=C3=A9r=
on=20
napisal(a):
> > > Add an Operating Performance Points table for the GPU to
> > > enable Dynamic Voltage & Frequency Scaling on the H6.
> > >=20
> > > The voltage range is set with minimal voltage set to the target
> > > and the maximal voltage set to 1.2V. This allow DVFS framework to
> > > work properly on board with fixed regulator.
> > >=20
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >=20
> > >  .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++=
++
> > >  1 file changed, 87 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.d=
tsi
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > > b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi new file mode
> > > 100644
> > > index 000000000000..b48049c4fc85
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > > @@ -0,0 +1,87 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +// Copyright (C) 2022 Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > +
> > > +/ {
> > > +     gpu_opp_table: opp-table-gpu {
> > > +             compatible =3D "operating-points-v2";
> > > +
> > > +             opp-216000000 {
> > > +                     opp-hz =3D /bits/ 64 <216000000>;
> > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > +             };
> > > +
> > > +             opp-264000000 {
> > > +                     opp-hz =3D /bits/ 64 <264000000>;
> > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > +             };
> >=20
> > As mentioned in clock patch review, rates below 288 MHz are deemed
> > unstable on GPU PLL by vendor GPU kernel driver. At least in the BSP
> > version that I have. Did you test these points? If not, better to drop
> > them.
>=20
> I changed the governor to userspace and set the freq to 216MHz / 264MHz
> Run glmark2 and didn't observe any glitch nor issue.
>=20
> I'm not sure if it's enough to say it's stable but I didn't observe
> any strange behavior.

Ok then.

=46orgot to ask, where did you get 1.2 V as an upper limit? H6 datasheet li=
sts=20
max. GPU voltage as 1.08 V.

Best regards,
Jernej

>=20
> Regards,
> Clement
>=20
> > Best regards,
> > Jernej
> >=20
> > > +
> > > +             opp-312000000 {
> > > +                     opp-hz =3D /bits/ 64 <312000000>;
> > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > +             };
> > > +
> > > +             opp-336000000 {
> > > +                     opp-hz =3D /bits/ 64 <336000000>;
> > > +                     opp-microvolt =3D <810000 810000 1200000>;
> > > +             };
> > > +
> > > +             opp-360000000 {
> > > +                     opp-hz =3D /bits/ 64 <360000000>;
> > > +                     opp-microvolt =3D <820000 820000 1200000>;
> > > +             };
> > > +
> > > +             opp-384000000 {
> > > +                     opp-hz =3D /bits/ 64 <384000000>;
> > > +                     opp-microvolt =3D <830000 830000 1200000>;
> > > +             };
> > > +
> > > +             opp-408000000 {
> > > +                     opp-hz =3D /bits/ 64 <408000000>;
> > > +                     opp-microvolt =3D <840000 840000 1200000>;
> > > +             };
> > > +
> > > +             opp-420000000 {
> > > +                     opp-hz =3D /bits/ 64 <420000000>;
> > > +                     opp-microvolt =3D <850000 850000 1200000>;
> > > +             };
> > > +
> > > +             opp-432000000 {
> > > +                     opp-hz =3D /bits/ 64 <432000000>;
> > > +                     opp-microvolt =3D <860000 860000 1200000>;
> > > +             };
> > > +
> > > +             opp-456000000 {
> > > +                     opp-hz =3D /bits/ 64 <456000000>;
> > > +                     opp-microvolt =3D <870000 870000 1200000>;
> > > +             };
> > > +
> > > +             opp-504000000 {
> > > +                     opp-hz =3D /bits/ 64 <504000000>;
> > > +                     opp-microvolt =3D <890000 890000 1200000>;
> > > +             };
> > > +
> > > +             opp-540000000 {
> > > +                     opp-hz =3D /bits/ 64 <540000000>;
> > > +                     opp-microvolt =3D <910000 910000 1200000>;
> > > +             };
> > > +
> > > +             opp-576000000 {
> > > +                     opp-hz =3D /bits/ 64 <576000000>;
> > > +                     opp-microvolt =3D <930000 930000 1200000>;
> > > +             };
> > > +
> > > +             opp-624000000 {
> > > +                     opp-hz =3D /bits/ 64 <624000000>;
> > > +                     opp-microvolt =3D <950000 950000 1200000>;
> > > +             };
> > > +
> > > +             opp-756000000 {
> > > +                     opp-hz =3D /bits/ 64 <756000000>;
> > > +                     opp-microvolt =3D <1040000 1040000 1200000>;
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&gpu {
> > > +     operating-points-v2 =3D <&gpu_opp_table>;
> > > +};
> > > --
> > > 2.34.1


