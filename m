Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB1AE87B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8DE10E75C;
	Wed, 25 Jun 2025 15:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TkY2tMZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBD610E75C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E70149B21
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E665C4CEF0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750864568;
 bh=9uiCx//aBaD0yGFQdVerDfD2PgBCP5+9oifVTXlFXYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TkY2tMZ3PpuUyBYnhjn4aUhRen6PKOzLvqdf9sEQ2MwIeSuY+OeWjpUz2PKtzLDcz
 B84x5fB6r7hubY0bv9YGtCoqxtdkIEWLmfxvtkr4mJFWPNCgpBEawz4PePI9B2rsew
 Y/TVEsbzNYX88CF76bS+1UQtqUL7rhtZ95IrAMBDlOamfYc1LxzY1/K46E3gkcDhTM
 agcKiFkTGBV/YYJVbNCFH9UiYh0Mem0GuCe0I+QL/I7wp0sPdyM7B1gT1p9MMKQu+h
 5ct8o2FcCLTqx3nT4+VhEK6gcP/VA1NuCOu3nzYDSEc5w2pAi6w4YnSsaTBqcj3b3H
 LGmbVz2tI4yIQ==
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so7440296a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDwLeZW0n2F7R7Lh/PCSR+mBHuR5zyZjIgmCl/O3uQf16AjaiLc0/jiNo4+3skcyMvobVlCm3p8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzWfAPg86WypjgjlCR2Wn5ih51nPOQsuG7tj2Fk10ybG1mSYY+
 dhVk6WjCYCX7tJGUKjizbO05Be5bi4LmaVAApy6BApOqu4E4sXVRp9DIa3qWHW7Bz3XfQEa9T+P
 O+iEwhErHsmhvzphLEXUHyfLESIehXw==
X-Google-Smtp-Source: AGHT+IHtRKCKayH+Lzht6QxsgoVvjQ6oWe0lLgYe2Cl+JRUJ/z1lS3uwRu/T5Q4f9oAnyB42TUycr2B2CpGFTJDpP5w=
X-Received: by 2002:a17:90b:2b47:b0:313:f83a:e473 with SMTP id
 98e67ed59e1d1-315f25ed7e8mr5611684a91.15.1750864568023; Wed, 25 Jun 2025
 08:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Jun 2025 23:17:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__=3Pb2Tsr87b5FWG_DrQNdfeDC5yAE2XFo+TiP7hO6BA@mail.gmail.com>
X-Gm-Features: AX0GCFsC1n-RCC-W67WMTwPw4kHzfcK5gDHEnXA5e3PZAISJh-AfZvkzSrkcFBc
Message-ID: <CAAOTY__=3Pb2Tsr87b5FWG_DrQNdfeDC5yAE2XFo+TiP7hO6BA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B46=E6=9C=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:52=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Reorder output format arrays in both MT8195 DPI and DP_INTF block
> configuration by decreasing preference order instead of alphanumeric
> one, as expected by the atomic_get_output_bus_fmts callback function
> of drm_bridge controls, so the RGB ones are used first during the
> bus format negotiation process.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output form=
ats on MT8195/88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 6fb85bc6487a019cdcdb3770dc06a1deab8d5bda..a2fdceadf209f6d2166e7523b=
82ca18c82c7d435 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1095,7 +1095,6 @@ static const u32 mt8183_output_fmts[] =3D {
>  };
>
>  static const u32 mt8195_dpi_output_fmts[] =3D {
> -       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_RGB888_2X12_LE,
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
> @@ -1103,18 +1102,19 @@ static const u32 mt8195_dpi_output_fmts[] =3D {
>         MEDIA_BUS_FMT_YUYV8_1X16,
>         MEDIA_BUS_FMT_YUYV10_1X20,
>         MEDIA_BUS_FMT_YUYV12_1X24,
> +       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_YUV8_1X24,
>         MEDIA_BUS_FMT_YUV10_1X30,
>  };
>
>  static const u32 mt8195_dp_intf_output_fmts[] =3D {
> -       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_RGB888_2X12_LE,
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
>         MEDIA_BUS_FMT_RGB101010_1X30,
>         MEDIA_BUS_FMT_YUYV8_1X16,
>         MEDIA_BUS_FMT_YUYV10_1X20,
> +       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_YUV8_1X24,
>         MEDIA_BUS_FMT_YUV10_1X30,
>  };
>
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>
