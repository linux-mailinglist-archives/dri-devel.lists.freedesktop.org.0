Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B174BA9E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 02:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FEE10E639;
	Sat,  8 Jul 2023 00:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A98510E639
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 00:38:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso4080940e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 17:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688776700; x=1691368700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KeeFW0s8AAxhEGltgT7tiarBzEtrHHtHD4b0DBUGXug=;
 b=xKdvV1oTdSo9n9wuZNX0eObB3h3X6qfR9gS/XuxmG4081OUrFQ/hpdX/V7A7a2XpCZ
 joEAl+9HGbCZ7t6t8O/6HY8aL+nJNFIknKrGzeYcai1W8FNn0I9KypeyYQh5/a/dENP7
 X9BLXlvt42/pLNX0Z/SJiT2NFpTZW8PqTjFWNhODP/wzOvw+VohIrJGrI877gtIPEJLY
 hT/1V2eXj+Ir/rFyXCXzof3JJVIbvaI8LpcKpv373+5USIiz1peBKCMjjGFctRNjh+gR
 HZVGisdQBa92RiRNabuQ6g2+i8brahwMGcgis9OYJVinMm/VfmGwX+YCl0esLB7R7sBR
 cVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688776701; x=1691368701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KeeFW0s8AAxhEGltgT7tiarBzEtrHHtHD4b0DBUGXug=;
 b=IvkJX1KZDBKMcKJ8xp+NP47ZEP0dx2HubWTN5PjiS7Cka5clZUpazgWM+4UhD1MlUs
 XlFl/alUZpxD6HT3EvARTMQM/MK9I9IxRi3oyYwdFIWg4OiHiJoQlkZnLUsAZKTW9yJh
 Pe8YHzJCZ04PnK3kQF4snbrhWHNlgGib8q96f6jXmO/W1jCCLw/xnKs1oJwnqztx9l3S
 usJmHQg5RJptdfH3TOUTPJXQFfRgiPGj+QD+LWEqLQR+lkIrnGaorTJtvFGg+HkIyOBA
 femDiCMDcKCGSIM7K9wNKbxSeqBGYaag3kV/9rhe3w1kPM5sm0Jf+Uk8YJ3D0otVKiF7
 OPXg==
X-Gm-Message-State: ABy/qLZUPagpTdTI+WBwYWeGRoyGmlpKgC5/NVh34fUBq/AoyPhGT1Ez
 3i7cCOmgGEeCIRjrzAFoTNNacw==
X-Google-Smtp-Source: APBJJlE7a66c8lI6xcPQtbOd8zyuPnnzOx8CcphvLu4weCUN1Xmbs/j2CLBDyUfctfXWi1daNHtCPQ==
X-Received: by 2002:a2e:9289:0:b0:2b5:81bc:43a8 with SMTP id
 d9-20020a2e9289000000b002b581bc43a8mr4509759ljh.0.1688776700712; 
 Fri, 07 Jul 2023 17:38:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a2e9256000000b002b6b849c894sm999362ljg.111.2023.07.07.17.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 17:38:20 -0700 (PDT)
Message-ID: <62114b30-a0bb-0f0a-0686-afb22159c118@linaro.org>
Date: Sat, 8 Jul 2023 03:38:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/5] incorporate pm runtime framework and eDP clean up
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
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

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> Incorporate pm runtime framework into DP driver and clean up eDP
> by moving of_dp_aux_populate_bus() to probe()

Please use sensible prefix for cover letters too. It helps people 
understand, which driver/area is touched by the patchset.

> 
> Kuogee Hsieh (5):
>    drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
>    drm/msm/dp: incorporate pm_runtime framework into DP driver
>    drm/msm/dp: delete EV_HPD_INIT_SETUP
>    drm/msm/dp: move relevant dp initialization code from bind() to
>      probe()
>    drm/msm/dp: move of_dp_aux_populate_bus() to probe for eDP
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     |  28 +++++
>   drivers/gpu/drm/msm/dp/dp_display.c | 204 +++++++++++++++++++++---------------
>   drivers/gpu/drm/msm/dp/dp_display.h |   1 -
>   drivers/gpu/drm/msm/dp/dp_power.c   |   9 --
>   4 files changed, 145 insertions(+), 97 deletions(-)
> 

-- 
With best wishes
Dmitry

