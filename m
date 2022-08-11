Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F158F903
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477A711BCE9;
	Thu, 11 Aug 2022 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8792A44
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:26:56 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s9so18586548ljs.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
 b=FqWcBq881TMTPntLfTmspF/MO4q8vssSHi7sEwMMId7K8gaHZO7iDS19GycjfK/9eX
 cFkAyPoL+ZxgFs9dY8+KnKf6KghP2eQzh3/5e6CQ/yNuLXuxNR9SPKZrpjiyncVvDb3O
 XXeumafKovUw/dYZQxYK5tO0Uaaw87e+2IHMLlXkYC2LEPH0U3H7RPvoAztqsE04Q7FO
 Mf+k14XGfUr4CH3epxKAHe8GlAmmds9FGDbUI0nJLOb1IsNlO9dOjdxiEQQeUqdAQup0
 8VNiPpAsjtTUvBYLnnqxgnUTB3eLW0jqoT030lVtBRxB3+Ebqa1AV3PA1it84KPPmRUC
 l0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
 b=fyvDDYUD2WwnuH0pcIn32vkpn0hUXXqMLBQry6JWlfeTGLDqOvgnIZ1csg94EebEHm
 y9A5rQJw9yv+iIH+NhCwFPoV+yf2O7Oz/f7DkXNxuSZt37dXVbC+WFwe07C43N+ZZvLU
 GyieX0i4OVk9Uo72k5d1KDTWMn3U8ebFpR1/KEVIFC9Jtp6l0pgQLFcfgUEDt6brz6AQ
 ejGHf6lah9kW8bCphTHk41SZKt64LKhbyPSWjSoqcImz7Y/Cc/+gw88pqERbHoGhItox
 DVDO6Tw+rsIXvzk4NF0pzbZGFHAaGAj+3yBCXu3hvZ21I0toSUbgB2WFEdfYTNbjgX8b
 AQxQ==
X-Gm-Message-State: ACgBeo1DbwUiPPuXNpHOSR1UUAcbbS4hxMfllbTBGD1bHDW+uagvSXBD
 cS2wV6JcoXf0o9iccrtdpySSHA==
X-Google-Smtp-Source: AA6agR7WKZFo0Gd0CrwW+kQqeYyEuLnmEdTMd3As+yvfv/ebcpxDY62N1UnBLOwwuNPgfwQgBjnxwg==
X-Received: by 2002:a05:651c:154b:b0:25e:c73d:a786 with SMTP id
 y11-20020a05651c154b00b0025ec73da786mr7507173ljp.397.1660206414645; 
 Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05651c204500b0025e08d58e75sm720412ljo.133.2022.08.11.01.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Message-ID: <1cbb9946-2171-46ee-be6d-84b914ecc47f@linaro.org>
Date: Thu, 11 Aug 2022 11:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
 <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
 <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
In-Reply-To: <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2022 11:04, Krzysztof Kozlowski wrote:
>>
>> additionalProperties:false on this level
>>
>> which will point to missing properties (e.g. opp-table)
> 
> I'll fix existing bindings which have similar issue.

Hm, I think Dmitry is already working on this:
https://lore.kernel.org/all/20220710090040.35193-5-dmitry.baryshkov@linaro.org/
so your patches should be on top of his.


Best regards,
Krzysztof
