Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A9790F0F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFF910E25B;
	Sun,  3 Sep 2023 22:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC42010E255
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52c74a2e8edso1228450a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780756; x=1694385556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJDVZGRXNPlbG+uW3nJBHU09g5j3lMYwRuZyrmz3c3s=;
 b=Yx6VjuHO5LPJT+lm1wLL+LUgDOH4t3MxsaVvM30kCJfBYEg86K0JSpu4gjPuLbQzhS
 Ej97BD3PdnCT1ww1m1ZNgHyxO4XYV2r5RPRa1lpW4+y8YZDR/t+lCD4xCADlX1/8TOup
 iO3EyRH+/ojTGXR+txXJafn7BPlGx+rBIMHPA8nru6OvFmQ7CcXdg6kch0LQUucxdzNv
 Q2FObxiHrxFRZefcm3y7r7YADayxD4DQzJRk2zKMChGrH1QlCgFWqmXgMiCV7wte38aX
 FyiANj8GxrevpJKu/GVSyLAdvx0g3YJFfWiqfT0yl+2EvD3qNMb91y6c4ErUPSUmWmTB
 4tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780756; x=1694385556;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJDVZGRXNPlbG+uW3nJBHU09g5j3lMYwRuZyrmz3c3s=;
 b=To+C30u68wr9Ok7ZqeSljrQikf5jBu7U/pQzcA1bxl2EvqibkUijStIZPoXQtuh7wZ
 2GhIgQOeTedl/G7rLUc9AXya3PSCAQWZeuQhD3kl7waj1eSgHB70js4ko3T77B2sfgko
 cLf1hi+5gSLFESNXHu0ZtyFTZ412ehuY+B6YGaII9wyQWBEdNbA+y58QHsCZiu/aJR7g
 EAVdz8lT1ogq2fSZHQaHt0FABtJDVwFnski0FVwv7xnKQ3MS7BdDrvNJBxle7DdNbpvA
 Mmvt/fDgrbCI4kaa/QXCitgsV8YfTEDwXj0nW0TWSXh8WptYG4H1JTqZA8H9Nq0UlDi6
 x1zg==
X-Gm-Message-State: AOJu0YzrCtkahMxj9C83VAFlG5dMFu8U69ljxs7KK7PkUuKN0YNcPi9o
 dGVHBHLom7rqUPW9FJ8PKXhFBA==
X-Google-Smtp-Source: AGHT+IE8rdKKfRtiKAW4qUZx2CR6ApBgBWNohpTtDZ86s5LagIbmW/Z33cweCIm3MWR7p4a6suEfqA==
X-Received: by 2002:a50:ef1a:0:b0:523:6c47:56f8 with SMTP id
 m26-20020a50ef1a000000b005236c4756f8mr7429079eds.18.1693780756071; 
 Sun, 03 Sep 2023 15:39:16 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:15 -0700 (PDT)
Message-ID: <74f45f3a-d075-4911-8173-2ddf4ba74b02@linaro.org>
Date: Mon, 4 Sep 2023 01:39:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/dp: Remove aux_cfg_update_done and related
 code
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-5-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-5-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> The member 'aux_cfg_update_done' is always false. This is dead code that
> never runs. Remove it.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 15 ---------------
>   1 file changed, 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

