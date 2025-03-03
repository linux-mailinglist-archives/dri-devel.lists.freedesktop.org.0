Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CFA4C176
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7655010E411;
	Mon,  3 Mar 2025 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ckAWY6yd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6EA10E411
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:15:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8EF9E61190
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D558CC4CEEC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741007702;
 bh=nwrY5mTBKsH0VrIlw0M+a6qAcq9/UvmEmo3JfFgzxI8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ckAWY6ydEYES7IYxghoebGnlP5Hw44gzxvtzcBTYXWJD7h1D/ZFFdoE21onxb4qr9
 wOEmpbDpjBnTYSYj7FB2P3sP0957DntKshxe4U1Si6ofwrNHu8s5fmTD1hDjFzW9qm
 6VxrrffeSayrkbyHr6trQbkHvqaBKTA73rnG6yyQylko+hLrVJO3IqnNLhxynFzC4o
 vi5D6Kvkq3Hdj8nAF1DWy/ZdYwUBjJescwR38hv9Sc1MUNWRbPMzDGBxD9KB1R0G99
 sWoGq3f9fWNtf1FmlhGszXMh0jYbZsjz2Yexm7cQAKECTD+XyCni2siFzPQh0OxuP7
 lafJyce5Gnrmg==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fce3b01efcso6216380a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 05:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXj4az2weo+xbpWpVEENrTeLRyTnTZCvyxTt6gtGOKJfUL/Pru2HcTVwC/N/h8QCoNg4IL+HDL+Co8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4bkm7V2B6XpUZaV5f1AqpLSOqw5NHkbJwqgh2bS3WHfJ5x4Cq
 0jMLqdYVdtzMAhbdEx6C99Zr3xVl90ZaVu6J1XujSb6OkG4GfpoAn5R/YSmd6/coqBgry/5wwVh
 u+FLVgEzn7Zvdmz5Y95kAAEan/w==
X-Google-Smtp-Source: AGHT+IEdq6TIp16hKhBlDO4xfda53D7O9rz6s7IDZPVAapB9apF5VJ70jX9N1Qnsx75v9OLYhq9X6ox1YKUJZiNS6WQ=
X-Received: by 2002:a17:90b:4ac6:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-2febac10927mr18112467a91.31.1741007702343; Mon, 03 Mar 2025
 05:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:15:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__qg1R4JQDssy1bDDJMea8Ud7OsPXjek20cHV8S=jfNbA@mail.gmail.com>
X-Gm-Features: AQ5f1JqYD6WJcU1BIk0mtXtCrxuXqvikkqhcdhVAAsXT4MVrnLil5ua2eCNjEcM
Message-ID: <CAAOTY__qg1R4JQDssy1bDDJMea8Ud7OsPXjek20cHV8S=jfNbA@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
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

Hi, Amergnat:

<amergnat@baylibre.com> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> Add DRM support for MT8365 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 0829ceb9967c..5471ef744cc1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdo=
sys1_driver_data =3D {
>         .min_height =3D 1,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =3D {
> +       .mmsys_dev_num =3D 1,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-mmsys",
>           .data =3D &mt2701_mmsys_driver_data},
> @@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8195_vdosys0_driver_data},
>         { .compatible =3D "mediatek,mt8195-vdosys1",
>           .data =3D &mt8195_vdosys1_driver_data},
> +       { .compatible =3D "mediatek,mt8365-mmsys",
> +         .data =3D &mt8365_mmsys_driver_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> @@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8195-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8365-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8173-disp-od",
>           .data =3D (void *)MTK_DISP_OD },
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>
> --
> 2.25.1
>
