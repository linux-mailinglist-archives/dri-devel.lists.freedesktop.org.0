Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29131FCF3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B096EB68;
	Fri, 19 Feb 2021 16:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3318999A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:17:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v22so10801791edx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwqh7eek7Wc+3t3YTsL7G0gagoVwzjjdPhWUeI8RZbw=;
 b=tLHcAE1h3wJEOF7Tn/PXq5/G5/ZviBHkahcb6WVBi6IuqnG+M48af//6lBqp38dM7U
 R3iMdRzk2DCDK9NRDoRa/TNeyl2LNPMKCUH+pJ9eYUpUHU1l7H9RBrnh5RTzpKJr7Ys0
 YLMiHEffWL8BCLfcbAkUVyTlqREKm8HDdx/DBcLoo8Rzy8xOqIbPH1g2PQbQECBOEz3T
 8eP5/mLDedi/805m/JhjWdsObXwNK114p9Z3I42ltnG3tUj+nAPMqEyXz++vC7dHGnTf
 FAWrI8RlCK6qY9lx+jFXvXDV566rKtTP4V7TDrqULfpQOM7jgsc6agylb4RaPsmkJEtq
 Uw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwqh7eek7Wc+3t3YTsL7G0gagoVwzjjdPhWUeI8RZbw=;
 b=NMTVmw8qnTOKdp3UJGQIzTDdc/eGkfthKmG6L5ABOqUdmxzuL1OGzEdRJBZb7HHsqU
 BxFHVaZ29OcbtbGZKMJ2fpQYtbeqiWrKs5bDumpkOkAspd3zJEEW2tphOVEEH+oxXgjS
 9Kc46kfMayxsZ4aOfXKtRAWW84y3b5g9dyfbUeKXxISRD6K30dx3oaKQxqvNUnObWKta
 ChE1O8YBejc8SwHYwupqV/R53zs4yxIAnCzVBby6ByfirCobW1AW3Z8vuvo4juCoXoJ7
 TUi2ECPFW6RGYtPOspiW/KERDm2bFKaUK6BvNKFTAGJ3qIuRZqpXrDxVEM2TdvfIR1N1
 uhtw==
X-Gm-Message-State: AOAM533713L3NWt+8cZaX0/gGfwb83vNixvykfnd6zHx6n2T76sfPZ4R
 GJAJhqIS9N35beZOJwMuE5d3nyANzIAtTcu7VFiGnA==
X-Google-Smtp-Source: ABdhPJwIWQ+j+RjmbGJA+kXahou9TCnyEzCx6el1aPMaVHS9Q9CO/yV3evNcaZ5G/993fNKXKux4thxwumcQ7ZpUl2o=
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr9930057edi.134.1613751421015; 
 Fri, 19 Feb 2021 08:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20210206135020.1991820-1-heiko@sntech.de>
In-Reply-To: <20210206135020.1991820-1-heiko@sntech.de>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 19 Feb 2021 13:16:49 -0300
Message-ID: <CAAEAJfB44mBxbdHgXFV1m6774O+6jYR6jG2qYz_15+Vc1dNejA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: kd35t133: allow using non-continuous dsi clock
To: Heiko Stuebner <heiko@sntech.de>
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
Cc: Chris Morgan <macromorgan@hotmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 6 Feb 2021 at 10:50, Heiko Stuebner <heiko@sntech.de> wrote:
>
> The panel is able to work when dsi clock is non-continuous, thus
> the system power consumption can be reduced using such feature.
>
> Add MIPI_DSI_CLOCK_NON_CONTINUOUS to panel's mode_flags.
>
> Also the flag actually becomes necessary after
> commit c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for non-continuous HS clock")
> and without it the panel only emits stripes instead of output.
>

Looks like c6d94e37bdbb landed in v5.10, so we should add:

Fixes: c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for
non-continuous HS clock")
Cc: stable@vger.kernel.org # 5.10+

With this fix, my Odroid Go2 has display.

Tested-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..fe5ac3ef9018 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -265,7 +265,8 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>         dsi->lanes = 1;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
> +                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
>                        DRM_MODE_CONNECTOR_DSI);
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
