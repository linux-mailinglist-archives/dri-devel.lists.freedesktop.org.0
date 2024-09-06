Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE496E743
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 03:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347510E0C9;
	Fri,  6 Sep 2024 01:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AwK8iiRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1312910E0C9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 01:24:03 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2d5f5d8cc01so1033643a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 18:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725585842; x=1726190642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNUn9mXf5C6UNEuTt3eUfW8jIvalDCTepQKAUNKiQ+Q=;
 b=AwK8iiRLhSYqewadNdF/lSHmLwvgIY6itKI4rL9jmfm0Sc850BmNo1ehSIoATNIiIw
 EoHEsLgLORqNZDD/k7sNWK6pxz6Y8F4oLvEoVnyjotDyGTc5q12DqSeYakKKtp7TepBy
 yeF38lrIVE9zsz5tI+3S33AJr5V6EjsWcq8iKQ4jGfYf9VzDqxEveosn4qWD9KMnd6ex
 AvMDfzAPwO0h/l3+IR44fJEXmGnMh+efNoYOEsBE0g4b3lUUNUQRdFZMlhSpsf2lqpla
 /oNxARhfbMkQ/IRho/xJBhCdmtWMBHPk0kUPHAEYyOsRD4lrMmhMVk4qttAePtpp47iG
 kYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725585842; x=1726190642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNUn9mXf5C6UNEuTt3eUfW8jIvalDCTepQKAUNKiQ+Q=;
 b=QE5TVP1cLZ+BO5Mcj8uaL95LZpoCd3iM/jj3lFzlAD7J9C7eeJqEKJSbZzE3PeS2bn
 1351eJfwUd9pkMbxQLfvavXXLURce2eF3qyKh1g8wu6hcp6ewZMuRQZ7KH0iwsw7SCCq
 7/bpfwshO59IRz5dMoATjvk6mFgoATEt9MYbX8QfVtect1dD1q4IUzFJWGfFmBz3y/dC
 V9/xjBipNe3ICbSX7LF2lO/Ykf8aihyvFkebX7FTQuTudhFPeYEuOh7eVPUGtRmn40d6
 skJU7en+a+pmQWJGbUblLbTw4oVWOizESbehNgWgs18Ihp9njyFR7lMhtsPf2IRPoRMK
 cGhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeLlBL2o5vt+mOloeRc6Sh5TorbbSQYPjpcGebSf/RNPtLkyi3MAw19mIcm35yyT94v1s2xzwZtjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxex9PhROAXB7xqLV2cuSuN0RHfooWOXMzENcwUYuoFwDvpPmj
 8+uLWFRCi0toRPHqk9vniNiyKCQCFdI/8XIkW/tk3bMNLLnfVM+LHgjdu4B2M9sW5AyfM6URYRp
 mfQQfBWt8emAlLRZHaZei2AB/ka4=
X-Google-Smtp-Source: AGHT+IEzidPjWUAxLPR+PLVPSNwJ7lIMn8k2LTrBVIUEZVpFdJ+OKRUvczF0LpmZQ/Y8yM7A1+ju97f0lISmBkyxGkU=
X-Received: by 2002:a17:90a:a018:b0:2d8:719d:98a2 with SMTP id
 98e67ed59e1d1-2dad50294d4mr1690680a91.7.1725585842408; Thu, 05 Sep 2024
 18:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
In-Reply-To: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 5 Sep 2024 20:23:51 -0500
Message-ID: <CAHCN7xLmZYZcHyPh3gy20vFKP7aTDKvWu+a_mbG6LN2gdEifTA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Sep 4, 2024 at 3:31=E2=80=AFAM Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
>
I went from 19 options on Modetest with my AOC 4K monitor to 31.  Of
those 31, three did not appear to sync, but not all the frequencies in
the LUT sync for me either, so I have no objection to moving forward
with this, but I wonder if we should have a note in there about why we
have a 5% tolerance.

> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

Tested-by:  Adam Ford <aford173@gmail.com> #imx8mp-beacon

> ---
> This completes the patch series sent by Adam Ford here:
> https://lkml.kernel.org/r/20240904023310.163371-1-aford173@gmail.com
>
> and makes the cheap screens we recommend work with our imx8mp board
> without further kludging.
>
>
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/dr=
m/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..9431cd5e06c3 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *d=
ata,
>                        const struct drm_display_mode *mode)
>  {
>         struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi *)data;
> +       long round_rate;
>
>         if (mode->clock < 13500)
>                 return MODE_CLOCK_LOW;
> @@ -30,8 +31,9 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *d=
ata,
>         if (mode->clock > 297000)
>                 return MODE_CLOCK_HIGH;
>
> -       if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=3D
> -           mode->clock * 1000)
> +       round_rate =3D clk_round_rate(hdmi->pixclk, mode->clock * 1000);
> +       /* accept 0.5% =3D 1/200 =3D 5/1000 tolerance */
> +       if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
>                 return MODE_CLOCK_RANGE;
>
>         /* We don't support double-clocked and Interlaced modes */
> --
> 2.39.2
>
>
