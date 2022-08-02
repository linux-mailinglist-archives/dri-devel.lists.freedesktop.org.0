Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8CD587732
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 08:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09F10E495;
	Tue,  2 Aug 2022 06:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057D10E17F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 06:44:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a9so7783620lfm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
 b=zRsdTe2s2ok+tSA85hlsvI3Tp6wFqiwLQLGt0x5DWPDzHm3bXY1/ITRMp6N3Jo+x7p
 4pKD7OIvDedM5gi0YEQ4Z4v1ftVyjzsl1wFe4zma6Pv7sNCLToGtd08gqYlI39sN8fRW
 KGTHJ0N71mA6p05A4zRR3+2FK7Kb5EhYSz14PVS0G3m/XUv7I1zeRs2w3kdiZBMNeUPG
 tIuDT4HQ3L5BPCoqRAzEQjHb3xwZhw6DpC3aqUsjyyg864A1PpQQK/Z1VZV9gJ38kDfg
 z2OUYd22s9uATlIViBwdaZvCRIfF/YEcGqUdrh+pv9Pz/BsqaazOGmGEF24DHdlLpt3r
 pPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
 b=Qq4+O+YvLStF/B6U99sMMgdL0jXEWdpJQbnpybitxnlZ9c9Z7LWNBFcV+r5P9xogxe
 rB9sOPbINWITPw1juTm+SYa03Q2IgKNL0hiaBv9Inlvj5ppWtkOFv8XazVP5Fmfh1pxD
 BYWRotpF7HEjqfaYo72WBMthn/OBGDl1yysR9pTLnOJsyfFzR47On8aan3h5qyEHW1Ue
 +JltuGkB3vZ5xmCbg773JNX7W0SgdlAZv4wQSqrLVk79fNjahGOuRS3qwGCREX1rBfNg
 o0is7q/1QC7+sK9e58sn5c2cWATRdQC65AAnrXSHUcwS6bHBWQHkQzBJkbvLP8M0ooI6
 3TPA==
X-Gm-Message-State: AJIora+vKi1zvsT0RS6D1JvVphNn4Tnnw8+Fmlc3+BrhgYBKv4R2Haql
 M86kzUDWExsVGeczjdf9XFj8cxJSxcZorQ==
X-Google-Smtp-Source: AGRyM1tb/aedcmiebbe1NUyI4UkGBdIxQqcLT2KKnD0mSMr6dbKmSZ1Ja9uT9FYb+wh62/LMA5bbWA==
X-Received: by 2002:a05:6512:3f1e:b0:48a:74cb:1409 with SMTP id
 y30-20020a0565123f1e00b0048a74cb1409mr6807833lfa.546.1659422640532; 
 Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05651c032e00b0025d5eb5dde7sm704460ljp.104.2022.08.01.23.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Message-ID: <1948d519-9ec0-e874-d51a-6d9f2f5ca3f6@linaro.org>
Date: Tue, 2 Aug 2022 09:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/gpu: Drop qos request if
 devm_devfreq_add_device() fails
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2022 19:26, Bjorn Andersson wrote:
> In the event that devm_devfreq_add_device() fails the device's qos freq
> list is left referencing df->idle_freq and df->boost_freq. Attempting to
> initialize devfreq again after a probe deferral will then cause invalid
> memory accesses in dev_pm_qos_add_request().
> 
> Fix this by dropping the requests in the error path.
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
>   1 file changed, 2 insertions(+)


-- 
With best wishes
Dmitry
