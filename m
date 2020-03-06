Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB017B7D7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231B96EC67;
	Fri,  6 Mar 2020 08:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933ED6EC67
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 08:00:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g96so1536470otb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 00:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKvifh6khq6TLsSE0vcYSICDF7ZYlkhTtLvLZlGgCxw=;
 b=dxphUi6i23uH6Ky9QDLdUj3Y6AxftxG82UNgjkkXLLsNSU5u7+qq7x0EN0o9/uryYH
 k7hnalmeoRExHw9EM1oAXsjZdHu3W7eR0QzuldE7QL4UivFWxnGfEciNjt+Xc4PSNQCy
 URUZHypTJ4kjuxOFddamgmkMv+9h729kOy2gO0lT7b99ah1OAZImWkbjSp2s02sW2EqF
 +slm0eJ6T43k0Ciw/D17f/ehelpbflvNleXB6RqyvoTw0s983toPUvjeODTllkcloCgg
 So/xWuGOiUQQST1m11RQmZcRvXrtr902n6yoRFOznykCaZH8ecHLraBOZ7TePbvUoodj
 oVSA==
X-Gm-Message-State: ANhLgQ2thQfzOB1X+nyyzvMav+O1luBYP+vCZELWsGahSXIX+bbEsipB
 0MO9H+y7lgQ+zU6shtlV73HhGJ/VH2TNFiER78w=
X-Google-Smtp-Source: ADFU+vslFJIqD7NVOi0pzRNQv5zGFctvmn9FUNf5MC80KDiKCIu60GrFhZuH4Qh4VMg4lJ9w+4Mit7IhEOnS7wS7kYc=
X-Received: by 2002:a9d:b89:: with SMTP id 9mr1502003oth.297.1583481623780;
 Fri, 06 Mar 2020 00:00:23 -0800 (PST)
MIME-Version: 1.0
References: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
In-Reply-To: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2020 09:00:12 +0100
Message-ID: <CAMuHMdV8pKP3_6sO+BSyqde9J_qkac7+nc8RnTZwOuphqAnTSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: rcar-du: make all sub-symbols depend on
 DRM_RCAR_DU
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thanks for your patch!

On Fri, Mar 6, 2020 at 4:18 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
> symbols do not depend on DRM_RCAR_DU, the menu presentation is
> broken for these and following non-R-Car Kconfig symbols.
>
> Is it safe/appropriate to make all of these symbols depend on
> DRM_RCAR_DU?  It make the kconfig menu presentation much cleaner.

I think it is.
But I'd use a big "#if DRM_RCAR_DU" block instead of individual dependencies.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

> --- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
> +++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
> @@ -24,6 +24,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>         tristate "R-Car DU Gen3 HDMI Encoder Support"
>         depends on DRM && OF
> +       depends on DRM_RCAR_DU
>         select DRM_DW_HDMI
>         help
>           Enable support for R-Car Gen3 internal HDMI encoder.
> @@ -31,6 +32,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_LVDS
>         tristate "R-Car DU LVDS Encoder Support"
>         depends on DRM && DRM_BRIDGE && OF
> +       depends on DRM_RCAR_DU
>         select DRM_PANEL
>         select OF_FLATTREE
>         select OF_OVERLAY
> @@ -47,4 +49,5 @@ config DRM_RCAR_VSP
>
>  config DRM_RCAR_WRITEBACK
>         bool
> +       depends on DRM_RCAR_DU
>         default y if ARM64

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
