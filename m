Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD0648420
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 15:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5310E011;
	Fri,  9 Dec 2022 14:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D49910E011
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 14:49:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BF5668500F;
 Fri,  9 Dec 2022 15:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670597390;
 bh=zniACeWZ8F9CjNbWs3xwSx3TBUgkwMOatyWqyknFitk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p0nCsnji8eYWWvoG/jVA0aafn2tM6SEi3OaVBT0/flYAlR3Eoy2u0adLs6YtyJoiI
 IqRMJCIRh2YHm4hh7DHY6IteGGLyzxTZUQaKY7KKxhPv8UVYnedljebm7iGvCNz+dR
 Vsyt1AHhf7Bfc/FJ5v+MNmASwtWS2o3Dp+vMwVyEs3RFVvRCU7X5K29lTiIBY4UUM1
 B5MKw8XJYcw9ywVQwD9VH09oeiFsuOAF6/8+6MmT4hN9p766EFI0Yswbo+ZfEGfQs6
 x7yQOYy6wlKDU8s0it/hcRMq6R+RMo+zO3mzO1QsEl8a6D7yNWUGyyDx6777kDuIKl
 KoWJZOstXmDBg==
Message-ID: <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
Date: Fri, 9 Dec 2022 15:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2735716.BEx9A2HvPv@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/22 14:38, Alexander Stein wrote:
> Am Freitag, 9. Dezember 2022, 13:43:02 CET schrieb Marek Vasut:
>> On 12/9/22 13:21, Alexander Stein wrote:
>>> Hi Marek,
>>>
>>> Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
>>>> On 12/9/22 10:36, Alexander Stein wrote:
>>>>> Hello Krzysztof,
>>>>
>>>> Hi,
>>>>
>>>>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
>>>>>> On 09/12/2022 09:54, Alexander Stein wrote:
>>>>>>> Hello Krzysztof,
>>>>>>>
>>>>>>> thanks for the fast feedback.
>>>>>>>
>>>>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof
> Kozlowski:
>>>>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
>>>>>>>>> It takes some time until the enable GPIO has settled when turning
>>>>>>>>> on.
>>>>>>>>> This delay is platform specific and may be caused by e.g. voltage
>>>>>>>>> shifts, capacitors etc.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>>     .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
>>>>>>>>>     ++++
>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git
>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>>>>>> ---
>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>> +++
>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>
>>>>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>>>>         maxItems: 1
>>>>>>>>>         description: GPIO specifier for bridge_en pin (active high).
>>>>>>>>>
>>>>>>>>> +  ti,enable-delay-us:
>>>>>>>>> +    default: 10000
>>>>>>>>> +    description: Enable time delay for enable-gpios
>>>>>>>>
>>>>>>>> Aren't you now mixing two separate delays? One for entire block on (I
>>>>>>>> would assume mostly fixed delay) and one depending on regulators
>>>>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss
>>>>>>>> the
>>>>>>>> second delays in your power supply? If so, the first one might be
>>>>>>>> fixed
>>>>>>>> and hard-coded in the driver?
>>>>>>>
>>>>>>> Apparently there are two different delays: reset time (t_reset) of
>>>>>>> 10ms
>>>>>>> as
>>>>>>> specified by datasheet. This is already ensured by a following delay
>>>>>>> after
>>>>>>> requesting enable_gpio as low and switching the GPIO to low in disable
>>>>>>> path.
>>>>>>>
>>>>>>> When enabling this GPIO it takes some time until it is valid on the
>>>>>>> chip,
>>>>>>> this is what this series is about. It's highly platform specific.
>>>>>>>
>>>>>>> Unfortunately this is completely unrelated to the vcc-supply
>>>>>>> regulator.
>>>>>>> This one has to be enabled before the enable GPIO can be enabled. So
>>>>>>> there is no regulator-ramp-delay.
>>>>>>
>>>>>> Your driver does one after another - regulator followed immediately by
>>>>>> gpio - so this as well can be a delay from regulator (maybe not ramp
>>>>>> but
>>>>>> enable delay).
>>>>
>>>> The chip has two separate input pins:
>>>>
>>>> VCC -- power supply that's regulator
>>>> EN -- reset line, that's GPIO
>>>>
>>>> Alexander is talking about EN line here.
>>>>
>>>>> But this will introduce a section which must not be interrupted or
>>>>> delayed.
>>>>> This is impossible as the enable gpio is attached to an i2c expander in
>>>>> my
>>>>> case.
>>>>>
>>>>> Given the following time chart:
>>>>>     vcc                  set             EN
>>>>>
>>>>> enable               GPIO             PAD
>>>>>
>>>>>      |                    |<-- t_raise -->|
>>>>>      |
>>>>>      | <-- t_vcc_gpio --> |               |
>>>>>      | <--        t_enable_delay      --> |
>>>>>
>>>>> t_raise is the time from changing the GPIO output at the expander until
>>>>> voltage on the EN (input) pad from the bridge has reached high voltage
>>>>> level. This is an electrical characteristic I can not change and have to
>>>>> take into account.
>>>>> t_vcc_gpio is the time from enabling supply voltage to enabling the
>>>>> bridge
>>>>> (removing from reset). Minimum t_vcc_gpio is something which can be
>>>>> addressed by the regulator and is no problem so far. But there is no
>>>>> upper bound to it.
>>>>
>>>> What exactly is your EN signal rise time (should be ns or so)? Can you
>>>> look at that with a scope , maybe even with relation to the VCC regulator
>>>> ?
>>>
>>> I checked EN rise time using a scope, it's ~110ms. I not an expert in
>>> hardware but on the mainboard there is some capacitor attached to this
>>> line, which increased the time, independent from the internal pull-up.
>>
>> This does seem like a hardware bug right there, can you double-check
>> this with the hardware engineer ?
> 
> Yep, checked with hardware engineer. An 470nF is attached, together with an
> open drain output and only the internal pull-up. So yes ~113ms rising time
> until 0.7 x VCC.

I don't suppose you can have that capacitor reduced or better yet, some 
external pull up added, can you ?
