Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F38464CF8F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524E910E44E;
	Wed, 14 Dec 2022 18:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5391810E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:41:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j4so12027500lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KlbzUq+tOvWZTX1iTC62dGCw8tS1Tawz7StXXWUJBow=;
 b=OAHpv2sC74xYtK7Xb0MxTnMZXhNCPvr5e5pBtGJRmjeJlqY6rHJaEE4yL1hu1z6IZu
 dFyUbOyyxj7OLPnojhoX+UTzb9zQZ8uiAsrxzZu6USLFMAvEknD6gBYUG5AzQg49FulN
 8qiEu/iYD2aUDeE5Vs/GK5UEdMFYFor271iX4sGEAvzUChWjhlTJxuf6EnImeqMYEObO
 g2jTu1v8VQHGWTr74qcswrFPZ4uvyKZFOf/uigJIUFYlphLrmpQREbRpdqQF08UspHPC
 zOrVLnf+iJWQwZNC2dcXcw9Uk1KWRlGaAHz2aKn7r+PwyntXykUbJnLn3BQLZ9wbQV1Y
 RPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlbzUq+tOvWZTX1iTC62dGCw8tS1Tawz7StXXWUJBow=;
 b=GBrp2bFzYvwogDOvGMhuF3z6EnRRE+S5ewpilHB0qhAld4JpwLQC+uWyFnMfhdKBUb
 8YdaIQORHt9O00LFi73KRHKc/CPKhjMOoylyFtYYwnWd1pGXLMT9W/RLAg+9rFeN6t2y
 3D6bYvZPZxFw8PphdUYdFhYRQpdc70WTdTVKCYM5mm00aYQtISe+kXcmbdtBBPDFJUNy
 zXEOdKwRc96KT8Izv5OQLrx8s8hX3y3FVEzfm1NkguMMP7C4pTsjkWGePjgJ/CgvPqYm
 KHDafngG0e1xS+CdoPwm8VNCdlQqJl2/lXBpMPQwDShVshinbYNo3cUY4jaNtkr2sFyy
 Ge+Q==
X-Gm-Message-State: ANoB5plakrRXho4EolfB73zMXckjLw7LHbB314mE18Ro3QtE6mJzlpD1
 LimHeEAiozkkXyO5iHSxDOElPQ==
X-Google-Smtp-Source: AA0mqf4INakKd3LZMtzDYYR0L5yC7mvhNniVhImL4nXThcWEcwVIgzV3XwS24djEPGbC3exkq6EPgQ==
X-Received: by 2002:a05:6512:2812:b0:4b5:ab12:9acf with SMTP id
 cf18-20020a056512281200b004b5ab129acfmr8428468lfb.60.1671043260708; 
 Wed, 14 Dec 2022 10:41:00 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056512200400b00498f00420e9sm892123lfb.194.2022.12.14.10.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:41:00 -0800 (PST)
Message-ID: <c90f6017-b757-f514-a6c4-1fd0f010a2e7@linaro.org>
Date: Wed, 14 Dec 2022 20:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 1/6] drm/msm/dpu1: Implement DSC binding to PP block
 for CTL V1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-2-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-2-marijn.suijten@somainline.org>
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

On 14/12/2022 01:22, Marijn Suijten wrote:
> All V1 CTL blocks (active CTLs) explicitly bind the pixel output from a
> DSC block to a PINGPONG block by setting the PINGPONG idx in a DSC
> hardware register.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
>   4 files changed, 43 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

