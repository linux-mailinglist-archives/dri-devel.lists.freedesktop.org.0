Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3604BDA8D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 16:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870DA10E66A;
	Mon, 21 Feb 2022 15:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92B10E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=39hEWI5ykW2xTu9qYH3mEsqlbBMc93sCIWzdG3PM79U=; b=SenHRLjvOak/rcb28LFF5Xyck4
 3sbbSpzR+X1YoOQS0OPQu1XKj+4nHuEJbLTCVCBznr7MhFKcP6CG7+uxI/YmvjcKdP4r7eYwAT/fj
 tfbGVcThnbdKpofa7QogS6a7Hipu0wg3tLvFwXs5rXVY1eNE1ggkNOk4OCA5nM2Q0k2IDR+rb1Dtn
 TXIHsyPnvb/TQRDTlRp5MgmGJas3gPFfWkaFZKa5Qcx+HejlHjxYMp5Xv2gKTThZ2eYH88oLTaUQo
 NLhLSVAPYx8pp7knTJlNTB4+UfrMe8ZwpK74wKgAt9h2fhktuK3TpYdRUFA70R3UhVEC30vIia9A7
 tx/qtwwA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMAcB-0003g1-TC; Mon, 21 Feb 2022 17:28:39 +0200
Message-ID: <2e9c4ea5-6bbd-9724-0f4e-ed25f7294aa2@kapsi.fi>
Date: Mon, 21 Feb 2022 17:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 1/9] dt-bindings: host1x: Add memory-contexts property
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-2-mperttunen@nvidia.com>
 <48ac567b-37e8-1fa2-c389-536e276fdd2c@arm.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <48ac567b-37e8-1fa2-c389-536e276fdd2c@arm.com>
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
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 17:23, Robin Murphy wrote:
> On 2022-02-18 11:39, Mikko Perttunen via iommu wrote:
>> Add schema information for the memory-contexts property used to
>> specify context stream IDs. This uses the standard iommu-map property
>> inside a child node.
> 
> Couldn't you simply make "iommu-map" an allowed property on the host1x 
> node itself? From a DT perspective I'm not sure the intermediate node 
> really fits meaningfully, and I can't see that it serves much purpose in 
> practice either, other than perhaps defeating fw_devlink.
> 
> Robin.

The stream IDs described here are not used by the host1x device itself, 
so I don't think I can. Host1x's memory transactions still go through 
the stream ID specified in its 'iommus' property, these stream IDs are 
used by engines (typically in addition to the stream ID specified in 
their own nodes).

Host1x 'iommus' -- Channel commands
Engine 'iommus' -- Engine firmware (and data if context isolation is not 
enabled)
memory-contexts 'iommu-map' -- Data used by engines.

(Perhaps I should add this information to various places in more 
abundance and clarity.)

Mikko

> 
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v3:
>> * New patch
>> ---
>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> index 4fd513efb0f7..3ac0fde54a16 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> +++ 
>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml 
>>
>> @@ -144,6 +144,16 @@ allOf:
>>           reset-names:
>>             maxItems: 1
>> +        memory-contexts:
>> +          type: object
>> +          properties:
>> +            iommu-map:
>> +              description: Specification of stream IDs available for 
>> memory context device
>> +                use. Should be a mapping of IDs 0..n to IOMMU entries 
>> corresponding to
>> +                usable stream IDs.
>> +          required:
>> +            - iommu-map
>> +
>>         required:
>>           - reg-names

