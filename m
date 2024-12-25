Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A69FC548
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 14:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EBC10E05A;
	Wed, 25 Dec 2024 13:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NXBQvQJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A010E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27544A403EB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65351C4CEE1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735132519;
 bh=iHNXmu5hs74pFvfsdpshztzJ+D6rhXCuoqhaimsHvmY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NXBQvQJJLikx+b/hTw3s80MoGdqCU+PITzyGU/yke0hUnsW/RhnhHmX3iKvJUk41X
 G6KpomoVFGKR+i30srRJRE97BMMslh8kCcWVIqpMGTN8WbjXO5QTMIzhhOGtgTy3eI
 MCLQdgg3EZtXVHQ+PIzWBTtt5NyWqPiTcq0QHQtIqKNG4TQsgTjgWywFQM6lbVX3nL
 aE3Cu+ROEpOxgbrY/2JRuDqwBhMaQjbUkprCqZmHzEYnVq06Bao/Svd7Q68ezv4T1E
 vOn1O7m7mFjxN2ev5/Qy+Tq29CKtzHBLqf3eHQtOqAV6XtcPfEt3TlwfW1r9MEa2yi
 JiHCrnnAJe9Wg==
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21649a7bcdcso63851095ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 05:15:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+fwulTAdBus/+uP++QguL9bfH9XrO0kgtigy+tu0UYYJrf227/yQUsyZvYvZdkNT0oYn+a2EMIUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4S10MQ2kB3Vp/NLJIcn9Wnei/GU1FE4kcgLayVkdibOQPDv0Z
 +zgDkqUDwQ48mnrTXlhzEpB7uDvqWO8o2cSqqs9BTv+k47f9ydTY0cl3W6zpfo7RPjbS4RfqiIa
 CRZzVdW2ow+6t7CKZc+22Z1pLmA==
X-Google-Smtp-Source: AGHT+IGvamxpRBkZPcG2USKxFycGzg9VcxRlTaAg4CDy0ih+TDctQVqL/wUXOKCLhbMvK94H0+QSz4jrQBTqKUvOH2k=
X-Received: by 2002:a17:90a:da8e:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f452ec37a0mr26874950a91.25.1735132518901; Wed, 25 Dec 2024
 05:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:15:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VcgTktusqpoNsx0JbwvKP=CPBc8M_YyQHa1cj+s_wrw@mail.gmail.com>
Message-ID: <CAAOTY__VcgTktusqpoNsx0JbwvKP=CPBc8M_YyQHa1cj+s_wrw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, sui.jingfeng@linux.dev, 
 ck.hu@mediatek.com, amergnat@baylibre.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dan.carpenter@linaro.org
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B411=E6=9C=8812=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The struct device_node *next pointer is not initialized, and it is
> used in an error path in which it may have never been modified by
> function mtk_drm_of_get_ddp_ep_cid().
>
> Since the error path is relying on that pointer being NULL for the
> OVL Adaptor and/or invalid component check and since said pointer
> is being used in prints for %pOF, in the case that it points to a
> bogus address, the print may cause a KP.
>
> To resolve that, initialize the *next pointer to NULL before usage.
>
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for displ=
ay paths")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

I would like you to fix this warning.

WARNING: Reported-by: should be immediately followed by Closes: with a
URL to the report
#19:
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>

Regards,
Chun-Kuang.

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 9a8ef8558da9..bc06c664e80f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct devic=
e *dev, enum mtk_crtc_path
>                                          const unsigned int **out_path,
>                                          unsigned int *out_path_len)
>  {
> -       struct device_node *next, *prev, *vdo =3D dev->parent->of_node;
> +       struct device_node *next =3D NULL, *prev, *vdo =3D dev->parent->o=
f_node;
>         unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] =3D { 0 };
>         unsigned int *final_ddp_path;
>         unsigned short int idx =3D 0;
> --
> 2.47.0
>
