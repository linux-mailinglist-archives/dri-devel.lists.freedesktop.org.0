Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886A861F1B2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA15410E2E3;
	Mon,  7 Nov 2022 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A682D10E2E3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:20:21 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6863D660236A;
 Mon,  7 Nov 2022 11:20:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667820020;
 bh=7z542Aj3CgGqKW5DeYxuUBU2RHuE8LKZ6Cy4e7BxEYA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dl74wRMaSBKxFLE4SD7wiQV6g95KV0/pfW+wGLhCf8nqePUEfscyhBuTG1xcefTYr
 jBFnBGZ05LssJGphJq2pOX1JYUMtpHbTQ0yJYPIYtbW3JMOjOwcSzCqAXulqkL2iEk
 sjMBpX4EU9p7hwvpM4Fl1NZmIfs+g+/MkUUujWn42Hx73WL6JF2VxjD5+iOGqoZeka
 UpZoIk0zv9Ru/BQHdVRf73NLxu+/uq2u3o9eeb2cqsXu/Dru14nRNsW5/MO3XRw7wM
 0Kyc6rKQFZiEjvCMEB6rv/nlJrU4hUuHWuUHFiJ7BUSvenGKb9Eoa4QUJw+5P0XOtY
 Ew95u+utNO9lw==
Message-ID: <988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com>
Date: Mon, 7 Nov 2022 12:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 12/12] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-12-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-12-a803f2660127@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 143 ++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   5 ++
>   2 files changed, 141 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 508a6d994e83..8052b47042b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -14,7 +14,10 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/reset.h>
>   #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>   
>   #include <video/videomode.h>
>   
> @@ -65,10 +68,14 @@ struct mtk_dpi {
>   	struct drm_bridge *next_bridge;
>   	struct drm_connector *connector;
>   	void __iomem *regs;
> +	struct reset_control *reset_ctl;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>   	struct clk *pixel_clk;
> +	struct clk *dpi_sel_clk;
>   	struct clk *tvd_clk;
> +	struct clk *hdmi_cg;

I admit that I didn't really check these clocks, but judging by the names,
it is highly possible that one (or more) of them are supposed to be parents
of some others.

The first suspicious ones are dpi_ck_cg and dpi_sel_clk: please check.

I'm also not sure about the hdmi_cg, shouldn't the DPI have a HDMI port in
the graph that you'd declare in devicetree?

Besides... you're doing a lot of work to check if (is_internal_hdmi) for
power up/down paths, but seeing that you're introducing this change after
adding the HDMI driver makes me mostly sure that the internal hdmi that we're
talking about here is the one that is managed by the HDMIV2 driver... and
this means that you should really, really, really rely on connecting inputs
and outputs the right way in the devicetree, as that will most probably make
you able to write practically 0 code to manage power for the DPI... and may
also remove the need of adding the hdmi_cg clock here...

Regards,
Angelo


