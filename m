Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA0618A8D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 22:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9810E2DC;
	Thu,  3 Nov 2022 21:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B9B10E2D3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 21:28:08 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B5E7B6602962;
 Thu,  3 Nov 2022 21:28:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667510886;
 bh=Bo6jAy9n7EIhWM93CDe2w2Ldd+vTyxvumeVAJrhRaig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b0WJzCft7a5ZU1yL7SAlojfM2J+IppIcj0zQTcbb8pxyMVeyXLAVv3qWzQjUhxd0e
 P3q4fyK3Bm2btG0ROUqy0jkxR0SxW02pdciQQpSYXkrL60pupIlzUHbUtUUGYD+q5E
 q/5sSIdsFObiLXgH8pP9g67nLHAceARjocg06/z+uSuzorjo8+0irx1w+s2Xk7Ujcm
 UmmS0Bem2aJVxw0Ze2BZe9WXhdDxw/F4R69QT7KGNtdrOAv1QcRnFZLSqeFQuBsIeJ
 Al6WX/lm8O5B8VtxsP5Wswwi+gN6GUK1lOSG47tPrma/eorY5/VVKIYKEtnKmOBlUa
 P73ztZIw+DJpw==
Date: Thu, 3 Nov 2022 17:28:00 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v27 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20221103212800.43nxlxpconqkasvc@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032610.9217-7-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 11:26:09AM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Change-Id: I0501f3c80e78ec8279366cba9c137a2edd7a852e
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  61 ++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 129 ++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  50 +++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  78 ++++++------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  12 +-
>  6 files changed, 209 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 30dcb65d8a5a..ce5617ad04cb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
[..]
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> -			const enum mtk_ddp_comp_id *path, unsigned int path_len,
> +			const unsigned int *path, unsigned int path_len,

Hi Nancy,

why is 'enum mtk_ddp_comp_id' being changed to 'unsigned int' throughout this
patch? Was this intentional?

I saw that this change happened between v16 [1] and v17 [2], but I didn't see
any reply or mention about this in the commit message or cover letter.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220318142009.2796-21-nancy.lin@mediatek.com/
[2] https://lore.kernel.org/all/20220416020749.29010-20-nancy.lin@mediatek.com/
