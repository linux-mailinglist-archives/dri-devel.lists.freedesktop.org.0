Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C529356E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 09:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC86F420;
	Tue, 20 Oct 2020 07:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C58F96EBFE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 02:34:24 +0000 (UTC)
X-UUID: 680b7d3e367349aab9d080b2064a0d36-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GUA1hbpU/msavICMu4ZyZUeoilqfTnK1HnnKU2S01BA=; 
 b=lNdYo+NogUdsjYDTXcmU71GYt71aAd2j9xbMzUWIWwFdi/cuzBZeAwa7+sHFjzhf55Q9zQUI4dmBrE9HTEjxCYZ8Dq2J8FpXnbAhJVQaApmXag8S+JOmX2aaPjlxHqsn/Qz/likmejM72/SFsqGH/JhQ0+sR9QgV4BnqVOAlGvw=;
X-UUID: 680b7d3e367349aab9d080b2064a0d36-20201020
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1918381547; Tue, 20 Oct 2020 10:34:22 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:34:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:34:04 +0800
Message-ID: <1603161244.29336.142.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:34:04 +0800
In-Reply-To: <20201016170552.GA1580710@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
 <20201016170552.GA1580710@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 204DA36F181E521CDF8CC1E6221ACDE0FAA6F121DEDB71CF4B5AED7B259FEB042000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 20 Oct 2020 07:05:14 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-10-16 at 12:05 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> > Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: modify description and compatible
> > ---
> >  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
> >  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
> >  2 files changed, 263 insertions(+), 162 deletions(-)
> >  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> 
> Also, need to fix the mode.
Ok, thanks

> 
> >  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
