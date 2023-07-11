Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E0D74E266
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 02:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3710E0A4;
	Tue, 11 Jul 2023 00:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587EB10E0A4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 00:02:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso8079033e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689033764; x=1691625764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1w9yY+8SJhlthUMjNjEuOabsBHcswYGEE9IOl91tE7U=;
 b=iWg0XysXVpJWPAvKE7E/yUY6ad9SXRWwGl7JucDBPnXb/3/l8dm4P30HWKpBxrcm9R
 uAiHlrejTG688wUEICg3S+681TmPcO2Y2LoKpJSnUo5GvjPphvmESHjsXKGccJswJcn7
 Unw4+VQ6qhXeKBeTwoocyJiLEqzIED5X+By0cpVwLq4lfjtfhcd6e+N10ssGj73icPZQ
 MjSFv5VPAqUe2KYLL48z1cquEJ86Jh75WulC0KMf4itlLMMBVVrW4Ufn3GNxW76ptMnl
 5DyHDhZx4zAznYxnVfoQ4xdtGUEqDcLJL1Gw2OQrl2dG5XnB3qBtATg+HNQrV6CR+Tok
 3fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689033764; x=1691625764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1w9yY+8SJhlthUMjNjEuOabsBHcswYGEE9IOl91tE7U=;
 b=B7rygF5itXZFozpREWFdHnNdocCoxuqVmKUy4nnvrsXBN/eBStws21loUrzxlKdMsI
 nZd3mgFRcw54hEjvMF/ZnH/ucA2KcV+4Y17CfXCGj4OlGNkeYHTysF54Nkpwc9QcXQMZ
 DMKCriKCMRLA9zsx+O3TAVSOf/lILf2tjmbvkr9aKt6Gp/UlfRLf3Uqn+wFlvP3DkGqT
 bJZlZKb2ISru44PMNrY9e3bWNK/HDICGZCUUCeIVpFu+QYANnvXFrbcf6QPKbaBJyewb
 cuEuvEGOPib8LCk1v2DpmfPWVCMlAY25Uvj3m0jaD+omSJzM1egSUXB14cIUtqyV0iRr
 UYKA==
X-Gm-Message-State: ABy/qLbXF4itRHoB/KBvjAA2Z5aIRWusmRGIq/gajSHRNRc+Zp9zeV1+
 Q+narwJAV8TOOZApQPrkc6BruA==
X-Google-Smtp-Source: APBJJlF2aGhXsDEq8UI9+Fwzc8VwxH2xtVNNn2DRPsCOVB4FeKX3y1lpJ+okehUHP717ty1KSKJjLg==
X-Received: by 2002:a05:6512:693:b0:4f9:51b7:a19c with SMTP id
 t19-20020a056512069300b004f951b7a19cmr13092264lfe.19.1689033763612; 
 Mon, 10 Jul 2023 17:02:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a19ac4c000000b004f87893ce21sm91760lfc.3.2023.07.10.17.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 17:02:43 -0700 (PDT)
Message-ID: <1f991319-f276-1097-475a-7e95175cbf4f@linaro.org>
Date: Tue, 11 Jul 2023 03:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix misleading comment
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230630162043.79198-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230630162043.79198-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2023 19:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The range is actually len+1.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

