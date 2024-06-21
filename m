Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614E912946
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B52E10F1E4;
	Fri, 21 Jun 2024 15:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UByxV7t0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517C910F1E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:17:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 18B9CCE2EDB;
 Fri, 21 Jun 2024 15:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A26C2BBFC;
 Fri, 21 Jun 2024 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718983069;
 bh=T4+TI+8ndBdHiFbq61X7WaaGwYLRFKgaWSWHvteO3J0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UByxV7t0eq8J0Qw7PACb4hbk2DnhiRy8zVF4eLQHFo/aC1LZniQEOMioSZbMHRxSR
 oq96gBrVYbppoWkEYMptNWEQSNWa44ERIuQ8pH5I1YjDCvjzx4+iRH90PFeNrLHeId
 Wm6GAURJ/fAcNhkin8QuCuxjO7cTGF4N5k0c0aVhbQcp4EWttBWQnNFQ67LvylPKrq
 mdvRJEkX2n99ntQ+R/VOvy2I6P/YvLWzztckT5ivL24ln7EZJ1OexkPJr8UNcjrPXp
 DP1r+3se4mL2r26c1cEaXoFfvAvBeMEn7Snuh6bqyEC+pSmb5wOEvTnmpccGhfznIi
 677YuWSHl+4Fg==
Message-ID: <49f4c98b-88eb-404b-ba77-e892309725db@kernel.org>
Date: Fri, 21 Jun 2024 17:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240618081515.1215552-1-kikuchan98@gmail.com>
 <20240618081515.1215552-2-kikuchan98@gmail.com>
 <0455975b-837b-4a1c-8ea3-e9a504db53d0@kernel.org>
 <CAG40kxHaAwGowQ0dRoEkGSiAUJA5SyKw3SSECUmBApKaAjcHKw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAG40kxHaAwGowQ0dRoEkGSiAUJA5SyKw3SSECUmBApKaAjcHKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 21/06/2024 12:59, Hironori KIKUCHI wrote:
> Hello Krzysztof,
> 
> Thank you for your reply!
> 
> On Tue, Jun 18, 2024 at 6:17 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 18/06/2024 10:15, Hironori KIKUCHI wrote:
>>> The RG28XX panel is a panel specific to the Anbernic RG28XX.
>>> It is 2.8 inches in size (diagonally) with a resolution of 480x640.
>>>
>>> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
>>> ---
>>>  .../display/panel/sitronix,st7701.yaml        | 36 +++++++++++++++++--
>>>  1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> Nothing explains in the commit msg why rg28xx is actually st7701.
>> Changing interface to SPI suggests it is not.
> 
> Thanks, I'll explain like this;
> ---
> dt-bindings: display: st7701: Add Anbernic RG28XX panel
> 
> The RG28XX panel is a panel specific to the Anbernic RG28XX
> handheld device. It is 2.8 inches in size (diagonally) with a
> resolution of 480x640.
> 
> This panel is driven by a variant of ST7701 driver IC internally,
> confirmed by dumping and analyzing its BSP initialization sequence
> by using a logic analyzer. It is very similar to the existing
> densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> register values, so add a new entry for the panel to distinguish them.
> 
> Additionally, it is connected over SPI, instead of MIPI DSI. So
> add and modify for SPI as well.
> ---

OK.

> 
>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
>>> index b348f5bf0a9..04f6751ccca 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
>>> @@ -22,19 +22,21 @@ description: |
>>>
>>>  allOf:
>>>    - $ref: panel-common.yaml#
>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>>
>>>  properties:
>>>    compatible:
>>>      items:
>>>        - enum:
>>>            - anbernic,rg-arc-panel
>>> +          - anbernic,rg28xx-panel
>>
>> What is xx? Wildcards are not allowed, in general.
>>
>> Can it be anything else than panel? If not, then drop "-panel".
> 
> It's supprising but it actually is a product name of the handheld device...
> The panel comes with the device, and part# is completely unknown.

OK

> 
>>
>>
>>>            - densitron,dmt028vghmcmi-1a
>>>            - elida,kd50t048a
>>>            - techstar,ts8550b
>>>        - const: sitronix,st7701
>>>
>>>    reg:
>>> -    description: DSI virtual channel used by that screen
>>> +    description: DSI / SPI channel used by that screen
>>>      maxItems: 1
>>>
>>>    VCC-supply:
>>> @@ -43,6 +45,13 @@ properties:
>>>    IOVCC-supply:
>>>      description: I/O system regulator
>>>
>>> +  dc-gpios:
>>> +    maxItems: 1
>>> +    description: |
>>
>> Do not need '|' unless you need to preserve formatting.
> 
> Thanks, I'll remove it.
> 
>>
>>> +      Controller data/command selection (D/CX) in 4-line SPI mode.
>>> +      If not set, the controller is in 3-line SPI mode.
>>> +      No effect for DSI.
>>
>> Which devices can be connected over SPI? It seems not all, so this
>> should be disallowed (": false" in allOf:if:then:; move the allOf to
>> bottom like in example-schema) for them.
> 
> Hmm... That's a difficult question...
> 
> There are 3 types of connection that trying to support:
> DSI, SPI with D/CX pin, and SPI without D/CX pin.
> 
> The dc-gpios is required for SPI with D/CX pin, but not for others.
> 
> DSI:
> - anbernic,rg-arc-panel
> - densitron,dmt028vghmcmi-1a
> - elida,kd50t048a
> - techstar,ts8550b
> 
> SPI without D/CX pin:
> - anbernic,rg28xx-panel
> 
> But, there are no panels with D/CX pin so far.
> How should I deal with this? just disallow all, perhaps?

You can disallow for all existing panels, if you are unsure.

> 
> 
> BTW, does panel's compatible string consider to include it's interface?

No, the compatible defines the device, not its wiring (bus). The parent
node defines which bus is needed.

> ie, what if two panels use the exact same commands and timings, but
> over different interface,
> ... are they "compatible" or not?


Best regards,
Krzysztof

