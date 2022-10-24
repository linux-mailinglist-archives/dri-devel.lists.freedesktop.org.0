Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5E609BE6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027610E2C3;
	Mon, 24 Oct 2022 07:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CDB10E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:56:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x2so833995edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SwWQb8oemB4+jz+zwrXGcKHoP4NnD8EJpRvthEA+8Xk=;
 b=mgc9eBnmWDCw/KI1b91Hzr+SXtXXihZ/IZ9Xf8LZFla/f4O2nMMhiJcxnD5FHTUO28
 ddZDYlhmLoY3rz9RezoehbyUY5h3vvGLTYJWNpSdV15+LS0vYKA9CHdUbQCHLFAffqwy
 Sx/Tn2r5KJ/Xen6DU4SyJiS3ToqUcyttByQZ8Q5MToumbr/lWg3mKJOnMWa/T1BLKei2
 G5aw8oQ8sYmsEDkHbRMOG/QzUhxM1tH1H6HRVyvCb18c7wY2csgSfgenX/JsVdGScI48
 M8omtLWbBOmopwbnZ9IUqsSFuWgKPiv8x+IoEZsv6KeGkFGDbbSatsjmvTlA82lpOLvk
 cobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SwWQb8oemB4+jz+zwrXGcKHoP4NnD8EJpRvthEA+8Xk=;
 b=hRxl6n1N4sEuntk34nse+AbGd9pjZnKUb9iKOZ1Pjd9hQIWk3K8bu1L14E5XFHKMi5
 UVRJDDEanBPBBc8FW2cNbKiFx3XWkb9tiHrIo+mAEp5jOZ581IezaMH8zov/fGEYDGDg
 NcCO41M0svq+IODZ3pchtwygQKoQNwoRX+71uAQ5D5DZZQDzHFRe+KPFzChDZUJmvLhQ
 6UC/Ld86MzZ+T3tTrW6UknIwm4SZMu6wbFli0sOH1c1yjB8z9FxB37WSqQNTUNz3mT59
 HVTIYfdmjRJ19imm66kUNzcZRR/EdYvEmJ3AQujh5YqJbGeqj02Lg01Ujovz6x7ldlgA
 tY1Q==
X-Gm-Message-State: ACrzQf1tUayTeIF7zuYjrQK1IiQO26YbWvAT0BUKlYOeq28+p193Veh3
 QfUqJbqIPLB/flR1C6BvYKyorDP6+6S99n1o55vbJY5tcE0=
X-Google-Smtp-Source: AMsMyM6iTIpIj01086FgzlaMlYcgrK55GCiS7dDyxU3CMtDClj3564oTprjeQT+ELvW3jRF4OVfa+S60/W69KvNmfAg=
X-Received: by 2002:a05:6402:2402:b0:45c:a1ce:94d8 with SMTP id
 t2-20020a056402240200b0045ca1ce94d8mr28776441eda.50.1666598186547; Mon, 24
 Oct 2022 00:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221013110411.1674359-1-treapking@chromium.org>
 <20221013110411.1674359-3-treapking@chromium.org>
