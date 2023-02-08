Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A168F0D9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FE910E780;
	Wed,  8 Feb 2023 14:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49A210E78D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 14:30:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id lu11so51689822ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 06:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xv/iB69rY5MDb5hV5n9uwKuD5gimFsR45T01z2ZZ+d0=;
 b=fRjJOhiNjdNfSD6yqiiAmA+P6IXUOtpIvMuZNsZPOdJl4VideDYpQIcH7mRY3Pt7nk
 ESXoz1egOJvuv8e6ZdWiCFGN9GGZenSpnzsU2fMDeSLQiAd9kGW9oukeBQI/ofypfA8b
 XJlX3GnSlBN4KHxrCpUQ+ioyo7koc+XceoYo35pNQG1FQ5qZG5acAlcgbQcbXCZFnUb+
 dKTp07QKU7H9RqoRhhqd+/bKIVrrdCC/3DU4cJtYEq0mGZu8WOcI4Q3pEs4pLUt+r2qu
 QJQoLp64LFTUDMhShbRh0Dw3xj9D5fW5YQeBO183UpTZJydq4m7cUE3UK5vv2LMtB3lH
 P2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xv/iB69rY5MDb5hV5n9uwKuD5gimFsR45T01z2ZZ+d0=;
 b=CpdF9CQWkzmpRh9H6tVioH4PCTgw84EFwTbTvCQqr195eSXwID40Mg0WgU5mbK/FzZ
 fp/pmLRs1H5aJ4z1CoufiuX6/XPdVomym+C7oHHglAb+kR4jH3DPoWi/9sc6CBp+/8Pt
 GZctDizDqu4bpViLi+pi1uAZ+nclnxkI97OlT/7ZEDmyUwozAPS+uEq2y7FnR/S2mgye
 jb6fek/vKlj44uLh026DLGz4D8TOWB3368Uf87U5SYZiI4yGotqvAWWKJ230m4vdxIma
 Jovmiwoe4CBe0peadxqOaSh59FOKWPmwOUCqLn3IyZFSbIN7NK9r0fIpe9SMNjdJoHsa
 A5VQ==
X-Gm-Message-State: AO0yUKXHu0pDj2vYpmfYTTFBXq95CoC84+SJN6pTMbyq87vJBMr5khgG
 fDu+DmRR0il6x6jUTB6q0ZQZhQ==
X-Google-Smtp-Source: AK7set/x2EDXjkMHYEQ6OzaRfTTMLZbpxjwchkhKBdHZQ4ZwIulS4CtS3mq/FdWV0ffPIP835Uo65w==
X-Received: by 2002:a17:907:8d6:b0:8aa:1634:ba2a with SMTP id
 zu22-20020a17090708d600b008aa1634ba2amr5819792ejb.18.1675866651357; 
 Wed, 08 Feb 2023 06:30:51 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 lv3-20020a170906bc8300b00883410a786csm8258763ejb.207.2023.02.08.06.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:30:50 -0800 (PST)
Message-ID: <ead8db2f-71bd-1b64-c663-faa0ce3bcc3e@linaro.org>
Date: Wed, 8 Feb 2023 16:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: reserve the resources on topology
 change
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675863724-28412-5-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675863724-28412-5-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/02/2023 15:42, Kalyan Thota wrote:
> Some features like CTM can be enabled dynamically. Release
> and reserve the DPU resources whenever a topology change
> occurs such that required hw blocks are allocated appropriately.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
> Changes in v1:
> - Avoid mode_set call directly (Dmitry)
> 
> Changes in v2:
> - Minor nits (Dmitry)
> 
> Changes in v3:
> - avoid unnecessary modeset check call (Dmitry)
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 +++++++++++++++++++-----
>   2 files changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

