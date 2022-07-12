Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06C57140A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935209333B;
	Tue, 12 Jul 2022 08:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFED9333E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:11:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id oy13so8061808ejb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BAblE0VfQqsX2FhEhlmNF0MI2SNQOD6qrUOnSLVyV4g=;
 b=ivBDfg89ttyBXF2y7cPm4jaQbb5003PCxWgf/aXnVIOQ9lzVlgUx8hxJcF0Y2lofFb
 IoYC1WixKj5jb1Qtb5pnd5zf5XWP8aX8nB0+EeB8+a3Em//uQzGCekpcVs1xfW6bIspz
 LbuOl2j+9jaUiWi/OLV1vPeyr7bpMr7ddoEiXMjOQi93z872tZSI+oqqd4xW+Ni/9aMj
 wDM3OZJel9JhH32s2ZyzmLkBH/hq0oCXYiGi0ZvfOXsMUOy7TNssIHWM0E6oPYr4BOmP
 v6q49mCdkkhPd22DO+bkd6S5JHJ2hVqf2rT7ALMj4Qsn6V3ATUhsTs05bwWkW2peG7s6
 +CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BAblE0VfQqsX2FhEhlmNF0MI2SNQOD6qrUOnSLVyV4g=;
 b=XaOCBhsxf4TyiZcaQx6esNOTkpqFN2MF6K6xfERKVakA8NxENvX1S2uL5tdB1ZX4Vu
 l2+R2Mc+p6/n011IihRyhsFC9PWMZ8gIcmXdSkUjtjLQ0/R6UiX09sBr51YEbZ97hmky
 Gq9X/FsRahlfmsjrwWk81y3HrmWeEcavolAMiliA6qMB9YycCSQftYG6QuKXnWEB9HZ1
 dE2xMGBCGiI/GTS3nnx33V51WLz196Il4AwKyV/6TVI9h8Vu26yt9mcYJBrl4sXfGNMb
 vCMGXXwzECIaAr98Dfa9IZ0wkI30PePWXTzPZvO4MZSw0lEGTtXmz4g7k3KKTQGFpxL4
 OSpA==
X-Gm-Message-State: AJIora9R5Pn88M2xuZrIKKYnRLfiV9P5R7c12GH8jp9OSZoMWtc/9oqU
 ZGpieVklsyhh5kyhjbI6n66J1X1efJfO1KAJQ880Ug==
X-Google-Smtp-Source: AGRyM1st+UXUXVEvgt9xRYT2K1rCAEH/fZJxbA0Cs3nrka+3T4iORaEJGfNcv/HymDNnr2RLU0RJCvmYznMipIPgX5s=
X-Received: by 2002:a17:907:7b87:b0:726:c868:cf38 with SMTP id
 ne7-20020a1709077b8700b00726c868cf38mr22365650ejc.580.1657613487777; Tue, 12
 Jul 2022 01:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-3-allen.chen@ite.com.tw>
In-Reply-To: <20220707080600.49041-3-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 12 Jul 2022 10:11:16 +0200
Message-ID: <CAG3jFyuz-9fDXXziRzZBhGQ2NC3R2nFW=aeimghTZXGCraPbuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: it6505: Add i2c api power on check
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
>
> From: allen chen <allen.chen@ite.com.tw>
>
> Use i2c bus to read/write when it6505 power off will occure i2c error.

^^^ typ-o
Change occure to occur.

This is an issue that would have been caught by running checkpatch
--strict, please try to run it on all patches before submission.

> Add this check will prevent i2c error when it6505 power off.
>
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>
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

With that fixed:
Reviewed-by: Robert Foss <robert.foss@linaro.org>
