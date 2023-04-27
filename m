Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C866F08D8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEFF10EB95;
	Thu, 27 Apr 2023 15:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9669C10EB95
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:57:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9536df4b907so1640447166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682611027; x=1685203027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1cH12h8gx0PWDPigXqbqwozUNRD0Cp+35p1ClIe9c8g=;
 b=SlHUO+Yu+A759O72XQxISrPAsoC8mB81KRW9/HwH2y0j3pg5RjSiH94gpAR3J5sGUi
 uI2Xs8vSy1iykpzp5ykoLiKHDUNKN5dmJTkQVQ/UKKzOLTvRlP1vjPFl0KSKItCb29JF
 po3FMw5ZWRqOkKnE93q4xHtF5AUzvF3ZbvJ6hq7Aa1yMwe9Qsd+QIDmAUOO61RvOZaMW
 abKuLDioyAZUn7J8B7zBdvFjQTtSnoEPNLy8c7MY33oIe52ZtUuIwK+Ch0teFJLJGenE
 rfH9ouA4TD/SQmCJTYYDdWq5XA2K9gNGih7sxMcSE7tOn58+zJQj5Lsvzdtgj1OIpDet
 +EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682611027; x=1685203027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1cH12h8gx0PWDPigXqbqwozUNRD0Cp+35p1ClIe9c8g=;
 b=HZg1khCjdc7Rixp5K51k+t56zq+DwR3F9JR6sYbHDZMvFXSx3bGJLRBPKar0W3X0Nm
 2b5/9IN3IXDOkRE2KAiai67EJ9jxSZ0qsapUN/VYnMZM/l3LgWaIVKkBgrbT9Fpeu24+
 euCzEvGo3p4Pc4vqC3F2s8ZeqZpBW+MkOV1SJZw1+k49AUrRY30+PrwYeIPJOiIEuabX
 J5sFvjLk+LcyYfahBnyyeunSmc/QV9Ic2IYaHWCP/asMkLo3tFZ+zd2mC6lAe1jaZIuj
 Eu1zOlxVqH8wn51v4AuwToeRUDrlu7naRleBLEOp7EYgiS/OLyvyurCnHNV46B3nIKN8
 7Gvg==
X-Gm-Message-State: AC+VfDzMzSN6GotAVWPKPRZJDFJN8mySaBYzdS2o7HuaM1ieN0ivQW+E
 AGf3sZBFJtTjVsiMctSq8iVY1w==
X-Google-Smtp-Source: ACHHUZ5phXkCDiqMiJbhsnckjPHBo6cXwTFrQneho/GMvFOJmMiBU3kg8o+dAc/M9aCLdolIMZSDLg==
X-Received: by 2002:a17:907:3686:b0:94f:cee:56f2 with SMTP id
 bi6-20020a170907368600b0094f0cee56f2mr2233749ejc.4.1682611027668; 
 Thu, 27 Apr 2023 08:57:07 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090682cb00b0094f5179540fsm9739881ejy.83.2023.04.27.08.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:57:07 -0700 (PDT)
Message-ID: <7e2fceb0-7b13-fc21-5e19-9776ad9c8770@linaro.org>
Date: Thu, 27 Apr 2023 18:57:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230426192246.5517-4-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2023 22:22, Abhinav Kumar wrote:
> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> than DSPP_MSM8998_MASK, lets drop the latter.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

