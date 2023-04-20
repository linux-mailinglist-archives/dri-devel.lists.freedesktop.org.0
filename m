Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4266E86C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0110E65F;
	Thu, 20 Apr 2023 00:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F52710E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:46:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a8b1b51dbdso1757221fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951587; x=1684543587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hAwtjTm66ceJkf1KKSI3nNqDV9Qs3Z4h0lY2QCF3PFM=;
 b=pmi4EpcafzRZMbKbZksxYUwEaHhqtJlHu6hKBQwqudAokUDzk86sDhfq+W+wVCJ15p
 FQA+scFNJnltisIQoPk6HMIG1qfvvv58ZtPzcDID7dE2BhiKhZV4cDUe/U0bLk6cRQ4j
 mzPvA4yRfoOXgVb7+eakd2la4gbec+rf6ogQjMWlC3R1Zd4Xivw4xf/UnkigxxcTkkzX
 Qh34MtYL3b+K0hO/njU713fFyZPcRQ6u9s9tR+K8I61tXUsXXqsMmeYysVWH+h/UwYMK
 I4LuTuKBm7ajrdseBEDjDirHg0CijeHlSMoiu5LtYcIxa9tXRb4mHOSkvT5Vou50FM6Y
 DfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951587; x=1684543587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAwtjTm66ceJkf1KKSI3nNqDV9Qs3Z4h0lY2QCF3PFM=;
 b=R1gh6ArihVR1U9ILovWA+zv0l2A5rj7n1ggMEpCtxBHwzsh2FnBG4bblX7YUEibmGT
 wBHFjygrH2Qjll5aKelU51jaghxQbvZ2OIpGCFa9ktG6llGDt5Xd7hT26Uktkrsu147J
 mpAhmkx6oT8a5EyGlrRsbuE+iTP5M0mhEAEWlcSyCZM37Oco37nNmNCKjlvv+406c+4g
 L1NZmeUTw+zM2QMag9nc6a2oWC7tjlasoSDFGMH332uFFk2VdafA9m+eL90XjjnBAFvJ
 C7qTTMWx4+F8OYGYkEycGFdBM+uJtzZcdl+oKof030to17TIU2P0PEVFtAdAWGgCx8+C
 OZGg==
X-Gm-Message-State: AAQBX9czOkUKCF4OJ92VkBKEKcJjB/Wvxq17nH2/G1ye1wiRUAeSBE/h
 yGMcSw0RaaUifr3GCpto4df7AQ==
X-Google-Smtp-Source: AKy350YouuosrbAj0lA+ydm3t/J2LQTkm5ebLkRGVt4fbyvc013IwsDwJYJOnRNU8NL94/Kc4sO4zA==
X-Received: by 2002:ac2:488f:0:b0:4e8:5e39:6238 with SMTP id
 x15-20020ac2488f000000b004e85e396238mr3598983lfc.42.1681951587446; 
 Wed, 19 Apr 2023 17:46:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a2e9495000000b002a8ac166e55sm16796ljh.44.2023.04.19.17.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:46:27 -0700 (PDT)
Message-ID: <5dbeefb3-6de9-0a9b-4404-53eb236c0db2@linaro.org>
Date: Thu, 20 Apr 2023 03:46:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Remove duplicate register defines
 from INTF
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> The INTF_FRAME_LINE_COUNT_EN, INTF_FRAME_COUNT and INTF_LINE_COUNT
> registers are already defined higher up, in the right place when sorted
> numerically.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

