Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48517987F11
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF310EC2C;
	Fri, 27 Sep 2024 07:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sFZxV/xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1710EC2C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:02:26 +0000 (UTC)
X-UUID: 711e366a7c9e11ef8b96093e013ec31c-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=KhtQyrefSaqhSJzfUoA/J9/fh2qANj+W43YRxUZuX+Y=; 
 b=sFZxV/xMwDiMvGobRU1JZm9noSsIRRD6f12cT9MGhE0Vt6gX3NbjWyoTEoXCt8GhMJDvXHXjZFhc3uFKRfl1Vsdxq9WpEVsVr1MiQcG8XPB9A+itFlc6Al1om2XlgJxw81u1papC5tARdGLCkbPaRX8Eto6gjMWYYVQKP7cCuEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:924ae4d4-a6bc-4587-8123-3ac05e45ecf9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:61f0dad0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 711e366a7c9e11ef8b96093e013ec31c-20240927
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1549227480; Fri, 27 Sep 2024 15:02:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 15:02:19 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 27 Sep 2024 15:02:18 +0800
Message-ID: <cada4a75-4b2d-e1b6-bebc-ce15a13a288e@mediatek.com>
Date: Fri, 27 Sep 2024 15:02:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 5/5] dt-bindings: display: mediatek: dpi: Add mt8195
 support in power domains
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
 <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexandre
 Mergnat" <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, "Pablo
 Sun" <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
 <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-5-macpaul.lin@mediatek.com>
 <20240926-visible-harmonica-a7cda103ff70@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240926-visible-harmonica-a7cda103ff70@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.014300-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2oOwH4pD14DsPHkpkyUphL9MZm0+sEE9ms+zqOf/RM2rvFo
 ODtDoX2Qa8dzyZlF6/UhzQ5Mp0WQPT7dljlY/nlHSEQN/D/3cG6Vq+okl1rYDwDqzaYhcjeQLPv
 NvFI8A1X8iIBnP6y347s9OusH9JJyzB1CJ6qmdNrhuXUWQoMQtzQsOZ4mhPfZDO+DX+rUwfZjOk
 Y6jTBnQ10EtLM2oIeDMPuSmMtOM67I2RqSAXh33hlckvO1m+JcfLPKYyLDlAebKItl61J/ycnjL
 TA/UDoAoTCA5Efyn8CNo+PRbWqfRDsAVzN+Ov/stFRELSGgUUwRPXFwDjp7875XMMt8JxNIHRRl
 YMHNv0WZTXkb2/rFPg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.014300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A017A170104B5427D244883B62BFD51C539651236B943B919967563A14DF14A42000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/26/24 23:59, Conor Dooley wrote:
> On Thu, Sep 26, 2024 at 07:14:49PM +0800, Macpaul Lin wrote:
>> Add power domain binding to the mediatek DPI controller for MT8185.
> 
> This wording is confusing, no binding is being added here, you're just
> allowing one property.
> 
>> The dpi node in mt8195.dtsi was triggering a dtbs_check error:
>>    dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]
> 
> And while it is good to have the warning, it would be better to explain
> here that there are actually power domains, since the dts could be wrong
> here also.

Thanks for the reminder! After MediaTek's internal discussion, a new
patch v3 has been submitted. The details has been written in that patch.

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Since the new patch v3 use a different approach to update the DT Schema,
the "Acked-by:" tag has been dropped, please help to review the 
replacement v3 patch. Thanks!

>> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> Changes for v2:
>>   - Because of the corresponding dts fix has been reviewed with a Reviewed-by: tag.
>>     [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@mediatek.com/
>>     We still need this change to fix the 2 dtbs_check errors.
>>     So keeps no change here.
>>

Best regards,
Macpaul Lin
