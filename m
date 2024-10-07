Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A639922A6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 03:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B929B10E1C7;
	Mon,  7 Oct 2024 01:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RrulR+bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC52110E1C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 01:44:49 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-50ca3428289so310664e0c.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728265488; x=1728870288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzU4HApFVdOla6cFpiLhDsurqYX2GUtT9S+gfYoFCVc=;
 b=RrulR+bivl1sIGpp8y2Q/FC8E6LD0lrjXcgarLep2WtlAHaeOsu1o7+2RlLP+mqWnH
 Hpzpo1VFZjoid4l/K4wMDyN2OY0Yy7oe5R9yTGd+ZHHpuGg/viygEbDD6NQicC1hYjyZ
 eYJxMj6wGQXW3NokLy8Gz7O9UAx9RYPoLXtgAADirrn6siKjv43T/M7IhGluexYe3HI3
 uM3TTAT0uKgg0qhnrusIt3qmQyHgY6qg5J7H/7qMZCY2mxlml1AJA8it2VP08ci7xP4g
 gPPdjUZDPV468E4zPgMRwWslsQpPyqRd3zcpPoCQzotHkaG1iej1NyxcnTRa6XsyokJt
 iRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728265488; x=1728870288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzU4HApFVdOla6cFpiLhDsurqYX2GUtT9S+gfYoFCVc=;
 b=iWHOnKDsl42feZfdTlD8frESDEA/JSbfH27+YxFOJ9aE20T+FXBw9xkkgnCIe9suEn
 8n6EjRTyOYBKg5i4/yR76u3nI6L+EVWaCVAEhKAV+tfsHea5wOwNv1xJns04CvZgvdzQ
 vqU93fD+i1okewliF46OJ2GtoC9nDAZqU3KYmUcx+QEic7Or1Wdbb0/BPEC9taEollHM
 AzlmxFrgjQnyRcB9LCNg19LsZj+BA5uc+Z9buC/KiNM/xzlLpNTR+YVEc3oQMiR6MmIr
 hOnOmbZjfQiyxOkyF0VPUYHP5/JxC0fbvt5xB8GD0IyCOy4pns+zYKdYzm0bj9DpuDTT
 uQ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPkgLTlh42s5xCLeNhp579P5oVuch+tn2wMA2t0C8VVOvSKZz+rrttPamtFA9eyUHvajVIlcw+RKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzojhVj0ycSr0OSxos0Asmxuu9fYjW261BKO7PgtntOPpqjT+p2
 v/JhICLE8y5BSiYIGwnlP3fNn7UNUdud3Rsb6c8eAJlS08c1OhI9/s/ZQTQR4uJ4xUQevx3QS1u
 Ki+h4GWZliWuzPEq37b+AugwIAsc=
X-Google-Smtp-Source: AGHT+IGi4uAf0aCu5jsPGNvmsMYcFJYpM9lCgPSIHQQx9wMYlcO6+UiL7uE9lenoS0XrukOWueFat2eiVWWotzvuwQU=
X-Received: by 2002:a05:6122:3c4e:b0:50c:6514:956d with SMTP id
 71dfb90a1353d-50c85583589mr5734158e0c.13.1728265488432; Sun, 06 Oct 2024
 18:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240909080620.35245-1-shenlichuan@vivo.com>
In-Reply-To: <20240909080620.35245-1-shenlichuan@vivo.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 7 Oct 2024 10:44:12 +0900
Message-ID: <CAAQKjZN9K1GieEpG4uebJ_ygtpwbVOLD3Poy-+jQePYBwsb7Zw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/exynos: gsc: Fix typo in comment
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
 simona@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
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

2024=EB=85=84 9=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:08, Sh=
en Lichuan <shenlichuan@vivo.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Replace 'initailization' with 'initialization' in the comment.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..fc5fc65823c6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1286,7 +1286,7 @@ static int gsc_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       /* context initailization */
> +       /* context initialization */

Merged.

Thanks,
Inki Dae

>         ctx->id =3D pdev->id;
>
>         platform_set_drvdata(pdev, ctx);
> --
> 2.17.1
>
>
