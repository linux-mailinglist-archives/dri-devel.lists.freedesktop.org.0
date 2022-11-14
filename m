Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B05627793
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A654F10E27D;
	Mon, 14 Nov 2022 08:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7610E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:27:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d123so7625059iof.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mmp1dYQCbZLGOPjiM2VzGz3cHY77hSYHeqQM7i6gYwU=;
 b=pP2VMtbFMeWnVX6GpnQ/REv1U4873cMuvb+A5Xt16esbTDwV6k7EOk+Whl9RhAI2VS
 V6ZqKgYBpWwp79cNQT3ivYrBfr89Vxob1V11IqGwvrN0UrB9dLkRRGo/n2Z7gI5O020D
 mSWMnR8tY+l9tNHYR8+0DL1ZFCUBlSuWoK8wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mmp1dYQCbZLGOPjiM2VzGz3cHY77hSYHeqQM7i6gYwU=;
 b=KJ55SBGLwW5XH5PoWl2w70VJQprz2z92Icyak0gMfwscJW06XReA8t0w4LTEK8wfXp
 JiK9s7TNeiP9aesgnGOEJjDl7Ph7MQV/jvtmTVNxGxtZrJidf5TXl8tDGHuLuEGzU+C6
 GlXSG2oktX4Cstgsb2P9psMmqXPgF1fiDNzZV2tAnwIjakAi88iEaykFLeERVdLc3tee
 cD+7afwZWiJA84/R7FMVaRulQVqAPeqe5dwK3K6ouqj5Vav2fQ/BeGFiTx7k3oo17WYW
 0Zdc9bIUu4OqZsQZj3RPJFzbixcFexxpeXzy/VOl+zCzzbCfsbhmwsOBWQp/QWxNg4zx
 xRUQ==
X-Gm-Message-State: ANoB5pkzc2M91sg+rWwliSM7yJ3Ldwsmnv6+D5uM4RrB/5Ip4Ddl20f0
 pTWvvqYgiit9YvK0R2dSqUxT/xZT7SuziwAkPP2O2A==
X-Google-Smtp-Source: AA0mqf4CJNi/WT6y/nKg/6/MbojI99gy2fNilUDmZmqOZVGq3dUI3+Z3OCdc4F9z5LpkCdp5KzydLeE67p8aNZ/vyQ8=
X-Received: by 2002:a6b:b7c6:0:b0:6d6:bff5:bbdf with SMTP id
 h189-20020a6bb7c6000000b006d6bff5bbdfmr5126103iof.156.1668414437562; Mon, 14
 Nov 2022 00:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com>
 <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
In-Reply-To: <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 14 Nov 2022 13:57:06 +0530
Message-ID: <CAMty3ZAAYnDyWpZSmq2MRk2SHg7Oi2wUuA83K1Zno2WnrLPaJA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
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

On Sun, Nov 13, 2022 at 5:55 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 19:38, Jagan Teki wrote:
> > HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> > conversion as 'disable mode bit' due to its bit definition,
> > 0 = Enable and 1 = Disable.
> >
> > Fix the naming convention of the mode bits.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index b5305b145ddb..fce7f0a7e4ee 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -75,10 +75,10 @@
> >   #define DSIM_MAIN_PIX_FORMAT_RGB565 (0x4 << 12)
> >   #define DSIM_SUB_VC                 (((x) & 0x3) << 16)
> >   #define DSIM_MAIN_VC                        (((x) & 0x3) << 18)
> > -#define DSIM_HSA_MODE                        (1 << 20)
> > -#define DSIM_HBP_MODE                        (1 << 21)
> > -#define DSIM_HFP_MODE                        (1 << 22)
> > -#define DSIM_HSE_MODE                        (1 << 23)
> > +#define DSIM_HSA_DISABLE             (1 << 20)
> > +#define DSIM_HBP_DISABLE             (1 << 21)
> > +#define DSIM_HFP_DISABLE             (1 << 22)
> > +#define DSIM_HSE_DISABLE             (1 << 23)
>
> Those four bits are called Hxx_DISABLE_MODE in the MX8M{M,N,P}RM at
> least, so keep both suffixes .

Okay, I will update the suffixes.

>
> A separate patch which turns those bits to BIT() macro would be nice.

I plan to do this conversion for all bits once this basic patchset
merges. I hope it is okay with it.

Jagan.
