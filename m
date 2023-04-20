Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9E6E9C55
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 21:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AA510E517;
	Thu, 20 Apr 2023 19:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649010E517
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 19:15:13 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-52019617020so1239765a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682018112; x=1684610112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TB42OP/0chsseE66LQ/QUwQPHdlFt1RecluHsLuAJY4=;
 b=PkfTz/PmrkjzTlyyAkJGB3k8eVlOC59C1SVPbdq6Edf6RyUTVqNYNlMvpRVkFgFDrv
 kch/3YnkgSp/yFqqSvhjw4/cyHFxsplXn9Ejlp6TV19kGl3/u6+m5181gAh57LAgvPqG
 zPGEtmrM3C0y0S5R2AEC31TfEFnRKGqmoe/zb34OPWQ09nIDUGoCNiNxnDstgDRSAtVl
 vrOmezSnSQV6wZq6Q0MMmoKn8M/a21t6uUaQp4WKMrVohxugniTDoERgncztowWyX0I+
 iDrmLrTd/R2snVC2C+deJLxzSWCLs+TTb/8hwTVdhTd5ZhmmwEODUk1Xzc2jvc/jEvC1
 E/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682018112; x=1684610112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TB42OP/0chsseE66LQ/QUwQPHdlFt1RecluHsLuAJY4=;
 b=AzMsws5DmmXQSTJIlJN40lsiLN9ftMbY7Z+ZTCtdlv6IGJad8sCBhSJ7x0KHRXrDSK
 UEnkM4iDw2Uvu4q1bBiIa5j0PWcX+An8rY1xBNukHc3Seye2qbzLY6Z8+avBjf1//oUN
 cxNYMtfLZRozZ6dNhpEbnWh8icMy46u5X8LahuH3+3Qp+w9zxrkOC5X6bO20whLpJ/My
 C7iQ/ShVgjdJqQ+QgGZ1rpww4/qq39Tm//66Z1+x5Pv0iCozi6nDYRSAg9zNFjbi82V2
 PGA3TR90TSzYMamCLUJVD9yt5khIR8InjPbSlwKyTCGrHlcV0SJDbR44vNZE4SVrjyKd
 NQhw==
X-Gm-Message-State: AAQBX9f0PIMeGe6+tpsRipygIi1K+SnSfP47u7jf+hS3uB0rNh3Br1SC
 4YZlTiP03iawZ3Ac7ECeAErSOMosHND9amvvP/c=
X-Google-Smtp-Source: AKy350YVTmd97fwntq23PuJ/Ty5yPWRWuBjTNLojg7FftZa0smSn5bHtfBllr8HEG9WbWSpf91gSn4y34LDBr9UYvf4=
X-Received: by 2002:a17:90a:4dc5:b0:247:90d8:41fd with SMTP id
 r5-20020a17090a4dc500b0024790d841fdmr2650658pjl.26.1682018111804; Thu, 20 Apr
 2023 12:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
 <CAHCN7xKsvT-TL4xdP=CKDzTJoFq1PGqmFmTohdRF9JaWaxWemw@mail.gmail.com>
 <5667233.DvuYhMxLoT@steina-w>
 <CAHCN7xK0Dban7ueB_ASrTOjqWK0++ujOoQ_RZpz=FR2Fktzy0g@mail.gmail.com>
In-Reply-To: <CAHCN7xK0Dban7ueB_ASrTOjqWK0++ujOoQ_RZpz=FR2Fktzy0g@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 20 Apr 2023 14:15:00 -0500
Message-ID: <CAHCN7xJx46zSOt5KLvJCo3NomFmjEzcirTnB9YdLWdR0aqOWew@mail.gmail.com>
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

On Tue, Apr 18, 2023 at 6:53=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Apr 17, 2023 at 2:00=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi,
> >
> > Am Montag, 17. April 2023, 00:31:24 CEST schrieb Adam Ford:
> > > On Sun, Apr 16, 2023 at 5:07=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> > > > On 4/15/23 12:40, Adam Ford wrote:
> > > > > According to Table 13-45 of the i.MX8M Mini Reference Manual, the=
 min
