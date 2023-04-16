Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E916E3CA5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 00:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511010E318;
	Sun, 16 Apr 2023 22:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B010E318
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 22:31:36 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id az2so3972856pgb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681684296; x=1684276296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFwNbwTeZCLBVi0XkvXE7u6Jd7tTvMFg3HLldvV4R4A=;
 b=aevjBF9o/afH9OcEqMfa0y3GDp6G0r4ZRicU0NQBxnGr2zQu2o9JYLkPtxGayMCpVR
 2ZFLMRijtzm8cM8hynCZ9Q0j5cT+CYqVJA98BoNHMRG06g+6e3hrt6PqUKnKKvghExIS
 agCfStD+rX1lw06usNZTpVs8nMNl9rMYo1ihnFeWunGdDSnpnopjHcTBpeu+2Vp5JPUg
 c307tySXNgRnmPjOBjiqY0KtOe91+xfv2aLFLV9iCv1e7HLM6YpagAdK9LcPx/RamvM0
 DTBP/19/8GTSIwk+SceHE0bbf4RPzadoatqxsLSJ9qa1tXRNxvH6mcdNeqlvrNOy0QqR
 ccSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681684296; x=1684276296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFwNbwTeZCLBVi0XkvXE7u6Jd7tTvMFg3HLldvV4R4A=;
 b=lL/+tPanztl7N7IBiSQJ+PhLL6khKVo5Kq2xrVlMOGuJeETZjaP0KD9pwpwgJVmOIO
 HIPL+7iJrqEgyd1m4d9usFcPsX7pNJ0yeSZEeYqEH7WbiYvpw95FLYaonvI9fH/oEe4w
 jVaMXVxEd7E2qpPDlIdB1h49+tT/SGuS9rHNzy+V1X2YG7UFZ23rpr8JYcISY/piqU2r
 /HD//1E3Og7PCkNCYHe1u9GUgBzQsitS2Em9ZgsUWkQFBPOA5bhtnUx3Tczyj6tGZJhn
 6YlazZbjqm2vOOWlGS97O1UMz4UVhIGUwNCTLLw1j6R2uhO+Squkm1F+cZGeyezfR8nH
 iyug==
X-Gm-Message-State: AAQBX9dDTZ9GM/UthW5jO1BTtgoiQy58EjKnixbhifLI+mRoMcsd8dau
 TUxbfbAQjewO5y1UupAX+7fvl8AajJE60iYjHTo=
X-Google-Smtp-Source: AKy350YBBXwEZ9X8S2MW5Q3T6K4il3kW5VzZMfBL1UAIS6CK51N2QxjHJCum+Rp5h2vYo1uXMKDb8UmSJokdVEdqB6M=
X-Received: by 2002:a65:4583:0:b0:50c:a00:c1fa with SMTP id
 o3-20020a654583000000b0050c0a00c1famr2594015pgq.7.1681684295645; Sun, 16 Apr
 2023 15:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-2-aford173@gmail.com>
 <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
In-Reply-To: <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 16 Apr 2023 17:31:24 -0500
Message-ID: <CAHCN7xKsvT-TL4xdP=CKDzTJoFq1PGqmFmTohdRF9JaWaxWemw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
To: Marek Vasut <marex@denx.de>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 5:07=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 4/15/23 12:40, Adam Ford wrote:
> > According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> > and max values for M and  the frequency range for the VCO_out
> > calculator were incorrect.  This also appears to be the case for the
> > imx8mn and imx8mp.
> >
> > To fix this, make new variables to hold the min and max values of m
> > and the minimum value of VCO_out, and update the PMS calculator to
> > use these new variables instead of using hard-coded values to keep
> > the backwards compatibility with other parts using this driver.
>
> [...]
>
> >   static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data =
=3D {
> > @@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data imx8mm=
_dsi_driver_data =3D {
> >        */
> >       .pll_p_offset =3D 14,
> >       .reg_values =3D imx8mm_dsim_reg_values,
> > +     .m_min =3D 64,
> > +     .m_max =3D 1023,
> > +     .vco_min =3D 1050,
>
> You might want to call this 'min_freq' since there is a 'max_freq' which
> seems to indicate what VCO max frequency is.
>
> Note that the same datasheet contains the following information:
> "
> MIPI_DPHY_M_PLLPMS field descriptions
>
> 12=E2=80=934 PMS_M
> Specifies the PLL PMS value for the M divider
> NOTE: The programmable divider range should be within 25 to 125 to
> ensure PLL stability.

I was confused by this because this statement is not consistent with
the link they reference jumps me to the table where it reads M is
between 64 and 1023.

> NOTE: The M and P divider values should be considered together to ensure
> VCO ouput frequency
> (VCO_out) range is between 350 MHz to 750 MHz.
> Please refer to the topic DPHY PLL for more information.

I was confused by this too, because the NXP documentation reads the
350 - 750MHz that you state, but  "Table 13-45: DPHY PLL Parameters"
which immediately follows that sentence  on page 4158 shows VCO_out is
between 1050-2100 MHz.

I compared the PMS values for a variety of frequencies to those that
were set in the downstream NXP code, and the PMS values matched.
Maybe someone from NXP can explain the discrepancy.

adam

> "
