Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6B709D55
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FAB10E5B4;
	Fri, 19 May 2023 17:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5B10E542
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:05:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4010847e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515928; x=1687107928;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
 b=V585xRsm8CcsnplbCQ6v8bRSw8NP67lu8Y6qp3MaQdh6U4ysP1qSomULxwiyVhVef2
 9b7QW3V0gmptgFhTqIAONlnbRoPWpnZmkp2wBo4S7Lgt9Sw5CeDaoEXwsQtwJZ/5XBOw
 iZw1pi6OYtwzOFNxcz7br42D7dZVChsjBND4HC2K8zpCWneTFOt2jffTWfcwtGiJ94Er
 mFn4RCoJnGx8/J2n0shYt0Ani4J3Kbq9KPC0gXzsOyY4w9ewPdlfa/3nzjvdAfvxT06E
 ELLKks1QOZdU4+NUxLoCHQTmSwrLx4xHJbj2l9Ba9qvrz1qNghS8FwFkhfO0MBXBo/tJ
 htow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515928; x=1687107928;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
 b=iIPN6ac+XsfaiH3wJaxbRiq0AbAd4eRsOnEi4zIAdBsgwADrDr3TLyaHgWLNdM8jK6
 DLSMip7GmLjQOIWMoGERXpADE8WheyZZvqhyJCS60uTFjRf3l4Q89LNsA85gUr5F9zAo
 JUzMTn2sUuG1SkKYkgIsIFKj9mP5ZcZyjS5MbvyWZzq6YVeop0wpPLXmRpYuOnKOdyx3
 67EKZEQBPeC2IbR9KV5qt04aJiYQsQwJtngcQdR/wS511LGdPNnQtMtffpD+2y/SAEL1
 mSdtzr802aQNdkkMGtY4KWs2UdutqzXXDbXB0yg4ZT/fgAvv+a+w2urWYp2eXm3/cAsr
 eyvA==
X-Gm-Message-State: AC+VfDzyRXK6ff7alpoojixl7DlE6rl9EsAUJQ8mBSL+dfKI+T1t2FFB
 jnA3wdnx4ty1P42Ti65xohI06w==
X-Google-Smtp-Source: ACHHUZ4jcrhQebDwz+TmRvBxTkMDnYkD/uxxsLi4fsiBGMpuMGr4N8G5ByGWy90gcsy4dRWMJgQvTw==
X-Received: by 2002:a19:551a:0:b0:4ed:b329:5d85 with SMTP id
 n26-20020a19551a000000b004edb3295d85mr930426lfe.15.1684515928421; 
 Fri, 19 May 2023 10:05:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y16-20020ac24470000000b004f138ab93c7sm648541lfl.264.2023.05.19.10.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 10:05:26 -0700 (PDT)
Message-ID: <590c8225-e5aa-5195-51d3-a1a4738d6bfa@linaro.org>
Date: Fri, 19 May 2023 20:04:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/msm/dpu: drop the regdma configuration
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 20:03, Dmitry Baryshkov wrote:
> The regdma is currently not used by the current driver. We have no way
> to practically verify that the regdma is described correctly. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Restored dpu_msm8998_cfg.perf, incorrectly removed previously (Marijn)
> - Also dropped reg_dma pointer from struct dpu_kms (Marijn)
>

Please ignore this, I forgot about 
https://patchwork.freedesktop.org/series/116782/

-- 
With best wishes
Dmitry

