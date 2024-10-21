Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01E9A6912
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FCD10E4DD;
	Mon, 21 Oct 2024 12:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ovtOKHwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEFD10E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:50:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A420A4324D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D0EC4CEF4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729515056;
 bh=b+6l4BsUolOYut6i6SR1zP3LvfGX7ZQLtQzTjt4qRGU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ovtOKHwUMUU5R3hJLLt/7sG6YzDH+O6y7QU/0DhidpgciKmYe/+1y9YpKOv2Q16/f
 EFJ5eJS/bLxJkcUiu/GRQKiy9TgtKu+hi0+2ANoQPtCm2Sy0/mEfuQp7zBTrGDhq5C
 MYuMFH9GlvPBQELR9dIgyBU+yTCRFyiSH2XL8nwbATWxWGhozK9QvEs9vZWqt0xrkp
 6cWGrbcPXs+sVWtOG4tS17pqLDELylcDRPO4Koxr6BwTEKx62imR/+vqkC0hZa9lCe
 MRhRdnXTi1CrPgEUVRL3CRQA6QrM2WU7T9hAO9+kqL1WBV4PYmZBthO42sujbNO5dP
 ftN7PoGo8ukmw==
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71e592d7f6eso2811597b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWv52zJO0lTmqSdj8OSw9nAk64UF0z3h7E6c6DACXSgHTdXd+A7L8K+o/Ka8Q9o4XNIYOxDscbqdF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8LthsPmJd0pvnAfT9vHy7MWMe9triA/xoQncd0vGikhVWyHPc
 tjVxzpp0HxXPx/DdIvJ+Q4Tp4OhKtXHsHkhOQkCpDdpCn5IBaKJl7JPBp7UQe9ytgrNuSXOYRS8
 qo7+5s+mrqGdhCrzQlCq3697nqA==
X-Google-Smtp-Source: AGHT+IFZ1C5QqluT3ibMGY6cMrOFVa0OCrC4RfXKLBxeIAjailnBblIgy2YF9BWgyqZBpaECWwTu7rQPKp8us5XNm1o=
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id
 d2e1a72fcca58-71ea323b91dmr16025574b3a.24.1729515055229; Mon, 21 Oct 2024
 05:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Oct 2024 20:51:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__6CVfnCCMGnbrfi0qdp5qK73TzNLo6T+-+HxqAGYwP1w@mail.gmail.com>
Message-ID: <CAAOTY__6CVfnCCMGnbrfi0qdp5qK73TzNLo6T+-+HxqAGYwP1w@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] drm/mediatek: Add support for OF graphs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
 michael@walle.cc, sjoerd@collabora.com
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

For patch [1/3] and patch [3/3], applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B410=E6=9C=8817=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:=
38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Changes in v13:
>  - Added comment in commit description of patch [1/3] to warn about
>    new port scheme.
>  - The series is now fully reviewed, tested, hence *ready*.
>
> Changes in v12:
>  - Added comment to describe graph for OVL_ADAPTOR in patch [3/3]
>    as suggested by CK Hu.
>
> Changes in v11:
>  - Added OVL_ADAPTOR_MDP_RDMA to OVL Adaptor exclusive components list
>    to avoid failures in graphs with MDP_RDMA inside
>  - Rebased on next-20241004
>
> Changes in v10:
>  - Removed erroneously added *.orig/*.rej files
>
> Changes in v9:
>  - Rebased on next-20240910
>  - Removed redundant assignment and changed a print to dev_err()
>  - Dropped if branch to switch conversion as requested; this will
>    be sent as a separate commit out of this series.
>
> Changes in v8:
>  - Rebased on next-20240617
>  - Changed to allow probing a VDO with no available display outputs
>
> Changes in v7:
>  - Fix typo in patch 3/3
>
> Changes in v6:
>  - Added EPROBE_DEFER check to fix dsi/dpi false positive DT fallback cas=
e
>  - Dropped refcount of ep_out in mtk_drm_of_get_ddp_ep_cid()
>  - Fixed double refcount drop during path building
>  - Removed failure upon finding a DT-disabled path as requested
>  - Tested again on MT8195, MT8395 boards
>
> Changes in v5:
>  - Fixed commit [2/3], changed allOf -> anyOf to get the
>    intended allowance in the binding
>
> Changes in v4:
>  - Fixed a typo that caused pure OF graphs pipelines multiple
>    concurrent outputs to not get correctly parsed (port->id);
>  - Added OVL_ADAPTOR support for OF graph specified pipelines;
>  - Now tested with fully OF Graph specified pipelines on MT8195
>    Chromebooks and MT8395 boards;
>  - Rebased on next-20240516
>
> Changes in v3:
>  - Rebased on next-20240502 because of renames in mediatek-drm
>
> Changes in v2:
>  - Fixed wrong `required` block indentation in commit [2/3]
>
>
> The display IPs in MediaTek SoCs are *VERY* flexible and those support
> being interconnected with different instances of DDP IPs (for example,
> merge0 or merge1) and/or with different DDP IPs (for example, rdma can
> be connected with either color, dpi, dsi, merge, etc), forming a full
> Display Data Path that ends with an actual display.
>
> This series was born because of an issue that I've found while enabling
> support for MT8195/MT8395 boards with DSI output as main display: the
> current mtk_drm_route variations would not work as currently, the driver
> hardcodes a display path for Chromebooks, which have a DisplayPort panel
> with DSC support, instead of a DSI panel without DSC support.
>
> There are other reasons for which I wrote this series, and I find that
> hardcoding those paths - when a HW path is clearly board-specific - is
> highly suboptimal. Also, let's not forget about keeping this driver from
> becoming a huge list of paths for each combination of SoC->board->disp
> and... this and that.
>
> For more information, please look at the commit description for each of
> the commits included in this series.
>
> This series is essential to enable support for the MT8195/MT8395 EVK,
> Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
> and Chromebooks to co-exist without conflicts.
>
> Besides, this is also a valid option for MT8188 Chromebooks which might
> have different DSI-or-eDP displays depending on the model (as far as I
> can see from the mtk_drm_route attempt for this SoC that is already
> present in this driver).
>
> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> NIO-12L with both hardcoded paths, OF graph support and partially
> hardcoded paths, and pure OF graph support including pipelines that
> require OVL_ADAPTOR support.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add OF graph support for board path
>   dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
>   drm/mediatek: Implement OF graphs support for display paths
>
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  28 ++
>  .../display/mediatek/mediatek,aal.yaml        |  40 +++
>  .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
>  .../display/mediatek/mediatek,color.yaml      |  22 ++
>  .../display/mediatek/mediatek,dither.yaml     |  22 ++
>  .../display/mediatek/mediatek,dpi.yaml        |  25 +-
>  .../display/mediatek/mediatek,dsc.yaml        |  24 ++
>  .../display/mediatek/mediatek,dsi.yaml        |  27 +-
>  .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
>  .../display/mediatek/mediatek,gamma.yaml      |  19 ++
>  .../display/mediatek/mediatek,merge.yaml      |  23 ++
>  .../display/mediatek/mediatek,od.yaml         |  22 ++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
>  .../display/mediatek/mediatek,ovl.yaml        |  22 ++
>  .../display/mediatek/mediatek,postmask.yaml   |  21 ++
>  .../display/mediatek/mediatek,rdma.yaml       |  22 ++
>  .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  43 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 253 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
>  23 files changed, 712 insertions(+), 25 deletions(-)
>
> --
> 2.46.1
>
