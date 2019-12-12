Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324811C4FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016689BF4;
	Thu, 12 Dec 2019 04:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29E7289BF4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 04:45:04 +0000 (UTC)
X-UUID: 5c6e78b48f0f4baa93065c0d74242cb1-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UCWp1N8gZKoS15JnTttPmlV5vpeES4YM/X1M4WTmQ4I=; 
 b=dSp84jht4+RIY6YFbcAXEPj3fmwXw/DmsQWtq8OG3w/u5JPEONyx03D6Nm3fHNBBNRl/OnjpOxodcRfyDZsPh1qg/I3nBUImOj4gp12T6BW/n1KqvKWcDt9fa+IxLAzVoYjLEcmh5Ci8sEKR1O0BY/UyEsGVxzmpcnHTuyBEAQU=;
X-UUID: 5c6e78b48f0f4baa93065c0d74242cb1-20191212
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 963950812; Thu, 12 Dec 2019 12:45:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 12:44:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 12:44:55 +0800
Message-ID: <1576125900.29693.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
From: CK Hu <ck.hu@mediatek.com>
To: Mark Yacoub <markyacoub@google.com>
Date: Thu, 12 Dec 2019 12:45:00 +0800
In-Reply-To: <20191211154901.176256-1-markyacoub@google.com>
References: <20191211154901.176256-1-markyacoub@google.com>
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mark:

On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> drm/mediatek: return if plane pending state is disabled.
> 
> If the plane pending state is disabled, call mtk_ovl_layer_off then
> return.
> This guarantees that that the state is valid for all operations when the
> pending state is enabled.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Suggested-by: Sean Paul <seanpaul@chromium.org>
> To: CK Hu <ck.hu@mediatek.com>
> To: dri-devel@lists.freedesktop.org
> Cc: Daniele Castagna <dcastagna@chromium.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 4a55bb6e2213..526b595eeff9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
>  	unsigned int src_size = (pending->height << 16) | pending->width;
>  	unsigned int con;
>  
> -	if (!pending->enable)
> +	if (!pending->enable) {
>  		mtk_ovl_layer_off(comp, idx);
> +		return;
> +	}
>  
>  	con = ovl_fmt_convert(ovl, fmt);
>  	if (idx != 0)
> @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
>  	writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
>  	writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
>  
> -	if (pending->enable)
> -		mtk_ovl_layer_on(comp, idx);
> +	mtk_ovl_layer_on(comp, idx);
>  }
>  
>  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
