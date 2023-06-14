Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D2172F6DB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96B610E1C9;
	Wed, 14 Jun 2023 07:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3250D10E416
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:50:14 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so8407337e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686729013; x=1689321013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5YKbnziRubzVi6WVqVyFd6EQmt+JKI0ymRHuouDj6uo=;
 b=IdNjcAMDt98lGyTI5oa6MM1LG3BNT6elZKLC2j/7rkJWCZf/9n3Elo5ApgN3hsvvdL
 It/byY3ulSwVsawBHbtFzTDuBOx6UWeoDlre0+oXoEfKimdxTL0dNNo4WFoaYLgn4jIj
 pqUTI/oAGa4kEN/wSYAV0bRg0/wxAAxa/q1Q1/cAVF4vck9ViKZyLVrgwZjqZJkdiq1f
 8xtOroSsJ+UMT7w9mA0W602up6hE9ws/yskkXwCiGmxQdeslD2UpDoe4CsZjWUm3+5hE
 3qlsWEEb99Gc6mBBtwt3urOsWRedA8t+pZW2tXAjqE2YuWrRnodeM3uxfqIqNQBr+Z9b
 IOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686729013; x=1689321013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5YKbnziRubzVi6WVqVyFd6EQmt+JKI0ymRHuouDj6uo=;
 b=gO1lE1T40aHa/xVC88RBTfKPljfeqXO5wZvzSNEZsxd1DeWkOYffQ0JtjezsJKr0ST
 o2WMZ/VN9hcvTDHZBku4c0II7UepbG5ELO4ugzAoyp6WdDEbwZIkeYZ/7CVGNJK8RfWT
 WbgmvrtSr/wZAb1S7M8EEVk/PsuBiroQsg8iGLLVAIavDXXcPTBmaiLst6fP6Jzt2NYr
 eKgUnbPjAlniTMpPlJyfGXNTofKVoN5vdrYIUbPinza8KjJ0TTRgONrCOlJomOo2iEOQ
 nBGanfGXOFV2Y2duJtT5aHiFnpEXdiOdA8JXD7Td2Y0ZL4zIEkN/pJ12utcgh0NwoVVr
 fN2g==
X-Gm-Message-State: AC+VfDzMl5RZ9/4k7qM62vljvXP1l9isSuKocu56Uba1wUdFq4XVZ4at
 Rq1rQ8MLVCrarh5QVg5fDlDkPA==
X-Google-Smtp-Source: ACHHUZ62kZgdM7tNsdnhfQwqAqvqdDnBY+55awm3KAvrMDFVTGmNWTfyGfL/tK1ICdVnfmLheBEF1A==
X-Received: by 2002:a19:6d1c:0:b0:4ef:fb4b:eb2d with SMTP id
 i28-20020a196d1c000000b004effb4beb2dmr6572027lfc.33.1686729012630; 
 Wed, 14 Jun 2023 00:50:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ac2598f000000b004f138ecab11sm2047820lfn.24.2023.06.14.00.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:50:11 -0700 (PDT)
Message-ID: <d8f51ab1-b466-d6af-3e85-dac88c402d23@linaro.org>
Date: Wed, 14 Jun 2023 10:50:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag
 for DPU >= 5.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 04:57, Jessica Zhang wrote:
> DPU 5.x+ supports a databus widen mode that allows more data to be sent
> per pclk. Enable this feature flag on all relevant chipsets.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

