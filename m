Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4D959770
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DC10E59C;
	Wed, 21 Aug 2024 10:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="I6QYhTLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADAE10E59C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 10:00:14 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2701c010388so2658380fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724234413; x=1724839213;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H2vX0cAcL6u6kB8S2gDC6BZ0GpOYUqLhhMzp6ZJx/1c=;
 b=I6QYhTLARjlX7Tds1sw97wQlidpzzM27A7ncRVCcX00h1m2n7ddUPh/bpy+WeNAcm5
 kESqrgrAu39wkBHfCPkB+cyVHsZC8gzhOzfmfo2C4+EjPuTk/xsqCfbg5JrbAmaUyO+f
 x+XHjZ2oDcKU1Lr3jothTMFjaksPZ+Z2OPllE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724234413; x=1724839213;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H2vX0cAcL6u6kB8S2gDC6BZ0GpOYUqLhhMzp6ZJx/1c=;
 b=SGcJs93bWACrYok7d860w5JDCpRRgs4sQVuM7iGc4vVbXziONxVUcxumwXRmVmKIVo
 3bTRKa7olfPW2+RcWzfxuwIcwGFQgqDettFYQOwfDlDWKKv9576t7D3r6rKExvyPnTOd
 p2z48SWY2xJVQwk03K8LgrH9evGXmiZjlLbPkSqgaTUhsvpN9qWOfjGv1l595cf//KX4
 co4W24LA57I8ZheipX9E/aQOE0qP9X7UlkyevikXJ2E7rR29HHaoieNAS88IwMJu8Ozm
 6y69WTrTFV6st5XXSbmZ/KA1bimwJwjPujuW/WZE8qTVSRlQgBUmeZvi+6rREpp5t7dw
 byvQ==
X-Gm-Message-State: AOJu0YzB9t5qmWmN+ezyZ4AneGa5wqATXkkOSHLPTTU88UoIItb7OruF
 N8KEH3KNOTpZboVbazvWzEqZKrMarTCcEyg7WKZ97KWS6KQZZOXPhXSpu5hlfA==
X-Google-Smtp-Source: AGHT+IEX3F+CPJJNzHCWZtEffTW2KurhONpiKwuAK9S/tJd6nVZvVtWPiQDzzrQnSsCU/tnc7BEIEQ==
X-Received: by 2002:a05:6870:910e:b0:270:14cc:656c with SMTP id
 586e51a60fabf-2737eed86aemr2031331fac.6.1724234413128; 
 Wed, 21 Aug 2024 03:00:13 -0700 (PDT)
Received: from [192.168.0.106] ([103.163.98.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127ae07e41sm9617199b3a.65.2024.08.21.03.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 03:00:12 -0700 (PDT)
Message-ID: <abc3330a-58a2-4527-a101-81e2e6168abd@chromium.org>
Date: Wed, 21 Aug 2024 15:30:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240821092659.1226250-1-rohiagar@chromium.org>
 <20240821092659.1226250-2-rohiagar@chromium.org>
 <415a27c7-dfdf-4cc5-9aaa-1681dd32ddcb@kernel.org>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <415a27c7-dfdf-4cc5-9aaa-1681dd32ddcb@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/08/24 2:59 PM, Krzysztof Kozlowski wrote:
> On 21/08/2024 11:26, Rohit Agarwal wrote:
>> Add power domain binding to the mediatek DPI controller
>> for MT8186.
>> Also, add power domain binding for other SoCs like
>> MT6795 and MT8173 that already had power domain property.
>>
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index 5ca7679d5427..864b781fdcea 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -62,6 +62,8 @@ properties:
>>         - const: default
>>         - const: sleep
>>   
>> +  power-domains: true
> Missing maxItems. I don't get why did you change this...
>
>> +
>>     port:
>>       $ref: /schemas/graph.yaml#/properties/port
>>       description:
>> @@ -76,6 +78,23 @@ required:
>>     - clock-names
>>     - port
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt6795-dpi
>> +              - mediatek,mt8173-dpi
>> +              - mediatek,mt8186-dpi
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
> This part can be dropped. Just disallow it for other devices.
I was a bit confused here.

Can we add something like this?
if:
   not:
        (mt6795, mt8173, mt8186)
then:
     properties:
         power-domains: false

Thanks,
Rohit.
>
> Best regards,
> Krzysztof
>
