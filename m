Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53521964F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 04:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DDD6E981;
	Thu,  9 Jul 2020 02:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C5016E981
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 02:39:43 +0000 (UTC)
X-UUID: 8b6858da3d20484fbd2bac7dfb5c6755-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GVIo4VsOj/fRhOA3I3T2Kp/4alllZZbEdvQH5u8PYno=; 
 b=LZ9n0rZUoa2AjpgtOBhqK4Ptc+JqGmAcUUON7qfM19xQAJ7OBCYUEYn1IksCF7C+qjq9HLGGRqKIJ43s2ADt2doZuPnz9n3cxJndS+17DzCQBp6exyAuFMiKyaUfxdedaECTH0evpyd3yMwqJ5m8G0CqLlBXlT3z99WaJJTLG0U=;
X-UUID: 8b6858da3d20484fbd2bac7dfb5c6755-20200709
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1375418577; Thu, 09 Jul 2020 10:39:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 10:39:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jul 2020 10:39:34 +0800
Message-ID: <1594262378.21095.3.camel@mtksdaap41>
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Thu, 9 Jul 2020 10:39:38 +0800
In-Reply-To: <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dennis,

Thanks for this patch.

It's better to send another tree for this patch.
Because this tree is only for soc/mediatek.

Please do not forget to add the dependency information.

Bibby

On Tue, 2020-07-07 at 23:45 +0800, Dennis YC Hsieh wrote:
> No need to clear event again since event always clear before wait.
> This fix depend on patch:
>   "soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api"
> 
> Fixes: 2f965be7f9008 ("drm/mediatek: apply CMDQ control flow")
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index c84e7a14d4a8..ba6cf956b239 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
>  		cmdq_pkt_finalize(cmdq_handle);
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
