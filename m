Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0A81A1EE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 16:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31EA10E5C5;
	Wed, 20 Dec 2023 15:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F65810E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 15:12:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso67641685e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703085166; x=1703689966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yicW/0g5zGKG++pwwlmWWUmEq4VzIsF4byaTzV8risI=;
 b=P32uLuiw+t7y1UmPDvcj07bMC/WeK0FuK4r3pRMQhMAT9trZFv7P6lF1aa9C3wDJCD
 lAOQNkZ9o/QQZTfpeH4JceCTCtV1vyRH0PODVHNFNVSn9eKtROH3o2qtgPeCZ3+D7tEG
 9LJK+831e8T2m+aSiO35T5B+ZUBNFjzWqu0yjmdqkDch9kwY3NL6LMstFxMlik3wDqw2
 YQTGXRox2uQPMq1WzKMAM7DzPh/nYEqcJ4L6VvMndDc1ghaWK3pxILpXCq5+FxQiZNoG
 7Y9PgcXUPRRu+mUpHEzN73d14KMamCMHWe/VlhGUHm/fP+Mx1AXPYy4uZlhUglqcQ1nO
 P4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703085166; x=1703689966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yicW/0g5zGKG++pwwlmWWUmEq4VzIsF4byaTzV8risI=;
 b=YnvFrsh/tg/MacmN4L6yVU8IJxKzCF7I8uI0ppAE4t73MRvBDjeNHsvBCUVXIMqZXD
 qdvLW2REdXeSKe9w7PJYrne0f7oP6fFE/jOfR8+51MNrQ7cLNTj+w+0Ymf2NA43fUG+Q
 afk9Djs3/KJtFuTOZigF/WXVRC5ZraE677yNYE5PyCGGX9Gx81TeL1ccAeP4jyp0guDK
 z7Ain9whh1w/JoLdsVcmbp5X2S7fcDLcfXIo89lCNY80k3sejwvxhI+nqsc70ByKqgtd
 EfNgXRMw0W+LNr/f7i+JDQwKoCnCWaZlmRZCpBCcmePG5HcqRmsg2+rJgG+QFLBnweG6
 I5ig==
X-Gm-Message-State: AOJu0YwP9kC0k4ztUA8dLDs2I5CrY1wARZHKrXHAbqIYb1LYLxypzKAd
 70NMyqqTAZTEM+HdGdGHUzLXaFxjB/RZfA==
X-Google-Smtp-Source: AGHT+IEKaIqHWDfrMHQzZy/DZQAUnHiC5clwJLE6Mzl2x0m3qk5dXSE5YR5bdZlk9zrAuj1HQst5eA==
X-Received: by 2002:a05:600c:4d0e:b0:40b:47c5:35e4 with SMTP id
 u14-20020a05600c4d0e00b0040b47c535e4mr10309451wmp.39.1703085165645; 
 Wed, 20 Dec 2023 07:12:45 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfef02000000b00336644c400bsm9770223wro.64.2023.12.20.07.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 07:12:45 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's
 n/m ratio
Date: Wed, 20 Dec 2023 16:12:42 +0100
Message-ID: <2174554.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <87il4t9wi1.fsf@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <13411739.uLZWGnKmhe@jernej-laptop> <87il4t9wi1.fsf@oltmanns.dev>
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
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 20. december 2023 ob 08:09:28 CET je Frank Oltmanns napisal(a):
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
>=20
> You might notice that I am using a new macro for initializing the
> pll_video0_clk struct:
> New: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO
> Old: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST
>=20
> Setting the two CCU_FEATURE flags is part of the old initialization
> macro.
>=20
> I'll add SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_NM_RATIO_CLOSEST which
> hopefully resolves the confusion.

I'm in doubt if we need so many macros. How many users of these macro we'll=
 have?
I see that R40 SoC would also need same ratio limits, but other that that, =
none?

Best regards,
Jernej

>=20
> Thanks,
>   Frank
>=20
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




