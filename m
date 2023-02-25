Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582186A2C85
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 00:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6110E63E;
	Sat, 25 Feb 2023 23:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5757B10E14C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 23:06:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f18so3859469lfa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 15:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FA/YirM7p+Dh9nbswy+HG0CqRccl7sb7V8X1DNYAnTI=;
 b=szOP7EgnMFR+SPGSD3oaex+otVCF+1uInkGxH6BxN0JWeHTPKBgTiyNd7lYMnRAU1i
 YgL4B2nuYuF1jucnkhHU0oXp/cJ92VLXb/tC5rN8MI1eY6aKArXdNmjZG54ra114Gcmg
 XuXNc7CCO2igJ3WFNIP68RpW34hqbuDX/Q4rWLdi6+F+eiDZgDNvWAsxUeieO4y/tBc3
 +LjqLFzJBhanD+ni7k5A2KovhC94uFRCTweZhxUNABzjaLcBycmQWeofrtNg7ziRw345
 VwQpCEetFW2cPgEdsiR5ymqUt/zbjsIK7aVAKbK5zXZ6z8g5VYCOADYBTVFVSPi/ezZR
 LhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FA/YirM7p+Dh9nbswy+HG0CqRccl7sb7V8X1DNYAnTI=;
 b=MYwT58DnGCua8bzyN/KAZvUPiRSyJFWSy87k/Hniuy7ijj84vOLDuSiLcdWO3QeFEN
 biZcD3Mxsb3HCZMkHOjixfO0wmBvKWgvzD27pWGPtoPYcMkrlCId4DIf04AUZ959lN2k
 8ip23VQh49Mi38cqbTwtLK6AqZ8vt8dv4pMZUSfzywMAENcbS94SxNA97liddPw2U3eg
 eL8GPgSFBKmUZC2HegHpKD0gEqlTJgr3NEJ3CGcYnluf7aal++6LVeNyh/0HQXmsxPFa
 CddFYiPXJi7xBGinK3d0JA6sbHfTo7DPZy7RB5QXPIVHIZMLgnBcOiI7b8DC1kOPvea7
 /TNQ==
X-Gm-Message-State: AO0yUKVYIFyvkHpSqnCW1/ltyzoZ6bjyHxCzm+htqrKCyAhfnhsDPex6
 OAav3HM3pSNHwEeHS1OMATZj+A==
X-Google-Smtp-Source: AK7set8clTQ93KuM/JaMKReIW3PQwHhL4/2kiKHsaZ5dyKokDl58RKAppNDmAyrqaNt9HUMZV0dGsA==
X-Received: by 2002:a05:6512:968:b0:4dd:a5ac:f0a2 with SMTP id
 v8-20020a056512096800b004dda5acf0a2mr3578558lft.39.1677366389511; 
 Sat, 25 Feb 2023 15:06:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t25-20020ac24c19000000b004dab932248fsm337070lfq.180.2023.02.25.15.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 15:06:29 -0800 (PST)
Message-ID: <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
Date: Sun, 26 Feb 2023 01:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, neil.armstrong@linaro.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
 <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2023 22:51, Abhinav Kumar wrote:
> 
> 
> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>
>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>
>>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>>
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59
>>>
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102
>>
>> OK then:
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>>>
> 
> This little bit of confusion is because with downstream, the qseed is a 
> separate usermode library having its own revision. So the SW lib version 
> in this case is not exactly correlating with the scalar HW revision.

Can you possibly spend some more words here? I see that sde_hw_utils.c 
programs scalers slightly different depending on the version of the 
scaler. At some point the SDE driver was reading the register to 
determine the revision. Then it switched to the revision specified in 
the DTS (which, as far as I understand, corresponds to the HW register 
contents).

So, where does SW revision come into the play? (and which library are we 
talking about?). Is the 'v3lite' an SW revision? Or is the 0x3002 an SW 
revision?

> 
> Since upstream DPU only cares about the HW revision of the scaler, we 
> should be going off the qcom,sde-qseed-scalar-version.
> 
> This change LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


-- 
With best wishes
Dmitry

