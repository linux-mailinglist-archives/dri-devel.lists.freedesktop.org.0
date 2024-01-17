Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E9830A0F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D310E6B7;
	Wed, 17 Jan 2024 15:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540EE10E6B7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:53:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40HFqhek107121;
 Wed, 17 Jan 2024 09:52:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705506764;
 bh=UqoXHpuOsyXayN31wfG4/f1gx1ZHV/XtpeqO3uEEUxI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=PcSv0otRf22cpnWL4ex8dgpTo4kYPE2YfM2FC7uA12j/9tyFYkEgZ2AhY9W2/eqIL
 UCcCKSNc2rAQMq34hF8aMVsEK2gtD8n3zgq1B2X+uumQ7rbozLTXHpMAbIth4PU623
 ZP/avpnMlwdRxFKiL0uRf9F+iQpxHCSIF8/AviO8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40HFqh7o004410
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jan 2024 09:52:43 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jan 2024 09:52:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jan 2024 09:52:43 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40HFqgSs087030;
 Wed, 17 Jan 2024 09:52:42 -0600
Message-ID: <55efd488-c6a0-4dca-baea-1fa93d13dd17@ti.com>
Date: Wed, 17 Jan 2024 09:52:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] ARM: dts: DRA7xx: Add device tree entry for SGX GPU
To: Tony Lindgren <tony@atomide.com>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-9-afd@ti.com> <20240110082924.GA5185@atomide.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240110082924.GA5185@atomide.com>
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
 "H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 2:29 AM, Tony Lindgren wrote:
> * Andrew Davis <afd@ti.com> [240109 17:20]:
>> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
>> @@ -850,12 +850,19 @@ target-module@56000000 {
>>   					<SYSC_IDLE_SMART>;
>>   			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>>   					<SYSC_IDLE_NO>,
>> -					<SYSC_IDLE_SMART>;
>> +					<SYSC_IDLE_SMART>,
>> +					<SYSC_IDLE_SMART_WKUP>;
> 
> You probably checked this already.. But just in case, can you please
> confirm this is intentional. The documentation lists the smart wakeup
> capability bit as reserved for dra7, maybe the documentation is wrong.
> 

It was an intentional change, although I'm not sure it is correct :)

This is how we had it in our "evil vendor tree" for years (back when it
was hwmod based), so when converting these nodes to use "ti,sysc" I noticed
this bit was set, but as you point out the documentation disagrees.

I'd rather go with what has worked before, but it doesn't seem to
break anything either way, so we could also break this change out into
its own patch if you would prefer.

Andrew

> Regards,
> 
> Tony
> 
