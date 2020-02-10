Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3C4156DBD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 03:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FF16E10E;
	Mon, 10 Feb 2020 02:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 039496E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 02:53:11 +0000 (UTC)
X-UUID: 669d501fcfcc4530a26b11203217b0ac-20200210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W9H3gUT21gGxakLPlN7C+OdzFLN/Tl44T7eG40NyIp0=; 
 b=Lae74vM2lIGTQnPzJo/fh/ko34RNSZ4n9XoVN6pkcEpVpsT8Ii2WMVvVkuXVdCpP9TvwJ+CWzxE2MbQJML09lHlOdQvbVglMlbQAJ7F4sD/CvODLq3Rk+MxiTpMuIMSb5vg2EWrkxHetweCevm8ifcFM4eJoclnBBGmRgkvvK8E=;
X-UUID: 669d501fcfcc4530a26b11203217b0ac-20200210
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 77091319; Mon, 10 Feb 2020 10:53:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 10:52:25 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 10 Feb 2020 10:52:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Feb 2020 10:53:24 +0800
Message-ID: <1581303187.951.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
From: CK Hu <ck.hu@mediatek.com>
To: Evan Benn <evanbenn@chromium.org>
Date: Mon, 10 Feb 2020 10:53:07 +0800
In-Reply-To: <1581064499.590.0.camel@mtksdaap41>
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
 <1581064499.590.0.camel@mtksdaap41>
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

Hi, Evan:

On Fri, 2020-02-07 at 16:34 +0800, CK Hu wrote:
> Hi, Evan:
> 
> On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> > The cursor and primary planes were hard coded.
> > Now search for them for passing to drm_crtc_init_with_planes
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> 
> > Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 7b392d6c71cc..935652990afa 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> >  
> >  static int mtk_drm_crtc_init(struct drm_device *drm,
> >  			     struct mtk_drm_crtc *mtk_crtc,
> > -			     struct drm_plane *primary,
> > -			     struct drm_plane *cursor, unsigned int pipe)
> > +			     unsigned int pipe)
> >  {
> > -	int ret;
> > +	struct drm_plane *primary = NULL;
> > +	struct drm_plane *cursor = NULL;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > +		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> > +			primary = &mtk_crtc->planes[i];
> > +		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> > +			cursor = &mtk_crtc->planes[i];
> > +	}
> >  
> >  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> >  					&mtk_crtc_funcs, NULL);
> > @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  			return ret;
> >  	}
> >  
> > -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> > -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> > -				NULL, pipe);
> > +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> >  	if (ret < 0)
> >  		return ret;
> >  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
