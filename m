Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B36801FF2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055E10E243;
	Sun,  3 Dec 2023 00:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DF10E24E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:08:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bf26f8988so140627e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701562108; x=1702166908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zdl2HKrC6VDqcQMieLin647Q0Xn6ap4MwvU9WaW0Y5Q=;
 b=Oy+20aFIBa8qKPkNhuKRUM+fAdqntwPbincKBz21Oxu+cUsEqEPtjD1X5JNp3J0yDX
 wp5Qi6kEx4MZfMiNgmGdX/BJ2inHwxRoSOC5EG2PJXJN3isPK9GWHyhPuLlwUAaCCOXa
 wpmh/noBvGZVR6ONQUQzPKaO4GyFwAGpI45K+Da931uoMZ/7dPwRuIMDmWKrOnSznxgW
 eJckasf194JIiYK41DmJhMR7lpVC2UrPa621gO4j09TIRspiG7S+XkFl3QdKzzgRT67i
 XRwOzUhthVLixN8JCgc/XboXz2Rvjgfs1QITHXFYzXnZY0MebqIDlu2w2LEoPmRg5z7T
 ksTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701562108; x=1702166908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zdl2HKrC6VDqcQMieLin647Q0Xn6ap4MwvU9WaW0Y5Q=;
 b=BDrcBlWlys7jPzUqgZlxWHlGmC8mUzBB0o6Wk1CuccYCLXVuMBRwxj4pwby4H5hLiB
 NiVZgZtYv4xR/pO3BxLFGzo4U8O8bfFziDTagrDJyYigkUqhI9zItjFRB3b0oykwoy34
 7xL+hT7npJBwzJDl3pFv8BGXlY+RmBmdZWLCxFv3eHXJPw9oKzI+/MNs6wRCj3M+9iJO
 fjng4x1i84bCTQymHjDgvdP0hHi0cBEPUvVyIDgfT4BztWwktCDV/9+8KNWnDZcIHhjQ
 fucJl2qYYcJC0z7vQ0eFlr4reLexplS5JpxWYQCcJ7x6Vb0IMu5+2ODcl/3/9k861lka
 WJSQ==
X-Gm-Message-State: AOJu0YwReAX8R1jep4Zbs2zkuWJApRoEJNTLX5UxFZ7SGLso1W32quqi
 XYnCqjb5nxh6Fkk+f+RNeP0IXtdx/67b6krayAZTh56s
X-Google-Smtp-Source: AGHT+IGKKKovG+G/EKvfWVyIsAtKAdovDgxSn7t9v9ctBMOdpY6B633LhdgxF9RCRhAKLajhX41/FA==
X-Received: by 2002:a05:6512:b20:b0:50b:d764:969c with SMTP id
 w32-20020a0565120b2000b0050bd764969cmr2043149lfu.128.1701562108507; 
 Sat, 02 Dec 2023 16:08:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm830211lfn.47.2023.12.02.16.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Dec 2023 16:08:27 -0800 (PST)
Message-ID: <fa10b293-9c7f-4904-88bf-4ec6528bd0ef@linaro.org>
Date: Sun, 3 Dec 2023 02:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/msm/rd: Check PT_PTRACED for cmdstream dumping
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230914172453.9707-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230914172453.9707-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 20:24, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> So, when you want to get a cmdstream trace of some deqp or piglit test,
> but you happen to be running it on the same laptop with full desktop
> env, the current dump-everything firehose of `cat $debugfs/dri/n/rd` is
> quite a bit too much.  Ptrace seemed kind of a natural way to control
> it, ie. either run what you want to trace under gdb or hack in a
> ptrace(PTRACE_TRACEME) call.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I think this is a good idea, to be able to separate process being 
debugged and all other tasks.

> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index a908373cf34b..a105ca1f2102 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -979,7 +979,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	/* The scheduler owns a ref now: */
>   	msm_gem_submit_get(submit);
>   
> -	msm_rd_dump_submit(priv->rd, submit, NULL);
> +	if (current->ptrace & PT_PTRACED)
> +		msm_rd_dump_submit(priv->rd, submit, NULL);
>   
>   	pm_runtime_get_sync(&gpu->pdev->dev);
>   

-- 
With best wishes
Dmitry

