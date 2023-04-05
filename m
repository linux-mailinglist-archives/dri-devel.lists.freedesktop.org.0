Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7336D7B16
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C248510E8E1;
	Wed,  5 Apr 2023 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AE210E8E1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C579C63C24
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CD5C433AF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680693622;
 bh=vR1zxVUotiX6mn4Ov9+Z1svRKpo5pQNuaswhDQUz1ok=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WCtERRjZP/BqEood95BxFJIInErn578JbzXUtlmAIXuaaajfhAI4ek0LNYMdAF33r
 9iXQ214e9o4sgqj9APPR95Gfm/0SF4b+0dhfLy9jWzXsv2vik27qsmhtkc3+EfzJO9
 HEwS8Mthw9LkgFMBIEZuOkvZ0yZlSIk0ho1Ax0TQGbCVlGWgBQzsEhYi+Vz/ajWbUF
 SKVxVz/EE6vyraH2jPxnGZ3dAaV8SE+6PZYis2Ae2E5FH6YeZ+NelFrzqE7nwic0Ds
 aYdwDDcZnAFJP1auHUUZ06S4ifZwuydX9GVwkFBou9SyvHAnTyPwwUm2KyjHJDAw+h
 j4r86NdvF2P7w==
Received: by mail-pg1-f173.google.com with SMTP id d8so21478173pgm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:20:22 -0700 (PDT)
X-Gm-Message-State: AAQBX9cZLD1snvlrwle3eSVzRZtaMiQmJ8BKkV0OHe+MvSXDVT2GDqY0
 yx2QHP1ErcnuIF8IaOzzsOy+Wo5dxL5eSn65/PrCFg==
X-Google-Smtp-Source: AKy350aHPBMdDXQJysLa2Vtx41GU7vn6Ol1rM7Dj9awKotE8i+1eFqm8SoO0gv93Wt8pG8kNbA62JRVGkA8DbNdNiE8=
X-Received: by 2002:a05:6a00:240e:b0:62d:b08a:8e13 with SMTP id
 z14-20020a056a00240e00b0062db08a8e13mr3145600pfh.2.1680693622421; Wed, 05 Apr
 2023 04:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
In-Reply-To: <20230403221233.500485-1-marex@denx.de>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 5 Apr 2023 13:20:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6LCBjReh5noM5RMrAP1EsnKRfseAXO3e=g13aVDJ9uEA@mail.gmail.com>
Message-ID: <CAN6tsi6LCBjReh5noM5RMrAP1EsnKRfseAXO3e=g13aVDJ9uEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: lt9211: Do not generate HFP/HBP/HSA and
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
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
>  drivers/gpu/drm/bridge/lontium-lt9211.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/br=
idge/lontium-lt9211.c
> index 3e19fff6547a2..00db681512385 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -709,7 +709,9 @@ static int lt9211_host_attach(struct lt9211 *ctx)
>         dsi->lanes =3D dsi_lanes;
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
