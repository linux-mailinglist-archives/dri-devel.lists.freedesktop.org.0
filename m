Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCE3239F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7486EA78;
	Wed, 24 Feb 2021 09:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE7F6EA75
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:56:06 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p16so1401733ioj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RU1Dv5ueSljAAVfv4T9OqAjJwdsFgFFCEi6sIYdmOgw=;
 b=Q1WR4AqdzIpOzKpXi3DTXEnRpx/g6aIgsZFULq6y7Q7awwiE4Zr3MkUKAYlUY7vCF+
 T5LMKUrr4rrSmCHTNgQW9gRFCm6DzqGQek43xoR7pPls+qNbPo9YoqgV4xbytmZhsLgs
 1E5KqH09IjrFLY30oXOGbeI9g79LiwfjxG//4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RU1Dv5ueSljAAVfv4T9OqAjJwdsFgFFCEi6sIYdmOgw=;
 b=GvvYCXuvgk4Q0O6aJ736Fj1KN97mNQ4JbBhVqU6aV/tPy0idvwKdPUrDt7sUEet4HE
 ZGMacqYreZtThx6SJ7d1V2qh5bBGzdjqnpjMJo10Ahy+evLUtvCfVMG35slg0xBFMuP+
 dG+Ax8jcbuHdddACIEY1hL8Y49l4Ykl+b3ZWDhH0rxRCuCO9pHHr6SUFemag47mWy6gI
 eLGgarD7pxyfiMkGskhtFiy5HtjZzjsFG0PrIV4bj8UKdnitw0WSBzNZYiFxsffD5omC
 wyqjneaAwQLncAJ1RyQAg8YAHkRlXMqwJjDj9Cq+UHTZoHMDtBLMjRv0Z74xFR9fLlcp
 olow==
X-Gm-Message-State: AOAM532JNJjkMURn9kAFMHjWdUcU51yTkLxt8AAFPAaPdkQqRrYrk/S+
 MV3tmCEW0fA7Q5CdRJCRw4JUDYE16tETxC8ez2+7oQ==
X-Google-Smtp-Source: ABdhPJwbGZ2pK7cCaN8r43k01netzTAZEZTOx6QlDSoCw/u7PoaL/ZhqWLoLgYEPL655ECmB6tquNfxMTfHRd4h5k6w=
X-Received: by 2002:a05:6602:82:: with SMTP id
 h2mr15309912iob.20.1614160565316; 
 Wed, 24 Feb 2021 01:56:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611802321.git.xji@analogixsemi.com>
 <49fc9c62026988d7adc2eb7e4d1f6a3bffe0b66c.1611802321.git.xji@analogixsemi.com>
In-Reply-To: <49fc9c62026988d7adc2eb7e4d1f6a3bffe0b66c.1611802321.git.xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 24 Feb 2021 17:55:39 +0800
Message-ID: <CAJMQK-g40fJN_rk2GTe_7tP3cX3+Ud4XbX1Aom4fqM77yY1+mw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/bridge: anx7625: add MIPI DPI input feature
 support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 11:10 AM Xin Ji <xji@analogixsemi.com> wrote:
