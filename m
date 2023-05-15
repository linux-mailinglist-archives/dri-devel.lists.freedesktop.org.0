Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDCC7022BF
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 06:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBD510E11F;
	Mon, 15 May 2023 04:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDFD10E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 04:14:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so22721310a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 21:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684124039; x=1686716039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAfAyWJM6kDeKOF0uWuVmOKeYtigMn9m5Gm4oYh5/1k=;
 b=in7SNlKvFLMHyBOPoGWT0A0A43nuv+Y8QLz/dXuudygoMg757DOFucNKj5GDVHE3Py
 xyjFGk9HqZ/jTOgUZ2ektMx3/DYT95Fi09HJDTbEn2PoTlBY8gDzcACcjb+imJE6zEC7
 o7nL4LBROMfhX0j2GDBKUl29lPF51ddML2i1JeVqbXgRPpQcV5w05PTOOuyBnEBZZrVq
 doB5tnq6jAePO4qECM0pAiHy0Hk2XZGRJgCQ2e1Y+8eBIg8UfFbQkUwwubd4kPjPtpcv
 p9I4KKbg1DjeUFSnjXd1zb6nbNwWbbkTY2PHVC9nq/s6s9eRWVOBPjFNs58ll9numVaI
 3Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684124039; x=1686716039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAfAyWJM6kDeKOF0uWuVmOKeYtigMn9m5Gm4oYh5/1k=;
 b=PTsj2sY/5fYIdrS+jheoRTWlfoeth+v3WWAH6l9eQKePXYve0pYmVb0Hk6g2lcPHie
 iSHT2CN32a+wU06FLRmLyEwqPj15Mv5Op9CVVw1+A5vR1pgnH/I9rtY8RCCj2wzgN3KC
 571djEildPxtc186FI4RHqEp3gUJUOeFivvMAMHv8GJLbR3yxp4Gm9OFKYuzCYpv2aya
 Qpzme41p7+YEbBvDc3ZZwXrjj89s7f1cZluP21xGQ8wsrE7k6gqSHbRWj4FHvVAOjjVS
 YVbWIW7Wlrh6IDVHV3q6fEHw7oeM+h6/vIKja2OWDTjuLztqXybvIedycNspBnYyFOMG
 MDcg==
X-Gm-Message-State: AC+VfDzHI8+/ACWZY1DKuBY78mJmjtuQ3CUUQ2AOck6JHO1apOH1RAae
 ITBy4soHek4v02HdhlxQrbTf5+ddtEI/UxPHfIA=
X-Google-Smtp-Source: ACHHUZ6voWTaTMIowSruvmBEdLbuJphCoWLq/VwBTeCuUyR+0/V6maMf2Q702YBKlZOG7A4qipBa10dRKNUwfdaW8t0=
X-Received: by 2002:aa7:d058:0:b0:510:503e:1a1b with SMTP id
 n24-20020aa7d058000000b00510503e1a1bmr2489031edo.25.1684124039494; Sun, 14
 May 2023 21:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 May 2023 13:13:23 +0900
Message-ID: <CAAQKjZNx2xp-tzfpEhA4ET94bTtaV_P6P+P6bQiDTnR_4zG3Ew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: g2d: staticize stubs in header
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
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

2023=EB=85=84 5=EC=9B=94 7=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 11:48, K=
rzysztof Kozlowski
<krzysztof.kozlowski@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Stubs for !CONFIG_DRM_EXYNOS_G2D case in the header should be static
> inline:

Same patch[1] was posted before so I picked up the previous one.

[1] [PATCH] drm/exynos: fix g2d_open/close helper function definitions
(kernel.org)

Thanks,
Inki Dae

>
>   drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: warning: no previous prot=
otype for =E2=80=98g2d_open=E2=80=99 [-Wmissing-prototypes]
>   drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:6: warning: no previous prot=
otype for =E2=80=98g2d_close=E2=80=99 [-Wmissing-prototypes]
>
> Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.h
> index 74ea3c26dead..1a5ae781b56c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
> @@ -34,11 +34,11 @@ static inline int exynos_g2d_exec_ioctl(struct drm_de=
vice *dev, void *data,
>         return -ENODEV;
>  }
>
> -int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
> +static inline int g2d_open(struct drm_device *drm_dev, struct drm_file *=
file)
>  {
>         return 0;
>  }
>
> -void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
> +static inline void g2d_close(struct drm_device *drm_dev, struct drm_file=
 *file)
>  { }
>  #endif
> --
> 2.34.1
>
