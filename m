Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E774A8EF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ACF10E4F1;
	Fri,  7 Jul 2023 02:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E85810E4F4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:24:30 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b6f0508f54so20682711fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696669; x=1691288669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lhC47UWtWOHjAnQy7Fquoncsj5V1+v8tog2t7GNq5lg=;
 b=MwKTwxnFVefFOYITT8KKdPN/dIudZLTeyM71VFCJx38VEpsx1nsIDa0i9byNxJx0BN
 Thw6PA74fueOBKCw5jck6HY1DtgWEg4CfKw8HGqZQGGGt/3tSKzIAYPc6xa3HLd98q8h
 u4NMwDBZrPvqMKnmLAovYssEiAaBaBwh9hnjixX68tBoLxnlYT5aUSSQ4Gb5zUohenLv
 EK9+3soWRgfbT+b0lElOiDycwaCCB8UsNQxD43RIk4nzgmSbWsn0Dc4MQp4meUBtti7E
 2RvNCUCC8SxSd3yU2/SOYGfFpNmql+WmGujfuHVvQBwEx9bSwAvPr25ffw7ddNDkbXXs
 vKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696669; x=1691288669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lhC47UWtWOHjAnQy7Fquoncsj5V1+v8tog2t7GNq5lg=;
 b=gWzhbbr+mmQj3zRWWcYKnKyAWbVeiT27soMVvSQsFGoM1TbjCKkiSncqYLhCqyMXRE
 9Yk6D/inZsWukxMxppgBFJ6BFR0PasmR9GBIlsuXGRuHZCI7Y3xtt5By1T8/Js7Dctw2
 YjkhIPq0feSIYOLE+UdzmR52MjIUvA8TxGdNGbCzlf1An5JB0rTq3Yfngov5oVA31pRI
 UPz0ocAOxzwbIEEOjzeZ8AGDcNIajDkg/5HZWHaMekK63nhB9edlF+3udv0aW6UeLyhH
 6PPXhpkPvzcd4+TDLZWR4IqxkBCKO00895FvDqcNLfy2cQb9j/l98DKJ74QcH66+tRaR
 L+YQ==
X-Gm-Message-State: ABy/qLYxgKbPbzokL4Io+HPTcVF5BGFeVbUgALJYByZkrAbB2HsyYUyA
 LAx/VB2G5j2/l834i/JURY+1Jxl1GRWRriIrk34=
X-Google-Smtp-Source: APBJJlHrapg208VIiOGrvBEtX3H4Hlw5BHz1SpcrT4SZflIVVLEwj+AtZesWj8J9/Mt5nTcWqZ3XfQ==
X-Received: by 2002:a2e:95d7:0:b0:2b7:2ea:33c3 with SMTP id
 y23-20020a2e95d7000000b002b702ea33c3mr2589201ljh.22.1688696669205; 
 Thu, 06 Jul 2023 19:24:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a2eb6d2000000b002b6e00a3e19sm562839ljo.132.2023.07.06.19.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:24:28 -0700 (PDT)
Message-ID: <44b24f54-38a8-8995-ee77-ac453e73c759@linaro.org>
Date: Fri, 7 Jul 2023 05:24:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 03/12] drm/msm/adreno: Remove redundant revn
 param
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-4-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This just duplicates what is in adreno_info, and can cause confusion if
> used before it is set.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 --
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 -
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 22 +++++++++-------------
>   3 files changed, 9 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

