Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E8737737
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 00:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CE010E073;
	Tue, 20 Jun 2023 22:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACBF10E073
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 22:09:01 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-bc492cb6475so4169558276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687298940; x=1689890940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=40ashM7QCz3gwZUoj/FyZIUZ5ZCVSYhkseljdOGvbCQ=;
 b=urwqynTgfHa/j0VvI8TRtIZZwGjV4n8bV0JLN6rYwM5+YTHeo3gYxy8m/zvPprY9SR
 MVuRmCC5U2r60ixumIXSTURRY5jCQBtk2WSCVfMosUBx5hw1bniJugrS9Xny906yY6/X
 4OzeZekIKRV0AHjSa4FCukY+fGnaN+P5tqtdFsT2C6+UI2hC9XQEirWdbtAyJ5QK/WO4
 IKp5OPgeOKhHN+PdENcQn1FBvdCopj1O/I5ku+5+ZFVZOhqsVxI13EE9umimcB99rume
 x4iKqh66yzsAig3ajrvkAbJjvZtsXKY3RnyyB9WAaxF2Lvf7/vt0rGRKIlJUy9tdvbVf
 3HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687298940; x=1689890940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40ashM7QCz3gwZUoj/FyZIUZ5ZCVSYhkseljdOGvbCQ=;
 b=kt88ePtczI4NXS7lbCq3HmUB/Br6MLK0pZGrM/VQe1kK/0lU2yNz4f/9ZvKdQK5WXh
 OGNxuHYReP1SQQEfGn9ouYRF/TND2BG9Z61p+io1Y0zWIekh1JwU09Fn+OU3OHkYVo7m
 7a0Z7XaGhYb4tfLmPtIN/Vwuufo9a1+fEn18iyaWd1TorfdqfPjDUF65vYXgDuGD0vlN
 15sx1ObOVbBavRGGM+0vaqZ9eVfIkr7mkje3UykiJKEOZ2MRl+BjGnX9LLmX9iKJsA75
 UROgyuAa2A6fwDVaoAS444qlb06FB0PuNJN3ZuBvoDXLb5MJKVghiWaWKATtA5ct7Ftc
 hkJg==
X-Gm-Message-State: AC+VfDyDbhq+lNxpSwIQEvA6Zp/MAhf+k9gRRWadSjHBUbKvxd4SHts3
 RIvrTBLuRhkyaaYlYj2U+BIxwFeyHhd6H/J7T5FECA==
X-Google-Smtp-Source: ACHHUZ7hiviRre67u8utItlrZZSzBQ8DlhTSUxDoscGquc3DUrcVEGc0GQ4hncbOR+YFKvcxMquK18Ptq1b3B9u0S+4=
X-Received: by 2002:a25:ad1e:0:b0:bc8:38c3:6495 with SMTP id
 y30-20020a25ad1e000000b00bc838c36495mr7891271ybi.55.1687298939827; Tue, 20
 Jun 2023 15:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230620173305.896438-1-festevam@gmail.com>
 <254e633f-1cc4-0eac-d6d9-365f78433227@linaro.org>
 <23355aa73e9c8d84f119f675d599a00c@denx.de>
In-Reply-To: <23355aa73e9c8d84f119f675d599a00c@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Jun 2023 01:08:48 +0300
Message-ID: <CAA8EJpoinPW8gvbsPwSEsNXPDJ+19mbjjqRaKoQkd8xzU8Owdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/a3xx: Pass the revision information
To: Fabio Estevam <festevam@denx.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023 at 21:14, Fabio Estevam <festevam@denx.de> wrote:
>
> On 20/06/2023 14:40, Dmitry Baryshkov wrote:
>
> > This looks like a boilerplate being added to all aYxx drivers (and
> > then these fields are also set in adreno_gpu_init()). Can we remove
> > duplication somehow?
>
> Sorry, I missed this comment prior to sending v2.
>
> Maybe a simpler fix for a2xx_gpu would be:
>
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -540,6 +540,10 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device
> *dev)
>          gpu->perfcntrs = perfcntrs;
>          gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
>
> +       ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +       if (ret)
> +               goto fail;
> +
>          if (adreno_is_a20x(adreno_gpu))
>                  adreno_gpu->registers = a200_registers;
>          else if (adreno_is_a225(adreno_gpu))
> @@ -547,10 +551,6 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device
> *dev)
>          else
>                  adreno_gpu->registers = a220_registers;
>
> -       ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> -       if (ret)
> -               goto fail;
> -
>          if (!gpu->aspace) {
>                  dev_err(dev->dev, "No memory protection without MMU\n");
>                  if (!allow_vram_carveout) {
>
> What do you think?
>
> a3xx and a4xx call adreno_gpu_init() prior to adreno_is_xxx() so they
> don't have issues.

Yes, this seems like a perfect solution. Please send it with the
proper commit message. Also please add:

Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")

-- 
With best wishes
Dmitry
