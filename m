Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D93204BA6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3EC6E965;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id E68936E835
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:20:39 +0000 (UTC)
X-UUID: 82af9c77f88043cbae780eb636daedec-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=07tYpv6sMJHQf+tvadCHMvn5amb3rdKyfIHukvZDlGw=; 
 b=jZ2N6SOF5LuBOuDwW+kjUMCSgahI8ELSL4N7WXdkg6p1CuWw0crK+RkheLsxl4CKzDaCPxSR4hipuNvwL5lf4XUL0VNocvSedEIQdGUfZ0Ykeiuu6r898+8VKqgxQ9cDC1wdwUhsKGcBPUJJDE0T2YEHEVZMaq+EZ48WBoWdcW4=;
X-UUID: 82af9c77f88043cbae780eb636daedec-20200622
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 692640189; Mon, 22 Jun 2020 23:20:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 23:20:31 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 23:20:31 +0800
Message-ID: <1592839235.1307.1.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/11] support cmdq helper function on mt6779 platform
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 22 Jun 2020 23:20:35 +0800
In-Reply-To: <1592793655.11692.9.camel@mtksdaap41>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1592793655.11692.9.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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

Hi Bibby,


On Mon, 2020-06-22 at 10:40 +0800, Bibby Hsieh wrote:
> Hi, Dennis,
> 
> Please add "depends on patch: support gce on mt6779 platform" in cover
> letter. Thanks

ok will do, thanks


Regards,
Dennis


> 
> Bibby
> 
> On Sun, 2020-06-21 at 22:18 +0800, Dennis YC Hsieh wrote:
> > This patch support cmdq helper function on mt6779 platform,
> > based on "support gce on mt6779 platform" patchset.
> > 
> > 
> > Dennis YC Hsieh (11):
> >   soc: mediatek: cmdq: add address shift in jump
> >   soc: mediatek: cmdq: add assign function
> >   soc: mediatek: cmdq: add write_s function
> >   soc: mediatek: cmdq: add write_s_mask function
> >   soc: mediatek: cmdq: add read_s function
> >   soc: mediatek: cmdq: add write_s value function
> >   soc: mediatek: cmdq: add write_s_mask value function
> >   soc: mediatek: cmdq: export finalize function
> >   soc: mediatek: cmdq: add jump function
> >   soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
> >   soc: mediatek: cmdq: add set event function
> > 
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   3 +-
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 159 +++++++++++++++++++++--
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |   8 +-
> >  include/linux/soc/mediatek/mtk-cmdq.h    | 124 +++++++++++++++++-
> >  4 files changed, 280 insertions(+), 14 deletions(-)
> > 
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
