Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4DE5B21DA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B8A10EB3F;
	Thu,  8 Sep 2022 15:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A1B10E77C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 15:18:05 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i26so12532277lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=/61fN8wXe1cF6+hB8wQz2CoLOe7SQuQ25cXLhUv9yHo=;
 b=WxbNZGYwJcgjuppu2mdBKFLaF7yFEGpMJkyrAK4IVoxV7XdVpSCe762tiSmhT06cMZ
 h/mvpRnr0he9SWfxGVO7XO5CSbKbgNSGU+noU0ydpYXIiCLpE6kPJhifaoVd2irCNOLP
 Wa5daRv94BmzwT53DT8D0uXrMkJ1PiYfwAjU09icRG+rTVRnE/1uS192w7mufW6MxrMd
 HyWxrdnHzdigeqVE7NKb7FPJtf1gTXS2iajEw9VDHfq7camhjw2bTBn17uATFQvQZrL9
 h7VLgMoQIvTgmdyS9HTwkqCLYuDyC2G3m7MdDCHZZCCO6TsQFgumoAF6B8ufiQUSOQDO
 M7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/61fN8wXe1cF6+hB8wQz2CoLOe7SQuQ25cXLhUv9yHo=;
 b=jgFu1wC3VT//tiX0RkJeRN40IyjrX+oboOGqq51w4DHA05Y9qyU9WtX+G4uGBNfDxI
 bv/U2+jkfottjQ8dOjnxhVKYAKfGeMvF7zWUP5ClAETE3WzxRi+QdIAVK4QBwfVVtmh8
 fG7mRA7zoS9vNX1LktEuGhase8Bx1ODpx8GA1iHm2Rub2CYzQUEaQAb6KZHjdBHdPC8x
 D+npgyY0nxGH57ISwPWSgoAxMCfhy7yT/PwD9cvi7b6Xc6TZQLu48uUyrlk4JJF4Jdfp
 9IPdmoPcsL3eRvCxmkYsXS2DVFzHO3vF8V6slkT7I3wvrqx10hmzprO4yDDDJs1caGMv
 k9pg==
X-Gm-Message-State: ACgBeo09V2/gpMjhO4RbB0ECANpIx6fdEeqCp+az+3451oFMwuKklgul
 lOaH+Dq4tnyjStywu77U+MevLw==
X-Google-Smtp-Source: AA6agR4/vGtKteLhNWyXm/dlNO0bWhSZYQLjnjvT1mr61jpFMHUoxvmP2VPoyV4PQI2v8bwRqi42VA==
X-Received: by 2002:ac2:4f03:0:b0:496:272:625d with SMTP id
 k3-20020ac24f03000000b004960272625dmr2782441lfr.303.1662650283838; 
 Thu, 08 Sep 2022 08:18:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k5-20020ac257c5000000b004946bb30469sm3069662lfo.82.2022.09.08.08.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 08:18:02 -0700 (PDT)
Message-ID: <1da154da-6c37-7dc6-9cfe-87d38efc4f28@linaro.org>
Date: Thu, 8 Sep 2022 17:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add NewVision NV3051D
 panel bindings
Content-Language: en-US
To: Chris Morgan <macromorgan@hotmail.com>
References: <20220906185208.13395-1-macroalpha82@gmail.com>
 <20220906185208.13395-2-macroalpha82@gmail.com>
 <cbdbc7d8-a3b9-d960-68c7-457c947e4285@linaro.org>
 <SN6PR06MB534207102C2E8AFCE63C3231A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SN6PR06MB534207102C2E8AFCE63C3231A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/09/2022 15:35, Chris Morgan wrote:
> On Wed, Sep 07, 2022 at 02:53:56PM +0200, Krzysztof Kozlowski wrote:
>> On 06/09/2022 20:52, Chris Morgan wrote:
>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>
>>> Add documentation for the NewVision NV3051D panel bindings.
>>> Note that for the two expected consumers of this panel binding
>>> the underlying LCD model is unknown.
>>>
>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>> ---
>>>  .../display/panel/newvision,nv3051d.yaml      | 48 +++++++++++++++++++
>>>  1 file changed, 48 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
>>> new file mode 100644
>>> index 000000000000..016168d8d7b2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
>>> @@ -0,0 +1,48 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fnewvision%2Cnv3051d.yaml%23&amp;data=05%7C01%7C%7C69d30de15aea41517acb08da90d0079f%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637981520397977782%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qfuvbrQYP3rKnp%2ByPmPmn%2BCJJOQkNkTGT49FkJmIics%3D&amp;reserved=0
>>
>> You need to document vendor prefix... but the filename does not match
>> compatible.
> 
> Okay, will do that. This is a tricky one because while I know the panel
> controller IC (a NewVision NV3051D) I don't actually know the LCD panel
> itself, the vendor is somewhat tight lipped. I do know the product it
> goes into, so that's why I did what I did with the compatible strings.
> If that's not correct I guess let me know. I did see for other drivers
> (such as the NewVision NV3052C) the driver was written for the IC
> and the panel name was listed differently, hence what I was going for
> here.

If by "driver" you mean by "Linux driver", then it does not really
matter. You describe here the hardware. The example of NV3052C follows
this approach - proper compatible and file name matching hardware. Here
your file name does not match hardware.

> 
>>
>>> +$schema: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7C%7C69d30de15aea41517acb08da90d0079f%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637981520397977782%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=AYwypW%2BA9xWCN6YYwC7oI5UDW6QmiP7%2FmAoKlm7x3jM%3D&amp;reserved=0
>>> +
>>> +title: NewVision NV3051D based DSI panel driver
>>
>> This is confusing - compatibles say something else.
>>
> 
> Right. Driver IC is the NV3051D, LCD panel itself is... well... not
> sure...

I guess similarly to ltk035c5444t this should be documentation of panel?

> 
>>> +
>>> +maintainers:
>>> +  - Chris Morgan <macromorgan@hotmail.com>
>>> +
>>> +allOf:
>>> +  - $ref: panel-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - anbernic,rg353p-panel
>>> +      - anbernic,rg353v-panel
>>
>> Missing space, missing documentation for vendor prefix.
>>
>> Strip "panel" suffix unless device is multifunctional.
>>
> 
> The device name itself is Anbernic RG353P (and RG353V). The driver is
> not multifunctional but again I don't really know what the LCD itself
> is called so I'm trying to name it after the device. I only know the
> driver IC.

So skip panel.



Best regards,
Krzysztof
