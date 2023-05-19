Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84017099B2
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 16:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706D810E45F;
	Fri, 19 May 2023 14:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE310E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:29:06 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso3681718e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684506544; x=1687098544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXSWp9UT1nFmnhqm3B5R8YXXasDWmGa7xqzY3bdTr7A=;
 b=kwgATlkhkJ4dpLP5u471YE6mmR19bPExUHdjGal9FiBa7R6o+oSZL+4RnDlhNr6rG+
 ZBg+fTcrx53sT/mK7GMwZTZP/Np9fiqVxc4O0FfRFGTitrNigCpLb9LPZnTgUBvJPR/S
 MctcdvBpb9KpbHMWDu8XyEHKPtTur3zxrte8OohbJH7O/giAGZixo7Hd+p7LhLAdQ+3c
 uHt51bdM/EEISau7rcH0k2u+BDlx0Mvsjsfd5KnOLrX2xNVaOnRAqhk7FW0m1ywKn3Hk
 /eKpXOsMkVNKTjzqZi3B5wGXQDep9OvqyEnUEvmiT/Ku0mOws+C0JixM6wDb1WCJmjuF
 +szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684506544; x=1687098544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXSWp9UT1nFmnhqm3B5R8YXXasDWmGa7xqzY3bdTr7A=;
 b=hUTypR555Fu0DuwNKtijTuV8Kw0PMb1cWb9Mw9SNBTuJ0t+inhbVSIiTQtQTadan4Y
 nuY9PWW4DOMlnXYwSEicGvlxrOahf3Na75CCSOJTnB/RXjhOklGqlhZcIruOoJncaQW4
 8QOp7/lH7iUVa0H3McRoNwYAaRgJn18f6mG8x/L5joWPbkGD/byV9+2r2jI6Hrr7NhUE
 JAheAkFDVXoKNmYZdff0Xjwc2uc85SgAaU2mUPoUlE6OOug4yDMUVzZ4o1AWEQdriuyD
 XpYpoNm24Ud9RwXR/2hV9Z6tn8uw+NM5pQjAX19ZR/lNDHNbebtG1TmpS4IYOH0I292+
 +gBA==
X-Gm-Message-State: AC+VfDw0/pEt6BXB6PYu3/AQ9M0l1HMvaPItsNBMHW4jxKX1rfSni3de
 2nYt0XglLsNR5PIUZ2/UFwrrgA==
X-Google-Smtp-Source: ACHHUZ6w05g//15CVJcp2ZhyzGhk5MPjyJqW3b/KEHwqEqs+F7QYpnESM/ah/J7f/bBWLjs6GgWeTQ==
X-Received: by 2002:a05:6512:945:b0:4e9:74a8:134c with SMTP id
 u5-20020a056512094500b004e974a8134cmr763720lft.43.1684506544001; 
 Fri, 19 May 2023 07:29:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25ec6000000b004f14ecc03f1sm609354lfq.100.2023.05.19.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 07:29:03 -0700 (PDT)
Message-ID: <1678a177-f9a3-9673-d837-0ec82a4f5c1a@linaro.org>
Date: Fri, 19 May 2023 17:29:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dpu: Use V4.0 PCC DSPP sub-block in SC7[12]80
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230518-dpu-sc7180-pcc-version-v1-1-ec9ca4949e3e@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230518-dpu-sc7180-pcc-version-v1-1-ec9ca4949e3e@somainline.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 00:29, Marijn Suijten wrote:
> According to various downstream sources the PCC sub-block inside DSPP is
> version 4.0 since DPU 4.0 and higher, including SC7[12]80 at DPU version
> 6.2 and 7.2 respectively.  After correcting the version this struct
> becomes identical to sm8150_dspp_sblk which is used all across the
> catalog: replace uses of sc7180_dspp_sblk with that and remove
> the struct definition for sc7180_dspp_sblk entirely.
> 
> Fixes: 4259ff7ae509e ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 5 -----
>   3 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

