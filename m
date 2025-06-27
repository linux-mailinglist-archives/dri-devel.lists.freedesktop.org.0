Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FDAEAC78
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 04:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BF310E311;
	Fri, 27 Jun 2025 02:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbMwNmG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB9B10E0A0;
 Fri, 27 Jun 2025 02:01:32 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-530d764149eso488793e0c.1; 
 Thu, 26 Jun 2025 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750989691; x=1751594491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
 b=KbMwNmG7c8jVTUax/C5F2sQ5R+G6rxHJTf9/vA/LH0G3d1WQgowI4Xf2Kyv+fiv8yf
 RMkOkUbLjSJtovVykFc/tyYsODzGXNUrxyJTPiLuzQOQIerVMLH1krL26vNGgR2mZ95c
 WfDG305EoRwkibUuGMRT6lAC55DvvcAKYV1O9dikjhN5PjGwQsmsP8oxocA5v0s0aDdY
 8TiXI8huBBnuhixbPz3HGNQ57yXjR6b+9xNM7DSfy2bEU6EhmzD0Q1Wt8Iu7S9ve9FQo
 d1uo6/TCjRGRYLkamgFEp4PM6T/8ZP6se/qMuWc9jpTk7i8UX0ccyFt+pUxEFRLF2GDI
 TxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750989691; x=1751594491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
 b=D26UqdEcuwt+9KqRMAeArRuRIDLWU+Ry7CBdYwXEhgxZUjzkVFVOoVZ3pT2tURYypH
 9cqQ6P56TboGb9OxjZIEh4onYf4nWNysMv8tlMtT2hiYOCEfo/bdITlYQeUpryL8OUwH
 bBBspefXclb9R87T6X1AI4Hcsy4wy32tFxJk05w88cBZtstj1xBOCUuEqurV9hhDOux2
 Qtnz9UlBQJJ3inSfLpyA4zyWggagEy0jAwplgh7bSDxbGpJR8lK+Q9NO/6TR4zRln7kU
 Mp9cIhy87WhNDWpK9+hi9WEHUtCm+HhngNPjq9cb0hE8IzD1E2DDHRapoe61lkEZbB5o
 MAdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxGTnU5ok9Kta0m/e2199KfiuQkQhy7MhYcigdf+qOzDQTY1LPrNnJ5F6wTkMlu+jGQTsbzqM/CW0=@lists.freedesktop.org,
 AJvYcCWyCPsr65nKPrtC6ZbTx0OXQHlSjAmcmyeH3uAioaTEB2XvRHoRHqnFcC51Mcd5+crtBq4d9jTjiq7b@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm2PW3ernp+xW0fRhoNd6eANBypo3QFJ3Hms/QTqwUtRhrQxOv
 tdz16SVarb+/3jLyGX5gF2ywcFUhI3MN5ecGUQ10m/0Qr4rAuIUWyA0h6fIXE5f+fHYxItxEWXS
 dlDoiqXRcjRM62X0GoBOH4ZmtX1h7RCY=
X-Gm-Gg: ASbGncvO96jSjbRUe2QbDahepwz8ILqWZk9zLiYW7hjfxL5biLKupwXm2quyS1ACI7C
 kgXxGkdpsGh4Q6Q+gbS99YtDsra/UuFb7d0gkhGl+Ck9S1DEi2akoZC6es0owq0kJfdk5CGM+9N
 /eWJMLjgN1Gnnni98qC/y8p7vSNdWDKMp4gnZ4bU5zOg==
X-Google-Smtp-Source: AGHT+IEfDkUmXmdGNiYTAmO+fSQE3VFxMdbIHmR6wR3Spz90Kei7f1lHrowLtUvc0N5RL+zWLCQWluZ6/tNtS2e7eSo=
X-Received: by 2002:a05:6122:21a1:b0:531:4041:c4c7 with SMTP id
 71dfb90a1353d-5330bfd4563mr1451187e0c.7.1750989691380; Thu, 26 Jun 2025
 19:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
 <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:00:55 +0900
X-Gm-Features: Ac12FXzQxzyREaVVCRYXuMvFKjupkA98dfTPk38AOS_x9wbPi10kqXkSS64ZqjU
Message-ID: <CAAQKjZNG73CX8ebxqLgcYRGguGya-9zODL3BTdBDgbgJLJZ9jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

Hi,

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13=
d69104912087384 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>         bool first =3D !xfer->tx_done;
>         u32 reg;
>
> -       dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\=
n",
> +       dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n=
",
>                 xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done)=
;
>
>         if (length > DSI_TX_FIFO_SIZE)
> @@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct sam=
sung_dsim *dsi)
>         spin_unlock_irqrestore(&dsi->transfer_lock, flags);
>
>         dev_dbg(dsi->dev,
> -               "> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %=
u\n",
> +               "> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u=
\n",
>                 xfer, xfer->packet.payload_length, xfer->tx_done, xfer->r=
x_len,
>                 xfer->rx_done);
>
>
> --
> 2.49.0
>
>
