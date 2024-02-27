Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CD86A25C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 23:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC4F10E99B;
	Tue, 27 Feb 2024 22:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A4NLjwOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CE10E99B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 22:23:10 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7c7894b39edso167145439f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709072589; x=1709677389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T84DJzlc2Vb2bGOPPEYZE74DuxKJ5ir0iAcI6l/RK84=;
 b=A4NLjwOp4Keg7fAMvRQwexRvFONeFHhtpVpbiSA2D8ZW2k63dg6he3n1DICxw5TxEn
 /MBHxdr9nPf96KOJmdgVdQSO/CMa+3HpXh3ClHyQBQoMjfXEogi38K519n/MgOqCuCmc
 7Jn8egIoxInT1pRAnPtvawRAGlg9ExZh0GeNEeLVW5nMxUViyPVsRuFnQ55jsBpa45pE
 uwGTJn445ZmwTBlhI8gCWHYLZ8GqAUZBeV3756Yo/tEc/cvTFHJjsVt1jRnRL/z4MAfM
 cIvsiSFElw/L1hcv+S4tIc+11xLLYf4pLaRIcmXGp79G+R2bOdV05dRnjtsUtU0Y6wDn
 QDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709072589; x=1709677389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T84DJzlc2Vb2bGOPPEYZE74DuxKJ5ir0iAcI6l/RK84=;
 b=E93pMf9gDw09aaJFttZw6pqswbPl6/wdG8WFDZBy7q2ucmMYNU3ZxoKAYn849LAEDm
 FtyO7PQf2Oj1xQ44gW9Oqb82wAoj05gqwZ5uis7J5TckkupED1ox/1gbplioVfXki3k/
 VGkLHRc3CgU8+LFGoabfWEnm1Q4yLEZAwNpcECS2KnGv6VZb5C1aNgQT0Iu4/su0RQS6
 a7PaF45FkO7wwNLk93xw/NZkZTMx7+APpNzhX84pXx55SaKORPEdrgQjQ5EBFjhyLrTx
 cE8bqTwaH3RMrZBBRaCpDlBsABOQxTlYckD53Uh2yPN/ox7stKSum9kwbL2a8I75wR8t
 65aQ==
X-Gm-Message-State: AOJu0YxQiD9LTNA5oaY6MMdiCQL7vuhJSco+eN6nXZbHbOFc75b5UIFc
 10NMMYKL2VyfoeFxWJxC+RBAi5ZeBtHS1RaC011Wgg7DfyH8hjUFKi439Rw88tAzSPkxLwKQTEp
 c33g4X4ARLKaEoFxc/SvMvi2LxZr3rFyWYUquMw==
X-Google-Smtp-Source: AGHT+IEq56I5yr0ik9b2MfIeKBMvAOUTaaozwsSphBH4otN9KGlgcKuJuz8rBBaxRE0MJMDJ+pB/UFxJBYdO9rp+RUA=
X-Received: by 2002:a05:6e02:219b:b0:365:1d57:6da0 with SMTP id
 j27-20020a056e02219b00b003651d576da0mr16576687ila.26.1709072589416; Tue, 27
 Feb 2024 14:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20240211230931.188194-1-aford173@gmail.com>
In-Reply-To: <20240211230931.188194-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 Feb 2024 16:22:57 -0600
Message-ID: <CAHCN7xK-LZHEDrrke80=fO=GN+3wTwAig5_H7JaNW3vt4h1jyw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
To: dri-devel@lists.freedesktop.org
Cc: marex@denx.de, aford@beaconembedded.com, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 11, 2024 at 5:09=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The P divider should be set based on the min and max values of
> the fin pll which may vary between different platforms.
> These ranges are defined per platform, but hard-coded values
> were used instead which resulted in a smaller range available
> on the i.MX8M[MNP] than what was possible.
>
> As noted by Frieder, there are descripencies between the reference
> manuals of the Mini, Nano and Plus, so I reached out to my NXP
> rep and got the following response regarding the varing notes
> in the documentation.
>
> "Yes it is definitely wrong, the one that is part of the NOTE in
> MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
> not correct. I will report this to Doc team, the one customer should
> be take into account is the Table 13-40 DPHY PLL Parameters and the
> Note above."
>
> With this patch, the clock rates now match the values used in NXP's
> downstream kernel.
>

Inki,

Any change either or both of these patches could get applied?  It's
been several months since the first submission.

Fabio - Do you have an 8MP-evk that you could test to see if there is
any impact?  Between these two patches, it fixes the 720p@60  and
likely others too.

adam
> Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference cloc=
k")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> V2:  Only update the commit message to reflect why these values
>      were chosen.  No code change present
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 95fedc68b0ae..8476650c477c 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -574,8 +574,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct=
 samsung_dsim *dsi,
>         u16 _m, best_m;
>         u8 _s, best_s;
>
> -       p_min =3D DIV_ROUND_UP(fin, (12 * MHZ));
> -       p_max =3D fin / (6 * MHZ);
> +       p_min =3D DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
> +       p_max =3D fin / (driver_data->pll_fin_min * MHZ);
>
>         for (_p =3D p_min; _p <=3D p_max; ++_p) {
>                 for (_s =3D 0; _s <=3D 5; ++_s) {
> --
> 2.43.0
>
