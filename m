Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09139709C15
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 18:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421E610E533;
	Fri, 19 May 2023 16:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C64810E2BA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:11:27 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af24ee004dso9836881fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684512685; x=1687104685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
 b=XimcjwpseN4sg/6ILLyI/wh2VOsqCS8pQ4ecnvF2uepxVZXp6gms4bDvHJSJLBJSMf
 rjo9kZioiKT7Kx8+xZdIyT6d6rtW952XUNS/eZUBY8LHvcKmnTs8BJMffD/k+sc4YnJU
 BJzjSpqG64IO0SzYb/K5KpTURXhBmdTS+GRbsMIxaPBBFslGKC27uRwaxTcJt4PbatBw
 tbzie0boYM2nsDM7YTXxlrvWTssgBXrVaB6dKyFy43QgxyuznaNW3ukHgVL+4eAzVTyL
 rQTFm+h1n20PMECoQvqCf0BTj3a8K/Ti+3xdmQoAF8ko8YpUhd8waQJgZ8I8/Pl/VrUa
 ehBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684512685; x=1687104685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
 b=MN01Q/yzk7qz1VXmk1k+VrgL1gYGtt8AFCiE+OU4n2s/PHy7s5yLLxPYl9Sh9IWy2t
 8TpxAvf5ICEjLIwAnGUAUxtXgymIUQXs58gu4LKeVgCGlyPr4crvKygJKkSR7Km3KeQu
 AjeNTrEQcdwzp1WrHfY79iZfHX/zIUf6axddcsAqXoCmqh+1Y1zgPgOUrfKgmYZqe72T
 oTMipQ8klqpf9Z+GsPLYazOp/unSnyKCtafOEOR+NX5RI4idTtAkm1jz9zr9APaqT49z
 gi4AbzkMDaq+A9YEhIjWPQadv0xPa2PFVANQeCmVIVo8Zu/me4jyLzytWSYw8Y2C8Ent
 SPRw==
X-Gm-Message-State: AC+VfDz6dH8YvBgYQwtQBMTXQX70icSjRcdBvwP8yOGUm6XrF7JtuZQP
 nGoGBTHbUkqAgxFYhSrGWLiAcQ==
X-Google-Smtp-Source: ACHHUZ5z21vkYtp5meWScZ8B3BaN1oGbfOr57BlfM1oNMpVjSqX6CCEXxlt51V05SdPYFUuSQq/LkQ==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:ac64:84f5 with SMTP id
 f12-20020ac24e4c000000b004f3ac6484f5mr830298lfr.36.1684512685655; 
 Fri, 19 May 2023 09:11:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a2e924b000000b002adc5ea2791sm842378ljg.103.2023.05.19.09.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 09:11:25 -0700 (PDT)
Message-ID: <7cbc5958-542a-9119-e16d-9967a2131f1d@linaro.org>
Date: Fri, 19 May 2023 19:11:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: remove CRTC frame event callback
 registration
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
 <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
 <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
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

On 14/01/2023 02:49, Abhinav Kumar wrote:
> 
> 
> On 1/2/2023 7:47 AM, Dmitry Baryshkov wrote:
>> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
>> to NULL) and the data is always either the CRTC itself or NULL
>> (correpondingly). Thus drop the event callback registration, call the
>> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
>> assigned using dpu_encoder_assign_crtc().
> 
> I suggest you wait till we sort out the PSR series for this, especially 
> this patch https://patchwork.freedesktop.org/patch/515787/
> 
> There is going to be some change in this code when PSR is pushed again 
> sometime early next week because PSR will touch the crtc assignment code 
> (dpu_enc->crtc),
> 
> Based on how we all like that patch, we can get back to this one as this 
> one is a minor cleanup.

As the PSR series have landed, I'd like to point to this patch again.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>>   5 files changed, 21 insertions(+), 65 deletions(-)


-- 
With best wishes
Dmitry

