Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5D5F502E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 09:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B682D10E45A;
	Wed,  5 Oct 2022 07:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF64C10E45A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 07:11:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r13so3035585wrj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=B4NuR15p1M5h+Qpf+trsp5mYdzxvdiwFoP+0+HDomaA=;
 b=TuK5WGh0hEIyfywa/E8MohJHIfkBV4b2cRp99lOsAUg/E/4ktietnlg4HZGuIHCBlK
 yVwXX9K7be9jl4x/XN65u6YZ2QT5yoEVFV/Z0l66h8Pcnh5bCVujYYwEH+RRa/3wlxSX
 F6F1REJPglaOz3SyvhsJ/7PwDIGXBtkIO0D9/Lgv091Bu2h4lBO91wwY7eNu4Nzpg2W9
 lV19fbIMkKJADRZVksT/KtnYzkiw09kquLpZ0kyp8VdgIWV+mFVbyMT5fZBlJnN4ZqlA
 9buxUhkk0mL+M0BvnNWs3NzZkAnUFi+wW24E5A2DAPk44yeOy/z3CO2VP7wXq7NAiZVO
 W3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=B4NuR15p1M5h+Qpf+trsp5mYdzxvdiwFoP+0+HDomaA=;
 b=igqABY/uCIjtuHxWQRVQJg0KW4OB3979Oe3EVeR30VZzjqRY2hyV2+nzXRucY6ica9
 BCHHKftuOmGrjkUPSKqLyNIN4YvDONNFx7K1Dz9zKMdp9LZ9QKsR4J9gWuLpqZL6q92+
 szLUZyKFMjArRGDDyKV8MwrgNzGd6FDqTiqJGlQIBjYEYsr36Jb84tVrZhr+0xjOVPaf
 r6wt/IKzhoqmWyXEuuHyZR1qHR7BpRYZmJJCtp0r0RpdNYyF9b3wJWRNe/obp8g9Ig0E
 pK0BOeKUCqdSTUp7qgi6v7gcxypY1zB86uIcLAD1r5e/82cJzFyXlFzmJMra+n8k6ihF
 cQmA==
X-Gm-Message-State: ACrzQf3Ok/3EcIyjIvAofrDrKW0FwoZ0Tgg2XL2VTjCP5kPEIYnkouEY
 n77bzjb2NTqlhp9MMjgurrPzUA==
X-Google-Smtp-Source: AMsMyM5Dd3WxdNnd9W4ljS+WL4sP+ML6m11PngmoIu9sDz9xnz0n/YxZIW53GLiY5XtM0gP+ujnwKg==
X-Received: by 2002:a5d:4581:0:b0:228:a8e5:253c with SMTP id
 p1-20020a5d4581000000b00228a8e5253cmr17416176wrq.506.1664953873383; 
 Wed, 05 Oct 2022 00:11:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:94af:b87a:5119:ff73?
 ([2a01:e0a:982:cbb0:94af:b87a:5119:ff73])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a5d6dc3000000b0022e3cba367fsm7752494wrz.100.2022.10.05.00.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 00:11:12 -0700 (PDT)
Message-ID: <720cc44b-a6fd-5424-1db6-fda1290c23e7@linaro.org>
Date: Wed, 5 Oct 2022 09:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen.chen@ite.com.tw
References: <20220929014456.30077-1-allen.chen@ite.com.tw>
 <20220929014456.30077-2-allen.chen@ite.com.tw>
 <aaf68eff-17da-3f27-c8dc-48b9659e7b50@linaro.org>
 <087811c1bc224a468f117ca4f2fff3cd@ite.com.tw>
Organization: Linaro Developer Services
In-Reply-To: <087811c1bc224a468f117ca4f2fff3cd@ite.com.tw>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Kenneth.Hung@ite.com.tw,
 andrzej.hajda@intel.com, Jau-Chih.Tseng@ite.com.tw, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, treapking@chromium.org, Hermes.Wu@ite.com.tw,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2022 08:19, allen.chen@ite.com.tw wrote:
> Hi
> 
> data-lanes is output configuration. Maybe it is not suitable to put data-lanes in input endpoint.
> extcon doesn't have output endpoint, so I don't know where to put is better.

Ok it wasn't clear enough

Then rename the property to something more specific like:
ite,dp-output-data-lane-count

Use the same naming scheme for the other property:
ite,dp-output-max-pixel-clock-khz

Neil

> 
> -----Original Message-----
> From: Neil Armstrong <neil.armstrong@linaro.org>
> Sent: Thursday, September 29, 2022 4:40 PM
> To: Allen Chen (陳柏宇) <allen.chen@ite.com.tw>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; Jernej Skrabec <jernej.skrabec@gmail.com>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Jau-Chih Tseng (曾昭智) <Jau-Chih.Tseng@ite.com.tw>; David Airlie <airlied@linux.ie>; open list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; Neil Armstrong <narmstrong@baylibre.com>; open list <linux-kernel@vger.kernel.org>; Robert Foss <robert.foss@linaro.org>; Pin-yen Lin <treapking@chromium.org>; Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>; Rob Herring <robh+dt@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Andrzej Hajda <andrzej.hajda@intel.com>; Jonas Karlman <jonas@kwiboo.se>
> Subject: Re: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict output bandwidth
> 
> Hi,
> 
> On 29/09/2022 03:44, allen wrote:
>> From: allen chen <allen.chen@ite.com.tw>
>>
>> Add properties to restrict dp output data-lanes and clock.
>>
>> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
>> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>> ---
>>    .../devicetree/bindings/display/bridge/ite,it6505.yaml | 10 ++++++++++
>>    1 file changed, 10 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
>> b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
>> index 833d11b2303a..62b9f2192202 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
>> @@ -52,6 +52,14 @@ properties:
>>        maxItems: 1
>>        description: extcon specifier for the Power Delivery
>>    
>> +  data-lanes:
>> +    maxItems: 1
>> +    description: restrict the dp output data-lanes with value of 1-4
> 
> Can't you use the data-lanes property in the first port endpoint ?
> 
> Look at Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> 
>> +
>> +  max-pixel-clock-khz:
>> +    maxItems: 1
>> +    description: restrict max pixel clock
> 
> New vendor specific properties should have the ite, prefix.
> 
>> +
>>      port:
>>        $ref: /schemas/graph.yaml#/properties/port
>>        description: A port node pointing to DPI host port node @@ -84,6
>> +92,8 @@ examples:
>>                pwr18-supply = <&it6505_pp18_reg>;
>>                reset-gpios = <&pio 179 1>;
>>                extcon = <&usbc_extcon>;
>> +            data-lanes = <2>;
>> +            max-pixel-clock-khz = <150000>;
>>    
>>                port {
>>                    it6505_in: endpoint {
> 
> Thanks,
> Neil

