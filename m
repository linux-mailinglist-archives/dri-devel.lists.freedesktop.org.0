Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF15EE9CD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 01:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065E10E551;
	Wed, 28 Sep 2022 23:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E7210E551
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 23:00:21 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x92so6008771ede.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 16:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=s/AeP1b5zEqAvzE5YGx/+HM6nWZc6TrGsvW8Uhzh0us=;
 b=XA8z6y1pC43x6UihdQZGisS+v7z7motNNty+zK5I20ibMemoHTmhXVBPDaBolMAzrJ
 8ta21WQ3RLfjP7OO2eu/Tisr9Kdt+h6gFnoAsVu9Sqf8X7rZuFshGaRs8XwaiROadqj5
 HkQDrHYdbAUosj/iOnlR4NPeDmEBqWT7/qQWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=s/AeP1b5zEqAvzE5YGx/+HM6nWZc6TrGsvW8Uhzh0us=;
 b=QkH+2mx2kqJiiGeFShP7HU+KxRULXiDsKwMUF18CXaYvRGFqdkjFR0dsHcE9ofC+kh
 xbCuOsF5tSohb2YtYbpNyoFQP2W9fA0MTwhotTUASxUdXRdWkbUKiXxKbWOk/ePmCm6X
 3g/msbGWIaIunjvIk4urfsLgJ6eLavIf3+By5yBV5OCnfa7BP6gn7T+jbiBOT2Z0nWrn
 4PtqHNfSaNvYOT61YrF5mCnksN7m6rpsALrzvfKCUciU737GDVvd/ydrUlVse/JrTPZQ
 FEra0yNcoY3RnspH9HeIYIG5qANZVlpGeo9koHiulPWb8w7owarduK4XzbiX6o6TlbqZ
 0lkA==
X-Gm-Message-State: ACrzQf2LJE0WCAJehnZ6i7cw1p7shq2uCXpzZ0Ob8LvWw8TnwRudMwFs
 QsKJP6PPd7tZrHVGtYbP5O/VpD80VGsVVZch
X-Google-Smtp-Source: AMsMyM6GFqa0sYgXibeLJghaXAXLncpi3wscAma43twc0qvUd3gMPO4PCrQFMntKjm3h1N064YKO6A==
X-Received: by 2002:a05:6402:254f:b0:452:be91:c0d3 with SMTP id
 l15-20020a056402254f00b00452be91c0d3mr344844edb.314.1664406019127; 
 Wed, 28 Sep 2022 16:00:19 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709064a8300b0078082f95e5csm2953402eju.204.2022.09.28.16.00.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:00:18 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id bq9so21946200wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 16:00:18 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr112105wri.138.1664406017823; Wed, 28 Sep
 2022 16:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220924015616.34293-1-yuancan@huawei.com>
 <20220924015616.34293-3-yuancan@huawei.com>
In-Reply-To: <20220924015616.34293-3-yuancan@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Sep 2022 16:00:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_utBPvQozmZQuwu5eG-aCiRE1EuzOAp1BtH5ZuTWkCg@mail.gmail.com>
Message-ID: <CAD=FV=X_utBPvQozmZQuwu5eG-aCiRE1EuzOAp1BtH5ZuTWkCg@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/panel: panel-edp: Use dev_err_probe() to
 simplify code
To: Yuan Can <yuancan@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 23, 2022 at 6:58 PM Yuan Can <yuancan@huawei.com> wrote:
>
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index c57e8f9e2d47..84557ec19a16 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -403,17 +403,10 @@ static int panel_edp_unprepare(struct drm_panel *panel)
>
>  static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
>  {
> -       int err;
> -
>         p->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> -       if (IS_ERR(p->hpd_gpio)) {
> -               err = PTR_ERR(p->hpd_gpio);
> -
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
> -
> -               return err;
> -       }
> +       if (IS_ERR(p->hpd_gpio))
> +               return dev_err_probe(dev, PTR_ERR(p->hpd_gpio),
> +                                    "failed to get 'hpd' GPIO\n");

This is a fine improvement but I'm a bit curious why you only fixed
one of the two cases? You could do the same thing for the "enable"
GPIO in panel_edp_probe().

-Doug
