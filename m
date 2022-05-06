Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7AC51E136
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 23:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354F410EBCC;
	Fri,  6 May 2022 21:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C71510EBCC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 21:34:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p26so1365657lfh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
 b=E6ubfehEot+x8OIJN5C7LyAh0NxnQYP+RE9/EESVDWl69ZQaV/yxIOwei4gYpMgp9u
 KYGp1mJ19wh4ZbLDI2xwgyR6S0de2pOwrp0ci37vT2JsSZgS2FeN3mfYUZEd/twNI0Uo
 8oUUsnFxi4/8IaLTiOMsbpepGLLSgZABHFSO/557vUiup9JZiPbmIE8FS4tcZePNQJEU
 KJq/NzyOxrQRZnztocLanqCG019/CrdaIDCj7/umEZYOSbLokeOvFfuTfjmE6SKhIJF1
 D4lRuJe51mSe7wTT6KFUmKGmltxmO0g+dsLrToFHKXgK0VVu9PAWaLeqzpi2g+gL5diJ
 h6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
 b=WojTvOq6geY+rkgsNncWNu6PIg1+Fhu97+K818oHQv91o81I9taA+Lci9nFj5BdJ3a
 tXyR0ZrUCsSDS9WHHO4cu4EKir9c90qI3AzN+lb9EPI2/FGYLxl+TRysOUuWwh+zCXZw
 Ldrk/+h+hf5DCow9DCm5Dy1w62rwpB12Vq+httzYOclLm+uTUO+hsGuA1eEj+shTebmD
 3wKvgis0GR294WoHx9NGH7VRzQ0+MslSTLEYf7QMMddqA3wGmEMtMz8vLaVnUe5TCWg2
 jFk/wNZ+u7/neMdVfPgw8DBMjrCrrTENfeAnt4Bn/DpSolBysRpm+ykY/dOmWfEBgANr
 3WiQ==
X-Gm-Message-State: AOAM531U0HL1JvefLTVu/blDZz+35iA3dGEDexJl49ZZjYfdD6lYwdxi
 ZAhYiGGP6GC/cAvziOI9HVZntQ==
X-Google-Smtp-Source: ABdhPJyIx7HcnaKtjeqHbF+57hQVC9kVqNcgwjcSjUaE5fY6FOVbRp1itaMTMdwdoIAzxxj0m6KmKw==
X-Received: by 2002:a05:6512:3b28:b0:473:b9ec:187e with SMTP id
 f40-20020a0565123b2800b00473b9ec187emr3774357lfv.536.1651872839945; 
 Fri, 06 May 2022 14:33:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05651211c800b0047255d211dfsm826080lfr.270.2022.05.06.14.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:33:59 -0700 (PDT)
Message-ID: <a78b160a-a173-41c3-0c9a-d7cb7244af98@linaro.org>
Date: Sat, 7 May 2022 00:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: return an error pointer in
 msm_gem_prime_get_sg_table()
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark <robdclark@gmail.com>
References: <YnOmtS5tfENywR9m@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YnOmtS5tfENywR9m@kili>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2022 13:28, Dan Carpenter wrote:
> The msm_gem_prime_get_sg_table() needs to return error pointers on
> error.  This is called from drm_gem_map_dma_buf() and returning a
> NULL will lead to a crash in that function.
> 
> Fixes: ac45146733b0 ("drm/msm: fix msm_gem_prime_get_sg_table()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index e8f1b7a2ca9c..94ab705e9b8a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -17,7 +17,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	int npages = obj->size >> PAGE_SHIFT;
>   
>   	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
>   }


-- 
With best wishes
Dmitry
