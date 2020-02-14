Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D215E231
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EC76FB26;
	Fri, 14 Feb 2020 16:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE87D6FB19
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:22:29 +0000 (UTC)
X-UUID: 5c86b13085f6448bb26c2de4c3496cdc-20200215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jz50ovHuZ2AHAX6u5vv4PbRhypnsxyFahZczIki6Y+E=; 
 b=YFofNpbvXaSGOcwur6pHAuRri8d4esErOX8+TM0/XglRKiFQiwvWboVD0cVMZbcO4eEg2Bdu3tvLWNbuHdZoNaqJMwcHCdjwAIJky3BCpeSYZXezShWXG87N07MBXE51OUsM5wvD2SrQ7ifnP7mUs3ps5CjZZY0WwXbPVfnDd3Y=;
X-UUID: 5c86b13085f6448bb26c2de4c3496cdc-20200215
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1937256230; Sat, 15 Feb 2020 00:22:25 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 15 Feb 2020 00:21:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 15 Feb 2020 00:22:21 +0800
Message-ID: <1581697343.12471.4.camel@mtksdaap41>
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: move mmsys description to
 display
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Sat, 15 Feb 2020 00:22:23 +0800
In-Reply-To: <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-2-matthias.bgg@kernel.org>
 <1581662577.17949.3.camel@mtksdaap41>
 <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
 <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
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
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias & Enric:

On Fri, 2020-02-14 at 13:19 +0100, Enric Balletbo i Serra wrote:
> Hi CK,
> 
> On 14/2/20 11:01, Matthias Brugger wrote:
> > 
> > 
> > On 14/02/2020 07:42, CK Hu wrote:
> >> Hi, Matthias:
> >>
> >> On Thu, 2020-02-13 at 21:19 +0100, matthias.bgg@kernel.org wrote:
> >>> From: Matthias Brugger <mbrugger@suse.com>
> >>>
> >>> The mmsys block provides registers and clocks for the display
> >>> subsystem. The binding description should therefore live together with
> >>> the rest of the display descriptions. Move it to display/mediatek.
> >>>
> >>
> >> Yes, for the upstreamed driver, only display (DRM) use mmsys clock. For
> >> some MDP patches [1] in progress, MDP also use mmsys clock. So we just
> >> consider what's upstreamed now?
> > 
> 
> Let me jump into the discussion, and sorry if my question is silly because I'm
> just starting to look at this code.
> 
> IMO we should consider all the cases to find a proper fix on all this, and if
> MDP uses also mmsys clocks this approach will not work. I think the main problem
> here and the big question is what exactly is the MMSYS block, is an independent
> clock controller that provides clocks to DRM and other blocks? or is hardly tied
> to the DRM block in some way?
> 
> Could you give us a block schema on how the things are interconnected?
> 
> If is an independent clock controller I think there was a mistake when the first
> drm driver was pushed by using the compatible = "mediatek,mt8173-mmsys" as id
> for that driver.
> 

I correct my mistake first. In mt8173, mdp has already upstreamed [1].

There are many partitions in Mediatek SoC. mmsys is one of these
partition. There are many function blocks in mmsys such as OVL, RDMA,
RSZ, WROT, .... Some data routing between these blocks are fixed but
some are changeable. For application, we group them into display path
and mdp path. Clock gating register of these blocks are in the range of
0x14000000 ~ 0x14000fff. The routing control register of these blocks
are also in the range of 0x14000000 ~ 0x14000fff. So the control
function belong to mmsys partition but not belong to specific function
block would in the register range of 0x14000000 ~ 0x14000fff. I think
there could be two definition of mmsys device. One is that mmsys device
is the whole mmsys partiotion, so OVL, RDMA, ... would be sub device of
it. Another is that mmsys just control register of 0x14000000 ~
0x14000fff, so it's part of mmsys partition like OVL, RDMA, .....
Currently we define mmsys as the latter one. I've no idea how to map
mmsys into current Linux hardware category, but I think it is not just a
display device.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.6-rc1

Regards,
CK

> Thanks,
>  Enric
> 
> 
> > I'm not sure if I understand you correctly. Are you proposing to keep the
> > binding description in arm/mediatek?
> > 
> > Regards,
> > Matthias
> > 
> >>
> >> [1] https://patchwork.kernel.org/patch/11140747/
> >>
> >> Regards,
> >> CK
> >>
> >>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >>>
> >>> ---
> >>>
> >>> Changes in v7:
> >>> - move the binding description
> >>>
> >>> Changes in v6: None
> >>> Changes in v5: None
> >>> Changes in v4: None
> >>> Changes in v3: None
> >>> Changes in v2: None
> >>>
> >>>  .../bindings/{arm => display}/mediatek/mediatek,mmsys.txt         | 0
> >>>  1 file changed, 0 insertions(+), 0 deletions(-)
> >>>  rename Documentation/devicetree/bindings/{arm => display}/mediatek/mediatek,mmsys.txt (100%)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> >>> similarity index 100%
> >>> rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> >>> rename to Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
