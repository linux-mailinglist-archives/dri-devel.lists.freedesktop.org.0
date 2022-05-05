Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01D51CC06
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BB410E342;
	Thu,  5 May 2022 22:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F8C10E342
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:20:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 795391F40EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651789245;
 bh=IqgWrsQ7M1kiyWJK+KEWncQxxmyl40O17cMv2BeJAZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WINl7o4+WequxxSytUZt4txWZtOiVzMn8Oe/yw0ywq6gSVx8l6UxrDz3v0PpGlt6h
 UDitxFADuW19fZXUk/LzhWjSZwChusaokfIOVdXRSsgUprvXqPj9+sN1EJwgxueAdc
 OukGQCfmhJINyB7ZUJpneAtEaNF4dvpH2QC+lL3rXrSsUBosL08zBz6cPUdHd8p4xd
 cT2/UstKbK9OqDqqMn0QtVP/CaD8SkagtmZzuD+Mb1LTLangCsE9DGEfHyxdj/TD2+
 5x5tU/6u3gd7b7E/O12Lbkbb8xJmSvT4QwhrRHN8g7lusGir0xHHUoKh6HMYy/9lO4
 kOrFUb8fajxWQ==
Date: Thu, 5 May 2022 18:20:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v10, 16/17] media: mediatek: vcodec: support stateless
 VP9 decoding
Message-ID: <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
 <20220426100828.13429-17-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426100828.13429-17-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 06:08:27PM +0800, Yunfei Dong wrote:
> Add support for VP9 decoding using the stateless API,
> as supported by MT8192. And the drivers is lat and core architecture.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: George Sun <george.sun@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../media/platform/mediatek/vcodec/Makefile   |    1 +
>  .../vcodec/mtk_vcodec_dec_stateless.c         |   26 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2031 +++++++++++++++++
>  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>  6 files changed, 2061 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> 

...

> +		use_128 = !frame_is_intra && !vsi->frame.uh.last_frame_type;
> +		v4l2_vp9_adapt_coef_probs(pre_frame_ctx_helper,
> +					  counts_helper,
> +					  use_128,
> +					  frame_is_intra);

Hi Yunfei,

I'm getting

ERROR: modpost: "v4l2_vp9_adapt_noncoef_probs" [drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.ko] undefined!
ERROR: modpost: "v4l2_vp9_adapt_coef_probs" [drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.ko] undefined!

when building this series.

Adding
	select V4L2_VP9
to
	config VIDEO_MEDIATEK_VCODEC
solved the issue.

Thanks,
Nícolas
