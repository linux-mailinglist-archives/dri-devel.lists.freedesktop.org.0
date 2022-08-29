Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820E5A4F1C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474A410F1DF;
	Mon, 29 Aug 2022 14:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8410F1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:25:47 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w19so16039898ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=l/Yc+Efm+jAH2bHIU6WTgN3herS8kuZyRKDMWpjdJxo=;
 b=QOHsGZIytKO7SnZQmz6nn/31c4K3mQhuufa491ZPVia94uv2PjPKOGu9DNBgUzACiD
 dfpEZPYH6sFS55eZlNkoWMB0G84SxSURdQwSMuEDE+xN67trAzrxaEkqQeF6frXk6pIq
 57Zhz35/vzQcPodZcB8jsodJe28XCSwy0jrdkkD8X+5qBRRCfMncSV4nE6nYttvm4kcj
 M12jrdwOiq5tW9VVu1t9FjJBKKw/9VhAwn9YvY8+8tAJPKbxA0ITIowgehApK0NBMHb8
 vW8Nbc9rIuhlQgGs5PqgdxHPkjsQ801o6/c+BlAbRSZQBaOkUztLlKMzgLFWFmCBqWzI
 MQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=l/Yc+Efm+jAH2bHIU6WTgN3herS8kuZyRKDMWpjdJxo=;
 b=bO4yqrBPRKLc2SCjWJV3fes/pQnHswQzQZT3rWVL0uSRRc5IOxgZRK6f2woj/qZWtQ
 ZIbhV19a1HlPZiGfBav6zfCN2SpGPWMKtpKjmCmnjNY3XnCm2ggDwjKAv5hpEL8uWWG2
 HkFQ9dnMoE8lr4QV+7/1LwyGMDCLxjYbWEgZdQUemuBFZF0ximZX/WRjB0eU5qAFJWQj
 9TdzV/KKcEmDuetFc9VMwmoS/CCis0HrD5ATfqbRyqouiRw+4N8DCKyNQA0ezZavcBB7
 68bXrLM/PqP8ysW6N/iubUBubvF3mG0FaUYXd9Z4xO+JpPOybahES3i+xzQOCgw4GsiR
 6mKA==
X-Gm-Message-State: ACgBeo3/7W8AMQT1jDBZ9+8PKml1KtOYixgrjdIeIQp9goWsFUJJ1QkY
 UmxmDJJe0xzHysDDC+HWhteNc3j52ys52LC84X0+tggHPlCUwA==
X-Google-Smtp-Source: AA6agR5pN0biFCTrJh35y0R2O5ORF7VLoMnMkRM6bASxTgcpp25sbN5t9qeEZmRz3ouyzPqimAX1el7Q5rNHYqHB6BQ=
X-Received: by 2002:a17:907:9814:b0:73d:cb9f:c0b8 with SMTP id
 ji20-20020a170907981400b0073dcb9fc0b8mr14000760ejc.648.1661783145482; Mon, 29
 Aug 2022 07:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660934107.git.mazziesaccount@gmail.com>
 <3aacca7d9a0240d95dc3cf103d114b5c85392e71.1660934107.git.mazziesaccount@gmail.com>
In-Reply-To: <3aacca7d9a0240d95dc3cf103d114b5c85392e71.1660934107.git.mazziesaccount@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 16:25:34 +0200
Message-ID: <CAG3jFyvQc4ZxEt8yRtiP6VAnurvfBdWzD7640DRXun+F7vDHog@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] gpu: drm: simplify drivers using
 devm_regulator_*get_enable*()
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matti,

On Fri, 19 Aug 2022 at 21:18, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Simplify drivers using managed "regulator get and enable".
>
> meson:
> Use the devm_regulator_get_enable_optional(). Also drop the seemingly
> unused struct member 'hdmi_supply'.
>
> sii902x:
> Simplify using devm_regulator_bulk_get_enable()
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> ---
> v2 => v3:
> No changes
>
> RFCv1 => v2:
> - Change also sii902x to use devm_regulator_bulk_get_enable()
>
> Please note - this is only compile-tested due to the lack of HW. Careful
> review and testing is _highly_ appreciated.
> ---
>  drivers/gpu/drm/bridge/sii902x.c      | 22 +++-------------------
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>  2 files changed, 6 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 7ab38d734ad6..162f9c87eeb2 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -171,7 +171,6 @@ struct sii902x {
>         struct drm_connector connector;
>         struct gpio_desc *reset_gpio;
>         struct i2c_mux_core *i2cmux;
> -       struct regulator_bulk_data supplies[2];
>         bool sink_is_hdmi;
>         /*
>          * Mutex protects audio and video functions from interfering
> @@ -1072,6 +1071,7 @@ static int sii902x_probe(struct i2c_client *client,
>         struct device *dev = &client->dev;
>         struct device_node *endpoint;
>         struct sii902x *sii902x;
> +       static const char * const supplies[] = {"iovcc", "cvcc12"};
>         int ret;
>
>         ret = i2c_check_functionality(client->adapter,
> @@ -1122,27 +1122,13 @@ static int sii902x_probe(struct i2c_client *client,
>
>         mutex_init(&sii902x->mutex);
>
> -       sii902x->supplies[0].supply = "iovcc";
> -       sii902x->supplies[1].supply = "cvcc12";
> -       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
> -                                     sii902x->supplies);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret = regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
> -                                   sii902x->supplies);
> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplies);
>         if (ret < 0) {
>                 dev_err_probe(dev, ret, "Failed to enable supplies");
>                 return ret;
>         }
>
> -       ret = sii902x_init(sii902x);
> -       if (ret < 0) {
> -               regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
> -                                      sii902x->supplies);
> -       }
> -
> -       return ret;
> +       return sii902x_init(sii902x);
>  }
>
>  static int sii902x_remove(struct i2c_client *client)
> @@ -1152,8 +1138,6 @@ static int sii902x_remove(struct i2c_client *client)
>
>         i2c_mux_del_adapters(sii902x->i2cmux);
>         drm_bridge_remove(&sii902x->bridge);
> -       regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
> -                              sii902x->supplies);
>
>         return 0;
>  }

Ideally this patch would be split into two parts here, due to
maintainership boundaries.

For the sii902x part, please add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>         struct reset_control *hdmitx_apb;
>         struct reset_control *hdmitx_ctrl;
>         struct reset_control *hdmitx_phy;
> -       struct regulator *hdmi_supply;
>         u32 irq_stat;
>         struct dw_hdmi *hdmi;
>         struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>
>  }
>
> -static void meson_disable_regulator(void *data)
> -{
> -       regulator_disable(data);
> -}
> -
>  static void meson_disable_clk(void *data)
>  {
>         clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>         meson_dw_hdmi->data = match;
>         dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>
> -       meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -       if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -               if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               meson_dw_hdmi->hdmi_supply = NULL;
> -       } else {
> -               ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -               ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -                                              meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +       if (ret != -ENODEV)
> +               return ret;
>
>         meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>                                                 "hdmitx_apb");
> --
> 2.37.1
