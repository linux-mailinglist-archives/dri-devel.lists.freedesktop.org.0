Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939BB4A69A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30C10E238;
	Tue,  9 Sep 2025 09:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YgpIdyA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A210E238
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:06:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 64BD84195C;
 Tue,  9 Sep 2025 09:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0263CC4CEF5;
 Tue,  9 Sep 2025 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757408788;
 bh=7KHRyNXulEzV5xfA0DTLR93wZhedtS6U0W/OgCRxzTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YgpIdyA/7SeKJXe88JKdL+8cKRhcsDkqKgcop6CyNabiQH1IoGUGWwnhISrzq+ATK
 iw+a1kLwmrkdfoCl+Y3T4dFzQ8PiQC7YrA26Lp4HvdqoN2LU+n3Yoi0MtMBGjkeea2
 ohKhJtF5gy9ML01DyQtxo78OqfDTX/OtsszEzisC5gbN6zhA4mh5be1PK6inzH7n/n
 rmL1ylDc4WnEFZK9RumjHEvr/qFuHAbGJLE5xzf+fbRiKWYGDO4XzmzyUrtIezcjJc
 1Iv9IyF4uuYyhVUnsSMAOlvNmC0VKCUpivKwootXbR+ghdD42K7rqLJ4UQPM4rTMvI
 LhJpZ1LEvqxdw==
Message-ID: <98871c1b-7183-4a08-a5ea-9fa5c91c6777@kernel.org>
Date: Tue, 9 Sep 2025 11:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Rob Herring <robh@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
 <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
 <20250908222247.GA1943768-robh@kernel.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250908222247.GA1943768-robh@kernel.org>
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

On 9-Sep-25 12:22 AM, Rob Herring wrote:
> On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
>> On 9/8/25 9:33 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 8-Sep-25 09:20, Konrad Dybcio wrote:
>>>> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>>>>> A number of existing schemas use 'leds' property to provide
>>>>> phandle-array of LED(s) to the consumer. Additionally, with the
>>>>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>>>>> LED consumer, meaning that all camera sensors should support 'leds'
>>>>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>>>>
>>>>> To avoid dublication, commonize 'leds' property from existing schemas
>>>>> to newly introduced 'led-consumer.yaml'.
>>>>>
>>>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  
>>>>> +  leds:
>>>>> +    minItems: 1
>>>>> +    maxItems: 1
>>>>
>>>> My brain compiler suggests this will throw a warning (minItems should
>>>> be redundant in this case)
>>>>> +
>>>>> +  led-names:
>>>>> +    enum:
>>>>> +      - privacy-led
>>>>
>>>> Nit: "privacy" makes more sense without the suffix, as we inherently
>>>> know this is supposed to be an LED
>>>
>>> Note "privacy-led" as name is already used on the x86/ACPI side and
>>> the code consuming this will be shared.
>>>
>>> With that said if there is a strong preference for going with just
>>> "privacy" the x86 side can be adjusted since the provider-info is
>>> generated through a LED lookup table on the x86/ACPI side. So we can
>>> just modify both the lookup table generation as well as the already
>>> existing led_get(dev, "privacy-led") call to use just "privacy"
>>> without problems.
>>
>> In that case, it may be cleaner to just go with what we have today
>> (unless the dt maintainers have stronger opinions)
> 
> Well, I do, but I guess it's fine. Please don't add the suffix on the 
> rest and add a comment for why it's there.

Dropping the "-led" suffix on the ACPI side really is no big deal,
so if we don't want the suffix it is probably best to also drop
it for "privacy-led" rather then setting a bad example to be
copy and pasted.

Regards,

Hans


