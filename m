Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304F752B41
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC44B10E780;
	Thu, 13 Jul 2023 19:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE210E780
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:54:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so1972961e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689278065; x=1689882865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=clKkWtxyIkXw8m8IPPcWm+m+9Les5D85yWZ8cKKD4C4=;
 b=q2ci3Fg5IDYue4GUurlh8oSWpoKoWUbddB9onmk3dtjRpr/fG241+YOzBNG5gDhLPs
 HyBATbDRHQKAuk09Ep6lclx/HPF9HSoiaH+CC6FQYJlUtN/yOSuwIj6iEqDRmhqIdyWX
 fZ4dZr1Q6l5YU6ly6EesBk3uJvx4N5kk/jPjhzJ2dwkSMJGCl+ioH3l3KiFJkC4y+Wls
 lMVgsNQhSroheCK68gLwVILKP5gY2gVBAcGsq6PfYswFSSn8Bxv/fGYrQjEHkmP0lrWS
 LFLKg+W6u1fLU/Al2pWQTqnPUw0rCy5RtwXxUaITlYs5Fdi40icc0ugmK1A/hGCcPR6m
 orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689278065; x=1689882865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clKkWtxyIkXw8m8IPPcWm+m+9Les5D85yWZ8cKKD4C4=;
 b=OyObE/nbtSzAu12UImYDthC97oAfUgPtxjJWR8xsQtntlZW1VMhBuOMC4cOPfo6JuZ
 r6GZABMpeSqfriyHEhrJ6Ox/1v8WMZNrCjJM40r+JnbvOvgkT5H8FrC6DOZx3mtfvGJR
 9kUZjt6Ep2aSiwf53rfcaO4hRjrGjlHkLnW6TKEtudmMV8bZjtb3i+6TxPJocMCrrmuK
 iIBJ1cEpj4DxpAjpioGzWH58j/2+CDhj8r5M68XJyhya472AJtm4kVR+tH7LlQm+o7sF
 aaXAxPDPYUNjZ9eM93VgEd9atoL4LX5xjDAMM6i9yW7MRGbBQiIFDJHppLAu9fI+0fYD
 NxVg==
X-Gm-Message-State: ABy/qLaSkou/puVARiY6/Cy73BR39bttlj90IuyIMRw9vur0WrIAh3bU
 8fEmLU7q278499aawYO23+d+vA==
X-Google-Smtp-Source: APBJJlEr4b8PNjVA6cMuPyGVfwcyOhtVJssLA+dgVHImKP5zOosdDhmTMJ688RkYWgCS7ZSpKCje6A==
X-Received: by 2002:a05:6512:1146:b0:4fb:745e:dd01 with SMTP id
 m6-20020a056512114600b004fb745edd01mr2000432lfg.45.1689278064980; 
 Thu, 13 Jul 2023 12:54:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a19f601000000b004fbae51d1a5sm1206841lfe.295.2023.07.13.12.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 12:54:24 -0700 (PDT)
Message-ID: <826ac576-7a9c-b9da-c572-fa74424ab34d@linaro.org>
Date: Thu, 13 Jul 2023 22:54:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/msm/a690: Remove revn and name
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230704163640.6162-1-robdclark@gmail.com>
 <20230704163640.6162-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230704163640.6162-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2023 19:36, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These fields are deprecated.  But any userspace new enough to support
> a690 also knows how to identify the GPU based on chip-id.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

