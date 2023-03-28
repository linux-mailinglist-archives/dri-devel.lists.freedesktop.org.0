Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5A6CC63C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898910E07E;
	Tue, 28 Mar 2023 15:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117310E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:28:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j11so16291434lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbYSQAdfBoY9srBzQ23DbeM27K11V67ptwoHKDjgyAc=;
 b=pM8We1qxb75pUNu0dH9pz/vq0cEy69uWGhSkBJE0Dx6a2F2YE5+1BDyJkNiFO3qbwx
 z6y5abDpn3yLZuCHldzouxKfzDhEBgkUy2jwO0qIlZdxjNfFlzh1he5HX+zKTciexrR7
 5kKYugQaN7u6aydiiwf7OVMmiCeIO/LrCCcshW4a4nE28X+WfUQUVti4ZbimDMPi3fcK
 oGyQJtVGzinps6YPx5Ugy2wF/3f8JsPXrU7nSRPy4eDnXnF/d2VB2jHf2BEpch+OyC8e
 oHIQiF+l/2En+jsD1qEMVE6lzPvSXJ3nuuZN3mBPo1iEjdyAcj8ST8OPDxGizbdb5aHq
 xKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbYSQAdfBoY9srBzQ23DbeM27K11V67ptwoHKDjgyAc=;
 b=Ht3Vq+9AEN8aaW+PgHT/Zo/rtKXapapxWGa8U4nIjxpNxq+mB2x/ZK9YETDL6QdwSV
 B2hQUw7vusl8sgGFFL3peHVDGPeMejQJ/SatiX5kSGblF9C2uOR4rlY8qw9XPIwehv/i
 AjSCVV0aXjdzJFL4NznhdrlZMs6v2MJeyfIugJiAgek3aE70y1ckJ3do+JeW9HT3uK3J
 KinX+iJdD1ZEzqlF0j7uUSm9oiRmbfHT+z4b2fURoOHbSE5gsLkSam7pULk306IuKT1x
 U5UCRVHowxegoIfhFxPky/S846ZrEHVGAQVUC2RYUaP1gQgE3OAitp3M7+l4YHXtbXc+
 zGGQ==
X-Gm-Message-State: AAQBX9dKsgO5tNXn7XSRR4udS0oYOQvFLe55MPNlqoyWt+HD/Pdhvaz+
 t33D3fEf1Z65NTqFyNbWbSfzBQ==
X-Google-Smtp-Source: AKy350Z28cG2TgRFvAR8TDgA1LLOhqMkUBnSkIbNOBlA1oA7/iIwsV3nfpf0NfNrSfb8T4j+ZDNzKg==
X-Received: by 2002:ac2:4145:0:b0:4dd:ce0b:7692 with SMTP id
 c5-20020ac24145000000b004ddce0b7692mr4407966lfi.46.1680017302863; 
 Tue, 28 Mar 2023 08:28:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h1-20020ac250c1000000b004e83f386878sm5083801lfm.153.2023.03.28.08.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:28:22 -0700 (PDT)
Message-ID: <af31e11c-6c70-a358-1198-3cddc3ee2f89@linaro.org>
Date: Tue, 28 Mar 2023 18:28:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm: Avoid rounding down to zero jiffies
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230324220013.191795-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230324220013.191795-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2023 00:00, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If userspace asked for a timeout greater than zero, but less than a
> jiffy, they clearly weren't planning on spinning.  So it is better
> to round up to one.
> 
> This fixes an issue with supertuxkart that was (for some reason)
> spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
> drops from:
> 
>    15.83user 20.98system 0:47.46elapsed 77%CPU
> 
> to:
> 
>    8.84user 2.30system 0:46.67elapsed 23%CPU

Interesting. We potentially increased the timeout, but the overall 
(elapsed) time has decreased. Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9f0c184b02a0..7936aa6cad03 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -548,7 +548,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>   		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
>   	}
>   
> -	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
> +	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
>   }
>   
>   /* Driver helpers */

-- 
With best wishes
Dmitry

