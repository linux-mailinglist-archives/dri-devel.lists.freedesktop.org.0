Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D36B38E8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32710E989;
	Fri, 10 Mar 2023 08:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8683810E984
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:38:21 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id ay14so17305126edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8P0RjPPjJ6gDx/O+UOt7XYuZJFBYo2c+dJvtzrcfc8=;
 b=Qm6w9iISowR+oMVJYM/hQSnZ4JRKkanoVQFKUhlTESl8dqbNr4Qghw4HziigDxrHb+
 3uCO8RrB0vZVGj3UAekguMmehIXsYMTd1fjEMpnGTvZWSntMe9MxdJc9TCxeN1qRnss1
 9x/nQEu0IpMw3T+pD7CKP1FZIqqKK3F54sneBXx1k+LoI2TVcVgBMOdtduWQIqOMNt5E
 F8xY8xlmYVP+l3SrXc3O9D7anX14xNKTDiBvRrCnIK91MDso/N8+UvT+qJ1iwRDjSu9E
 h+xcHj5cMsZYP8lylmurMTu8vfkN8t8MS0IluatHJWeHR8WkV+ikebzhhc6GDU/bIGIg
 StaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8P0RjPPjJ6gDx/O+UOt7XYuZJFBYo2c+dJvtzrcfc8=;
 b=XmDaG65p4JUfiroO/AgOT6eyFg/ZVDbnzK6xqNXNMs9i6JRJzEEUfMqilA0EH2IN7a
 3ydezV0dy37jGB2uJKazPbfCLD27ER7t1r0GnnIjJESV/gBNkwqToyytCQLzwKj6ViWT
 UWXsUr3cQDspfOxthKYRWEbHJl5rwJBIuzSIJzgC991I/R9HzBwsE5x41uXL6E0jyKdq
 KJQbnPyi2hkac8WCGWE5R9A+6N36ADpSWdTkM2I9Bz+mTYVlHKV2IIegkg4JkDNg8DOC
 YFJy4LSNMW9W0CU+uWZ6YUZOJBqGTCyt3P+TvhAeSNaypGyEBaQqOIzEU+yrueFHW1+1
 U0mQ==
X-Gm-Message-State: AO0yUKUREgtn5JWYc7mwcxZ6NiOWLnE0RFoxn3iXVRBDpO+g30Ir0Rvl
 MotGTbacmnju9/YF68A2UlR28A==
X-Google-Smtp-Source: AK7set9lDeUYOs5nAUvtFokDH1WpVjNALEB4b0oSQYXxs4FuVsLXJyZ8SKM7u+8wBouXS4esT6UkBQ==
X-Received: by 2002:a17:906:2a55:b0:878:66bc:2280 with SMTP id
 k21-20020a1709062a5500b0087866bc2280mr24741630eje.12.1678437500095; 
 Fri, 10 Mar 2023 00:38:20 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a17090668c500b008ee64893786sm681605ejr.99.2023.03.10.00.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:38:19 -0800 (PST)
Message-ID: <89e8b1a4-8063-da12-1b91-a9d7bf82fcde@linaro.org>
Date: Fri, 10 Mar 2023 09:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding
 for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-8-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> Display GAMMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

