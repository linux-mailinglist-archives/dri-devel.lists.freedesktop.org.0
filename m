Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2014249582
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CFC6E1BE;
	Wed, 19 Aug 2020 06:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77889A0E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:43:58 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id i92so566447pje.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LM6WEk9ZkbFt6Qg2UpRFNU3bLjYzPUz6PTE3Cs+whU4=;
 b=FA4/UU2gVgjS/rjFwfGsWgyT+dH+LvVeCqbFb0OUeI/gWzIGoXU3gQBgpbuyKlQv1S
 vY0apjSOiH5Lmx9d0Sdve7ESWLk1aZ9Odq7o4p8SeYfjhXQE+rqoEw212IS1yE/nbqH5
 nb+EQqH1uyhEGYhD4HnH/3sBRgbmW9+WeJlLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LM6WEk9ZkbFt6Qg2UpRFNU3bLjYzPUz6PTE3Cs+whU4=;
 b=gH4fpMla+6oSI/paoFBe0kHEqQk2o1oVh0GohQhK8HlY6zNNv4GODwQQzNEnbR3DAH
 EnYUE3+PiTbf3Q2mQ9xvc6k6QnVIa53V3KmnJISmV17FXtB3OhkW106LPv7plNPZF73j
 Nw3IbUA0nbC+tdOYs2tuaP+QeKiHn5/TqTpFrSYtfmTd0u+LaGPDDVOeaaS4cwXCN67J
 M3ngMrw7b3LYHmN219Em3HhAa+QlqWkSfsdyJJb6S6i6bQU1T2NDP/M/kDxScBXd1GZ8
 Z/N7LNMt5sVR4C2eqTr+0LwJkNQPjMJKIFohfaaS5LgRM+2bwensD5U+rdCwRFVVw00h
 53TQ==
X-Gm-Message-State: AOAM531qy5psyx5EHGMp4srJwsP1f2oGJ5Oko0EUHQt1Qk6yttvglOe8
 XCRq9ceqcY0iGrShu2nPYmn0ew==
X-Google-Smtp-Source: ABdhPJw1IsJubYX++BUAswOcW/LVMXJ7mvqrysqRZbiBHWRN6AL/0ifU2M3IpMSDGi5didlOHQuO3w==
X-Received: by 2002:a17:90a:c593:: with SMTP id
 l19mr2507622pjt.20.1597808638416; 
 Tue, 18 Aug 2020 20:43:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id o14sm255147pjw.11.2020.08.18.20.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 20:43:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200814095540.32115-3-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org>
 <20200814095540.32115-3-rojay@codeaurora.org>
Subject: Re: [PATCH 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From: Stephen Boyd <swboyd@chromium.org>
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date: Tue, 18 Aug 2020 20:43:56 -0700
Message-ID: <159780863669.334488.18038785498966010175@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, akashast@codeaurora.org, mka@chromium.org,
 agross@kernel.org, msavaliy@qti.qualcomm.com, linux-media@vger.kernel.org,
 skakit@codeaurora.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Roja Rani Yarubandi (2020-08-14 02:55:40)
> If the hardware is still accessing memory after SMMU translation
> is disabled(as part of smmu shutdown callback), then the

Put a space before (

> IOVAs(I/O virtual address) which it was using will go on the bus

Put a space before (

> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
> 
> So, adding shutdown callback to i2c driver to unmap DMA mappings
> during system "reboot" or "shutdown".
> 

Deserves a Fixes: tag if it's fixing a problem, which it looks like it
is.

> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 36 ++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h       |  5 +++++

I'd prefer this is squashed with the previous patch. The first patch
doesn't really stand on its own anyway.

>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 53ca41f76080..749c225f95c4 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,6 +613,41 @@ static int geni_i2c_remove(struct platform_device *pdev)
>         return 0;
>  }
>  
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +       struct geni_se *se = &gi2c->se;
> +       u32 dma;
> +       u32 dma_dbg_reg;

Typically this is just called 'val'.

> +
> +       ret = pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device:%d\n", ret);

Maybe just write: "Failed to resume device\n"? Not sure anyone cares
what the error code is. And if they did, it would be connected to the
colon so it will be hard to read. Add a space after colon if you want to
keep the return value please.

> +               return;
> +       }
> +
> +       dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +       if (dma) {
> +               dma_dbg_reg = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
> +               if (dma_dbg_reg & DMA_TX_ACTIVE) {
> +                       geni_i2c_abort_xfer(gi2c);
> +                       gi2c->cur_wr = 0;
> +                       if (gi2c->err)
> +                               geni_i2c_tx_fsm_rst(gi2c);
> +                       geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
> +               }
> +               if (dma_dbg_reg & DMA_RX_ACTIVE) {
> +                       geni_i2c_abort_xfer(gi2c);
> +                       gi2c->cur_rd = 0;
> +                       if (gi2c->err)
> +                               geni_i2c_rx_fsm_rst(gi2c);
> +                       geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
> +               }

Can this be a function? It sort of seems like we should be doing the
same sort of stuff if we're canceling a DMA transaction in flight.

> +       }
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>         int ret;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..acad69be747d 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -77,6 +77,7 @@ struct geni_se {
>  #define SE_DMA_RX_FSM_RST              0xd58
>  #define SE_HW_PARAM_0                  0xe24
>  #define SE_HW_PARAM_1                  0xe28
> +#define SE_DMA_DEBUG_REG0              0xe40
>  
>  /* GENI_FORCE_DEFAULT_REG fields */
>  #define FORCE_DEFAULT  BIT(0)
> @@ -207,6 +208,10 @@ struct geni_se {
>  #define RX_GENI_CANCEL_IRQ             BIT(11)
>  #define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
>  
> +/* DMA DEBUG Register fields */

Please follow other style, ie. SE_DMA_DEBUG_REG0 fields

> +#define DMA_TX_ACTIVE                  BIT(0)
> +#define DMA_RX_ACTIVE                  BIT(1)
> +
>  /* SE_HW_PARAM_0 fields */
>  #define TX_FIFO_WIDTH_MSK              GENMASK(29, 24)
>  #define TX_FIFO_WIDTH_SHFT             24
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
