Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F61526BB4
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 22:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8689510E1FA;
	Fri, 13 May 2022 20:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396D10E1FA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 20:39:57 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id r11so17229564ybg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjgsJyomaG9QQtE3jbFFKe/5rvj6syuow/ZH8n5yvJ4=;
 b=SQoFqGZkR8OJQ0Qk63dN6u8KZ6fGMmX6HLbVWIW46XqaVncbFbTDVP9cdiNDF8Rx/D
 WHT7hM6yG5Ja3/APJFYAliXvVtbW5HdfL+mBQgLhAYE2KGom/m9srR1otUd/jjymzi7N
 enIhThFTnZLdAgcq2IbD5PxYIagJ5EtxK0/v0a5Y/Zw05uI9+cSDpSCoRPue6ht09eni
 yptXjDz3CYCwtP34zBKm5VInN3wkF0uonNI+DuaMzjSTHJSvuJaBWZh/aG+fWtNMlJh9
 doNK7QZ2aOhX3wYSA4XJdgITh3XvxexMRA+Q3rrmOLo10t0QbM42+rpxw87Y/V7qY6Ht
 BdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjgsJyomaG9QQtE3jbFFKe/5rvj6syuow/ZH8n5yvJ4=;
 b=APOFsOjNE937JQ8Qrbi6BClOhjp76tNlmCmloFzPSr9tJ79MVfxA19gkCrU5BH6GAU
 YwXdvXh61aRaNnVmMTfXjVul2cPIphAsj/3HLuiz9drW2uGXrYIZm6ykJggViwQXWc3z
 mGTOhWpy5nipOflsXuIr3Pe4a06a7Os8qRwsqaXO/sEk/jArkTvx6j+XHZxkdppWDfEp
 IyMlqkAEf2FaHlEktXs5w/Qp4RbB53TDzl9wIkLW3A5WMPEuy0NRDg9Tbqk/96m+Q1lg
 b3VZA22vIMu/Ck54MAIbBXAuRLSUbFbIH2fddEVNWkANNIibA6GLQ8ZRuixUnewMYwDh
 4Rzg==
X-Gm-Message-State: AOAM532XZbNRQNycKKk6l4dlmT6apOzy4zBCgxAPjQBilEfKGAK/VH/N
 pOMI38Jf6A2q5kmXGzE8ya4N+Ev+m38IZjRaSen22A==
X-Google-Smtp-Source: ABdhPJxqWNc/BcbrWALPfb9mCeCOCpLqwW04ceOHeKLE9KROovikbSFRNij1NE2lfz4+r3R3/cUkmXIQUrDYhhomyZ8=
X-Received: by 2002:a25:1f85:0:b0:64b:a5fc:e881 with SMTP id
 f127-20020a251f85000000b0064ba5fce881mr3813638ybf.514.1652474396907; Fri, 13
 May 2022 13:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 May 2022 22:39:45 +0200
Message-ID: <CACRpkdbvv6FcdatAPdTq4fmzgXyr-SjYEwuc_sT+152DtqhiUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: introduce ebbg,ft8719 panel
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
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 7:28 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

I see my review comments on v1 arrived after v2.

Nevertheless, please address my review comments on v1.

> +struct ebbg_ft8719 {
> +       struct drm_panel panel;
> +       struct mipi_dsi_device *dsi;
> +
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +
> +       struct gpio_desc *reset_gpio;
> +       bool prepared;

For example that means to drop this prepared member.

Yours,
Linus Walleij
