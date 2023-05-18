Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE7707CE2
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 11:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE87810E4EF;
	Thu, 18 May 2023 09:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B410E4EF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 09:30:08 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 458946605861;
 Thu, 18 May 2023 10:30:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684402206;
 bh=epaDxPUKGiUHtcaIMP9idK9r5/SmG+H5QBtTlJTabkA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xjk6dQScD/4Lqb4N1yvNXuHLgxgcEni4Air2wJNCcrLCEja5mSdgEwLTDHw/f+98N
 2ABmSe8hkXaXnvPfiQViffbOdMc5wJ5mR/HEvtRnVOBkr7UiRMrf6rWI+vB6EI5uhq
 JAU5Kwma1Cxd/xSjMEEqTLKpc2T9yR3Z0lclVStyEdg5r18USJBk6p5XaNhnjjMQ6U
 qZG8ChlKhEVQJLHCbiwZ6bOp/qOpKaeXKSLjyxmUtYQdJtk0lpwGSsgZIsBx4aynaq
 3fBycQsd2qYcTTjzOhv/x/6Vt5IWfpoLGEQdnOdAwRg9mX2juKhMHg9tj+IeVw5leF
 16uRSYz3z3c1Q==
Message-ID: <baee4956-b346-9009-2e60-200a64bad80e@collabora.com>
Date: Thu, 18 May 2023 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230509150737.8075-1-jason-jh.lin@mediatek.com>
 <20230509150737.8075-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230509150737.8075-3-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/05/23 17:07, Jason-JH.Lin ha scritto:
> Add DSI as main display output for mt8188 vdosys0.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 5 +++++
>   drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 72c57442f965..bf06ccb65652 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -48,6 +48,7 @@ int mtk_dpi_encoder_index(struct device *dev);
>   
>   void mtk_dsi_ddp_start(struct device *dev);
>   void mtk_dsi_ddp_stop(struct device *dev);
> +int mtk_dsi_encoder_index(struct device *dev);

unsigned int mtk_dsi_encoder_index(...)

Regards,
Angelo


