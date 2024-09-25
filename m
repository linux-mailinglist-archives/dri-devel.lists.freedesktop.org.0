Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE79852D3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 08:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDC810E791;
	Wed, 25 Sep 2024 06:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Nb9FQ3pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F40110E791
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 06:18:32 +0000 (UTC)
X-UUID: f9efa50e7b0511ef8b96093e013ec31c-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=k9sz9F33oYRkRDljM840h89ujFz6JH+m4NCRZgOqIbc=; 
 b=Nb9FQ3pZd7R57M3QBb0IvShsKUkFOEYWmOdm21WwZik4fMn8qDMaLhtlohyJW3S0E/V736xpVDQzcN3tdo3N3umWZGhuTkw+VWgBDs42B7h4P0sJLIhgScpumNl7iqhCoAsLZu9uLXn3gldGeojGyYUR4cdSRJeKotKTMaUSn3I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:ba5166c2-c6b9-4237-a9b7-7b727fd9cf1f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:82cd3718-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f9efa50e7b0511ef8b96093e013ec31c-20240925
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 329252572; Wed, 25 Sep 2024 14:18:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 14:18:14 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 25 Sep 2024 14:18:14 +0800
Message-ID: <aca569b8-6867-ae9f-0746-021696b801fe@mediatek.com>
Date: Wed, 25 Sep 2024 14:18:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, <friday.yang@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
 <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
 <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu
 <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, "MediaTek
 Chromebook Upstream" <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-2-macpaul.lin@mediatek.com>
 <20240924-haiku-drudge-79e5824d4b6f@spud>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20240924-haiku-drudge-79e5824d4b6f@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.588500-8.000000
X-TMASE-MatchedRID: QfHZjzml1E8OwH4pD14DsPHkpkyUphL9BGvINcfHqhdb6PBUqmq+UvQU
 BVrvaj2GVqzxHEDTg4yCIO7cu5PDkZShxRaS8Dn1EhGH3CRdKUUS12tj9Zvd8zRCaZSKE/Osl0B
 rH8BQUYUhXi7xgp14q38pRfXsZjabnEpyfsnNrVIzw5Ejs3g1lqIf1lfNT7ZiVxk27EKh25I+C9
 E+fi6GeW7movz4+rjW78PdD37e4xy4aCSQ7hdJ78xmTzofEWOOazzS+36ix9ybKItl61J/ycnjL
 TA/UDoAA6QGdvwfwZZWRVlrjsKO8N0H8LFZNFG7CKFCmhdu5cXEsTcv4IYmcFuCpxJB4M3gJq70
 pWlFtQWWbNCyNAdblyX6zonwXAPVNJ30o4E0TPxXF3PdlZlUCc0/jHJTVScj1iM9jSWVg5985c/
 x1FQodgevtLgqnPLci7PEd0wIBlEj2EMHngcSkJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.588500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BF41B72D588AEB07E4AC90B862252831A27D922EF92665FEF4C9BB815DD795142000:8
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


On 9/25/24 00:02, Conor Dooley wrote:
> On Tue, Sep 24, 2024 at 06:31:52PM +0800, Macpaul Lin wrote:
>> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
>> to an excessively long 'interrupts' property. The error message was:
>>
>>    infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>>                       [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>>                       is too long
>>
>> To address this issue, add "minItems: 1" and "maxItems: 5" constraints to
>> the 'interrupts' property in the DT binding schema. This change allows for
>> flexibility in the number of interrupts for new SoCs
>>
>> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
>>
> 
> This space should be removed.

Thanks! Will fix it in the next version.

>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> index ea6b0f5f24de..a00f1f0045b1 100644
>> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> @@ -96,7 +96,8 @@ properties:
>>       maxItems: 1
>>   
>>     interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 5
> 
> You need to add an items list here, and probably some per compatible
> constraints. What are each of the itnerrupts for?
> 

According to Friday Yang's comment,
The IOMMU of MT8195 has 5 banks: 0/1/2/3/4. Each bank has a set of APB 
registers
corresponding to the normal world, protected world 1/2/3,
and secure world, respectively.
Therefore, 5 interrupt numbers are needed.

>>   
>>     clocks:
>>       items:
>> -- 
>> 2.45.2
>>

Will try to fix it and add some description for MT8195.
I think this patch could be split as a separated patch from the origin
patch set. It'll take some time to refine the patch.

Thanks
Macpaul Lin
