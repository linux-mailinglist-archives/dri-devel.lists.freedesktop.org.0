Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1CAEAE38
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 06:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276710E316;
	Fri, 27 Jun 2025 04:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/hA2inO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB41210E316
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:56:43 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4e7ef5d6bffso461587137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 21:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751000203; x=1751605003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2HGv8LGZ8DzKrZFUO2v+eei1l2wUynW3XD4JObL1Tw=;
 b=L/hA2inOryluPyO2uKMSF+gY1bCYtrQClNEWb4kg/tMjbd0yPicCBtu/oagStbt2Vv
 IRZwYYdBSEdzFYjPj1y8kcOOgYiTBOcUl/u0+sGxulOB88TJmLIWhbxt9cVekgiFbOV7
 U253O9JwVvDpdDeIUE3vD4jxLWZT5P2ivoXZySaWQ/vsBxH4YxhOTzGr+HaKBIcL8tS3
 ybg/JsPlBs5UmQ7aKlm6uo6TtqdJ8OX7bf6Mp2gm4evYGo/bOKw9d/mdmh8tiMtFfM2F
 LGX/ok6iIm3PfghTA3hB6IVVNMFYxzr+PJoqzuuqUcO9kHGKSTLstJIx3kT8xGubKU+Z
 ddlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751000203; x=1751605003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2HGv8LGZ8DzKrZFUO2v+eei1l2wUynW3XD4JObL1Tw=;
 b=qcI5vlHdR7zu7YdJfU1SkWWx9iQemagyHY3iugSUCqHySy9pWXeSQWHcyV3nJ2G3x0
 MxH3pN35ADlgf3VuFx3+O0QpkswSmkxhuT0DGd8wuF4BLm1Ga4lzXMaBg3EdNTx5MMPS
 KTw4F2j/i+u8eGVYoqDcm0oEKUC1PDatKJf33b8cw+OvmZ88HM19avAsN09HHPR3f+fN
 hqjf2VcEQ/iGWxYyPa5rn4zeibswgxj4M1yfLzPVggrkQCZrRKB2UFNBAVSM5inI3b1N
 9CPSFk5i2eAFq5/qmPaLQ0v0+JHZC82VxHUm0WtYJ4L2cO7dM9RSMSZgnYRFfgSd8ZoM
 y7SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgaWmTi7xs3GU6Q/sKRINeVHMLs7MSXrrN+5LfF9gWrR7/f02JEXtHeD5OtA8E9CNiyMboJolKv18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo+/m0uLf8dpu9fXsd0Awikm2FEhc1ssMd6muFWFu3jCeQA04a
 BT+tzBbzx7axQOMjBLJXY/LAQKhiUzV3ls0tjFCD27L4dKxTn2vtMr8/AWVjv5dS8bLSYV4zxu2
 uJ5D6rtwJj+Rl8C/3+l89Osv3DdUNQhU=
X-Gm-Gg: ASbGncsCZksEf/6PTRyKpYMhq61guDvRdX+2N6YP3QkRF/ZpA1zOkzGkoKFPDKoikTO
 pK5Xyan3sDEn2ktjWkBamm+2GoxDTERc+KAelbi2l3JSnONt0oUtgJiEejH2DSTCH0u7njawxsG
 +vPzR/MQHN39z7Gqp+sogRznIyugGFpy0KOYwGj4c/aw==
X-Google-Smtp-Source: AGHT+IE+07qHBqPDCXthKdPHB/7LUX6RLsYmY1o5ORrW1h7tii2FCLcpiV2074k1N7ZSn36YN5VNYrTVJdSCyPltG5g=
X-Received: by 2002:a05:6102:442b:b0:4e7:b728:e34b with SMTP id
 ada2fe7eead31-4ee4f57ed09mr1865136137.3.1751000202837; Thu, 26 Jun 2025
 21:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-3-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-3-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 13:56:06 +0900
X-Gm-Features: Ac12FXyCRtmqlVxLH-ZQ8PS-fwNE9eVFG2Sf48qY_m8XFevvCiJLCVczBK1_h0o
Message-ID: <CAAQKjZNbEAiDC_2dUMKZHyPO4nS9TM7TrdjyNx0uLcjvh=PyZw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/exynos: exynos7_drm_decon: add vblank check in
 IRQ handling
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> If there's support for another console device (such as a TTY serial),
> the kernel occasionally panics during boot. The panic message and a
> relevant snippet of the call stack is as follows:
>
>   Unable to handle kernel NULL pointer dereference at virtual address 000=
000000000000
>   Call trace:
>     drm_crtc_handle_vblank+0x10/0x30 (P)
>     decon_irq_handler+0x88/0xb4
>     [...]
>

It seems that if the display is already enabled by the bootloader
during the boot process, a vblank interrupt may be triggered before
the initialization of drm_dev is complete. This could be the root
cause of the issue.

Applied.

Thanks,
Inki Dae

> Otherwise, the panics don't happen. This indicates that it's some sort
> of race condition.
>
> Add a check to validate if the drm device can handle vblanks before
> calling drm_crtc_handle_vblank() to avoid this.
>
> Cc: stable@vger.kernel.org
> Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index 43bcbe2e2917df43d7c2d27a9771e892628dd682..c0c0f23169c993ac315fc8d7b=
cbd09ea6ec9966a 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -636,6 +636,10 @@ static irqreturn_t decon_irq_handler(int irq, void *=
dev_id)
>         if (!ctx->drm_dev)
>                 goto out;
>
> +       /* check if crtc and vblank have been initialized properly */
> +       if (!drm_dev_has_vblank(ctx->drm_dev))
> +               goto out;
> +
>         if (!ctx->i80_if) {
>                 drm_crtc_handle_vblank(&ctx->crtc->base);
>
>
> --
> 2.49.0
>
>
