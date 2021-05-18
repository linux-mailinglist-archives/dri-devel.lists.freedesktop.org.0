Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3A387494
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27D66E069;
	Tue, 18 May 2021 09:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D2E6E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 09:03:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id t206so5009626wmf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iDhIGJc3JRfGZycWdpODaa4apRb4vEjSG65+Ph1010I=;
 b=R4xpmkwZeVK19sXXd6Rh0UBUgJxcA8ePs24++LIc6d6SrIy1cjiAclWQ6wTbeOG4nc
 cWHKR8QhNvkggaItvX1yHcpYsDHosop7M2x7pBqPMIXCdABds6TjIWKVHEjHUpG/o4rH
 fZy647FPIxvGupm75RDdAdOo3HG50QBqm65Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iDhIGJc3JRfGZycWdpODaa4apRb4vEjSG65+Ph1010I=;
 b=QDfuSx52ex2vecBo465urARUxu6Y8yCeqDAhXXU5Nbg4fpSeEeSUj7ef+v2I9+12Yv
 DgCqqk7TqRaX0nYjECm8JHhkw1fcxsJsDDBT/iiWnMnzoUiah/dS/DzLdjrwGye7yiXq
 eaYs+lS0qn1b3ydI3wFjoMhBjXdfusS9jKOjQ2qSml0Vc6xFuyXxSNrvymrKEQaYh/RN
 AzzMZtjsUv5kkP1xn6YNSK2+PyaHJMsi29LQEVQe5Nw5uMXyPJi1VvaVNrp/eHk1Ch6A
 RQ1EEuFTIC4mIvDN+HcFECKvFNhbYUExihGoPZ/ZBtBjUl7JU7kJSq51GYNrZNBe28Q5
 vcPQ==
X-Gm-Message-State: AOAM530zeyzX14TqWIUWK8CD9svoaLcUMjXHPlZf34DEUsGvQ5c+cLMh
 gEGptfFhyLPRRlXyU9rBn9KrWA==
X-Google-Smtp-Source: ABdhPJzKAGHysiGnnTl//jQJkxHO/4BfinDRYqg8WW6OPbG0N0SbBUItCwibducFI2eDSOND8OjeWQ==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr1521724wmj.146.1621328633742; 
 Tue, 18 May 2021 02:03:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c7sm1915054wml.33.2021.05.18.02.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:03:53 -0700 (PDT)
Date: Tue, 18 May 2021 11:03:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 04/15] drm/ttm: Export functions to initialize and
 finalize the ttm range manager standalone
