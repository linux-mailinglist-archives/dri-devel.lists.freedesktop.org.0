Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE155B0236
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A379810E57E;
	Wed,  7 Sep 2022 10:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E62110E57E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:58:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x10so15515603ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IKM8Q7h7DhmkZcNT/ovGbRUjTQGFQvPY8l9yVR39E2Y=;
 b=VN4CTK1wTSHhO/JQHt4YeD14+4Bex9SURm9ys2I9Y9E1VK321hgUU3Vg+BrhRsoJyH
 ZylejopAIlyxFTa2No8cof4nkKLZ5qwshND72RxfCBRPRs/TdR7XFigsAXXNt4o+NhkY
 8ygZol/PORK29rql4KzTPO7+oWoY/X1F2WPrKm9Oo4KYe6bHGB6/6FfawTwwZ6ykWo5t
 wEHIjKwWOUAXOSIWvSnszCDfyA+38LKjRxCaexpuENogUHm/YFnZ3FjiXScJ5yFQAhs8
 bY6R7v9DAv8JC/9qsJA/BceRVEQu7ON8HXX6yJ6IPHbEsIIvBVj2NJ0173M1V69yi50q
 yi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IKM8Q7h7DhmkZcNT/ovGbRUjTQGFQvPY8l9yVR39E2Y=;
 b=VfshMAtR2est6VTHp2ZFB9kbtmBVRMznQ8f1e6a+Z3sevdFU+lRLt9MQrGE2RHVts+
 fgHBwBJphd1LtGSeKfLIRJbloEYjUHxyV7mQGWfDO5b7OM5I0pEG8OPvfrFLj1FRinZC
 38mqnRfj5+BfQKdcPDZpva2Q3eOCWOeQvB1YQzI/ss8/WkJ8CdNSShWflRBkyMlZB1gR
 bnV3HDA1ic9rrhevU33lCIbQDCR37nzECZj13lgjUqs/8Ddm4Qhdw2NIWOzRhX5qPQdS
 EPdINw/i1dlE3zODKuVn1R37oc0I5vdTcQIqAkG0/A5iyFEpMsKBANqnYDuz8l4UDvIo
 gn6Q==
X-Gm-Message-State: ACgBeo32vya/f4IHWn81lCXlzOd2F7W7HJgRdoQgwe2lfbLr+lrC2LaC
 dST0lim0MctQKFfiH66j8YGyNw==
X-Google-Smtp-Source: AA6agR5oDFn7ilykcXLvWcVzwobc5wxgalg0pbv8etU2MwU03o/ikyPHsbImXPqq3CXmJF/7zRaurQ==
X-Received: by 2002:a2e:2d09:0:b0:25a:816a:2e62 with SMTP id
 t9-20020a2e2d09000000b0025a816a2e62mr759769ljt.147.1662548290798; 
 Wed, 07 Sep 2022 03:58:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t12-20020a195f0c000000b0048aa9d67483sm2399815lfb.160.2022.09.07.03.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 03:58:10 -0700 (PDT)
Message-ID: <e1145bd8-e477-9a20-00cc-3d5f5e4f7977@linaro.org>
Date: Wed, 7 Sep 2022 12:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
 <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
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

On 07/09/2022 07:27, Mikko Perttunen wrote:
> On 9/6/22 20:50, Krzysztof Kozlowski wrote:
>> On 06/09/2022 15:28, Mikko Perttunen wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Hi all,
>>>
>>> this series adds support for the HW video decoder, NVDEC,
>>> on Tegra234 (Orin). The main change is a switch from Falcon
>>> to RISC-V for the internal microcontroller, which brings along
>>> a change in how the engine is booted. Otherwise it is backwards
>>> compatible with earlier versions.
>>
>> You need to describe the dependencies, otherwise I would be free to go
>> with applying memory controllers part.
> 
> Hi Krzysztof,
> 
> the memory controller patch can be applied independently.

OK then... but looking at the code it does not seem to. Anyway kbuild
robot complained so I expect v2.

Best regards,
Krzysztof
