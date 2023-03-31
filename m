Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5F6D1979
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BE110F119;
	Fri, 31 Mar 2023 08:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D783710F119
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:11:11 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E4DB6603130;
 Fri, 31 Mar 2023 09:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680250270;
 bh=eLIqrRye+6wN0NKeakPjuTqIkvbMUkhOj6K5fUjYHQ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TpmHQG8Kj4+EqwCZ/xIQoeeZVWeAL+0kbNCBwBIzkiXe/IOCr17X198j5XMT0oEHs
 7yI2hZ/1LM3BRwZ8m4BCifdhfZsim3JDxX8nYTDsXeMJ/F+pgrLI4JE2jEdfZkk+xU
 Vz/kpEhJljekn0ysAAmsj285znG4V0zbaLXKIEUhHxU0CNybcLX1rwbzFjKNm7wM7A
 c/7d+O45nBqHVUowUcD/TsCQzjvLC2ZFL0Rubaa2uHiy5hwQHWES54rvAe9mw/Z2Q3
 AB1kG7nQ6z7pSA7enBQjybCqQB8OLgTKtC6qHAuQqh57EqKgBRPyQW/q+SbEDlxf8r
 czG+qasfrfwRA==
Message-ID: <5814d779-0635-43fe-3fe8-31c130f05b3a@collabora.com>
Date: Fri, 31 Mar 2023 10:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 RESEND 2/2] drm/panfrost: Add basic support for speed
 binning
To: airlied@gmail.com, boris.brezillon@collabora.com
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
 <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/03/23 10:08, AngeloGioacchino Del Regno ha scritto:
> Some SoCs implementing ARM Mali GPUs are subject to speed binning:
> this means that some versions of the same SoC model may need to be
> limited to a slower frequency compared to the other:
> this is being addressed by reading nvmem (usually, an eFuse array)
> containing a number that identifies the speed binning of the chip,
> which is usually related to silicon quality.
> 
> To address such situation, add basic support for reading the
> speed-bin through nvmem, as to make it possible to specify the
> supported hardware in the OPP table for GPUs.
> This commit also keeps compatibility with any platform that does
> not specify (and does not even support) speed-binning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello maintainers,
I've seen that this got archived in the dri-devel patchwork; because of that and
only that, I'm sending this ping to get this patch reviewed.

(perhaps we can even get it picked for v6.4?)

Regards,
Angelo

> ---
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 30 +++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index fe5f12f16a63..58dfb15a8757 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -4,6 +4,7 @@
>   #include <linux/clk.h>
>   #include <linux/devfreq.h>
>   #include <linux/devfreq_cooling.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_opp.h>
>   
> @@ -82,6 +83,31 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
>   	.get_dev_status = panfrost_devfreq_get_dev_status,
>   };
>   
> +static int panfrost_read_speedbin(struct device *dev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed-bin", &val);
> +	if (ret) {
> +		/*
> +		 * -ENOENT means that this platform doesn't support speedbins
> +		 * as it didn't declare any speed-bin nvmem: in this case, we
> +		 * keep going without it; any other error means that we are
> +		 * supposed to read the bin value, but we failed doing so.
> +		 */
> +		if (ret != -ENOENT) {
> +			DRM_DEV_ERROR(dev, "Cannot read speed-bin (%d).", ret);
> +			return ret;
> +		}
> +
> +		return 0;
> +	}
> +	DRM_DEV_DEBUG(dev, "Using speed-bin = 0x%x\n", val);
> +
> +	return devm_pm_opp_set_supported_hw(dev, &val, 1);
> +}
> +
>   int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   {
>   	int ret;
> @@ -101,6 +127,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   		return 0;
>   	}
>   
> +	ret = panfrost_read_speedbin(dev);
> +	if (ret)
> +		return ret;
> +
>   	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names);
>   	if (ret) {
>   		/* Continue if the optional regulator is missing */