Message-ID: <YKOC9/Nn9i9fpgHc@phenom.ffwll.local>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 10:26:50AM +0200, Thomas Hellström wrote:
> i915 mock selftests are run without the device set up. In order to be able
> to run the region related mock selftests, export functions in order for the
> TTM range manager to be set up without a device to attach it to.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_range_manager.c | 55 +++++++++++++++++--------
>  include/drm/ttm/ttm_bo_driver.h         | 23 +++++++++++
>  2 files changed, 61 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index b9d5da6e6a81..6957dfb0cf5a 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -125,55 +125,76 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
>  	.debug = ttm_range_man_debug
>  };
>  
> -int ttm_range_man_init(struct ttm_device *bdev,
> -		       unsigned type, bool use_tt,
> -		       unsigned long p_size)
> +struct ttm_resource_manager *
> +ttm_range_man_init_standalone(unsigned long size, bool use_tt)
>  {
>  	struct ttm_resource_manager *man;
>  	struct ttm_range_manager *rman;
>  
>  	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
>  	if (!rman)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	man = &rman->manager;
>  	man->use_tt = use_tt;
>  
>  	man->func = &ttm_range_manager_func;
>  
> -	ttm_resource_manager_init(man, p_size);
> +	ttm_resource_manager_init(man, size);
>  
> -	drm_mm_init(&rman->mm, 0, p_size);
> +	drm_mm_init(&rman->mm, 0, size);
>  	spin_lock_init(&rman->lock);
>  
> -	ttm_set_driver_manager(bdev, type, &rman->manager);
> +	return man;
> +}
> +EXPORT_SYMBOL(ttm_range_man_init_standalone);
> +
> +int ttm_range_man_init(struct ttm_device *bdev,
> +		       unsigned int type, bool use_tt,
> +		       unsigned long p_size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_range_man_init_standalone(p_size, use_tt);
> +	if (IS_ERR(man))
> +		return PTR_ERR(man);
> +
>  	ttm_resource_manager_set_used(man, true);
> +	ttm_set_driver_manager(bdev, type, man);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_range_man_init);
>  
> +void ttm_range_man_fini_standalone(struct ttm_resource_manager *man)
> +{
> +	struct ttm_range_manager *rman = to_range_manager(man);
> +	struct drm_mm *mm = &rman->mm;
> +
> +	spin_lock(&rman->lock);
> +	drm_mm_clean(mm);
> +	drm_mm_takedown(mm);
> +	spin_unlock(&rman->lock);
> +
> +	ttm_resource_manager_cleanup(man);
> +	kfree(rman);
> +}
> +EXPORT_SYMBOL(ttm_range_man_fini_standalone);
> +
>  int ttm_range_man_fini(struct ttm_device *bdev,
>  		       unsigned type)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
> -	struct ttm_range_manager *rman = to_range_manager(man);
> -	struct drm_mm *mm = &rman->mm;
>  	int ret;
>  
>  	ttm_resource_manager_set_used(man, false);
> -
>  	ret = ttm_resource_manager_evict_all(bdev, man);
>  	if (ret)
>  		return ret;
>  
> -	spin_lock(&rman->lock);
> -	drm_mm_clean(mm);
> -	drm_mm_takedown(mm);
> -	spin_unlock(&rman->lock);
> -
> -	ttm_resource_manager_cleanup(man);
>  	ttm_set_driver_manager(bdev, type, NULL);
> -	kfree(rman);
> +	ttm_range_man_fini_standalone(man);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_range_man_fini);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index dbccac957f8f..734b1712ea72 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -321,6 +321,20 @@ int ttm_range_man_init(struct ttm_device *bdev,
>  		       unsigned type, bool use_tt,
>  		       unsigned long p_size);
>  
> +/**
> + * ttm_range_man_init_standalone - Initialize a ttm range manager without
> + * device interaction.
> + * @size: Size of the area to be managed in pages.
> + * @use_tt: The memory type requires tt backing.
> + *
> + * This function is intended for selftests. It initializes a range manager
> + * without any device interaction.
> + *
> + * Return: pointer to a range manager on success. Error pointer on failure.
> + */

Kerneldoc is great and I'm happy you're updating them (Christian's not so
much good for this), but I think would be good to go one step further with
a prep patch:

- Make sure ttm_bo_driver.h is appropriately included in
  Documentation/gpu/drm-mm.rst.

- Fix up any kerneldoc fallout. Specifically I think common usage at least
  is that for non-inline functions, the kerneldoc is in the .c file, not
  in the headers.

But also this might be way too much work since ttm hasn't been properly
kerneldoc-ified, so maybe later.
-Daniel

> +struct ttm_resource_manager *
> +ttm_range_man_init_standalone(unsigned long size, bool use_tt);
> +
>  /**
>   * ttm_range_man_fini
>   *
> @@ -332,4 +346,13 @@ int ttm_range_man_init(struct ttm_device *bdev,
>  int ttm_range_man_fini(struct ttm_device *bdev,
>  		       unsigned type);
>  
> +/**
> + * ttm_range_man_fini_standalone
> + * @man: The range manager
> + *
> + * Tear down a range manager initialized with
> + * ttm_range_manager_init_standalone().
> + */
> +void ttm_range_man_fini_standalone(struct ttm_resource_manager *man);
> +
>  #endif
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
