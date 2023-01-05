Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A838565E782
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABCA10E6CE;
	Thu,  5 Jan 2023 09:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133C10E6D0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 09:17:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d17so15733522wrs.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 01:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pq3ejuzBjCDJdHLBnefjQA1cSMGJU3lpvGousig3Qm4=;
 b=n7Mj3heVFeFgnm409WAdct2hWXOXoVgcy4BtrIqudbYirOWeWNImfDZxC/YvGM4nYC
 0fjS9QSgDvmUTBANDuZ9HB/okAgRZghzDoSQIQGsLiBiLsORLCgObB1GBxTQOg4E1A5E
 X96TogwMkwyYa4j6+GkRAJEfm/m1IdE0VBW5KRv7R6sjI0oh3ebJwFKZ3xcG0QPR7Aps
 z33xiRqsive6Lg52cj+XzNqSdMmSio9TRGHSjvHkqymx5dRH3YCo1dwL9SN+ZxDT7Xwy
 Njl7XPKhakIlG6QQXsFRR3+zbOBaEtcdVEafTpHxY5T7k5rpBsAbJUu6/xUMdOgD6FNF
 ptvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pq3ejuzBjCDJdHLBnefjQA1cSMGJU3lpvGousig3Qm4=;
 b=sINBPnOTmz+/k0fvnYCDsqjE5zOfUKD1PJNJI1UiytMMZHnxMPNC/DIsOI5VRAorGT
 C4SNuIhv/BVFd21bWCQjzCQpv3KUdUtizzwBngWYKTqCMjjwggELLPmG3dTpr5iSrOfW
 eL/GsnzjjYySpopJbdxQIjLRX5sU0Jb+U/kwUGkm4lOi657DSJQ3CI6JGEMEDebl9xwp
 kJCkliI7TsFZV/qqjJlikb/a8GLD/HYfdubZx1YoeXSOXpSilYIo6XtrGCxYhg9VQGVL
 hTsAQL7LOc+u4PdKtbFpMGzYPsh43xyCK91VKbW44zPCWc9+/T/i933IL8LNPe8KjTw/
 s+IQ==
X-Gm-Message-State: AFqh2kr2aFJBk4wLXsF36Mozdzq7JrFvK2CXbTu8N1E53U5Z9yWX3cCS
 SAGNvAzomAIddpsqY4pwY2quxQ==
X-Google-Smtp-Source: AMrXdXstMyW0DgS/z6kXcwU9LPSEpxdk+xtC0acQsk8RCCbVghUBwX0j9ppX/MquETlN1KbOsSGxBw==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id
 bv20-20020a0560001f1400b002425a34fb7bmr31715300wrb.70.1672910247816; 
 Thu, 05 Jan 2023 01:17:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c?
 ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d56cb000000b0028d66c43101sm18463067wrw.29.2023.01.05.01.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 01:17:27 -0800 (PST)
Message-ID: <2d90fb92-45ac-7311-ef27-ce82c6b891a4@linaro.org>
Date: Thu, 5 Jan 2023 10:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: add visionox vtdr6130 DSI panel driver
To: Rayyan Ansari <rayyan@ansari.sh>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-2-9b746b858378@linaro.org>
 <8c8d0276-61a8-71d6-17b0-f6b384ab9d94@ansari.sh>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <8c8d0276-61a8-71d6-17b0-f6b384ab9d94@ansari.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/01/2023 19:25, Rayyan Ansari wrote:
> Hello,
> I am not a maintainer, but I thought I might give a few comments.

Any comment is always welcome !

> 
> On 03/01/2023 14:22, Neil Armstrong wrote:
>> Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
>> found on the Qualcomm SM8550 MTP board.
>>
>> By default the the panel is configured to work with DSI compressed
>> streams, but can work in uncompressed video mode since 1080x2400 in
>> RGB888 fits in the 4 DSI lanes bandwidth.
>>
>> While display compression is preferred for performance and power
>> reasons, let's start with the uncompressed video mode support and
>> add the DSC support later on.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                   |   8 +
>>   drivers/gpu/drm/panel/Makefile                  |   1 +
>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 366 ++++++++++++++++++++++++
>>   3 files changed, 375 insertions(+)
>>

<snip>

>> +
>> +MODULE_AUTHOR("Neil Armstron <neil.armstrong@linaro.org>");
> 
> Missed a "g" here :-)
> 
>> +MODULE_DESCRIPTION("Panel driver for the visionox VTDR6130 AMOLED DSI panel");
> 
> I am not sure how the company capitalises the name, but to keep it consistent with the other mentions, I think it should be "Visionox".

Thanks, I'll fix these.

Neil

> 
>> +MODULE_LICENSE("GPL");
>>
> 

