Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F250EB78
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 00:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B910EDFE;
	Mon, 25 Apr 2022 22:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA3110EE35
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 22:12:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n14so7992761lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CAP7rPZV7Wg1L7ILm1X74Kue+bkQwcGO5HR9HWZTqCQ=;
 b=dJX2cSv/+gKglImH2uFpJEYgjc5+NX9Xd3BuvqhDgGusOPOJFIHWKeRICKBQpPPoSR
 LRWg4erbLAb1L1jmTzVE/ERDXVMvVaMjRvVK7eK25m1tZvgc7xsuVzviLcWRLXb4qJNe
 NncodU0a2RPl7ROmTaSIncvmiSd45Wt4Ukqa56boq0NxluU+2gvngMpLmVhuRptAw847
 xuWUIzDVOKohXpafkUfT2vcFXmK0te0qBVyT91KKUUDbSKU9uqP1ofJgrALW5B6j0/MD
 B0TFCbQWgpjg+K5CtO/iipd/25Fhf9UGPKZNMiNdweZ0IA1QeOLtbn7yj1vNiyXmfHLL
 3RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CAP7rPZV7Wg1L7ILm1X74Kue+bkQwcGO5HR9HWZTqCQ=;
 b=vzgGjaV45J06t0uYX6Be52nlodh52p+gOBVU9GI94WNhzI1UBUt14Z/rFrNFiuoiag
 7JrNgvojtlNHVfTe19JnGoJiKWHeGm6pbEqldVe9vG/VmFPA2U3ZixrTi8BkBYyYGhQR
 24gRmyjkQfCZ2CMPF7pmOBfCbdhinB5PO8l3AIgGQAlexltkQaz0e94yHHaCs0Ncd0Sa
 XH732WFVghZm3k8Mmc+EtT21otIEi+O8+fSAK/W8VcW6+Uo/CfkouBvhbr4oC2VMhFcP
 w0EnWxC13p/9Y+YwdLGrymjJ0hz/Q9EUCOCHtqUji+M0lSaRcCrzG2ldfAsUNewE8reA
 z74A==
X-Gm-Message-State: AOAM530NZEHTkMz8zi2OWeJn1aKGqBu20XqwPDJvklMm0AdpjftN1V9L
 DlhVZz28Vy9INdw1e99MYqA5vA==
X-Google-Smtp-Source: ABdhPJwcqBXtXmf+RLDNzHIm9VFcDdg9XbcmIbPJSD5DRm06iD9NfzLea91rV2lpzRSmr+WIJqT1DQ==
X-Received: by 2002:ac2:435a:0:b0:46b:ae5b:83e8 with SMTP id
 o26-20020ac2435a000000b0046bae5b83e8mr14551244lfl.485.1650924771409; 
 Mon, 25 Apr 2022 15:12:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a19495c000000b0044a8abcb589sm1536797lfj.186.2022.04.25.15.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:12:51 -0700 (PDT)
Message-ID: <e9d7c636-09ba-52f4-5575-a7027f722d20@linaro.org>
Date: Tue, 26 Apr 2022 01:12:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm: change msm_sched_ops from global to static
Content-Language: en-GB
To: Tom Rix <trix@redhat.com>, robdclark@gmail.com, sean@poorly.run,
 quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220421131507.1557667-1-trix@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220421131507.1557667-1-trix@redhat.com>
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

On 21/04/2022 16:15, Tom Rix wrote:
> Smatch reports this issue
> msm_ringbuffer.c:43:36: warning: symbol 'msm_sched_ops' was not declared. Should it be static?
> 
> msm_sched_ops is only used in msm_ringbuffer.c so change its
> storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 367a6aaa3a20..66f4ec09ef67 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -40,7 +40,7 @@ static void msm_job_free(struct drm_sched_job *job)
>   	msm_gem_submit_put(submit);
>   }
>   
> -const struct drm_sched_backend_ops msm_sched_ops = {
> +static const struct drm_sched_backend_ops msm_sched_ops = {
>   	.run_job = msm_job_run,
>   	.free_job = msm_job_free
>   };


-- 
With best wishes
Dmitry
