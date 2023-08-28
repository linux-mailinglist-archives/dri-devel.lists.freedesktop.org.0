Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793078BB15
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BB710E365;
	Mon, 28 Aug 2023 22:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EF10E365
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:41:26 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-56c2e882416so1752191a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693262486; x=1693867286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TiU0nSh/bDTOdlRqfdKlunOzKHHTp7UUw1xqmuzkCtg=;
 b=bZHgunuHjmRJzBHOCVfP5J2P1Hzlf0RqyBl2p8RSON21PYnv8kJpWTJhnxu0/YIGF8
 MrQjSiWqo0Hc85WHJwS0LPZmCbtda9bU65vOyzbbAL13lL6d/xN+o/ynngDR9YGms5VV
 6VwdMPtLhxwvh6JcCi6NeHNDthR5RhpjrtjhJYSHrpQCjiNSGHAIqsFv9ci2+LUn6Dml
 E1oB8XI12ABw3QSX4SNWTJos/LwzOmMS5p0WmJZSxXCoOqrqU+bTIZv+hBe6pWuJ3Mvx
 a5s3DIto8pm2pv3lZyty04JeKjyL8zuR6SVOG1cTsBlQQoTRpQEvNZjLipw+l+ETsPat
 X+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693262486; x=1693867286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiU0nSh/bDTOdlRqfdKlunOzKHHTp7UUw1xqmuzkCtg=;
 b=FM0s+RuItq2cSVFeW2QMPuDPTwJLQ1YHLAJwIRstztfHZL5G/qtS5dS2wBbfgkyLpQ
 6dg4ngK49hnUz40ou45gffx45vj1WqXO1mrJwCen6DGAVKZvrLTr36sVLVgHJ9UESz3I
 uokZ5j9s2jsI6yTidF+Shws2zWTVuZ10B3maGMZcS7QfGjQ2KPMkPTE+OoVGj8aahjua
 VBgyJzx9anUOX/qqOisf42kXTgbEZM1M2XL4nq48zQ5E/QZAUjSgcyL0VUmqtc2WBtjb
 Oo4948vzxrvoQSE+u343BCk3iumtinXxVyiroFw0O0vkuegntAPfF2zkxsn7WT/Pu3Lq
 KkQA==
X-Gm-Message-State: AOJu0YyYAem88RJXrip37LqtHCAAMECccIL/q6EC/34Y4/cWhEZJUIyI
 DD5kXyR0OT0PpAQjgr70GOX1xobDUbo8UG1oZPs=
X-Google-Smtp-Source: AGHT+IFE0R3zk5BaHdObWy4m8qUsCAB6DTesmPBPjMdLOtf7rLPpfvqYDTIRJhUvA44rqwAMR6iwgqa+ar6IbJyx+nw=
X-Received: by 2002:a17:90b:8d4:b0:268:6060:c184 with SMTP id
 ds20-20020a17090b08d400b002686060c184mr21076376pjb.45.1693262485738; Mon, 28
 Aug 2023 15:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 17:41:14 -0500
Message-ID: <CAHCN7xK0J2wZj7Jxgug2vGaCg0A9+RKEmXgBGaNBSk3pXDyrHg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/bridge: samsung-dsim: calculate porches in Hz
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
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> Calculating the byte_clk in kHz is imprecise for a hs_clock of 55687500
> Hz, which may be used with a pixel clock of 74.25 MHz with mode
> 1920x1080-30.
>
> Fix the calculation by using HZ instead of kHZ.
>
> This requires to change the type to u64 to prevent overflows of the
> integer type.
>
I would argue this needs a fixes tag since the previous calculations
were not accurately generated for many resolutions and refresh rates.

Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 459be953be55..eb7aca2b9ab7 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -973,10 +973,12 @@ static void samsung_dsim_set_display_mode(struct sa=
msung_dsim *dsi)
>         u32 reg;
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
> -               int hfp =3D DIV_ROUND_UP((m->hsync_start - m->hdisplay) *=
 byte_clk_khz, m->clock);
> -               int hbp =3D DIV_ROUND_UP((m->htotal - m->hsync_end) * byt=
e_clk_khz, m->clock);
> -               int hsa =3D DIV_ROUND_UP((m->hsync_end - m->hsync_start) =
* byte_clk_khz, m->clock);
> +               u64 byte_clk =3D dsi->hs_clock / 8;
> +               u64 pix_clk =3D m->clock * 1000;
> +
> +               int hfp =3D DIV64_U64_ROUND_UP((m->hsync_start - m->hdisp=
lay) * byte_clk, pix_clk);
> +               int hbp =3D DIV64_U64_ROUND_UP((m->htotal - m->hsync_end)=
 * byte_clk, pix_clk);
> +               int hsa =3D DIV64_U64_ROUND_UP((m->hsync_end - m->hsync_s=
tart) * byte_clk, pix_clk);
>
>                 /* remove packet overhead when possible */
>                 hfp =3D max(hfp - 6, 0);
>
> --
> 2.39.2
>
