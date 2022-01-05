Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1C485127
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 11:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D8910E5C7;
	Wed,  5 Jan 2022 10:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5C810E5C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 10:32:13 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id i6so22997543pla.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i0DF2uWtRx4/oZQQXeRDMyqx+3oMAuS7Z9oqQd4ubmw=;
 b=RPEasUsyoDilhWJGyd2w/fYyqncoGvfm2/kLFtD7kmT1sVI+ZMWYDF4UZiuDxO2iHZ
 D9rc0oFj7HpFi0xL5TBLaNqHEibQoJwfIY/4gSXlEk/vYAa3R5k1F1tS6V+MAXxbsil1
 ydnaWmRtgGWyXyLwgTyPyOsQ+J/giMVI77zELIf47IYCGCrN6/h2NzMxc8hTr2ZvypqC
 it7E+N+RTxA2tVXvv1CHjJaXDvAibMND+JSdsIMNYLrh5iYKxaWyAiWcsm8C/3vHsuoK
 KlgQuZvyIgs+SOVVhp48ymHDstxzwHyxnMetmA/HB6TklvOtSM+f0wk0rmuxYKnq7TrX
 bTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i0DF2uWtRx4/oZQQXeRDMyqx+3oMAuS7Z9oqQd4ubmw=;
 b=ozMJJQT8p1elod/nVPSLJ4urOhU56WYhSjKRHW9iuzFlS9ReGkjzfyiZQy8xx/erCs
 RNwRnW3M6TG+R29vZoqOgoaHFjGY0/P9/Awu82mVJmlC7JeNjyJXwRJw/CSuv0nmgZhI
 BEZf5RJxUL7K7TGXlfZfVU2++mgX2Zi1By9RNofURX0DgBkUIJt4djN1MRxwQWS77Ter
 MDkx2dtUjubmfutPpRFMHjsvsaAOTkqdHYO5ZQOXN83ATd8x2Gq1NmiWC42sHB+0UBVU
 25/KwXc5kHjoYLMoeK7jrVr9YcBHhOBlHXk+tP0XjM8rYzIDVE8vr08/gkC1SrC9dVo1
 1l2w==
X-Gm-Message-State: AOAM530N5pC0rWGO7zZ3wjA6I37SbfPzqIxlEeMnm25sQ2zW5Qkjhbfw
 HxoIU+JIqWDlqs/rVlMGXeh31CcOr+It7o+Un0nL/A==
X-Google-Smtp-Source: ABdhPJzqWoiIt/CTTYO6YoHtCG3B/J/t7yE4sXXU1TuEmHCJe9zUOXDYm6aRlOBsBbTr6S1XtnjcpvvBxqagcjfrTxo=
X-Received: by 2002:a17:90a:5295:: with SMTP id
 w21mr1010506pjh.179.1641378732756; 
 Wed, 05 Jan 2022 02:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20211109024237.3354741-1-xji@analogixsemi.com>
 <CAG3jFytGbNadbCMOY_GiEsB565PtTah_A1sNik7NK5FYrhScEw@mail.gmail.com>
 <20220105071709.GA1312820@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220105071709.GA1312820@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 Jan 2022 11:32:01 +0100
Message-ID: <CAG3jFysy1BcykodMWRnvB-BJj9Jx7yHLbsJu2Kp52n_7kVS4gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: add HDCP support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jan 2022 at 08:17, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Tue, Jan 04, 2022 at 03:50:34PM +0100, Robert Foss wrote:
> > Hey Xin,
> Hi Robert Foss, thanks for the reply.
> As HDCP config interface "anx7625_hdcp_config(..)" need be called in
> anx7625_connector_atomic_check(...) interface, so I cannot split out
> atomic conversion patch.

I don't think that's correct, but maybe I'm missing something. The
atomic conversion patch should be self-contained if done before the
addition of HDCP support.

