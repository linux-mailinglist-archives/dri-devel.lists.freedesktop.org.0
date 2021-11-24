Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80C45CA22
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CE86EA6F;
	Wed, 24 Nov 2021 16:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B3B6EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:32:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b16so6622416ljf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hWdL3+sC7Y3WgMzxQgq49FXg8O3lrY2U4JGqRbZI6tg=;
 b=gujWqpLYZ0ok4buE3cVMLWfC5uFpJyuXa42ARhUlnN4O23+qlO+EmYtRvyX/8c+8Cd
 T5a1dyyYrYP3SiqkVxU+nFVwtXCc1qsYP3l3IZjhohQlobFIZT7KVzpd/uD0tmpe0CvO
 aeCfiRXxliyhrHPinovV+UTXQVe/RaMFEMYjCu0hyn3k5BUgAGEZ29zDCOQVjlqJOFhL
 TZBbWI9gTerbMrFWXfehbYHCPQb+K2zUVIW0lpbY8uZKY04odxTxEAVckbrorzsLNVGk
 sCA4pYJSO2cZ60LDY064M6AwjoFewiMlf4tsmpailAug/kWALkfi3+l95LwEP1w10SMT
 n/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hWdL3+sC7Y3WgMzxQgq49FXg8O3lrY2U4JGqRbZI6tg=;
 b=MN44k2nZNddOHz0vjpeMk3btsmul+w13LYGa8e6OTGUYWugq64Dv/7pisdcDuaS4yT
 alWeigAZtWIkj1vNN3VUExRW4WC/qHLBltiJ7OEu2qTU5+WLYzo7lwSAvpaoMc6+An6F
 /BRQiQRsEF3NA+ThdHYGYY1ArvLkv+Q/oi1lAFIpdKX6FcsrxQKCfvEgqPYbT3lz6DlA
 Ilz63KAro8dKCtBrMeYMS2pw69nr3KPFYRj/VGRpUuRRO2W8EymADbBzbD7j+NjCdId6
 BzRp8otx1hNJG8HDkTExhNwbbtklWg7HntVn+yblhIhpWy3QqbkJNnCz6OGUIdAftNzT
 oCRg==
X-Gm-Message-State: AOAM532FE+SYkgfDUbhnBE681S5b9l4opp5D/P97BdL4pV7abOElc6bX
 +Rv2k+teZh+u9zS2H0z3CcI=
X-Google-Smtp-Source: ABdhPJzQ2dc3wLXSWKQBFY+mHq5x3ddsPjsCSkkhRryLlNJ0eKxp2Ar8mZbKuizWCxiSq5j6WRb8tw==
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr17358890ljq.102.1637771570838; 
 Wed, 24 Nov 2021 08:32:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id m14sm31645ljg.2.2021.11.24.08.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:32:50 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
Date: Wed, 24 Nov 2021 19:32:48 +0300
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

Thanks, Arnd!

The commit message is correct, however you could remove even more code
here. But there is no need to make a v3 just because this patch because
I already prepared patchset that revives this S/PDIF driver and enables
HDMI audio on Tegra20. I'll take care of cleaning up the whole code of
this driver.

diff --git a/sound/soc/tegra/tegra20_spdif.c
b/sound/soc/tegra/tegra20_spdif.c
index 7751575cd6d6..1c3385da6f82 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -251,7 +251,7 @@ static const struct regmap_config
tegra20_spdif_regmap_config = {
 static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_spdif *spdif;
-	struct resource *mem, *dmareq;
+	struct resource *mem;
 	void __iomem *regs;
 	int ret;

@@ -273,12 +273,6 @@ static int tegra20_spdif_platform_probe(struct
platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

-	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (!dmareq) {
-		dev_err(&pdev->dev, "No DMA resource\n");
-		return -ENODEV;
-	}
-
 	spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &tegra20_spdif_regmap_config);
 	if (IS_ERR(spdif->regmap)) {
@@ -290,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct
platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;

 	pm_runtime_enable(&pdev->dev);


