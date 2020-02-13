Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657415B817
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 05:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2706E165;
	Thu, 13 Feb 2020 04:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BFEB6E165
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 04:06:07 +0000 (UTC)
X-UUID: ee66a7eda1314322a27b7f3b6a4c3a53-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s7mv4CulVo+FKLuN0ptbU/bnthf97z5/e/fjB5FwBns=; 
 b=kpmybhKQdM0UuTLo2W31uMP2MXKOgUW6qFXVCLD8g9hYUPgRq1a5MzCMfTo2gk8oZe7QyWjUUeonCu3vb5uXLs56Cipt2n8q4cnOxWEs0dIhzo48JcQjuduupD631NO9RAuLWnyzTqXh9iPvBO5wZTdNvL9L61DrbVCUPz+wIuI=;
X-UUID: ee66a7eda1314322a27b7f3b6a4c3a53-20200213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 409715423; Thu, 13 Feb 2020 12:06:05 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 12:06:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 12:05:00 +0800
Message-ID: <1581566763.12071.1.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] drm/mediatek: add fb swap in async_update
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 13 Feb 2020 12:06:03 +0800
In-Reply-To: <20200213012353.26815-2-bibby.hsieh@mediatek.com>
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
 <20200213012353.26815-2-bibby.hsieh@mediatek.com>
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bibby:

On Thu, 2020-02-13 at 09:23 +0800, Bibby Hsieh wrote:
> Besides x, y position, width and height,
> fb also need updating in async update.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index d32b494ff1de..e084c36fdd8a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -122,6 +122,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>  	plane->state->src_y = new_state->src_y;
>  	plane->state->src_h = new_state->src_h;
>  	plane->state->src_w = new_state->src_w;
> +	swap(plane->state->fb, new_state->fb);
>  	state->pending.async_dirty = true;
>  
>  	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);

-- 
CK Hu <ck.hu@mediatek.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
