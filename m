Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334F542B5B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A501F10E4F0;
	Wed,  8 Jun 2022 09:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAFE10E4F0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:21:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq6so27178995ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=b6d5Zv3xL/KRcHb8xiVxMyuc8Dp70Lb5vZZ6lK/eQQ8=;
 b=aWRg82jWnaqTYIJkWdAoYFsulyS+0ED8k9qWSWTafVRswt4QT/KPr/HCidmmrSSJX8
 tfca1NHPxgMJmxYSHrD/3zNh5EPJ31fwoiCsD1K8O5c/O/8/JWOsSPzC89o6EWXn3pqP
 gzEWvKriNebG1p7w2dC9QI4gxrEsRsuRmS/c/4Ip2KOQroKlr16Fuy4Jj9vhiJOofPMK
 K9w0Dz7H1NZzSdze8fZB6cOPgsvaSwWUKasKI8GTMIsVTk2eKLHwG2VFP6qzKTaOHWcw
 U5xnEL/rRNieyscQYA52PqHA4mHngv/wQInPwTpT5Z/EOOq+AJrSowSntyREp7fNuEPm
 DzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=b6d5Zv3xL/KRcHb8xiVxMyuc8Dp70Lb5vZZ6lK/eQQ8=;
 b=dAOxk+MUhkSDfUvgXUvnCS894BZtYEWmZnJWmXmLweq0XkftRFT5hM1zw93DIvEJ8b
 IMcetKVMNubY9Z22E4bJ2rQENJvNDAxn+kxjHGxSZsh+LdN5JPQPLnRfNlMqOrmrakFS
 0qRbwBfI19ctCQ+S/WsA84f2a63gVYuTDESOra9FMGVfyArC9ramxTyOllpF+2RzI/oH
 JnTTklDjtN1JBqgKMzZDCzAe/7S7YDw06TTOhVXct8cmgw5a7VcxhUwbU/T0jGnzlNS+
 iUMU+Y6G8XFLYCmkz27vAp5WH5zEB2caihkv1JJjPl30a3vtdqG4NuYCMb+lW1oCVkmU
 K4lg==
X-Gm-Message-State: AOAM532q8hIixwCF6oi0Kchn5sCE6AA1Kv3B1c988Hh0LIa737TsQCLd
 uCxYf/Cg0b/LEApvTvlaGDLARQ==
X-Google-Smtp-Source: ABdhPJxz145Vpj4ktqjR1qJFt+oTGwPOr1TCBpytpxOHAUmGx3AhpWrzgmr1hjNaMOMoO/gmolJmTw==
X-Received: by 2002:a17:906:180c:b0:6fe:9a3e:3d5b with SMTP id
 v12-20020a170906180c00b006fe9a3e3d5bmr30464668eje.202.1654680103174; 
 Wed, 08 Jun 2022 02:21:43 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p9-20020a170906614900b00711c7cca428sm4515540ejl.155.2022.06.08.02.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:21:42 -0700 (PDT)
Message-ID: <0d891f54-4a81-549b-8365-fb40cd077c83@linaro.org>
Date: Wed, 8 Jun 2022 11:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: usb: Add Type-C switch binding
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-4-pmalani@chromium.org>
 <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
In-Reply-To: <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 11:18, Krzysztof Kozlowski wrote:
>> +anyOf:
>> +  - required:
>> +      - mode-switch
>> +  - required:
>> +      - orientation-switch
>> +
>> +additionalProperties: true
> 
> Why true? I see usb-connector has it from commit 6a0e321ea735
> ("dt-bindings: Explicitly allow additional properties in common schemas")
>  but that looks also weird - this is not a common schema, but a
> complete, generic one.
> 

Ah, I see now, the parent device uses the additional properties. It's
ok, skip the comment.


Best regards,
Krzysztof
