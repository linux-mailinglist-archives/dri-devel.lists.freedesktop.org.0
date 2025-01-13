Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127AEA0B781
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4010E274;
	Mon, 13 Jan 2025 12:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Dy0k6PBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3741910E274
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736772661;
 bh=l5Yi6dDEY/SW8SVIP06gR3s9bTtz+F9A6zrpSwBrNTk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dy0k6PBF18AOmyn3UeO46HEbOcPjhLi4tKlmGaXxz3wjQ1Kn4XX8BWL4mqoAs3fU1
 fH6uGhumN1OnXXajFVFjoKWiA6ggJUGAX+F6rjImRWXuvLkWI5Q88E5wu3j4oq+yW5
 VianQ4HEe/WRpAWn9KSiLsRg6cCZJHmMHDp2OGBIM2l6F10pT2QRcUaigN4NavkfXZ
 5EDp6ICYiNdWnhry0i1uyM06Ls0I1EdoG+Anta98o0vLJbRG2FdKvirUvvyqAGKp36
 NlyyIBuc3LgY3tuujNDEp9CQNE+ME46PGQ6lMa8gFHxRa1boAtZOLPyKRZ3wl936ks
 aqup0t6zj6n0g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BF9317E04AC;
 Mon, 13 Jan 2025 13:51:00 +0100 (CET)
Message-ID: <09c87f13-477d-4721-b27d-f2f2e48f4f71@collabora.com>
Date: Mon, 13 Jan 2025 13:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Add Mediatek Soc DRM support for mt8196
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 10/01/25 13:33, paul-pl.chen ha scritto:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add support multiple mmsys instances in the one mediatek-drm instance.
> 

Hello Paul,

EXDMA, BLENDER and OUTPROC seem to have many things in common with the current
mtk_disp_ovl.c driver.

Please commonize code from mtk_disp_ovl to reuse in these three components that
you're adding, as there is a lot of code duplication.

Thanks,
Angelo

> Nancy.Lin (7):
>    soc: mediatek: add mmsys support for MT8196
>    soc: mediatek: mutex: add mutex support for MT8196
>    drm/mediatek: add EXDMA support for MT8196
>    drm/mediatek: add BLENDER support for MT8196
>    drm/mediatek: add OUTPROC support for MT8196
>    drm/mediatek: add ovlsys_adaptor support for MT8196
>    drm/mediatek: Add support for multiple mmsys in the one mediatek-drm
>      driver
> 
> Paul-pl.Chen (5):
>    dt-bindings: arm: mediatek: mmsys: add compatible for MT8196
>    dt-bindings: soc: mediatek: add mutex yaml for MT8196
>    dt-bindings: display: mediatek: add EXDMA yaml for MT8196
>    dt-bindings: display: mediatek: add BLENDER yaml for MT8196
>    dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +
>   .../display/mediatek/mediatek,blender.yaml    |  50 ++
>   .../display/mediatek/mediatek,exdma.yaml      |  77 ++
>   .../display/mediatek/mediatek,outproc.yaml    |  57 ++
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   2 +
>   drivers/gpu/drm/mediatek/Makefile             |   4 +
>   drivers/gpu/drm/mediatek/mtk_crtc.c           | 350 ++++++--
>   drivers/gpu/drm/mediatek/mtk_crtc.h           |   6 +-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 134 +++-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   6 +
>   drivers/gpu/drm/mediatek/mtk_disp_blender.c   | 352 ++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_blender.h   |  17 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  66 +-
>   drivers/gpu/drm/mediatek/mtk_disp_exdma.c     | 447 +++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_outproc.c   | 244 ++++++
>   drivers/gpu/drm/mediatek/mtk_disp_outproc.h   |  22 +
>   .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 758 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 287 ++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  28 +-
>   drivers/soc/mediatek/mt8196-mmsys.h           | 447 +++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c              | 204 ++++-
>   drivers/soc/mediatek/mtk-mmsys.h              |  18 +
>   drivers/soc/mediatek/mtk-mutex.c              | 233 +++++-
>   include/linux/soc/mediatek/mtk-mmsys.h        |  60 ++
>   include/linux/soc/mediatek/mtk-mutex.h        |   2 +
>   25 files changed, 3734 insertions(+), 142 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
>   create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h
> 