>
> Thanks,
> Xin
> >
> > On Tue, 9 Nov 2021 at 03:42, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > This patch provides HDCP setting interface for userspace to dynamic
> > > enable/disable HDCP function.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 368 +++++++++++++++++++++-
> > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  69 +++-
> > >  2 files changed, 425 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 001fb39d9919..6d93026c2999 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -26,6 +26,7 @@
> > >  #include <drm/drm_crtc_helper.h>
> > >  #include <drm/drm_dp_helper.h>
> > >  #include <drm/drm_edid.h>
> > > +#include <drm/drm_hdcp.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > > @@ -213,6 +214,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
> > >         return 0;
> > >  }
> > >
> > > +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> > > +                                u8 addrh, u8 addrm, u8 addrl,
> > > +                                u8 len, u8 *buf)
> > > +{
> > > +       struct device *dev = &ctx->client->dev;
> > > +       int ret;
> > > +       u8 cmd;
> > > +
> > > +       if (len > MAX_DPCD_BUFFER_SIZE) {
> > > +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       cmd = ((len - 1) << 4) | 0x09;
> > > +
> > > +       /* Set command and length */
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                               AP_AUX_COMMAND, cmd);
> > > +
> > > +       /* Set aux access address */
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                AP_AUX_ADDR_7_0, addrl);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                AP_AUX_ADDR_15_8, addrm);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                AP_AUX_ADDR_19_16, addrh);
> > > +
> > > +       /* Enable aux access */
> > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > > +
> > > +       if (ret < 0) {
> > > +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       usleep_range(2000, 2100);
> > > +
> > > +       ret = wait_aux_op_finish(ctx);
> > > +       if (ret) {
> > > +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > > +                                    AP_AUX_BUFF_START, len, buf);
> > > +       if (ret < 0) {
> > > +               DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > >                                       u8 status)
> > >  {
> > > @@ -669,6 +724,160 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
> > >         return ret;
> > >  }
> > >
> > > +static int anx7625_read_flash_status(struct anx7625_data *ctx)
> > > +{
> > > +       return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
> > > +}
> > > +
> > > +static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
> > > +{
> > > +       int ret, val;
> > > +       struct device *dev = &ctx->client->dev;
> > > +       u8 ident[32];
> >
> > Could this hardcoded array length be replaced with FLASH_BUF_LEN?
> >
> > > +
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                               FLASH_ADDR_HIGH, 0x91);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                FLASH_ADDR_LOW, 0xA0);
> > > +       if (ret < 0) {
> > > +               DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                               FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
> > > +       if (ret < 0) {
> > > +               DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                               R_FLASH_RW_CTRL, FLASH_READ);
> > > +       ret |= readx_poll_timeout(anx7625_read_flash_status,
> > > +                                 ctx, val,
> > > +                                 ((val & FLASH_DONE) || (val < 0)),
> > > +                                 2000,
> > > +                                 2000 * 150);
> > > +       if (ret) {
> > > +               DRM_DEV_ERROR(dev, "flash read access fail!\n");
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > > +                                    FLASH_BUF_BASE_ADDR,
> > > +                                    FLASH_BUF_LEN, ident);
> > > +       if (ret < 0) {
> > > +               DRM_DEV_ERROR(dev, "read flash data fail!\n");
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
> > > +               return -EINVAL;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
> > > +{
> > > +       int ret;
> > > +       struct device *dev = &ctx->client->dev;
> > > +
> > > +       /* Select HDCP 1.4 KEY */
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                               R_BOOT_RETRY, 0x12);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                FLASH_ADDR_HIGH, HDCP14KEY_START_ADDR >> 8);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                FLASH_ADDR_LOW, HDCP14KEY_START_ADDR & 0xFF);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                R_RAM_LEN_H, HDCP14KEY_SIZE >> 12);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                R_RAM_LEN_L, HDCP14KEY_SIZE >> 4);
> > > +
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                R_RAM_ADDR_H, 0);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                R_RAM_ADDR_L, 0);
> > > +       /* Enable HDCP 1.4 KEY load */
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > +                                R_RAM_CTRL, DECRYPT_EN | LOAD_START);
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "load HDCP 1.4 key done\n");
> > > +       return ret;
> > > +}
> > > +
> > > +static int anx7625_hdcp_config(struct anx7625_data *ctx, bool on)
> > > +{
> > > +       u8 bcap;
> > > +       int ret;
> > > +       struct device *dev = &ctx->client->dev;
> > > +
> > > +       if (!on) {
> > > +               DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP 1.4\n");
> > > +
> > > +               /* Disable HDCP */
> > > +               ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > > +               /* Try auth flag */
> > > +               ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > +               /* Interrupt for DRM */
> > > +               ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > +               if (ret < 0)
> > > +                       DRM_DEV_ERROR(dev, "fail to disable HDCP\n");
> > > +
> > > +               return anx7625_write_and(ctx, ctx->i2c.tx_p0_client,
> > > +                                        TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> > > +       }
> > > +
> > > +       ret = anx7625_hdcp_key_probe(ctx);
> > > +       if (ret) {
> > > +               DRM_DEV_DEBUG_DRIVER(dev, "no key found, not to do hdcp\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> > > +       if (!(bcap & 0x01)) {
> > > +               DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> > > +               return 0;
> > > +       }
> > > +
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> > > +
> > > +       /* First clear HDCP state */
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > +                               TX_HDCP_CTRL0,
> > > +                               KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> > > +       usleep_range(1000, 1100);
> > > +       /* Second clear HDCP state */
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > +                                TX_HDCP_CTRL0,
> > > +                                KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> > > +
> > > +       /* Set time for waiting KSVR */
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > +                                SP_TX_WAIT_KSVR_TIME, 0xc8);
> > > +       /* Set time for waiting R0 */
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > +                                SP_TX_WAIT_R0_TIME, 0xb0);
> > > +       ret |= anx7625_hdcp_key_load(ctx);
> > > +       if (ret) {
> > > +               DRM_WARN("prepare HDCP key failed.\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> > > +
> > > +       /* Try auth flag */
> > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > +       /* Interrupt for DRM */
> > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > +       if (ret < 0)
> > > +               DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
> > > +
> > > +       return anx7625_write_or(ctx, ctx->i2c.tx_p0_client,
> > > +                               TX_HDCP_CTRL0, HARD_AUTH_EN);
> > > +}
> > > +
> > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > >  {
> > >         int ret;
> > > @@ -679,6 +888,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > >                 return;
> > >         }
> > >
> > > +       /* Disable HDCP */
> > > +       anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > > +
> > >         if (ctx->pdata.is_dpi)
> > >                 ret = anx7625_dpi_config(ctx);
> > >         else
> > > @@ -686,6 +898,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > >
> > >         if (ret < 0)
> > >                 DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > > +
> > > +       ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > +
> > > +       ctx->dp_en = 1;
> > >  }
> > >
> > >  static void anx7625_dp_stop(struct anx7625_data *ctx)
> > > @@ -705,6 +921,10 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
> > >         ret |= anx7625_video_mute_control(ctx, 1);
> > >         if (ret < 0)
> > >                 DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
> > > +
> > > +       ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > +
> > > +       ctx->dp_en = 0;
> > >  }
> > >
> > >  static int sp_tx_rst_aux(struct anx7625_data *ctx)
> > > @@ -859,7 +1079,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> > >                                 AP_AUX_ADDR_7_0, 0x50);
> > >         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > >                                  AP_AUX_ADDR_15_8, 0);
> > > -       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > >                                  AP_AUX_ADDR_19_16, 0xf0);
> > >         if (ret < 0) {
> > >                 DRM_DEV_ERROR(dev, "access aux channel IO error.\n");
> > > @@ -1688,6 +1908,83 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > >         return 0;
> > >  }
> > >
> > > +void hdcp_check_work_func(struct work_struct *work)
> > > +{
> > > +       u8 status;
> > > +       struct delayed_work *dwork;
> > > +       struct anx7625_data *ctx;
> > > +       struct device *dev;
> > > +       struct drm_device *drm_dev;
> > > +
> > > +       dwork = to_delayed_work(work);
> > > +       ctx = container_of(dwork, struct anx7625_data, hdcp_work);
> > > +       dev = &ctx->client->dev;
> > > +
> > > +       if (!ctx->connector) {
> > > +               DRM_ERROR("HDCP connector is null!");
> > > +               return;
> > > +       }
> > > +
> > > +       drm_dev = ctx->connector->dev;
> > > +       drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> > > +       mutex_lock(&ctx->hdcp_wq_lock);
> > > +
> > > +       status = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client, 0);
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "sink HDCP status check: %.02x\n", status);
> > > +       if (status & BIT(1)) {
> > > +               ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> > > +               drm_hdcp_update_content_protection(ctx->connector,
> > > +                                                  ctx->hdcp_cp);
> > > +               DRM_DEV_DEBUG_DRIVER(dev, "update CP to ENABLE\n");
> > > +       }
> > > +
> > > +       mutex_unlock(&ctx->hdcp_wq_lock);
> > > +       drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> > > +}
> > > +
> > > +static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
> > > +                                         struct drm_connector_state *state)
> > > +{
> > > +       struct device *dev = &ctx->client->dev;
> > > +       int cp;
> > > +
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "hdcp state check\n");
> > > +       cp = state->content_protection;
> > > +
> > > +       if (cp == ctx->hdcp_cp)
> > > +               return 0;
> > > +
> > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > +               if (ctx->dp_en) {
> > > +                       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP\n");
> > > +                       anx7625_hdcp_config(ctx, true);
> > > +
> > > +                       queue_delayed_work(ctx->hdcp_workqueue,
> > > +                                          &ctx->hdcp_work,
> > > +                                          msecs_to_jiffies(2000));
> > > +               }
> > > +       }
> > > +
> > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > +               if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > +                       DRM_ERROR("current CP is not ENABLED\n");
> > > +                       return -EINVAL;
> > > +               }
> > > +               anx7625_hdcp_config(ctx, false);
> > > +               ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > +               drm_hdcp_update_content_protection(ctx->connector,
> > > +                                                  ctx->hdcp_cp);
> > > +               DRM_DEV_DEBUG_DRIVER(dev, "update CP to UNDESIRE\n");
> > > +       }
> > > +
> > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > +               DRM_ERROR("Userspace illegal set to PROTECTION ENABLE\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int anx7625_bridge_attach(struct drm_bridge *bridge,
> > >                                  enum drm_bridge_attach_flags flags)
> > >  {
> > > @@ -1902,25 +2199,58 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > >         return true;
> > >  }
> > >
> > > -static void anx7625_bridge_enable(struct drm_bridge *bridge)
> > > +static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
> > > +                                      struct drm_bridge_state *bridge_state,
> > > +                                      struct drm_crtc_state *crtc_state,
> > > +                                      struct drm_connector_state *conn_state)
> > >  {
> > >         struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > >         struct device *dev = &ctx->client->dev;
> > >
> > > -       DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "drm bridge atomic check\n");
> > > +       anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
> > > +                                 &crtc_state->adjusted_mode);
> > > +
> > > +       return anx7625_connector_atomic_check(ctx, conn_state);

