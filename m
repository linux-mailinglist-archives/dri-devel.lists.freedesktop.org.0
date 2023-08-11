Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B977906D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254E10E089;
	Fri, 11 Aug 2023 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0B110E089
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:10:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79468672B4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F042C433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691759405;
 bh=JruCB/lMZ7JUJh0+xs7vNpmmAV0gxxkuIz4g0OeCeYo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rh+jNfatFmT3kxzr2jOOcWpwrpCn8D37cPj4mzDwnyW+EiAT/UbQfQKwOld6zAIgU
 P4jXO+/GpWcfWhUIgfAxy4rN1s95j0+BD36gpZArMvVq3avlztge+01EQcC+4/nXYk
 XMrIznCgR7Jg0WeVLl7q8CYjAYGOjWp9cQ+5Zd1Qua77+1VTfRZ2CycYjk0k97J5Y9
 5b7ZSxCiaBbThdLnbdavmJLesAwMiyaXz9WClK3L2VaRVWrfCx0Fu1ldxe7ev7+k5U
 +RnfSqWtgw8j+tANYnJMcAC6RDPJ6omJ2GVHKxbuwRjYVeCmuNR/iv2ogNSSMOgopI
 c1OP7zgUHKvog==
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-564a0d2d35eso1246648a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 06:10:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9SrNPD2cM6fYMI1q5CqUfEPCuV/dunpQwcJIFR4idwuJ0l4/R
 eNq3nXXnkj7no69OGGpoE7M3LwtbuPtJcjIK9RFmkw==
X-Google-Smtp-Source: AGHT+IFiOKh2g1AHlW71Cu67UiGldzWF8L+irqqAmBEk6TBgHMiAQtDKDA3xGTKYB1GYhMFzhDlClEkhCt6sGh7wEo8=
X-Received: by 2002:a17:90b:3b88:b0:268:468b:2510 with SMTP id
 pc8-20020a17090b3b8800b00268468b2510mr1114483pjb.37.1691759404851; Fri, 11
 Aug 2023 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230810063229.597533-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230810063229.597533-1-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 11 Aug 2023 15:09:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7iyL76ZeCpT4zYqo_b151wPBTZARJkvWhWP4MEQ_yLMg@mail.gmail.com>
Message-ID: <CAN6tsi7iyL76ZeCpT4zYqo_b151wPBTZARJkvWhWP4MEQ_yLMg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/bridge: lvds-codec: Implement
 atomic_get_input_bus_fmts for LVDS encoder
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 8:32=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> atomic_get_input_bus_fmts is only implemented for LVDS decoders, resultin=
g
> that LVDS encoders only support bus format MEDIA_BUS_FMT_FIXED. This
> results in warnings like:
> mxsfb 21c8000.lcdif: Bridge does not provide bus format, assuming
>  MEDIA_BUS_FMT_RGB888_1X24.
> Please fix bridge driver by handling atomic_get_input_bus_fmts.
>
> Fix this by reusing lvds_codec_atomic_get_input_bus_fmts currently used
> for LVDS decoders. Use RGB888_1X24 for LVDS encoders. This also allows
> removing the dedicated struct drm_bridge_funcs for decoders.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>
> Notes:
>     Currently all supported LVDS encoders (ti,ds90c185, ti,ds90c187 and
>     ti,sn75lvds83) only support RGB888_1X24.
>
>  drivers/gpu/drm/bridge/lvds-codec.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge=
/lvds-codec.c
> index 8c5668dca0c4b..991732c4b6298 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -71,12 +72,6 @@ static void lvds_codec_disable(struct drm_bridge *brid=
ge)
>                         "Failed to disable regulator \"vcc\": %d\n", ret)=
;
>  }
>
> -static const struct drm_bridge_funcs funcs =3D {
> -       .attach =3D lvds_codec_attach,
> -       .enable =3D lvds_codec_enable,
> -       .disable =3D lvds_codec_disable,
> -};
> -
>  #define MAX_INPUT_SEL_FORMATS 1
>  static u32 *
>  lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> @@ -102,7 +97,7 @@ lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge=
 *bridge,
>         return input_fmts;
>  }
>
> -static const struct drm_bridge_funcs funcs_decoder =3D {
> +static const struct drm_bridge_funcs funcs =3D {
>         .attach =3D lvds_codec_attach,
>         .enable =3D lvds_codec_enable,
>         .disable =3D lvds_codec_disable,
> @@ -184,8 +179,9 @@ static int lvds_codec_probe(struct platform_device *p=
dev)
>                         return ret;
>                 } else {
>                         lvds_codec->bus_format =3D ret;
> -                       lvds_codec->bridge.funcs =3D &funcs_decoder;
>                 }
> +       } else {
> +               lvds_codec->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
>         }
>
>         /*

Reviewed-by: Robert Foss <rfoss@kernel.org>
