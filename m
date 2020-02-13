Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DB15B7FB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 04:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BDD6E161;
	Thu, 13 Feb 2020 03:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77A196E161
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 03:54:43 +0000 (UTC)
X-UUID: 37b24f8c41ef491abd919b4882b7a201-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AWHKi/bi0HkO6LeGddbfc6Yc3pqDeHpmuHU4Mk2li9M=; 
 b=UkKKLj5tzbNwYgYlmFqEGo/YfHOL9OuvekZyN/NKtmeL5yIZY/knOWoJmxtCoQAEhPGL2AYBp5v4YGRndrp1qXOfr7BuqWA5heOJDwFJb5VbXLbhnmZCtxtfpAfvvdXu++GfNHvmqt90Sj7HnQCvAMHEDooirPzggmyFy2jcHLw=;
X-UUID: 37b24f8c41ef491abd919b4882b7a201-20200213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 678038741; Thu, 13 Feb 2020 11:54:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 11:53:55 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 11:55:07 +0800
Message-ID: <1581566078.12071.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] drm/mediatek: add plane check in async_check function
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 13 Feb 2020 11:54:38 +0800
In-Reply-To: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
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
> MTK do rotation checking and transferring in layer check function,
> but we do not check that in atomic_check,
> so add back in atomic_check function.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 189744d34f53..d32b494ff1de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -81,6 +81,7 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>  					struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state;
> +	int ret;
>  
>  	if (plane != state->crtc->cursor)
>  		return -EINVAL;
> @@ -91,6 +92,11 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>  	if (!plane->state->fb)
>  		return -EINVAL;
>  
> +	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
> +				       to_mtk_plane_state(state));
> +	if (ret)
> +		return ret;
> +
>  	if (state->state)
>  		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
>  								state->crtc);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
