Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168B6C44C3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8810E397;
	Wed, 22 Mar 2023 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9010E1C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:02:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LC2Kxw113141;
 Tue, 21 Mar 2023 07:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1679400140;
 bh=RmbmhgCa8+U7icS0fTHWPYo6SizfHxfnN91iZUtJfZE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ljW6YZMpmlmNCmaQLB49LKcQBk5fJMEEByQ8l4yAgLl7RUUme3ehc7E1aNTRfF7x2
 Uc3R4GOV7a2xmUnaG6w4ynP65EUfl0QDt39g1YKIRwjErGW/ob1mzdQ+8/LuXFqpDQ
 FLHZgH2AkrrawgZXtNVFos/8JzXgk7aieLNU1Nyg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LC2KoB031034
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Mar 2023 07:02:20 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 07:02:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 07:02:20 -0500
Received: from [172.24.145.160] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LC2CWj124142;
 Tue, 21 Mar 2023 07:02:13 -0500
Message-ID: <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
Date: Tue, 21 Mar 2023 17:32:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
 <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:20:06 +0000
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, jani.nikula@intel.com,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 a-bhatia1@ti.com, alexander.deucher@amd.com, yamonkar@cadence.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, tzimmermann@suse.de, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

On 17/03/23 18:08, Krzysztof Kozlowski wrote:
> On 16/03/2023 15:08, Jayesh Choudhary wrote:
>> From: Rahul T R <r-ravikumar@ti.com>
>>
>> Add no-hpd property to the bindings, to disable
>> hpd when not connected or unusable
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index b2e8bc6da9d0..69d381195218 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -57,6 +57,12 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  cdns,no-hpd:
> 
> There is already no-hpd property.
> 
>> +    type: boolean
>> +    description:
>> +      Set if the HPD line on the bridge isn't hooked up to anything or is
>> +      otherwise unusable.
> 
> It's the property of the panel, not bridge. Unless you want to say that
> bridge physically does not have HPD? Does it follow the standard in such
> case?

MHDP does have hpd. But the mhdp driver should handle the cases when the
hpd pin of bridge is not connected to that of the DP-connector. This is 
to add support for that. (optional property)

-Jayesh


> 
> Best regards,
> Krzysztof
> 
