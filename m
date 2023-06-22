Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E297473A871
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A408110E5A3;
	Thu, 22 Jun 2023 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A6310E5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 18:43:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b46cad2fd9so85211081fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459426; x=1690051426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6dRnycaB3AP334Fb6uAomoGnhJ7vG39LTkLzaBIFk44=;
 b=AlfRZXwK8UxUZA6aJ02mwY1OmVaJiGFBflSjyu/XPlQ3tSSjleflUNnUAgXb22I/IU
 C7T67D41AHU4Zz9ofK8EVkojsWer5VJ7fHQ/mQzzLg0d666CgBfhTC7tjvoydkbzmlZe
 Yf4FdRXN39IBgkehQiqY0ZTEbhvgZ5RPwOeNe5BEGzsqcN7wvjrGSiyt7yApwN4sC6iF
 uqyuIQuT7xNlSuxUp1r8nKsApy9pMq8hqlcCgKWoL+F9ne7YHPE9eR+NYiUr7lhRDTlQ
 9flJqKZUp5eB6NFsIoQEGWkE/WDgWp0rdT8nJeKMcKtjvTgw/SLpWOquMtKwxuOV597k
 Etbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459426; x=1690051426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6dRnycaB3AP334Fb6uAomoGnhJ7vG39LTkLzaBIFk44=;
 b=cDcLzzeFoAGR+CBbgWuL6JRbgRsPVN23cl5geFdo6MrUMzuQ2b/t0GL5/lzj6RHahE
 IFlb1DGoF5yqDstCHZd4Jge9ZUT5Zh5JoTTIRZWa2M15P7Imx7G8ubeG9pS+2FWgxtpk
 cZocBxCa9lzvZdBH0F7FjUQKd/bMwdyLGPjLZy+NdagNfOePQlaq2eNi9CEkaCTe40OH
 8KvlREJV8ceQ/eQte2TkU0SFJdPSQw7FsQONMWnKXVF1axnG+hyU4x3LwrVINPc3wTqP
 ZZvALdwBAE4p9SJlZQiGjvcuKCsosjfSKnk4xtTh/Cipd4kTjkP+Fqf1W+BY5eEKIN3N
 8rJg==
X-Gm-Message-State: AC+VfDzerj2EKdzYUjejoBoVLfD42TCzxguiikgV4xvjZewBGxAZDKUb
 7T4XoH7PrCqM6BHmVfGLGAAiPA==
X-Google-Smtp-Source: ACHHUZ67cCLc2mNUuPFSD/Jh8swXlxU7En9u7t8+O8lyPR7iCOmc1Fqhssh8nplz/Zr/zvQ9+slolA==
X-Received: by 2002:a2e:a175:0:b0:2a8:a9f7:205b with SMTP id
 u21-20020a2ea175000000b002a8a9f7205bmr12168056ljl.36.1687459426140; 
 Thu, 22 Jun 2023 11:43:46 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a2e3a04000000b002ad9a1bfa8esm1414772lja.1.2023.06.22.11.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:43:45 -0700 (PDT)
Message-ID: <1f259e13-0a49-f06e-9578-8de533115f92@linaro.org>
Date: Thu, 22 Jun 2023 21:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to
 prevent refcnt leaks
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <20230620-topic-dsiphy_rpm-v2-1-a11a751f34f0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-1-a11a751f34f0@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2023 14:43, Konrad Dybcio wrote:
> This helper has been introduced to avoid programmer errors (missing
> _put calls leading to dangling refcnt) when using pm_runtime_get, use it.
> 
> While at it, start checking the return value.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What about also adding the following tag?

Fixes: 5c8290284402 ("drm/msm/dsi: Split PHY drivers to separate files")


-- 
With best wishes
Dmitry

