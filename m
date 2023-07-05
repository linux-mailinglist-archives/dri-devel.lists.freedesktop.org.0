Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA92F748E9B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 22:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A010E3B5;
	Wed,  5 Jul 2023 20:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464B610E3B5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 20:11:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso11194892e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688587913; x=1691179913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
 b=YXGZIJZ6nachVEuQzc/IZNo9zEXiYi+3qek3qmciqPadXYSqe6tdM6yFyIkxS4finp
 yToukamMSrKbSnNMEAQNsCT6gDDTZCMCzzSKsFMv94vgr3Cyfn8k1Nf3PpjfJFCsEFvz
 8gDs0uKyi6Y2zhJogLFuuIQUsq/0k2Hf5F4zCl0XMnA8cgXNwZCpSja16LGLXCkyohjv
 GCadnX8Ipim7DjQ1rh6aC/TfpA645DjlTEU+Lg61ilNuklhe9l+SF29RMvGTjlqVevou
 iSCHZ+2vLEWgEW+OhOG0maqMfG+e/eNVQCQb2v2K54ii/WmYrHKEaNZj8SlWyOcZfFLk
 mX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688587913; x=1691179913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
 b=lyYMPM0GKSeJwAsGVIn3vzc5FG0kaFXfgY5oj8wCko6vk+r1iW9DbKzQRDI5klTS1T
 ohQZDK+D4tMwgNer3Y7w9MqDdG43eehi7d5GDur8TWaRTSeWnAAH7FE9BecPDiBuhRCp
 dW6NpBjMw+lJaZOYx4GErvMuNwgjtUNcLwsgquTrVnCtfJRuFrwBFKbroJogaC+LiO8+
 xtSVqCEduSjgdsneIfL6PsdPW4U0Aj2KcKzGPbABtH4f0NoguMr0i55mRGdoT+KDlCY1
 wPvv8R4adWV5rL6MbNjI+t4HRcia//lpsdzOwMQIZ4d/FIRsitfEwhcHwdymAApsfAEI
 cKWA==
X-Gm-Message-State: ABy/qLbtHNatu+bNJVeuW6t3GvpJuUSLw9foIw75Q9KdoBKeA1QS5R+f
 HvEj4nTP/g9WWqRM4iZ/Kbn7DA==
X-Google-Smtp-Source: APBJJlGOWtuaZF1gcaIcgphg/Ji6Uk1NoTGrqR5CoDcm174dMUUXiOcCMmFdYb2CR95t/vfYN5Mdew==
X-Received: by 2002:ac2:4bd4:0:b0:4fb:99f7:da35 with SMTP id
 o20-20020ac24bd4000000b004fb99f7da35mr65182lfq.15.1688587912764; 
 Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a19f70e000000b004fa35167729sm5488873lfe.159.2023.07.05.13.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Message-ID: <26c7e593-7635-e96c-c21f-5fd2e5285281@linaro.org>
Date: Wed, 5 Jul 2023 23:11:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: Remove redundant prefix/suffix in
 name of sub-blocks
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
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

On 05/07/2023 22:30, Ryan McCann wrote:
> For a device core dump, the registers of sub-blocks are printed under a
> title formatted as <mainBlkName_sblkName>. For example, the csc sub-block
> for an SSPP main block "sspp_0" would be printed "sspp_0_sspp_csc0". The
> title is clearly redundant due to the duplicate "sspp" and "0" that exist
> in both the mainBlkName and sblkName. To eliminate this redundancy, remove
> the secondary "sspp" and "0" that exist in the sub-block name by
> elimanting the "sspp_" prefix and the concatenation of "num" that results
> in the redundant "0" suffix. Remove num parameter altogether from relevant
> macros as a consequence of it no longer being used.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++-------------
>   1 file changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

