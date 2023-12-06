Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C48074AA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304910E74C;
	Wed,  6 Dec 2023 16:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010C10E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:15:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6GFSLJ010708;
 Wed, 6 Dec 2023 10:15:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1701879328;
 bh=aaEOnLvVa7qfwFIn7wOtUQ9a7L3RjZtWVhy9LotV1y4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=wyFHeQ653VSHz5cy2RH/tJzTLkUK3dDtom6lStSJbZwufmD2646cXCxAKdbIBAR4i
 +F+6IP+afRDXzm4mKfwdSiuNoXwfTi7ltsHeeKLxXFblrRwTt8P5jM53IrH5aTgHKJ
 d+nXGWdzUWMDCHtbquX+rrNUjbkWyDmncQVWbc+E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6GFSGb093935
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Dec 2023 10:15:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 10:15:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 10:15:28 -0600
Received: from [10.249.36.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6GFQqs123291;
 Wed, 6 Dec 2023 10:15:26 -0600
Message-ID: <8328bec9-a963-4f8a-ae03-a531749a30db@ti.com>
Date: Wed, 6 Dec 2023 10:15:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
To: Conor Dooley <conor@kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
 <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
 <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
 <20231206-wolverine-paprika-0674ca01e1f2@spud>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231206-wolverine-paprika-0674ca01e1f2@spud>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/23 10:02 AM, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 07:04:05PM +0100, H. Nikolaus Schaller wrote:
>>> Am 05.12.2023 um 18:33 schrieb Andrew Davis <afd@ti.com>:
>>>
>>> On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
>>>>> +          - enum:
>>>>> +              - ti,omap3430-gpu # Rev 121
>>>>> +              - ti,omap3630-gpu # Rev 125
>>>> Is the "Rev 121" and "Rev 125" a property of the SoC integration (clock/reset/power
>>>> hookup etc.) or of the integrated SGX core?
>>>
>>> The Rev is a property of the SGX core, not the SoC integration.
>>
>> Then, it should belong there and not be a comment of the ti,omap*-gpu record.
>> In this way it does not seem to be a proper hardware description.
>>
>> BTW: there are examples where the revision is part of the compatible string, even
>> if the (Linux) driver makes no use of it:
>>
>> drivers/net/ethernet/xilinx/xilinx_emaclite.c
> 
> AFAICT these Xilinx devices that put the revisions in the compatible are
> a different case - they're "soft" IP intended for use in the fabric of
> an FPGA, and assigning a device specific compatible there does not make
> sense.
> 
> In this case it appears that the revision is completely known once you
> see "ti,omap3630-gpu", so encoding the extra "121" into the compatible
> string is not required.
> 
>>
>>> But it seems that
>>> compatible string is being used to define both (as we see being debated in the other
>>> thread on this series).
>>>
>>>> In my understanding the Revs are different variants of the SGX core (errata
>>>> fixes, instruction set, pipeline size etc.). And therefore the current driver code
>>>> has to be configured by some macros to handle such cases.
>>>> So the Rev should IMHO be part of the next line:
>>>>> +          - const: img,powervr-sgx530
>>>> +          - enum:
>>>> +              - img,powervr-sgx530-121
>>>> +              - img,powervr-sgx530-125
>>>> We have a similar definition in the openpvrsgx code.
>>>> Example: compatible = "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530";
>>>> (I don't mind about the powervr- prefix).
>>>> This would allow a generic and universal sgx driver (loaded through just matching
>>>> "img,sgx530") to handle the errata and revision specifics at runtime based on the
>>>> compatible entry ("img,sgx530-121") and know about SoC integration ("ti,omap3-sgx530-121").
> 
> The "raw" sgx530 compatible does not seem helpful if the sgx530-121 or
> sgx530-125 compatibles are also required to be present for the driver to
> actually function. The revision specific compatibles I would not object
> to, but everything in here has different revisions anyway - does the
> same revision actually appear in multiple devices? If it doesn't then I
> don't see any value in the suffixed compatibles either.
> 

Everything here has different revisions because any device that uses
the same revision can also use the same base compatible string. For
instance AM335x SoCs use the SGX530 revision 125, same as OMAP3630,
so I simply reuse that compatible in their DT as you can see in
patch [5/10]. I didn't see the need for a new compatible string
for identical (i.e. "compatible") IP and integration.

The first device to use that IP/revision combo gets the named
compatible, all others re-use the same compatible where possible.

Andrew

>>>> And user-space can be made to load the right firmware variant based on "img,sgx530-121"
>>>> I don't know if there is some register which allows to discover the revision long
>>>> before the SGX subsystem is initialized and the firmware is up and running.
>>>> What I know is that it is possible to read out the revision after starting the firmware
>>>> but it may just echo the version number of the firmware binary provided from user-space.
>>>
>>> We should be able to read out the revision (register EUR_CR_CORE_REVISION), the problem is
>>> today the driver is built for a given revision at compile time.
>>
>> Yes, that is something we had planned to get rid of for a long time by using different compatible
>> strings and some variant specific struct like many others drivers are doing it.
>> But it was a to big task so nobody did start with it.
>>
>>> That is a software issue,
>>> not something that we need to encode in DT. While the core ID (SGX5xx) can be also detected
>>> (EUR_CR_CORE_ID), the location of that register changes, and so it does need encoded in
>>> DT compatible.
>>
>> Ok, I didn't know about such registers as there is not much public information available.
>> Fair enough, there are some error reports about in different forums.
>>
>> On the other hand we then must read out this register in more or less early initialization
>> stages. Even if we know this information to be static and it could be as simple as a list
>> of compatible strings in the driver.
>>
>>> The string "ti,omap3430-gpu" tells us the revision if we cannot detect it (as in the current
>>> driver), and the SoC integration is generic anyway (just a reg and interrupt).
>>
>> It of course tells, but may need a translation table that needs to be maintained in a
>> different format. Basically the same what the comments show in a non-machine readable
>> format.
>>
>> I just wonder why the specific version can or should not become simply part of the DTS
>> and needs this indirection.
>>
>> Basically it is a matter of openness for future (driver) development and why it needs
>> careful decisions.
>>
>> So in other words: I would prefer to see the comments about versions encoded in the device
>> tree binary to make it machine readable.
> 
> It's already machine readable if it is invariant on an SoC given the
> patch had SoC-specific compatibles.
> 
