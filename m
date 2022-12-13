Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF35E64B8F6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B53B10E316;
	Tue, 13 Dec 2022 15:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114D10E316
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:52:04 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id m204so157950oib.6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L4S6IY7Es8dJWmI1zKzaLLFQ5iuTC9RKmLux8vmUzGE=;
 b=D9wU+Rg0YiCXNDBHDRj9XnWXn3dXydF8CYKT0c16X8a2mXyqOCqGHg5BOfRFQnFjCm
 RzxmAz7r3BjFENEC+pP0YeTEF966HzzlsS/mCur6gIGC4sxcWhPy3VKxyjg3/6ms5Jcr
 oB1g90yKF9g8uG2mQnBNyo4ZFSyc2Hw5fuaoXdoMdpV+pv2osMbc3pku+BtNq62B74N5
 qo94fR1kbFFgT2hWxA58Z+U51bc+PnI6Q5v0Sf3mEW6/67CABSEyYA3HRv97nVVEs6SB
 mm9Wbej0OKS5qOxue2tJcn2NE2G5v+VOR9ttXlJVRrK0vb9raj/YoNxjPWQSf5qDOwkn
 a/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4S6IY7Es8dJWmI1zKzaLLFQ5iuTC9RKmLux8vmUzGE=;
 b=RrhHngE150tqa56Av36ju65v/ftx7jTtYY0d+aCGxVFtJx5d4qS2TdGMTHBxppBrLg
 we7druBOeVXBnG+t6dl/0zWDQW3F0S11miaNSSA24T4JoDzoKu2ME5krSKz1TFfTwOJ1
 DxJZV5eeMUaDyn0/32CaET++T5oJ278luLVjaaxdAtmI+3vN0FMLjRhtckKYjgbCnzNm
 1rckmyr8QG8vyOuC7jZi+XLIRlPHddifFqRghAfHhDfT46arQGsayayp6QurAzMHG9Cr
 bjazDaH47uAtfuaKykegjpzzzaHR5+e/UKr3ZeGOUyj5vUSXhSRVLpM5dsKeb6agnkcp
 FQdQ==
X-Gm-Message-State: ANoB5pngz6dlofA0qMgoWODSNxiRFSwDJM8rJy9+yiMai2yhGZM8q1LC
 Q9Q3vu3nxxnDMWPJSX/Bs+mt2RseQQtlpVHkDm4WvQ==
X-Google-Smtp-Source: AA0mqf6TruzSZYgUeKTJod8DzV8p0+JYiry+zrVHJx1IjNq3sPx4471W+oNLLG+dJPMsU9fXrn/5oUmSuQpee25Di7M=
X-Received: by 2002:a54:4817:0:b0:35e:5a1b:825c with SMTP id
 j23-20020a544817000000b0035e5a1b825cmr236167oij.155.1670946723985; Tue, 13
 Dec 2022 07:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20221115112720.911158-1-treapking@chromium.org>
In-Reply-To: <20221115112720.911158-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 13 Dec 2022 16:51:52 +0100
Message-ID: <CAG3jFys7gbB7tyLmpByZcamAXMSRWdEY_4rjCXWwXtT67DFLdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add caching for EDID
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 allen chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 at 12:27, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Add caching when EDID is read, and invalidate the cache until the
> bridge detects HPD low or sink count changes on HPD_IRQ.
>
> It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
> one EDID read would be a notable difference on user experience.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 21a9b8422bda..4b818f31668f 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -457,6 +457,8 @@ struct it6505 {
>
>         /* it6505 driver hold option */
>         bool enable_drv_hold;
> +
> +       struct edid *cached_edid;
>  };
>
>  struct it6505_step_train_para {
> @@ -2244,6 +2246,13 @@ static void it6505_plugged_status_to_codec(struct it6505 *it6505)
>                                    status == connector_status_connected);
>  }
>
> +
> +static void it6505_remove_edid(struct it6505 *it6505)
> +{
> +       kfree(it6505->cached_edid);
> +       it6505->cached_edid = NULL;
> +}
> +
>  static int it6505_process_hpd_irq(struct it6505 *it6505)
>  {
>         struct device *dev = &it6505->client->dev;
> @@ -2270,6 +2279,7 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
>                 it6505_reset_logic(it6505);
>                 it6505_int_mask_enable(it6505);
>                 it6505_init(it6505);
> +               it6505_remove_edid(it6505);
>                 return 0;
>         }
>
> @@ -2353,6 +2363,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>                         it6505_video_reset(it6505);
>         } else {
>                 memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
> +               it6505_remove_edid(it6505);
>
>                 if (it6505->hdcp_desired)
>                         it6505_stop_hdcp(it6505);
> @@ -3016,16 +3027,18 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
>  {
>         struct it6505 *it6505 = bridge_to_it6505(bridge);
>         struct device *dev = &it6505->client->dev;
> -       struct edid *edid;
>
> -       edid = drm_do_get_edid(connector, it6505_get_edid_block, it6505);
> +       if (!it6505->cached_edid) {
> +               it6505->cached_edid = drm_do_get_edid(connector, it6505_get_edid_block,
> +                                                     it6505);
>
> -       if (!edid) {
> -               DRM_DEV_DEBUG_DRIVER(dev, "failed to get edid!");
> -               return NULL;
> +               if (!it6505->cached_edid) {
> +                       DRM_DEV_DEBUG_DRIVER(dev, "failed to get edid!");
> +                       return NULL;
> +               }
>         }
>
> -       return edid;
> +       return drm_edid_duplicate(it6505->cached_edid);
>  }
>
>  static const struct drm_bridge_funcs it6505_bridge_funcs = {
> @@ -3367,6 +3380,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
>         drm_dp_aux_unregister(&it6505->aux);
>         it6505_debugfs_remove(it6505);
>         it6505_poweroff(it6505);
> +       it6505_remove_edid(it6505);
>  }
>
>  static const struct i2c_device_id it6505_id[] = {
> --
> 2.38.1.493.g58b659f92b-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
