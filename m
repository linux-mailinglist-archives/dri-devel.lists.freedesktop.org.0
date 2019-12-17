Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC212214D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 02:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BACE6E91E;
	Tue, 17 Dec 2019 01:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 237756E91E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 01:13:32 +0000 (UTC)
X-UUID: 1bec9715f5304e8ca62f630c635aaa65-20191217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7ltJbMO3G7a13yc8xMgGmW59Fe0DuYrtSAHbe2Yr1Ao=; 
 b=QO19j7mCpO5stgHnM2Y7wG5bS6rtArXufCKoqC1lGtSsvu/BvCpoL25es+GpqDcGgkDfi4r0lp6MHrhmzKjZSj2467UMz/GdU4mjCdKayJ70jYs5RfkFNmfvYfrKNR2gTqXg/A6zT0CxtDoiC5CGjBai5k+nrornpd6yXDZoJ7U=;
X-UUID: 1bec9715f5304e8ca62f630c635aaa65-20191217
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1057183478; Tue, 17 Dec 2019 09:13:29 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Dec 2019 09:12:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 09:13:29 +0800
Message-ID: <1576545207.7301.3.camel@mtksdaap41>
Subject: Re: [PATCH 05/10] drm/mediatek: plane_state->fb iff plane_state->crtc
From: CK Hu <ck.hu@mediatek.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 17 Dec 2019 09:13:27 +0800
In-Reply-To: <20191213172612.1514842-5-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-5-daniel.vetter@ffwll.ch>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9E43735D7213DE8234B685DBCE55081391D157A1DD971A7AE5DA8369C8620C062000:8
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel:

On Fri, 2019-12-13 at 18:26 +0100, Daniel Vetter wrote:
> Checking both is one too much, so wrap a WARN_ON around it to stope
> the copypasta.

Even though I don't know what is copypasta,

Acked-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 540ef2faa40a..f0b0325381e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -94,7 +94,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  	if (!fb)
>  		return 0;
>  
> -	if (!state->crtc)
> +	if (WARN_ON(!state->crtc))
>  		return 0;
>  
>  	ret = mtk_drm_crtc_plane_check(state->crtc, plane,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
