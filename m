Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8F58C7AC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821CC971EC;
	Mon,  8 Aug 2022 11:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCF499187;
 Mon,  8 Aug 2022 11:30:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a7so16050584ejp.2;
 Mon, 08 Aug 2022 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=dAEB+ltJy92aHJia4rkluIFFluTtwX5Z1gYtEjy8D4Y=;
 b=BogbkyhW0jpxu8TZ2/FZ6IImPEXkk0ZXX7XIcE0Dz9n+YhTS8cg9RU2rnrvh/2RAqd
 3ah3WYJGwt47hbstjEyPyJeUg+XTLNXZTAngQgpyobPBkEQ71TiUxpcMGjSGkIqmsUZq
 GlEgzZI5zwdNCamT3uBoDXIV3IEq2yCaVWWo2EqYIRIHcqF608yDyqV8G0L+n5ydRHC1
 IEQZotoAlYPaCxpQHRF0zGq8+kb8KBKrwI5r8DPzB1ZWBVJArAEAZnFOIMhcJxuUEhC7
 UJXrd+Pd4HG/+4BMI7H1xf4IZMc+i9BD6AF9SNkE6+Xqd2ECeIFDenuE7CHmGYf7XN0a
 X79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dAEB+ltJy92aHJia4rkluIFFluTtwX5Z1gYtEjy8D4Y=;
 b=IxS2tABHPhHjt3xgXFlqCEGYyIUT4iv2pNLRGQd92CNDD8+nhWusWE0KOKqZ9fpmmi
 5Dq7+StrTQ1OLlzgPpJrUeiaPLj74xPJGosJYOgjjktZlyT78OtrNT+oe5QO0wBGk4U5
 PnnASUmgIk8oMpHOWma//Zhg3N//5+pCohm6btq9rz/hrvvLpzL2Uyns1TEy/JV7Mce1
 xgOF28bSmHBxKvN0Ft0ZArOENEP+HCFFDyCsGRSvor0mLBZvRN91g5XTpq6fPHK/n7Ms
 Pe3R+mKncc4EiMD9OaUx9nkcYHUXM8BD1iFjR7rzGB/SXd7lhoqElMtwRXR/vwxG7iYg
 mhQw==
X-Gm-Message-State: ACgBeo2rEtZgG1/9yrvs2cQXl3rymnZ4i+XhlLljin45Q6cqUjug09Mc
 j6OfbTktpG0Xs9gvzcBTfw4=
X-Google-Smtp-Source: AA6agR6EWxK4X/LpXbejTAc6NOFR/jRq0fCwafMfgJ/wtJ/x0PwvL5uZHd+pzB3sAkDzRUmOGLf/GQ==
X-Received: by 2002:a17:906:7303:b0:730:a4e8:27f1 with SMTP id
 di3-20020a170906730300b00730a4e827f1mr13593548ejc.474.1659958254273; 
 Mon, 08 Aug 2022 04:30:54 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2de9:6498:3b4e:7aeb?
 ([2a02:908:1256:79a0:2de9:6498:3b4e:7aeb])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a50fb8c000000b0043a78236cd2sm4442087edq.89.2022.08.08.04.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 04:30:53 -0700 (PDT)
Message-ID: <8398d805-a749-dac6-9bf8-6f93935dd2ec@gmail.com>
Date: Mon, 8 Aug 2022 13:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/6] drm/ttm: Implement intersect/compatible functions
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
 <20220725114240.4844-2-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220725114240.4844-2-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.07.22 um 13:42 schrieb Arunpravin Paneer Selvam:
> Implemented a new intersect and compatible callback functions
> to ttm range manager fetching start offset from drm mm range
> allocator.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index d91666721dc6..12b8d9b36fe6 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>   	kfree(node);
>   }
>   
> +static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
> +				    struct ttm_resource *res,
> +				    const struct ttm_place *place,
> +				    size_t size)
> +{
> +	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> +	u32 num_pages = PFN_UP(size);
> +
> +	/* Don't evict BOs outside of the requested placement range */
> +	if (place->fpfn >= (node->start + num_pages) ||
> +	    (place->lpfn && place->lpfn <= node->start))
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
> +				     struct ttm_resource *res,
> +				     const struct ttm_place *place,
> +				     size_t size)
> +{
> +	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> +	u32 num_pages = PFN_UP(size);
> +
> +	if (node->start < place->fpfn ||

This should probably be "<=".

Regards,
Christian.

> +	    (place->lpfn && (node->start + num_pages) > place->lpfn))
> +		return false;
> +
> +	return true;
> +}
> +
>   static void ttm_range_man_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *printer)
>   {
> @@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func ttm_range_manager_func = {
>   	.alloc = ttm_range_man_alloc,
>   	.free = ttm_range_man_free,
> +	.intersect = ttm_range_man_intersect,
> +	.compatible = ttm_range_man_compatible,
>   	.debug = ttm_range_man_debug
>   };
>   

