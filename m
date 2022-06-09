Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBED5443EF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C260113CDD;
	Thu,  9 Jun 2022 06:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F73113CEE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:41:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m20so45444721ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iJ0Au4lK3xvz24v1XJgT8TGa/DQOsCP09lUe7uwWGo0=;
 b=tedgup7BYTuP5EMom3EMey8Xc9+oGM4GBVcJiPlAvJvT/VEXhE2RMxqJkJRQq+skF/
 +C63y971KpBDWt8Bi4ccojLUHI7jhORhBgvl1b3tf0uT4BpEvwVupSX8Kz9DWPuvAYF/
 TU9p4GgPyq3k/wbLblagaRfenF8jULw2gj23mR8s5DGvFWmFPvMNKE3XfRKGfps5AdLG
 OR0+N03gqxKtVxub+/VzM6xLFuxpdc0OSMOPXhFQd7rjZh+Dxm3V6OMoLeWF9oSWfuD2
 ZEFvXCwMR4bAZaWCZ/IEXxohOXNQcqv4UFCrB9kNyXoGRPTrHAkb9jzNx6eiDKVJiSW7
 K15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iJ0Au4lK3xvz24v1XJgT8TGa/DQOsCP09lUe7uwWGo0=;
 b=zgHHX3abnbziOGBJUIpZvDoJ2udU6h8GbyV0CTOmYDJG3jfEvyNWsmbGozWygEmT4e
 8mj0m9jkivi6mlPm/pRElkU/MQMFYfAEuyyPodGJPcz85S2ByAufchn8eeffN1nYu9he
 7gijO3bTsuJ18o0wsKYL2supbPZSnVfsgC+5kv84fAyI1Bss5yqzRuusTScJMOQPCTHP
 iZQxizgVyxmZ83auqXfc4g5CRXNUwhq/rGGWBqQ73MD94imqRIuHewLob2o9IL3izwE2
 RMCnmZH3aKvBXo5gFSqG3Ev14OiIufm2HJQoGO40NYk8ifqvDEsGPhL2PW0AfLgvGR+7
 GBEQ==
X-Gm-Message-State: AOAM532NU0xDIBt9Dz+uqRdKuO8gMO011hbI9sTtPzruJQuB9cogadXt
 HQSIO1PNA7HZWk8U0hFGgETMGw==
X-Google-Smtp-Source: ABdhPJyiHWjFlxGf54EJ5A0RRB1OPqqAmO8BOkzYneeDW4fRfqy8cJEm/VKYM6PzX31F4Wj/5hxzzA==
X-Received: by 2002:a17:907:97d0:b0:6ff:e43:2145 with SMTP id
 js16-20020a17090797d000b006ff0e432145mr34551552ejc.273.1654756906877; 
 Wed, 08 Jun 2022 23:41:46 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f14-20020a170906824e00b006f3ef214debsm10203708ejx.81.2022.06.08.23.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:41:46 -0700 (PDT)
Message-ID: <fac58827-5b82-81a2-e782-99056180c0ed@linaro.org>
Date: Thu, 9 Jun 2022 08:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
 <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
 <YqDXfGa9bugnLFGH@chromium.org>
 <CACeCKaeHocnAuY5D-oVt1fhgRGkNT014RcK3JSe6piKoXNtKCQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACeCKaeHocnAuY5D-oVt1fhgRGkNT014RcK3JSe6piKoXNtKCQ@mail.gmail.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 23:56, Prashant Malani wrote:
> On Wed, Jun 8, 2022 at 10:08 AM Prashant Malani <pmalani@chromium.org> wrote:
>>
>> Hi Krzysztof,
>>
>> Thank you for looking at the patch.
>>
>> On Jun 08 11:24, Krzysztof Kozlowski wrote:
>>> On 07/06/2022 21:00, Prashant Malani wrote:
>>>> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
>>>> alternate mode lane traffic between 2 Type-C ports.
>>>>
>>>> Update the binding to accommodate this usage by introducing a switch
>>>> property.
>>>>
>>>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
>>>> ---
>>>>  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
>>>>  1 file changed, 56 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
>>>> index 35a48515836e..7e1f655ddfcc 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
>>>> @@ -105,6 +105,26 @@ properties:
>>>>        - port@0
>>>>        - port@1
>>>>
>>>> +  switches:
>>>> +    type: object
>>>> +    description: Set of switches controlling DisplayPort traffic on
>>>> +      outgoing RX/TX lanes to Type C ports.
>>>> +
>>>> +    properties:
>>>> +      switch:
>>>
>>> You allow only one switch with such schema, so no need for "switches"...
>>
>> See below comment (summary: we'd like to allow 1 or 2 switches).
>>>
>>>> +        $ref: /schemas/usb/typec-switch.yaml#
>>>> +        maxItems: 2
>>>
>>> Are you sure this works? what are you limiting here with maxItems? I
>>> think you wanted patternProperties...
>>
>> Yeah, I might not have used the DT syntax correctly here.
>> What I'm aiming for is:
>> "switches" should can contain 1 or 2 "switch" nodes.
>> 2 is the maximum (limitation of the hardware).
>>
>>>
>>>> +
>>>> +        properties:
>>>> +          reg:
>>>> +            maxItems: 1
>>>> +
>>>> +        required:
>>>> +          - reg
>>>> +
>>>> +    required:
>>>> +      - switch@0
>>>
>>> This does not match the property.
>>>
>>> You also need unevaluatedProperties:false
>>
>> Ack, will update this in the next version.
> 
> Actually, could you kindly clarify which of the two needs this?
> "switches" or "switch" ?
> I interpreted "switch" as requiring it, but I thought it better to confirm.

Depends what do you want to have there. If two properties called
"switch", then "switches" is ok. However old code had only one property
thus switches with maximum one switch is a bit weird.

Looking at example you wanted to switch@[01], so you need to use
patternProperties.


Best regards,
Krzysztof
