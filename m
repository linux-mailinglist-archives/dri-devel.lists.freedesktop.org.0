Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E76E8692
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997910E57A;
	Thu, 20 Apr 2023 00:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C837410E57A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:32:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4eca19c3430so222332e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950722; x=1684542722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Nd7HhhsmQrigh61dvTiVokWTk2+5/4WKyz3jRZXbJ4=;
 b=a+40sUdKRlsWqlp51b0RhAxzrbuNll8UIcDmVP8tAIkAfLGz+KtdREVLHC01Jd4UUL
 l/kqTYkR2KkldC8plqDQsctlU1Xg2Lfvyl56q4I/SBWMyXJAq+ubGmzwHIC93BoNMNiF
 OBRtfwuVpCJbELT9UnzNwSpcrUv4lYol3z+3Z89d1pW66lmpO3K9ihBYxcgr8qU6rL7R
 Wc5UCnoCrOiWMUrXngDGaxcJ03FoKaUfHK7Cv6D0or17FhYaQWIBOKAKGeuSbKkBdDw0
 IxtnhP6CSYR7QehJB9NqRlZw3m60HVNlu5+YW0dGmynBRCzsORI+iOc3d4U+DZF2YHBM
 yDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950722; x=1684542722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Nd7HhhsmQrigh61dvTiVokWTk2+5/4WKyz3jRZXbJ4=;
 b=M1DfyT/escvgnY8MzgLPAnGGiM+Z+hVgymSMVXQOunc89UZEbvs+RDzY4P64h+qp8p
 b1cQLkdQxqAR1K9GrFuJFlOXBtWBLhEZ04mHGdYj/V8DIZGV5aRm/jIqe0eVI1bU2rbT
 r6xo+lWTrGXyW+iRCCHmxFtwGae1YuliGt1VgUn3V1crff+byXFhWtZLWzPzDhvMP5XC
 MLev0X2zkENWtGf0cZzXRxkRa1Vzc8Ddv+OtUKCh3RPvxQ7YF36VS0Tr9gWp13MgOL2E
 INnX0TZJZE4+zPebKbB7YSSXYq4zPxB93GCCiem/7ku4MWk63YrQg+77CQvYhTjecab/
 k+Sg==
X-Gm-Message-State: AAQBX9fbmLBYCskKfvmKYSYXCXKfAigWBdKPfVicmUMWq0KdZLoSLG7d
 fwSsj7goX+tk2FAIprX4KmogtA==
X-Google-Smtp-Source: AKy350YbBBV05nPshdqlgV2P6Dq/C9Pi9ijk/pMzjguyytXcyvtxrmAbivOyAiwCtHn5hF2Oibff4g==
X-Received: by 2002:ac2:4423:0:b0:4ed:d250:1604 with SMTP id
 w3-20020ac24423000000b004edd2501604mr2651356lfl.57.1681950722649; 
 Wed, 19 Apr 2023 17:32:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a19ee0c000000b004edd3f011cfsm55550lfb.43.2023.04.19.17.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:32:02 -0700 (PDT)
Message-ID: <d4e25a0f-3bb4-6803-ac7f-eb19083cb04a@linaro.org>
Date: Thu, 20 Apr 2023 03:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/5] drm/msm/mdss: Rename path references to mdp_path
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-3-91a66d04898e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-3-91a66d04898e@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 15:10, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as

Nit: msm_mdss.c is not DPU1.

> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

