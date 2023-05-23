Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3F70DF68
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150A510E09F;
	Tue, 23 May 2023 14:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD610E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:36:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3a873476bso6268899e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684852601; x=1687444601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c7ocuvFCcfF3A0FWpWbXCb8imInW5CeToUEyN2l4YxU=;
 b=LzYugZoz46SydEu7tDkdVvhbkOROFYBbOradLxpnVnac6LydanHcJjvNI+5i6Plgjv
 C6zztM1w8q92QWXT0N4bDfLZKyvBgZvACVRq77R94NBCmH+6MhFhpkhKcOQoWyh8Vd+X
 Zk0nEaxChA7ngNYY6sqjgBcOiC+L30JmWHtpDnSct+5i1kxYZc3BAL2YsRxeM9x9mr3m
 3OFACriffw+FwfUXSB1Pw2iC10gKBf1+36yc/oPsB/q8DN29uKg/ClszEcErOEkkprz3
 1kGadQRgyWlx/9duiYPA0Ktkb+QKhRmp6wTgAB/U+lpyxSBuYRucnRS/EL54QjbTAER1
 db8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684852601; x=1687444601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c7ocuvFCcfF3A0FWpWbXCb8imInW5CeToUEyN2l4YxU=;
 b=FFbB0KtHSi7fIoxrlMagwiZYtLmVMCD0KV+k5c0G0O8w8irORChbOvEyySsM75Ao2A
 JO61jP/xGNsGPMQpFW+Gs/eFs/7gEHPG3X8AZTYkrT0mcyvaZfQAX/mv5vfbQYFgNqsR
 qdiP+FCU+DzoAxjNI8L6Hc/Cp6M641F1TKI0TDhjHjdi3Y3KNlP2Ayqx35dxNf+f29kH
 cPDQw4OexFgktA3NdOCGXmRTAhfg3UFeL/g/sdkeLPauCyWgzhwGcBh8EELQCpsTjfog
 +RM8aPM1i77q7TQwDsklI1LeY3ff7GekE/0iFT211AMf/9c34ELO8I5QPoCP6m1da4wD
 U4Cg==
X-Gm-Message-State: AC+VfDyOOVqFkG1U86XtqA5YPSP17iL/UudU+wWytzrtlQ2+YCr9QfeL
 odyItPKYDRqusexLm/12gN4ytg==
X-Google-Smtp-Source: ACHHUZ4zGlQ11pfxTGA0iTEHBRx+KcTRF0EK7y6TX77S6BxQAnSdRxPdEdlaQqfXU8T7iUjX/f4WIg==
X-Received: by 2002:ac2:5a02:0:b0:4ea:fabb:4db1 with SMTP id
 q2-20020ac25a02000000b004eafabb4db1mr4302079lfn.1.1684852600995; 
 Tue, 23 May 2023 07:36:40 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b26-20020ac2411a000000b004f399531e8csm1364023lfi.226.2023.05.23.07.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 07:36:40 -0700 (PDT)
Message-ID: <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
Date: Tue, 23 May 2023 17:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-GB
To: neil.armstrong@linaro.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 10:31, Neil Armstrong wrote:
> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
>>>> Rework dpu_encoder initialization code, simplifying calling sequences
>>>> and separating common init parts.
>>>>
>>>> Changes since v1:
>>>> - Withdrawn two pathes for a later consideration
>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>>>>     dpu_encoder_phys_wb_init()
>>>>
>>>
>>> I had previously given these comments on the cover letter of v1, so
>>> giving it again.
>>>
>>> Please mention that your series was made on top of
>>> https://patchwork.freedesktop.org/series/116530/.
>>>
>>> Figured it out when I tried to apply it to my branch to test.
>>>
>>> I had tested v1, and between v1 and v2 i only see very trivial change,
>>> so i think its okay to retain:
>>>
>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
>>
>> Unfortunately patchwork ignores tags sent in the cover letter thread.
> 
> But b4 does with -t option to b4 shazam or b4 am

Yes. But b4 doesn't append Patchwork headers.

> 
> Neil
> 
>>
>>>
>>>> Dmitry Baryshkov (7):
>>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>>>>     drm/msm/dpu: separate common function to init physical encoder
>>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
>>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 
>>>> ++++++++----------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>>>>    7 files changed, 140 insertions(+), 243 deletions(-)
>>>>
>>
>>
>>
> 

-- 
With best wishes
Dmitry

