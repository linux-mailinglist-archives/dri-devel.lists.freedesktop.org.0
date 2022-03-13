Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C34D775C
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 18:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70A7897C8;
	Sun, 13 Mar 2022 17:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAD8897C8
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 17:50:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id hw13so28510752ejc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 10:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=OnMEmnpHDyQ0JnBmJcE5RT8DxXCjGO53V+k3T5Ck1Q4=;
 b=y+p7MtsjXKwk1KPZgoWHqYlQpPbylJ/I+BDTxkjdYDyjVyLATEmidNjGBsEWcIlN2c
 AP8kAidmBF6/yo2l90F4ehRCBNUzSSZ0b+67DpPtBwCCno3gP0y3JZaIfqldi//Dvak2
 bpoqrFkFabAJDOArOAF17vyyJeCwF9UFFCB/pDd/IUeIHjXd9oHYcUEfIJq6w3E9HhfW
 ZzrF0W/hnHw4pxqf+OV/Q9nBc9C+ttdADDoLs4bEkBzAEyW9dDeQzMT1ugyIyEOfC58B
 +FfBkWQIAeSYoAIvcuW8Kfl6++Lbqt/0EwoCasvjJuGtsx8/h9NRCfURV+0q8RbU3ntJ
 8Ozw==
X-Gm-Message-State: AOAM531XmQBdMpCZcS2hjMxcChW1GHh469JO3FBuU38qMLVqDMYO61VP
 arxmVCDtZ9nNgdVtTAT0AkA=
X-Google-Smtp-Source: ABdhPJziVIZxm/tezBPDg19kHDHIAIrzncxfnjWMf409dhhk2Jv6Dh/+Ho85UgDbd0FYhSpIi1y2Tw==
X-Received: by 2002:a17:907:971c:b0:6d6:e503:131b with SMTP id
 jg28-20020a170907971c00b006d6e503131bmr15627567ejc.121.1647193855384; 
 Sun, 13 Mar 2022 10:50:55 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 l9-20020a170906078900b006dac5f336f8sm5761810ejc.124.2022.03.13.10.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 10:50:54 -0700 (PDT)
Message-ID: <9a5938fa-3783-9e5a-74f0-639372480e4a@kernel.org>
Date: Sun, 13 Mar 2022 18:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 NXP i.MX8M LDB bridge
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220313123852.207257-1-marex@denx.de>
 <9bda9a09-ec0a-0b6f-56b1-dff18821aa5d@kernel.org>
 <a8a0278c-92f0-bd9c-927f-b8ee729251af@denx.de>
In-Reply-To: <a8a0278c-92f0-bd9c-927f-b8ee729251af@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Maxime Ripard <maxime@cerno.tech>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2022 18:09, Marek Vasut wrote:
> On 3/13/22 16:47, Krzysztof Kozlowski wrote:
> 
> Hi,
> 
> [...]
> 
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
>>> new file mode 100644
>>> index 0000000000000..a05dd05547836
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
>>> @@ -0,0 +1,99 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#
>>
>> In title, description and commit msg you point this is specific to
>> i.MX8M, so maybe reflect it in the file name as well.
> 
> That's how it is so far, however NXP does recycle their IPs quite a bit 
> so I don't want to encode the SoC type into the bindings file name. I do 
> expect them to re-use this bridge somewhere else sooner rather than later.
> 
> [...]
> 
> The rest is fixed.
> 
> [...]
> 
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>>> +
>>> +    lvds-ldb {
>>
>> Generic node name, so "bridge" or "display-bridge"
>>
>>> +        #address-cells = <0>;
>>> +        #size-cells = <0>;
>>
>> Why do you need address and size cells? This will complain if you test
>> your bindings with proper compatible.
> 
> Because the subnodes of this bridge have no dimension, so address/size 
> cells = 0.
> 
> I don't understand the second part about "proper compatible", can you 
> elaborate ?

You have wrong compatible in example and in bindings, so you do not see
the error of address/size cells.

They are also not required in your example, since you do not have unit
address. Otherwise your lvds-ldb node would be wrong (see its
address/size cells).

If you supply address-cells you should see a W=1 warning:
#address-cells/#size-cells without "ranges" or child "reg" property

Best regards,
Krzysztof
