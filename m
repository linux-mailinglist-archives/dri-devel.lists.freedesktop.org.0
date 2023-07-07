Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2C74A923
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A541E10E4FD;
	Fri,  7 Jul 2023 02:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24B010E4FD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:50:27 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f766777605so2069305e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 19:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688698226; x=1691290226;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
 b=S+A/rblWHFXCOq25xF/GvZAInClqSzYxTB1MRS2/CBoydnYtyuZEfXpKPBOL1md91I
 WEwLBlCi5TjkAgbp+75JEkD2bm4VE1GosRsFwVlX54nHZE5ctMxYC5eR2j+eFUblTsuF
 DzzWQ99bZpW6fbotRQpHBtkIbK3ETBLQRAYtX+GX5BmV1zrT5EtGWoeujmd3Fi11+NWH
 CvOsM+D0U7Z9g14QJPkr1sF+2NvE1o3hVzFJJBqXxyJFZz27knoQWrAaoCuxgBJYmFod
 XUFPHtdXc+6SYEL/PT6a3bpkZpddb4865BLb7KcT+KwsMvTjTbWQY8I5DsJcwd7DvqI8
 HUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688698226; x=1691290226;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
 b=L4tkPtxVygAXjE51W+DQdpUxOTJRaohJMaZofFB3Kc2y1RnE5My24hD+hCu7M4s2le
 QKfiG0nu0uLuj3BfiTozG1iaBO01Hp9N/r3wXsc1bv7ykP8nSAlXFN+4q4Opj6z4hxYt
 8drP40BaI1UqSZhFC2IQe1fG5VY7POT57djzFnVuglzkdvpc9fvznBzBLCjpfoD3641n
 5QTp8kfFh8Fr1zOZN6qWUJMpEmAw58FSEX3CdVumkXUOeeeMQgqWzfMS+eE1e6Yza7ed
 fG1oLj0OUqRUWZtDgQr4aMikDkEySkLNDpI9edGRQlCxMyIxSpT+4GIgf0GiUdMB0MKl
 In2w==
X-Gm-Message-State: ABy/qLbPns81O3yIHYbKMJhPLHlsu5vpTq5lx0dWKOCV/3sotcJQkqEg
 o0RNqlEz1evDZbXRZQolGs1nIQ==
X-Google-Smtp-Source: APBJJlGG3OOx3uOszRFHCsgz1WFUvb99qSo5mig/O4sfB+eCBGIOt6A1Bi7Vt0J7P6G5fyFh/56rBw==
X-Received: by 2002:a05:6512:4023:b0:4f9:5316:d5b with SMTP id
 br35-20020a056512402300b004f953160d5bmr3339332lfb.64.1688698225938; 
 Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac2598a000000b004fb74cb9664sm492786lfn.94.2023.07.06.19.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Message-ID: <6386e91d-0307-942e-bad5-7ddc877f1c73@linaro.org>
Date: Fri, 7 Jul 2023 05:50:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 10/12] drm/msm/adreno: Add helper for
 formating chip-id
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-11-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-11-robdclark@gmail.com>
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
> This is used in a few places, including one that is parsed by userspace
> tools.  So let's standardize it a bit better.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>   3 files changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

