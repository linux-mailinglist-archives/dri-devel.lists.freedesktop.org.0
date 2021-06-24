Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD353B2A60
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8A66EABF;
	Thu, 24 Jun 2021 08:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC66EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:30:57 +0000 (UTC)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwKlD-0005Il-Gk
 for dri-devel@lists.freedesktop.org; Thu, 24 Jun 2021 08:30:55 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 u4-20020a1709061244b02904648b302151so1713662eja.17
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 01:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWf1/8cps0f2orI5AbiDd3FTEBu65FvivubU0HnKemc=;
 b=fTUzwOQkfk6bC0mIhYrAORzHJ5zghUNq86P8zAl6vBQsdYZC/qYhX/Z/aJmHcu/ymo
 ES5cm7Fg2zxqwj4lpDiVS+gCVc3OzV9jDvi7HbviZOXDNmR0VrQ4EDAv3iBKAtgm5laH
 xz++zFXWPsmCr8CGZXCxeMv80LqIJyawahhheWk9OsraDU9ki7IMl+yFjNYWpzuwdpjt
 N43KTwVcw8NVOfkJCChNAuuZlNUbXl3B8SegbSYMzNaS/N1ox7nw4z1/6ae8b5PhgAZE
 mndFDiIxbgwsPHjMGvSukktqM/03rc1sEMF9kvsgD95/hqHSfddke5FGESCptAEzvM8+
 UdeQ==
X-Gm-Message-State: AOAM533xSayGGCNHtalKeqCIHkdGYszCUbOiOsgC444rfHGDuFOBMmZ4
 KOiGpMmDypssy6VJvKSaQRukpHnUeDYn4uGVywAtd8mLth0iGBMuRxVOgpGGdjYOPNAkNJWCJSW
 WW74pRQRBR4syZlAgsyfl54sTui8RiOaVZNS110fwWsVSYQ==
X-Received: by 2002:a17:906:dbd5:: with SMTP id
 yc21mr4064962ejb.233.1624523455180; 
 Thu, 24 Jun 2021 01:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE9NG70Q0R7WlldJgiju8y4R6tNhr+XdnWHXcuF262S4ipiZ1rkQiFP2aNPfY2SEkDu6zFjg==
X-Received: by 2002:a17:906:dbd5:: with SMTP id
 yc21mr4064931ejb.233.1624523455018; 
 Thu, 24 Jun 2021 01:30:55 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id a3sm1417424edu.61.2021.06.24.01.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:30:54 -0700 (PDT)
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2decfea3-3659-2a3b-7706-326c97f57f8e@canonical.com>
Date: Thu, 24 Jun 2021 10:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2021 04:48, Fabio Estevam wrote:
> Hi Jagan/Laurent,
> 
> On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> 
>> Looking at the register set, it seems to match the Exynos 5433,
>> supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
>> that driver instead of adding a new one for the same IP core ?
> 
> Yes. there was an attempt from Michael in this direction:
> https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/

That's the proper direction (maybe as Marek suggested - sharing common
code like for Analogix DP), not duplicating a driver.


Best regards,
Krzysztof
