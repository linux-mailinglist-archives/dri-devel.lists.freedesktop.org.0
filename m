Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A374BB30
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DEE10E1A2;
	Sat,  8 Jul 2023 01:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409B110E053
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:54:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b703d7ed3aso41190141fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688781289; x=1691373289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=npaEU4Jq+DAwfVt4RBA7ILDlsHaYzhtoNC6VoI1b+k0=;
 b=gPZfaN7wS1UvnJsefZI2XiL3Q1PD5is58lGYunpUxNdO8PPo4qWpmUh/eC4+JWtb9S
 ih0YWQ10owKrZ25fsuouXL1f/P0wuFOLQvd2UuWt8zbKb2ZjSCoi9NM7QY3rOqt3kJl/
 cvQveiw9Mq1lVSrYvYYq0DnDclWNRoa16g48QanJvN4fWzttvpr5kqGdyiUTCLba70uH
 ANznAzqveAcvo9xRQDd9VtlcQphPGkXoofB3pgNU60oP0jeRSq76PDUiFd8AubuDCE1+
 dnRf4EvB9YuwvGUI8t70eiW54Sia4PKsDjbIxivVKgrPgjPclvJuMCfn9K5fC+lsbK6r
 oITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688781289; x=1691373289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npaEU4Jq+DAwfVt4RBA7ILDlsHaYzhtoNC6VoI1b+k0=;
 b=LnruwxN8vei2vkZZC15GpEAUKMNnY8XhVzXzFQn5L5zqSTLJo3MWHqEGxNiqeIwtgF
 fRvj0hm0oS1mcRVbZidZZVrveLU74vNcKt296ga/6b+mm1gYpuuh5wFgo62GrEv9hJX3
 oxlwRCVlMQH9On5URB39QRn5hqzLwXL2jyNNNf0JzGuLoR+RudRGzj9OzcM4hsDBwUcu
 7/kuz6kQjEJyEm8uMODhKJ/yOEeH8d/9lhWjsb+q/j/pkbm8rPr4ARTTLtprp87ox7tv
 TptIbO31s9QQj2lPQ4GqVA7RIpzFueCMWWZBgabUds0hl58v8+b9q0kE5HJn+RjP26/X
 lnIg==
X-Gm-Message-State: ABy/qLYyrCz9wqVcHVcBbiil/Wma15dw3lYk8IXPTVGmxk4b0AOT6hkA
 S0RElCOxtuhrmD2uTaePvFMVkg==
X-Google-Smtp-Source: APBJJlEqEgf+d4ZF9yehdGdjs2x11q0lZlUuW2aPMwV2iNCRMA3/PB8q3uekMYLKJLMYtpFnAXGJRA==
X-Received: by 2002:a2e:8e96:0:b0:2b6:e13f:cfd7 with SMTP id
 z22-20020a2e8e96000000b002b6e13fcfd7mr1075227ljk.4.1688781289298; 
 Fri, 07 Jul 2023 18:54:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a2e97cf000000b002b6e13fcedcsm1011031ljj.122.2023.07.07.18.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 18:54:48 -0700 (PDT)
Message-ID: <c6347aed-4beb-078a-2d42-bf2ad335f45e@linaro.org>
Date: Sat, 8 Jul 2023 04:54:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
 <20230622-devcoredump_patch-v5-5-67e8b66c4723@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v5-5-67e8b66c4723@quicinc.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 04:24, Ryan McCann wrote:
> Currently, the names of main blocks are hardcoded into the
> msm_disp_snapshot_add_block function rather than using the name that
> already exists in the catalog. Change this to take the name directly from
> the catalog instead of hardcoding it.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

