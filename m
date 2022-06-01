Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F153ADA7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 22:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271210FA82;
	Wed,  1 Jun 2022 20:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE7710FC0B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 20:29:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h23so4616961lfe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DcSjpVSz5kBdKttL/qibmuyG6zf/I/eEkUNKVypzm4Y=;
 b=LeXZCfDwi2JzAKvy4kHtOnltGKxqKYskF08v+UIdsvEtOxxkwoK78b2BOKkHrkgRfW
 Y+8VuwFXMA22RggbMXr8BqJP8G9jxw4NnRbS5rJ+Hlm7fSLvPjIgZFIY3mCYuRhB7AwR
 TDIq6/uCsckrZ4MnKi3K5jPuGZNp+R5ffvuOnJlAukZOGyMaOXN+e+lddOkZneNNJNBr
 KwAPb0MnVnY+5+izFAW7GUFLx7j2b7w7PBm9XR71icRTloDMuybxUTteLsrK5SaaUyO/
 N0nALzFMvqA0DKYCugRlIBeZSBKbPu6/Dkk/jBaJJJ1YQoQIpWnIz7fBd9gMiYKhkysR
 s9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DcSjpVSz5kBdKttL/qibmuyG6zf/I/eEkUNKVypzm4Y=;
 b=aEpMBPxYvpd/FFN4ZWFplRV+sHfUU86ixpRE7rg+LefGpZj7YUX1iQFktXWGfzYiUA
 fRG4IblFd5Ak4GAx5bePzPbmgbyw4uiOvu9ri/OsQQIRbdcIiSbs09Ws2AE/JvvRwPLx
 Pa8IScMeWZlkf+KNY7jS4lRgXmI5FVY9fSfKlYPGsnuaG4GqnBJeJjTn1UfW9XgN2B0A
 frBEIllnDtb5l/VylMaE/78y9apUT7swa5vPq9VTSC068XciapcSye9uqMJKx/RN/NKz
 ImgIN+MnGRNgWpPPKFGoKeyGg5AnUFP8lAgH3zvWuerowuQTWKGC3H/o7qlLm1DiOlmB
 47WA==
X-Gm-Message-State: AOAM531q11DsfV/AgY35MR6mBxvufXMiXC7xwWvCzXX5Oc1CkAgiCkFa
 hqV+/VI0k6PRzRP30itqFlaZLA==
X-Google-Smtp-Source: ABdhPJyo80JtJC9EIe0BPck/BKbot5NFyz0n8b5/KWlTwdKmU8JYQYlgeVZ7FO9/zTX8ShzY5j01dg==
X-Received: by 2002:ac2:4289:0:b0:477:b3eb:f2f with SMTP id
 m9-20020ac24289000000b00477b3eb0f2fmr916181lfh.386.1654115347986; 
 Wed, 01 Jun 2022 13:29:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a0565120c0800b00478e5ef1ee5sm550811lfu.245.2022.06.01.13.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 13:29:07 -0700 (PDT)
Message-ID: <846ef8f5-230e-4e52-f67c-d2fc2530fcc0@linaro.org>
Date: Wed, 1 Jun 2022 23:29:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX
 bus
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2022 22:29, Douglas Anderson wrote:
> While working on the DP AUX bus code I found a few small things that
> should be fixed. Namely the non-devm version of
> of_dp_aux_populate_ep_devices() was missing an export. There was also
> an extra blank line in a kerneldoc and a kerneldoc that incorrectly
> documented a return value. Fix these.
> 
> Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> None of these seem critical, so my plan is to land this in
> drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
> with future patches.
> 
> Changes in v3:
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
> 
>   drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index dccf3e2ea323..552f949cff59 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
>    * @dev: The device to remove.
>    *
>    * Calls through to the endpoint driver remove.
> - *
>    */
>   static void dp_aux_ep_remove(struct device *dev)
>   {
> @@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
>   /**
>    * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
>    * @dev: The device to free.
> - *
> - * Return: 0 if no error or negative error code.
>    */
>   static void dp_aux_ep_dev_release(struct device *dev)
>   {
> @@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
>   
>   static void of_dp_aux_depopulate_ep_devices_void(void *data)
>   {


-- 
With best wishes
Dmitry
