Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA33DB861
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 14:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9EB6E303;
	Fri, 30 Jul 2021 12:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42306E303
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 12:11:04 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id j15so3897350uaa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 05:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1AP8LPdt5gLRcNBYwMWgjeQ1bzCQMAmgWKrYpeBe5c=;
 b=tSykqA2aAyJJDqP7Ijt4zX6yauUoVY6t7gKr83KjMcL8h4wVj4KTiB6CmOqNFGU8hM
 m1H0v1oFUGOLX9QVmXU9sI0vBbO7LAFjq4kSLvNZB6FTAQ+XJItjQ1b6GjcMJEs0cI8e
 m/ajJMGmN1iLuREM6dpRAVHVRYTZ7KOegp0Ie9W30Kd0iOOE+ZGl4hoc+6Jh2L52ji0c
 PKAdynEt7otVaaUvjTOBCMcoGm5cwjI/zKuNB3MpRv/OsB3WniNw1l9zFshwohCkqyXo
 YsL/4A6jyz/xL/xZnjJ0CcvggV/qDRKMcTmuQXjM3C4L2DtL4fgD+A5SWD8+AMq73VdN
 xAmg==
X-Gm-Message-State: AOAM5304UVUTJOrwvX1lT2+7xNqkHqM2vS50fPSuaY8+xOg1q4sL+qxK
 PRijcH8YxA27YqXcqr3ZDQ6SKKD7TNUIjK0yg4pm24hiPZM8Eg==
X-Google-Smtp-Source: ABdhPJyJIDGhorRsiTqEzT0ML14O7jJqLNtZ9KfHFwW349DtL2Ol7UsTGiP4f+Vce5YzoGm5XXEPffA4L4axFg+WdnE=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr1321715uam.106.1627647063191; 
 Fri, 30 Jul 2021 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jul 2021 14:10:52 +0200
Message-ID: <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/imx/dcss: Enable COMPILE_TEST on all ARM64
 platforms
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Jul 28, 2021 at 5:37 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> To extend test coverage, relax the dependency on ARCH_MXC to also enable
> compilation when COMPILE_TEST is selected.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -3,7 +3,8 @@ config DRM_IMX_DCSS
>         select IMX_IRQSTEER
>         select DRM_KMS_CMA_HELPER
>         select VIDEOMODE_HELPERS
> -       depends on DRM && ARCH_MXC && ARM64
> +       depends on DRM
> +       depends on ARM64 && (ARCH_MXC || COMPILE_TEST)

As you now have two depends statements, I think this would be easier
to read by maintaining a strict separation between "hard" and "soft"
dependencies:

    depends on DRM && ARM64
    depends on ARCH_MXC || COMPILE_TEST

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
