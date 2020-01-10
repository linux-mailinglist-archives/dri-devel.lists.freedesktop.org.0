Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8663F136755
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 07:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057B26E98C;
	Fri, 10 Jan 2020 06:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E8346E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 06:19:57 +0000 (UTC)
X-UUID: 8ca12080878f42b4a5f4715cd583c413-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2hX33a9oKQvAaZtJ3NQ0cW54cICk0Docx++JIfjlN54=; 
 b=C1L+sKksrUCaSk1L4aeeOVIVRwEj1HUrt9aleg63TRWpo7VBpUS81ERuh3PNSUunD9Xu1wprIqEyvlTGUgv9u46+P+pc5ZtS6J/CrC9/cU+QCMQc5rn+h0O25Y2pUfHBO53nYFXa68rXi9isephJKUdMzm32vi13QPLKNVRvKQI=;
X-UUID: 8ca12080878f42b4a5f4715cd583c413-20200110
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 294544061; Fri, 10 Jan 2020 14:19:53 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 14:18:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 14:20:24 +0800
Message-ID: <1578637185.29400.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: check for comp->funcs
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 10 Jan 2020 14:19:45 +0800
In-Reply-To: <20200109072900.17988-1-hsinyi@chromium.org>
References: <20200109072900.17988-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-yi:

On Thu, 2020-01-09 at 15:29 +0800, Hsin-Yi Wang wrote:
> There might be some comp that doesn't have funcs, eg. hdmi-connector.
> Check for comp->funcs otherwise there will be NULL pointer dereference
> crash.
> 
> Fixes: bd3de8cd782b ("drm/mediatek: Add gamma property according to hardware capability")
> Fixes: 7395eab077f9 ("drm/mediatek: Add ctm property support")

Because the fixed patches are still in my tree, so I merge this patch
with the fixed patches in mediatek-drm-next-5.6 [1].

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is based on mediatek's drm branch:
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6
> 
> After
> https://patchwork.freedesktop.org/patch/344477/?series=63328&rev=59,
> there will also be funcs for hdmi-connector.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index fb142fcfc353..7b392d6c71cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -808,11 +808,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  		mtk_crtc->ddp_comp[i] = comp;
>  
> -		if (comp->funcs->ctm_set)
> -			has_ctm = true;
> +		if (comp->funcs) {
> +			if (comp->funcs->ctm_set)
> +				has_ctm = true;
>  
> -		if (comp->funcs->gamma_set)
> -			gamma_lut_size = MTK_LUT_SIZE;
> +			if (comp->funcs->gamma_set)
> +				gamma_lut_size = MTK_LUT_SIZE;
> +		}
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
