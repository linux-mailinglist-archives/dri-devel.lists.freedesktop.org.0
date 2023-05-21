Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280470ABB4
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 02:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5310E00F;
	Sun, 21 May 2023 00:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599AA10E083
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 00:01:40 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2ef0d0daso8277661fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 17:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684627298; x=1687219298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BhHFF+I9itHk7q02MfL6eP2c+lYCwKwlb36uQkoEo9A=;
 b=V0qSG1ktvYe9blNJveMjWucQJZVwefISdU363LoGwpFPPLCa/JY6/4ZtlJ1WhzrGep
 zzxVpl1XBD4rzvZjuMyKob2BXOnxvYBmYrRZHZkethyBmzmSwRzezd982JBHb7z830OA
 LWnBAozc/VQNi7DvxiEl0LrI6VEg3Aax7fwbP5quFwR8GasL9xKwY8F0bQvvTyzFUmKf
 loQhcHnvoaESMwzAZ8/Ttt3ok8a+s0NwufZqxA3SWA+VySDN9I/j0vAdK4pnOZGn9/CC
 jmpoFyNSG+fIcbvWyB0WFUYxRzlzbTqc8f+CXpJ6RaRLbvf907U6ipWBZ9CnhuvzzQwK
 JjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684627298; x=1687219298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhHFF+I9itHk7q02MfL6eP2c+lYCwKwlb36uQkoEo9A=;
 b=bsTkT4Hvujf1MgfnDOHG3/cctUFA2ZDx5y3wuorMqn9RSNKeooIEmsWGxuVM9KtBDW
 seRuN6p6mGXtdnKxnTio8gEgBx0XDfbqX5jKDRpCIPlP6dY3v2aM5/JpfkXXy5ocdS2Y
 uaz5B60c6yXXAGaKEZ0elljz79aQHDodzSrZlVMpurz4e2LMZNVMH07QHm6gSyWznJcP
 FUofj0d7P7R6oMvX8NHfACkvHuj2x+uVZjyiYBrBr8f+rQkkd/cZX8KbjbXU9WNDA8X0
 8ELHdeYIl5i5N3MI1IX9bDQqvbxx9ubB7cOLT0MtyOFPUEdVvdWcqDyvXfhw++ODLZr2
 iX6w==
X-Gm-Message-State: AC+VfDyglWcZW67+ZnLcqubFfqvxfmPP4cWhAAKDY3cHbtXMHhK7YpRE
 UlbcD3gc+YmEtY5Zkp6+/ca2Sw==
X-Google-Smtp-Source: ACHHUZ44FKOqvfM6G1aCOIoZiD/9C+PWsjCp90qta9Eul9ReiyZmASMzYYR/LuQJRg0F9rAZ5txxWA==
X-Received: by 2002:a2e:9c0e:0:b0:2af:3f7:53fe with SMTP id
 s14-20020a2e9c0e000000b002af03f753femr2059520lji.50.1684627298093; 
 Sat, 20 May 2023 17:01:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a2e9147000000b002ad9057fd00sm491399ljg.85.2023.05.20.17.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 17:01:37 -0700 (PDT)
Message-ID: <115de0ee-f0bb-84e2-9bb7-00e23641bcb7@linaro.org>
Date: Sun, 21 May 2023 03:01:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 9/9] drm/msm: Wire up comm/cmdline override for fdinfo
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230515143023.801167-1-robdclark@gmail.com>
 <20230515143023.801167-10-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515143023.801167-10-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 17:30, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Also store the override strings in drm_file so that fdinfo can display
> them.  We still need to keep our original copy as we could need these
> override strings after the device file has been closed and drm_file
> freed.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
>   drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++++++
>   3 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

