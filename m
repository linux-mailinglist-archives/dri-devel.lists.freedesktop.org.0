Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0698B46EF99
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B281E10E263;
	Thu,  9 Dec 2021 16:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AEA10E124
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:29:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z5so20977111edd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PnZS/qCVtvAb/gIQeuy7lIAt1isqXbg6Vz2BdZccjhc=;
 b=C9C8lR2uMSA7rkl+6k/dR+gv15ZCRDtv62G4iBRXaa81eaZiGc75pDxQW9rNqX+2HI
 tfjp6x257MD0OUy1Hxx6nOX5bWDXLqiz9Jh+UV2gtn6RLvupyz1BpYGFjAzaEpVdiy6i
 APaWwVNrAvjmMQVYSDOhOn1Cam7OcwY58IPTAiVP+dcmWOZrFNGAhmDsqRhti6HqIdBB
 ydEOTWNYCyquHEF3aDjVopNnIkuwaOEyph2RUiWdmRA+3ZTTEWBd7GEN/p2VVoqZf9Zo
 cvWNHDAKkcoV6U+i0dBnkR0GoEZ/sXtwiEXngrAYQA+lHpmrcOZ/irxmocooVlxJaeU0
 Lkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PnZS/qCVtvAb/gIQeuy7lIAt1isqXbg6Vz2BdZccjhc=;
 b=S57qh/2D76g33NFAw5mtyf/ptk6qs6QrL1vIC1HQWgq5/mCUXSU8mf1hd9rHWyhMis
 WeXwTcDT03XIEXsWSxGJYIPTx6WDDJpZaUB+R+aOTXDEpVaD0FcVwxAEvnk24JaTTJt9
 wbbL9YzSmMJQ1DY9uNq62644966tAo/1N8p5aRMZidH0XAd74ag9dMUs04Xj0GfvJmCA
 5iRd0n8HoPcbhLJoxhnCuPMYZ3P2C9R4KAIidzAHBQ9YEHwl5fESD8TwaizG1Iv4nCrg
 DADbhjueO16xiymVqH4OvA8aMmVLQEMUQcEuF2DegrVU2kIodf3qJxrXxqtv1XmsdArc
 dXIg==
X-Gm-Message-State: AOAM532OSGMLDgh3ds2PVCErJ7TcTYXbRIyrG2MQvDgCsyNN6FLbkG4K
 SVCFWrANMcWHjK9yf5GxwKQUMDCIyc41oc1kIrU=
X-Google-Smtp-Source: ABdhPJzPH7wt3pebAjmYV1IuugYLMvgtnBpuqmcvwZEl9t1AgA6z//rnO4rB+UbdmCGvGYo2NZNccpjtoyFhufL2lIo=
X-Received: by 2002:a17:906:ecac:: with SMTP id
 qh12mr15943103ejb.377.1639063680720; 
 Thu, 09 Dec 2021 07:28:00 -0800 (PST)
MIME-Version: 1.0
References: <1639057668-14377-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639057668-14377-1-git-send-email-akhilrajeev@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 Dec 2021 17:26:28 +0200
Message-ID: <CAHp75Vfja0-o49u4tXkrEgE9xKPDD=_eZonwLGYsnRTs69z9og@mail.gmail.com>
Subject: Re: [PATCH] i2c: tegra: use i2c_timings for bus clock freq
To: Akhil R <akhilrajeev@nvidia.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 3:48 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Use i2c_timings struct and corresponding methods to get bus clock frequency

Thanks!
A couple of comments below, after addressing them, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> The patch is in response to the discussion in a previous patch to use
> i2c_timings struct for bus freq.
> ref. https://lkml.org/lkml/2021/11/25/767

A-ha.
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(or @linux.intel.com, I can't see it there)

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a5be8f0..ffd2ad2 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -246,7 +246,7 @@ struct tegra_i2c_hw_feature {
>   * @msg_buf: pointer to current message data
>   * @msg_buf_remaining: size of unsent data in the message buffer
>   * @msg_read: indicates that the transfer is a read access
> - * @bus_clk_rate: current I2C bus clock rate
> + * @timings: i2c timings information like bus frequency
>   * @multimaster_mode: indicates that I2C controller is in multi-master mode
>   * @tx_dma_chan: DMA transmit channel
>   * @rx_dma_chan: DMA receive channel
> @@ -273,7 +273,7 @@ struct tegra_i2c_dev {
>         unsigned int nclocks;
>
>         struct clk *div_clk;
> -       u32 bus_clk_rate;
> +       struct i2c_timings timings;
>
>         struct completion msg_complete;
>         size_t msg_buf_remaining;
> @@ -642,14 +642,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>         if (i2c_dev->is_vi)
>                 tegra_i2c_vi_init(i2c_dev);
>
> -       switch (i2c_dev->bus_clk_rate) {
> +       switch (i2c_dev->timings.bus_freq_hz) {

It would be easier to have all these to read when you introduce a
temporary variable:

  struct i2c_timings *t = &i2c_dev->timings;
  ...
  switch (t->...) {
  ...

>         case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>         default:
>                 tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>                 thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>                 tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
>
> -               if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
> +               if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
>                         non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
>                 else
>                         non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> @@ -685,7 +685,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>         clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
>
>         err = clk_set_rate(i2c_dev->div_clk,
> -                          i2c_dev->bus_clk_rate * clk_multiplier);
> +                          i2c_dev->timings.bus_freq_hz * clk_multiplier);
>         if (err) {
>                 dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
>                 return err;
> @@ -724,7 +724,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
>          * before disabling the controller so that the STOP condition has
>          * been delivered properly.
>          */
> -       udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
> +       udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
>
>         cnfg = i2c_readl(i2c_dev, I2C_CNFG);
>         if (cnfg & I2C_CNFG_PACKET_MODE_EN)
> @@ -1254,7 +1254,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>          * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
>          */
>         xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
> -                                      i2c_dev->bus_clk_rate);
> +                                      i2c_dev->timings.bus_freq_hz);
>
>         int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>         tegra_i2c_unmask_irq(i2c_dev, int_mask);
> @@ -1633,10 +1633,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>         bool multi_mode;
>         int err;
>
> -       err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> -                                      &i2c_dev->bus_clk_rate);
> -       if (err)
> -               i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
> +       i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
>
>         multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
>         i2c_dev->multimaster_mode = multi_mode;
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
