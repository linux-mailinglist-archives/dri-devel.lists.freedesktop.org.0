Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E547C649B06
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAEE10E171;
	Mon, 12 Dec 2022 09:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1A10E171
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:23:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id p8so17491657lfu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 01:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O5Xz0UjmZO33d9kwCYmG2a788s0KOQR2cAx6RTAdVUY=;
 b=j4OuqzbzvhrZTlhV4C0BdFHOs6n4WWdaUMDXRB+LUUfnAwdjJrO8ocTMF5doVn36I9
 JfVPlD7a+3OtCGKAYZMeeGCiu5q1x+3Q/0OYcHQ82Tz1gHZlx97s8UsZEAGEhuCYur9w
 /sxkM1pC9I4ICn48DmnI+7BSy867EyZiJas/mzo+I0NmDt48xLqmBQUXiP/0oqKGEJ5N
 rkjjWZDBaryrMF6D43Eur/iN97pbgrvFBHqIZ/+eZMUeqMUqDB1yso612fWbFBAyooeU
 vReXnoBaQv101czcoK4bQp0fIgulKQiKMzQMqjlqYR+SdgQc3o2ZVTN+bZLrCqAZQ3H4
 D+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5Xz0UjmZO33d9kwCYmG2a788s0KOQR2cAx6RTAdVUY=;
 b=rHf2pRtk3JjT9YLIMLhw3k/yHZtp0Quc/ACg5q5e0/yLXmiztODZD+1t+1WdAuKdC4
 wVvtVN+fpu0N+5QnAtq67cD7a51M/U8YbZfOCpqpdvkvwgS4BmGPz6QOYYX5icLUMUk6
 UksNJi5RVmcEei2Wreh+6aFCpaJBZM2QWBYbJ8A29w7Tz57BNWlXDy8QBEWPXlt/Jltl
 UwAeJobHZwaNUd4N8hQ7kdsU3ek4wljBJISu0lQEyids5WBSp7UYstAzz+WcbHBs7exH
 J83Man8tgOSmjfoBvFmMXBKr6nJ5nwNpIpAIFfSrtcxRQiDiN2FoZhN9RFh74s8s+7jb
 fYKA==
X-Gm-Message-State: ANoB5pn1rt/vd0k55hDyrjqyzDeBOYJyaC856oUxAfh01GZY34xJeGx3
 QxP7RrUvJdt5fFCbNqn/eDgufQ==
X-Google-Smtp-Source: AA0mqf4StnPxyrh9hAdG+5R1WUC0F7PP+Ys0QmLS9km4WUGJ4bpAvBzPCgyJL6Krmmi6LuiVeYADFQ==
X-Received: by 2002:a05:6512:2382:b0:4a4:68b8:9c36 with SMTP id
 c2-20020a056512238200b004a468b89c36mr6486168lfv.30.1670837009074; 
 Mon, 12 Dec 2022 01:23:29 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056512324600b004ab52b0bcf9sm1558968lfr.207.2022.12.12.01.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:23:27 -0800 (PST)
Message-ID: <5f61cc70-9501-ee4e-010f-5188f87e3ef1@linaro.org>
Date: Mon, 12 Dec 2022 10:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w> <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
 <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/2022 10:09, Frieder Schrempf wrote:
>>>> This does seem like a hardware bug right there, can you double-check
>>>> this with the hardware engineer ?
>>>
>>> Yep, checked with hardware engineer. An 470nF is attached, together
>>> with an
>>> open drain output and only the internal pull-up. So yes ~113ms rising
>>> time
>>> until 0.7 x VCC.
>>
>> I don't suppose you can have that capacitor reduced or better yet, some
>> external pull up added, can you ?
> 
> Actually our HW engineers have implemented a similar RC circuit to
> provide a hardware delay for the EN signal. I think this is due to a
> design note in the datasheet (see chapter 7.4.1) and therefore it's
> probably widely spread.

If I read section 7.4.1 correctly, it would be enough to just add delay
Ten=1ms instead of the capacitor, right? And that would be
device-specific. But if one chooses the capacitor solution, it becomes
now board specific.

Best regards,
Krzysztof

