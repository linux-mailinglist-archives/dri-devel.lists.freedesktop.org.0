Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7145544C5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 11:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABA310E1F2;
	Wed, 22 Jun 2022 09:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FE410E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 09:06:48 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id y14so18903170qvs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ct+WoF/8EA0gYLIVTa+7U23fzJ0aSx4jkfEHvfFCTRE=;
 b=IZDdVM1P9lfAL5oWAA3vkgVY6R53JhfziG9ItVVv/St4t7d2VDkRwwg3gMXQZHKOLo
 0f63IeCJo0btvNhUWNDulHwjiGck98WQ3Nq45XewNn9571FYQBDq3PLkdyYmjZ0dchbS
 o/yz+RBo4hz2Jed9q8BRdTf04TXIt3YZIJLNXZI3jSVgxDAAun0phGyr3SgBXDkbvvyL
 nycRxIGJHItKcbTRH3Q07n8U6mqI65HsvdZGpAy4K5lMkvQ8ULAx3SdhyMARA69aPbGF
 Vs5avEaNV/IdqaR73sqQsTQp3wpvzydkXyBvR7XFqYDgQoajfVuMM8GgKZquM5Xxyhht
 8xag==
X-Gm-Message-State: AJIora+PqM+fBYJfPC9Id+HT4fpRHgHG/jwQJsQvOi+xYEI+5QAwTKBf
 8EM1JHmsS72kaR/jxcbeUYoGeaUuv/Qfxw==
X-Google-Smtp-Source: AGRyM1v4yD2x8Z0U3d8zlkWReUZYiuGu9lDJnsF14UYvVKmD2aAu5tfRx/iJimP4bHzlfaUakY9ZQQ==
X-Received: by 2002:ad4:5bef:0:b0:470:536a:d350 with SMTP id
 k15-20020ad45bef000000b00470536ad350mr5725232qvc.49.1655888807751; 
 Wed, 22 Jun 2022 02:06:47 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 p6-20020a37bf06000000b006a6a4b43c01sm15219361qkf.38.2022.06.22.02.06.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:06:46 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id p69so17377073ybc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:06:46 -0700 (PDT)
X-Received: by 2002:a05:6902:1141:b0:669:3f2a:c6bb with SMTP id
 p1-20020a056902114100b006693f2ac6bbmr2581553ybu.365.1655888806340; Wed, 22
 Jun 2022 02:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <43645c9b5cd657664c1340d40133f2116c8cef43.1655818025.git.geert+renesas@glider.be>
 <88f11e5c4704bd8510c2c6a171536484a2232f82.camel@nxp.com>
In-Reply-To: <88f11e5c4704bd8510c2c6a171536484a2232f82.camel@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jun 2022 11:06:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAh+m-tuAem0qENGEnuTw9LB_nBO3SXbVAMW8wbBtqiQ@mail.gmail.com>
Message-ID: <CAMuHMdUAh+m-tuAem0qENGEnuTw9LB_nBO3SXbVAMW8wbBtqiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On Tue, Jun 21, 2022 at 5:47 PM Liu Ying <victor.liu@nxp.com> wrote:
> On Tue, 2022-06-21 at 15:30 +0200, Geert Uytterhoeven wrote:
> > The various Freescale i.MX8MP display bridges are only present on
> > Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> > asking the user about these drivers when configuring a kernel without
> > i.MX SoC support.
>
> s/i.MX8MP/i.MX8/

Oops. Fixed.

> For now, only i.MX8qm and i.MX8qxp display bridge drivers are in
> bridge/imx directory, no i.MX8MP display bridge driver.
>
> With this fixed:
> Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
