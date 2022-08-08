Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1658C79D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427E199036;
	Mon,  8 Aug 2022 11:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7A976A5;
 Mon,  8 Aug 2022 11:28:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id kb8so16032064ejc.4;
 Mon, 08 Aug 2022 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=n0CAi9pds/V29zU7AxtYcUqo8kNQ6o6h5I9nksSIB5Y=;
 b=HmkiaYhVXxCh5T3W/Qn+x6LgKPShRn8pVmCHUrPiSCVUMXMBfnED+x+EFXeTwWzRa4
 o3r7x9SmZ5EBRF5k6bT24SrDXnSMX+w/n01eLZuGBTmke5oOynXYUbHusFvF//Xw8Ovi
 LIWXA4tE95IbPz6ZR8WWhOtykJv0uBeNCoOFcbH0j+DBr4CwHCoMw7QA8tT0TjKGabGf
 eYsTT2BmAIzM6idnMJYNr93nhSc+yNe2fsKnHM12W4kExPp5I0nL2G7IQq7HcuzESwjy
 UMDRL/HPxJmKwSZVmiX1WlmVLGiX9yzzwSDI+xWdGTGBXQVBYlhJzKHw+ZUF9rJlQqAl
 kgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=n0CAi9pds/V29zU7AxtYcUqo8kNQ6o6h5I9nksSIB5Y=;
 b=2TslTLzEEuoh6XKLSX/tE5Mrs54vvjtoGfo5ztSlDAju23RSJVMHz+Xd1E96rs6pOB
 7e68OW0JpEUDfizgDSenVo7sMJa8W2KCeADjFkppRnkt5Ges50CFCF4tEkkSbd6N+oYM
 SWt6gw5XxGx/x2G/WGDFdtsqGufd9HviencmS1ZZp3Opnt+NA3b1LPj2theQq3kP0CCk
 VrL0w86d7j/Cmbne2n/7OWBm+yn7vHRwb5nJQM5h41qjowblNO6b6SBGw53TvAdg6KjX
 3Z90ZxDAB2kjyGsgZ7ygGrOzYmVYjelp5tNufahC4EGLNOXLPOMZaNIZLw7yttudeELi
 jmoA==
X-Gm-Message-State: ACgBeo21Bzmr8EZ81088wvZ+wdMuJxb08GiEtf2qJMU1f+WHABCW0fYp
 UD1+iXvE2JrS7AC68hnpZD4NMWUSi+0=
X-Google-Smtp-Source: AA6agR5CCGvOrNmkJeoroYuKc9EmH2tKz1aTOPz9R2NZDdpsd21ivvCte1eExyenis8aYhJYZm5uxQ==
X-Received: by 2002:a17:907:6d23:b0:731:147f:9e32 with SMTP id
 sa35-20020a1709076d2300b00731147f9e32mr8609326ejc.280.1659958112105; 
 Mon, 08 Aug 2022 04:28:32 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2de9:6498:3b4e:7aeb?
 ([2a02:908:1256:79a0:2de9:6498:3b4e:7aeb])
 by smtp.gmail.com with ESMTPSA id
 bd9-20020a056402206900b0043bbf79b3ebsm4479485edb.54.2022.08.08.04.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 04:28:31 -0700 (PDT)
Message-ID: <c6fdc73d-8877-b261-6e46-0094d4bb4527@gmail.com>
Date: Mon, 8 Aug 2022 13:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
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
> We are adding two new callbacks to ttm resource manager
> function to handle intersection and compatibility of
> placement and resources.
>
> v2: move the amdgpu and ttm_range_manager changes to
>      separate patches (Christian)
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 59 ++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_resource.h     | 39 ++++++++++++++++++++
>   2 files changed, 98 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 20f9adcc3235..4cd31d24c3e7 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -253,6 +253,65 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   }
>   EXPORT_SYMBOL(ttm_resource_free);
>   
> +/**
> + * ttm_resource_intersect - test for intersection
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res intersects with @place and @size. Used for testing if evictions
> + * are valueable or not.
> + *
> + * Returns true if the res placement intersects with @place and @size.
> + */
> +bool ttm_resource_intersect(struct ttm_device *bdev,
> +			    struct ttm_resource *res,
> +			    const struct ttm_place *place,
> +			    size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res)
> +		return false;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!place || !man->func->intersect)
> +		return true;
> +
> +	return man->func->intersect(man, res, place, size);
> +}
> +
> +/**
> + * ttm_resource_compatible - test for compatibility
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res compatible with @place and @size.
> + *
> + * Returns true if the res placement compatible with @place and @size.
> + */
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res)
> +		return false;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!place || !man->func->compatible)

Well that !place is probably misplaced here.

When no placement is given then that's either illegal or the resource is 
never compatible.

Maybe move that check up to the !res if and return false.

> +		return true;
> +
> +	return man->func->compatible(man, res, place, size);
> +}
> +
>   static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index ca89a48c2460..68042e165c40 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -88,6 +88,37 @@ struct ttm_resource_manager_func {
>   	void (*free)(struct ttm_resource_manager *man,
>   		     struct ttm_resource *res);
>   
> +	/**
> +	 * struct ttm_resource_manager_func member intersect
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res intersects with @place + @size. Used to judge if
> +	 * evictions are valueable or not.
> +	 */
> +	bool (*intersect)(struct ttm_resource_manager *man,
> +			  struct ttm_resource *res,
> +			  const struct ttm_place *place,
> +			  size_t size);
> +
> +	/**
> +	 * struct ttm_resource_manager_func member compatible
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res compatible with @place + @size.

"Used to check of the need to move the backing store or not."

Apart from that looks good to me.

Regards,
Christian.

> +	 */
> +	bool (*compatible)(struct ttm_resource_manager *man,
> +			   struct ttm_resource *res,
> +			   const struct ttm_place *place,
> +			   size_t size);
> +
>   	/**
>   	 * struct ttm_resource_manager_func member debug
>   	 *
> @@ -329,6 +360,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res);
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
> +bool ttm_resource_intersect(struct ttm_device *bdev,
> +			    struct ttm_resource *res,
> +			    const struct ttm_place *place,
> +			    size_t size);
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size);
>   bool ttm_resource_compat(struct ttm_resource *res,
>   			 struct ttm_placement *placement);
>   void ttm_resource_set_bo(struct ttm_resource *res,

