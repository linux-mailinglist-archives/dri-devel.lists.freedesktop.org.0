Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8CB48E84C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4D610E707;
	Fri, 14 Jan 2022 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889B810E707
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:24:18 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id i5so16050541uaq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=le2UM8B7mfKn0fZwAHCKL3DNfCbA6VK0XgDGxRejc0E=;
 b=Qk6RaoVpRNdJIvyleNm5cX9BFMkEvC9KDSJOIz+1PDo/74AdE3pmEeHTaBaopJIXsV
 c6CG5laeBOz+ssvZ6Nhz0AEdDwA0glZ0ykOAcymiQtcZhk1e1z5HJ6dmWxXDa51LqMZR
 iBntlZUBfuypuU4rko/qf6eqJ8lU+JXmFi5w5XXGkDHNOLjQN12IlAog1479oaeuiAPX
 HK8QWXlv25IBPaUM5z0nx2KVgiXDDzNnL5AK8gYVlvtgGsqcxkrl1fpn0/eEbHtoYwjg
 y1UbI0Pn3j51Nv7avln5xzZC4iQZdJNkLOD474tOnwGPcKVWI7xc5kFDUqdqWThOoiAj
 Bw5A==
X-Gm-Message-State: AOAM532R5hsydgLOJjzS6ujD1o/adhaWcf/z+u4eH8td7pPoADBMviZD
 C0boZRUBPvLSVf4jEPVhUNmVEbrCC0BggDNK
X-Google-Smtp-Source: ABdhPJzS74qWUyap/NjbtnO/5pLgbv46QVn6RA9uBnDlWiaKhTMfAJ3gE+M94KKIBarjXeEgwujY9g==
X-Received: by 2002:a05:6102:a50:: with SMTP id
 i16mr3736096vss.29.1642155857273; 
 Fri, 14 Jan 2022 02:24:17 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id k125sm37492vsk.17.2022.01.14.02.24.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:24:16 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id x33so16075526uad.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:24:16 -0800 (PST)
X-Received: by 2002:a67:bc17:: with SMTP id t23mr258035vsn.57.1642155856532;
 Fri, 14 Jan 2022 02:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 11:24:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
Message-ID: <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
Subject: Re: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Jan 12, 2022 at 6:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports the MIPI DSI encoder found in the RZ/G2L
> SoC. It currently supports DSI mode only.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -51,6 +51,13 @@ config DRM_RCAR_MIPI_DSI
>         help
>           Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> +config DRM_RZG2L_MIPI_DSI
> +       tristate "RZ/G2L MIPI DSI Encoder Support"
> +       depends on DRM && DRM_BRIDGE && OF

I guess the dependency on DRM can be dropped, as it is implied by
DRM_BRIDGE?

Please add "depends on ARCH_RENESAS || COMPILE_TEST".

> +       select DRM_MIPI_DSI
> +       help
> +         Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> +
>  config DRM_RCAR_VSP
>         bool "R-Car DU VSP Compositor Support" if ARM
>         default y if ARM64

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
