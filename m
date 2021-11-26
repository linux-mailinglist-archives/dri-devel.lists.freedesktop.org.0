Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3A45EA67
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 10:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAFF6E964;
	Fri, 26 Nov 2021 09:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A516E96A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 09:30:28 +0000 (UTC)
X-UUID: 264614e7fd8247dc9e698f2c1a2bfebe-20211126
X-UUID: 264614e7fd8247dc9e698f2c1a2bfebe-20211126
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2176569; Fri, 26 Nov 2021 17:30:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 17:30:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Nov 2021 17:30:20 +0800
Message-ID: <ebc219fff8a1956d9880b555154d92b6eaef9eea.camel@mediatek.com>
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
From: Flora.Fu <flora.fu@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>
Date: Fri, 26 Nov 2021 17:30:20 +0800
In-Reply-To: <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
 <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2021-10-23 at 08:49 -0700, Randy Dunlap wrote:
> Hi,
> 
> On 10/23/21 4:14 AM, Flora Fu wrote:
> > diff --git a/drivers/soc/mediatek/Kconfig
> > b/drivers/soc/mediatek/Kconfig
> > index d9bac2710494..074b0cf24c44 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -24,6 +24,24 @@ config MTK_APU_PM
> >   	  APU power domain shall be enabled before accessing the
> >   	  internal sub modules.
> >   
> > +config MTK_APU
> > +	tristate "MediaTek APUSYS Support"
> > +	select REGMAP
> > +	select MTK_APU_PM
> > +	select MTK_SCP
> > +	help
> > +	  Say yes here to add support for the APU tinysys. The tinsys
> > is
> 
> 	                                                       tinysys
> runs on
> 
> > +	  running on a micro processor in APU.
> 
> 	  a microprocessor in the APU.
> 
> > +	  Its firmware is load and boot from Kernel side. Kernel and
> > tinysys use
> 
> 	               is loaded and booted
> 
> > +	  IPI to tx/rx messages.
> 
> 	      to send/receive messages.
Ack. 

> > +
> > +config MTK_APU_DEBUG
> > +	tristate "MediaTek APUSYS debug functions"
> > +	depends on MTK_APU
> > +	help
> > +	  Say yes here to enalbe debug on APUSYS.
> 
> 	                  enable

Ack.
The tpyo will be fix in the next submission. 
Thanks for your review.

> 
> > +	  Disable it if you don't need them.
> 
> 

