Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE46609C10
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 10:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1010E2CB;
	Mon, 24 Oct 2022 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8F10E325
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:07:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a5so15116697edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bJyKcXirmoJHw04J67wvkLB1zRITu1b/Yf9TAcTCa00=;
 b=q/C+ZzlNYEf+623922EqBJSjLs5+oESif0J1/ZbzPMo6jck0mxCmuwOqLatGixRbf5
 CHplhHPSRJIVV+6sfQIpO5P7wlPhPkoGNxcLWLeVK1o8XZd5hWd9YGgvex3vu9WKchvO
 9pqE1s/mtvo6oAqD54hHtip7WTic/4jSzPqlu6gidAsYxon5ge+nYg9mfyfgMcdymzLr
 TqMUdDEsrK47YujQ5QeuPsHVfyaeNMC6ygKRvlL3uOIzXt2xkSezcIgzEn24T4wt7aY3
 HnjDKwJVXzPuPgfACQoc4h1GeFxNrduCCkR13ruSbhtbuzU9O1LrUUfA8JNWch6UUZMD
 QGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJyKcXirmoJHw04J67wvkLB1zRITu1b/Yf9TAcTCa00=;
 b=qsYXcqD3GsZv0gq1053NsCwkwrFHnol6yZDjRicmTIN6Hy4ns8Vc5a+g2HXiZE1yoH
 zMs3zHZrR3KsPGKlWS40h4YDHKeflZTr2qeHlabr7/ytNc0fxktVFwNJzR/IaiHRbbru
 iRcACouSWv9pXzcmFdvAC3eSzFwq288TFlng8mHwqbSmiPaKfo6F20JxI1adrp1/cHLX
 AAzq+xh0dREkGvvEDVSoA7HnWQS7bLLJ2sYxU0+zKdyN+cOZK43t1rhX2aLhkHA60RgV
 fEVssdN1LTIRdKRFyOB+1QbhhGhfissxVjbQASy+n96dUSSP9ZwfUuyjOyF5nX1gQzwr
 hVbw==
X-Gm-Message-State: ACrzQf1rkGtlmzqEJiY6iZDYk/JLpq+7PGXRt/Nl/Jtfs4RMfa9Az4nN
 I8Q+nDYpsuWoFgU6b4TWuHcVwmjzoeGyefKjwOk4HA==
X-Google-Smtp-Source: AMsMyM5FOZfIhyX3k0OFsulBbrJ2OmOnll7BloxuDQAQqp73e/PkTjOKcE9T8rfsh7ftAaDYyMdjZUqrVX1Z58X4RFU=
X-Received: by 2002:a05:6402:2402:b0:45c:a1ce:94d8 with SMTP id
 t2-20020a056402240200b0045ca1ce94d8mr28808767eda.50.1666598854484; Mon, 24
 Oct 2022 01:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221013110411.1674359-1-treapking@chromium.org>
 <20221013110411.1674359-4-treapking@chromium.org>
In-Reply-To: <20221013110411.1674359-4-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 10:07:23 +0200
Message-ID: <CAG3jFytZ9cqNZLXfegtW=AO=3NAKiVCmSpAwmf1H4u60xo50CQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: it6505: Improve synchronization
 between extcon subsystem
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
> Originally, the it6505 relies on a short sleep in the IRQ handler and a
> long sleep to make sure it6505->lane_swap and it6505->lane_count is
> configured in it6505_extcon_work and it6505_detect, respectively.
>
> Use completion and additional DPCD read to remove the unnecessary waits,
> and use a different lock for it6505_extcon_work and the threaded IRQ
> handler because they no longer need to run exclusively.
>
> The wait time of the completion is usually less than 10ms in local
> experiments, but leave it larger here just in case.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> Changes in v2:
> - Add the empty line back
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 4b6061272599..0de44c651c60 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -412,6 +412,7 @@ struct it6505 {
>          * Mutex protects extcon and interrupt functions from interfering
>          * each other.
>          */
> +       struct mutex irq_lock;
>         struct mutex extcon_lock;
>         struct mutex mode_lock; /* used to bridge_detect */
>         struct mutex aux_lock; /* used to aux data transfers */
> @@ -440,7 +441,7 @@ struct it6505 {
>         enum hdcp_state hdcp_status;
>         struct delayed_work hdcp_work;
>         struct work_struct hdcp_wait_ksv_list;
> -       struct completion wait_edid_complete;
> +       struct completion extcon_completion;
>         u8 auto_train_retry;
>         bool hdcp_desired;
>         bool is_repeater;
> @@ -2316,8 +2317,8 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>                              it6505->hpd_state ? "high" : "low");
>
>         if (it6505->hpd_state) {
> -               wait_for_completion_timeout(&it6505->wait_edid_complete,
> -                                           msecs_to_jiffies(6000));
> +               wait_for_completion_timeout(&it6505->extcon_completion,
> +                                           msecs_to_jiffies(1000));
>                 it6505_aux_on(it6505);
>                 if (it6505->dpcd[0] == 0) {
>                         it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
> @@ -2493,8 +2494,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>         };
>         int int_status[3], i;
>
> -       msleep(100);
> -       mutex_lock(&it6505->extcon_lock);
> +       mutex_lock(&it6505->irq_lock);
>
>         if (it6505->enable_drv_hold || !it6505->powered)
>                 goto unlock;
> @@ -2524,7 +2524,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>         }
>
>  unlock:
> -       mutex_unlock(&it6505->extcon_lock);
> +       mutex_unlock(&it6505->irq_lock);
>
>         return IRQ_HANDLED;
>  }
> @@ -2701,9 +2701,12 @@ static void it6505_extcon_work(struct work_struct *work)
>                  */
>                 if (ret)
>                         it6505_poweron(it6505);
> +
> +               complete_all(&it6505->extcon_completion);
>         } else {
>                 DRM_DEV_DEBUG_DRIVER(dev, "start to power off");
>                 pm_runtime_put_sync(dev);
> +               reinit_completion(&it6505->extcon_completion);
>
>                 drm_helper_hpd_irq_event(it6505->bridge.dev);
>                 memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
> @@ -3274,6 +3277,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
>         if (!it6505)
>                 return -ENOMEM;
>
> +       mutex_init(&it6505->irq_lock);
>         mutex_init(&it6505->extcon_lock);
>         mutex_init(&it6505->mode_lock);
>         mutex_init(&it6505->aux_lock);
> @@ -3329,7 +3333,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
>         INIT_WORK(&it6505->link_works, it6505_link_training_work);
>         INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
>         INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
> -       init_completion(&it6505->wait_edid_complete);
> +       init_completion(&it6505->extcon_completion);
>         memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
>         it6505->powered = false;
>         it6505->enable_drv_hold = DEFAULT_DRV_HOLD;
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
