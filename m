Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9731780AB8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 13:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691410E4F6;
	Fri, 18 Aug 2023 11:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488F910E4F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 11:04:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9cd6a554cso10627851fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692356657; x=1692961457;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
 b=dwO+bth3b1+Nk8+6IivmbRPVP+KaMT1vBw0O3sLeIv7oR1pX0WJcOdPdj1dSu7wdXM
 ito/Mu50T2ls1VMQ2qlTuEWDdRDwxKECxeBHFEpzCo3Gt1ixycbD6DkEGXvn2BRjNflU
 o+m0tIp5/bVK+nA8vQofigeJ4ucMCEpPAibF1m3ptFKWj9pxmA59hYkUiwQ4+qA2X7FC
 i8VgvRCcwzwp+LI/bQ1RXZfrMPooMSQdQDnkGY/TY0cFCffSuVh7Gc1Ps4WizpGS0Eo0
 J/MaL/+Q7GnnQM39Z1g7xRRtm6YAo8MFXFBRvQ+1UukcRI/xD0Ks9SiremxNaiw8MAAr
 H6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692356657; x=1692961457;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
 b=aaLYro2bzyIqcbZ9kn35DQV5zbCCHfTd3Hqfic4u1qChzArnl04eoaWfE/18EfDBKq
 JsbU4iKhagz9giSdixATnKPZqL9LbcEyJPg50UZHhu0UDHni1QIUMmXF/Bnc6/yF0cwo
 Qea+jkYa0jxmHkh33xClpEXnT6TW4i2AtduuboGkBycFIlLYnwJGuVyO0R2QA4xzxjqK
 uz1mDUnflbSka3AgNZ853aQSR8dvABg7sVfgwyz6KfmNUF1hAJ2eYqxyvNbnLkAGx0Wv
 GIOtMUPt44zSa9hZ1JVM8tHbB90McOLpNzgKnT4Und6bWU/OKWwZul9WAL3iKwvi+0eA
 YwOg==
X-Gm-Message-State: AOJu0YwkOmzsxtWt6SXvn/L6FhbaLIzSETP4ocUv62DGvsgkJV6KnkPI
 LTTnel/YlhoOT7Ab0dUwX4SW9A==
X-Google-Smtp-Source: AGHT+IEwp06ZxicpGI+vVruEAtpln6CTuqu8D1mDmasY+MnhAF9dVfEJTUjv9IOpM7Vu0vEXSAFF5Q==
X-Received: by 2002:a2e:b791:0:b0:2b7:3b6c:a5e4 with SMTP id
 n17-20020a2eb791000000b002b73b6ca5e4mr1525911ljo.38.1692356657511; 
 Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a2e9d47000000b002b9899d0f0bsm363898ljj.83.2023.08.18.04.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Message-ID: <c667d98d-c8fc-4c28-982d-67dec00570e4@linaro.org>
Date: Fri, 18 Aug 2023 14:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/msm/adreno: adreno_gpu: Switch to
 memdup_user_nul() helper
Content-Language: en-GB
To: Ruan Jinjie <ruanjinjie@huawei.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230810120424.2108348-1-ruanjinjie@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230810120424.2108348-1-ruanjinjie@huawei.com>
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

On 10/08/2023 15:04, Ruan Jinjie wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

