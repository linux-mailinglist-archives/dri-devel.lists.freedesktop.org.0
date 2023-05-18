Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9817076FD
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 02:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62110E4BF;
	Thu, 18 May 2023 00:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BFD10E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 00:37:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so1785961e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 17:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684370262; x=1686962262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=po7UNoPfe5zteMAenfCEsCJy5ibuGbWHVGywTb2tWkE=;
 b=JsER1UtwtZcLVOBrVZY2jQdJ6RDCMYqgf7tSnsP4SAJd/1/z69VeZd4mYo3x1KmI+J
 gDVrZiB5k1bx/CgDmj/7SgBRddch0R0ON77aOgYINB/p//y2iKxhXS/GrDAJJmLLouWe
 xv0UTLP9iZXl5KHrNH+J58Pabcpi9nCwtmSZRVq28xyZGoGLNSvQhBb3M+lmoCj45r9i
 OajfAzakhTIvIXRBx9aWnSjrzVWCcB89yQYzZv3hS8umzmbMadetsV27PBC+9NHCOly9
 zLnrC/szTlctXjIVGycpiVZ5vTvBR7znRf1UeSOGaznsvu5ZRoDAEGSm1ocyXCSOlbS7
 QiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684370262; x=1686962262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=po7UNoPfe5zteMAenfCEsCJy5ibuGbWHVGywTb2tWkE=;
 b=hblKuC2kXinZ8q/Z/uAxw+A1yiixxQ8f5w8p3VtIqm3S0GF6oUjFbwA1NXl4mzj+nD
 Q7USU1x46iYtND4BJ/++qH4JTjjORHgkPyE0DYYJoePx6E+lJX0Fw5+LNgPQ3FDVHj4+
 iaeeZWkY3l0F4vRz7Hi4QRMMDEcJ4GzC6kjX96teyGjgm5avTmAHJFEC2imkyd/tB63+
 08MQu1BvGNFmQyY5ZP58drFY2TylDz6jeg8LwnrURUv44ia9tL3qe4y8LkqBwhfDCb6y
 U2M2db4hxFuNCu4Z1BvveWW4LhxCJpVBvHaBB+v4kuFvkozbC0P/cVemTdF78rSgMVKr
 vyoA==
X-Gm-Message-State: AC+VfDxO4CPhn1Vei20qJtDQk/cR43Vnb6SEtl4lSs3NCeCq7tpa5ASs
 9BUmm7v0wReFoQVKRWFKVS3+HQ==
X-Google-Smtp-Source: ACHHUZ7uCv+ZI0mUztrk0hmK8n583XK43anSsX1bmIA6B2ZFDMBr3a/me0F+fkS4vq01B5IcoaTnUg==
X-Received: by 2002:ac2:550f:0:b0:4f3:8244:95e2 with SMTP id
 j15-20020ac2550f000000b004f3824495e2mr713166lfk.50.1684370262289; 
 Wed, 17 May 2023 17:37:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a2e994c000000b002ad8bccceb2sm6427ljj.57.2023.05.17.17.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 17:37:41 -0700 (PDT)
Message-ID: <769abc86-43c9-1f92-e484-108b8b561486@linaro.org>
Date: Thu, 18 May 2023 03:37:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/05/2023 01:27, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

