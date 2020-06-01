Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A51EB65C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802B36E181;
	Tue,  2 Jun 2020 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC29589E59
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 02:41:19 +0000 (UTC)
X-UUID: ffb75a9db1e344dbaa7f25d2fc04a721-20200601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5OOtmndFogETs8MsnbhnGCSCp5lzPK/Ub28tiH9HSm4=; 
 b=D/a54sh9osEHpX5XVThxMncpCglXBCKrRh9zE44kXnu85UCznYciTAcSGelRgu4qi6W3+3Kmj3t+WWXP9A6fm4L3jbePDoQ2hAfuACLbPzSKs9I9leIMDKKikzb8JBeSXT5FP9Sm78jAN+yrspHh2CEiOLkUq5FJv7H6+87lq5A=;
X-UUID: ffb75a9db1e344dbaa7f25d2fc04a721-20200601
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2059801762; Mon, 01 Jun 2020 10:41:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 10:41:08 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 10:41:07 +0800
Message-ID: <1590979273.15486.0.camel@mtkswgap22>
Subject: Re: [PATCH v6] support gce on mt6779 platform
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 1 Jun 2020 10:41:13 +0800
In-Reply-To: <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 23F5E0BF1671CC4EE062D7B349A502EB7F010BB185DCAB11634C1C6C2FE40B6C2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jassi,

Thanks for your comment

On Sat, 2020-05-30 at 15:34 -0500, Jassi Brar wrote:
> On Thu, May 28, 2020 at 12:05 PM Dennis YC Hsieh
> <dennis-yc.hsieh@mediatek.com> wrote:
> >
> > This patch support gce on mt6779 platform.
> >
> > Change since v5:
> > - spearate address shift code in client helper and mailbox controller
> > - separate write_s/write_s_mask and write_s_value/write_s_mask_value so that
> >   client can decide use mask or not
> > - fix typo in header
> >
> > Change since v4:
> > - do not clear disp event again in drm driver
> > - symbolize value 1 to jump relative
> >
> > [... snip ...]
> >
> >
> >
> > Dennis YC Hsieh (16):
> >   dt-binding: gce: add gce header file for mt6779
> >   mailbox: cmdq: variablize address shift in platform
> >   mailbox: cmdq: support mt6779 gce platform definition
> >   mailbox: mediatek: cmdq: clear task in channel before shutdown
> >   soc: mediatek: cmdq: return send msg error code
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
> >  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   3 +-
> >  drivers/mailbox/mtk-cmdq-mailbox.c            | 101 ++++++--
> >  drivers/soc/mediatek/mtk-cmdq-helper.c        | 163 ++++++++++++-
> >  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h      |  10 +-
> >  include/linux/soc/mediatek/mtk-cmdq.h         | 125 +++++++++-
> >
> Please break the patchset into two. The lower mailbox related changes
> with soc changes on top.

Ok, I'll separate patches into two patchset, thanks.


Regards,
Dennis

> 
> thanks

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
