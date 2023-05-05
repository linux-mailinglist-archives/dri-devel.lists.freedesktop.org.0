Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B106F87B8
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE6310E65E;
	Fri,  5 May 2023 17:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609E110E041
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:35:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FD4B63F86
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D477C4339E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683308155;
 bh=W4ROzuYY8hYvQggNUA8/ykiv3P1pvU1/88gNYpRZTZg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=amwyLMYQn67nKpkGSiA5hdQEr3zy/qjISEMZ64HPhtOPXzJx4eBRfVIUXwMkZqS0g
 SjzzwVmB4VfReB+/Hg2XSYc53XHz5+07+yojbxg842U6RouTdPHrrvS4JR/9eGShup
 rlBnNoJjZTT/sEnLLw2gfcTDh7hnR5DyCLwYkOXey+0JKarFZGOJk76GojZzk9LU1e
 xNdKo2wAat18OHJlpwXlC2sAAx0PhJZHyl7hCC9jpI3xFrObVr9I51ZUhjUI22SUFY
 dXLFBFocWfpIpwaECdAdtkrtu7anzf9pGYa7hInX81HP0IZaKvbmt9SJKlJyeqVDIG
 6WlE/v1jWSfWA==
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-24e14a24c9dso1536548a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 10:35:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDz1zCoaXj0q1WCDn8zjTfpO05SEuwrp0nA2BLScdHbIEEfCX6Ab
 H5dhq1tvr5+4J7wEyVVz2DAjWuzM3XKA1S60NIA7Ww==
X-Google-Smtp-Source: ACHHUZ7A8rFVuk/lhYjJRPuUOZS0temTku2flHOg/BYTVes/Z0tlOBknCt0WKgbNdU0+IhzhmGHT0DgBtpfMGz22zU4=
X-Received: by 2002:a17:90a:cd03:b0:250:275e:e154 with SMTP id
 d3-20020a17090acd0300b00250275ee154mr2207153pju.2.1683308154470; Fri, 05 May
 2023 10:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-2-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-2-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 19:35:43 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7Ja3jhMJEEU2AaGm9A9uRjMK_hhXHF_iTDcbmpbZxvCg@mail.gmail.com>
Message-ID: <CAN6tsi7Ja3jhMJEEU2AaGm9A9uRjMK_hhXHF_iTDcbmpbZxvCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] drm/bridge: tc358768: always enable HS video mode
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
> Always enable HS video mode setting the TXMD bit, without this change no
> video output is present with DSI sinks that are setting
> MIPI_DSI_MODE_LPM flag (tested with LT8912B DSI-HDMI bridge).
>
> Previously the driver was enabling HS mode only when the DSI sink was
> not explicitly setting the MIPI_DSI_MODE_LPM, however this is not
> correct.
>
> The MIPI_DSI_MODE_LPM is supposed to indicate that the sink is willing
> to receive data in low power mode, however clearing the
> TC358768_DSI_CONTROL_TXMD bit will make the TC358768 send video in
> LP mode that is not the intended behavior.
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 7c0cbe84611b..8f349bf4fc32 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -866,8 +866,7 @@ static void tc358768_bridge_pre_enable(struct drm_bri=
dge *bridge)
>         val =3D TC358768_DSI_CONFW_MODE_SET | TC358768_DSI_CONFW_ADDR_DSI=
_CONTROL;
>         val |=3D (dsi_dev->lanes - 1) << 1;
>
> -       if (!(dsi_dev->mode_flags & MIPI_DSI_MODE_LPM))
> -               val |=3D TC358768_DSI_CONTROL_TXMD;
> +       val |=3D TC358768_DSI_CONTROL_TXMD;
>
>         if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>                 val |=3D TC358768_DSI_CONTROL_HSCKMD;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
