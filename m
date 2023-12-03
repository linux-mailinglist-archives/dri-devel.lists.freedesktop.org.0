Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA98022F8
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6272710E292;
	Sun,  3 Dec 2023 11:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23DA10E292
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:28:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f65040beso8439131fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602921; x=1702207721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
 b=CDhM9+bQz75yEfT9Gl5y05AruSY2ZOI/f8yPtuy0GC/1k/6dOpLN1Z7bh1zwrOCI3p
 c4sDo5haAXWfWKJvr9L12xDW67HbRNuVVqPfTZ0qndt5Y9ilHJhiuwEraFVfbpFmtjnS
 nGjDp0TvV1JxafQUfkCLnO6wJhzI/2LLf6ccnN79WkjjN+ZYoL7tblU59bQibqeDhjBh
 omPaBnogZTYn9Wc3ojY8m7IWZF87LDKVS316TlSHw6Geplocp0W2/H2zbjc7f5k9zamc
 thqoBcwunfqc8zPAjpScVyiAUO2cfyrATssLXHuzORWJLtEG9dPLot1opw/9JVkt75nS
 gB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602921; x=1702207721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7k/TcV4Cokn5QDPYijyDf1OwkI3RiXghan4g2PqQJc=;
 b=Rh2JMpmpgJ9k+Y2SKWHFWs7fDLQZr/uKiMXp5LsePmRlSSCJvdV+0E4W+9PRkUD5wp
 kkIyuiZgF/L8bkJ/9vjH3jDeZeYXXxCIMo0Dp/M1W3ho4anZnDRfStG+51fIf2VTbbVi
 YX/w+IkJs2BEoK0B9yCe5C1LBq+pcA97LjjDqWMIt2Q/CmFqIyVz88ssmJXewwsgbltQ
 myXNilSf9+JrlfuarHAMwjcuLT3IwEmKRHiuaWGCDPtWZCso+UDgSBTnRHwD9R9ktckD
 z+Vx+QpYBBjr8xx660XA6WhCZ8rzQyJEa1w9HV3TNaUpL5zVRLL0NTuKVq8ibSl78L8u
 kvUQ==
X-Gm-Message-State: AOJu0YwFOH8dSN0ICILW/BrdqRx4BREvttbGz9AOLdr/pBZJuu39K/RA
 lxeBaT6d9+QtfxYtIRlCNJyGpg==
X-Google-Smtp-Source: AGHT+IGqFOCoj6Ejh31/xdT35ajIygeshLhzcKMzHS5YU2NmxWqCFUAgyHrCF7ifRWiANO1HUtNWBQ==
X-Received: by 2002:a2e:99d5:0:b0:2c9:e7ea:6d3b with SMTP id
 l21-20020a2e99d5000000b002c9e7ea6d3bmr1232579ljj.90.1701602921149; 
 Sun, 03 Dec 2023 03:28:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 03:28:40 -0800 (PST)
Message-ID: <ed17e7d1-c99d-45d9-a9ba-743ccc07961e@linaro.org>
Date: Sun, 3 Dec 2023 13:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/gem: Remove "valid" tracking
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-2-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This was a small optimization for pre-soft-pin userspace.  But mesa
> switched to soft-pin nearly 5yrs ago.  So lets drop the optimization
> and simplify the code.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem.h        |  2 --
>   drivers/gpu/drm/msm/msm_gem_submit.c | 44 +++++-----------------------
>   2 files changed, 8 insertions(+), 38 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

