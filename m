Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DC62EDCC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 07:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28F10E6EB;
	Fri, 18 Nov 2022 06:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14F810E6EB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:40:51 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i5so2092163ilc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 22:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1h3lz0DSBoategYLivX3zWUKi0KsQyvxUG/DauE+x84=;
 b=BgAqPYkiUcaOX+t8/tpxntr/ai3Ou5E79vr1OFokABSABuwAAYyVh64Nhu8UPY4dVf
 B/ZnFiIO7tNYNJuAvrf//8GaApB/mCIJxX33MWHtoIowgVZIU8//AMe1RRlpJ0AyTIAo
 ennHZF4pCYHgfir/BYmric0v0TxN6tgJ50uzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1h3lz0DSBoategYLivX3zWUKi0KsQyvxUG/DauE+x84=;
 b=aALIpTqZIkoaGiyNltkfxVmwr6dmArmKSc9iO9ctmMB+N6fy6BJyib4ikD50JMEsRU
 aIpPHSHsgGvwskAT28PmNEn/qBiAA6fnMvASIcOHhp2LYiZ4e5IRXy8TqEm62Ew9NPbj
 SjSBIIIkGJZ/BZjyx+jZNdxGFP4TbGvjpjk0J0JcR+Tiiu7Sjtkt6ktGN8DrMvTdLKY2
 LwOvJsTWtuHkoHS5pKXI5PuQHbGv/5DmNABjpI/rv/hx1ESQkZxbY6YDguq5XNP6C7Yg
 AZMaeRWyb2P3ra26XSmBUAll67I12E4HjclZOK8gkOWjyMo7OFZd4ZDf+AaiLvWnkTh0
 /nVA==
X-Gm-Message-State: ANoB5pnjfP7TBc3uFTHJ0qFdK07bNMN1GbQC/p4vP68vr8UgvK87Vvof
 hpwbxr5jjfVaKGr4t1hcf5jkzurlvgiXCCfbD/p3OA==
X-Google-Smtp-Source: AA0mqf4UfhCd1mank/MvokLXuih0ZIMQlLg/WJN5Og6vXb1s7xgvXH94iPkW/Z+oJ+BeEucny5tnsra81ke6v3qEgrM=
X-Received: by 2002:a05:6e02:5a5:b0:300:d831:8c90 with SMTP id
 k5-20020a056e0205a500b00300d8318c90mr2729866ils.21.1668753650978; Thu, 17 Nov
 2022 22:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-4-jagan@amarulasolutions.com>
 <47ed3aae-308a-3b13-93c5-e31a3024f3a0@denx.de>
In-Reply-To: <47ed3aae-308a-3b13-93c5-e31a3024f3a0@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 18 Nov 2022 12:10:40 +0530
Message-ID: <CAMty3ZCQhR64k8f1DN0uYnL2TSRc7LdqWym2usPTa2AKYKa2HQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/14] drm: bridge: Generalize Exynos-DSI driver into a
 Samsung DSIM bridge
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

On Thu, Nov 17, 2022 at 10:31 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 19:38, Jagan Teki wrote:
>
> [...]
>
> > +static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
> > +{
> > +     int timeout = 2000;
> > +
> > +     do {
> > +             u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
> > +
> > +             if (!(reg & DSIM_SFR_HEADER_FULL))
>
> Seems that unless I wait for DSIM_SFR_HEADER_EMPTY here, there may be
> some command transfer corruption if very short commands are transferred
> in rapid succession. This can be triggered with icn6211 driver for example.

Not aware of this test, maybe adjusting or fixing the wait code on top
of this initial support later make sense.

Thanks,
Jagan.
