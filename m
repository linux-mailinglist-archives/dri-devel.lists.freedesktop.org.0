Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BA421A47
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9CA6E210;
	Mon,  4 Oct 2021 22:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884C6E210
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 22:48:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y23so38742587lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fuYKZBlsBN/oAWqlM2Px7R4QB8Yf2Dd4kLqSjdySbDs=;
 b=xDBuXAYBOQZ3FoLfObUjS3Oy8+W1+6Lc640YUmCqhW9bNWScjA3eE90pEkRYKrdxCP
 /+TqIXbhPi6BWze7P7HZ+u43LZtcMz7ob3A/I6JkY+1Ti+0WRu/34mRrDPuBiYWNhN1l
 JPvD0Za7digs9sr22Adxwxi+mnuQ1YfvtbV0wPYGGuyGhA756v13adXoa35h3r7ckczB
 fXSpc3+c9iDYrNhtSiquLEsVogw44iroJc3J7jsHUK1AIbD+3ckM0A2kdvsVT+omsa07
 H3THafo7jhLt739RjZuTHicfOpLwlJswq1sL/yrlmuc0ZFu/tt/mqRGo1v0YeZjdKADL
 pjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fuYKZBlsBN/oAWqlM2Px7R4QB8Yf2Dd4kLqSjdySbDs=;
 b=mhKdG+Lq9/yqYg6XrmwhntxMaq5bs0o1p7lBSLKpeK9nsI/gE/JpRDoBE50yvseird
 HSQC7NVUgT2qCrDUXL2i4TTI/ONFt/d9iNzLnmvtEPjl5WuSbVCSCyC/wxLpdvT9aehO
 xYAqUCIingoSdHhJHFryisdbuK3WZw9U0GcppNKV3EfsWbZu7s4ff1ClabPDRtDhioFR
 TLe2iehZZBXPYvgp9880Gv2DhJC2Xxsor7V2ugLvnETAKLOL42xksQUuxf2lGv5E+v5q
 5fbGQZnRiWnok9vAMi7McsJ4tSFozF8JR+NLdke0502+sASSzOy6YETNU+bop++C+Kq/
 reBw==
X-Gm-Message-State: AOAM533DYFgQHy4aAbDSGFJFP9hWqMn7sXFnNLjNpPaejyPl9m+VBcjg
 MKdXJ/mR+gd0Ht/Z7GAEnecPCQ==
X-Google-Smtp-Source: ABdhPJyQ5BQeCxSIG/H54WDxN3wJp13/97SBah0tsoBTsQykpd2oC1CCjJ2td9Srb0UGTiEzbAwXmw==
X-Received: by 2002:a05:6512:1520:: with SMTP id
 bq32mr17670181lfb.232.1633387721505; 
 Mon, 04 Oct 2021 15:48:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e28sm1881117ljo.63.2021.10.04.15.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 15:48:40 -0700 (PDT)
Subject: Re: [PATCH v3 08/14] drm/msm/dpu_kms: Re-order dpu includes
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-9-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fe36a62f-11b7-aac5-5c6f-9690ab739fd1@linaro.org>
Date: Tue, 5 Oct 2021 01:48:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-9-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Make includes alphabetical in dpu_kms.c
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2
> 
> Changes in v2:
> -None
> Changes in v3:
> -None

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..fb0d9f781c66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -21,14 +21,14 @@
>   #include "msm_gem.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> -#include "dpu_kms.h"
>   #include "dpu_core_irq.h"
> +#include "dpu_crtc.h"
> +#include "dpu_encoder.h"
>   #include "dpu_formats.h"
>   #include "dpu_hw_vbif.h"
> -#include "dpu_vbif.h"
> -#include "dpu_encoder.h"
> +#include "dpu_kms.h"
>   #include "dpu_plane.h"
> -#include "dpu_crtc.h"
> +#include "dpu_vbif.h"
>   
>   #define CREATE_TRACE_POINTS
>   #include "dpu_trace.h"
> 


-- 
With best wishes
Dmitry
