Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164F5A24BD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE6410E7C6;
	Fri, 26 Aug 2022 09:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1C010E7C6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:45:12 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d23so1269422lfl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=MRX0Q3WFNIyiJmZ3N40sithEPWIDpqa2XOG7FbBr3D0=;
 b=DdKZMvLy1XEM5WRjVugHdAX4mR9xI5f62NbewhpZWwoafdfHcdoAXDVc/YrZbu23kD
 MM8Lc0U7QhsaSQLgsaE6/7OTRqvm2h+9oL/UYC13P3tPufMFH7nNH1bVIm4J2PD+w2SA
 BgFEkxo+COMALZs9JP45pQNhm2DFWt6K1Y/1NeoLzu8EJCVobi/SSPH2mgCxcQnyRtNY
 L7C2TQPU6ELdcqIwaWdN72y+HtR3S3wy/lnDxN+jerJV7CRJ+tIJXcPFsCWgsv7VDA3D
 wezhM8uUvafqGDIjlgv/aM9A4xtPmK7BXitVAMfuL29zZndhA+xRJ8jT9QcsP/hN0gAz
 4+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MRX0Q3WFNIyiJmZ3N40sithEPWIDpqa2XOG7FbBr3D0=;
 b=hQOO/BR+IAq+xNYfkVUcIASmTLNywpOnYfvucelZnGjJ5xuX85IHxfVaxuvkMUDvpa
 bY0ZaJb2WCSxG4uwZLgtBBj4RHUrXrmFYwXiOi3mKyWXvw5sBb2gese0/25Lacg9Psp7
 FjB1asMpUvKkLwMItZxjDy0owpcQR+fTsUb+5/DUous8ms4c9ENwh1kw0VbKPyffxPGN
 g9rR0QZGjVdVcQpU5i0IZiXWLwokrMye9dXM59qVuPhlJXBqQCY6I6Mfq1q/D8Sj5wvB
 MdOIojN4Q646+boQJm35+QO451DXRra6rfpiL0LUXbIP3BTLtO3qHI4+9zPNQgFJ0dzX
 XhTg==
X-Gm-Message-State: ACgBeo3Bg/b6LNR/KU3AXbyE7QSmF7Eu/S5GAYVPzPqiU1UBlPFn9ldh
 282hn2s4NL/hM7oK6eF13+skWg==
X-Google-Smtp-Source: AA6agR5grWoSeTNkOaTdkov5yXG2RspFnS/8kO38DF7QXqH412ouT7J2ahv8u3r5wPWv5QcnQ30ghg==
X-Received: by 2002:a05:6512:2629:b0:492:b1e7:bf26 with SMTP id
 bt41-20020a056512262900b00492b1e7bf26mr2092332lfb.254.1661507110668; 
 Fri, 26 Aug 2022 02:45:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 be28-20020a05651c171c00b0025e72aae6bdsm399882ljb.28.2022.08.26.02.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:45:10 -0700 (PDT)
Message-ID: <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
Date: Fri, 26 Aug 2022 12:45:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] msm/adreno: fix repeated words in comments
Content-Language: en-GB
To: wangjianli <wangjianli@cdjrlc.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, wangqing@vivo.com, dan.carpenter@oracle.com,
 bjorn.andersson@linaro.org
References: <20220724073650.16460-1-wangjianli@cdjrlc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220724073650.16460-1-wangjianli@cdjrlc.com>
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

On 24/07/2022 10:36, wangjianli wrote:
>   Delete the redundant word 'in'.

Could you please:
- adjust the commit subject to follow the rest of commit messages,
- drop the extra whitespace at the beginning of the commit message,
- add a correct Fixes tag.

Thank you

> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..9303a011b81d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1277,7 +1277,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   		}
>   
>   		/*
> -		 * Look for a level in in the secondary list that matches. If
> +		 * Look for a level in the secondary list that matches. If
>   		 * nothing fits, use the maximum non zero vote
>   		 */
>   

-- 
With best wishes
Dmitry

