Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89B450505
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5F36E030;
	Mon, 15 Nov 2021 13:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4786E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:09:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 207so35347757ljf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zdNnu6u0t53RxSPdU4MDPOEl5NW5wFhi+3tVJwsouBE=;
 b=AdlSGIXoBXq0VXgOWXENRxISfNEhM8HAmvts1hlgX2aW8p19gg4TWR8iIt27dsvmv1
 Er40yU2EVPgsKue7HjKRPzcvCEAOuYUSYPQRd7hA06J3e13A1mkLA77EDajw9vHVT420
 Lbp3x0tqpEh+8MBGtUYl/2+fVKsJM1+f+AKqTG6X7Kh0veEaJi77Iw0fl7cmv+hbpWsF
 4j+O7DBKUFLat0Nxi8uwYiTs345Prp9Z/jgqtkOJyAyKfWa7I7unOeTjMa5rmjmc3Xwr
 9Mt+CjQwmzF7FQsUxJSUVdME7aWf6slT3nqVKg54VhTbXds90COzK7cp9x7YBV5y9jx3
 XScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zdNnu6u0t53RxSPdU4MDPOEl5NW5wFhi+3tVJwsouBE=;
 b=PvYsOkiB3/FR5YDGblhsoYNf1YG8RWzA5WWlv6/dzTzkxOCpc9OK+S7fjVL8jW71U2
 sgBbJOHUrk+rK/SQlmOwDj9BTZIfIk2mhInENCrYI/pTg5ikUT/Gk5AB2zR08SQmVF2Z
 W10ouY/vwL5yU6+6y+lWYpIIwemig7tD8ykuRJWzUlPzsH98TTzycPxUxDbvxHJYe7gs
 Fe/rVviFNn3su5ZUnjde5+6RV4K4TgYFcVfjxIu2HB44P+E9GQ7zKaErXFDgSMVwK/QE
 EFKiqz9EaSY2YkfLcIzaEpfiIpoKobsmiUeHQ+d97GHiLGfQJT78sdlZjn+sHFpbOIK0
 drug==
X-Gm-Message-State: AOAM533NpWqJ+OZ9P6zOt4/beQ73dtyVGk2pVT4Rl28NlZX5kjlr30vx
 //h1tzPCx7VvCPqV4quihDyIqH9c1BudHvR95bUfhQ==
X-Google-Smtp-Source: ABdhPJxdsC0uW2HE6zj+9SqQN+4ObrVjDxA5TLNECz/k4cRg87wjRG7GU625P/bUeyp/NjunxRKqIwie+Tr+AjkZQG4=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr38617043ljg.4.1636981785962;
 Mon, 15 Nov 2021 05:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-4-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-4-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Nov 2021 14:09:09 +0100
Message-ID: <CAPDyKFovVgrDxJ5eFgvAzwJNTrYSzjtz7z9UCa3rHMsgkFqsxA@mail.gmail.com>
Subject: Re: [PATCH 03/11] mmc: bcm2835: stop setting chan_config->slave_id
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

On Mon, 15 Nov 2021 at 09:55, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

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
> 2.30.2
>
