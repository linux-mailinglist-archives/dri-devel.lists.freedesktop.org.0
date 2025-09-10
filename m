Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05CB518C9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0D410E2DF;
	Wed, 10 Sep 2025 14:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="IHYKNoZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E775B10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757513088; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VEkyJDxuAQfVsvKhIxBruPEvS+E+Faq6lkb8StCuTHDG4il/MJXRcIahNdDe1K9l5asGM6fNcHpp2dATLpTDdixJydv1Eav7Ciq7KRQ57d64AIcR9G9MzobjDNJWa735TFRzENggkAWdoogP0hXnRRQvmnhic10HgfMoJOI0qqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757513088;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QEeqIWIF/AD2zfk8ywdiI9kgEblpq8FH1YjniWeVCN4=; 
 b=P9BxtulcIUGD/6FoPkulfuuR84JV4Ri/6txauWEhPar814ZnGKTiquSh/essihNHEQbflrG4B1II2xYvbvqlCLvtwTc27q7uJsa6RzH4frCk8k+iYr2hMphCwl+2BMJFaXmesNFLrkU20dt2cWy9mIGCBaIpcPsipJH3cRPNWPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757513088; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=QEeqIWIF/AD2zfk8ywdiI9kgEblpq8FH1YjniWeVCN4=;
 b=IHYKNoZY4zf4ISQCHWYEleElg0zyYX0fAY3flK0zslYU4qZregRMacfv+qxcfwpQ
 1x+1iaYapTxzAjxF38sg0OhTVRo1GLDfKW55tsC3QwJKNIhZiomEvEjFNt5Ia3ldCpT
 ecLwFY4c1qFjQXhURNFG3nBQQ/aFvg2+LOYp7AEA=
Received: by mx.zohomail.com with SMTPS id 1757513084822538.2895524618148;
 Wed, 10 Sep 2025 07:04:44 -0700 (PDT)
Message-ID: <28049fe0-0ae7-4b40-9f95-1513e317547f@collabora.com>
Date: Wed, 10 Sep 2025 11:04:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-8-ariel.dalessandro@collabora.com>
 <20250821-wandering-vermilion-pigeon-b8c9f0@kuoka>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250821-wandering-vermilion-pigeon-b8c9f0@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Krzysztof,

On 8/21/25 3:50 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 02:12:55PM -0300, Ariel D'Alessandro wrote:
>> Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
>> engine) is missing the mediatek,gce-client-reg property. Add it and
> 
> Why is it missing? If the binding is complete, it cannot be missing...

Due to the following error:

$ make -j$(nproc) CHECK_DTBS=y mediatek/mt8173-elm.dtb
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
[...]
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000 
(mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match 
any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: 
http://devicetree.org/schemas/display/mediatek/mediatek,ufoe.yaml#

> 
>> update the example as well.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> index 61a5e22effbf2..ecb4c0359fec3 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> @@ -64,6 +64,14 @@ properties:
>>         - port@0
>>         - port@1
>>   
>> +  mediatek,gce-client-reg:
>> +    description: The register of client driver can be configured by gce with
>> +      4 arguments defined in this property, such as phandle of gce, subsys id,
>> +      register offset and size. Each GCE subsys id is mapping to a client
> 
> Don't explain what DT syntax is. We all know, so that's completely
> redundant description. Explain the purpose. Explain Arguments with sechema - items.

Although I agree with your suggestions, this is exactly how the rest of 
the Mediatek DT bindings describe this node. This patch is based on the 
other +20 files, which describe the node in the same way.

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

