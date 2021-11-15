Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E74502B8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B856E86E;
	Mon, 15 Nov 2021 10:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1739 seconds by postgrey-1.36 at gabe;
 Mon, 15 Nov 2021 10:43:36 UTC
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6676E86E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=zKle5O4Hm0rsP20JwKxCewz8QF7Q9nSdwfLsov0N4vA=; b=hwsQlcKAS/JXya4kJAPUiPtqXb
 9UMOU27cfaU5N7Tp8fyitDY1674HxtfXStnOTcAeHYihKpPwkh4BzHNyU3L8ni0MlEqLJvF3Tru5q
 B2eTXmMb/S3sAqTnVmA3k/cGfwJUJMXtyrqmrWCjYFQvJczCRjGLBk4fscjkPc04xA/T/XuzDoZfc
 XILRH6/Bd05bjkDrhLZT2E2VeKzK0ieAQRQtDzTV4WK2WZN7kHtarwsy+N/oRQtAZ3G4YUkB/BJh8
 efgVXyOr3W5pPKLt/HNdG7cIpevglHN4SkSIlzyhRsuDMLifVtTNbhdmELMY5HB4kAhXJnGP0TpjZ
 VMZfg1mg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mmZ0A-000A8L-4d; Mon, 15 Nov 2021 11:14:14 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mmZ09-0008BB-1V; Mon, 15 Nov 2021 11:14:13 +0100
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
Date: Mon, 15 Nov 2021 11:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115085403.360194-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26354/Mon Nov 15 10:21:07 2021)
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

On 11/15/21 9:53 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This field is never set, and serves no purpose, so remove it.

I agree that we should remove it. Its been legacy support code for a 
while, but the description that there is no user is not right.

The tegra20_spdif driver obviously uses it and that user is removed in 
this patch. I think it makes sense to split that out into a separate 
patch with a description why the driver will still work even with 
slave_id removed. Maybe the best is to remove the whole tegra20_spdif 
driver.

> diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
> index 9fdc82d58db3..1c3385da6f82 100644
> --- a/sound/soc/tegra/tegra20_spdif.c
> +++ b/sound/soc/tegra/tegra20_spdif.c
> @@ -284,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>   	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
>   	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>   	spdif->playback_dma_data.maxburst = 4;
> -	spdif->playback_dma_data.slave_id = dmareq->start;
>   
dmareq is now unused and should be removed as well.
>   	pm_runtime_enable(&pdev->dev);
>   


