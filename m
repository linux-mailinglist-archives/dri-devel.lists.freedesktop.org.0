Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AC762D63
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8594510E433;
	Wed, 26 Jul 2023 07:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55010E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:27:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so6070851a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690356467; x=1690961267;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BWEre0pLcOLYcd4FD5EnL9dsQ10qbvUWSP37/zR61D0=;
 b=y1y4UoR49VvO/j/vrmNwbquCfSyLDlgw3j9InOuwgigjZpxTDRdXipG5bYoZyd3opy
 xpSLGavxsiWFni8Z2JjG0cXg27Y58zhTRMD2R5HfHDZGXCvrsyAMRu/TrI+uaB4SQJK1
 A1a/wiZcZYJsXfKdG9kaGpGpfTyKOQlnANSr4QOpNHaZvJG7CuMpiStJi/5JKxf3F3K7
 2Yx5T8Mkz9UNra3VOzryRtiIM0jyEfrlHS+Ya9aHYX/9loaWUFt1+ARCRiWyn6NbVr/x
 Hnp97I11lJZMkQgwn/AhEszY1COsbYlN7H/OBzYLPCtvrhCIB8f/yaSAyztTrCWuUKoq
 uFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690356467; x=1690961267;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BWEre0pLcOLYcd4FD5EnL9dsQ10qbvUWSP37/zR61D0=;
 b=GvY/ee2xzNJ0Zi5Xc9JN+2PoMz7/ouXJxhoYSk6zAGVhbvzJwL0f1mkhKl6WbrD6SM
 oGNmOI8nLTUBtglcw9RCRXL7zksOSd5jWW6SuelN3R9Y5grO0kHkiLw2PxkoSejtDmZq
 w62E1KDhXlEsRSpVsh5JT8NhGn90cmCEp/ljeVWGEQUA4TX8qxcCn5iSMGtJ5M5wk08g
 pNN7dzkdX6LDkwp66cYn0gy97NZC9u1HNDaT9vsc/j6ESa/bDoR8KDPpPod1FynkuDVV
 TnaUuqzkSq/3NWRPXT/wR9BQfUlre6fXYik2GwMqhW6l9FQNUsqEXoRdtfyX4MQOEJLK
 NOmQ==
X-Gm-Message-State: ABy/qLb8vUZZuLnMndHWYlMl2hqRO3d3WsIiSyTMF9doiD+ZKc5chK3u
 rTGySrF9nzpbCVI6FeDRGM+tGg==
X-Google-Smtp-Source: APBJJlHaQ6NqQh4t7ZcAf3OfzxoJXhkRZpG1HFLke+5OkK90xm5aTlP0C8KtPZf532soYkXSt4uFIw==
X-Received: by 2002:aa7:d7d0:0:b0:51d:e1cf:dc8a with SMTP id
 e16-20020aa7d7d0000000b0051de1cfdc8amr918375eds.22.1690356467436; 
 Wed, 26 Jul 2023 00:27:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a056402184c00b005224d960e66sm1711008edy.96.2023.07.26.00.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 00:27:46 -0700 (PDT)
Message-ID: <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
Date: Wed, 26 Jul 2023 09:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2023 13:46, Marijn Suijten wrote:
> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
>> Example DTS should not have 'status' property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
> 
> This is not needed: it has already been corrected in v3 and v4 of the
> respective series (among other changes) and the patches were only picked
> to a preliminary (draft) pull to get an overview of the outstanding work
> for this subsystem.  That branch happens to be included in regular -next
> releases though.
> 
> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/

What do you mean? The old code (one I am fixing) is in current next...

If this was fixed, why next gets some outdated branches of drm next?
Each maintainers next tree is supposed to be fed into the next, without
delays.

Best regards,
Krzysztof

