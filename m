Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5665AA07
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 13:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1F10E2B2;
	Sun,  1 Jan 2023 12:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB210E2B3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 12:37:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 1so38093518lfz.4
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jUwhBT0HEy+w8/7x0rV0cF/18t9AsTlAgTmMKYlGiAA=;
 b=NwRWs9TNy3ZZTSkNCG3P6pyld0/m0H/Z/q8+dt6x7LRWUC6KnUIKc5Q44yzkGoKqhs
 XVFgW08IJ9Y494napjEdx2NoHgVvkWKOhMc8YEJlpkdvzq8Vd2vs4tyQnCGbQmxe7YFH
 mR326j4DTaQgQvVLxeCjGYriBQkBHJFBjrBo+vw8t8SwIV7BIDwEFdL/tQkzgSJtUt8q
 xdLCJGfF3qVVmTw6bfakiwdWQExuNLK0I9nryCgSbIGo4fyoIVZGVfdZReI7d5Bqh1Dv
 kWkA4lN6jQ03peh/qdQZH4EA0HnO31Q9du4ONyg0QwmMkmg5jmWSd4uGBwwzsyFape+4
 rSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUwhBT0HEy+w8/7x0rV0cF/18t9AsTlAgTmMKYlGiAA=;
 b=NkQ/hdGgLZUMuNUzleLPLjpKIuwRwQm2Rq8oQYXzzKUiob4zsGq0J4gjni1yft+6Ck
 9CPQSp+uKafUkj6oX8CwNT+pH5MWZKrCFIljJtz+TbDeUfRmzI1UaScKiFJfGX9Frxvs
 gsD8gLK+pBN8OOZ+pRuQbkbmWnl7eUV862UeGk2eqEVgLo6fu26JpY03sPhWuKZOBqxq
 /eRS2EXDi1sX+rtv9v6S9f4fFnonwqD+hc3MyVcB6LJewQn2l4aNo+BgrDOxRqm1LEgr
 KANGzJgrYQmjeQPMZ8bfq4ZpS/PH4XpkQUvdpj7AmSti5yjhSxX5a+GldO9Eez8AyRbe
 5JUw==
X-Gm-Message-State: AFqh2kr0a8Vx2UJxPIFOY2RFvU0hKKrfwYYEH6bo6NW2zlWPa+wJvRSJ
 GqlZ48MosSPCntunHDERBZseGg==
X-Google-Smtp-Source: AMrXdXurlJQff+dDmDW8g3Xq0c5Fk0JYKoF6Cfb6PWUPzdD8nLmpEu/D4fuNrfY4vVcD7AtoHVFEuA==
X-Received: by 2002:ac2:528f:0:b0:4b5:6504:a556 with SMTP id
 q15-20020ac2528f000000b004b56504a556mr9877674lfm.61.1672576645937; 
 Sun, 01 Jan 2023 04:37:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a056512361100b004caf42eb04csm4049513lfs.138.2023.01.01.04.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 04:37:25 -0800 (PST)
Message-ID: <0ac4e53b-069e-a9b1-bfd2-2e62325182c1@linaro.org>
Date: Sun, 1 Jan 2023 14:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 4/7] drm/msm/dpu: Move
 dpu_hw_{tear_check,pp_vsync_info} to dpu_hw_mdss.h
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-5-marijn.suijten@somainline.org>
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
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/12/2022 23:50, Marijn Suijten wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Now that newer SoCs since DPU 5.0.0 manage tearcheck in the INTF instead
> of PINGPONG block, move the struct definition to a common file. Also,
> bring in documentation from msm-4.19 techpack while at it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> [Marijn: Also move dpu_hw_pp_vsync_info]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   | 46 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 22 ---------
>   2 files changed, 46 insertions(+), 22 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

