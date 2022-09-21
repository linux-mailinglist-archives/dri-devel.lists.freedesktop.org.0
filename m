Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE35BF84E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A9E10E86C;
	Wed, 21 Sep 2022 07:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FFB10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:53:07 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z20so5984915ljq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=OS0CSjnlW5ADVTuZSK4e/8bQa+nM61/76HZjRJHlhE8=;
 b=UHWL6t56LIFGZHwdc/+WL+z0SYzWxEENolMyzH7nOCm8KzikH68NrxBkjqGr70SXNW
 3mZWGxLEC+XHRUKKNrwh7WhDCiNlhPUnKoFfo+UiqbYQaGdpKclRAwHbhTKWmkkXRaWM
 v1RFmVq194hS8C/YXDzo4R+l/FI8t+G1jsKqwxLovg/6D/Rklc35jn1pkBqU/GD9rwzn
 hlECjQKZIu9ER1b2twWm9OxlWSc1gODdrFORxJi5HewVDvJM/prvlNHMJ3us67Ee1+gN
 1Zr6BKxKw3U0V5bncc9hYanXdxZh8Db9LGrHAw1ZkP4uqaaAt2RH4kWWmzjQP3IhfgB4
 +x2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OS0CSjnlW5ADVTuZSK4e/8bQa+nM61/76HZjRJHlhE8=;
 b=rPl3+1kYtUvYRZ//MZPndI49dJMNKuL1sJfnnNS47CKYfLPrmjw19RCjBmaMT75XEN
 6OHRhHIaAffu3uBSkKcL+7tA6Y6pOEKvV/y1R/q6xx7QcEzUqlKFM2lRVdK7dFb1bInd
 m37k9juDQyqX1aZpIYWfT+AfTjmc7lSA8a5NBbRc9RGyzCtArLO/n3JhbswLkVOEKGXh
 zZKwaWoyS7lgNkhPdXi45x8mZo8JvXMntLLR++ysH+BI7pnElMYBkHsgCO0xM16rjkEm
 q+L8PTuqprW45H+hXipmYg90QsEfkyreWabD5NrKOu4nbp06zrRI3BmoxzEWzYNI0OPm
 4V8A==
X-Gm-Message-State: ACrzQf0+xsWPmbUGvvdFsjQi9WOUWiivmFaSLcM68UE5Nz7lBjsJLl/t
 uGypmTp+PU6A7toxCZfLj+EoYCwBu2iipw==
X-Google-Smtp-Source: AMsMyM4KNz309yv4EvSMp9zHGKrkbtkYd/2U0LDBcwFkpEnNdcd3KlhL/+LDBSpIdSdcUpYQn3T7Ag==
X-Received: by 2002:a2e:9005:0:b0:26c:14d9:cea0 with SMTP id
 h5-20020a2e9005000000b0026c14d9cea0mr7733489ljg.300.1663746786270; 
 Wed, 21 Sep 2022 00:53:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b26-20020a0565120b9a00b00497a99e7b73sm317674lfv.246.2022.09.21.00.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 00:53:05 -0700 (PDT)
Message-ID: <9ada8d37-83b8-8bd2-2b02-d821b1b1c8e7@linaro.org>
Date: Wed, 21 Sep 2022 09:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <89d925ea-f550-6903-1c24-b320ae5a82c0@linaro.org>
 <de7f5e65-c939-558a-277d-01320f93eedc@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <de7f5e65-c939-558a-277d-01320f93eedc@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/09/2022 09:50, Mikko Perttunen wrote:
> On 9/21/22 10:26, Krzysztof Kozlowski wrote:
>> On 20/09/2022 10:11, Mikko Perttunen wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> v3:
>>> * Updated patch 3 based on comments
>>>
>>> v2:
>>> * Updated patches 1,3 based on comments
>>> * Added Acked-by to patch 2
>>>
>>> Original message:
>>>
>>> Hi all,
>>>
>>> this series adds support for the HW video decoder, NVDEC,
>>> on Tegra234 (Orin). The main change is a switch from Falcon
>>> to RISC-V for the internal microcontroller, which brings along
>>> a change in how the engine is booted. Otherwise it is backwards
>>> compatible with earlier versions.
>>
>> I asked you to describe the dependencies and patch merging strategy.
>> It's still not here, so I assume there are no and I am taking patches
>> relevant to me.
>>
>> Best regards,
>> Krzysztof
> 
> Sorry, I described it in the earlier email and forgot to add it to the 
> cover letter..

Please keep it in cover letter. We all get too many emails and too many
patchsets to remember. Plus, things can change and such dependency can
disappear after some versions.

Best regards,
Krzysztof
