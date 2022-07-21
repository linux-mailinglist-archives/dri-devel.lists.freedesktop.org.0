Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AA57C99D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D97E8EE45;
	Thu, 21 Jul 2022 11:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB4B8EE45
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:12:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ez10so2487941ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3bWB1n3BjW/TWB6swVQ3izNKlloaKqYiwDk5KO5rsGQ=;
 b=prTqJ3kszRl/Y6aPlIRDyWcAdAdZZVSCgCKaZOW5wh9Qt6FYpuattroTDjlAnkG9bT
 SEHTFuTrk7VKRDs8xBtNq8xD56FJcgcMQwIGGZuh2D3Xlz4B2JHMGGwgTzsIW3f8hzIY
 4jQhmtwrivDGIg9yija8XOcC92kLB2Zgk3ess=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3bWB1n3BjW/TWB6swVQ3izNKlloaKqYiwDk5KO5rsGQ=;
 b=iks/anxHdyJgkivsO7rAPjS41NG3dvBIkliDQ2DqLeVus23OXE8Sb6EFLlW5iRI10R
 dS0c2f4jA/ntygOOcPtzHe25t9RLXULVQ27TXCS3Z9ofnA5NQ/ewgJWwDnc6bcfg0YaC
 eMtMCwYCd9Q1YVh1Ni+qX3Lctzf1NNjPvoIItPeGbwCaFzwBWkvv0Ja036zfljBzTzp9
 Z1SAX/uwL5ED800WQJPPZc8fqjNdoqG8Zb//+TGgWzaAhbTR2ZPjqPDDYMTOEiKyWhjr
 /vbo6Pl02jCSr1Af7/x/Nbm9TVhx5nC+GZbQY7OA1WWbJnky1MSm55qHm1l4XFuWgtHe
 BmIA==
X-Gm-Message-State: AJIora9VEgrUMSBCMU558XwMlRbaNQYMUcTB/67lq1V12OtFFVJ7HHmO
 fDzKlcO9c01u3UfkfT5+AFaOsncJ91/qOns95iAIPA==
X-Google-Smtp-Source: AGRyM1sF67vJVc6cIWxuhYrLplHoU7hktpFBGLNNhVWl498hs+oHq2RaVIFs7/eP0Tc1GWg9p0GxCg1EHAqrObvx1x8=
X-Received: by 2002:a17:907:1629:b0:72b:68e9:bf2c with SMTP id
 hb41-20020a170907162900b0072b68e9bf2cmr39581240ejc.760.1658401976678; Thu, 21
 Jul 2022 04:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155329eucas1p1643af66a6bc9eb3cf478fc8b064a620f@eucas1p1.samsung.com>
 <20220720155210.365977-9-jagan@amarulasolutions.com>
 <de9b3aa2-c1d4-6ee5-5061-27cec4bab679@samsung.com>
In-Reply-To: <de9b3aa2-c1d4-6ee5-5061-27cec4bab679@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 21 Jul 2022 16:42:45 +0530
Message-ID: <CAMty3ZAwJ9SSiJatk0mjLUfyRUd=H7BwWooD65CY+az4ESUvbA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] drm: bridge: samsung-dsim: Add module init, exit
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Jul 21, 2022 at 4:39 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 20.07.2022 17:52, Jagan Teki wrote:
> > Add module init and exit functions for the bridge to register
> > and unregister dsi_driver.
> >
> > Exynos drm driver stack will register the platform_driver separately
> > in the common of it's exynos_drm_drv.c including dsi_driver.
> >
> > Register again would return -EBUSY, so return 0 for such cases as
> > dsi_driver is already registered.
>
> I've already pointed that this is a bad style solution. It will also not
> work in the following cases:

Yes, I have seen it in v2. (sending again since its part of the series
and resolved other issues on v2)

>
> 1. exynos drm and samsung-dsim compiled as modules - samsung-dsim
> module, once loaded, will register the driver and exynos_drm won't be
> able to register the exynos_dsi.
>
> 2. multi-arch case - if one compiles a kernel (disto-style) with drivers
> for both supported architectures (exynos and imx) - in such case it will
> not work on imx, because exynos_drm driver will always register
> exynos_dsi driver first (even if the kernel is booted on non-exynos board).

Okay. I need to check the best way to handle this - so far this seems
new. any suggestions, please let me know.

Thanks,
Jagan.
