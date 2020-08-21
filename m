Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC824CE85
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0A6EA95;
	Fri, 21 Aug 2020 07:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23566EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 00:22:41 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id v15so158328pgh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 17:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=JaBnFv8JsCcvYIQ4zapld4yeibcuyrja8X9nWizMp1c=;
 b=BZjKFFxJrYWLpgWAWQWZDBKLRAci51Q0Su8FjO3iUEFzlyOhqLFNPsvuxixamwrRLs
 lKZGGf7rLwn47tLUO42ClFCzMBDXdfLXL78W50n+2ZlXdKXDTdRlU5lXHXAw4nbEdKSF
 UHZOlE43W/n9/caF6jnniuToGVFUgwElEfn7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=JaBnFv8JsCcvYIQ4zapld4yeibcuyrja8X9nWizMp1c=;
 b=p7MNJ9SE224XzaWqugS9O+X3z5bC1XkPxE+mMfUyUUBasimmP2Of7ClI4tP2/NY3k/
 PmTCLLZ9H4zaUo+COxu5IJblmvfjNS5cmmUMPn5ivhBXYvAAouQp5sbgFCir3ocQ9NMR
 ENzK643rD1udK1lDOFGKsDZLc4bNDvg1k58qcPnnyVBywn1GFryc5JetCQXBB5SOUdZ7
 KuiJDk2LH4NKmxcbbRvTj6MPkDuzcrlpi4nl5nzRfgpTwoH3HUAV+T3hC12pWCnO69fU
 KK5PGpLvolSXUihUH1aVi/ljdvDyjBCV6FPodN39gVHcek2skxcXjQZnNFGUp2AP+egL
 WfTQ==
X-Gm-Message-State: AOAM533x6nUSO0wTOWPdsR+h+6LgeQpFCGerYBm4LgaHqwPEdbRdyU4v
 uR0wveo5v+v5CnzfI0Bn19HAOQ==
X-Google-Smtp-Source: ABdhPJzVcoX75PGXe53amp5g/BCyz0Rr5NOS371Xm2m4glOupRHFGrjG7hJOP7n5c9L/t/5QY67Ssg==
X-Received: by 2002:a63:925d:: with SMTP id s29mr449060pgn.423.1597969361170; 
 Thu, 20 Aug 2020 17:22:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id x127sm249376pfd.86.2020.08.20.17.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 17:22:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200820103522.26242-3-rojay@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-3-rojay@codeaurora.org>
Subject: Re: [PATCH V2 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From: Stephen Boyd <swboyd@chromium.org>
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date: Thu, 20 Aug 2020 17:22:39 -0700
Message-ID: <159796935923.334488.7479152222902825306@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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

Quoting Roja Rani Yarubandi (2020-08-20 03:35:22)
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
> 
> So, implement shutdown callback to i2c driver to unmap DMA mappings
> during system "reboot" or "shutdown".
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

I'd still put a Fixes tag because it's fixing the driver when someone
runs shutdown.

> Changes in V2:
>  - As per Stephen's comments added seperate function for stop transfer,
>    fixed minor nitpicks.
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 43 ++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h       |  5 ++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 1fda5c7c2cfc..d07f2f33bb75 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -486,6 +486,28 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>         return ret;
>  }
>  
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       u32 val;
> +       struct geni_se *se = &gi2c->se;
> +
> +       val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
> +       if (val & DMA_TX_ACTIVE) {
> +               geni_i2c_abort_xfer(gi2c);
> +               gi2c->cur_wr = 0;
> +               if (gi2c->err)
> +                       geni_i2c_tx_fsm_rst(gi2c);
> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
> +       }
> +       if (val & DMA_RX_ACTIVE) {
> +               geni_i2c_abort_xfer(gi2c);
> +               gi2c->cur_rd = 0;
> +               if (gi2c->err)
> +                       geni_i2c_rx_fsm_rst(gi2c);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
> +       }
> +}
> +
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
>  {
>         return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> @@ -617,6 +639,26 @@ static int geni_i2c_remove(struct platform_device *pdev)
>         return 0;
>  }
>  
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       int ret;
> +       u32 dma;
> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +       struct geni_se *se = &gi2c->se;
> +
> +       ret = pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
> +               return;
> +       }
> +
> +       dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +       if (dma)
> +               geni_i2c_stop_xfer(gi2c);

Any reason the if (dma) check isn't inside geni_i2c_stop_xfer()?
Checking for dma and then bailing out early should work and keep the
logic in one function. Then the pm_runtime_sync() call could go in there
too and if (!dma) goto out. This assumes that we're going to call
geni_i2c_stop_xfer() from somewhere else, like if a transfer times out
or something?

> +
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>         int ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
