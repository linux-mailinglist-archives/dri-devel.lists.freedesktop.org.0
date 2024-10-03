Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49E98EA2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0010E7A5;
	Thu,  3 Oct 2024 07:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kaxd3lJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4810E7A5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:13:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B46B5C5B77
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61056C4CEC7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727939615;
 bh=JhZKiGtQJ3zymd/WHqllXr0LMe1u0429Jy42xFeCp7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kaxd3lJ25rkQajgmz7cQN8bDKn6xrj7OzSOtHfn8uH4EjOnJl1D9S+R5irC6GrrDU
 qaiRpJJpeMDcDyvWLjlcsf7YPsExEhhXOdxOUkJsbSb0hF5ljMlQaccLs9MGOVjIs4
 T07US2duiGJyfSvyps8auPPRECrs2CdTanUNzbrzk39yc7aiR8AkK7EOZscPeoeWiB
 YnZotNZBMuG9quNjZbeo0/vC6dxalac0MqejTpFccgxzVERgPtCGg2wlgpk7XykI5E
 BRddwweGoeGpXcwu66CUB/t+x0dwqGyAl1iidQuEZieU3X4s/Kt55QfpgTSSvn1Plm
 a+x8wkatdrz4Q==
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71798a15ce5so1273732b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 00:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPHTP4zoZ2g+SnsyBLyxOKOM/CUAPQS5ujP5rSbyQ8piXlY2uA9NMd81sioJdvufbe0JlRytTW6/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyILNOO6dhJHnbiCTz/0qFgvg36wJeVkCApet7g7JjoAOeYnJvO
 M9g/CRcQ8kHRkctyjUCEqSJ300nuzFwtRkW+Vm443AOogBCQ3i6orPJCs1jfv0Krz3A7ok26moG
 4B1YI1SLqNSxSPynsOMWfNC11jA==
X-Google-Smtp-Source: AGHT+IHaAo5eZ05/dh9oa9JP9QZga/GAqhHnubzaK7kWFsvBL+T5Ll6XOf4RZb+dNKFMS4YkePxJqv4X4Xs3SvAUasY=
X-Received: by 2002:a05:6a21:7746:b0:1d1:88bf:dff6 with SMTP id
 adf61e73a8af0-1d6d3aab4bbmr2809735637.15.1727939614998; Thu, 03 Oct 2024
 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 3 Oct 2024 15:13:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9V+BFV0fCahzn2qNBAmLrY-cwRQAKzorTdRYGCFv5+tw@mail.gmail.com>
Message-ID: <CAAOTY_9V+BFV0fCahzn2qNBAmLrY-cwRQAKzorTdRYGCFv5+tw@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:16=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>
> Some SoCs not support pre-multiplied pixel formats and extending
> configuration of OVL pre-multiplied color formats, such as MT8173.
>
> Fix the SoC degradation problem by this sreies.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> ---
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
> Jason-JH.Lin (3):
>   drm/mediatek: ovl: Remove the color format comment for
>     ovl_fmt_convert()
>   drm/mediatek: ovl: Add blend_modes to driver data
>   drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 44 ++++++++++++++++---
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 +++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 +++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
>  drivers/gpu/drm/mediatek/mtk_plane.c          | 15 +++----
>  drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
>  10 files changed, 76 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>
