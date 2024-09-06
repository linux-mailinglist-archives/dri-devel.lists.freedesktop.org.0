Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E896EB70
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BCE10E10F;
	Fri,  6 Sep 2024 07:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AKPFMasz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6DA10E10F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:03:53 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-846c452898cso1441228241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725606233; x=1726211033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQP9fjoMvNzGodLR3rN9WzzZsDn7pee0FftrcLS8K1M=;
 b=AKPFMaszMDtTnkZSaLrYgbAL0sG3Q83zvfsRviWiu1LaAYsjgCqvf1xDDrm6vBJtnX
 Zk/CGP8uEeDaxZnyJmgCwfbJQMPkws815qPWIOplTpDcgC43o0eEyo+X+d8fztxId35o
 49oi7riuOX5IE0Je+9QUSz8jX74qJoRzFe32Jeb504pwdCQ2KSQTJta0qMMqkZCy8lIW
 x1Vji9wke/AG2NM95zRsuVV2t1exHpC57+P0nx1GwZvAEsIe8KcQ4HitzHZWcluvvUi3
 boBy0+P/lzL/HGdXg64QEAEUZL9syjFGagDAkZMuborau5psmtXxk1S6WnmLkT3Ej0w1
 S+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725606233; x=1726211033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQP9fjoMvNzGodLR3rN9WzzZsDn7pee0FftrcLS8K1M=;
 b=DUovdo3vuZNTJJz8X2xd5g7v19YuPBO0J0duucTJv2z/t2Orc1E/hjv4+yi9w1beC6
 qmrEiSao0HANZks9B8yY+UOXX/DgsftAwnfX0htVPLZ7vDQpCl5d1kO7DbUwCkotmlSz
 9lEFpYLiFUT7PLSBEeVsgR4eNwrbgcARHgE7EigG94WjTyfh2I02+c2cFB1zmOy4/Csv
 xoq+ui4zyqz5usYtm7cB9GZepJ9nQ/GEgrCU8PGxQlNNrFlOdz+RGCrPS78wCxm/cDzx
 VZ/c7mOmUwBUzWkU8MShdSVlZ9lAYIhS0vg1sunSA1yvvnOoKZgnuAQABbqWzqPCyM+b
 Bvqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBhWlyXJOg7/BmyYCBsA6UyLdgUlDjZdO1oVLhdSsOp2vEjdfRssOE1GPfvGt0Vyv10AL4XYN2ADc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy9SkAwHV1RxP3ebRtjYu9hPATTBS2dJBM+q712rOZC2YTw8KA
 RaqW1Z15cWBR0JwYHuI8R34jE+53yN4NHOkAO/5FiLlQSqixuJKoqvQTEGjHwSKt1S6QtXFU/Va
 tMnJshLA0kiJOV458TYtDPEpMansek3IF
X-Google-Smtp-Source: AGHT+IEN0qBLQeDG0XiyrY9rkcl5CaIfbG2bEDTzc5WKY9yWSHevLvtPPzoQbYADc+yvKuc3+2zikyihFR5elq/nn1k=
X-Received: by 2002:a05:6122:904:b0:4ef:58c8:4777 with SMTP id
 71dfb90a1353d-5019d455718mr1421444e0c.4.1725606232696; Fri, 06 Sep 2024
 00:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240814035701epcas1p21fdecb1ea56edb88951ea789a2123dd4@epcas1p2.samsung.com>
 <20240814-remove_define-v1-1-7947ae6f747d@samsung.com>
In-Reply-To: <20240814-remove_define-v1-1-7947ae6f747d@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:03:15 +0900
Message-ID: <CAAQKjZPc1St2gOF=nVqShtdaXdG_B2h+7hF4vdNFfnvFmPvGGw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Remove unnecessary code
To: Kwanghoon Son <k.son@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kwanghoon,

2024=EB=85=84 8=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 12:57, =
Kwanghoon Son <k.son@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Function usage exynos_atomic_commit was removed in
> commit 41cbf0fdaa28 ("drm/exynos: use atomic helper commit").
> Remove unnecessary function declare.

It's true. Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index 81d501efd013..23646e55f142 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -254,10 +254,6 @@ static inline int exynos_drm_check_fimc_device(struc=
t device *dev)
>  }
>  #endif
>
> -int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state=
 *state,
> -                        bool nonblock);
> -
> -
>  extern struct platform_driver fimd_driver;
>  extern struct platform_driver exynos5433_decon_driver;
>  extern struct platform_driver decon_driver;
>
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240814-remove_define-580075bceaae
>
> Best regards,
> --
> Kwanghoon Son <k.son@samsung.com>
>
>
