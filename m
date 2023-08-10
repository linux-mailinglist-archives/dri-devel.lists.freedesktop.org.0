Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D707777B3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 13:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C3310E50C;
	Thu, 10 Aug 2023 11:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EF310E50B;
 Thu, 10 Aug 2023 11:59:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe0fe622c3so1191273e87.2; 
 Thu, 10 Aug 2023 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691668777; x=1692273577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGlcXxJFaDzWj7nYjjY5lTpTdKnxKA43Fs7dmJrROTs=;
 b=MgcrPbRar/l6oMGaHcTK0fQsW1WsDKCUJqefc0cvv5nHR/Akz0OGJdfuIj3f2F8FyS
 TAZQSJ7496YEzennxAZlORdOz90i9jtqSdrxTyT95BtsWyqoGhCsGd5RKQnrWRr1poPo
 kGVGGCIvnSg0Dsgr4tqIvSKK4pCu3/L+GVE6FmKQ1YofeYusngo9zj4y1pe/IeYxfh9j
 mLp5LB2m68wwpIg9f30gVj70D42ysLY9kFHolhwnR0GLa7tl4UiN27ETWDO18nHr26gY
 v2Eh9TL+pmJLaZI+NSvdpLVo2kpeWFwnc7HHdbRa3fwEYDV7z8aunJj2J40IXqVDJ5cH
 6TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691668777; x=1692273577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGlcXxJFaDzWj7nYjjY5lTpTdKnxKA43Fs7dmJrROTs=;
 b=IzFz+Am4QY5zYXq6A+MvjuzR9NvWbAFK0JZLeJqiLhnLkKCBA9MF0wstKvxY68RelU
 s5YpcORM25W27nww15Rb5+SzG8KgMNHtCHX9F0nWpU2FHTAaGKW/wU5PgT0yUJ0HcKUQ
 Z4h+cyyF0FasthfGnMsMRt9MGLnOfahSoPSlNQ6Yt/VUfv2aymsQBSrjedicZ91Ueba5
 OKePkBA29TfouOJY8jmB6dGOByGk6MfhY7FnlrO1bNU1RJW9rvZizZSPYNXgRwHa+wDy
 /o5dJyuj2YR87z4RJxRZJZIt8BV9PTd/Wp3PFHZYLLlnvhG+SX82HvpdWEvQSQGJO47Q
 9qcw==
X-Gm-Message-State: AOJu0YyucbUV/0yJGFIfQBc3vIEn1sE3jrGk2IxJcVPMIQ4ZPde17LQx
 Pi7OAil7YDIqqWCt0Oah2+OFC7aDlLLipiqyjK2iH0dy
X-Google-Smtp-Source: AGHT+IHg3W7ELaCcpGiqNdn1wCp7CnSqQN7+z8TWLXhOqRX7hQeEr2WbxSEy5bu9iB91ID87BUT/uAOMSUxiD4zdQpY=
X-Received: by 2002:a05:6512:2821:b0:4fa:e7e5:66e0 with SMTP id
 cf33-20020a056512282100b004fae7e566e0mr2116706lfb.48.1691668775709; Thu, 10
 Aug 2023 04:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
 <20230810095923.123388-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810095923.123388-2-krzysztof.kozlowski@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 10 Aug 2023 19:59:23 +0800
Message-ID: <CAKGbVbv12K6NkRAe7jm7jueu6XCKyAkK+gmFia8ZxL7WH_h7zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/lima: fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 lima@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Thu, Aug 10, 2023 at 5:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> 'id' is an enum, thus cast of pointer on 64-bit compile test with W=3D1
> causes:
>
>   lima_drv.c:387:13: error: cast to smaller integer type 'enum lima_gpu_i=
d' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/lima/lima_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 10fd9154cc46..884181708de8 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -384,7 +384,7 @@ static int lima_pdev_probe(struct platform_device *pd=
ev)
>         }
>
>         ldev->dev =3D &pdev->dev;
> -       ldev->id =3D (enum lima_gpu_id)of_device_get_match_data(&pdev->de=
v);
> +       ldev->id =3D (uintptr_t)of_device_get_match_data(&pdev->dev);
>
>         platform_set_drvdata(pdev, ldev);
>
> --
> 2.34.1
>
