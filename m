Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ADC57A2F0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 17:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FDB1133D7;
	Tue, 19 Jul 2022 15:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DC01133D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:26:43 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id tk8so16489170ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pY2CMxbe7mYFu8lMmKdq8QyweRoqymfe+8LQesF8uYE=;
 b=fECi+8lG3d2QZQyelZpEsteMq5/Ly7PqyvAXApZORRN6U6VHI/Xd+RT65kVSQlhDfs
 RIifDvE6urMrudmyO/TXET1KzXJlRNUevdgDbV4Gy8PkxHRcCI9979O3Pwkm1ooW1IZl
 9k/2wyz4Y8r9wO9qqWZu5nBeC6mOWJ7ljwgzEKOPo3COpIzVJCP0oPj3c9atpX7OPNZW
 B14tRFln6rYqvb17WBktV6HEXlgQX97UT3VJNDoFJE2QmKONgjh22rmFbr9Ou2oQNlUf
 Q4trtaDSh5fGHLmUMI5/YAHF+CaUk6pM8Ghcb3JO/WsEeYAI131CpfPk9hn8m/fwMvfL
 lesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pY2CMxbe7mYFu8lMmKdq8QyweRoqymfe+8LQesF8uYE=;
 b=NGtcUFiextApjWDcefBnKj1xdZKwH6pHTyUYWUcvkWm1N80cQkkG0F5OAFhKT1zjCB
 zHWHjWF64LhuuVRJ/tKzvpjQPX4q6a79wZ4CP8L9IHQPiZKAjTh/t8eklEw4+55Sp4pi
 qA/67fewaHBkSIFs7u6hj9iecm16ZF1qElwa9njM1JbbeB0BjVZEu82qKlyPJBpGBXjr
 NP71lpocomQsYDTp3hCy/lXrS94wgz+JsBbevUv52z6m662mbbQO7RS0+47vhY5Y54QM
 urigo3PiKjU1/35n3IC0gCAulr4d6kNi6Zlf+mH8ZnnVs+p40iUAreOwfuqmeKvRTgLQ
 lukQ==
X-Gm-Message-State: AJIora/rx7FC/hGSERWbt5+Xe+6ityr9gQ27nESxh2PEQeL4U86LqiXs
 WXHnomLW0NxP4XxoaHLXLb28XffHofVqMzhFyTb7Ug==
X-Google-Smtp-Source: AGRyM1s6y2msksPTZYolBnXWbfyuEFWIjNOwAkx3R6nBSLm9wzLQ6VqBIZlWJeeQ4oXvE+CAxIYjBR203JAhhI/UfDE=
X-Received: by 2002:a17:907:7f9e:b0:72e:d375:431 with SMTP id
 qk30-20020a1709077f9e00b0072ed3750431mr27276672ejc.580.1658244401767; Tue, 19
 Jul 2022 08:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220713031547.11641-1-allen.chen@ite.com.tw>
In-Reply-To: <20220713031547.11641-1-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Jul 2022 17:26:30 +0200
Message-ID: <CAG3jFyvDWXZsSKaztKgbAUOY8DNFb81KvSpG5fQC=t1dUZp8oA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: it6505: Add i2c api power on check
To: allen <allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pin-yen Lin <treapking@google.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jul 2022 at 05:16, allen <allen.chen@ite.com.tw> wrote:
>
> From: allen chen <allen.chen@ite.com.tw>
>
> Use i2c bus to read/write when it6505 power off will occur i2c error.
> Add this check will prevent i2c error when it6505 power off.
>
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index aa5e0aa1af85..cfd2c3275dc5 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -518,6 +518,9 @@ static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
>         int err;
>         struct device *dev = &it6505->client->dev;
>
> +       if (!it6505->powered)
> +               return -ENODEV;
> +
>         err = regmap_read(it6505->regmap, reg_addr, &value);
>         if (err < 0) {
>                 dev_err(dev, "read failed reg[0x%x] err: %d", reg_addr, err);
> @@ -533,6 +536,9 @@ static int it6505_write(struct it6505 *it6505, unsigned int reg_addr,
>         int err;
>         struct device *dev = &it6505->client->dev;
>
> +       if (!it6505->powered)
> +               return -ENODEV;
> +
>         err = regmap_write(it6505->regmap, reg_addr, reg_val);
>
>         if (err < 0) {
> @@ -550,6 +556,9 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
>         int err;
>         struct device *dev = &it6505->client->dev;
>
> +       if (!it6505->powered)
> +               return -ENODEV;
> +
>         err = regmap_update_bits(it6505->regmap, reg, mask, value);
>         if (err < 0) {
>                 dev_err(dev, "write reg[0x%x] = 0x%x mask = 0x%x failed err %d",
> @@ -2553,13 +2562,12 @@ static int it6505_poweron(struct it6505 *it6505)
>                 usleep_range(10000, 20000);
>         }
>
> +       it6505->powered = true;
>         it6505_reset_logic(it6505);
>         it6505_int_mask_enable(it6505);
>         it6505_init(it6505);
>         it6505_lane_off(it6505);
>
> -       it6505->powered = true;
> -
>         return 0;
>  }
>
> --
> 2.25.1
>

This patch no longer applies to the drm-misc-next tree, could you
rebase it and send out a v3?
