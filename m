Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA38B48551
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAB710E47B;
	Mon,  8 Sep 2025 07:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iEl4hAeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8823B10E47B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:33:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3882E4326B;
 Mon,  8 Sep 2025 07:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36255C4CEF8;
 Mon,  8 Sep 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757316830;
 bh=SwLGQXYjjILPZ6nHkE3A25BCSWlFkPdVwJFl10Fp3/U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iEl4hAeHsDIWe/dUV09Y9leD6iq0jozKjh9cx1J5hplu+UsBTLeHjMK66m3maSgNl
 /uER1iv5P6eH55gj2kG2JcEaPjlesimmWIWs2aqCeoFtZd2CRBdKIHDSJKn08TnpCd
 rZpmnscakSK5SXWjmq3xI25uFaRcE10zS2jxU4kmUwVGHRMastU3uYHaz1ezKiQOUX
 RGDy53wp0P8lvA5B1zyzM5MWh6X2b+F6l6bBdKJ+LWY8pXmY3eLN16bosi4oC10AyC
 zxJahRAS1TwW96bc6sQdKKyhg8rLOfhdOwhhqxtUzvHvuPYcI1nJYDh781SQP2mCeC
 YpsLL59pV8iPw==
Message-ID: <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
Date: Mon, 8 Sep 2025 09:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 8-Sep-25 09:20, Konrad Dybcio wrote:
> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>> A number of existing schemas use 'leds' property to provide
>> phandle-array of LED(s) to the consumer. Additionally, with the
>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>> LED consumer, meaning that all camera sensors should support 'leds'
>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>
>> To avoid dublication, commonize 'leds' property from existing schemas
>> to newly introduced 'led-consumer.yaml'.
>>
>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>> ---
> 
> [...]
> 
>>  
>> +  leds:
>> +    minItems: 1
>> +    maxItems: 1
> 
> My brain compiler suggests this will throw a warning (minItems should
> be redundant in this case)
>> +
>> +  led-names:
>> +    enum:
>> +      - privacy-led
> 
> Nit: "privacy" makes more sense without the suffix, as we inherently
> know this is supposed to be an LED

Note "privacy-led" as name is already used on the x86/ACPI side and
the code consuming this will be shared.

With that said if there is a strong preference for going with just
"privacy" the x86 side can be adjusted since the provider-info is
generated through a LED lookup table on the x86/ACPI side. So we can
just modify both the lookup table generation as well as the already
existing led_get(dev, "privacy-led") call to use just "privacy"
without problems.

Regards,

Hans


