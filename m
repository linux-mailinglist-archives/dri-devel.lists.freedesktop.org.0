Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13C51F494
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 08:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E17510E4FA;
	Mon,  9 May 2022 06:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB1C10E29E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 06:38:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ks9so18404380ejb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UV9zjmHYlW+6A7MQ6c6pItDR5gnRmcinDnUlAmO8o4s=;
 b=hzjmM6oUphOTv/1VPY1VsofK8BtDOdAvdqw4l2wRm3nyyk3knoYA+470tzaBgBWByW
 oEx9yq4xf8wLj8MarLGMhbvPhJitxVqIkJndkI0RUgIahTHHllfHLmQ2Cr3DEPh8mprK
 T3jeoqxaCup6Y39F7tDd3zWaxPGAX0dtt4CaEzuZogh/QsUqL5yB1rdpHej9KjW1zq2I
 4dL4ePYA2i/GnSoUFPfAHtketeRvOuxR+KBqGYwlAIN1Nv1AuSBG+gczDO8xiEQDEwCZ
 hjMEsjHmmft2ZOAncTFIIHmOZE9IOLHUXfBC+/3qUVuevlU0m7kZ1HcWMDpVEMfE5Hfs
 GzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UV9zjmHYlW+6A7MQ6c6pItDR5gnRmcinDnUlAmO8o4s=;
 b=B+/hCFiisycwLAq8eoIqe+zxON+8w8KvzOksVyR3hs4XNXBzBsOfyEZz/KZX8Ulyeg
 WWrDGGbry8JWEzWwR1FIlj8JQ647B7bdHOHwzERFPtL1DqLP1e5HCQDgo7HxGzLnfrTO
 WUbhI837Wjs54gAOnNV4HAZAFOha5VEOEeD3smzcGs5hjE2sVrb+aAfoWNFT5mIRSDw/
 QoSNTlkvoktqdVCyBFoJQ1d0C7jizb0JAw+FIOnxkREy1Dxv68FzHJCBzYJSaKINWCSc
 LNxv7W5u5/AWBpN6G0gljsDIo33BAVtNcch64WkUVpAsiCd6vgB3fxSnotFB/MGoX8jT
 +UVg==
X-Gm-Message-State: AOAM531XIf5nTAh31DN0iM8AztxZINlVmXEO/To4IpsqxUnct2/NPhmP
 14QpIwBCnW8WcfTv/4xjgoCArw==
X-Google-Smtp-Source: ABdhPJwods/7Sd25/CejtLdRC3yOQ4HyzjC7vaMwqSaAKsR5nOmQu3wz5BjBUvUcVGvObNORipndng==
X-Received: by 2002:a17:907:8693:b0:6f8:635a:1d32 with SMTP id
 qa19-20020a170907869300b006f8635a1d32mr7747735ejc.663.1652078333319; 
 Sun, 08 May 2022 23:38:53 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mj9-20020a170906af8900b006f4c82c2b12sm4693247ejb.19.2022.05.08.23.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 23:38:52 -0700 (PDT)
Message-ID: <0fdfcc16-7b80-47e9-709c-648d3a0cd6fc@linaro.org>
Date: Mon, 9 May 2022 08:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Content-Language: en-US
To: Joel Selvaraj <jo@jsfamily.in>
References: <2ab35af2-b067-4243-35ed-a592a7046374@linaro.org>
 <BY5PR02MB7009A604AC912DC78FAF42A5D9C69@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB7009A604AC912DC78FAF42A5D9C69@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, fanghao11@huawei.com, airlied@linux.ie,
 shawnguo@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@rempel-privat.de, robh+dt@kernel.org,
 thierry.reding@gmail.com, clabbe@baylibre.com, phone-devel@vger.kernel.org,
 sam@ravnborg.org, stano.jakubek@gmail.com,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2022 07:08, Joel Selvaraj wrote:
> Hi Krzysztof Kozlowski,
> 
> A quick question.
> 
> On 07/05/22 21:02, Krzysztof Kozlowski wrote:
>  >> +  backlight: true
>  >> +  port: true
>  >
>  > Both should not be needed - they come from panel-common.yaml. They might
>  > stay in list
> 
> I see that almost 54 panels mention "port: true" and 46 panels mention
> "backlight: true". Almost all panels refer the panel-common.yaml too.

They need them only if they use "additionalProperties:false".
> 
> So I think specifying them as true is just for extra clarity that
> these properties are usually used by this panel? But I am not very sure.

If they don't use additionalProperties:false, then the explanation could be:
1. Just for clarity as you say, because they might want to require
property/node which is listed in the properties, otherwise it is a bit
confusing.
2. They were copying first example without actually checking...

> Should I leave them be? or it's still recommended to remove them?

It's not a big deal and I do not have strong opinion, but I would
propose to remove them from list of properties and still keep port in
"required"


Best regards,
Krzysztof
