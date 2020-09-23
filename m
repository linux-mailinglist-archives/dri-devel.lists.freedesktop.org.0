Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE71275293
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFF56E455;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B780689FE3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 06:34:32 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id j11so26242321ejk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJXfV81t/sXYl4JgftuDRtEbB8599Smh1I+VQSzWSeE=;
 b=Qt4u0jAOa3Xtg8NwEC6733GHoTotQMbK+cv3/dl/9k9bmkFORy7UNm2RRRuEt3fUDp
 mpEQo7f9MlB3ipYPGQCtiEFuRB5Z100GHmmKLQxZH5b78903jGBatxea2H81tGXJ/2JQ
 lsag7Ig3ErS1ZZMLOiM0dVIERN6W+X3mn3tvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJXfV81t/sXYl4JgftuDRtEbB8599Smh1I+VQSzWSeE=;
 b=Fg1GsGTkD1OdoLo26Rg6XDPDIdfxoK4+zK4m1XkzwulHNGrWOPvBucpFA74N1kK8RH
 YIHUHvkrKl4WWCsDh1ypIDoDse3lhm6+zYc8C/Z7wPZuBEH/cliXobEHKnOWyyBv6WqJ
 K/6jE+oKfL1dUrxNfo877Nu6/ycQKpHeS/d17RgvOT6Lsm7btukFxrsNfzasn5s6qgDl
 U+/YtjXhBneofPmlSbnRJpyPr865lgVv/li8hQ5BfJzilhCZvxlPvld5bEg4p7j5Q4J0
 b2hsTjh5bS7vJT+1n4gzG0WeFwWTCvzUGvHUPWqwR35mWbfxtnuZnnHaajdbfL8YqBA0
 JKdw==
X-Gm-Message-State: AOAM532tm2n7fHsQBbu/RqrE0VtJvLm0tHBOcP/TvqquwIDvdrcfdsm1
 Se8Z4Op3m2Q9yrX7x9q4q2hXOwsOy8dPmTCRIR+BoA==
X-Google-Smtp-Source: ABdhPJxVp0i9LV/h1/bBJ7dAOqBc+Foo/bYGPSvrZYzkvDkdDb8Y/5tW5bGvpIFjzyKvdVgsVvpISbgglQCSu2pQ6Yg=
X-Received: by 2002:a17:906:4c81:: with SMTP id
 q1mr8550168eju.72.1600842871347; 
 Tue, 22 Sep 2020 23:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200904021029.365700-1-allen.chen@ite.com.tw>
In-Reply-To: <20200904021029.365700-1-allen.chen@ite.com.tw>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Wed, 23 Sep 2020 14:33:55 +0800
Message-ID: <CANdKZ0erkp_S-K_QpH-9dvEDR9THypLxTT3s+0aZQUaNDoZM-w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 kernel test robot <lkp@intel.com>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 4, 2020 at 10:17 AM allen <allen.chen@ite.com.tw> wrote:
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> From: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |    7 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6505.c | 3338 +++++++++++++++++++++++++++
>  3 files changed, 3346 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 3e11af4e9f63e..f21dce3fabeb9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -61,6 +61,13 @@ config DRM_LONTIUM_LT9611
>           HDMI signals
>           Please say Y if you have such hardware.
>
> +config DRM_ITE_IT6505
> +       tristate "ITE IT6505 DisplayPort bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         ITE IT6505 DisplayPort bridge chip driver.
> +
>  config DRM_LVDS_CODEC
>         tristate "Transparent LVDS encoders and decoders support"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c589a6a7cbe1d..8a118fd901ad7 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> +obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> new file mode 100644
> index 0000000000000..0ed19673431ee
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> ...
> +
> +static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
> +{
> +       struct it6505 *it6505 = container_of(work, struct it6505,
> +                                            delayed_audio.work);
> +
> +       DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
> +
> +       if (!it6505->powered)
> +               return;
> +
> +       if (!it6505->enable_drv_hold)
> +               it6505_enable_audio(it6505);
> +}
> +
> +static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
> +                                       struct hdmi_codec_params *params)
> +{
> +       struct device *dev = &it6505->client->dev;
> +       int i = 0;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "%s %d Hz, %d bit, %d channels\n", __func__,
> +                            params->sample_rate, params->sample_width,
> +                            params->cea.channels);
> +
> +       if (!it6505->bridge.encoder)
> +               return -ENODEV;
> +
> +       if (params->cea.channels <= 1 || params->cea.channels > 8) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
> +                                    it6505->audio.channel_count);
> +               return -EINVAL;
> +       }
> +
> +       it6505->audio.channel_count = params->cea.channels;
> +
> +       while (i < ARRAY_SIZE(audio_sample_rate_map) &&
> +              params->sample_rate !=
> +                      audio_sample_rate_map[i].sample_rate_value) {
> +               i++;
> +       }
> +       if (i == ARRAY_SIZE(audio_sample_rate_map)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d Hz not support",
> +                                    params->sample_rate);
> +               return -EINVAL;
> +       }
> +       it6505->audio.sample_rate = audio_sample_rate_map[i].rate;
> +
> +       switch (params->sample_width) {
> +       case 16:
> +               it6505->audio.word_length = WORD_LENGTH_16BIT;
> +               break;
> +       case 18:
> +               it6505->audio.word_length = WORD_LENGTH_18BIT;
> +               break;
> +       case 20:
> +               it6505->audio.word_length = WORD_LENGTH_20BIT;
> +               break;
> +       case 24:
> +       case 32:
> +               it6505->audio.word_length = WORD_LENGTH_24BIT;
> +               break;
> +       default:
> +               DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
> +                                    params->sample_width);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
> +{
> +       struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +       if (it6505->powered)
> +               it6505_disable_audio(it6505);
> +}
> +
> +static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
> +                                                      void *data,
> +                                                      hdmi_codec_plugged_cb fn,
> +                                                      struct device *codec_dev)
> +{
> +       struct it6505 *it6505 = data;
> +
> +       it6505->plugged_cb = fn;
> +       it6505->codec_dev = codec_dev;
> +       it6505_plugged_status_to_codec(it6505);
> +
> +       return 0;
> +}

These four functions about audio seem to be unused. Move them (and
other audio related changes) into another patch.

> +
> ...
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
