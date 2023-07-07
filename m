Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9E74A8F9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB6E10E4F9;
	Fri,  7 Jul 2023 02:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B3010E4F4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:25:29 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f96d680399so1936779e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 19:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696727; x=1691288727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
 b=v7tltTCVK4aWVGf5DUADwQglsWdehyx+QdctZeJPwg/pGcgJ9gMgKSZ24K88RPCWlG
 HTXfU6OFeiPzK504CKJjgZsYMfn4q5EyNSG9Ga5LUQvi0mw32J232eCcVd9Od2JVmQ75
 kgD3o8Wc0bL/hRIZaGlFXWBcWIsrJjJDqw9pFWddH2qzwL7kD4Zvxp7qzi8MBbk3knPc
 +2KwzQyNJ4MS+gKKHW7r0lOYl2DaoVPmLSWvP6IfNm59k96cy1DX7BVDD3Owcye9/VMk
 0v6VX+M1vTl29Zp9HW2i6mACPkQI7Ke4d8bjB765EITWISANnR5PbSiKVW4Me2CSPgeC
 41bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696727; x=1691288727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jHgEyu9CZyBrBeG2GC7gQptgx9XjV9u5c1TeFBnacRs=;
 b=GpCwACk8+6umm7I3sA45VvRkP6Qj9Mi78mk+47Hj2yeVpLnHrrgv8JmAg33cdVK15B
 g1D6dWfLpgWg47s5e6zUbXbrOzsltqNGcDLpU13HczE0Agb7rB51ajtJvTTRZ28G22gJ
 3FppST9YazYOo1PrUEhxJ8a9rbR9i53sFr/93DtxZzplVrDl08FUgO7mIHAfs1tgiCbb
 T/LcTsLlwhNzV7SHHDsfdE0CFdEV9CF4oyY3SAiIqDqHy2aAsy3NdNHDW+uHWwC4sl/t
 hJ1eCZ/tWJLSdJMaLmlGxROr8nSQISFFvPxSzhRQZd7z1mUEvIKu782L+rdCMwV9nqxQ
 ym4Q==
X-Gm-Message-State: ABy/qLblH3wrFY1vW4vNTFKmrxR0vOcqaFAQhazI1SI56PcjDxlsnLg8
 g6/jMAu6DX+7G27QzzT33/wabQ==
X-Google-Smtp-Source: APBJJlEBoEABsxONYJYKKzFMkqLmnqPTwQwBLF1OFSqAvXDp7dRrDXKVKdY2GO8FBJaH9KGS0HNvhg==
X-Received: by 2002:ac2:4894:0:b0:4fb:242:6dfa with SMTP id
 x20-20020ac24894000000b004fb02426dfamr3117808lfc.57.1688696727097; 
 Thu, 06 Jul 2023 19:25:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 er14-20020a05651248ce00b004facdf96283sm479843lfb.254.2023.07.06.19.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:25:26 -0700 (PDT)
Message-ID: <ac5a38c7-3d2f-1c16-2f74-c12683cd720c@linaro.org>
Date: Fri, 7 Jul 2023 05:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 04/12] drm/msm/adreno: Use quirk identify
 hw_apriv
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-5-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Rather than just open coding a list of gpu-id matches.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

