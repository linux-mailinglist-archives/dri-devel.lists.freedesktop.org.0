Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C0273C85
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BEF6E821;
	Tue, 22 Sep 2020 07:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 21 Sep 2020 16:30:53 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6538E6E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:30:53 +0000 (UTC)
X-UUID: 4525052a9fc94ad78410c8aa92d2a3a3-20200922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wqur0A/O4zCVq+R1isOtEyenroFb1CxOmxqgph5t7K8=; 
 b=QKd/jSJrHQBWbNJbHDv/cRTkTgSNh2JEb4G1Hu0mGc4J+To8yClG33Thd1Pp/TielJ5SNhNKT4MgQ/Y/p8yiCbU6wkSUZ+TlPI3ydIJ3eXwywfEkmKXvebgW22XitMSobzHWcFM9osPE9WgPhChiuLEVcLAEmFbQEEELxysu+Lo=;
X-UUID: 4525052a9fc94ad78410c8aa92d2a3a3-20200922
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2094375674; Tue, 22 Sep 2020 00:25:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 00:25:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Sep 2020 00:25:43 +0800
Message-ID: <1600705544.26565.0.camel@mtkswgap22>
Subject: Re: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 22 Sep 2020 00:25:44 +0800
In-Reply-To: <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
 <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CF75B351C78BB23BFE95C06D5BB530850A195FB215A3BAA5AF935BDF06F4FA5B2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,


On Mon, 2020-09-21 at 18:19 +0200, Matthias Brugger wrote:
> 
> On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> > Add clear parameter to let client decide if
> > event should be clear to 0 after GCE receive it.
> > 
> > Change since v2:
> > - Keep behavior in drm crtc driver and
> >    separate bug fix code into another patch.
> 
> This, should go...
> 
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> 
> ...here :)
> 
> I fixed to commit message and pushed the patch to v5.9-next/soc

got it, thanks a lot


Regards,
Dennis

> 
> Thanks!
> 
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
> >   drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
> >   include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
> >   include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
> >   4 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index ec6c9ffbf35e..c84e7a14d4a8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> >   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> > +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
> >   		mtk_crtc_ddp_config(crtc, cmdq_handle);
> >   		cmdq_pkt_finalize(cmdq_handle);
> >   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index d55dc3296105..505651b0d715 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -316,15 +316,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >   }
> >   EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
> >   
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
> >   {
> >   	struct cmdq_instruction inst = { {0} };
> > +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
> >   
> >   	if (event >= CMDQ_MAX_EVENT)
> >   		return -EINVAL;
> >   
> >   	inst.op = CMDQ_CODE_WFE;
> > -	inst.value = CMDQ_WFE_OPTION;
> > +	inst.value = CMDQ_WFE_OPTION | clear_option;
> >   	inst.event = event;
> >   
> >   	return cmdq_pkt_append_command(pkt, inst);
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index efbd8a9eb2d1..d5a983d65f05 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -28,8 +28,7 @@
> >    * bit 16-27: update value
> >    * bit 31: 1 - update, 0 - no update
> >    */
> > -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> > -					CMDQ_WFE_WAIT_VALUE)
> > +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
> >   
> >   /** cmdq event maximum */
> >   #define CMDQ_MAX_EVENT			0x3ff
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 34354e952f60..960704d75994 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >   /**
> >    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >    * @pkt:	the CMDQ packet
> > - * @event:	the desired event type to "wait and CLEAR"
> > + * @event:	the desired event type to wait
> > + * @clear:	clear event or not after event arrive
> >    *
> >    * Return: 0 for success; else the error code is returned
> >    */
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >   
> >   /**
> >    * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
