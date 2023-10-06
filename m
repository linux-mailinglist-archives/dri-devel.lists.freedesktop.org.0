Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6757BB951
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A32010E4E9;
	Fri,  6 Oct 2023 13:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB7890BE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:38:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so2768155e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599533; x=1697204333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ajh5orkYs0bY+A53wDjwFGIy9BjxHiqDWVeEzj1BGjk=;
 b=sCPx/XrX7MMhXuRzqNn1tXU+usUd93P9iyGbPkYB4FbLRg+5ZfyYJKKTCKgXuAuVn5
 0zQdZ+apO/26bNk1SsFF9+zv7cQ4d6n5h1oBYEauPN+h/CEay9F/uNadH6+vIdP5Qp9h
 +qi8BLgyuPyf0m1vQGiGWLNVDOyKGywsZRjv+G8uzwSLI51OeYSRjUcpKkk6HPjOK973
 fFJICeDpPSgE3TOhWlt7KcDKh2LjX5koDDsp2s9k9X3tX083IXH+dOJ8d1hx71eW1K9e
 8P1wN0bbrWCEqWccDsjd16pri/6VjNV3i5Mf5J+i1POH04zuFHqfcB0958Gc+0MoP3W2
 Uu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599533; x=1697204333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ajh5orkYs0bY+A53wDjwFGIy9BjxHiqDWVeEzj1BGjk=;
 b=HwOr8pGETMw7R0TdnHruHRrGi+FZDn69LuD0pyFpKDhQ3ViYvPbtmTholgpQT1zD2W
 +7iTkKzBGxnjV/LM0awsO4ZAL/DvPsavg7k9J+LfwkRZZ9eqSJ5l/D8VvAxxnNAGTyIG
 yNEU3xadtAjE/hfmtBlRHedSED8wrD6XofMhVSdR6K378hq++Ye6zQhru0hRI2zqUBj2
 tI7h0mPPXumrRJ8rdXzbrwsl4Ksk87Y5uic7icJHrVaTKfbzsv9B3DA8pl2JJtrPRG6w
 cTcGNkfbojx4mmiUOcl56MYrC2ghSSsyCX5rCzYUq5zNm0UqDCJ7OJG0J108aUh91Szh
 9j1w==
X-Gm-Message-State: AOJu0YzqOUQ7nFHEQKQWemxpVN2xiQbEhrB1v6k/VLtJ3WwITa95l4Nx
 ENu2JTBTktmlffgy3rlcmhkmgg==
X-Google-Smtp-Source: AGHT+IGI/OkA11luu2j0zchtIZHSo/P6NPEIrwif1NURLFUY+rnHRJLSg1Uf0BrhIrD6RKXyO9zwAw==
X-Received: by 2002:a05:6512:b25:b0:503:38bc:e68c with SMTP id
 w37-20020a0565120b2500b0050338bce68cmr6330327lfu.47.1696599532998; 
 Fri, 06 Oct 2023 06:38:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a19f507000000b005057184ae5dsm308523lfb.119.2023.10.06.06.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 06:38:52 -0700 (PDT)
Message-ID: <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
Date: Fri, 6 Oct 2023 16:38:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <20230923214912.1095024-2-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5711857.DvuYhMxLoT@z3ntu.xyz>
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

On 29/09/2023 23:52, Luca Weiss wrote:
> On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
>> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
>> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
>> etc.
>>
> 
> Hi Dmitry,
> 
> As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the screen is
> initializing and displaying stuff :) But there's some errors, which presumably
> are the reason that the screen is only updating a few times per second.
> 
> [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu error]enc31 intf1 ctl start interrupt wait failed
> [   23.099821] [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done returned -22
> 
> These messages appear about 13 times per second but as I mentioned, the screen
> *is* updating (slowly) there.

For my understanding, does it work with the MDP5 driver?

> 
> Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> msm_mdp5_dpu_migration list, without this DPU is never even considered for
> 8953.

-- 
With best wishes
Dmitry

