Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD479AA291
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF32210E67E;
	Tue, 22 Oct 2024 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hD22HcbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC610E683
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7DA10A43290
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE39C4CEC7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729601863;
 bh=GhYhjo2Z9FXBqZLMmzftfla/w2fS4jR3pdlc1PSB8Es=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hD22HcbCWYrNyjFqSykKO/nQN74Fjac40Zf+8kuy7rOWNtkb/jtjRbMHwEMoOGuFc
 FhX2+GLUFrjEDxK2/vOBzAfa1hPa8PLEvmutycNrffhgCrkmes/+30m2KYxzR32E1V
 Y/kNhRs2yGx9qGuGNjfmhA/uPBsA5bynDhgsaWpMJYob+SxBPeo2uJzk4FbhMCoEF3
 W29Fi36i0zW3heIsmrxraC2HVXOpyrWPzR03zt+yF0pBX7Kk7pOvX056xxriEcVsXp
 QdpamNnBKZo7mzYNsTMoQRSTvkejgQHfVlYB43tvHVW8sd0MjJ1nCFEG0csOhLmnHn
 +HVdT+1FRaHRA==
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20caea61132so43868655ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 05:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLG2QfPdoIZxzaJTtlJAGqup4BuwSkIy9vAnn/jigRyZ7qCT69KNfY/QAiLBPRw4dXRAagljBI6ro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6GyPlaPJ3vLBQe/oCofujvcu4KCct+LVuFpzCTKQfojHj7m+D
 k8hSdmhuynRKURXDKQlBm2g9D8N1o+JfhHxlWtUm/yMTMWZ/RPOy5XpXMYlZNTzfhlGLhyBSTZO
 SquOf9u+7Tt3gY5QBP1j12xrwkQ==
X-Google-Smtp-Source: AGHT+IHDPBVccyietVt0eoOPH++rNW8m28x85sMWW+Dmxt+0VFr1aS34/bDRGwrVWPxtoil8Pjk3sREsZd5vx2UMbic=
X-Received: by 2002:a17:90b:1649:b0:2e2:a2f0:e199 with SMTP id
 98e67ed59e1d1-2e5616c543cmr16488894a91.8.1729601862855; Tue, 22 Oct 2024
 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 22 Oct 2024 20:58:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY__fuUpvFeFXZrmvmFAM+92a-UJ9-ye6hQZHS_BHXpbAUA@mail.gmail.com>
Message-ID: <CAAOTY__fuUpvFeFXZrmvmFAM+92a-UJ9-ye6hQZHS_BHXpbAUA@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Adam Thiede <me@adamthiede.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
> XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
> and extending configuration of OVL pre-multiplied color formats,
> such as MT8173.
>
> Fix the SoC degradation problem by this series.

For this series, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>
> Change in v11:
> Fix typo in commit message.
>
> Change in v10:
> 1. Fix the commit message and comment for OVL_CON_AEN
>
> Change in v9:
> 1. Add the fix patch for the XRGB8888 downgrade issue of MT8173
> 2. Add the refine patch for ignore_pixel_alpha statement
>
> Change in v8:
> Remove blend_modes for not supported pre-multiplied SoCs to fix the
> return error from drm_plane_create_blend_mode_property().
>
> Change in v7:
> 1. Add the remove color format comment patch for OVL
> 2. Fix warning: 'const' type qualifier on return type has no effect
>
> Chnage in v6:
> 1. Use blend_modes instead of function pointer in OVL
> 2. Use ethdr instead of mdp_rdma to get blend_modes
> 3. Add 0 checking for adding blend_mode property for mtk_plane
>
> Change in v5:
> Add fix patch for mtk_plane
>
> Change in v4:
> Add lost cases of mtk_ovl_fmt_convert_with_blend
>
> Change in v3:
> Change MACRO approach to function pointer in driver data
>
> Change in v2:
> Fix build error and typo
>
> Change in v1:
> Add fix patch for OVL unsupport color format settings by driver data
>
> ---
>
> Jason-JH.Lin (5):
>   drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
>     unsupported SoCs
>   drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
>   drm/mediatek: ovl: Remove the color format comment for
>     ovl_fmt_convert()
>   drm/mediatek: ovl: Add blend_modes to driver data
>   drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 70 ++++++++++++++-----
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
>  drivers/gpu/drm/mediatek/mtk_plane.c          | 15 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
>  10 files changed, 92 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>
