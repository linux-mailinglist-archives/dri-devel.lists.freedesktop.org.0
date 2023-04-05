Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2CF6D7B18
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DEC10E8E2;
	Wed,  5 Apr 2023 11:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE4510E8E2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D1BA63C05
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AFBC4339E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680693644;
 bh=NipZG0F+ZBrXDQTv7/ULz0hKlQDtAlEyT3kLLfV961U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LetV3RBhjQqyGYRsw0wn7J+8XY1dyGkKRWnpor2he0YkQe5VCvy79G69+EDsdVAje
 OjXCnj8vzT6ZSQGmDS1XUWm0G+BCddHy79KNt+O6V6YF9NKXyQowvSS6nLe9c48TcE
 nWJMBtMmJe8jal1bICRbvmFPQYduPHPuXbUedjGohEYcW62f+D8qrO9Uj5qYVnRrun
 7QHRPHMkWm6ztjbWCTgZ//7w9Fcm3jCuEYu4ydXtJY5k0oiHszKbHTKWeFSi6/tXAF
 iQI3xFOzNcYG1SSxtAduub6d9ji3T1HqPMHosQIyvdxGvYoNRD0GxyQv/KbWkV5xrM
 YiEvPXEyqKoUQ==
Received: by mail-pg1-f176.google.com with SMTP id 184so6836111pga.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:20:44 -0700 (PDT)
X-Gm-Message-State: AAQBX9d3WVF2fOuhJ9qhJyZSUcKHEeh/9uHEMiD86wAOdJwmnyKc23Ew
 0ploD65qj42MpeyhQQ/npUuBXF0f6FDF6tP3Tbbzsg==
X-Google-Smtp-Source: AKy350YHVoPys3vSHgPl7VUDT0lRN/qCgE765CJxhnmiDOdqBujKV4HUK5bAAs4It+AzOie5ycRzVeydjyqenZDEpzw=
X-Received: by 2002:a63:4506:0:b0:50b:188d:25bb with SMTP id
 s6-20020a634506000000b0050b188d25bbmr1843350pga.5.1680693644430; Wed, 05 Apr
 2023 04:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
In-Reply-To: <20230403221233.500485-2-marex@denx.de>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 5 Apr 2023 13:20:33 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7wHc6_dFJbfiEcq3pHpOav1+fwb=V9h-0CHb6T4yL+GA@mail.gmail.com>
Message-ID: <CAN6tsi7wHc6_dFJbfiEcq3pHpOav1+fwb=V9h-0CHb6T4yL+GA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Marek Vasut <marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 4, 2023 at 12:13=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as these packets are not required. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index a25d21a7d5c19..151efe92711c4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -774,7 +774,9 @@ static struct mipi_dsi_device *lt9611_attach_dsi(stru=
ct lt9611 *lt9611,
>         dsi->lanes =3D 4;
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYN=
C_PULSE |
> -                         MIPI_DSI_MODE_VIDEO_HSE;
> +                         MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_N=
O_HSA |
> +                         MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDE=
O_NO_HBP |
> +                         MIPI_DSI_MODE_NO_EOT_PACKET;
>
>         ret =3D devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>

Snoozing this patch for a week before applying.