In-Reply-To: <20221013110411.1674359-3-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 09:56:15 +0200
Message-ID: <CAG3jFyskXfbX=rTye9ygT36kKmqJRr0rO1eQrKSr1V7hOHxDcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: it6505: Setup links in it6505_irq_hpd
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022 at 13:04, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Move the DPCD read and link setup steps to HPD IRQ handler to remove
> an unnecessary dependency between .detect callback and the HPD IRQ
> handler before registering it6505 as a DRM bridge. This is safe because
> there is always a .detect call after each HPD IRQ handler triggered by
> the drm_helper_hpd_irq_event call.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> Changes in v2:
> - Remove redundant spaces in it6505_detect
> - Read sink count in it6505_irq_hpd
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 80 +++++++++++++----------------
>  1 file changed, 35 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index f7f6c3e20fae..4b6061272599 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -725,28 +725,6 @@ static void it6505_calc_video_info(struct it6505 *it6505)
>                              DRM_MODE_ARG(&it6505->video_info));
>  }
>
> -static int it6505_drm_dp_link_probe(struct drm_dp_aux *aux,
> -                                   struct it6505_drm_dp_link *link)
> -{
> -       u8 values[3];
> -       int err;
> -
> -       memset(link, 0, sizeof(*link));
> -
> -       err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
> -       if (err < 0)
> -               return err;
> -
> -       link->revision = values[0];
> -       link->rate = drm_dp_bw_code_to_link_rate(values[1]);
> -       link->num_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
> -
> -       if (values[2] & DP_ENHANCED_FRAME_CAP)
> -               link->capabilities = DP_ENHANCED_FRAME_CAP;
> -
> -       return 0;
> -}
> -
>  static int it6505_drm_dp_link_set_power(struct drm_dp_aux *aux,
>                                         struct it6505_drm_dp_link *link,
>                                         u8 mode)
> @@ -1456,11 +1434,19 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
>         int bcaps;
>
>         if (it6505->dpcd[0] == 0) {
> -               it6505_aux_on(it6505);
> -               it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
> -                               ARRAY_SIZE(it6505->dpcd));
> +               dev_err(dev, "DPCD is not initialized");
> +               return;
>         }
>
> +       memset(link, 0, sizeof(*link));
> +
> +       link->revision = it6505->dpcd[0];
> +       link->rate = drm_dp_bw_code_to_link_rate(it6505->dpcd[1]);
> +       link->num_lanes = it6505->dpcd[2] & DP_MAX_LANE_COUNT_MASK;
> +
> +       if (it6505->dpcd[2] & DP_ENHANCED_FRAME_CAP)
> +               link->capabilities = DP_ENHANCED_FRAME_CAP;
> +
>         DRM_DEV_DEBUG_DRIVER(dev, "DPCD Rev.: %d.%d",
>                              link->revision >> 4, link->revision & 0x0F);
>
> @@ -2323,19 +2309,32 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
>  static void it6505_irq_hpd(struct it6505 *it6505)
>  {
>         struct device *dev = &it6505->client->dev;
> +       int dp_sink_count;
>
>         it6505->hpd_state = it6505_get_sink_hpd_status(it6505);
>         DRM_DEV_DEBUG_DRIVER(dev, "hpd change interrupt, change to %s",
>                              it6505->hpd_state ? "high" : "low");
>
> -       if (it6505->bridge.dev)
> -               drm_helper_hpd_irq_event(it6505->bridge.dev);
> -       DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
> -                            it6505->sink_count);
> -
>         if (it6505->hpd_state) {
>                 wait_for_completion_timeout(&it6505->wait_edid_complete,
>                                             msecs_to_jiffies(6000));
> +               it6505_aux_on(it6505);
> +               if (it6505->dpcd[0] == 0) {
> +                       it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
> +                                       ARRAY_SIZE(it6505->dpcd));
> +                       it6505_variable_config(it6505);
> +                       it6505_parse_link_capabilities(it6505);
> +               }
> +               it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> +
> +               it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> +                                            DP_SET_POWER_D0);
> +               dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
> +               it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
> +
> +               DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
> +                                    it6505->sink_count);
> +
>                 it6505_lane_termination_on(it6505);
>                 it6505_lane_power_on(it6505);
>
> @@ -2363,6 +2362,9 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>                 it6505_lane_off(it6505);
>                 it6505_link_reset_step_train(it6505);
>         }
> +
> +       if (it6505->bridge.dev)
> +               drm_helper_hpd_irq_event(it6505->bridge.dev);
>  }
>
>  static void it6505_irq_hpd_irq(struct it6505 *it6505)
> @@ -2625,26 +2627,14 @@ static enum drm_connector_status it6505_detect(struct it6505 *it6505)
>                 goto unlock;
>
>         if (it6505->enable_drv_hold) {
> -               status = it6505_get_sink_hpd_status(it6505) ?
> -                                       connector_status_connected :
> -                                       connector_status_disconnected;
> +               status = it6505->hpd_state ? connector_status_connected :
> +                                            connector_status_disconnected;
>                 goto unlock;
>         }
>
> -       if (it6505_get_sink_hpd_status(it6505)) {
> -               it6505_aux_on(it6505);
> -               it6505_drm_dp_link_probe(&it6505->aux, &it6505->link);
> +       if (it6505->hpd_state) {
>                 it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>                                              DP_SET_POWER_D0);
> -               it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -
> -               if (it6505->dpcd[0] == 0) {
> -                       it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
> -                                       ARRAY_SIZE(it6505->dpcd));
> -                       it6505_variable_config(it6505);
> -                       it6505_parse_link_capabilities(it6505);
> -               }
> -
>                 dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
>                 it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
>                 DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count:%d branch:%d",
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
