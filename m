Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58686C44C4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823AB10E89A;
	Wed, 22 Mar 2023 08:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB26B10E196
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:28:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LESQ3k015761;
 Tue, 21 Mar 2023 09:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1679408906;
 bh=turgaoA9Ps4HYc5Mt71Um0EHMFBvj+SVE4LLMNT2DvA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Na8LYsDCy7RuAmRlYZtcLqN7GyZVuXDfCqqy4G/VWVV+/YzCXGOLGNUTlqGHMhy3J
 SKi7nn7XLeJRuYuJ0Lapk0WqdxR8l4nQvHez1hJQojpn2PLlNXH2j2cCceIYf68tjq
 gcBzxA9t/f8IpzhnKuLMXmx4E9+hgNXlTxE0K0/A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LESQqO130105
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Mar 2023 09:28:26 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 09:28:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 09:28:26 -0500
Received: from [172.24.145.160] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LESJH6002836;
 Tue, 21 Mar 2023 09:28:19 -0500
Message-ID: <d72bf0df-28d7-6419-56a5-58e04dcb30f2@ti.com>
Date: Tue, 21 Mar 2023 19:58:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
 <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
 <79ce5fe8-9fb0-5caa-67a0-87dee7867856@ti.com>
 <55cfacf6-03e0-b9bc-83f3-3e9f2d7b2d4d@linaro.org>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <55cfacf6-03e0-b9bc-83f3-3e9f2d7b2d4d@linaro.org>
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



On 21/03/23 18:08, Krzysztof Kozlowski wrote:
> On 21/03/2023 13:02, Jayesh Choudhary wrote:
>>>
>>>> +    type: boolean
>>>> +    description:
>>>> +      Set if the HPD line on the bridge isn't hooked up to anything or is
>>>> +      otherwise unusable.
>>>
>>> It's the property of the panel, not bridge. Unless you want to say that
>>> bridge physically does not have HPD? Does it follow the standard in such
>>> case?
>>
>> MHDP does have hpd. But the mhdp driver should handle the cases when the
> 
> This is about bindings, not driver. Your driver can still handle this as
> it wishes.
> 
>> hpd pin of bridge is not connected to that of the DP-connector. This is
>> to add support for that. (optional property)
> 
> Which is indicated by panel no-hpd, right?

Actually no panel is involved in this. For TI SoC J721S2, the data 
pipeline involves the bridge whose endpoint is directly the DP connector 
with compatible 'dp-connector'. And in the binding dp-connector.yaml, 
there isn't any 'no-hpd' property for this indication.

Does this clarifies the issue? Or did I misinterpret your comment?

> Or you mean now that HPD
> physically cannot go to panel because it is cut on the bridge side? But
> isn't this the same case (from hardware/bindings point, not driver) as
> panel would not have HPD?
Warm Regards,
-Jayesh
