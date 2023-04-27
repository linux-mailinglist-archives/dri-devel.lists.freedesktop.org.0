Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1726F08B8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7683F10EB86;
	Thu, 27 Apr 2023 15:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9E410EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:50:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so8401008f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610650; x=1685202650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0LVvSUlMhk0oorFb1lfoTKLtwX4+aMi4E0n5BABoD+k=;
 b=c+SKHywJEzds0l0pCyhmpRVHw64XbWWZYodFHkJRBH9RftRm1ltEbKtJ0Q1eniFQbm
 E5a9EdzdDvymLqawIOGGmnHOOkdqlyiTBzCFvhJEQTomPojd3SgbhNGBO7CadSusMYwE
 CYpevFGcVrzmX6yFlmgbOKjcxU0o+BrtRpEnITb+8SdYCGgPYVKe3sIolQRv2OUHcL04
 G4mzF20cNfZuI3Xi9syc9UAUzbF3qMD+lhKMKqhhpJRGSrDDEblFUuxufcCiOwO/f8B2
 OTmTFyXOrNAkYtKKx36L6RGpqQL1lNR00jd/JBPIMyJ7dlg3G4JVT07MOV8lFqxLS6Hm
 ASpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610650; x=1685202650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LVvSUlMhk0oorFb1lfoTKLtwX4+aMi4E0n5BABoD+k=;
 b=g0kGZXIbDoNVYR3Ez6J0RcnAjfd75q9xP3mwJvf44ikeg6teGjZ4MQEiFOV1WefeNp
 TQA1BgTP7maEMps9JlHNzctI+MNa/Tx2Z57NO/RVys6bZVJP+bgWHNhoXxJR8j2mo2nz
 nZ1EWCBu2C9NZqsPqQIljVPsQzK7vWWcvdjcKM80HcBWVeHFy102jWSaag68HERfci1Z
 NlHANkray5tUfdnx8CLI0DbqEvh/W7JnVcUegEQdwJdG5jNNbNJi6XvqHScXXeJzEKdX
 +ZXc1rMElsGdm6Gd7b7bSEJB09oiRMF4Hpx+h2wGMCL3bbzYNTdbsDp9tbLFtf5MUig7
 tu/w==
X-Gm-Message-State: AC+VfDw9MePClJ+MzCTpvFilAwdQzWc5Kwqrny8MX744oqW7u2Qv9Qje
 5v14eOGAh/37GoNNLNx/FEHvzg==
X-Google-Smtp-Source: ACHHUZ778s8yPgKXmPDAlt/RlHkYZz2JfzhRBBdyvaHRk/xkqvcasCGx57Aq2HdnbyJ5ICWeyf7gww==
X-Received: by 2002:a5d:470c:0:b0:2e6:3804:5be with SMTP id
 y12-20020a5d470c000000b002e6380405bemr1494910wrq.59.1682610650706; 
 Thu, 27 Apr 2023 08:50:50 -0700 (PDT)
Received: from [172.23.2.142] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfdf91000000b002d97529b3bbsm18808434wrl.96.2023.04.27.08.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:50:49 -0700 (PDT)
Message-ID: <563fd75f-5ca7-a441-3e21-542e78afa206@linaro.org>
Date: Thu, 27 Apr 2023 17:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] dt-bindings: display: simplify compatibles syntax
To: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
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
 <4a5ba8cf-5c24-2e76-4eb2-e05c7d8dfc72@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4a5ba8cf-5c24-2e76-4eb2-e05c7d8dfc72@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 13:50, Neil Armstrong wrote:
> On 14/04/2023 12:42, Krzysztof Kozlowski wrote:
>> Lists (items) with one item should be just const or enum because it is
>> shorter and simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Rebased on next-20230406. I hope it applies cleanly...
>> ---
>>   .../display/bridge/analogix,anx7625.yaml      |  3 +--
>>   .../display/panel/sharp,lq101r1sx01.yaml      |  4 ++--
>>   .../bindings/display/solomon,ssd1307fb.yaml   | 24 +++++++++----------
>>   3 files changed, 14 insertions(+), 17 deletions(-)
>>
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Should I apply those patches ? Until now Rob finished by applying them.

Thanks. This and the mediatek display one were applied already by Rob.


Best regards,
Krzysztof

