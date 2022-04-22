Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E150B56F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE1410E8FA;
	Fri, 22 Apr 2022 10:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E5310E427
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:42:23 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ec0bb4b715so80968327b3.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sP8JvrZInBak3AnrSA3yrnJGI9uRamz0KMh5AUQsofQ=;
 b=mxaV6FRRNknnsY7+E9ykC3IUZCerphaQNqbeakR5XX75pUdnHgcJJUsRJ3aXY80yJ9
 HktNrl7JztZV1ZWvWCc1if3I9Ost6qcIY13XFooCfXXscYXOh122ddiLA9zXubk6clOK
 Pmlpju9qsubHxSspDtaLqWbNUAVKqYnqX0P0h9eEiLyxBKvOeIEL9txSEe6wKokO3Xcx
 ZseIJJFtqjjxN4me2HSBYwtgVXmW4BszQiTWFy6eb9aoZFhLzZZCnUWrVso2JZ4LixRr
 ujKw/Jfyw6S0id3WlCZ+Fxy1DYCS/YjBsPgfaS7+Js25+QrYAZem9tlZZ8MtG7MuhcPM
 fEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sP8JvrZInBak3AnrSA3yrnJGI9uRamz0KMh5AUQsofQ=;
 b=dFSSeg8XJEpIV5N817tyBYSkCZ5ut7p92i+WImu9sWndRhpwGV2WM35H6te6Uc9i5B
 bQUKT9zXTa6a6zV4CZ9Bq4ZKlMUatFZpBmsL49O1TRra8+YWSoUmHG7K1gnfVBWvyQpd
 UvnUrI3j+EFxR6n0W4aCzAqB/j2nrSxNuTaSFA21GJxe/7/mPC4k5s9hY4xFO6YUe+fr
 4AXOKhsXGznzc7LzvCfqf/KFgzuY6YRJPLuvrDCBG38zaredHgLgjIEIzhm/g/p5gPN1
 Q3ggJxGCwHYLzHUkFcvRobJ3KPwi11J4LqSaVJ4P0GdoPKHejDGkeuo/FbHYsv2IFqmW
 M4bA==
X-Gm-Message-State: AOAM530/sv7pA9A9KfaxXcdN3bDN/egseYLGDzvaj/Jg/QUDPbH3zq+K
 l2anNECfY4rlUUZ+OXvjFC43QlpBUHA1eQwLYGR1Cg==
X-Google-Smtp-Source: ABdhPJz2tiFNiuWE0RHaKofgV7Ha+x3z1t8YOpPiDzl8uQ8X2u6bN2PirRLEPFpKZHLnbUVDQq7E3Ml0rr2qadl/3mE=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr3926695ywa.101.1650624142869; Fri, 22
 Apr 2022 03:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 13:42:12 +0300
Message-ID: <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix error check return value of
 irq_of_parse_and_map()
To: cgel.zte@gmail.com
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_mkrishn@quicinc.com, vulab@iscas.ac.cn,
 sean@poorly.run, Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 11:52, <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3b92372e7bdf..1fb1ed9e95d9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -570,7 +570,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>         }
>
>         irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -       if (irq < 0) {
> +       if (!irq) {
>                 ret = irq;
>                 DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
>                 goto fail;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
