Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12E7080B8
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 14:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0548F10E516;
	Thu, 18 May 2023 12:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AF210E516
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 12:07:21 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-55a8e9e2c53so17431957b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684411641; x=1687003641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+vYjmpxBNlZuPV45+UQsttMirEjwbsfvsjjU7mymMg=;
 b=lDHD9kTyu6C900iWJgAaI2zvYQGebe2WQhin5yh6ukpDVVrT7AgP2envsyg2lltUis
 IlYbmeg4Cul0fO+mjEE5UfTSWx105bkw9tWQ+ekrhA20Oe+A8u8+Ru16OksVoEOR3kL6
 xlDFjtqfMAJMQ39F+6lcfqIfZcRtxr7sxCm4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684411641; x=1687003641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+vYjmpxBNlZuPV45+UQsttMirEjwbsfvsjjU7mymMg=;
 b=Sj4NliUuRd+wZpWzMB4Ooz8NRs/XBdyho1kJorSUvGY9xsJ7iYnwMFA7v7nG4tbNTd
 yi9woV6tmbxvvfpX5l3Z0zLc7foini2w5+BrdHgLw6DGeFZClZlrE4l/m79gWlsXHIZ5
 mdXR55Xlk7xRQ4n0at4K0uGODSmXIeQUeGpjwFutWMNfPuFCmcPj/MgbUMKu5xE9TDBT
 l6NkAEq5FLvdsG0UfbaDbZsmjPN/m6aoktfRMFg0fx5/CNLTR+XrV+BITwqqiRSiCoSb
 jHYMkY7iu572i9IorOjOZPWNaNDCCtdOCorX4xTs0wrQvDVHr2soHqG04IZJw2Xi5mb9
 QZdw==
X-Gm-Message-State: AC+VfDxspCFBifwwPv809xeN+w2g+PIdpyMTM2lsRtAowl7tt/KfXzdQ
 Mxv/frdE70XCqRgxXPwKv76B3gV488paz/Ydy+EuqA==
X-Google-Smtp-Source: ACHHUZ5EiaNtu81hJhKkwTw8SJXqjOyng0ZWicULB+i56VjifMMg/QzNv0DBYxkU62rX99FrRPP2foSIL7AQqjuKSVc=
X-Received: by 2002:a0d:cb8b:0:b0:561:d21d:8ce4 with SMTP id
 n133-20020a0dcb8b000000b00561d21d8ce4mr1018258ywd.19.1684411640769; Thu, 18
 May 2023 05:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-7-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-7-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 May 2023 17:37:09 +0530
Message-ID: <CAMty3ZBqdE8mLiwFa=QRChBYyQnsOEMYqh2Azj4TxbZbErCsBA@mail.gmail.com>
Subject: Re: [PATCH V6 6/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The high-speed clock is hard-coded to the burst-clock
> frequency specified in the device tree.  However, when
> using devices like certain bridge chips without burst mode
> and varying resolutions and refresh rates, it may be
> necessary to set the high-speed clock dynamically based
> on the desired pixel clock for the connected device.
>
> This also removes the need to set a clock speed from
> the device tree for non-burst mode operation, since the
> pixel clock rate is the rate requested from the attached
> device like a bridge chip.  This should have no impact
> for people using burst-mode and setting the burst clock
> rate is still required for those users.  If the burst
> clock is not present, change the error message to
> dev_info indicating the clock use the pixel clock.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 3944b7cfbbdf..03b21d13f067 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -655,16 +655,28 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>
>         dsi->hs_clock =3D fout;
>
> +       dsi->hs_clock =3D fout;

I dropped this and tested it.

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
