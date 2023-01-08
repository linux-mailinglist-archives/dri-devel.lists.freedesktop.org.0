Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F54661B18
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBE410E21F;
	Sun,  8 Jan 2023 23:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032810E224
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:29:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j17so10504320lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
 b=CiuDQBy/qJQ87Xz9VOezGSflqPnj3lXtvtt7iDr+c8eky0iXrkd/ssxJDRvHuhLpXv
 9YLK0p+b1zqAlvG+/kIHdXFdW65Tznz3XJTqmiPB20M8CwSh8GV2RLbwOtplHGn/WImv
 HsJ+dtiXAJP9IwxDjcYDCCIeDpvSwBxsh5fI2fWET8Y9bUyr30bp6uc/TEBSUfttvTd/
 Stg4mG7kChcSNPn51POGjV5/jEl/q2I/q3rgWByVEg6tp8bcv8CmbBVIRTaaK20Oz8gV
 VzNINsauGqt2hsJKATn9KmVqsnGxyai84XgZ7vQiX4ddCrhxjawWojXMYxTz+HARzYyh
 5AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
 b=C5CkLfMzVTj9/F9JdduUj+qRsRRUoOr4G92M/kPB1DEGyu2q2B7BKDgcj5AGRxOExt
 2Grgjo0TOqBicr3BNxpkdG+QLW4/EWavC94yS5RUbfqPmommpE3wId8LN1nVNS7J1wz3
 4h1us/mmwA3Zn0senErs2dTH8E18Cti4hUkh8RYsjXsfVCe7o6TUGnDgR7dU/oOl1X1D
 7gXbaH5v7E809xSNUQ92cRWrsIubQqWFgCiy7zijwUFtgwPNMk0x8JdnA88KakD+UXvB
 ZR3BK16qjv2Gw5SqIaZ4GVv9FNu4ZliRv0QwPl6grj+aZDKp82J3Vo2ufK7NWGp0BLmz
 +aAg==
X-Gm-Message-State: AFqh2kq66gCa738lNWzj/r2KpJ7dXcSaSdhSUm/GswGURWPlJ2/UKqwH
 mU29smQOPIQKnhdukNb5hmmsAQ==
X-Google-Smtp-Source: AMrXdXu8t5pfKS4rJQB9w2fmYZWbGOdVt9Co/jrV0noSh0NCRbIwq1U+45wR8Qydaxpx9ytF9YSmoQ==
X-Received: by 2002:a05:6512:22d0:b0:4c0:5798:38df with SMTP id
 g16-20020a05651222d000b004c0579838dfmr21545854lfu.27.1673220556738; 
 Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05651220d200b00494a603953dsm1283513lfr.89.2023.01.08.15.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Message-ID: <06eab036-7c0f-55d5-2ad1-cfaf5dc0cc8d@linaro.org>
Date: Mon, 9 Jan 2023 01:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: Reject topologies for which no DSC
 blocks are available
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-6-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2022 01:19, Marijn Suijten wrote:
> Resource allocation of DSC blocks should behave more like LMs and CTLs
> where NULL resources (based on initial hw_blk creation via definitions
> in the catalog) are skipped ^1.  The current hardcoded mapping of DSC
> blocks however means that resource allocation shouldn't succeed at all
> when the DSC block on the corresponding index doesn't exist, rather than
> searching for the next free block.
> 
> This hardcoded mapping should be loosened separately as DPU 5.0.0
> introduced a crossbar where DSC blocks can be "somewhat" freely bound to
> any PP and CTL (in proper pairs).
> 
> ^1: which, on hardware that supports DSC, can happen after a git rebase
> ended up moving additions to _dpu_cfg to a different struct which has
> the same patch context.
> 
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

