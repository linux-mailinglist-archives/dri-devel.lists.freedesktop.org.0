Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D912E1621A7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEBE6E149;
	Tue, 18 Feb 2020 07:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34A066E149
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 07:46:44 +0000 (UTC)
X-UUID: 729695ee8e884b638f224bd5a485de69-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g5TmMK5xtaVwCyccKk6B3PT0J4POGsB8eAQQZd7hA8o=; 
 b=HD7TFrvS6QC6Drlf77grZ51MNyFDbKjPzyk/JZWI7CRHiSbSg7oCO6b/oSx4fJoCbx0bk/AlUNiQyynHV+uoluE2iLBPc3LQp6P/N53YrOxpoGQ1dAAIy1Gb4munRdwCCMWiubHm07o1ARpMbctJt76bjdpObTDYTjfxy8IP++I=;
X-UUID: 729695ee8e884b638f224bd5a485de69-20200218
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 108004550; Tue, 18 Feb 2020 15:46:38 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 15:45:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 15:46:14 +0800
Message-ID: <1582011997.15399.1.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] drm/mediatek: add fb swap in async_update
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 18 Feb 2020 15:46:37 +0800
In-Reply-To: <1581566763.12071.1.camel@mtksdaap41>
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
 <20200213012353.26815-2-bibby.hsieh@mediatek.com>
 <1581566763.12071.1.camel@mtksdaap41>
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

On Thu, 2020-02-13 at 12:06 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Thu, 2020-02-13 at 09:23 +0800, Bibby Hsieh wrote:
> > Besides x, y position, width and height,
> > fb also need updating in async update.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> > Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > index d32b494ff1de..e084c36fdd8a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -122,6 +122,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> >  	plane->state->src_y = new_state->src_y;
> >  	plane->state->src_h = new_state->src_h;
> >  	plane->state->src_w = new_state->src_w;
> > +	swap(plane->state->fb, new_state->fb);
> >  	state->pending.async_dirty = true;
> >  
> >  	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
