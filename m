Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38812E275
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 06:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A789ABE;
	Thu,  2 Jan 2020 05:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8795D89ABE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 05:03:18 +0000 (UTC)
X-UUID: 85a4205535a8485fa0f63cd14d3ab35f-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=B9oImeZ40IpDKQMsA5+OevUOG/21QHxukfJzn2BEkvI=; 
 b=VrgzzEsR2xl8GEGgdAkOcQ3gEXP1Z/QNx0BMgrR0TGXAbYuf0OcLtP+cr3vhKVlrOKsGyNrCtEmKpKLkONBweRF2J6CP6GUhTcP8DIR/LPlV7reqIEj2rYUZbWZeHLDroEaM5CVdQHnPGibwrGyaiNAVePw4OhhjgQhVV7kSY5k=;
X-UUID: 85a4205535a8485fa0f63cd14d3ab35f-20200102
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2111093749; Thu, 02 Jan 2020 13:03:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 13:02:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:02:28 +0800
Message-ID: <1577941388.24650.2.camel@mtksdaap41>
Subject: Re: [PATCH v6, 02/14] drm/mediatek: move dsi/dpi select input into
 mtk_ddp_sel_in
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 2 Jan 2020 13:03:08 +0800
In-Reply-To: <1577937624-14313-3-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C9B08F994A7286C74E48B5B525F960C34C42DFAE9C3B659B0BFDC3F25B28B5952000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> move dsi/dpi select input into mtk_ddp_sel_in
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 39700b9..91c9b19 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -376,6 +376,12 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>  		*addr = DISP_REG_CONFIG_DSI_SEL;
>  		value = DSI_SEL_IN_BLS;
> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> +		*addr = DISP_REG_CONFIG_DSI_SEL;
> +		value = DSI_SEL_IN_RDMA;

In original code, this is set when cur == DDP_COMPONENT_BLS and next ==
DDP_COMPONENT_DPI0. Why do you change the condition?

Regards,
CK

> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +		*addr = DISP_REG_CONFIG_DPI_SEL;
> +		value = DPI_SEL_IN_BLS;
>  	} else {
>  		value = 0;
>  	}
> @@ -393,10 +399,6 @@ static void mtk_ddp_sout_sel(struct regmap *config_regs,
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>  		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
>  				BLS_TO_DPI_RDMA1_TO_DSI);
> -		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> -				DSI_SEL_IN_RDMA);
> -		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> -				DPI_SEL_IN_BLS);
>  	}
>  }
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
