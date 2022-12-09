Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C7647FD6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6284A10E506;
	Fri,  9 Dec 2022 09:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674F10E506
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:07:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b13so6064690lfo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ybW+aCgYd8tZxSihqCA8moOMAzb18/wt69cgYIeTQLA=;
 b=nBVQ+SkVhs3wwQPEnbXQvi8xQ3RpYbSkKWRIHcKT6pb0G4T4u5oKTdg5AIIzVp5QHa
 wwp4Ki+AmN/jd394VY4agdyYhqjo5oTL47fyenY+zFI/0c1w1LSpMusItzVR690S9EPk
 sRUS52upPS/qDLw9IYnKntnX2Agro2RQuJCwWxcp81edDraH3q6u4xiZsZtNNyhMkGcT
 xhwMzuwEcw/j6Mi54GCXl4nISVjE0iRFG5jXmAnCqt5sQdk6F5Elj0AYdvs6O9XxTB4o
 WrA9cpkMzg3+MnzbF+spFmYPO2kE7nXjyYdvwCD4EPx761r9LBHeUNeN9wtMF9pC02zd
 Nu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybW+aCgYd8tZxSihqCA8moOMAzb18/wt69cgYIeTQLA=;
 b=h9QM40aae9Lmeganu65Tp8J8jSP+gCxisf7V58GPf5iFUgU1VKkfi7x4UclwbL8PkP
 mwHdAOTSVi/kxLjorCg/aUFWh1EA/vB6VRvoxq4tMCgreQ8+0163Kon6PLYJKb6BfahB
 0GZsMwsNxZ+pEMHuerc/XZObPPy4Xx5wwz48bGKuDF/Ig3ax5j9UTJdJKNxktrZ9x0RF
 gIeyUoiqwjmSqiLwLB5t/RFGdCXgiHrNOn3dQEsx0S5gOcbaxozj43h8YB/yxpq909WH
 fmCbV0Lr9PEeo5PkgBQY3+FN119me+6iQirZUatFA7AT2jfoguSTu47nPj+z1qUgL20M
 wOTg==
X-Gm-Message-State: ANoB5pmHWhM1Zu1e4sxTMis1KD8IPYm9pBTHv4oqlVhTu2yOWPhxkOoQ
 N4uMcJLb+icifABasFGhZWV0zQ==
X-Google-Smtp-Source: AA0mqf7xqh4G/QTp1tz9wqt0dVEe0iVKnhHfr9sUq5VI81q6jrWkJVeObQvPjWJn+GyWT4tZSNB7xA==
X-Received: by 2002:a05:6512:2007:b0:4b5:650b:ba3f with SMTP id
 a7-20020a056512200700b004b5650bba3fmr1340506lfb.12.1670576867136; 
 Fri, 09 Dec 2022 01:07:47 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 cf27-20020a056512281b00b0049fff3f645esm175958lfb.70.2022.12.09.01.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:07:46 -0800 (PST)
Message-ID: <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
Date: Fri, 9 Dec 2022 10:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <20221209083339.3780776-2-alexander.stein@ew.tq-group.com>
 <07fbe219-9034-65f6-963a-037de9bb6d79@linaro.org>
 <7463917.EvYhyI6sBW@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7463917.EvYhyI6sBW@steina-w>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 09:54, Alexander Stein wrote:
> Hello Krzysztof,
> 
> thanks for the fast feedback.
> 
> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
>> On 09/12/2022 09:33, Alexander Stein wrote:
>>> It takes some time until the enable GPIO has settled when turning on.
>>> This delay is platform specific and may be caused by e.g. voltage
>>> shifts, capacitors etc.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>
>>> @@ -32,6 +32,10 @@ properties:
>>>      maxItems: 1
>>>      description: GPIO specifier for bridge_en pin (active high).
>>>
>>> +  ti,enable-delay-us:
>>> +    default: 10000
>>> +    description: Enable time delay for enable-gpios
>>
>> Aren't you now mixing two separate delays? One for entire block on (I
>> would assume mostly fixed delay) and one depending on regulators
>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
>> second delays in your power supply? If so, the first one might be fixed
>> and hard-coded in the driver?
> 
> Apparently there are two different delays: reset time (t_reset) of 10ms as 
> specified by datasheet. This is already ensured by a following delay after 
> requesting enable_gpio as low and switching the GPIO to low in disable path.
> 
> When enabling this GPIO it takes some time until it is valid on the chip, this 
> is what this series is about. It's highly platform specific.
> 
> Unfortunately this is completely unrelated to the vcc-supply regulator. This 
> one has to be enabled before the enable GPIO can be enabled. So there is no 
> regulator-ramp-delay.

Your driver does one after another - regulator followed immediately by
gpio - so this as well can be a delay from regulator (maybe not ramp but
enable delay).


Best regards,
Krzysztof

