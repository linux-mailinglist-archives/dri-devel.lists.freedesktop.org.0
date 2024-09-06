Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D496EBBD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7110E079;
	Fri,  6 Sep 2024 07:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R2osU8l0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9C010E079
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:14:33 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-846c59979efso468358241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725606872; x=1726211672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/DCmDI1o+fFk4wQmseRwj8ZOwz/GsHa2AZ//13hLAw=;
 b=R2osU8l0culHerfF0WkoJIGe0+dRxfGsV8b6uL9vtN2I18ip3VI10wZPYVzHvwByHd
 7wynbkIlAAXfGbMHuKNowkrhK0wkEmtQmKoLLSKp0Q9h0j2HlNjGFSq/HIeLAonbY2A4
 sNC5y/eKVe/O6D2dVT1fQddbh+gv2o/nYTEO/2f70InKf4M/T3Eypok4Q+lG4dBU8qxp
 PSvtn9blK8sO05Tio6Nm+mdoCK7twpJQkvqZNfIS5QuO95jr9YZENx4TEYEWVy6+Hqm0
 VdQgMxPfsU4If2cwXFG9nUo8OfHYDAMIhKLYwqK1XSg9EewUTh5FuIIri7z7SC5V4BvH
 z4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725606872; x=1726211672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/DCmDI1o+fFk4wQmseRwj8ZOwz/GsHa2AZ//13hLAw=;
 b=l7QNd1KthHRoJyXgx/pYU6qdk4tAj7RxkeYF0aBIwFc3oqRR5SHtLQJuaNM5pCV88R
 7M7+GFzX1EQN+SiXxUIqryk/Xf7veFKeuLKHKE1wvxPeTsmEfX752Td5Qm4k35lFl6fx
 hg2rYgBv6EW3whY5wJGpxUblPi+JpPeq7kv2qQgfab6arbojuMniANpwF7p5v2bR78I6
 /+gyTIZ5dO85a/OhDo7CWtcznDjUegyqd0bEDUfK+d2mE3oFS+3oLzqur+pJBfQaKNgZ
 S9FTwsWs37SbCktwl5+87plEhw7PF8SqK4KGF5U9ogeOlhnwLjT4oVrXsrdGUMUPaAsk
 pvgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfNQ017peGqp1Q4unM93fb6HlZd/QwFg4DUL+NpVANpVIHS8QLEDn98OEDESNcLGNPXEjapZyiDD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeqfHJ8NA47SQTMFxmSpLCvn5QVtoUEtvRDE4u29KpMAWahwRs
 JsBv5e3Ppohuc+W9RXgHdaOcmXTwvcZ1FKrHxdFDpqW72mFYSrgRN49UG7Q65Ho3yWTv9XXCG1Z
 e3hAtPNxNejpUWG1ZRCIxluW+cZU=
X-Google-Smtp-Source: AGHT+IGGbVTEwoHdhzSKfRHMEkHTzqjgk4warFBzYaFxdeIwoQssc0zXxseyOQCwlQwRRiZKsoT/OlIzRsYaIqgY6L8=
X-Received: by 2002:a05:6102:390c:b0:497:5e68:887b with SMTP id
 ada2fe7eead31-49bde1dec97mr1723355137.16.1725606871951; Fri, 06 Sep 2024
 00:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240822090927.1444466-1-liyuesong@vivo.com>
In-Reply-To: <20240822090927.1444466-1-liyuesong@vivo.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:13:55 +0900
Message-ID: <CAAQKjZPAbXDCXafBfrjcxt+=P0C-SYT_NDf5hjeJkpOvawYaag@mail.gmail.com>
Subject: Re: [PATCH v1] drivers:drm:exynos_drm_gsc:Fix wrong assignment in
 gsc_bind()
To: Yuesong Li <liyuesong@vivo.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
 daniel@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

Hi Yuesong Li,

2024=EB=85=84 8=EC=9B=94 22=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:09, Y=
uesong Li <liyuesong@vivo.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> cocci reported a double assignment problem. Upon reviewing previous
> commits, it appears this may actually be an incorrect assignment.
>
> Fixes: 8b9550344d39 ("drm/ipp: clean up debug messages")
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..752339d33f39 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1174,7 +1174,7 @@ static int gsc_bind(struct device *dev, struct devi=
ce *master, void *data)
>         struct exynos_drm_ipp *ipp =3D &ctx->ipp;
>
>         ctx->drm_dev =3D drm_dev;
> -       ctx->drm_dev =3D drm_dev;
> +       ipp->drm_dev =3D drm_dev;

Correct. drm_dev should be set to ipp->drm_dev like other sub modules
of ipp - fimc, scaler and rotator - did.

Applied. Thanks,
Inki Dae

>         exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>
>         exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
> --
> 2.34.1
>
>
