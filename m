Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211976E6074
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 13:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BC510E770;
	Tue, 18 Apr 2023 11:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C42410E770
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 11:54:03 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso686290b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681818843; x=1684410843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ybM2LueDVR0cBkIIQ1FL39u+s5FbROx8QFlROWcH4g=;
 b=V/euTDcOCNRcR8gEUbPoOAY3S22aC8zXFOH46BClwrZw26PXR+8P8uoM6J/+h9C6Mj
 i41QNHvn7lCT9kv/+ujFRq2ozOLoRYGljfQUCOgSapKHW3weumUM70IU9eAJ8oS7Yh/o
 iwWkb9SxlVm39XoFhN7DAxLSJPlVd2tdt6PqjeNwoliw5s9MJKcaO9F/GzSOGZs3zRLh
 ncP7xyDA5DfFu2uTMR0VX609KIr3TS1I+cAevO1nmtMvI+xAbBbT1LxqHwX/qJ9HfQhs
 M8VKw5rxokVPICTf0s3skrfQF6FtP/sxsQSIIYLSa5WXahWOWjVqw+FRTVtfrx39Xjvc
 xzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818843; x=1684410843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ybM2LueDVR0cBkIIQ1FL39u+s5FbROx8QFlROWcH4g=;
 b=lIy3Zn1tt/OyusKbAwxRj5y4So1M6z0z8ptqc08hdd5wphwsI8Y+uBr5G7UlTzqMzp
 2zRtPmlDbuXkbdhEuoMP2NKqK8E8xsZkh2vp3qLeFO62Hh/wywtSC7E0VRZKxEeJSh9e
 cIElcfQS11AM8sFmN7luO/ScxRtsNFU5Ygwq51Ppc/NznHhVHi6XtvkjqMIGQgrjrt2g
 R3Jjgl8JgN+W/LdbDf3cDAwsKvCb82R/e2MLWVNuSWgI2VVHW+qJSuikk8+i4xdKvB6A
 gny8XnduhvdDhc9vDdJeXTWfmQihCVwX0Q2MDgBqYHgIKmmSyH2fO+Tn6CbU4oL3hghR
 A1yQ==
X-Gm-Message-State: AAQBX9fCFA0W3nkQJ7tkZ3w+T4eVVgqsc9srPA6boC3ZTW+g4dSnLx13
 8he9Raq4hBQB3MWP2ss/4AxE/FZRi1q8xXnrdQ4=
X-Google-Smtp-Source: AKy350bF5ygQ2Drr2fXy89upLPlo2PHAWydehkh62freMFI+uRkOUg8otiAAZp8fkiyX8dnIL8QSyvNnGyroSpIGJ3M=
X-Received: by 2002:a05:6a00:2d17:b0:63b:7af9:72b8 with SMTP id
 fa23-20020a056a002d1700b0063b7af972b8mr5429939pfb.2.1681818842806; Tue, 18
 Apr 2023 04:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
 <CAHCN7xKsvT-TL4xdP=CKDzTJoFq1PGqmFmTohdRF9JaWaxWemw@mail.gmail.com>
 <5667233.DvuYhMxLoT@steina-w>
In-Reply-To: <5667233.DvuYhMxLoT@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 18 Apr 2023 06:53:51 -0500
Message-ID: <CAHCN7xK0Dban7ueB_ASrTOjqWK0++ujOoQ_RZpz=FR2Fktzy0g@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 2:00=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Montag, 17. April 2023, 00:31:24 CEST schrieb Adam Ford:
> > On Sun, Apr 16, 2023 at 5:07=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> > > On 4/15/23 12:40, Adam Ford wrote:
> > > > According to Table 13-45 of the i.MX8M Mini Reference Manual, the m=
in
> > > > and max values for M and  the frequency range for the VCO_out
> > > > calculator were incorrect.  This also appears to be the case for th=
e
> > > > imx8mn and imx8mp.
> > > >
> > > > To fix this, make new variables to hold the min and max values of m
> > > > and the minimum value of VCO_out, and update the PMS calculator to
> > > > use these new variables instead of using hard-coded values to keep
> > > > the backwards compatibility with other parts using this driver.
> > >
> > > [...]
> > >
> > > >   static const struct samsung_dsim_driver_data imx8mm_dsi_driver_da=
ta =3D
> > > >   {
> > > >
> > > > @@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data
> > > > imx8mm_dsi_driver_data =3D {> >
> > > >        */
> > > >
> > > >       .pll_p_offset =3D 14,
> > > >       .reg_values =3D imx8mm_dsim_reg_values,
> > > >
> > > > +     .m_min =3D 64,
> > > > +     .m_max =3D 1023,
> > > > +     .vco_min =3D 1050,
> > >
> > > You might want to call this 'min_freq' since there is a 'max_freq' wh=
ich
> > > seems to indicate what VCO max frequency is.
> > >
> > > Note that the same datasheet contains the following information:
> > > "
> > > MIPI_DPHY_M_PLLPMS field descriptions
> > >
> > > 12=E2=80=934 PMS_M
> > > Specifies the PLL PMS value for the M divider
> > > NOTE: The programmable divider range should be within 25 to 125 to
> > > ensure PLL stability.
> >
> > I was confused by this because this statement is not consistent with
> > the link they reference jumps me to the table where it reads M is
> > between 64 and 1023.
> >
> > > NOTE: The M and P divider values should be considered together to ens=
ure
> > > VCO ouput frequency
> > > (VCO_out) range is between 350 MHz to 750 MHz.
> > > Please refer to the topic DPHY PLL for more information.
> >
> > I was confused by this too, because the NXP documentation reads the
> > 350 - 750MHz that you state, but  "Table 13-45: DPHY PLL Parameters"
> > which immediately follows that sentence  on page 4158 shows VCO_out is
> > between 1050-2100 MHz.
> >
> > I compared the PMS values for a variety of frequencies to those that
> > were set in the downstream NXP code, and the PMS values matched.
> > Maybe someone from NXP can explain the discrepancy.
>
> Also note that, according to Table 13-28 in RM (Rev 2 07/2022) for i.MX8M
> Nano, VCO_out and Fout has a maximum of 1500MHz only. Although the note a=
bove
> mentions a range  of 1050-2100MHz...

I looked up the limits in NXP's downstream kernel [1] , and I believe
these values match the table in the reference manual instead of the
conflicting sentence.  I am guessing this is why the PMS values I get
match those of the NXP downstream kernel.

adam

[1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/im=
x/sec_mipi_pll_1432x.h#L38

>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
