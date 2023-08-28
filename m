Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A578BB0E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402D210E363;
	Mon, 28 Aug 2023 22:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BAF10E363
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:38:01 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-26d0d376ec7so2383321a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693262279; x=1693867079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMSOhObiScKAaL1YKIguFyCrqTv33hJyJ7dwyMmPz2U=;
 b=sQdjf8goMGTQd+OEOWgxWfkkVSbiA4m20jco1xGGz/8dlfeUJwWb/2QCq83PCIS/Am
 QHP+pyFR6NNCTX5D6U+5TMAxYa2OuzMZGemPVLzI2UF//zzrj7zZKPLxyCoiLkUJO31K
 4/F89i6SvPjszHqNOZuEyC45Ll27mm8gsX6Ekf/hmSqHhU0p0LdpXj/vJtakR5V38V9z
 y5MrKtX8btdXU1+2oy7D9oIrWv+wkrdk2/2W54OGqggXQGyggb/s1CtBBiYo6K7Nw5sB
 8oQgeaoICQwSmKu6La5TxJAaPpwPnbdGL7Na8z3ugASR6/1I9E0OJdDZAn8RuSOEwovI
 cYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693262279; x=1693867079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KMSOhObiScKAaL1YKIguFyCrqTv33hJyJ7dwyMmPz2U=;
 b=U+HDTee11O3GhOt5dv+sfyfKBvo4q175JODUc7NvqUmZY8LwDL/VhOrU4uenjeti0X
 a0TupUc98USbVM0x3m1YD+n7dFzBJeAGW9ukJkuoLS/y9gHOeOshM14P0jVXfZgfD6zK
 Oo1PE8rJm1uWlw6Jih8cXszMezYwcatGCbZ1aWrDS77ZyAZpc8UkiwN2w2lp5t4DGduk
 2NmNVkhQYgJazuDzoAQMoc/9DShBPhEG0Fu/2KGDeaZZH6lWW8z70ly5itfT6uR3d19V
 FYIKVf/2A0i7KMfRAvAIsYwip9QTgWtOJRo/58NqlXPLHkzgWfG3X2gtiKZaAWiI52cW
 RACg==
X-Gm-Message-State: AOJu0YyVIftGmIfM3HB1boCWWm4FyjYCXA9oWOVLiQ9PkTS6eGW7G7wY
 bGs27Pq1EbbhZO8F59kQcm8UlGhis8ubPOQ/8Po=
X-Google-Smtp-Source: AGHT+IHE7qapqdV+R+S251VNpoiJ8J4S1FcdDKmVFe+aQD/OVtLFm4MBEYK6nVNBzbAuFYyCGSiDEefkAiihkZVvE4Q=
X-Received: by 2002:a17:90b:364a:b0:26b:be62:c229 with SMTP id
 nh10-20020a17090b364a00b0026bbe62c229mr26249708pjb.32.1693262279272; Mon, 28
 Aug 2023 15:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-1-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-1-b39716db6b7a@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 17:37:48 -0500
Message-ID: <CAHCN7x+J_umWCBvivuZsrHTvjw=4CvBqOSeO-j_+fTMm=DdAOg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: samsung-dsim: add more mipi-dsi device
 debug information
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Since the MIPI configuration can be changed on demand it is very useful
> to print more MIPI settings during the MIPI device attach step.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 73ec60757dbc..6778f1751faa 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1711,7 +1711,10 @@ static int samsung_dsim_host_attach(struct mipi_ds=
i_host *host,
>                 return ret;
>         }
>
> -       DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> +       DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags=
:0x%lx)\n",
> +                    device->name, device->lanes,
> +                    mipi_dsi_pixel_format_to_bpp(device->format),
> +                    device->mode_flags);
>
>         drm_bridge_add(&dsi->bridge);
>
>
> --
> 2.39.2
>
