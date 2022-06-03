Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042FB53D375
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 00:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC77113589;
	Fri,  3 Jun 2022 22:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D570113266
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 22:03:54 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v106so16102455ybi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jd93PkL+Qw1fhkDXP6mqsI96OC1Y6znysjyGQstvSpw=;
 b=QcSjJ0fKpBx9wmlN43qTWPHjGeaWrwjTmVu3r29kEN5DlMFBCEgDs+d3j1WRqQ+wCG
 4yePdAc5kwY/Wn8dDZj/UlGeaf8zpcUpv8YJswuTY55j+2EXmEQph3mw4MCI2jXw4Nnu
 03kLw4i5PMFTn9ZJ/jkb2+ntFap2VGkzmNlP7DOkFpW1Wzfujf07FMIsSkp/dEn6BxEg
 YPo5y0RXm/voY+Bpz3+SPcFD5gC0Sol43yDtFv2KwL8MH6AxnDzAKo83LmeRigtf8yda
 mqoKls3FJ73AgBsBl3GY5ndk9kkwshcdXjsCDUoS4nC4rAW8w/usc3ht9k/b0Q/kMS0i
 seDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jd93PkL+Qw1fhkDXP6mqsI96OC1Y6znysjyGQstvSpw=;
 b=UAf2VMLrgClNjxebsd1klL47YlrKC23J/lqGaeWHgGzS9BlpcY2EASsgZW7bV+ZAj1
 oJyTB4BMHTXWdTmGmclKjHkb1pgKSrTunWBCEzSrrEjqowjLQwLefirx+/kdm2HP8jYk
 NFpEAgsQEQnYJa4f2Vl5E2ZMBqCNrgbfj8dcR0vAlXgDtaJ6FGHb+QUUb786FCnW61wy
 zDiD1UwiQrHhopDnImAqOLphknIMbJYQDPsTAnj9GQ1shBUaOVzmxInl7K5u95WAwIO3
 LVR0RQ6SnjKKrtnDgrDtA2VwK6IVym1Xt9tbzH3qO2ZbW2GXriiOL9vfdzt10TGVk++W
 ZB6g==
X-Gm-Message-State: AOAM533p9nYJBi8Tcrx66O51JckhTr3NYAbt2MQyrbhjCIRipoFKVWVn
 toeW5OnJr4urGobBzjfiC3/M25Ometoefpu7bEILuA==
X-Google-Smtp-Source: ABdhPJxXJ41+KeG6CWK+9/3U+HnNOWN/7rSJmXAhK3mSPBw+reVg9osrsnA5D1icZH5FxPdwOCtuJzhZ9tGvViA79wY=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr12835690ybs.626.1654293833687; Fri, 03
 Jun 2022 15:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220601082410.55266-1-jo@jsfamily.in>
 <BY5PR02MB7009B6FA7F17A3DA36DDA44CD9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009B6FA7F17A3DA36DDA44CD9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 4 Jun 2022 00:03:41 +0200
Message-ID: <CACRpkdaZsnB3XgBen4Ws6jTrQztsdgiafEanjHakSj+T6DFpng@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/panel: introduce ebbg,ft8719 panel
To: Joel Selvaraj <jo@jsfamily.in>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 10:24 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working out my suggestions!

Yours,
Linus Walleij
