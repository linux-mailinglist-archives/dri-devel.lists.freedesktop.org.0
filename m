Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAF70B80E
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584610E27C;
	Mon, 22 May 2023 08:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978910E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:53:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-3f6042d60b5so9128665e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684745588; x=1687337588; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r4JxhaVexhQpy8daiRNDw+XTd4Z91THI1tcDfW2c6HE=;
 b=hGYIQsrsHnFEjQuK41XgS3jgFHGmSkmDmGtZqfqKbMqaw1+roK7luzJGgf6MkEI2zf
 LqSzON1Zmed3SV4ToTWAPBXTyvtUhV9/8BCRoPKLguRVN5e4YBErEdR6/iXkgr3w9zE5
 W4aKjz3F4KTe2c3j6kFwE4TdtneueV0LY7ZEt0yjmGJmTeBgneLZHGLd9Y5ags2ZDhae
 Q0TT+80cDnDkrcVtC6mKi1S3g1p/XIxKWym0HyRrbbgeMEikjwyJ03sHhQcufI7aiV4Q
 NEDGLQcwWgPgAjXuMgjJUDQE1/rby2Z3aJWEmCe4axLQbKwyT3jCR2BgkZU+gClV7wO/
 ACMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684745588; x=1687337588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4JxhaVexhQpy8daiRNDw+XTd4Z91THI1tcDfW2c6HE=;
 b=fgMIoaTpRW0MaT199eVgICy69EiPMOnxhAHCbxK7KAhfUj9HiegQG2CDv2QOOvRlP+
 HqU4gSaPrbN0s6yOpkHgljV3VKafkjkqbUOIPoPnC6gZRPf1X9uzEgazyp5Itu134QbU
 SDWvaCY8iqFACKMtrdfC2A0SbTdNehi9l5y5LGthtjWdKTg1x3n6pWW0YNcGHqm6RKAQ
 jIs7NJcwCe4Fe7cQN42UUdRTgwFcpdQApqkUu8MVdvCFWNHAiZX9E31CoSIA7UWaYbJo
 zulNTtB3Zx1FagIBnGYRr8VxQZ9UEMsNcGDy1/KQkaEK2RyM2AsGdEJykvrA0dNFSTba
 2Gyw==
X-Gm-Message-State: AC+VfDzeG8WJAFw2tYAK3Vk47NPxkDa4Cn/O51iJ1y30BQqxHhXtGttz
 UTBmxXx/JSXbgsmjwJPv/7dp2A==
X-Google-Smtp-Source: ACHHUZ6UBR3+LBI+m8V1SPTaOnzgCK0atCcXfHxkCN2098SLTc/lFSwqy+8q2uw7iLTos5PH9rKVCw==
X-Received: by 2002:a7b:c414:0:b0:3f4:2610:5cc7 with SMTP id
 k20-20020a7bc414000000b003f426105cc7mr6538472wmi.9.1684745588453; 
 Mon, 22 May 2023 01:53:08 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b003f1738d0d13sm24745899wmq.1.2023.05.22.01.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:53:08 -0700 (PDT)
Message-ID: <116712ae-f18b-3288-ac6d-80073aebd458@baylibre.com>
Date: Mon, 22 May 2023 10:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
Content-Language: en-US
From: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sumit.semwal@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/23 17:04, AngeloGioacchino Del Regno wrote:
> Il 17/05/23 16:52, Alexandre Bailon ha scritto:
>> This adds the device tree bindings for the APU DRM driver.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
> 
> mediatek,mt(model)-apu.yaml
> 
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml 
>> b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> new file mode 100644
>> index 000000000000..6f432d3ea478
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AI Processor Unit DRM
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,apu-drm
> 
> const: mediatek,mt8195-apu (or whatever else).
> 
> ...besides, I don't think that this patch even belongs to this series? :-)
> Spoiler alert! :-)
Actually, it does!
I forgot to send the patch that adds the platform driver ^^'

Thanks,
Alexandre
> 
> Cheers,
> Angelo
> 
> 
