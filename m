Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30E4CA4DC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380910EC5F;
	Wed,  2 Mar 2022 12:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309E410EC5F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zs30rfcp9Gy4eJZTj0VHE0zYlF+YvSpqPJY+NDZEYbQ=; b=UUTGwTkeNLZrsWztZAVHFKWbag
 mghQYTZlvPjb4FN4MLAnP6GihRzwI+TJBnDNClIiajEHBC7JdWRUYGLHfi6TxGllLez/0oIIAJU8K
 q7YHlVx9JkDBJLAOZXnHujwAED4tjQDplKkOaPng/B60rGnXAqtXztQq9iaJGjAjWOsi7XUM3SKKr
 iPP8zgnmXrJ40CLUIrmGb852hMqt7ItWxEPzbXzRRQbV8cny5ANiwfQKpHwlljH17brygcWa4K71o
 0AbKmnfOw/QUhc99QJiKykKala7dZO/LplW+jorpooSnXx2jkI/Zq0Ak+e6AYaGG+yBwb+3G0BxZ6
 AJc2KK1Q==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nPO8x-00023j-D7; Wed, 02 Mar 2022 14:31:47 +0200
Message-ID: <3466cb33-7f5c-7b57-85f8-387e93516432@kapsi.fi>
Date: Wed, 2 Mar 2022 14:31:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 1/9] dt-bindings: host1x: Add iommu-map property
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
 <20220301161455.4037062-2-cyndis@kapsi.fi>
 <4a748c85-4fdb-0c10-19d8-0379b9e42ab5@arm.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <4a748c85-4fdb-0c10-19d8-0379b9e42ab5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/22 20:12, Robin Murphy wrote:
> On 2022-03-01 16:14, cyndis@kapsi.fi wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Add schema information for specifying context stream IDs. This uses
>> the standard iommu-map property.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v3:
>> * New patch
>> v4:
>> * Remove memory-contexts subnode.
>> ---
>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> index 4fd513efb0f7..0adeb03b9e3a 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> +++ 
>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> @@ -144,6 +144,11 @@ allOf:
>>           reset-names:
>>             maxItems: 1
>> +        iommu-map:
>> +          description: Specification of stream IDs available for 
>> memory context device
>> +            use. Should be a mapping of IDs 0..n to IOMMU entries 
>> corresponding to
> 
> Nit: maybe "context IDs 0..n" for maximum possible clarity?

I left it at "IDs" since there is no "context ID" or similar concept in 
the hardware, so I thought to leave it just as a kind of an 'abstract ID 
as used in iommu-map property'.

> 
> Either way, though, I'm happy that if the simplest and most 
> straightforward approach works, then it's the best choice.

I am happy as well, this is certainly much cleaner than the mess in the 
downstream driver :)

> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> Cheers,
> Robin.

Thanks!
Mikko

> 
>> +            usable stream IDs.
>> +
>>         required:
>>           - reg-names

