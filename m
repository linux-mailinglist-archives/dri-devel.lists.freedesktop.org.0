Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7908828E81
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 21:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B3210E46D;
	Tue,  9 Jan 2024 20:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1A710E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 20:29:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e5521dab6so1364135e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 12:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704832182; x=1705436982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhFxPk9bq95VbdmA1a6BS885aCK0kZ8gAMJ7pYXAmuY=;
 b=Rsa4jlYnW8tsrob3/tS/4+Rdqn4xBt1XKsGHlHPVTgT9dM8L8oDmPz3KVEmxbBHRRI
 ETY63CVreypndxIiHtSkkI99EVFbMQPH0Kftt3l0KdLWmZOHzy8g6SXc4/QiOIgPEk49
 B3pwWy+QZzN+Iq99b7yFmE6SYcSOF42Dh9fbxqYTAdRlkLo6ydduStjP1FWGfnde20W8
 hSZMaCAiPbX4dGQfFoY1tRP4NUueQqyWVtwwz4WpbOsedvZiOgP9kY1exIjeTeu9LD9R
 oCxmRn2OLzWba+zYaGB6Xo4XDCbbWQzdQSfDixmjghMF7I/OoYNzL0Mcd/mEEIVLZaDh
 ByAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704832182; x=1705436982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhFxPk9bq95VbdmA1a6BS885aCK0kZ8gAMJ7pYXAmuY=;
 b=C+oarrXC2fcdiTq2AVv8x6M7n3RRqDW5xslDkxxblzJ3/DvPymZQNtbPHVLiOtvBXc
 U1Cg0h2MoaRqvuA9EP5nV9Fd3+sJqXNHXD3q5yQdEvciuVoS7MVSYLMMmPB+/wLS/4Yu
 fzZSKHpd550uYaNmwgwyVFzBx3gvBNG3p+cs0B45qCVJ/0CsJ4Mdz7szRZpxmscr1+5o
 qcVmICoPF7LfaUjIE13rETO9FNXAG2ehU/f4KYgV0HuAKsTuuBfRFzUIby+NYiJFhtp1
 GID7lUDyOytpNTM9pgdAfNIl82D8mALpShwyxa+7MutjK+4GC3f1VrFqxTBLWJi+Sthw
 teTg==
X-Gm-Message-State: AOJu0Yw/4sEwPEAO2/gmxiGAAP0yeSbH98jjSaOPhEPcbC0kJNMX54rK
 Wpraq3qmMXCw73Qy6c5TzMC+OPK7zQUhtQ==
X-Google-Smtp-Source: AGHT+IE5TnoT1XdEn0n5wgCIogYrdeyA0CMiYERCnMzgmb3h9FCnrk13KBv23kZ3Cm17VgQCyOeKbA==
X-Received: by 2002:a05:600c:1381:b0:40d:5aa1:8f9d with SMTP id
 u1-20020a05600c138100b0040d5aa18f9dmr3358939wmf.35.1704832181725; 
 Tue, 09 Jan 2024 12:29:41 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net.
 [213.161.3.116]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c470c00b0040d5f3ef2a2sm15931585wmo.16.2024.01.09.12.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:29:41 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's
 n/m ratio
Date: Tue, 09 Jan 2024 21:29:39 +0100
Message-ID: <3461075.QJadu78ljV@jernej-laptop>
In-Reply-To: <87jzoug2jz.fsf@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <13411739.uLZWGnKmhe@jernej-laptop> <87jzoug2jz.fsf@oltmanns.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 31. december 2023 ob 10:10:40 CET je Frank Oltmanns napisal(a):
>=20
> On 2023-12-19 at 17:54:19 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmai=
l.com> wrote:
> > Dne ponedeljek, 18. december 2023 ob 14:35:22 CET je Frank Oltmanns nap=
isal(a):
> >> The Allwinner A64 manual lists the following constraint for the
> >> PLL-VIDEO0 clock: 8 <=3D N/M <=3D 25
> >>
> >> Use this constraint.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi=
=2Dng/ccu-sun50i-a64.c
> >> index c034ac027d1c..75d839da446c 100644
> >> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> @@ -68,7 +68,8 @@ static SUNXI_CCU_NM_WITH_SDM_GATE_LOCK(pll_audio_bas=
e_clk, "pll-audio-base",
> >>  				       BIT(28),	/* lock */
> >>  				       CLK_SET_RATE_UNGATE);
> >>
> >> -static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST(pll_video0_cl=
k, "pll-video0",
> >> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(pll_vid=
eo0_clk,
> >> +						"pll-video0",
> >>  						"osc24M", 0x010,
> >>  						192000000,	/* Minimum rate */
> >>  						1008000000,	/* Maximum rate */
>=20
> I just realized that adding the whole ratio limits for ccu_nm is
> superfluous as you could just as well express them in for of a minimum
> and maximum range:
> Since 8 <=3D N/M <=3D 25 and parent_rate =3D 24 MHz, therefore
>   192 MHz <=3D rate <=3D 600 MHz.

Good point!

>=20
> These absolute limits are also listed in Allwinner's A64 manual.
>=20
> BUT, here the upper limit was raised to 1008 MHz:
> 5de39acaf34604bd04834f092479cf4dcc946dd "clk: sunxi-ng: a64: Add max.
> rate constraint to video PLL"
>=20
> With this upper limit the ratio limitation is effectively:
> 8 <=3D N/M <=3D 42
>=20
> Icenowy Zheng (added to CC) had the reasonable explanation that this was
> used in the BSP kernel, so we should probably stick to that and ditch
> the two PLL-VIDEO0 related patches. What are your thoughts on that?

Ok, it seems that these patches are really superfluous. Remove them for v2.

Best regards,
Jernej

>=20
> >> @@ -80,7 +81,10 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLO=
SEST(pll_video0_clk, "pll-vid
> >>  						297000000,	/* frac rate 1 */
> >>  						BIT(31),	/* gate */
> >>  						BIT(28),	/* lock */
> >> -						CLK_SET_RATE_UNGATE);
> >> +						CLK_SET_RATE_UNGATE,
> >> +						CCU_FEATURE_FRACTIONAL |
> >> +						CCU_FEATURE_CLOSEST_RATE,
> >
> > Above flags are unrelated change, put them in new patch if needed.
> >
> > Best regards,
> > Jernej
> >
> >> +						8, 25);		/* min/max nm ratio */
> >>
> >>  static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
> >>  					"osc24M", 0x018,
> >>
> >>
>=20




