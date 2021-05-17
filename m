Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F793827AC
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3AE6E906;
	Mon, 17 May 2021 09:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809CF6E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 09:01:24 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 10so4504584pfl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OkKHJwSRtsD1XoVSI9D7062oV0S6RC6cgh0CBzJGxQ=;
 b=wurd6Th2hC0CtygbnWfpzXlmQIro6bMhdR7DCsDpr4cXF8QvJWfU2H7SuFcfuyl/on
 xtOSzL9mRf6Qpm+/yH9LQawbpjRtEIfDuKPownnp0Bixi4DHYm0Cv4Ovg/7BeVIjwGte
 Vgvdu50DNIgJdrMFWpziD3ZSowR3zWxzQazg7uoQJt6bE8+uPeOEhd7o2h/HBsYbh8lU
 hlikFoTOsIDijq4sx06mXFj7NwWE6z4lsmpAtBJraB2mLA7f3Dcuke8KR7G53Vp1OhUK
 kMKP77uZj4QYkMbZjh+ysYt/FSCyNPtmGQ0qYnuNvshMWQykCTz+CBHahzQff7YY7bCB
 17QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OkKHJwSRtsD1XoVSI9D7062oV0S6RC6cgh0CBzJGxQ=;
 b=N432oDW5hcdz+yZ0bxPKjWxiGBUT4znTC06bzS3Td+WfFWqZ+qATd0ZEwNu7IMFp1n
 frQOvzQaTWEE0VnbeFf0eMGzODV82/FrPCiMao+hHxQb1P25Ya7Uljg6QJX8eOSdX/RD
 1cqevbJMP3N8DCzgE2NMsmGsEPQ0CO2ABX6O4+GZTYQgAlvlndLAZZBJe80DRRdEkAxp
 HaSZGlcUTvIBYpDJkeyCBnrHbxyd3uT78ZvU6uTDfqI3eSzKebfsNcw1G6i3bvPjoTJa
 SJcIsH4ZMR1SwWx3REvG8Pi4md97gQ7NlBVQzoqcRL7zUUIEBC4d+y2E6Qb4MiIFbLuC
 qAdQ==
X-Gm-Message-State: AOAM531d3zI+7NOav+Prwy1AtuevGlGO27jpzy9zoQFMf2dB5xRSADmA
 TPd2KNDONhAfqEtKBkTExowcBoSSvDKc+3Idpafl6w==
X-Google-Smtp-Source: ABdhPJyp+18LHyzRAiO7+sc3FHiRgXNmFI/UTNc7tUNrDDRlUREycMbppyLtZcKvXSr6KiyqKSsBhvaEt7CAlg7Cf0M=
X-Received: by 2002:a63:4e01:: with SMTP id c1mr46758645pgb.265.1621242084104; 
 Mon, 17 May 2021 02:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210514070306.606-1-linqiheng@huawei.com>
In-Reply-To: <20210514070306.606-1-linqiheng@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 May 2021 11:01:13 +0200
Message-ID: <CAG3jFytWqa9CwPto4Q1b5wZvHkviLgtY_pqYWyVCa5Trx0otwg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix wrong pointer passed to PTR_ERR()
To: Qiheng Lin <linqiheng@huawei.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Phong LE <ple@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Qiheng,

Thanks for submitting this bugfix.

The title of this patch should probably be:
drm: bridge: it66121: fix wrong pointer passed to PTR_ERR()

With this fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Fri, 14 May 2021 at 09:03, Qiheng Lin <linqiheng@huawei.com> wrote:
>
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index d8a60691fd32..6980c9801d0d 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
>         ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
>         if (IS_ERR(ctx->regmap)) {
>                 ite66121_power_off(ctx);
> -               return PTR_ERR(ctx);
> +               return PTR_ERR(ctx->regmap);
>         }
>
>         regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>
