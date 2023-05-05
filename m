Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBA6F8870
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510B910E655;
	Fri,  5 May 2023 18:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8C10E655
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:10:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50CD963FBD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BD0C433A0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683310229;
 bh=bOlduRXRE2CmVm5OdOFE0fJpR9HoKc1/4AJwBj0XMUM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GuTudXBdsQrSS/Ys36+HWbku4Rug5v8wdn3J5L97LVIxIg/zV7RSUeSCKMXAxFFrK
 tivrTSe0DmUWN8Hm+zHxFX6pA0Vywg2a1OpPLNMh0oXaKeXtwgnB/Az4xhs+zClWPI
 2gAM52H9MBvLi7TA7+R9MYbhO8EHaeQ2BLskhb95KA/+LL39MShZrTKAGrs2g8C8fy
 dOAutWvn4lg2RUoYJj29gPEtWqOcFlw8dYBEgtV4/XTc3dV+vpZvmdKvPQBqYkkTlD
 jaYVxDGRUZwFGhfhh+7o4+OyskSdzlLaSuqHMRrEZfgJRInIoISmroO4cUdvTzEYKL
 wSoub8aXom8QA==
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-52c6f81193cso1481354a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:10:29 -0700 (PDT)
X-Gm-Message-State: AC+VfDyVFZyO2dzp4Netj3K+FRWZAZxmACH+rkg4Oh6TGsYWd5ydL9Ts
 aLZ8ZC4NkuWA/Ru+r97DoTiqtVXGJs2zePSXiC0Lqw==
X-Google-Smtp-Source: ACHHUZ5733YTKhW8VCiZE7bfxgTgjjKBDJWIqOYm6AgXRyny/hmS3UwsqHS8yD0sV2qwRwGpW/bsFLYNik+hZCxWA9A=
X-Received: by 2002:a17:90a:e7cb:b0:24d:d50f:95d2 with SMTP id
 kb11-20020a17090ae7cb00b0024dd50f95d2mr2431889pjb.22.1683310229260; Fri, 05
 May 2023 11:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-10-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-10-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 20:10:18 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7Cwnr0tv03SDX6vJQVeLF0JmCOxk9gwesZDThWLiXONA@mail.gmail.com>
Message-ID: <CAN6tsi7Cwnr0tv03SDX6vJQVeLF0JmCOxk9gwesZDThWLiXONA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] drm/bridge: tc358768: remove unused variable
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 4:34=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Remove the unused phy_delay_nsk variable, before it was wrongly used
> to compute some register value, the fixed computation is no longer using
> it and therefore can be removed.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 947c7dca567a..d3af42a16e69 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -641,7 +641,7 @@ static void tc358768_bridge_pre_enable(struct drm_bri=
dge *bridge)
>         u32 val, val2, lptxcnt, hact, data_type;
>         s32 raw_val;
>         const struct drm_display_mode *mode;
> -       u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
> +       u32 dsibclk_nsk, dsiclk_nsk, ui_nsk;
>         u32 dsiclk, dsibclk, video_start;
>         const u32 internal_delay =3D 40;
>         int ret, i;
> @@ -725,11 +725,9 @@ static void tc358768_bridge_pre_enable(struct drm_br=
idge *bridge)
>                                   dsibclk);
>         dsiclk_nsk =3D (u32)div_u64((u64)1000000000 * TC358768_PRECISION,=
 dsiclk);
>         ui_nsk =3D dsiclk_nsk / 2;
> -       phy_delay_nsk =3D dsibclk_nsk + 2 * dsiclk_nsk;
>         dev_dbg(priv->dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
>         dev_dbg(priv->dev, "ui_nsk: %u\n", ui_nsk);
>         dev_dbg(priv->dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
> -       dev_dbg(priv->dev, "phy_delay_nsk: %u\n", phy_delay_nsk);
>
>         /* LP11 > 100us for D-PHY Rx Init */
>         val =3D tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
