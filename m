Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872417A0F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A86EB90;
	Thu,  5 Mar 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEF076E03C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 00:50:02 +0000 (UTC)
X-UUID: 16a3c3b4396f47f9ad509f0e2531cf64-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kKyBokw0nHSD5G4NnU/6ssdFSMmw3W6g132ZYmBRN8o=; 
 b=JmvWG41RARYZiVlIyy22bD+tS7VwPyYFsdlT7GUPj1HscQLMXU5tP5WPdYzXVCTV8EulJAWhPvnbC4ayDy45+22A5wg6NeY8kq2jN74Hdz0qXLvDSPXraYWVFJGho7TjHnBBDwtVc2wYWofm9Ut6OSVWUNjhYBSLP9yTQzS9fX4=;
X-UUID: 16a3c3b4396f47f9ad509f0e2531cf64-20200305
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 553839731; Thu, 05 Mar 2020 08:49:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 08:48:57 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 08:49:13 +0800
Message-ID: <1583369398.28558.1.camel@mtkswgap22>
Subject: Re: [PATCH v4 12/13] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 5 Mar 2020 08:49:58 +0800
In-Reply-To: <1583291126.1062.7.camel@mtksdaap41>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-13-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583291126.1062.7.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
 wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for your comment.

On Wed, 2020-03-04 at 11:05 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> > Add clear parameter to let client decide if
> > event should be clear to 0 after GCE receive it.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 2 +-
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 5 +++--
> >  include/linux/mailbox/mtk-cmdq-mailbox.h | 3 +--
> >  include/linux/soc/mediatek/mtk-cmdq.h    | 5 +++--
> >  4 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 7daaabc26eb1..4916a7f75d23 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -488,7 +488,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >  	if (mtk_crtc->cmdq_client) {
> >  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> > +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
> 
> There is always clear event before wait event, so there is no need to
> clear event after event is waited. So this should be
> 
> cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);

Ok, will fix in next version, thanks.


Regards,
Dennis


> 
> Regards,
> CK
> 
> >  		mtk_crtc_ddp_config(crtc, cmdq_handle);
> >  		cmdq_pkt_finalize(cmdq_handle);
> >  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index f27c67034880..4f767198d0fc 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -295,15 +295,16 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> >  
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
> >  
> >  	if (event >= CMDQ_MAX_EVENT)
> >  		return -EINVAL;
> >  
> >  	inst.op = CMDQ_CODE_WFE;
> > -	inst.value = CMDQ_WFE_OPTION;
> > +	inst.value = CMDQ_WFE_OPTION | clear_option;
> >  	inst.event = event;
> >  
> >  	return cmdq_pkt_append_command(pkt, inst);
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 3f6bc0dfd5da..42d2a30e6a70 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -27,8 +27,7 @@
> >   * bit 16-27: update value
> >   * bit 31: 1 - update, 0 - no update
> >   */
> > -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> > -					CMDQ_WFE_WAIT_VALUE)
> > +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
> >  
> >  /** cmdq event maximum */
> >  #define CMDQ_MAX_EVENT			0x3ff
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 1a6c56f3bec1..d63749440697 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -152,11 +152,12 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >  /**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> > - * @event:	the desired event type to "wait and CLEAR"
> > + * @event:	the desired event type to wait
> > + * @clear:	clear event or not after event arrive
> >   *
> >   * Return: 0 for success; else the error code is returned
> >   */
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >  
> >  /**
> >   * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