> > > > > and max values for M and  the frequency range for the VCO_out
> > > > > calculator were incorrect.  This also appears to be the case for =
the
> > > > > imx8mn and imx8mp.
> > > > >
> > > > > To fix this, make new variables to hold the min and max values of=
 m
> > > > > and the minimum value of VCO_out, and update the PMS calculator t=
o
> > > > > use these new variables instead of using hard-coded values to kee=
p
> > > > > the backwards compatibility with other parts using this driver.
> > > >
> > > > [...]
> > > >
> > > > >   static const struct samsung_dsim_driver_data imx8mm_dsi_driver_=
data =3D
> > > > >   {
> > > > >
> > > > > @@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data
> > > > > imx8mm_dsi_driver_data =3D {> >
> > > > >        */
> > > > >
> > > > >       .pll_p_offset =3D 14,
> > > > >       .reg_values =3D imx8mm_dsim_reg_values,
> > > > >
> > > > > +     .m_min =3D 64,
> > > > > +     .m_max =3D 1023,
> > > > > +     .vco_min =3D 1050,
> > > >
> > > > You might want to call this 'min_freq' since there is a 'max_freq' =
which
> > > > seems to indicate what VCO max frequency is.
> > > >
> > > > Note that the same datasheet contains the following information:
> > > > "
> > > > MIPI_DPHY_M_PLLPMS field descriptions
> > > >
> > > > 12=E2=80=934 PMS_M
> > > > Specifies the PLL PMS value for the M divider
> > > > NOTE: The programmable divider range should be within 25 to 125 to
> > > > ensure PLL stability.
> > >
> > > I was confused by this because this statement is not consistent with
> > > the link they reference jumps me to the table where it reads M is
> > > between 64 and 1023.
> > >
> > > > NOTE: The M and P divider values should be considered together to e=
nsure
> > > > VCO ouput frequency
> > > > (VCO_out) range is between 350 MHz to 750 MHz.
> > > > Please refer to the topic DPHY PLL for more information.
> > >
> > > I was confused by this too, because the NXP documentation reads the
> > > 350 - 750MHz that you state, but  "Table 13-45: DPHY PLL Parameters"
> > > which immediately follows that sentence  on page 4158 shows VCO_out i=
s
> > > between 1050-2100 MHz.

I reached out to my NXP rep asking if the VCO_out is 350-750 or if it
should be 1050-2100, and received the following statement:

" Yes it is definitely wrong, the one that is part of the NOTE in
MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
not correct. I will report this to Doc team, the one customer should
be take into account is the Table 13-40 DPHY PLL Parameters and the
Note above."

Table 13-40 (for the Nano) reads the VCO_out is 1050-2100, despite
other text stating 350-750MHz, so I believe this patch is appropriate.
I'll add the above statement to the commit message as confirmation
when I submit a V2 of this series.

adam
> > >
> > > I compared the PMS values for a variety of frequencies to those that
> > > were set in the downstream NXP code, and the PMS values matched.
> > > Maybe someone from NXP can explain the discrepancy.
> >
> > Also note that, according to Table 13-28 in RM (Rev 2 07/2022) for i.MX=
8M
> > Nano, VCO_out and Fout has a maximum of 1500MHz only. Although the note=
 above
> > mentions a range  of 1050-2100MHz...
>
> I looked up the limits in NXP's downstream kernel [1] , and I believe
> these values match the table in the reference manual instead of the
> conflicting sentence.  I am guessing this is why the PMS values I get
> match those of the NXP downstream kernel.
>
> adam
>
> [1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/=
imx/sec_mipi_pll_1432x.h#L38
>
> >
> > Best regards,
> > Alexander
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > http://www.tq-group.com/
> >
> >
