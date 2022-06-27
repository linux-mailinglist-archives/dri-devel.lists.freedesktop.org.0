Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0355B97E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC17112084;
	Mon, 27 Jun 2022 12:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32204112084
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:22:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o16so12825807wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=188VvDq1B6vx6sWxx4ceVbynV0wzhkvfQ94tlUBCWVo=;
 b=JWWBEC6UjGz31es5Orpifs2fmId+2PFWHpYPGqcUyEflB+3uOZHze9pg4t/TL3Ai4z
 ZxifaLGz+qaUA8iBaWRvlQptrX59LYqMUl2hPdenEnARk5NKOxdKJFI1EpG8xFJQT3Am
 dBOxj37Hgb2Z0Wl1inYBLUDvKEs6EkWHd5cXkO3PsfcieGjlEvL1LHOjIhwT3v7Ln9XA
 cr4qTjqks7uaMc6Val0kFxsl6S61zUT0dNK3b/zCs/yL+9IHVYJIBv9E+o+yegpTtC0b
 Cw13uLX61yOXRAVMIOnGgak/Vz7p4DI660bTgKvRQBtftZMc0zQhFng+eEI7CXYFA/cr
 aysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=188VvDq1B6vx6sWxx4ceVbynV0wzhkvfQ94tlUBCWVo=;
 b=SlvpXRcmWZxNaeVOInf7jwwTkKEmYO8ijsD1PBclDR4z/LCPWfUqvZB5EYbh9gNSuW
 IV80L9WB0qDq0XPF0UBEqxi1wlMLLYydxaYFN/s1Ild6Lq8nGdUVsDI4WQ8hamKDkN5c
 vwcOV+7jJrDTGERB4lMJYklyxzYgipQjDxOmUfuNeJazSRAZuqZFuQ67GZMdtw8Gch55
 Vj5mbpAEFGkjTSwRzPSlSIYPvohkiKQi3QI+Rar4zeDFmVVGwUe2g7zs6rywCGVFvBDD
 ypCWN/bIYaBK/eUJDsy/aLdyEzNmNXV12d/ObVL4uiXJ1UaLI+qH/TJa/SQpLgwEwATf
 CTMA==
X-Gm-Message-State: AJIora9tkY0e5mvlFR8CMlCGvjCRRIn2y7+Kop7ONUkiOqoOoSjR0zT4
 FWnkWBEgXbV422F0Q06PynN21g==
X-Google-Smtp-Source: AGRyM1uP9iNE+N88b9RoSyrLps3SkHLc2iB388m4oNY4BNDo4xDy3PzsZEiuqBl66tMHwbxuA1WY5Q==
X-Received: by 2002:a05:6000:1147:b0:21b:93db:701a with SMTP id
 d7-20020a056000114700b0021b93db701amr11721409wrx.447.1656332530591; 
 Mon, 27 Jun 2022 05:22:10 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c?
 ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c501100b003975c7058bfsm13143413wmr.12.2022.06.27.05.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:22:10 -0700 (PDT)
Message-ID: <b625ba83-fee9-b668-09db-976cb3bef3ca@baylibre.com>
Date: Mon, 27 Jun 2022 14:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Marek Vasut <marex@denx.de>
References: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 24/06/2022 14:10, Geert Uytterhoeven wrote:
> The various Freescale i.MX8 display bridges are only present on
> Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about these drivers when configuring a kernel without
> i.MX SoC support.
> 
> Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for i.MX8qm")
> Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for i.MX8qxp")
> Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel link to DPI support")
> Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp display pixel link support")
> Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
>    - s/i.MX8MP/i.MX8/,
>    - Add Reviewed-by.
> ---
>   drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,3 +1,5 @@
> +if ARCH_MXC || COMPILE_TEST
> +
>   config DRM_IMX8QM_LDB
>   	tristate "Freescale i.MX8QM LVDS display bridge"
>   	depends on OF
> @@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>   	help
>   	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
>   	  found in Freescale i.MX8qxp processor.
> +
> +endif # ARCH_MXC || COMPILE_TEST

I was wondering why those were added in drivers/gpu/drm/bridge/imx since they are specific to NXP SoCs,
I think they should be moved in the right drm imx subsystem instead of this change.

Neil
