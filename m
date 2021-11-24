Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2745CB44
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 18:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51736E8C4;
	Wed, 24 Nov 2021 17:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C306E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 17:39:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k37so9309161lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 09:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6KwYnqzzoTeuVNxhHsajzRe6liKfZ7vCZOdko2MKcYY=;
 b=lvNbpNKcqOAj74UHrS6XpdHcUjOf2sCIzeJURasqmwDotEWhqg+OtI1hIqfxXw53rO
 z4tIfWJ15SJPCQPQEYpaz/zmC2AtWtLFdcPfiSvbidZ8Exl9V8VhaqU9R2npHpy4tYc0
 yoAFhsyR/tm1sxMO7gFsD63QuHkm+jfTl/BAb0mYaTiKTxDGqN4kFZjH9jZeyYnQTnDY
 +iO2QczJQHUVcBKOsIBMpcFVHI8R1BvISIqundwfmbO8Omwr++T3KiO2VqAHQJyXOIWo
 3aZgsvReXTiUAJF/ECnq/pwPQIvxcyAQtmtfpSjrZuVeY4POAqNgnpvX5T/RJZH9Gntm
 5JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6KwYnqzzoTeuVNxhHsajzRe6liKfZ7vCZOdko2MKcYY=;
 b=ma+NYV0KNTs0DLSX9HjN20LFhSoURATu+Wese7Nj9HmF8nZRnbxTq2EceHoIY1Jpiv
 /09M5uKvG+9xJ+uYDRfI80IOyzOCawMyhHhS78U59FNt2G/HDx3i2dVo02/YQ6q7dfAe
 AZPKzfBAE3LT2+gvMXwfOLM69XPT3A22MyIwvg8eb/ByotOyCWIm9nxtV2mOeAiWyRkB
 gYonwFOB2kPwl4EhrqC72vCvSDVsCLCb64sOr38AHD6dFabw1sWAT1PD5OSC4KNJn/bd
 myp2g3yz/bOxUaSR/kLvWF6/blOgFwUFdkrCkfa8Fx5aI7XdQVOkP46DiJxJ/GoBIBED
 gisQ==
X-Gm-Message-State: AOAM533BzUna99gP1aZn6o5tKQ9vp66Svhz4biQ5LTjN8+vmke6fURUi
 sZHrrAJSXYBzqwiCiMJ+EdsTxqy4q70=
X-Google-Smtp-Source: ABdhPJzMAN6+EU9Pjecu2Hl3ZC50CFEhc3UzlNKlYPHJ5/rwKJi/3grC00PRL2kx8I9BrVZVbuLcvw==
X-Received: by 2002:a19:c350:: with SMTP id t77mr16616753lff.152.1637775579976; 
 Wed, 24 Nov 2021 09:39:39 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id q5sm44228lfu.18.2021.11.24.09.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:39:39 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b5c9ece3-c702-26b8-347a-f6d9bed2c5db@gmail.com>
Date: Wed, 24 Nov 2021 20:39:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122222203.4103644-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

23.11.2021 01:21, Arnd Bergmann пишет:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The DMA resource is never set up anywhere, and passing this as slave_id
> has not been the proper procedure in a long time.
> 
> As a preparation for removing all slave_id references from the ALSA code,
> remove this one.
> 
> According to Dmitry Osipenko, this driver has never been used and
> the mechanism for configuring DMA would not work as it is implemented,
> so this part will get rewritten when the driver gets put into use
> again in the future.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
> index 9fdc82d58db3..1c3385da6f82 100644
> --- a/sound/soc/tegra/tegra20_spdif.c
> +++ b/sound/soc/tegra/tegra20_spdif.c
> @@ -284,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>  	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
>  	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>  	spdif->playback_dma_data.maxburst = 4;
> -	spdif->playback_dma_data.slave_id = dmareq->start;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
