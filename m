Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86692538DE4
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 11:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE2510F3EB;
	Tue, 31 May 2022 09:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5635510F3EB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 09:39:50 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id i11so22911161ybq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=owik/ERIKQ/Xn0y08fcg1q8jOY8cbMmZRyuaUyU18sA=;
 b=lQQ96cMxOA4G9iVLjQ4z6e2m7ZJQpJFgBxCrdGn/ioTtmBrwPLWuH5n8fDoP8/GAlq
 WrFsT2wBmih+5WcNUVwYVfUuC3xdE/uwnVd7D9zQybSFIJu8Yn+KkYCM9mOfy5e2WHit
 7YyYNk6XvJpPs7ZcV/IJHCWxPpXQ+vP7mBOAe8jIu6TneEQW0ha6Z4LKRQ0dSXpWZPno
 Sx42g/lk+HqSaAAeF9geGAOlGAA/i8HoBxIUZH9O37RvveMM9nozLDC4p8bMfbS1+8Is
 ILFHFv1n18ekK70DyNN4VL8spINVIQ/A4NZWL+0C49tdaEDoVVkpOznurGQzq4Wzgr93
 11bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=owik/ERIKQ/Xn0y08fcg1q8jOY8cbMmZRyuaUyU18sA=;
 b=cF1XLV5cPSsc4Dcws3eNWTpe5gaa5uM6SDjBGst1r2VFhkk2+abWrWNr195d2gSFZE
 6Y5cJE2jJ52AAWINu0bpLbBplKmXvEVJRy4rLQcBKwB5bgzJHcAsQe1oqz85orAYPhkL
 XRopr/6GV3ZA0CHx3B88D4Jv1x6iZkPifLQH0Xn2KhWrN+ZV4ZfdKdxk+t5jkB8FRqfM
 duK3cPqR0n9JfxFiLEQteA4Wt4roXi7s6MvScvF9FCpnsPXoQySisL+erKw7DAZznXYW
 hf15HkWKnEtu2yjGRaUi0aY66BTedf7tprPDEpm18U08z8RForbNMbE53rYLw3IXiv1m
 REZQ==
X-Gm-Message-State: AOAM532PKDSQqvrZi3bNm31wa0CAoO7FjabNTfzTEhPbvlTM6oOQYg8l
 yYYf/fSIxT0KuGP3w7pPVrOboLVaDJiHseN5NikuCQ==
X-Google-Smtp-Source: ABdhPJzJ5ytNhC9HvdgLcAnnUu0XWT4XYNnYlfIbRfnZZFTub5PI7q+eBt5ywXskTbAQnXYM+BDjueQa7AkpkbKiHvQ=
X-Received: by 2002:a25:df50:0:b0:65c:e053:3449 with SMTP id
 w77-20020a25df50000000b0065ce0533449mr9534101ybg.291.1653989989529; Tue, 31
 May 2022 02:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220530160753.100892-1-jo@jsfamily.in>
 <BY5PR02MB7009301398881E89033F1DF0D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009301398881E89033F1DF0D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 May 2022 11:39:38 +0200
Message-ID: <CACRpkdZO6yB4SZzMgORv=1LCxbiaabfv=UyOQksn6F_WxgGa=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel: introduce ebbg,ft8719 panel
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joel,

On Mon, May 30, 2022 at 6:08 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> +#define dsi_dcs_write_seq(dsi, cmd, seq...) do {                               \

Please name it mipi_dsi_dcs_write_seq() and...

> +               static const u8 d[] = { cmd, seq };                             \
> +               struct device *dev = &dsi->dev; \
> +               int ret;                                                \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> +               if (ret < 0) {                                          \
> +                       dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
> +                       return ret;                                             \
> +               }                                               \
> +       } while (0)

My suggestion was to add this macro to include/drm/drm_mipi_dsi.h, just patch it
in there under the other mipi_dsi_dcs_* functions.

I think a few other drivers could make good use of this macro.

Yours,
Linus Walleij
