Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BD6E85BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803B10E221;
	Wed, 19 Apr 2023 23:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8574510E221
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 23:15:07 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8bdcf87f4so1372551fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681946105; x=1684538105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8YZ6tzDhBHoxqn9D7YfaUk4sImwK4WUPTagbGMWR7JY=;
 b=u6gmlUMkLm1+0ml06EFobhtQeztdP4pBSEKIWMHppFiUrtS6VBuSy9UMKHFXBUqRRA
 37QWmxbh2Ze7KJolHfky0xbMgf+/LQBCASFqOonSslugWvOICjLOYNTXpbziWDX57OeQ
 mPT/wD6i/W5YqvMh0c38AGQ47Wx3w28LxEUi1cj0o830LfW/OSIkpWxEjZoA48axMsVk
 vybQHuC+9TU8nF48+tFmh7kQlvtRFxI4Z4wfiuKU95lMGuZfrbc/sp22j2B6PPXCbVK0
 v8iSk1IOXgg9mz5R8Mc6CKCh3UZ2YX+HtTFdLX4QSQseEJvVBOn3rOTSPMhgXBJX4yFN
 6flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946105; x=1684538105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8YZ6tzDhBHoxqn9D7YfaUk4sImwK4WUPTagbGMWR7JY=;
 b=CerhuySsUtGtWgvR64OWFnrEXPYrTTs9wrbvBvozgdpthRsdGUm0HuNrAbPN2KrfpF
 p3w+pUbwrScqs7fvWVkk/rjWddiurSRuyUptjo1gOz11LzlycBypyLdQ/UlKyOtMKOX+
 Y33F//k7mHQqvg4agQHMKzj2MveMNx6+G5R5BomuyB3o5csOAivLANmaE25i6EYquJCU
 WJBSR1PgtTX9GpNl6bSEwwxkd4DcaACkRKbyRk8vsZfkMinBvNzs1pMfbrsJgnmcD6Vg
 otAo0OJFZpFUPt3CF0SprF+MeZwCv+6HZkw5abdbEI4YZf3Xc7N3rrUsn96emwcoFqkz
 Ou6g==
X-Gm-Message-State: AAQBX9fou1JtLS2Tc06rOvnzey+2T66c7qQhhr/wzXewTfraXyAfgIKw
 3zZV2XKNgWmptvQyzWpTiQF0gQ==
X-Google-Smtp-Source: AKy350a003Xu5N/bKavKb0DBJWKDAKeS8K5taKhyLqOwxeqco69VHxlF/BnliKq4FwNQnA5bIVsoBg==
X-Received: by 2002:ac2:4acb:0:b0:4ec:363a:5f17 with SMTP id
 m11-20020ac24acb000000b004ec363a5f17mr4233644lfp.21.1681946105653; 
 Wed, 19 Apr 2023 16:15:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t14-20020ac2548e000000b004cb14fa604csm33888lfk.262.2023.04.19.16.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:15:05 -0700 (PDT)
Message-ID: <9fccde38-273d-faec-7a5f-b521d4daf559@linaro.org>
Date: Thu, 20 Apr 2023 02:15:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/11] drm/msm/dpu: tweak lm pairings in msm8998 hw catalog
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-10-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-10-d1bac46db075@freebox.fr>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> Change lm blocks pairs so that lm blocks with the same features are
> paired together:
> 
> LM_0 and LM_1 with PP and DSPP
> LM_2 and LM_5 with PP
> LM_3 and LM_4
> 
> This matches the sdm845 configuration and allows using pp or dspp when 2
> lm blocks are needed in the topology. In the previous config the
> reservation code could never find an lm pair without a matching feature
> set.

And this matches the hardcoded configuration in msm-4.4

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)


-- 
With best wishes
Dmitry

