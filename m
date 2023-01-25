Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64A67B681
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 17:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674BD10E108;
	Wed, 25 Jan 2023 16:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5310D10E108
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 16:02:59 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id c124so23499757ybb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GWAQIHIaK4kY4F/qnaA0oyYRwbLACZjXU/o10X03g+8=;
 b=oSDVXFnRqBTSFX9MpTINvF4dwnkWCgh7Ct/vBhzxizJUNRw4cPZ5y310BiD9rZ+5rg
 3oGuB6Gqc2SLy0j+D9JRbdDjdKf5KQkNWStHRtrJid6R4BHx+eMwTrqQQmokqx4OC+zZ
 FfPX26+TfD2FTGNv2CSp66Nz1HxteM4DaJk6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GWAQIHIaK4kY4F/qnaA0oyYRwbLACZjXU/o10X03g+8=;
 b=iug5VReMWOLfeJI2xSJdN0Wv/gCv7EjRsmRkkyCWZ2RCW9sRHFENdNpo7YcU7ZQL8u
 D79ojQloOVlENH6tHry2NpHpBeEL9HNqjW37R9GJR3sLGuQjIqmvHa9ws57R2yOOOKL2
 +BgLTAwZS7gVyj9o9+cxKupXwTSq510AjJcbfKVWG6WUMXJteZEoy0mxW7Lukwpfl2Mr
 vecOIlxwzy28ke4NDUExIHE5ZmcIalOhNh5fCDA9aiPACuvcJqQq0qXB4LnOjHHHIA4o
 OA7hLlu4SmrykSyrzmIqR0h+R3NqtWTqmHJThVm444NbYI0QaOLpfgkzs3h8u+tMJKRZ
 Bnpg==
X-Gm-Message-State: AO0yUKW7bzAv72D0xQcbaZsts/Se2+/yfBDvaHWLkYgvRWHgVaVH8+GX
 eyYbRKg9TB8kfyl8Dcppkr0DzQ5shBBTJqBtXlQC7Q==
X-Google-Smtp-Source: AK7set905btTY92dMXWIlD16t90XzLedSU7F8cTub6DM31WHila/I3M6Bf4jEXYJqclVmDSdBDKapuKj1ctwlZ175Pg=
X-Received: by 2002:a25:d7d1:0:b0:80b:69cc:78d8 with SMTP id
 o200-20020a25d7d1000000b0080b69cc78d8mr812189ybg.475.1674662578459; Wed, 25
 Jan 2023 08:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
In-Reply-To: <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 21:32:46 +0530
Message-ID: <CAMty3ZDvdWu4E3J+8KY=fsuNCSD837AY24X4VyBhR63HYCsO0A@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:01, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>> Enable and disable of te_gpio's are Exynos platform specific
> >>> irq handling, so add the exynos based irq operations and hook
> >>> them for exynos plat_data.
> >>
> >> If this is just an optional generic GPIO IRQ, why not keep it in the
> >> core code ? TE (tearing enable?) should be available on MX8M too.
> >
> > So far the discussion (since from initial versions) with Marek
> > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > from the DSIM core.
>
> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .

I didn't find this in the DSIM part in i.MX8M Manual nor in the i.MX
8/RT MIPI DSI/CSI-2 or bsp kernel [1], did you find anywhere in i.MX8M
part? Look like TE GPIO means tearing effect signal handle on the
panel side.

from, Documentation/devicetree/bindings/display/panel/panel-common.yaml

  te-gpios:
    maxItems: 1
    description:
      GPIO spec for the tearing effect synchronization signal.
      The tearing effect signal is active high. Active low signals can be
      supported by inverting the GPIO specifier polarity flag.

Maybe Exynos hack this gpio on the host side instead of on the panel
side for some reason, not sure about it - Marek Szypeowski any
comments please?

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0

Thanks,
Jagan.
