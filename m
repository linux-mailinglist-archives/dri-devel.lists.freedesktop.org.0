Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A26C7A94
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7036910E165;
	Fri, 24 Mar 2023 08:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBEB10E4A9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:59:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id s13so657605wmr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679648392;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4h1y29ufgBdPBj0FinbulRj195jm8gHSccDSNysL7ng=;
 b=RXGKhRMsOU+O1tqz6J/suUb0aU7VUqgtBJargaGNRHO4USwinGX4Q+o6F1N+3L2w1I
 IvWNS7eL2Mq0WjlaGWdjqZcXoSMK/T0QMNwsmJFsOG8EOZPd73nIrMKCDkjY/McrjEt4
 El++mpFcY/v6AmVH38u3nFhTLyp1GLdbgRMtyvhEvk98Pt717lCdKYIGPkPLogtqYwcq
 mMaL1qfpq5O6vt+csqk1DCAwIxJroCgTYG0s1LW3gjgAWsRIXbZVSHRyZeKytvVMhmrz
 byraSTt+tH/d4z/v/k+OIyK8gQ8JGLKXCrUgi2I9nf4VVRWdcafzGS/bK2673u6mhQhJ
 ZZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648392;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4h1y29ufgBdPBj0FinbulRj195jm8gHSccDSNysL7ng=;
 b=sEAlxZ3H+l1nLNB2kdxEF7ibuMVFuA21OvmieEPWPkcMnzlBEI7+Vi+giDBhBvxWFr
 03+pwZkEkzGgp5/gFRNzGjH7STTX3WBuhDTVqPxKOCsoVgyExwy3NNwlTAh2nqyI7DSl
 tD3aCloYLTMyXSN9e1d1uDh+t6ZLDoufi/+Ti1kbwkU4zwjRcbhuE91a1s7vsrqHqWZZ
 49nsQgk6Rf7HnRI6spQj0hu+B2pw1e0zbdxWd4qOASySAtZ9g7c9U/viIGHDL1A2rxQF
 z6EPN4AIx8AVBN+kk/egARSdOUSEAgSJZv015US5xfNEOBGh8kgzrodFpOqB9FAjZFYR
 WKkw==
X-Gm-Message-State: AO0yUKX7Y9+hPZn+U/UmtClwGpW8diobATEOv0Gbzexyo9+KkhfupSJu
 nOATz1flGDZIf7AFh4nZaoZGRA==
X-Google-Smtp-Source: AK7set9DG+XY29oWgPGOtByRIw0f/x7EReSCqkruYexEvZ/9XEyDyxvCA4c50AzdzXZSJ7vOBmBf6g==
X-Received: by 2002:a05:600c:3b1b:b0:3ed:24f7:2b48 with SMTP id
 m27-20020a05600c3b1b00b003ed24f72b48mr4665100wms.8.1679648392490; 
 Fri, 24 Mar 2023 01:59:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0?
 ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a7bcd97000000b003eb966d39desm4253441wmj.2.2023.03.24.01.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 01:59:52 -0700 (PDT)
Message-ID: <18ad8d98-b67a-894b-9f6f-efb0afc8321c@linaro.org>
Date: Fri, 24 Mar 2023 09:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
 <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
 <006bf3bf-ab9a-4a08-3ba5-fa23ff4ea05a@linaro.org>
 <306b02e8-72bf-3eb7-f4cc-3cc5c598993b@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <306b02e8-72bf-3eb7-f4cc-3cc5c598993b@linaro.org>
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2023 08:17, Krzysztof Kozlowski wrote:
> On 23/03/2023 14:13, Neil Armstrong wrote:
>> On 23/03/2023 11:47, Krzysztof Kozlowski wrote:
>>> On 23/03/2023 11:25, Neil Armstrong wrote:
>>>> Fixes the following DT bindings check error:
>>>> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
>>>> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
>>>> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
>>>>
>>>> The implementation was checked and this npl clock isn't used for the VA macro.
>>>>
>>>
>>> This does not look correct. DTS looks good, you miss some patches in
>>> your tree.
>>
>> I'm based on today's linux-next,
> 
> Which is unfortunately not enough. Several things were
> fixed/added/changed and are pending. I brought the topic of pending
> branch few times on IRC for that reason.
> 
>> while the other lpass macros uses the npl clock,
>> the lpass vamacro bindings doesn't document the npl clock.
>>
>> And I found no fixes whatsover to add the npl clock to bindings.
> 
> Really? lore finds it easily:
> 
> https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/

You're better at lore than me... thx anyway...

Neil


> 
> 
> Best regards,
> Krzysztof
> 

