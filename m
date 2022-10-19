Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F8603F13
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C610F1BC;
	Wed, 19 Oct 2022 09:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1877010F1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 09:27:25 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id by36so21376755ljb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfXARYLAPAKPU+ts0JPN6WSMDNf2tPgtkDo7YOo0RzE=;
 b=aC1Rq9oRQvkYFkj/zSMB3cGfJmPvgA3ym7b0Aldx4sTYZ7nbJfYecv1+jCaryzsIpE
 gMs5WaFiZLV2+WGy07yI1VIZCPVdLMVCywN4zg3f0kObS8JlnY37PgSw6uGPex55FxqZ
 C8HCDRMyjI9KWk9y4dZYE/l4HDEYZUFbe9mnFxiN03LOJAxCRO+AJEOJwxUIFdDuoGH/
 NlQYKbfoOIYpXEWTaYHEQ9sX/KHuBRiKgdIrbdFfQJcr0F08HGt0TjE4J4pkshliHydO
 k2+6fJytl8F7e0TBpGD5N4O3Par23nLOl9lS/vM/pHW/y19v85vLlGhOuF8+fdLMUxaZ
 F8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cfXARYLAPAKPU+ts0JPN6WSMDNf2tPgtkDo7YOo0RzE=;
 b=lWi/I/04gNXkB8Df5J3dgxMp76eWFGSP/oYiMhlqF2aoEToyaQzPjLlJpq6fHQjXvq
 WQgn9WcFbE389jGZFwXTpn4wRZC+Wh7GhL99YR/nzryiii1iVlXmf0MfMLhUSxM6n9cJ
 3Zs04o2nJY0knt7MYZtADnvA++l8GMokpjFBYZSWYr/LTdRQYdETaI0ueS3fkyXBOXYA
 n+xi0edOW6rsM74tD82yXSQE9dnURv7k34VxfY6RjZj787VIIl4n3HnWuhc7+Qjjlqv8
 831dhJESUTvygT6YM3yTXV4tcB5F0s0bpMv2ldL17RVG/ohLnefFB0/Kod5x2g5wZ3kF
 wKYg==
X-Gm-Message-State: ACrzQf0P+w5ttMuUYCAhJEGVfhtLCOzZwoRQt6GVUAmBRaNJ1iRopq/U
 VoIGuXpkXhxqd3F2mZgVEXGgGg==
X-Google-Smtp-Source: AMsMyM4whuxT7+AoBpdG68cpyGwsuxGExvwb5YnVAEngbIbOYk7MlxvP+3mfP7XiBru3VnVLBrTyNA==
X-Received: by 2002:a05:651c:1786:b0:26d:aaec:1487 with SMTP id
 bn6-20020a05651c178600b0026daaec1487mr2528273ljb.287.1666171643259; 
 Wed, 19 Oct 2022 02:27:23 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05651220cd00b0049f5358062dsm2218639lfr.98.2022.10.19.02.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 02:27:22 -0700 (PDT)
Message-ID: <09e82b02-dffd-8ec9-4851-11715a16b67b@linaro.org>
Date: Wed, 19 Oct 2022 12:27:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
 <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
 <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/10/2022 12:13, Marijn Suijten wrote:
> On 2022-08-26 12:16:40, Dmitry Baryshkov wrote:
>> On 05/08/2022 15:24, Marijn Suijten wrote:
>>> On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
>>>> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
>>>> components") changed the MDP5 driver to look for the interconnect paths
>>>> in the MDSS device rather than in the MDP5 device itself. This was left
>>>> unnoticed since on my testing devices the interconnects probably didn't
>>>> reach the sync state.
>>>>
>>>> Rather than just using the MDP5 device for ICC path lookups for the MDP5
>>>> devices, introduce an additional helper to check both MDP5/DPU and MDSS
>>>> nodes. This will be helpful for the MDP5->DPU conversion, since the
>>>> driver will have to check both nodes.
>>>>
>>>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>>>> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
>>>
>>> But I'm not sure about giving my Reviewed-by to this, as I'd rather
>>> *correct* the DT bindings for sdm630 and msm8996 to provide
>>> interconnects in the MDSS node unless there are strong reasons not to
>>> (and I don't consider "backwards compatibility" to be one, this binding
>>> "never even existed" if mdp5.txt is to be believed).
>>
>> As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu
>> device node. In the end, the interconnects describe the path between the
>> display controller and the DDR, not the path between the whole MDSS and DDR.
>>
>> So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe
>> even move existing inerconnects to the dpu node).
> 
> Sure.  In that case, do you want to rework this patch / code again to
> only look in the DPU/MDP, and not at MDSS at all?  (Or is that another
> DT API break we'd rather not make?)

I'd rather not make this break. Let's keep backwards compatibility at 
least for now.

-- 
With best wishes
Dmitry

