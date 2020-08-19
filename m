Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB108249598
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1BA6E1A3;
	Wed, 19 Aug 2020 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABF8892B9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:39:16 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h12so10709498pgm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LqLEg6Ld5QuLtOzu6BqXxZNLCj7RTFYiQgIAyF8gU70=;
 b=KmghUthGvojy07h9BZsorKl+jQO7wKGLOev2rzAcomRYp9sMfs6Gjktbt33K26LekA
 Qxkv14xQTsOxA9Bw0STh5x8cRg2HTa8mDrsoUOptFIhGGhBev4tXpiniG3TiTd2zRraw
 V/Eoz0F5NCVs1RDrHgfuHBOh77xH2S+T3Pt0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LqLEg6Ld5QuLtOzu6BqXxZNLCj7RTFYiQgIAyF8gU70=;
 b=OlqOai8WQ/Mqb0JJYsZqtBwwFTt52EHJRnphcHsD31F6aIlru1fszG7PwRT3p5P9Az
 qe0O137tizse2KdjOSc+neU/ZG72ToHvfr4GAVorhtXqEqV1WlApdB3umClBMcoqBsQi
 ufZq77JQ8dcjInIh8FBUkOrORyHfPekw5I4yBLmpGBSjsQJAikx9c4YKacijme8w64pC
 jfiFIuN6ZcYSjBvvePoTDRYHs2N2ye9vnAw+5IRl4rjbznO/6gZZro5Xltu90WDwt8Rb
 J87QwZwJZ/4g7rd3oblo1zw6Rhbo5PX3loN1YEQ0xnPnin3y9+xEMuGkpJ3L6nQ5Y/aZ
 dtQQ==
X-Gm-Message-State: AOAM532SBVTgZyXRH69hgpjg8Rk6ZHcdeAdnI+t5A8P/O7VMkQNfbLnV
 BRAQ5rktqi3bhGN4ODzva+kaeA==
X-Google-Smtp-Source: ABdhPJw/fbapbqyEK3EQuuI/goR68Bo71kvM1Fo115OGCAsLxKKL/EFMEBHhZev14vQUxfKm+79SNw==
X-Received: by 2002:a65:68d6:: with SMTP id k22mr8267707pgt.136.1597808355900; 
 Tue, 18 Aug 2020 20:39:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id a193sm26557771pfa.105.2020.08.18.20.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 20:39:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200814095540.32115-2-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org>
 <20200814095540.32115-2-rojay@codeaurora.org>
Subject: Re: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma,
 rx_dma and xfer_len to geni_i2c_dev struct
From: Stephen Boyd <swboyd@chromium.org>
To: Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date: Tue, 18 Aug 2020 20:39:13 -0700
Message-ID: <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
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

Quoting Roja Rani Yarubandi (2020-08-14 02:55:39)
> Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
> store DMA mapping data to enhance its scope. For example during
> shutdown callback to unmap DMA mapping, these new struct members
> can be used as part of geni_se_tx_dma_unprep and
> geni_se_rx_dma_unprep calls.

Please read about how to write commit text from kernel docs[1]. Hint,
use imperative mood.

> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7f130829bf01..53ca41f76080 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>         u32 clk_freq_out;
>         const struct geni_i2c_clk_fld *clk_fld;
>         int suspended;
> +       dma_addr_t tx_dma;
> +       dma_addr_t rx_dma;
> +       u32 xfer_len;

Why not size_t?

>  };
>  
>  struct geni_i2c_err_log {
> @@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t rx_dma;
>         unsigned long time_left;
>         void *dma_buf = NULL;
>         struct geni_se *se = &gi2c->se;
> -       size_t len = msg->len;
>  
> +       gi2c->xfer_len = msg->len;

I'd prefer to keep the local variable and then have 

	len = gi2c->xfer_len = msg->len;

>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  
> @@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         else
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>  
> -       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> +       writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_RX_TRANS_LEN);

So that all this doesn't have to change.

>  
> -       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
> +       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, gi2c->xfer_len,
> +                                          &gi2c->rx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf = NULL;
> @@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_rx_fsm_rst(gi2c);
> -               geni_se_rx_dma_unprep(se, rx_dma, len);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
>  
> @@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t tx_dma;
>         unsigned long time_left;
>         void *dma_buf = NULL;
>         struct geni_se *se = &gi2c->se;
> -       size_t len = msg->len;
>  
> +       gi2c->xfer_len = msg->len;

Same comment.

>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
