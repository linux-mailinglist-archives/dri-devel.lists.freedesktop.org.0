Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E2694449
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A3510E201;
	Mon, 13 Feb 2023 11:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606E10E55A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:18:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hx15so30904839ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIx9QnDEiIMrF+ea+ic9s2yvBT4Dedk7T3dn3hJI1QI=;
 b=pOOkQDaSGu4cphWcInPo7p2cNnaPIdjifY7CyoPkbXO66aI5vGY/I2rsKksmODIoiD
 bL86qkglO7JgYVX1tkHq+AstdqQA59JYh4YHfbMwPm+2Q7UAtIvnoODioOBApbYLOi0x
 Z46SFiumclgP8AdfuJmCRSPl2sorVNHqWZXAeB+gnp7Q0Ohxer5YiQYwNV7KNCacdbRC
 4RQ8xmuJIDWKE+bRok0yvx/q9PvQ6mPsSQLmMFkm65vHbm6Ihi8KUheR4GY0tXDB66ni
 EQnLS4lBbAp0l6hhkSBfpRBXw45OX+lKzvdz9ZSUTUxljFKoWXwGpSVxTK5C9pjbf6Kq
 gBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIx9QnDEiIMrF+ea+ic9s2yvBT4Dedk7T3dn3hJI1QI=;
 b=PKfipbvtcObOSwOUAKVRHs2AzRxZ0x9Lo7A224F580OGhlaaJxwOXG0AZD4HdzNb30
 KQApHITLqXZQ6ZvcEcafNBaWZzNLGlmsuFI6jI1i6XTUqB1FznU0In4u/odRw8GkHHwf
 zh5UC3cDyU9SviRktokmTnmRntelX6qJsmvlKUq0BUpXqRBBQlBa7VyRiLZR3WjchwPF
 Y22cfAoeUHhcffOWcAyY4IrB64ZZVKQl/ibKHlWqIoZfKdmkj43FR7p+s1NUcoDDFc7N
 jqrXr/Mn6PJJmGuvYn84t2LjlR0xWJvod8m3scmAisr4PNaftxXSsLJ7BddhEHlb+46D
 Erwg==
X-Gm-Message-State: AO0yUKWK947gINpk0neq15NPYaQ/lcVAMgPoGm+knKnfZjP1ApZ7vLUg
 D5Wmz8WZbu+PANFeQV6kPiXf/w==
X-Google-Smtp-Source: AK7set/vk5VCJ4aeYKvsO3L83u1LiQeST5URkCTbDzfs2h9uWKdJZFMZ27L/BDnDZtErGxAbuiCGnw==
X-Received: by 2002:a17:906:70c7:b0:885:6a2e:f941 with SMTP id
 g7-20020a17090670c700b008856a2ef941mr22618956ejk.54.1676287124813; 
 Mon, 13 Feb 2023 03:18:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a17090686d600b008aeed39adc7sm6648687ejy.63.2023.02.13.03.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:18:44 -0800 (PST)
Message-ID: <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
Date: Mon, 13 Feb 2023 13:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/50] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
 <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:01, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>> intf) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Oh you fixed it quicker than I could respond!

Yes, I wanted to include it into this patchset, so I had to fix it.

> 
> Still, I think the 8280 sspp size should not be
> 2x the norm..

Let's doublecheck this with somebody having access to docs.

-- 
With best wishes
Dmitry

