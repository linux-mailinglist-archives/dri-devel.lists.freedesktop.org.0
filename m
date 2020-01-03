Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0312F44D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 06:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A496E17A;
	Fri,  3 Jan 2020 05:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C19546E17A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 05:36:40 +0000 (UTC)
X-UUID: 52bd52d058ed4a709500262764d35ca5-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=99ZrQnQ1iPB152bOaNM5TfX+bomBz2uWbjIND87FRX0=; 
 b=bNmoDG2KjrRD6lWcKpRTVJg/kt/Yho1u1KWN3Dz5wjOfZ0EIEP7OlCrZAOFcxVdPxHKC1GMPgrbju1gOQNbBLewoFoyun6mtKJETGiXd0LMEZcAyKsjZXPr6VP7k834pxjCVzS3Ft/1Uc5G6+7wo1GZeeGCG37rSrMUUCVSbu+4=;
X-UUID: 52bd52d058ed4a709500262764d35ca5-20200103
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 474371618; Fri, 03 Jan 2020 13:36:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 13:36:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 13:36:32 +0800
Message-ID: <1578029793.31107.5.camel@mtksdaap41>
Subject: Re: [RESEND PATCH v6 03/17] drm/mediatek: move dsi/dpi select input
 into mtk_ddp_sel_in
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 3 Jan 2020 13:36:33 +0800
In-Reply-To: <1578021148-32413-4-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
 <1578021148-32413-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DCF20F9DAAF3DBA7A01483A62A5004296DD1B8FCF4A251B8896B0FB66EF4AA542000:8
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

On Fri, 2020-01-03 at 11:12 +0800, Yongqiang Niu wrote:
> move dsi/dpi select input into mtk_ddp_sel_in
> DPI_SEL_IN_BLS is zero, it is same with hardware default setting,
> DISP_REG_CONFIG_DPI_SEL no need set when bls connect with
> dpi0

I think you have done two things in this patch. One is remove
DISP_REG_CONFIG_DPI_SEL setting, and the other is move
DISP_REG_CONFIG_DSI_SEL from mtk_ddp_sout_sel() to mtk_ddp_sel_in(). So
separate this into two patches.

Regards,
CK

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 39700b9..d66ce31 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -376,6 +376,9 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>  		*addr = DISP_REG_CONFIG_DSI_SEL;
>  		value = DSI_SEL_IN_BLS;
> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +		*addr = DISP_REG_CONFIG_DSI_SEL;
> +		value = DSI_SEL_IN_RDMA;
>  	} else {
>  		value = 0;
>  	}
> @@ -393,10 +396,6 @@ static void mtk_ddp_sout_sel(struct regmap *config_regs,
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
