Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3B11C502
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7D6EC51;
	Thu, 12 Dec 2019 04:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 747FB6EC51
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 04:49:07 +0000 (UTC)
X-UUID: d8f23ae9e30540f2b273bd87852f6fe0-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E+WerAWO7LXcxAkqLk99bj1sr3WlUYbo9Q9kI8fEORY=; 
 b=IPUJTxwI2NNddllHMyhFySNdSF1bZRmbJz/aH5sxtX9jyyRd44Mj3teUXlS+8/PFMrAQBZBGCiDn6VwPsrrwrfeBOJvTgGP0CNsZitfo3H/5tv+JaMuBb92Nzj0Y7EdMg/JCv0NUb6qs6MK/ev3OiB2qRjTbpHQT/VP7lxDZObU=;
X-UUID: d8f23ae9e30540f2b273bd87852f6fe0-20191212
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1797774077; Thu, 12 Dec 2019 12:49:05 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 12:48:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 12:48:54 +0800
Message-ID: <1576126139.29693.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Check return value of
 mtk_drm_ddp_comp_for_plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 12 Dec 2019 12:48:59 +0800
In-Reply-To: <1574409521.12825.0.camel@mtksdaap41>
References: <20191118061806.52781-1-pihsun@chromium.org>
 <1574409521.12825.0.camel@mtksdaap41>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Pi-Hsun:

On Fri, 2019-11-22 at 15:58 +0800, CK Hu wrote:
> Hi, Pi-Hsun:
> 
> On Mon, 2019-11-18 at 14:18 +0800, Pi-Hsun Shih wrote:
> > The mtk_drm_ddp_comp_for_plane can return NULL, but the usage doesn't
> > check for it. Add check for it.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.5

Regards,
CK

> > 
> > Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index f80a8ba75977..4c4f976c994e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -310,7 +310,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >  
> >  		plane_state = to_mtk_plane_state(plane->state);
> >  		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -		mtk_ddp_comp_layer_config(comp, local_layer, plane_state);
> > +		if (comp)
> > +			mtk_ddp_comp_layer_config(comp, local_layer,
> > +						  plane_state);
> >  	}
> >  
> >  	return 0;
> > @@ -386,8 +388,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> >  			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
> >  							  &local_layer);
> >  
> > -			mtk_ddp_comp_layer_config(comp, local_layer,
> > -						  plane_state);
> > +			if (comp)
> > +				mtk_ddp_comp_layer_config(comp, local_layer,
> > +							  plane_state);
> >  			plane_state->pending.config = false;
> >  		}
> >  		mtk_crtc->pending_planes = false;
> > @@ -401,7 +404,9 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
> >  	struct mtk_ddp_comp *comp;
> >  
> >  	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -	return mtk_ddp_comp_layer_check(comp, local_layer, state);
> > +	if (comp)
> > +		return mtk_ddp_comp_layer_check(comp, local_layer, state);
> > +	return 0;
> >  }
> >  
> >  static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > 
> > base-commit: 5a6fcbeabe3e20459ed8504690b2515dacc5246f
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
