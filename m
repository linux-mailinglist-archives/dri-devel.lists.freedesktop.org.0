Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3F6FEAFD
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FDA10E50A;
	Thu, 11 May 2023 04:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0D10E599
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:57:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso9016125e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683781049; x=1686373049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itZRHsCZE2zcyCX1vzhKeuooNDyGZUe67cjcA1Mm4CU=;
 b=e5KqmbVorVMOJBVVnUMiEUeI+rUfsaL74dacIVfp6mAXTQbID3h3LyvwpZglOIZ5yz
 DhIN3X6Wd2ReW6YuIQkMERthlsc/V2q5SV19RgnGketJ5D+2hVcTuKKaPGJM6cxLQMUU
 JNy+VphjHA1x7g3w3/x/iV/yDC6+5urluSynaR9xeCkAPghATCxflHyw5Vebanz9DtRJ
 +3heLAGU1m8woS+CQjFACnOoMvpR1JuwPcNBnnGjvzqZYFzGPJuckFZIMRCoMswU+ezL
 Y/D2TtfHC7TILC4JQ8zVbck5ajK7qBoJ+AQqnXQBn1CCgLWYWoroq0MsHrNoA3qp0jYj
 QJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683781049; x=1686373049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itZRHsCZE2zcyCX1vzhKeuooNDyGZUe67cjcA1Mm4CU=;
 b=iYLeK9S5gCkHWCz7ACpWa7ZLlXd3kCmzD0lfB0xcgcFbKX/2dO7To1EG2eWzYVK+KY
 z+nc0Dvmf+1QDH+7YqcRLANynpWH01FV9pnf9ZZ4DuPBSWOePmC9dzDo/ojktHV3BQ5P
 yWRvv1Oipd9TCx7XRG4ypB9e1/qbZR9nIVk1Wwf2VP/DBQOBMkPSdAla2dRqKK01KFN2
 JtaeTwsY8jXWP1BjHXgITqu9Omt1dS00cwDCijUW1Cyw+5yPWR5EFhpjIeWiLlP86LGc
 d477HV4RVMTA60BYp/a6PJIgcFnBtQPN9/2Hs/5ua7FoPcTPLavxg/kdQ7FIkxux4WvL
 42gw==
X-Gm-Message-State: AC+VfDyC/+UoSjyP5nCq8wWeNDxrP1+yFLCpPBf/ZfI/FoSJct04F0F8
 lg+zSmThVvfkP/5QQdEV4eOySg==
X-Google-Smtp-Source: ACHHUZ5THrVgIUtCaqiWGbdVsUTiNoc2umxTKKO79kDZuUT7R5l68KrbGKwtK9zO17eNJxwyjqeOvg==
X-Received: by 2002:ac2:51bc:0:b0:4f2:6ddf:2011 with SMTP id
 f28-20020ac251bc000000b004f26ddf2011mr108174lfk.19.1683781049635; 
 Wed, 10 May 2023 21:57:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j8-20020ac253a8000000b004db3e330dcesm962693lfh.178.2023.05.10.21.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:57:29 -0700 (PDT)
Message-ID: <72ae1bbd-e4c4-3b15-aa35-c6693f2ab677@linaro.org>
Date: Thu, 11 May 2023 07:57:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 8/8] drm/msm/dpu: tear down DSC data path when DSC
 disabled
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-9-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-9-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> Unset DSC_ACTIVE bit at dpu_hw_ctl_reset_intf_cfg_v1(),
> dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() functions
> to tear down DSC data path if DSC data path was setup previous.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 +++++
>   2 files changed, 51 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

