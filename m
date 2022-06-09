Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACA5443F7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483D510E053;
	Thu,  9 Jun 2022 06:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59610E053
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:43:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v1so34840441ejg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 23:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8QxMUDgvSlc7MUaIxRAHcd04jAxG/DT7Rwu9fAfBQ2c=;
 b=tlcMlE51v4xXs8km5CottKT0fJVznE2H+iY/m3DayYlsjEHHaGKQ6cjhtRtjkfGSQA
 8DMG9b+iBnoChMP8N9+sK86V/N9e0gwqUcY6gVZCJoYhV+98tdqkhkkqwK4jBrZG8kF9
 vXKweiVw3OReAfnWV7rEsbaUarzibEW20U6HX1CnDofiHwb1HrFH4duFmqCrIhwYOABK
 KKGGUuvo8D3bGXnBp5h/Pox0ZYWcTyGtEU2boRpiNlRJ+6XNdxE7vu4RbCecrm+qXGsJ
 rt5fj+LZ1ruM54v1bNLRTod7yi2KFO1u/m5oHkPOJHzmRlbxJNQift5D5c3rDYckKmpT
 zq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8QxMUDgvSlc7MUaIxRAHcd04jAxG/DT7Rwu9fAfBQ2c=;
 b=lNecdMG315Ev7lyKKyfdvjeJ+Lx/kodmS11fxD3ORA+51LZEc8XRwHhq5OBk5Ph09P
 2Q0eg7rnACx1Yoa7Ys48saCOpzv4XcGDE9eBKtdl0FxH/pBL5opW//BGoLZTeRDP15m6
 ZP7TTyiKFJvrDi/5/1wgWVH5F5pdHQA9UfuIL9FiO6qR+5TdrQm6UlkcUqG9SfSxp/mu
 gnk5+jhoHCs8JiPQ5179LfnwvUFbOgmhSWZrHNzOB3cumHBTW6TRUdUO7/rKSsTFeIX0
 HkX970UOC9PLmZQwoqan58pdxaWFf8giKuq9iNGFZQlAQvDhxBc1qUBhs3XqBLnMYFIL
 BaSg==
X-Gm-Message-State: AOAM533XwjNzxRGc6A9GD47Bihk3cU/ZLKL/abGjGagiBvjG5+7rP8np
 II4DTnM/lFllZqEG8Yjr6DhQdw==
X-Google-Smtp-Source: ABdhPJyJWDZbpai3zzWk6O960xQFGdojO/DcT8ZiVIX77Fy5DCaULLfavPwnpkEVE+ZJXaVfJLwdog==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id
 l4-20020a170906794400b006dab8342f3emr35639464ejo.353.1654757013799; 
 Wed, 08 Jun 2022 23:43:33 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 a23-20020aa7cf17000000b0042dc882c823sm13752112edy.70.2022.06.08.23.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:43:32 -0700 (PDT)
Message-ID: <efdecc1e-223a-0fe0-37e4-24b2ae39e368@linaro.org>
Date: Thu, 9 Jun 2022 08:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: usb: Add Type-C switch binding
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-4-pmalani@chromium.org>
 <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
 <YqDZJFTji5nRs3bk@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YqDZJFTji5nRs3bk@chromium.org>
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
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 19:15, Prashant Malani wrote:
> Hi Krzysztof,
> 
> On Jun 08 11:18, Krzysztof Kozlowski wrote:
>> On 07/06/2022 21:00, Prashant Malani wrote:
>>> Introduce a binding which represents a component that can control the
>>> routing of USB Type-C data lines as well as address data line
>>> orientation (based on CC lines' orientation).
>>>
>>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
>>> ---
>>>  .../devicetree/bindings/usb/typec-switch.yaml | 76 +++++++++++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
>>> new file mode 100644
>>> index 000000000000..60a600a63fef
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: USB Type-C Switch
>>> +
>>> +maintainers:
>>> +  - Prashant Malani <pmalani@chromium.org>
>>> +
>>> +description:
>>> +  A USB Type-C switch represents a component which routes USB Type-C data
>>> +  lines to various protocol host controllers (e.g USB, VESA DisplayPort,
>>> +  Thunderbolt etc.) depending on which mode the Type-C port, port partner
>>> +  and cable are operating in. It can also modify lane routing based on
>>> +  the orientation of a connected Type-C peripheral.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>
>> Single item, so no need for items.
> 
> I tried this initially, but dt_binding_check throws the following
> error:
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/typec-switch.yaml
> 
> LINT    Documentation/devicetree/bindings
> CHKDT   Documentation/devicetree/bindings/processed-schema.json
> /foo/linux/Documentation/devicetree/bindings/usb/typec-switch.yaml: properties:compatible: [{'enum': ['typec-switch']}] is not of type 'object', 'boolean'
> from schema $id: http://json-schema.org/draft-07/schema#
> SCHEMA Documentation/devicetree/bindings/processed-schema.json
> /foo/linux/Documentation/devicetree/bindings/usb/typec-switch.yaml: ignoring, error in schema: properties: compatible

Probably you messed up the syntax in the enum. Just open some examples:

git grep -C 3 'properties:' -- Documentation/devicetree/bindings/*/*yaml

Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml

Best regards,
Krzysztof
