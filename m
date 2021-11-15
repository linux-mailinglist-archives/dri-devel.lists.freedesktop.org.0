Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB42450845
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC9889F31;
	Mon, 15 Nov 2021 15:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7446ECB7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 09:56:09 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id n6so17004085uak.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=ehc21nRzLc8i1U+EqW4HnjY+RWjGWh14ZBLj7yNPUxl816A1Dbell6St7S/yW4X/vv
 tt7qOOmMMY85WSc7GghoYpJGJ9xgEBBUokeqlapvAJX5EFUnaN1rvUlEUeE8epbheu5B
 bWVKVRopMxxBfMWO9giRCidfYfZ56vuyGO7o4CSsyVdRcdOlFmosB/G0CBJUF76Dwi9T
 Bi5dKD3S2Ixk/FkU0QqBfwiiGLH1DDHTmYGg0Ci2mql4cvEo0wmrzkz2B7tgBgY5liPS
 E361qlo75lRj9Ddb/VA9aIMjLtX6LX3ck8/h22UNs9feaHP2NMM+vvRDoJtlPCwrDlmi
 9GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsBk71NedBBsVpsWIk4ACHvjoj+bC3+VIVEUbcpO8IA=;
 b=YJFfMciwqt/lkJGaf3hSKE6UQBOF1diQokoGEN7U1LwziDFr2GVRd/66VjI6R6nkQL
 eg97fkeV9r3nMD5cVvOEuDz1+ga5wETedl1pujGcmmVAIBxFkYiZGAPe+KmNx+IlszVH
 MbTBv3q8aKczUSJTGPM4MKb+0eJBvYhjXo3xnN7DN1qazNlIxX69aVxg2gRBw7xhls8/
 es8WMzpkMePDVeWDLeVAyi09fRvUDE7jIbABCkCaUUXZMNrCIVadHdAk0OaDkCj7Y1PK
 JmeeBsZVBzaJSlqWxZ6jApyubFkBJuLICyi1/AGP0jh5TKmchFJtx0lakbWpFWHjGGs9
 MkYQ==
X-Gm-Message-State: AOAM533px1BzFHC+GVSJYSGmbiurcd7ozilyyTq4u1Jltpd6I1DDxgGF
 gxqPrA5ntWTT8k9HX5Z1GZZEWUs51fgakG8xB8U=
X-Google-Smtp-Source: ABdhPJz6ESqhwfmkhVT1QvVuW/9wYB2eiEui3t3htInxrDx0SkRrPjrQEm+aetErjkG15iM6y1caYpqVdHJBHexZMiA=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr56751869uar.66.1636970168537; 
 Mon, 15 Nov 2021 01:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-11-arnd@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 15 Nov 2021 10:55:56 +0100
Message-ID: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 15 Nov 2021 15:28:14 +0000
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
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Picking the connection between a DMA controller and its attached device
> is done through devicetree using the "dmas" property, which is implemented
> by the gdma driver, but it also allows overriding the "req" configuration
> with the slave_id field, as it was done in some linux-2.6 era drivers.
>
> There is no driver in the tree that sets these values, so stop
> interpreting them before anything accidentally starts relying on it.
> Rename the field in the channel from "slave_id" to "req" to better match
> the purpose and the naming in the hardware.
>
> If any driver actually starts using this DMA engine, it may be necessary
> to implement a .xlate callback that sets this field at probe time.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

This driver has been already deleted from the staging tree. See [0].

Best regards,
    Sergio Paracuellos

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=5bfc10690c6c590a972be014ed8595e77e1e2dea

>
> diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> index b5229bc6eae5..f00240e62e1b 100644
> --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> @@ -106,7 +106,7 @@ struct gdma_dma_desc {
>  struct gdma_dmaengine_chan {
>         struct virt_dma_chan vchan;
>         unsigned int id;
> -       unsigned int slave_id;
> +       unsigned int req;
>
>         dma_addr_t fifo_addr;
>         enum gdma_dma_transfer_size burst_size;
> @@ -194,7 +194,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->dst_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->dst_maxburst);
>                 break;
> @@ -203,7 +202,6 @@ static int gdma_dma_config(struct dma_chan *c,
>                         dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
>                         return -EINVAL;
>                 }
> -               chan->slave_id = config->slave_id;
>                 chan->fifo_addr = config->src_addr;
>                 chan->burst_size = gdma_dma_maxburst(config->src_maxburst);
>                 break;
> @@ -288,12 +286,12 @@ static int rt305x_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED |
>                         (8 << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED |
> -                       (chan->slave_id << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
> +                       (chan->req << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
>                         (8 << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
>                 /*
> @@ -365,12 +363,12 @@ static int rt3883_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
>                 dst_addr = chan->fifo_addr;
>                 ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED;
>                 ctrl1 = (32 << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> -                       (chan->slave_id << GDMA_REG_CTRL1_DST_REQ_SHIFT);
> +                       (chan->req << GDMA_REG_CTRL1_DST_REQ_SHIFT);
>         } else if (chan->desc->direction == DMA_DEV_TO_MEM) {
>                 src_addr = chan->fifo_addr;
>                 dst_addr = sg->dst_addr;
>                 ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED;
> -               ctrl1 = (chan->slave_id << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
> +               ctrl1 = (chan->req << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
>                         (32 << GDMA_REG_CTRL1_DST_REQ_SHIFT) |
>                         GDMA_REG_CTRL1_COHERENT;
>         } else if (chan->desc->direction == DMA_MEM_TO_MEM) {
> --
> 2.30.2
>
>
