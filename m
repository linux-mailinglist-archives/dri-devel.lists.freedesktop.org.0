Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58588912984
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA8610F201;
	Fri, 21 Jun 2024 15:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qc9/4CZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7CA10F206
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:24:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 712D462722
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2507FC4AF13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718983454;
 bh=Ff9EA/QpmNbx6stJ+wK7SetR4F+aGIuV8L9De81Il+E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qc9/4CZbIp5EKUk+F/AKUwoQ0aHLAq+2Pj44DNsskp5QnjGqRURlmL1ze/hDM0a7j
 iMOp0Vpp+GM5Qh8dkZVv/IW4Ylx4kc3LAoYEYLEeDAlmBBl5hj8F41tgaKvHCtUsu8
 bfoLgYmQWN9/+IyIrAwn2DUjhnD3OoDXp/Obg5f9VNFIyMfdAuk7sD9q9ZU2ehiv5Y
 V4RAiz8enzz6rhWcPCnLQuw7I2r6iMy7V4TaW3XutG+sOWkq7n0m1tCk0P0N1S0J5Q
 mTk9m+HVV60FOicQZNtK0Q3mPlRcDgPM++ilW4XWKorfAGToycanfiZV9qJWw+Komn
 2em0GAWyG//NQ==
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-70346ae2c43so2196055a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKh6XU7d1X/WmylfV6QM4rtTWtEzxJY/iWDBdVNCcmbxiYfZ5D3/hDR6ENUBDFxX/eZbJUFeAPcIQVG2KUtl0pv/nvB7MS5RfhlGkhAtnw
X-Gm-Message-State: AOJu0YzLJJMdfqiNcq2J0O9ipmVxaH6XKSK9dIAqbDFM3Qn6Q/BYIAqa
 m6gSN7b7IK38V1uwx1EOsZwkj+LjEqVnkP8TYZkyI0Tl0Hs+GpqZJdNMC++g/Z9e4r+lBX2MR0G
 m5resXs0XfLzfKYOAuI93oNNgzw==
X-Google-Smtp-Source: AGHT+IGQ+sY96q+fAXo/8wcMlUkQMzFLEU6NhVSDTBlzTx/VszhL+gr2xWg/am131E2fodn2RmM1MK7LQCnq1VLk1pE=
X-Received: by 2002:a17:90a:2c07:b0:2c7:b392:8f02 with SMTP id
 98e67ed59e1d1-2c83c2dc0fbmr115615a91.23.1718983453637; Fri, 21 Jun 2024
 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Jun 2024 23:24:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Message-ID: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
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

Hi, Alexandre:

<amergnat@baylibre.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8823=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> Add DRM support for MT8365 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index ce8f3cc6e853..e1c3281651ae 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdo=
sys1_driver_data =3D {
>         .mmsys_dev_num =3D 2,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =3D {
> +       .mmsys_dev_num =3D 1,

You do not describe the pipeline information here. I think display
function would not work.

Regards,
Chun-Kuang.

> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-mmsys",
>           .data =3D &mt2701_mmsys_driver_data},
> @@ -345,6 +349,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8195_vdosys0_driver_data},
>         { .compatible =3D "mediatek,mt8195-vdosys1",
>           .data =3D &mt8195_vdosys1_driver_data},
> +       { .compatible =3D "mediatek,mt8365-mmsys",
> +         .data =3D &mt8365_mmsys_driver_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> @@ -732,6 +738,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
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