>
> Add MIPI rx DPI input support
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 326 ++++++++++++++++++++++++------
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  20 +-
>  2 files changed, 285 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 04536cc..628ae43 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -150,18 +150,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
>         return anx7625_reg_write(ctx, client, offset, (val & (mask)));
>  }
>
> -static int anx7625_write_and_or(struct anx7625_data *ctx,
> -                               struct i2c_client *client,
> -                               u8 offset, u8 and_mask, u8 or_mask)
> +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
>  {
> -       int val;
> +       int i, ret;
>
> -       val = anx7625_reg_read(ctx, client, offset);
> -       if (val < 0)
> -               return val;
> +       ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> +                              AUDIO_CONTROL_REGISTER, 0x80);
> +       for (i = 0; i < 13; i++)
> +               ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +                                        VIDEO_BIT_MATRIX_12 + i,
> +                                        0x18 + i);
>
> -       return anx7625_reg_write(ctx, client,
> -                                offset, (val & and_mask) | (or_mask));
> +       return ret;
>  }
>
>  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> @@ -195,6 +195,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>         return 0;
>  }
>
> +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> +                                u8 addrh, u8 addrm, u8 addrl,
> +                                u8 len, u8 *buf)
> +{
> +       struct device *dev = &ctx->client->dev;
> +       int ret;
> +       u8 cmd;
> +
> +       if (len > MAX_DPCD_BUFFER_SIZE) {
> +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> +               return -EINVAL;
> +       }
> +
> +       cmd = ((len - 1) << 4) | 0x09;
> +
> +       /* Set command and length */
> +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                               AP_AUX_COMMAND, cmd);
> +
> +       /* Set aux access address */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_7_0, addrl);
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_15_8, addrm);
> +       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AUX_ADDR_19_16, addrh);
> +
> +       /* Enable aux access */
> +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> +
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> +               return -EIO;
> +       }
> +
> +       usleep_range(2000, 2100);
> +
> +       ret = wait_aux_op_finish(ctx);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> +               return ret;
> +       }
> +
> +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> +                                    AP_AUX_BUFF_START, len, buf);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
>                                       u8 status)
>  {
> @@ -219,38 +273,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
>         return ret;
>  }
>
> -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> -{
> -       struct device *dev = &ctx->client->dev;
> -       int ret;
> -
> -       /* Channel num */
> -       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> -                               AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> -
> -       /* FS */
> -       ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> -                                   AUDIO_CHANNEL_STATUS_4,
> -                                   0xf0, AUDIO_FS_48K);
> -       /* Word length */
> -       ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> -                                   AUDIO_CHANNEL_STATUS_5,
> -                                   0xf0, AUDIO_W_LEN_24_24MAX);
> -       /* I2S */
> -       ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> -                               AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> -       ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> -                                AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> -       /* Audio change flag */
> -       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> -                               AP_AV_STATUS, AP_AUDIO_CHG);
> -
> -       if (ret < 0)
> -               DRM_DEV_ERROR(dev, "fail to config audio.\n");
> -
> -       return ret;
> -}
> -
>  /* Reduction of fraction a/b */
>  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
>  {
> @@ -410,7 +432,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>         ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
>                         MIPI_LANE_CTRL_0, 0xfc);
>         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> -                               MIPI_LANE_CTRL_0, 3);
> +                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
>
>         /* Htotal */
>         htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> @@ -595,6 +617,101 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
>         return ret;
>  }
>
> +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> +{
> +       struct device *dev = &ctx->client->dev;
> +       u16 freq = ctx->dt.pixelclock.min / 1000;
> +       int ret;
> +
> +       /* configure pixel clock */
> +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                               PIXEL_CLOCK_L, freq & 0xFF);
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                                PIXEL_CLOCK_H, (freq >> 8));
> +
> +       /* set DPI mode */
> +       /* set to DPI PLL module sel */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +                                MIPI_DIGITAL_PLL_9, 0x20);
> +       /* power down MIPI */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +                                MIPI_LANE_CTRL_10, 0x08);
> +       /* enable DPI mode */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +                                MIPI_DIGITAL_PLL_18, 0x1C);
> +       /* set first edge */
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +                                VIDEO_CONTROL_0, 0x06);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> +
> +       return ret;
> +}
> +
> +static int anx7625_dpi_config(struct anx7625_data *ctx)
> +{
> +       struct device *dev = &ctx->client->dev;
> +       int ret;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> +
> +       /* DSC disable */
> +       ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +                               R_DSC_CTRL_0, ~DSC_EN);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> +               return ret;
> +       }
> +
> +       ret = anx7625_config_bit_matrix(ctx);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> +               return ret;
> +       }
> +
> +       ret = anx7625_api_dpi_config(ctx);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> +               return ret;
> +       }
> +
> +       /* set MIPI RX EN */
> +       ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +                              AP_AV_STATUS, AP_MIPI_RX_EN);
> +       /* clear mute flag */
> +       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +                                AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> +
> +       return ret;
> +}
> +
> +static int anx7625_hdcp_setting(struct anx7625_data *ctx)
> +{
> +       u8 bcap;
> +       struct device *dev = &ctx->client->dev;
> +
> +       if (!ctx->pdata.hdcp_support || !ctx->hdcp_en) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "hdcp_support(%d), hdcp_en(%d)\n",
> +                                    ctx->pdata.hdcp_support, ctx->hdcp_en);
> +               DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
> +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> +                                        0xee, 0x9f);
> +       }
> +
> +       anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> +       if (!(bcap & 0x01)) {
> +               DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> +                                        0xee, 0x9f);
> +       }
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> +
> +       return anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> +}
> +
>  static void anx7625_dp_start(struct anx7625_data *ctx)
>  {
>         int ret;
> @@ -605,9 +722,13 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>                 return;
>         }
>
> -       anx7625_config_audio_input(ctx);
> +       /* HDCP config */
> +       anx7625_hdcp_setting(ctx);
>
> -       ret = anx7625_dsi_config(ctx);
> +       if (ctx->pdata.is_dpi)
> +               ret = anx7625_dpi_config(ctx);
> +       else
> +               ret = anx7625_dsi_config(ctx);
>
>         if (ret < 0)
>                 DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> @@ -688,8 +809,7 @@ static int sp_tx_get_edid_block(struct anx7625_data *ctx)
>         return c;
>  }
>
> -static int edid_read(struct anx7625_data *ctx,
> -                    u8 offset, u8 *pblock_buf)
> +static int edid_read(struct anx7625_data *ctx, u8 offset, u8 *pblock_buf)
>  {
>         int ret, cnt;
>         struct device *dev = &ctx->client->dev;
> @@ -992,8 +1112,9 @@ static void anx7625_chip_control(struct anx7625_data *ctx, int state)
>
>         if (state) {
>                 atomic_inc(&ctx->power_status);
> -               if (atomic_read(&ctx->power_status) == 1)
> +               if (atomic_read(&ctx->power_status) == 1) {
>                         anx7625_power_on_init(ctx);
> +               }
>         } else {
>                 if (atomic_read(&ctx->power_status)) {
>                         atomic_dec(&ctx->power_status);
> @@ -1051,6 +1172,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>                 return;
>         }
>
> +       ctx->hpd_status = 1;
>         ctx->hpd_high_cnt++;
>
>         /* Not support HDCP */
> @@ -1060,8 +1182,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
>         /* Interrupt for DRM */
>         ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
>                 return;
> +       }
>
>         ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
>         if (ret < 0)
> @@ -1080,6 +1204,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
>         int ret, val;
>         struct device *dev = &ctx->client->dev;
>
> +       /* Interrupt mode, no need poll HPD status, just return */
> +       if (ctx->pdata.intp_irq)
> +               return;
> +
>         if (atomic_read(&ctx->power_status) != 1) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
>                 return;
> @@ -1130,6 +1258,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
>         ctx->slimport_edid_p.edid_block_num = -1;
>  }
>
> +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> +{
> +       int i;
> +
> +       for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> +               anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> +                                 DP_TX_LANE0_SWING_REG0 + i,
> +                                 ctx->pdata.lane0_reg_data[i] & 0xFF);
> +
> +       for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> +               anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> +                                 DP_TX_LANE1_SWING_REG0 + i,
> +                                 ctx->pdata.lane1_reg_data[i] & 0xFF);
> +}
> +
>  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  {
>         struct device *dev = &ctx->client->dev;
> @@ -1145,9 +1288,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>         } else {
>                 DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
>                 anx7625_start_dp_work(ctx);
> +               anx7625_dp_adjust_swing(ctx);
                     ctx->hpd_status = 1;        is missing here

>         }
> -
> -       ctx->hpd_status = 1;
>  }
>
>  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> @@ -1224,20 +1366,69 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
>         return IRQ_HANDLED;
>  }
>
> +static int anx7625_get_swing_setting(struct device *dev,
> +                                    struct anx7625_platform_data *pdata)
> +{
> +       int num_regs;
> +
> +       if (of_get_property(dev->of_node,
> +                           "analogix,lane0-swing", &num_regs)) {
> +               if (num_regs > DP_TX_SWING_REG_CNT)
> +                       num_regs = DP_TX_SWING_REG_CNT;
> +
> +               pdata->dp_lane0_swing_reg_cnt = num_regs;
> +               of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> +                                          pdata->lane0_reg_data, num_regs);
> +       }
> +
> +       if (of_get_property(dev->of_node,
> +                           "analogix,lane1-swing", &num_regs)) {
> +               if (num_regs > DP_TX_SWING_REG_CNT)
> +                       num_regs = DP_TX_SWING_REG_CNT;
> +
> +               pdata->dp_lane1_swing_reg_cnt = num_regs;
> +               of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> +                                          pdata->lane1_reg_data, num_regs);
> +       }
> +
> +       return 0;
> +}
> +
>  static int anx7625_parse_dt(struct device *dev,
>                             struct anx7625_platform_data *pdata)
>  {
>         struct device_node *np = dev->of_node;
>         struct drm_panel *panel;
>         int ret;
> +       int bus_type;
> +
> +       anx7625_get_swing_setting(dev, pdata);
>
> +       pdata->is_dpi = 1; /* default dpi mode */
>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>         if (!pdata->mipi_host_node) {
>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
>                 return -ENODEV;
>         }
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> +       if (of_property_read_u32(pdata->mipi_host_node, "bus-type", &bus_type))

According to previous patch, bus-type is added in endpoint node
instead of remote node (dsi), so this part should be:

struct device_node *np = dev->of_node, *ep0;

ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
of_property_read_u32(ep0, "bus-type", &bus_type);

I modified it based on this patch:

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
b/drivers/gpu/drm/bridge/analogix/anx7625.c
index f682b530dbfb6..343cc0bf785f6 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1541,10 +1542,10 @@ static void
anx7625_unregister_usb_two_ports(struct anx7625_data *ctx) {
 static int anx7625_parse_dt(struct device *dev,
                            struct anx7625_platform_data *pdata)
 {
-       struct device_node *np = dev->of_node;
+       struct device_node *np = dev->of_node, *ep0;
        struct drm_panel *panel;
        int ret;
-       int bus_type;
+       int bus_type = 0;

        anx7625_get_swing_setting(dev, pdata);

@@ -1555,8 +1556,9 @@ static int anx7625_parse_dt(struct device *dev,
                return -ENODEV;
        }

-       if (of_property_read_u32(pdata->mipi_host_node, "bus-type", &bus_type))
-               bus_type = 0;
+       ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
+       if (ep0)
+               ret = of_property_read_u32(ep0, "bus-type", &bus_type);


        if (bus_type == 5) /* bus type is Parallel(DSI) */


> +               bus_type = 0;
> +
> +       if (bus_type == 5) /* bus type is Parallel(DSI) */
> +               pdata->is_dpi = 0;
> +
> +       pdata->mipi_lanes = of_property_count_u32_elems(pdata->mipi_host_node,
> +                                                       "data-lanes");
> +       if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> +               pdata->mipi_lanes = MAX_LANES_SUPPORT;
> +
> +       if (pdata->is_dpi)
> +               DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> +       else
> +               DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> +
> +       if (of_property_read_bool(np, "analogix,hdcp-support"))
> +               pdata->hdcp_support = 1;
>
>         ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
>         if (ret < 0) {
> @@ -1300,9 +1491,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> +       DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> +
> +       if (ctx->pdata.panel_bridge)
> +               return connector_status_connected;
>
> -       return connector_status_connected;
> +       return ctx->hpd_status ? connector_status_connected :
> +                                    connector_status_disconnected;
>  }
>
>  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> @@ -1330,7 +1525,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>                 return -EINVAL;
>         }
>
> -       dsi->lanes = 4;
> +       dsi->lanes = ctx->pdata.mipi_lanes;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
>                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> @@ -1376,10 +1571,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>                 return -ENODEV;
>         }
>
> -       err = anx7625_attach_dsi(ctx);
> -       if (err) {
> -               DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> -               return err;
> +       if (!ctx->pdata.is_dpi) {
> +               err = anx7625_attach_dsi(ctx);
> +               if (err) {
> +                       DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> +                       return err;
> +               }
>         }
>
>         if (ctx->pdata.panel_bridge) {
> @@ -1478,6 +1675,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
>
> +       /* No need fixup for external monitor */
> +       if (!ctx->pdata.panel_bridge)
> +               return true;
> +
>         hsync = mode->hsync_end - mode->hsync_start;
>         hfp = mode->hsync_start - mode->hdisplay;
>         hbp = mode->htotal - mode->hsync_end;
> @@ -1786,8 +1987,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>
>         platform->bridge.funcs = &anx7625_bridge_funcs;
>         platform->bridge.of_node = client->dev.of_node;
> -       platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> -       platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +       platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       if (!platform->pdata.panel_bridge)
> +               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> +                                       DRM_BRIDGE_OP_DETECT;
> +       platform->bridge.type = platform->pdata.panel_bridge ?
> +                                   DRM_MODE_CONNECTOR_eDP :
> +                                   DRM_MODE_CONNECTOR_DisplayPort;
>         drm_bridge_add(&platform->bridge);
>
>         DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 193ad86..127081e 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -141,12 +141,20 @@
>  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
>
>  /******** END of I2C Address 0x72 *********/
> +
> +/***************************************************************/
> +/* Register definition of device address 0x7a */
> +#define DP_TX_SWING_REG_CNT            0x14
> +#define DP_TX_LANE0_SWING_REG0         0x00
> +#define DP_TX_LANE1_SWING_REG0         0x14
> +/******** END of I2C Address 0x7a *********/
> +
>  /***************************************************************/
>  /* Register definition of device address 0x7e */
>
>  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
>
> -#define FLASH_LOAD_STA 0x05
> +#define FLASH_LOAD_STA          0x05
>  #define FLASH_LOAD_STA_CHK     BIT(7)
>
>  #define  XTAL_FRQ_SEL    0x3F
> @@ -347,11 +355,20 @@ struct s_edid_data {
>
>  /***************** Display End *****************/
>
> +#define MAX_LANES_SUPPORT      4
> +
>  struct anx7625_platform_data {
>         struct gpio_desc *gpio_p_on;
>         struct gpio_desc *gpio_reset;
>         struct drm_bridge *panel_bridge;
>         int intp_irq;
> +       int is_dpi;
> +       int mipi_lanes;
> +       int hdcp_support;
> +       int dp_lane0_swing_reg_cnt;
> +       int lane0_reg_data[DP_TX_SWING_REG_CNT];
> +       int dp_lane1_swing_reg_cnt;
> +       int lane1_reg_data[DP_TX_SWING_REG_CNT];
>         u32 low_power_mode;
>         struct device_node *mipi_host_node;
>  };
> @@ -371,6 +388,7 @@ struct anx7625_data {
>         atomic_t power_status;
>         int hpd_status;
>         int hpd_high_cnt;
> +       int hdcp_en;
>         /* Lock for work queue */
>         struct mutex lock;
>         struct i2c_client *client;
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
