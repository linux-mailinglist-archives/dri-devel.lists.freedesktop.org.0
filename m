Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8B7BB677
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D29110E1EA;
	Fri,  6 Oct 2023 11:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158E10E1EA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:31:50 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so24328361fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696591909; x=1697196709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
 b=qwcmelSFydiMcNQjtE0N5F5b/2sRPCjWCLnLrRpKxUK1u1UKZv+bqiqYORlFdeLGC2
 3a1ZB0t/wCOTq1oOYon3pguezG+QqKeDtV3X0hGAs4pLfsBAWw7zAQPj5dAosd0D5+pV
 Owdj5wgTiVU7nJQ4gIIovDhkmNqJ41siU148kPSInaJ9bDGwx4yb/TSqhizFMUA8oJiY
 OZAorK7OMnn0xHxgKjYPcQ/HDWLttDqhuSKzgqoX5Gl6kE7p+89Ea7Yqp21eBMZ8QDk+
 DpfV1HOkafCqZUwnvYWZCJFH13FwHeyTgNqOLnfVLLxNNLdTR1b2tOokRrvRIwgvT6Sl
 +BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696591909; x=1697196709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
 b=XPRthE2Yd4mHz7pphGHFhHOL2EQ19HgY/K/wbRNLfQ8YXmzva1J6iUzm665Z9T+Pcg
 khdUgjOmJpb73txPU9TIsSa3DCTorahlbdTz8SnG2Ug0cUhBcYFe+GHIx14hAPc96skW
 4t1vpEkhQoeE12Pg7/0R9Kay3aRbnEEFZO9jLNaATCA08Zj5lTkJFCngOkffczdwXSs1
 SAIRwWjZW63sD32+NDX12dMtlzHJkaaMtktnyVVAAJWhsnPdyPUWpGBG0pdpeZgYwxxi
 xjZsMBA/HwsIAanJWuGUhsHD3c/RjsmNdncm36RVBHqDgKmB5CYnSOYEKF71CB7cZymr
 NhHQ==
X-Gm-Message-State: AOJu0YxaPNIP/2W07LwVCME0Ca36u7KtT73u2gd/+GLyDL012O9KCR5k
 UtwzgPGeFj2WqXVBbNgJDi447g==
X-Google-Smtp-Source: AGHT+IEgFCEHn504tuKBVWYl0xhU1uiPtRBx27WqGJbL9nyuJRS1cbMMw8HuP1zpHgEZaEYk0xzkcg==
X-Received: by 2002:a2e:8256:0:b0:2b6:e958:5700 with SMTP id
 j22-20020a2e8256000000b002b6e9585700mr6751826ljh.4.1696591909007; 
 Fri, 06 Oct 2023 04:31:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a2e9946000000b002bce3123639sm743777ljj.98.2023.10.06.04.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:31:48 -0700 (PDT)
Message-ID: <dce265a6-12af-4374-a156-7bceffd5e2ea@linaro.org>
Date: Fri, 6 Oct 2023 14:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] drm/msm/dp: rename is_connected with link_ready
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2023 19:26, Kuogee Hsieh wrote:
> The is_connected flag is set to true after DP mainlink successfully
> finishes link training to enter into ST_MAINLINK_READY state rather
> than being set after the DP dongle is connected. Rename the
> is_connected flag with link_ready flag to match the state of DP
> driver's state machine.
> 
> Changes in v5:
> -- reworded commit text according to review comments from change #4
> 
> Changes in v4:
> -- reworded commit text
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
>   3 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

