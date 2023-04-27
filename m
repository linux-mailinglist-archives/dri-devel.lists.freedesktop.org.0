Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62EE6F052B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 13:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39810EB2A;
	Thu, 27 Apr 2023 11:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483D10EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 11:51:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94f32588c13so1250083166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 04:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682596259; x=1685188259;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/U8022l7mHUGcldCwvJeFjZR427WweXwOcu0tAZDrlc=;
 b=rxMH0o5jEoUqXw/uhwHEfcG1YgppYBA2BTBBKT4VoF648yJH/MNCrs5gvvrJeWAgqw
 JF1y/iPR9Pu4TUyeHq7wno2RrUvBrF8aIPAkvKToZ2+y5aTMPCa2LIpF3DscHQg2opwn
 1r3TnT70zud8Aeg6Ps+Gfj1tZufIPN4LjTauNhUcI941priHyYc1GZzTDsHuZ0XleLEJ
 CKdw1+fonH2GygA9GsFt77tmGE6S/2Vtp9x1+uaU1KTjDDEsLh7IQIHFiOHGBBW1A19P
 gfnzUbCUvkLoz+6LKBkHzMI+luoYDQZAHHKGKWuKK0kWAe/cOVN0YlkgycAhjCvP1KBp
 Yxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682596259; x=1685188259;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/U8022l7mHUGcldCwvJeFjZR427WweXwOcu0tAZDrlc=;
 b=BxCc0G9xLQlGurtCZJ+3UjqJJDBB4mCDhRRVJlqo2ZXyXnbn2Ae50eet7KymHHOkR2
 2F7SbhMmca0umkfzSvk+27L1QmYW0oD7JaJ1fDurA7grkV6khS9MFyD4O+0T1xDqL7W5
 mf6/o/ZTzjstTEmZMtkce/Dthm04eSNHRJqhaPMiVvRarpRfS19Gpd9gYcYfR9wCPAli
 fXrJ+b7s74XZTeeUzpFTRHiBmAfGIMk80W+Oqgp5tamjYfFQfxmaK0P70jbT+h2kAX0Z
 HgmUnZJ20EdS3IncPmezYtN/7/ivcAQlcIstg8u24ab2w2rByrY0DCsE/wkF68O2hade
 zQ3g==
X-Gm-Message-State: AC+VfDwZbaVHrif4rsIPo7EdtPvANb8ucETzu1qQAuIYMDJAViMLWLyV
 cX/vYqJSRYdvO8TjfgH7iEHjjw==
X-Google-Smtp-Source: ACHHUZ7CMJEly2JPLzNjo5s0lu4TU4z9vQu1hHyYv5J9+qbzaDr8LaNU3GMb8fTnHm7lq5c1JJBSVw==
X-Received: by 2002:a17:907:970d:b0:953:45ef:1437 with SMTP id
 jg13-20020a170907970d00b0095345ef1437mr1574174ejc.31.1682596259126; 
 Thu, 27 Apr 2023 04:50:59 -0700 (PDT)
Received: from [172.23.2.82] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a1709064a8400b0094ecf61289esm9594545eju.152.2023.04.27.04.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:50:58 -0700 (PDT)
Message-ID: <4a5ba8cf-5c24-2e76-4eb2-e05c7d8dfc72@linaro.org>
Date: Thu, 27 Apr 2023 13:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: simplify compatibles syntax
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Xin Ji
 <xji@analogixsemi.com>, Thierry Reding <treding@nvidia.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 12:42, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just const or enum because it is
> shorter and simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230406. I hope it applies cleanly...
> ---
>   .../display/bridge/analogix,anx7625.yaml      |  3 +--
>   .../display/panel/sharp,lq101r1sx01.yaml      |  4 ++--
>   .../bindings/display/solomon,ssd1307fb.yaml   | 24 +++++++++----------
>   3 files changed, 14 insertions(+), 17 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Should I apply those patches ? Until now Rob finished by applying them.

Neil

