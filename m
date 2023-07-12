Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647E74FC3D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299410E46D;
	Wed, 12 Jul 2023 00:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE90010E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 00:37:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so9904035e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689122250; x=1691714250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UIi82mIav50rgl7/i1S6zJ35MB2YBgS4vD10tupyiIM=;
 b=PMX60v9Wj4yVzlU7csKWO8NovlgC1PmkVLLiEJVDHC6MSuQz9p2Y+P2trZTa2umiEe
 44r3S9irSJmOOxPFL3XPujI6CP/1adARtpT2FcKr2hmP7l0+hS8BPxHNeRvA2ZW5tPRt
 27u6LPMN5CGsBVKslfhCvtK3SBgrE+qLQ8Qvrb+9VSSSaV7ZAxjoRAblWPmCn0EWet8f
 q5TpqOB4ZLkgRwDnIoLMFVhv8Wt3pf96B03wbPspp8ZA+WJ148cYG/jqrB6vqjREOmIT
 /hJcWhK0MyVg8/DgeZs5JVKRIkna2aqyazlKDk3Bbrwc3D7VD8lhHfbnan1OqlDKlQOc
 ZIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689122250; x=1691714250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIi82mIav50rgl7/i1S6zJ35MB2YBgS4vD10tupyiIM=;
 b=g3bks4Z5cbPpETeGRTVkHmh47LgwYqca0TIimuO5RIwOeWYTmXujDdahWesHltgxPu
 DqCEsKTJSFRitxhzpnuRuZ40kd+hylkYXVtWOlw37Lu1ZUEyvp7Ya2DgtHW+rmefDMiE
 wXGNqbKaSIibeM0F8SOiaol7W8gaQN/prS0Ct/6/u+wBjKqtq0S1ciO00x4J/ebY+bNP
 6BF/7LIz1HO8XxLf+4rwZW4yt7C+RcCcWWnxn6YYxre5PIwF2X+NYNunxr31GuDrI4MI
 PZaLGYBynI4rTv/DrFRTABjYq9KrdsSqQcmYpMH+Bor1hCNV7dYqd4ptUFSHikk4fk1p
 2FNw==
X-Gm-Message-State: ABy/qLaMX6sQ7oncOLkD2pD8BJ1rgY1dvG0m2jraS8y2Ws/wrPGf9EDo
 xjdVu7Tf9Ds5se3bavvZlD+DOA==
X-Google-Smtp-Source: APBJJlEgWEjBB8bRx3duY8GLWpLQF01AT/VJrYDS8XXh/El3fsC1J5wasiOi4vDZFsCPOWL7gYdRgQ==
X-Received: by 2002:a05:6512:b8c:b0:4f9:556b:93c2 with SMTP id
 b12-20020a0565120b8c00b004f9556b93c2mr17499239lfv.1.1689122250780; 
 Tue, 11 Jul 2023 17:37:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05651211c400b004fb743b3ea0sm496552lfr.115.2023.07.11.17.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 17:37:30 -0700 (PDT)
Message-ID: <7fecc1b5-0c06-fae2-bced-990006c02fcc@linaro.org>
Date: Wed, 12 Jul 2023 03:37:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: use dpu core's major version to
 enable data compress
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
 <20230712003310.31961-3-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712003310.31961-3-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 03:33, Abhinav Kumar wrote:
> Instead of using a feature bit to decide whether to enable data
> compress or not for DSC use-cases, use dpu core's major version
> instead by assigning the enable_compression op based on the
> dpu core's major version.
> 
> To make this possible pass the struct dpu_mdss_version to
> dpu_hw_intf_init().
> 
> This will avoid defining feature bits for every bit level details of
> registers.
> 
> changes in v4:
> 	- split renaming of enable_compression into another change
> 	- pass struct dpu_mdss_version to dpu_hw_intf_init() to
> 	  assign the enable_compression op based on dpu's core revision
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 2 +-
>   3 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