If doing an atomic only conversion patch, the above function call
could simply be removed.

> > > +}
> > > +
> > > +static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                        struct drm_bridge_state *state)
> > > +{
> > > +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > > +       struct device *dev = &ctx->client->dev;
> > > +       struct drm_connector *connector;
> > > +
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "drm atomic enable\n");
> > > +
> > > +       if (!bridge->encoder) {
> > > +               DRM_DEV_ERROR(dev, "Parent encoder object not found");
> > > +               return;
> > > +       }
> > > +
> > > +       connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
> > > +                                                            bridge->encoder);
> > > +       if (!connector)
> > > +               return;
> > > +
> > > +       ctx->connector = connector;
> > > +
> > > +       DRM_DEV_DEBUG_DRIVER(dev, "attached content protection.\n");
> > >
> > >         pm_runtime_get_sync(dev);
> > >
> > >         anx7625_dp_start(ctx);
> > >  }
> > >
> > > -static void anx7625_bridge_disable(struct drm_bridge *bridge)
> > > +static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> > > +                                         struct drm_bridge_state *old)
> > >  {
> > >         struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > >         struct device *dev = &ctx->client->dev;
> > >
> > >         DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
> > >
> > > +       ctx->connector = NULL;
> > >         anx7625_dp_stop(ctx);
> > >
> > >         pm_runtime_put_sync(dev);
> > > @@ -1950,11 +2280,14 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
> > >
> > >  static const struct drm_bridge_funcs anx7625_bridge_funcs = {
> > >         .attach = anx7625_bridge_attach,
> > > -       .disable = anx7625_bridge_disable,
> > >         .mode_valid = anx7625_bridge_mode_valid,
> > >         .mode_set = anx7625_bridge_mode_set,
> > > -       .mode_fixup = anx7625_bridge_mode_fixup,
> > > -       .enable = anx7625_bridge_enable,
> > > +       .atomic_check = anx7625_bridge_atomic_check,
> > > +       .atomic_enable = anx7625_bridge_atomic_enable,
> > > +       .atomic_disable = anx7625_bridge_atomic_disable,
> > > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> >
> > Could this atomic conversion be split out into its own logical patch?
> >
> > >         .detect = anx7625_bridge_detect,
> > >         .get_edid = anx7625_bridge_get_edid,
> > >  };
> > > @@ -2134,6 +2467,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >         anx7625_init_gpio(platform);
> > >
> > >         mutex_init(&platform->lock);
> > > +       mutex_init(&platform->hdcp_wq_lock);
> > > +
> > > +       INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
> > > +       platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
> > > +       if (!platform->hdcp_workqueue) {
> > > +               DRM_DEV_ERROR(dev, "fail to create work queue\n");
> > > +               ret = -ENOMEM;
> > > +               goto free_platform;
> > > +       }
> > >
> > >         platform->pdata.intp_irq = client->irq;
> > >         if (platform->pdata.intp_irq) {
> > > @@ -2143,7 +2485,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >                 if (!platform->workqueue) {
> > >                         DRM_DEV_ERROR(dev, "fail to create work queue\n");
> > >                         ret = -ENOMEM;
> > > -                       goto free_platform;
> > > +                       goto free_hdcp_wq;
> > >                 }
> > >
> > >                 ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
> > > @@ -2213,6 +2555,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >         if (platform->workqueue)
> > >                 destroy_workqueue(platform->workqueue);
> > >
> > > +free_hdcp_wq:
> > > +       if (platform->hdcp_workqueue)
> > > +               destroy_workqueue(platform->hdcp_workqueue);
> > > +
> > >  free_platform:
> > >         kfree(platform);
> > >
> > > @@ -2228,6 +2574,12 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> > >         if (platform->pdata.intp_irq)
> > >                 destroy_workqueue(platform->workqueue);
> > >
> > > +       if (platform->hdcp_workqueue) {
> > > +               cancel_delayed_work(&platform->hdcp_work);
> > > +               flush_workqueue(platform->workqueue);
> > > +               destroy_workqueue(platform->workqueue);
> > > +       }
> > > +
> > >         if (!platform->pdata.low_power_mode)
> > >                 pm_runtime_put_sync_suspend(&client->dev);
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > index 3d79b6fb13c8..89b1b347a463 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > @@ -59,10 +59,23 @@
> > >
> > >  /***************************************************************/
> > >  /* Register definition of device address 0x70 */
> > > -#define  I2C_ADDR_70_DPTX              0x70
> > > -
> > > -#define SP_TX_LINK_BW_SET_REG 0xA0
> > > -#define SP_TX_LANE_COUNT_SET_REG 0xA1
> > > +#define TX_HDCP_CTRL0                  0x01
> > > +#define STORE_AN                       BIT(7)
> > > +#define RX_REPEATER                    BIT(6)
> > > +#define RE_AUTHEN                      BIT(5)
> > > +#define SW_AUTH_OK                     BIT(4)
> > > +#define HARD_AUTH_EN                   BIT(3)
> > > +#define ENC_EN                         BIT(2)
> > > +#define BKSV_SRM_PASS                  BIT(1)
> > > +#define KSVLIST_VLD                    BIT(0)
> > > +
> > > +#define SP_TX_WAIT_R0_TIME             0x40
> > > +#define SP_TX_WAIT_KSVR_TIME           0x42
> > > +#define SP_TX_SYS_CTRL1_REG            0x80
> > > +#define HDCP2TX_FW_EN                  BIT(4)
> > > +
> > > +#define SP_TX_LINK_BW_SET_REG          0xA0
> > > +#define SP_TX_LANE_COUNT_SET_REG       0xA1
> > >
> > >  #define M_VID_0 0xC0
> > >  #define M_VID_1 0xC1
> > > @@ -71,6 +84,12 @@
> > >  #define N_VID_1 0xC4
> > >  #define N_VID_2 0xC5
> > >
> > > +#define KEY_START_ADDR                 0x9000
> > > +#define KEY_RESERVED                   416
> > > +
> > > +#define HDCP14KEY_START_ADDR           (KEY_START_ADDR + KEY_RESERVED)
> > > +#define HDCP14KEY_SIZE                 624
> > > +
> > >  /***************************************************************/
> > >  /* Register definition of device address 0x72 */
> > >  #define AUX_RST        0x04
> > > @@ -155,9 +174,43 @@
> > >
> > >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> > >
> > > +#define R_BOOT_RETRY           0x00
> > > +#define R_RAM_ADDR_H           0x01
> > > +#define R_RAM_ADDR_L           0x02
> > > +#define R_RAM_LEN_H            0x03
> > > +#define R_RAM_LEN_L            0x04
> > >  #define FLASH_LOAD_STA          0x05
> > >  #define FLASH_LOAD_STA_CHK     BIT(7)
> > >
> > > +#define R_RAM_CTRL              0x05
> > > +/* bit positions */
> > > +#define FLASH_DONE              BIT(7)
> > > +#define BOOT_LOAD_DONE          BIT(6)
> > > +#define CRC_OK                  BIT(5)
> > > +#define LOAD_DONE               BIT(4)
> > > +#define O_RW_DONE               BIT(3)
> > > +#define FUSE_BUSY               BIT(2)
> > > +#define DECRYPT_EN              BIT(1)
> > > +#define LOAD_START              BIT(0)
> > > +
> > > +#define FLASH_ADDR_HIGH         0x0F
> > > +#define FLASH_ADDR_LOW          0x10
> > > +#define FLASH_LEN_HIGH          0x31
> > > +#define FLASH_LEN_LOW           0x32
> > > +#define R_FLASH_RW_CTRL         0x33
> > > +/* bit positions */
> > > +#define READ_DELAY_SELECT       BIT(7)
> > > +#define GENERAL_INSTRUCTION_EN  BIT(6)
> > > +#define FLASH_ERASE_EN          BIT(5)
> > > +#define RDID_READ_EN            BIT(4)
> > > +#define REMS_READ_EN            BIT(3)
> > > +#define WRITE_STATUS_EN         BIT(2)
> > > +#define FLASH_READ              BIT(1)
> > > +#define FLASH_WRITE             BIT(0)
> > > +
> > > +#define FLASH_BUF_BASE_ADDR     0x60
> > > +#define FLASH_BUF_LEN           0x20
> > > +
> > >  #define  XTAL_FRQ_SEL    0x3F
> > >  /* bit field positions */
> > >  #define  XTAL_FRQ_SEL_POS    5
> > > @@ -392,21 +445,29 @@ struct anx7625_data {
> > >         struct platform_device *audio_pdev;
> > >         int hpd_status;
> > >         int hpd_high_cnt;
> > > +       int dp_en;
> > > +       int hdcp_cp;
> > >         /* Lock for work queue */
> > >         struct mutex lock;
> > >         struct i2c_client *client;
> > >         struct anx7625_i2c_client i2c;
> > >         struct i2c_client *last_client;
> > > +       struct timer_list hdcp_timer;
> > >         struct s_edid_data slimport_edid_p;
> > >         struct device *codec_dev;
> > >         hdmi_codec_plugged_cb plugged_cb;
> > >         struct work_struct work;
> > >         struct workqueue_struct *workqueue;
> > > +       struct delayed_work hdcp_work;
> > > +       struct workqueue_struct *hdcp_workqueue;
> > > +       /* Lock for hdcp work queue */
> > > +       struct mutex hdcp_wq_lock;
> > >         char edid_block;
> > >         struct display_timing dt;
> > >         u8 display_timing_valid;
> > >         struct drm_bridge bridge;
> > >         u8 bridge_attached;
> > > +       struct drm_connector *connector;
> > >         struct mipi_dsi_device *dsi;
> > >  };
> > >
> > > --
> > > 2.25.1
> > >
> >
> > With the above issues fixed, feel free to add my R-b to this patch and
> > the split out atomic conversion patch.
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
