Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9A619C09
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130DC10E8A7;
	Fri,  4 Nov 2022 15:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73010E8A7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 15:48:23 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id h10so3445376qvq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/dX0qOxdXp7cLT23QrYhqGLe+jJ28qbVowgKPPL8RXA=;
 b=CK4Lrv5YGb05eowI2JEr+yVsJX/Zrxtf3FfjCmo5XKXaIja/4IlsG46r8SCl7uVulI
 sefu0j41mhINaDArZ7A/IKt4j9s+IBRkuVdnm1jh00QVfO4MUUrJYb37QERgMZE/gjme
 Xao7HiTyBaMUYbNQ2oYxAdC491K6LYdBznLgHBXkaZi9x1MEySDC3j/wNZXPm/NbeZIa
 HanPjOCZ+Pbxwh+AR0m/E89oaIpWUFjOHx0hFtRR0g0etqnFBspiK1uj58DY/qQYbZr+
 ux+Ao8hc06Kv+i8OkAltajxjKIkxngQ4OI2FgV2DIbzRszBwuPuH7HUeGbeCMhuG3dcR
 Ppug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/dX0qOxdXp7cLT23QrYhqGLe+jJ28qbVowgKPPL8RXA=;
 b=3+V2Sq6tOuOdLW1RMx36s32fmUz6na4QDvSMSmgzU4VwW8SmQtjvcu40gFXNIhJRpO
 q/HrC2yKh71MZAYMB5hP11vJnSHmfQCTCheO5ElTwqjQ9mhuGzuZhlBzEygqnZwyTL/S
 CuyD7RxYqcYMpawwwdeS4/u+O0ynu5h8P4yH7vYofopK/cVRxbm8+HGR0zcR6Kfr1Apx
 4LZ4opvP1Hkgky4EsGSl1KcOar7Dlytzldk+JBYDDxMoVgkv3Ce1yncL+Zt2M8UIuBBp
 ExJVgpqWx3uHhCt04ZYnyNixtZd2QR7ryrNQRh2RyQJ/BLOsmJOyz6OdeixLOsHI873w
 +Low==
X-Gm-Message-State: ACrzQf1uKvHHCL5MfbIWvi0W0rcfNCmG3Dwtfg+i/v2co20BrO2vHqVu
 HxzB6/8F/Av25FqH1aUcEj+koQ==
X-Google-Smtp-Source: AMsMyM6cuSu/k90Bmo3Izk1r3J2Rq8GdzcYNFtdYhXEW1AFFmae+EICDVfB91Hh8ksmn9UUnNBRwvA==
X-Received: by 2002:a05:6214:2b0b:b0:4bc:27a3:f43f with SMTP id
 jx11-20020a0562142b0b00b004bc27a3f43fmr12663301qvb.8.1667576902204; 
 Fri, 04 Nov 2022 08:48:22 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a0f0500b006bba46e5eeasm3127113qkl.37.2022.11.04.08.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 08:48:21 -0700 (PDT)
Message-ID: <a72c0e60-732f-3486-722e-851f21ebe640@linaro.org>
Date: Fri, 4 Nov 2022 11:48:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi> <Y1aP7kDi8cJUTcGN@orome>
 <ee3073ba-d621-8b02-c986-3cf44cfbba96@nvidia.com>
 <b9b20abc-d37f-f74a-a416-2e210bf944c4@linaro.org>
 <3a783b8d-4970-663f-816a-15aad5a66a48@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3a783b8d-4970-663f-816a-15aad5a66a48@nvidia.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 11:46, Jon Hunter wrote:
> 
> On 04/11/2022 15:35, Krzysztof Kozlowski wrote:
>> On 04/11/2022 11:33, Jon Hunter wrote:
>>> Hi Thierry, Krzysztof,
>>>
>>> On 24/10/2022 14:15, Thierry Reding wrote:
>>>> On Tue, Sep 20, 2022 at 11:11:56AM +0300, Mikko Perttunen wrote:
>>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>>
>>>>> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
>>>>> has been loaded by a bootloader. When booting NVDEC, we need to tell it
>>>>> the address of this firmware, which we can determine by checking the
>>>>> starting address of the carveout. As such, add an MC API to query the
>>>>> bounds of carveouts, and add related information on Tegra234.
>>>>>
>>>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>>>> ---
>>>>> v2:
>>>>> - Add check for 64-bit phys_addr_t. In practice phys_addr_t
>>>>>     is always 64 bits where this runs, but it avoids warnings in
>>>>>     compile test.
>>>>> ---
>>>>>    drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
>>>>>    drivers/memory/tegra/tegra234.c |  5 +++++
>>>>>    include/soc/tegra/mc.h          | 11 +++++++++++
>>>>>    3 files changed, 41 insertions(+)
>>>>
>>>> Krzysztof,
>>>>
>>>> I've applied this to the same tree as the patch that uses it for now.
>>>> Let me know if you want me to put this on a separate stable branch for
>>>> you to pull in.
>>>
>>> Any update on this?
>>
>> What kind of update do you expect?
> 
> Ha! I guess I should be more explicit :-)
> 
> Well, I would like to see this change in -next and so I was hoping that 
> you would respond to the above to indicate how you would like to pull 
> this in.

The change will be in next via Thierry. I do not have to pull this in.

The maintainer which applies patches is responsible for:
1. Having his tree in linux-next,
2. Sending the patches to upstream maintainer (e.g. arm-soc, Linus)
later in pull request.

There is no job for me here, if I agree with Thierry. There would be a
job if I needed a separate stable branch, but that I did not decide
yet... Do you think I need to pull it? If so, why?

Best regards,
Krzysztof

