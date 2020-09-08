Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CD2627C6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1374D6E9C1;
	Wed,  9 Sep 2020 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FAA6E8BB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 19:30:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 5so271036pgl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=SsOjzOVIq97WOAc6WZeXaOq483i3DuOEILRijMKc8+c=;
 b=I2A6OrWWp9ZhN3tycDzSBFzxFhAVc4uVVlf6QeuGM+05TNovmH2B+uVYHRSjh8Tfa4
 3rbgHqE43zixo0WWMEH/uPn6zQ+k8rp6mukpfWZWv8M5OQw4plGz5nLDUFU8TKhOG76x
 kbIHeGgSSQCfV0ICNIztWj0FF4yY6nAq3J+2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=SsOjzOVIq97WOAc6WZeXaOq483i3DuOEILRijMKc8+c=;
 b=JFqPZ7ky3Mn+KyarO0Fq3VcMXv6dikzfo2cbkmmgvZnbUycRX6Dd71bvwSg9YqVCml
 4+p7lcoqVQqIoSOHtG9mIHnBIiRkIwLG7QDjdjl/EyoYMkGJdTtc9FC8kz5VthDl5XKs
 yeNvpu2fC6cBI+NSZct4nIP4sicH+M0ZV9hhBNpwZD5UkFfkL1lwZBirPuZW9aVSIaxF
 SDIx4bXLzX32Y2MpqrKiC7kkNp0l60bCfJpyeR89sLgConCFsd5jlV8jMT4bq12wiMFF
 9VAiuTLAYwt9Bmt2CENG2dKggTk7UpdB0/N8mwzSMRIYEEONIpVwdRoyYMXu1UPWaE/c
 rGFQ==
X-Gm-Message-State: AOAM5302piLQGkVubdfuPbONi6wK1rqWwADZMPGSG6YCSCviJgX09NcB
 BlZI95nRUIZSJJVCwszD9eWyAg==
X-Google-Smtp-Source: ABdhPJxHIdKSrBuYxJO9MpvlN9pOkwSjhGrSBHPFd2611Mm9W5IYS0c3yvOL6x5Xbpknc67grJnfiw==
X-Received: by 2002:a62:6003:: with SMTP id u3mr279604pfb.55.1599593421304;
 Tue, 08 Sep 2020 12:30:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id r3sm208389pfh.88.2020.09.08.12.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:30:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200907130731.2607-1-rojay@codeaurora.org>
References: <20200907130731.2607-1-rojay@codeaurora.org>
Subject: Re: [PATCH V3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From: Stephen Boyd <swboyd@chromium.org>
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date: Tue, 08 Sep 2020 12:30:18 -0700
Message-ID: <159959341894.454335.3250696075143737399@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

Why is dri-devel on here? And linaro-mm-sig?

Quoting Roja Rani Yarubandi (2020-09-07 06:07:31)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dead5db3315a..b3609760909f 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>  struct geni_i2c_err_log {
> @@ -384,7 +387,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_rx_fsm_rst(gi2c);
> -               geni_se_rx_dma_unprep(se, rx_dma, len);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, len);
> +               gi2c->rx_dma = (dma_addr_t)NULL;
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
>  
> @@ -394,12 +398,12 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t tx_dma;
>         unsigned long time_left;
>         void *dma_buf = NULL;
>         struct geni_se *se = &gi2c->se;
>         size_t len = msg->len;
>  
> +       gi2c->xfer_len = len;
>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  
> @@ -410,7 +414,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  
>         writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
>  
> -       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
> +       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &gi2c->tx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf = NULL;
> @@ -429,7 +433,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_tx_fsm_rst(gi2c);
> -               geni_se_tx_dma_unprep(se, tx_dma, len);
> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, len);
> +               gi2c->tx_dma = (dma_addr_t)NULL;
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
>  
> @@ -479,6 +484,51 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>         return ret;
>  }
>  
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 dma;
> +       u32 val;
> +       u32 geni_status;
> +       struct geni_se *se = &gi2c->se;
> +
> +       ret = pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);

Is this print really necessary? Doesn't PM core already print this sort
of information?

> +               return;
> +       }
> +
> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +       if (geni_status & M_GENI_CMD_ACTIVE) {

Please try to de-indent all this.

	if (!(geni_status & M_GENI_CMD_ACTIVE))
		goto out;

> +               geni_i2c_abort_xfer(gi2c);
> +               dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +               if (dma) {

	if (!dma)
		goto out;

> +                       val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
> +                       if (val & DMA_TX_ACTIVE) {
> +                               gi2c->cur_wr = 0;
> +                               if (gi2c->err)
> +                                       geni_i2c_tx_fsm_rst(gi2c);
> +                               if (gi2c->tx_dma) {
> +                                       geni_se_tx_dma_unprep(se,
> +                                                gi2c->tx_dma, gi2c->xfer_len);
> +                                       gi2c->tx_dma = (dma_addr_t)NULL;

Almost nobody does this. In fact, grep shows me one hit in the kernel.
If nobody else is doing it something is probably wrong. When would dma
mode be active and tx_dma not be set to something that should be
stopped? If it really is necessary I suppose we should assign this to
DMA_MAPPING_ERROR instead of casting NULL. Then the check above for
tx_dma being valid can be dropped because geni_se_tx_dma_unprep()
already checks for a valid mapping before doing anything. But really, we
should probably be tracking the dma buffer mapped to the CPU as well as
the dma address that was used for the mapping. Not storing both is a
problem, see below.

> +                               }
> +                       } else if (val & DMA_RX_ACTIVE) {
> +                               gi2c->cur_rd = 0;
> +                               if (gi2c->err)
> +                                       geni_i2c_rx_fsm_rst(gi2c);
> +                               if (gi2c->rx_dma) {
> +                                       geni_se_rx_dma_unprep(se,
> +                                               gi2c->rx_dma, gi2c->xfer_len);

Looking closely it seems that the geni dma wrappers shouldn't even be
checking for an iova being non-zero. Instead they should make sure that
it just isn't invalid with !dma_mapping_error().

> +                                       gi2c->rx_dma = (dma_addr_t)NULL;

If we're stopping some dma transaction doesn't that mean the 

                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);

code needs to run also? I fail to see where we free the buffer that has
been mapped for DMA.

> +                               }
> +                       }
> +               }
> +       }
> +

out:

> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
