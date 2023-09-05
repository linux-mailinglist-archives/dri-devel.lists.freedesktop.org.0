Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C15792FE1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 22:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F84110E503;
	Tue,  5 Sep 2023 20:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3296110E503
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 20:23:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so458611766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693945417; x=1694550217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W7FEvRnQff1RFIy6G/Scp5VfoqVl8Fl9R26EpZ41ssQ=;
 b=UWb2o/bwR8uFo1cLYEkY/3oVa8d7yZVwFOWvCx1Pat21awHgrn5tY7pS1xML/cjLSa
 bdWEHMEX7RpMrWkRZuFbifhTSzErVUHGJ6PjoJyA992unx1noJ1YTas0BPprmj/ObsA0
 K2hjqRj9ArLdJOnPrDRJXD4vLXIJKZMJqEOTl5xUqRWTj82J9gh7yq6sgGIczYVxg2FA
 TRcHQFdP3JoOxQ7Jw1mIt7zjQYjbWzIbTGEUxXHlqglilLKgmOfJIMyL1/LGZ1MRb7GB
 rLZIhC/EJ70EvkdRLRJwyr45MaoRE/iA6qThnxJGj0PUd3uRvYXTGC1MU3fQT8jMu9Z6
 jXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693945417; x=1694550217;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7FEvRnQff1RFIy6G/Scp5VfoqVl8Fl9R26EpZ41ssQ=;
 b=MsdgXOHv5WuyRcYribPpo40/jiVIP61FPxvVjwgs3w675TNSS8jaJPnD8FNYWRKemn
 qwHTzWfYA4ojyUYsW/T4DzJ8+kPlQ+RlGinvcItMmVgCSNjaQ2fBI9/Y958lxsRWhfIO
 P0yoeh9+Q997OBCYDtcibyhNu0oC4Zl9MGReEwlfllVviuvohfUsAaJ+myru0dqQHkNR
 POs++FDxg+H9KwoJas+vyza3uTOT0ffP+rV62O91ypBZfy3hwndzxjlWJ5n+NDkfhSaQ
 XsPC74qlYFWh26Ivq95cEQ/bRoWDWKMQrDRUnU4COfmrztGwP0Uo7Mvt+T4Szd2DwVAd
 crKQ==
X-Gm-Message-State: AOJu0Yw8RysokVHTU1bUcFb2x34wp6R/EfiANxkpszndm/4EuNH+YAAA
 SQpUnMlhIh9qU0pI+b48Biw=
X-Google-Smtp-Source: AGHT+IG2mFnmzU6dZ1Lll+hMk7JV4ZmDPpxt54hgKUw+BKq9w4jCarie89LEsaJFEj3D1lcN6wDTcA==
X-Received: by 2002:a17:907:b0a:b0:9a1:b705:75d1 with SMTP id
 h10-20020a1709070b0a00b009a1b70575d1mr579098ejl.51.1693945417163; 
 Tue, 05 Sep 2023 13:23:37 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:5b7b:492a:c913:71fb?
 ([2a02:908:8b3:1840:5b7b:492a:c913:71fb])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709066b9200b0099bc08862b6sm8166003ejr.171.2023.09.05.13.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 13:23:26 -0700 (PDT)
Message-ID: <755a2be4-6947-d756-2eee-0ba14086d781@gmail.com>
Date: Tue, 5 Sep 2023 22:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Maxim Schwalm <maxim.schwalm@gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: tegra: nvidia,tegra20-dc:
 Add parallel RGB output port node
To: Rob Herring <robh@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
 <20230807143515.7882-3-clamor95@gmail.com>
 <20230821161441.GA1743870-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20230821161441.GA1743870-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 21.08.23 18:14, Rob Herring wrote:
> On Mon, Aug 07, 2023 at 05:35:12PM +0300, Svyatoslav Ryhel wrote:
>> From: Maxim Schwalm <maxim.schwalm@gmail.com>
>>
>> Either this node, which is optional, or the nvidia,panel property can be
>> present.
>>
>> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>> ---
>>  .../display/tegra/nvidia,tegra20-dc.yaml      | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>> index 69be95afd562..102304703062 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
>> @@ -127,6 +127,37 @@ allOf:
>>                $ref: /schemas/types.yaml#/definitions/phandle
>>                description: phandle of a display panel
>>  
>> +            port:
>> +              $ref: /schemas/graph.yaml#/$defs/port-base
>> +              description: Parallel RGB output port
>> +
>> +              properties:
>> +                endpoint:
>> +                  $ref: /schemas/media/video-interfaces.yaml#
> 
> Just to make sure, what properties are you using from this? Usually 
> we'll list them though not a hard requirement. If none, then you just 
> need to ref graph.yaml#/properties/port instead and can drop the rest.

currently, just bus-width is used in devicetrees, but I don't think that
it is needed at the moment. So perhaps the property can be dropped.

>> +                  unevaluatedProperties: false
>> +
>> +              unevaluatedProperties: false
> 
> In the indented cases, it's easier to read if this is before 
> properties/patternProperties.
> 
>> +
>> +          anyOf:
>> +            - if:
>> +                not:
>> +                  properties:
>> +                    nvidia,panel: false
>> +              then:
>> +                not:
>> +                  properties:
>> +                    port: true
>> +            - if:
>> +                not:
>> +                  properties:
>> +                    port: false
>> +              then:
>> +                not:
>> +                  properties:
>> +                    nvidia,panel: true
> 
> I would prefer to drop this and mark "nvidia,panel" as deprecated. 
> Eventually I plan to add a mode to the tools to warn on using deprecated 
> properties. Having both could be perfectly fine too. You have the 
> "nvidia,panel" for compatibility with an old OS version and 'port' to 
> work with newer users.

The reason for adding this was that just one of them can be utilized at
the same time. Having both could potentially break the display output.
I think that all the other nvidia,* properties could marked as
deprecated as well because they don't seem to be doing much since commit
d9f980ebcd01 ("drm/tegra: output: rgb: Wrap directly-connected panel
into DRM bridge").

>> +
>> +          additionalProperties: false
> 
> Move this up too.
> 

Best regards,
Maxim
