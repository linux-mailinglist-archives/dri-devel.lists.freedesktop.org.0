Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0345A13B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 12:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1D96EDC6;
	Tue, 23 Nov 2021 11:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112BB6EDCA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 11:19:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l9so5150042ljq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 03:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
 b=g2Y3CYQC1NcCLavzUvr4ErWMQvZ4fzsgBv6CCbmTOoZcOun8WjSds54sZrtzeYEA0U
 N5KF7mJ3kl8nFIULnhlxeAUeFZAuCfq+uX5Urd7Y31Xp8cHxNzCxkkp6HS46EZb3D6jZ
 c7TwybE0YdC9woGghm+c/KCOlK35CIfDZrYTO7zFljpZaTHjklc27An1TOol1n/1idvS
 kCKfDejnDdUw+aN2JJNNmUQf32+SP4pOXJVkzxhNH+rbEkLFMLkjE8yfz5ElxThNneaF
 SJXtBIs1DuxaYn0676eJKdryXGQlku5s0UQEwOdM0oGilYhXoK+2140z6YDVV15iHy6a
 9PQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
 b=ARdJXfPScFwDpKqFxsh7PhZEcoWvZut/RXaLBIrg+w013cD5egcd6PMyWzInLU2949
 3khiVwE1aw8l2r3x+ZKyGgZdBgJS9I3d/EYNj2ulJYynERhCLusK+ONs4+FqMjnAxptH
 /Ej7JewI8spVjUdfQ8T+jSCGF2hNU1hZEjVwE0PQYsyEiKy0vFtGeiFgx9+457iOchqh
 B04iQqUefuVdRYjjgoshyhe70L9//Cknc/1EKT3yydMMWQXvSr6ZGIrvOIQEGmRawdCg
 87FhOdEIoPORXtY6tqswipXgTteIM81OSFzPnjhiVisMLMJ84FCBj8Xtkpg8BhwmGHr4
 NzLg==
X-Gm-Message-State: AOAM531mudrFUQOml61iB5tn1wYd1h0Fx7YNalZtlJZUt9tQ2tMox45A
 U+JMZ1ivbmGIL6plehsbr93Dt+OAtXMSAX34GhzqdQ==
X-Google-Smtp-Source: ABdhPJxH+dIDF8nBsp8fxznpkoFe9y9Zmc/xUzjvp4Mfv2L5TNuCMH6djlHGcQ7ManpwMDd1PzQBcWJG8pF2EVa/HSY=
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr4381662ljf.300.1637666356182; 
 Tue, 23 Nov 2021 03:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-5-arnd@kernel.org>
In-Reply-To: <20211122222203.4103644-5-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Nov 2021 12:18:40 +0100
Message-ID: <CAPDyKFrCOoFWuM_6Renu+M5SHotyuzXeyH99WZb69G1PFQ1z5A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] mmc: bcm2835: stop setting chan_config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-mtd@lists.infradead.org,
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
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 at 23:23, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think I acked the previous version, but nevermind:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/bcm2835.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 8c2361e66277..463b707d9e99 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1293,14 +1293,12 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>
>                 host->dma_cfg_tx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_tx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_tx.direction = DMA_MEM_TO_DEV;
>                 host->dma_cfg_tx.src_addr = 0;
>                 host->dma_cfg_tx.dst_addr = host->phys_addr + SDDATA;
>
>                 host->dma_cfg_rx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_rx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_rx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_rx.direction = DMA_DEV_TO_MEM;
>                 host->dma_cfg_rx.src_addr = host->phys_addr + SDDATA;
>                 host->dma_cfg_rx.dst_addr = 0;
> --
> 2.29.2
>
