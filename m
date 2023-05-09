Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271A6FCCB9
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22210E3BC;
	Tue,  9 May 2023 17:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB2C10E3BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:27:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so11631616a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683653252; x=1686245252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J+U7jnsW2/1Szwj7XNnMB+Dl1Vt5i2Y6UVGTsdY2yRE=;
 b=y6WgmsHadAoYTbdHt4d9/+ltM/rkVmQJYqIp3wrtivu8aCZM6JyEwJqB9wOw6XS1Ql
 LBCcM+55a9TyM5Ph9j1PQ4MnjISAsm5XPOcyDvW/clLUs1Ug05S8byRNr8Y+PBZS9jys
 18z2phD2//wqm1Sme/nGHNJLoVEkxG+sUvKThqZfQM1TNTjYjdw5In0aTC3XnxClI5NH
 A/dNWFlPlwqTZTtbzqjYAY0tfe2ZZr7GIh6eqwLwK/yRBVmT3QadLp2fSyqErs4ceIdU
 lVzn3hEM7sPHgw3qs2qGUBPOx8tpgI+iRifImN8h4wMCepIKs9+PnN8jB7XrAWLDzBRW
 8isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683653252; x=1686245252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+U7jnsW2/1Szwj7XNnMB+Dl1Vt5i2Y6UVGTsdY2yRE=;
 b=Eyf5AIiwT0SCPA72uFkbC95IQ9M82GpQD0wdpgIlspQw+npAZS/bpXuWTHk1NC9VtO
 NsJ5aX74z4xzYFHKX+yMfeE4rsttxe9heqS+t7RX2NbnpZH96i0iNF8eVSEVmIhWy1ZE
 /lfyZ7O+dyhodo2x7SptC8I7Bmt7Svxf3x9NrljnxD20c6MKkx6FntHneCV0193FxHa6
 kfzHSVGHG1KGLw+9t6ZoNXZzx6RI0h8HoHOLjSHzcsM4oCP2YH2W/v2jW5sNJ9b0MLIy
 RbTAcVuwyeUfYp6ZHgE1AKU2mMO2koZysonh/KrreyVdGzm0/tcdVrD0XJsFJoYS2QNu
 snPA==
X-Gm-Message-State: AC+VfDzjiGOtYnkCdiqrIy21vHNXgkQwHPH+8iXX4mD3fxD5s22X/hvI
 G9cTdEwM9nB7yi578+dxJdYAcA==
X-Google-Smtp-Source: ACHHUZ5G7QdEL3IgRrvlwboHSIWNmO4QxuaUfdbM5PU4g1EYtGYyKUbDrt72B1UTpqVoCV4n5PY9OA==
X-Received: by 2002:a05:6402:1490:b0:50b:d462:7e0 with SMTP id
 e16-20020a056402149000b0050bd46207e0mr11779678edv.28.1683653252345; 
 Tue, 09 May 2023 10:27:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
 by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b004bd6e3ed196sm969314edb.86.2023.05.09.10.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:27:31 -0700 (PDT)
Message-ID: <d64eaa1f-1dd5-2037-8494-95ae456d92a4@linaro.org>
Date: Tue, 9 May 2023 19:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: display: hdmi-connector: add hdmi-pwr
 supply
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
 <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
 <168349474255.3488452.11372136807020227216.robh@kernel.org>
 <20230508025623.GS23514@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508025623.GS23514@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, freedreno@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 04:56, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Sun, May 07, 2023 at 04:25:44PM -0500, Rob Herring wrote:
>> On Sun, 07 May 2023 23:12:16 +0300, Dmitry Baryshkov wrote:
>>> Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
>>> pin of the HDMI connector (together with some simple glue logic possibly
>>> attached to the connector).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/connector/hdmi-connector.yaml  | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> The issues below don't seem to be related to Dmitry's patch, are they ?

No, can be ignored.

Best regards,
Krzysztof

