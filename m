Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73398CC3C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 07:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DC510E1CE;
	Wed,  2 Oct 2024 05:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fdow3+SB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963A10E1CE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 05:01:49 +0000 (UTC)
X-UUID: 6845e3a4807b11efb66947d174671e26-20241002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=JQxog7SFEJHt2mTFpnbzFTmfnQuxrbS8mdNwid+sy78=; 
 b=fdow3+SBFNRvJU4hMemLdTk8gGrcs7BP2EmEq8oowGKhzgwKV6y5XK7vMeErjBnWmGGUHxX1PsGSyneyZzRjZAMjIvTNbak14+jrTfxURw1C6w4XbJ6ZgjvIs0NRDoHglZmmQTpWeGtizpQeHNaUbJQxiSxZzukCfi9MzvQBYsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:78f5ffda-b4ff-4b8d-9265-de8d59d91536, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:6db89018-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6845e3a4807b11efb66947d174671e26-20241002
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2034410093; Wed, 02 Oct 2024 13:01:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 13:01:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 2 Oct 2024 13:01:33 +0800
Message-ID: <a41bf3aa-812e-2234-cca8-c68a8420f9e4@mediatek.com>
Date: Wed, 2 Oct 2024 13:01:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
 <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexandre
 Mergnat" <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-2-macpaul.lin@mediatek.com>
 <8883c84d-8333-4b04-83b5-022be5b6153c@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <8883c84d-8333-4b04-83b5-022be5b6153c@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.179900-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2oNtKv7cnNXnSa1MaKuob8PofZV/2Xa0cK+UkTh6A/Dwdno
 quRwHY3BA5x6HN+sIJp31PcFav1MzrBAQLqGlKiv6/xAZojbl7dbAoaK+wS4jVThXWky81BHWYS
 8OrMR6Ddh9M64k1dYu8r9L0WloblybC1/2cudIH8ve6W+IORwrRxl385bjK8qBFepjP4Awbk1Hc
 Jp3+cWzRvbS1sPuc0r4/I+BK21AaKW0F2DMwRPmbEKX02srTXI0pVrZbbfikggcyGevtftJ6PFj
 JEFr+oloTCA5Efyn8CNo+PRbWqfRK6NVEWSRWyb+q79xy5JhPV9AN1RR7xHgxUc1EdkGQIHBVEe
 UwmLhxCRxDbvN0TdZ9Bo5imTamTbF97lgTik4vNK3RdBmL/Uwy3U7y2wGlJPpewvSdi7pYMM6XK
 FXY+j89UQ5D3w2Dm4IpaqxlxwyA44obSkgSym9A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.179900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5D4F0D16EEB72D54571CE1ADEE61674C0C722E78899534C30E5028FC934A423C2000:8
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



On 9/30/24 16:49, AngeloGioacchino Del Regno wrote:
> Il 26/09/24 13:14, Macpaul Lin ha scritto:
>> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
>> to an excessively long 'interrupts' property. The error message was:
>>

[snip]

>>
>> diff --git 
>> a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml 
>> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> index ea6b0f5f24de..fdd2996d2a31 100644
>> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> @@ -96,7 +96,8 @@ properties:
>>       maxItems: 1
>>     interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 5
>>     clocks:
>>       items:
>> @@ -210,6 +211,28 @@ allOf:
>>         required:
>>           - mediatek,larbs
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt8195-iommu-infra
>> +
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          description: |
> 
> Do you really need to keep the formatting?
> 
> If you rephrase that as:
> 
> The infra IOMMU in MT8195 has five banks: each features one set
> of APB registers for the normal world (set 0), one

Shouldn't we use a 'three' here?
Three APB register sets for the protected world 1, protected world 2,
and protected world 3.

> for the protected
> world (sets 1-3) and one for the secure world (set 4), and each set
> has its own interrupt. Therefore, five interrupts are needed.
> 
> ...you won't need the bar :-)

Thanks for the suggestion. The description has been moved to
top common property in v3, and v4,
hence the bar is still required to explain the
others SOCs. I'll try to rephrase the description for MT8195 also.

>> +            The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
>> +            Each bank has a set of APB registers corresponding to the
>> +            normal world, protected world 1/2/3, and secure world, 
>> respectively.
>> +            Therefore, 5 interrupt numbers are needed.
>> +          maxItems: 5
> 
> minItems: 5
> 
> Cheers,
> Angelo
> 
> 

Thanks
Macpaul Lin
