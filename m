Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2476C98C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8108E10E062;
	Wed,  2 Aug 2023 09:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E28E10E062
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:35:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1344b707so10589917e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690968950; x=1691573750;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pohg9zSaMOJCBUazSnms5q/h+HApb0cmdo5z/ZK/mUQ=;
 b=ZC+Grn4yM3PgtUUEkhcgq4sTNTV+3REq8KjNQiY1swdBRWPGO3kM790yIOM832qrp0
 nFwJMjrgw9cXxoLFcNhPmV4TmmCujAh85rXMbvW0RDAai+cuLYpsHqiLWOuUnGrE4o8M
 CG3tlLBcmXglNsuW9MjYctyhnvDq6qtHyS8AmzJTTn6GZULEradARsrD5gZkINDvC5qL
 m/7nuSeWzA1qccmWZcCEYR0LwNOojikWz2tTv4cOEB5FbizxJZIQMPo4xHJqKTZlgOi6
 spaF+F4YD5qgUeMGcUos8qO5FSiZqL0d+p0IYy59QfsK7oiiKCa4lFzK114iZi+3X6QN
 uVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690968950; x=1691573750;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pohg9zSaMOJCBUazSnms5q/h+HApb0cmdo5z/ZK/mUQ=;
 b=F6bZzNaldWZTzgVKk8ou7LyfD0UapFYHombriys6tWnnwBM5bxS+ov0Dgl5Qq3ZVrM
 BPwJMCtlUbJ4tryphnuc5xnYy7Ul2S5JxIDf5l4sRf5TQhT7kTgKVug19c/NvWKVwA5R
 BkKKv5pV2by+QBDJKDq8/uEP0YYnawLMqzsTBLlkrg3ekbSJdO8pju8dH+dJQrleLKuj
 XnkCxK2x4fQRVf5HVkA/iMgpjhPJJ2PgGOmEZfGKjDJ7XQiSy9srVuxRCA1aLFg7wJ1e
 Vf5u6EAiEMxM4mzjzVLiJmJAj1O0phaweDgnjpUZ4QebLwjHSMHW8JKVKhjMdDDkMi/d
 xOww==
X-Gm-Message-State: ABy/qLbNK5APp263z0gIgAvCDqiCgxSQhtRI/2paVOzHc0yvc7trkplq
 PkRBmwCUpY8ItkzXP6PTjIIrCw==
X-Google-Smtp-Source: APBJJlHJTVMe30C4pbnicvRVJ2SsKv2DoOIoce/FePG1RZbhSiexihUJ5NXl7ZGcJyuxBNgNRnGWHg==
X-Received: by 2002:a05:6512:3b2:b0:4fe:df7:bcf5 with SMTP id
 v18-20020a05651203b200b004fe0df7bcf5mr3523141lfp.8.1690968950204; 
 Wed, 02 Aug 2023 02:35:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac257d3000000b004fb8c31c8desm2909996lfo.208.2023.08.02.02.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 02:35:49 -0700 (PDT)
Message-ID: <131f9c51-10d6-c4b4-4e7f-c3c30480d385@linaro.org>
Date: Wed, 2 Aug 2023 12:35:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/msm: Remove redundant DRM_DEV_ERROR()
Content-Language: en-GB
To: Ruan Jinjie <ruanjinjie@huawei.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230727112407.2916029-1-ruanjinjie@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230727112407.2916029-1-ruanjinjie@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 14:24, Ruan Jinjie wrote:
> There is no need to call the DRM_DEV_ERROR() function directly to print
> a custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message
> in case of a failure.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 1 -
>   drivers/gpu/drm/msm/msm_gpu.c            | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

