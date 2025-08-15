Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A653B280D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8110E967;
	Fri, 15 Aug 2025 13:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="FjliZxpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95910E263
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:50:40 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FDoXoC2615996;
 Fri, 15 Aug 2025 08:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755265833;
 bh=7XQhf8b1lSnCYAFBATVY+THATyFGfb93E2LT2ShyR6U=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=FjliZxpEpSzKZBd2AQNXUeOJDfoHUMOUz55e1aa2zNi1Wp+6QEhy1oh68w4TCac8B
 Q5UeXBPq6yeA+hzaNjszbvPszkjiAcqHq+LLqCntAjJN2p4zco9PWa1qoOiqwLne9O
 DUCsJzg62jVtPk0Rg8iUa/HhrnOdKTFDNeJvqf3Q=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FDoXLn2629259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 15 Aug 2025 08:50:33 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 08:50:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 08:50:32 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FDoWno1371580;
 Fri, 15 Aug 2025 08:50:32 -0500
Message-ID: <08eec1de-1c92-44ce-8caa-2dc43a67c514@ti.com>
Date: Fri, 15 Aug 2025 08:50:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] drm/bridge: it66121: Drop ftrace like dev_dbg()
 prints
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-3-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250815034105.1276548-3-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/14/25 10:41 PM, Nishanth Menon wrote:
> Drop the ftrace like dev_dbg() that checkpatch --strict complains about:
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

> Changes in V3:
> * New patch
> 
>   drivers/gpu/drm/bridge/ite-it66121.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index aa7b1dcc5d70..9b8ed2fae2f4 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1384,8 +1384,6 @@ static int it66121_audio_startup(struct device *dev, void *data)
>   	int ret;
>   	struct it66121_ctx *ctx = dev_get_drvdata(dev);
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	mutex_lock(&ctx->lock);
>   	ret = it661221_audio_output_enable(ctx, true);
>   	if (ret)
> @@ -1401,8 +1399,6 @@ static void it66121_audio_shutdown(struct device *dev, void *data)
>   	int ret;
>   	struct it66121_ctx *ctx = dev_get_drvdata(dev);
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	mutex_lock(&ctx->lock);
>   	ret = it661221_audio_output_enable(ctx, false);
>   	if (ret)
> @@ -1479,8 +1475,6 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>   		.no_capture_mute = 1,
>   	};
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>   		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>   		return 0;

