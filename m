Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F75AF462
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F810E8C1;
	Tue,  6 Sep 2022 19:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AC110E8C1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:26:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id cu2so25675333ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=3oOVdi/bQtPCfcN+ik9XE1mlmO3wSv0j3YsV+Rxg9iA=;
 b=oi+lsbgrsow9eDnffOWYdWZn4LHOIOGIOUe13rTHqTRCoiuHIMKfqZu2hMrnBmEDZf
 sdpLszwKJF4wcItH10Gu5dYZH85MdPRVCwbugwAhEuAFcgxy6hkXnUaszaH8TcTxKbBT
 dRfDl0qCbcEA/yByUASgFx/EuLvYr/BJYr27xx8NkZ4VRhKy4YkRwlDKzBJjFB8y9DO0
 hwVyxz0Z6dgjavxRhDvcb3YBNnUROMbRikIG6tqHMf6AWhGvg0homiIxi7iyiu4FlMTY
 bHfRzthhlW3dusDlm/x94JHGS5coTG5jDaStTJBO5aknisKj/UugmTQ/UcIi8Fa+gJMa
 uUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3oOVdi/bQtPCfcN+ik9XE1mlmO3wSv0j3YsV+Rxg9iA=;
 b=ldwsFhIZc+J00/900f7U4cULKK7ts9Co4XoJDCJ4H2mXmDaWlirg/oqqPpp8GnwEJ/
 bbrxQUBoiZo2u0HqWGL754Nw+eNMg2Vqt1v/d5ce3OZbBqtm/Z2lOccaG97cjol/4FVO
 WDku3PEGtxpTNClJr+RESRdBdvImjuwXJjAk7czWsTlYHPL5kaa1FR8rGviao2MTg8AL
 1ZPSw5oiVExVseivgIPEvAOly0SqOz3YnvSVxnASsdopoy6AvQAAItmQCZZ+wzGkxW8u
 Mss5tbV8ZnjaNFpNzivbct7JDOcAoaoG1WKMv8j8LO/CyZYi/9z27RT4O2gXPjsdG2AN
 QMvw==
X-Gm-Message-State: ACgBeo2Nhtih8r82PUKkJKylR60DW/BxBkULthLSFcU9JtoGpFdX4Vps
 WgOd9bao4w8NLWGAJi30UZUh+s2e9Ac6lGwer0k=
X-Google-Smtp-Source: AA6agR70GthhctG+XzaKnAyD3X1E8+YQzb/0n4Tcz5GSF++oD42tAArTNShHfOuNh/UxP2ah4WQAFSc4TdMmm+SuxC4=
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id
 hj1-20020a1709069fc100b007619192504fmr23306ejc.116.1662492406523; Tue, 06 Sep
 2022 12:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <20220906153034.153321-4-peron.clem@gmail.com>
 <12048299.O9o76ZdvQC@kista>
In-Reply-To: <12048299.O9o76ZdvQC@kista>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Sep 2022 21:26:34 +0200
Message-ID: <CAJiuCceZg_6p4yo89e0X3fD9aXFs9Xik8b8KUM+Psdy_4paKPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: allwinner: h6: Add GPU OPP table
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jernej,

On Tue, 6 Sept 2022 at 21:10, Jernej =C5=A0krabec <jernej.skrabec@gmail.com=
> wrote:
>
> Dne torek, 06. september 2022 ob 17:30:32 CEST je Cl=C3=A9ment P=C3=A9ron=
 napisal(a):
> > Add an Operating Performance Points table for the GPU to
> > enable Dynamic Voltage & Frequency Scaling on the H6.
> >
> > The voltage range is set with minimal voltage set to the target
> > and the maximal voltage set to 1.2V. This allow DVFS framework to
> > work properly on board with fixed regulator.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dts=
i
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi new file mode 10=
0644
> > index 000000000000..b48049c4fc85
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
> > @@ -0,0 +1,87 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2022 Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > +
> > +/ {
> > +     gpu_opp_table: opp-table-gpu {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-216000000 {
> > +                     opp-hz =3D /bits/ 64 <216000000>;
> > +                     opp-microvolt =3D <810000 810000 1200000>;
> > +             };
> > +
> > +             opp-264000000 {
> > +                     opp-hz =3D /bits/ 64 <264000000>;
> > +                     opp-microvolt =3D <810000 810000 1200000>;
> > +             };
>
> As mentioned in clock patch review, rates below 288 MHz are deemed unstab=
le on
> GPU PLL by vendor GPU kernel driver. At least in the BSP version that I h=
ave.
> Did you test these points? If not, better to drop them.

I changed the governor to userspace and set the freq to 216MHz / 264MHz
Run glmark2 and didn't observe any glitch nor issue.

I'm not sure if it's enough to say it's stable but I didn't observe
any strange behavior.

Regards,
Clement

>
> Best regards,
> Jernej
>
> > +
> > +             opp-312000000 {
> > +                     opp-hz =3D /bits/ 64 <312000000>;
> > +                     opp-microvolt =3D <810000 810000 1200000>;
> > +             };
> > +
> > +             opp-336000000 {
> > +                     opp-hz =3D /bits/ 64 <336000000>;
> > +                     opp-microvolt =3D <810000 810000 1200000>;
> > +             };
> > +
> > +             opp-360000000 {
> > +                     opp-hz =3D /bits/ 64 <360000000>;
> > +                     opp-microvolt =3D <820000 820000 1200000>;
> > +             };
> > +
> > +             opp-384000000 {
> > +                     opp-hz =3D /bits/ 64 <384000000>;
> > +                     opp-microvolt =3D <830000 830000 1200000>;
> > +             };
> > +
> > +             opp-408000000 {
> > +                     opp-hz =3D /bits/ 64 <408000000>;
> > +                     opp-microvolt =3D <840000 840000 1200000>;
> > +             };
> > +
> > +             opp-420000000 {
> > +                     opp-hz =3D /bits/ 64 <420000000>;
> > +                     opp-microvolt =3D <850000 850000 1200000>;
> > +             };
> > +
> > +             opp-432000000 {
> > +                     opp-hz =3D /bits/ 64 <432000000>;
> > +                     opp-microvolt =3D <860000 860000 1200000>;
> > +             };
> > +
> > +             opp-456000000 {
> > +                     opp-hz =3D /bits/ 64 <456000000>;
> > +                     opp-microvolt =3D <870000 870000 1200000>;
> > +             };
> > +
> > +             opp-504000000 {
> > +                     opp-hz =3D /bits/ 64 <504000000>;
> > +                     opp-microvolt =3D <890000 890000 1200000>;
> > +             };
> > +
> > +             opp-540000000 {
> > +                     opp-hz =3D /bits/ 64 <540000000>;
> > +                     opp-microvolt =3D <910000 910000 1200000>;
> > +             };
> > +
> > +             opp-576000000 {
> > +                     opp-hz =3D /bits/ 64 <576000000>;
> > +                     opp-microvolt =3D <930000 930000 1200000>;
> > +             };
> > +
> > +             opp-624000000 {
> > +                     opp-hz =3D /bits/ 64 <624000000>;
> > +                     opp-microvolt =3D <950000 950000 1200000>;
> > +             };
> > +
> > +             opp-756000000 {
> > +                     opp-hz =3D /bits/ 64 <756000000>;
> > +                     opp-microvolt =3D <1040000 1040000 1200000>;
> > +             };
> > +     };
> > +};
> > +
> > +&gpu {
> > +     operating-points-v2 =3D <&gpu_opp_table>;
> > +};
> > --
> > 2.34.1
>
>
