Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D35B211E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD010E4A5;
	Thu,  8 Sep 2022 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049BB10E49E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:47:57 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w8so28064372lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
 b=OVR1cCbGJE072hGoQUQmFQJ+kprUmprVLEtmSadFZzpbbM7QbSvFvlCIfSqryPYi1+
 SD1skqQd1QH52qTt6B1S/BsqHmuHjpZH9S8UyJzmPe8Zx7lmJFsP6MLRxPjlD72Vew+F
 b3lD9iUSQTOtSZCuSR/OZHMWl5KUpzR00UUcgkT49wx1fcv3qiGGhm3smwbpo3sqBOFZ
 Z5hickhSir1Me8plctfVtkpBlKW0vRDxdoKVZ7W3hL2g2Jcf81GRGI863Xy7G+pj3Pp2
 4oWiONVlaAsk50KQFObKyWirZF0osd3vjKUSXgBE+7K2LLcMQ4dOLD77ynoOtMcJFiKA
 8gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
 b=PussAFnDnukCxuY232nb/vU95yeze4KKGo6O3h4cdlsgd3zTx6hj++xhBM/2ju8Ut0
 T/pUBmUUzCcSyPlWGmK5BKukfK75NSxEYadRWi96vtNEYkalMfdjnUmGWl6tJMCPjfoE
 v2JZyqLAvElGcDAUvCGNAZlinj5PsCjdynh/z/kK8odkHXMhhSZnRBy8kIA3cUf0fJi1
 NAHLSb9YSzDXnDfxE/9ol3nMxZiMq5uESRAqYlgUg7jJs+XlRCu6sv+XC01aggQA99nT
 PDKIl+cdx8ltuud2I4Ba++DUcN/zV1qY2zIFb0oVVmoVfoFbVfuJ/bGemAuxD2v7GSBk
 Mb5A==
X-Gm-Message-State: ACgBeo2cgIoQgkWjIzTvpPAd+O3xAPrAsPyxg77bYLhHw4pqh8VOkbeR
 PrcfCok2EKeGCczTnidkioNFLg==
X-Google-Smtp-Source: AA6agR7D86UKhJvdjGXOYNf76HQYlp2EoXMifqDRKaFOaRaCQAkypP44nETDFgPRIChEC/kucC5VjA==
X-Received: by 2002:a05:6512:224e:b0:498:f21f:3500 with SMTP id
 i14-20020a056512224e00b00498f21f3500mr659945lfu.581.1662648475360; 
 Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac25e78000000b0048aee825e2esm788307lfr.282.2022.09.08.07.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Message-ID: <f1d8736c-2e05-885c-aebe-0e89e3139eb5@linaro.org>
Date: Thu, 8 Sep 2022 17:47:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 1/4] drm/msm: clean event_thread->worker in case of an
 error
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
 <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2022 03:08, Abhinav Kumar wrote:
> 
> 
> On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
>> If worker creation fails, nullify the event_thread->worker, so that
>> msm_drm_uninit() doesn't try accessing invalid memory location. While we
>> are at it, remove duplicate assignment to the ret variable.
>>
>> Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of 
>> kthread_run")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> the change itself LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> One minor nit below
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 44485363f37a..1aab6bf86278 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>           if (IS_ERR(priv->event_thread[i].worker)) {
>>               ret = PTR_ERR(priv->event_thread[i].worker);
>>               DRM_DEV_ERROR(dev, "failed to create crtc_event 
>> kthread\n");
> 
> Can we print ret in this error message?

In a separate change. I'll add it to my todo list.

> 
>> -            ret = PTR_ERR(priv->event_thread[i].worker);
>> +            priv->event_thread[i].worker = NULL;
>>               goto err_msm_uninit;
>>           }

-- 
With best wishes
Dmitry

