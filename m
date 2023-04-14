Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938256E2686
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4007410E19B;
	Fri, 14 Apr 2023 15:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B910E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:12:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EFCHJF077435;
 Fri, 14 Apr 2023 10:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1681485137;
 bh=sabeTHkQDQrhTPIrzTovgdgptWvz7jd3RREg+U2Jruk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Jabkhs44SdpSF4e5xAZ0iNbAYPfVL5BeGqrgpmgb7FZLnb7+JSe8xt56tstytnpav
 EyWFe0jVrdiTLsN9CAjlOQTp4Wkhw9Ygi4/VX55NhCBo7sj4TmEBHm2jhtuoaC7wll
 kVW2WzGLfJ+sAfg55qB5A79MZ+ZlGOfd1YS/JNB4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EFCH46000680
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Apr 2023 10:12:17 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 10:12:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 10:12:16 -0500
Received: from [172.24.145.152] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EFC9GH024822;
 Fri, 14 Apr 2023 10:12:09 -0500
Message-ID: <e9d1031f-fb31-5a29-2bb0-ceeefe9d1a37@ti.com>
Date: Fri, 14 Apr 2023 20:42:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-2-j-choudhary@ti.com>
 <6ba8bbcf-0d72-4bb9-a014-85e9f3e22cdb@linaro.org>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <6ba8bbcf-0d72-4bb9-a014-85e9f3e22cdb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yamonkar@cadence.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/04/23 11:36, Krzysztof Kozlowski wrote:
> On 05/04/2023 16:24, Jayesh Choudhary wrote:
>> From: Rahul T R <r-ravikumar@ti.com>
>>
>> The mhdp bridge can work without its HPD pin hooked up to the connector,
>> but the current bridge driver throws an error when hpd line is not
>> connected to the connector. For such cases, we need an indication for
>> no-hpd, using which we can bypass the hpd detection and instead use the
>> auxiliary channels connected to the DP connector to confirm the
>> connection.
>> So add no-hpd property to the bindings, to disable hpd when not
>> connected or unusable.
> 
> Your subject prefixes miss device specific part. You do not add no-hpd
> to all bridges.
> 
> It's also not drm. It is a display directory.

Sorry messed the commit heading. Will fix it.

> 
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e..3a6c6d837593 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -57,6 +57,12 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  cdns,no-hpd:
> 
> No improvements - use existing no-hpd name.
> 
> 

Okay will change it to "no-hpd"

> 
> Best regards,
> Krzysztof
> 
