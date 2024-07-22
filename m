Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB1938B6F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2377810E43C;
	Mon, 22 Jul 2024 08:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jZrE3Nrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB110E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:43:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a77af4cd570so187799666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721637781; x=1722242581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8oBB9ZbRde5X4tmMNl5f4KJ93dANl4vxkldF+ejZ/aA=;
 b=jZrE3NrwGLZc/ARk/+HwqAwNFpFyWf2lBcN+jaQP0jvB1x7j7xKbRtY7UGmtvoYhnq
 CKDRNkVDhR11TIJ/d6ZLFbfeIZy1c2qJ/OIn71h15R/We5/IoTiZGvVf3O7yI99b8UHS
 j/nbVxUKAb9KLzr0HKhLzwUST3uxyIKTnUgQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637781; x=1722242581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8oBB9ZbRde5X4tmMNl5f4KJ93dANl4vxkldF+ejZ/aA=;
 b=KDV9VXvDOb0SOjdn1xtkxicfGe7qXjI+Js2icwD7h9yJXOUXkdyoREQgJ3y22ZWhMs
 T1R7wUJPKTqJ/qmPEfJLzAW8Q6WniAxzv2t24oSmTjz8yQipdopJ33OdpEMss43NNszO
 WsW5ctv6utsLl3tum01eQKYDQxBNPNNmEYnXE0/k3V7yEJI8KFy3bvfl7Hc1051U+pJ3
 QnQfo6fBPM7w0HLB/q6jSu1GFAIEnce73ys7opyOZRYampwSfAbmoTpbMrQ4+KI8+fGd
 5IsbjhqHHslA07T19PjgCxvbLN9bEcNd+R6KHn3rVwJqpOwo9o0F1/7iOcnNY5C4hsJU
 zszQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1ONYkng7stU+5e77Na0+kUpaz9Eiy71mk0K615jCf/KAACnvrtsZUKj+h/5htrkSvKoY2vn5t70xzL4hLXv2UHpHy4tmfi1StY5JYc6h
X-Gm-Message-State: AOJu0Yzq5V7yXDkkO/MNsI5NjWxwKA7iGAYlS2R17ongoZcXZgRd2GTz
 M/sc5Sd2b2ZcUafp0X6sDQu37QSGUinjv3KtyfcHlIoBv2EiGBPJypRc6QabumM=
X-Google-Smtp-Source: AGHT+IEJ5FW5sXDoYE7BpfF7alnh5Avo6ZtjYPVMsUaSBqO7CheusaEw3Tp1g1ZfPP9EQw0W8dSIpg==
X-Received: by 2002:a05:6402:5246:b0:5a1:b6d8:b561 with SMTP id
 4fb4d7f45d1cf-5a478f6747dmr4904233a12.9.1721637780826; 
 Mon, 22 Jul 2024 01:43:00 -0700 (PDT)
Received: from [192.168.1.37] (host-87-1-39-192.retail.telecomitalia.it.
 [87.1.39.192]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a44cb995absm4148381a12.45.2024.07.22.01.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:43:00 -0700 (PDT)
Message-ID: <ed824484-5d69-4ebd-a9b1-f7860f5b2cf6@amarulasolutions.com>
Date: Mon, 22 Jul 2024 10:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] devres: Refactor using guards
To: regkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com,
 andrea.calabrese@amarulasolutions.com
References: <20240613072630.11690-1-andrea.calabrese@amarulasolutions.com>
Content-Language: en-US
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
In-Reply-To: <20240613072630.11690-1-andrea.calabrese@amarulasolutions.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

just a small push on this, since I received no notifications.

On 13/06/2024 09:26, Andrea Calabrese wrote:
> Code refactoring using the recent guard and scoped_guard macros
> for automatic cleanup of the spinlocks. This does not change the
> effective behaviour of the kernel, but guarantees a cleaned-up exit from
> each lock, automatically avoiding potential deadlocks.
>
> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
>
> ---
> Diff from V3: as Greg KH and Lucas Stach noticed, there was a
> behavioural change between the two versions: I used guard(spinlock),
> while the expected behaviour should have come from a spinlock_irqsave
> guard. This has been fixed.
>
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index 3df0025d12aa..4872756426dd 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
>   {
>   	struct devres_node *node;
>   	struct devres_node *tmp;
> -	unsigned long flags;
>   
>   	if (!fn)
>   		return;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> -	list_for_each_entry_safe_reverse(node, tmp,
> -			&dev->devres_head, entry) {
> +	guard(spinlock_irqsave)(&dev->devres_lock);
> +	list_for_each_entry_safe_reverse(node, tmp, &dev->devres_head, entry) {
>   		struct devres *dr = container_of(node, struct devres, node);
>   
>   		if (node->release != release)
> @@ -210,7 +208,6 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
>   			continue;
>   		fn(dev, dr->data, data);
>   	}
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   }
>   EXPORT_SYMBOL_GPL(devres_for_each_res);
>   
> @@ -243,11 +240,9 @@ EXPORT_SYMBOL_GPL(devres_free);
>   void devres_add(struct device *dev, void *res)
>   {
>   	struct devres *dr = container_of(res, struct devres, data);
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	guard(spinlock_irqsave)(&dev->devres_lock);
>   	add_dr(dev, &dr->node);
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   }
>   EXPORT_SYMBOL_GPL(devres_add);
>   
> @@ -287,11 +282,8 @@ void * devres_find(struct device *dev, dr_release_t release,
>   		   dr_match_t match, void *match_data)
>   {
>   	struct devres *dr;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	guard(spinlock_irqsave)(&dev->devres_lock);
>   	dr = find_dr(dev, release, match, match_data);
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   
>   	if (dr)
>   		return dr->data;
> @@ -318,16 +310,14 @@ void * devres_get(struct device *dev, void *new_res,
>   {
>   	struct devres *new_dr = container_of(new_res, struct devres, data);
>   	struct devres *dr;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> -	dr = find_dr(dev, new_dr->node.release, match, match_data);
> -	if (!dr) {
> -		add_dr(dev, &new_dr->node);
> -		dr = new_dr;
> -		new_res = NULL;
> +	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> +		dr = find_dr(dev, new_dr->node.release, match, match_data);
> +		if (!dr) {
> +			add_dr(dev, &new_dr->node);
> +			dr = new_dr;
> +			new_res = NULL;
> +		}
>   	}
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   	devres_free(new_res);
>   
>   	return dr->data;
> @@ -353,15 +343,13 @@ void * devres_remove(struct device *dev, dr_release_t release,
>   		     dr_match_t match, void *match_data)
>   {
>   	struct devres *dr;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> -	dr = find_dr(dev, release, match, match_data);
> -	if (dr) {
> -		list_del_init(&dr->node.entry);
> -		devres_log(dev, &dr->node, "REM");
> +	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> +		dr = find_dr(dev, release, match, match_data);
> +		if (dr) {
> +			list_del_init(&dr->node.entry);
> +			devres_log(dev, &dr->node, "REM");
> +		}
>   	}
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   
>   	if (dr)
>   		return dr->data;
> @@ -516,7 +504,6 @@ static void release_nodes(struct device *dev, struct list_head *todo)
>    */
>   int devres_release_all(struct device *dev)
>   {
> -	unsigned long flags;
>   	LIST_HEAD(todo);
>   	int cnt;
>   
> @@ -528,9 +515,9 @@ int devres_release_all(struct device *dev)
>   	if (list_empty(&dev->devres_head))
>   		return 0;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> -	cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> +	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> +		cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
> +	}
>   
>   	release_nodes(dev, &todo);
>   	return cnt;
> @@ -552,7 +539,6 @@ int devres_release_all(struct device *dev)
>   void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
>   {
>   	struct devres_group *grp;
> -	unsigned long flags;
>   
>   	grp = kmalloc(sizeof(*grp), gfp);
>   	if (unlikely(!grp))
> @@ -568,9 +554,8 @@ void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
>   	if (id)
>   		grp->id = id;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	guard(spinlock_irqsave)(&dev->devres_lock);
>   	add_dr(dev, &grp->node[0]);
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   	return grp->id;
>   }
>   EXPORT_SYMBOL_GPL(devres_open_group);
> @@ -609,17 +594,14 @@ static struct devres_group * find_group(struct device *dev, void *id)
>   void devres_close_group(struct device *dev, void *id)
>   {
>   	struct devres_group *grp;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	guard(spinlock_irqsave)(&dev->devres_lock);
>   
>   	grp = find_group(dev, id);
>   	if (grp)
>   		add_dr(dev, &grp->node[1]);
>   	else
>   		WARN_ON(1);
> -
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
>   }
>   EXPORT_SYMBOL_GPL(devres_close_group);
>   
> @@ -635,19 +617,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
>   void devres_remove_group(struct device *dev, void *id)
>   {
>   	struct devres_group *grp;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> -
> -	grp = find_group(dev, id);
> -	if (grp) {
> -		list_del_init(&grp->node[0].entry);
> -		list_del_init(&grp->node[1].entry);
> -		devres_log(dev, &grp->node[0], "REM");
> -	} else
> -		WARN_ON(1);
>   
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> +	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> +		grp = find_group(dev, id);
> +		if (grp) {
> +			list_del_init(&grp->node[0].entry);
> +			list_del_init(&grp->node[1].entry);
> +			devres_log(dev, &grp->node[0], "REM");
> +		} else
> +			WARN_ON(1);
> +	}
>   
>   	kfree(grp);
>   }
> @@ -668,11 +647,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
>   int devres_release_group(struct device *dev, void *id)
>   {
>   	struct devres_group *grp;
> -	unsigned long flags;
>   	LIST_HEAD(todo);
>   	int cnt = 0;
>   
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	guard(spinlock_irqsave)(&dev->devres_lock);
>   
>   	grp = find_group(dev, id);
>   	if (grp) {
> @@ -683,12 +661,9 @@ int devres_release_group(struct device *dev, void *id)
>   			end = grp->node[1].entry.next;
>   
>   		cnt = remove_nodes(dev, first, end, &todo);
> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
> -
>   		release_nodes(dev, &todo);
>   	} else {
>   		WARN_ON(1);
> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
>   	}
>   
>   	return cnt;
> @@ -860,7 +835,6 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
>   {
>   	size_t total_new_size, total_old_size;
>   	struct devres *old_dr, *new_dr;
> -	unsigned long flags;
>   
>   	if (unlikely(!new_size)) {
>   		devm_kfree(dev, ptr);
> @@ -906,20 +880,17 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
>   	 * The spinlock protects the linked list against concurrent
>   	 * modifications but not the resource itself.
>   	 */
> -	spin_lock_irqsave(&dev->devres_lock, flags);
> +	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
> +		old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
> +		if (!old_dr) {
> +			kfree(new_dr);
> +			WARN(1, "Memory chunk not managed or managed by a different device.");
> +			return NULL;
> +		}
>   
> -	old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
> -	if (!old_dr) {
> -		spin_unlock_irqrestore(&dev->devres_lock, flags);
> -		kfree(new_dr);
> -		WARN(1, "Memory chunk not managed or managed by a different device.");
> -		return NULL;
> +		replace_dr(dev, &old_dr->node, &new_dr->node);
>   	}
>   
> -	replace_dr(dev, &old_dr->node, &new_dr->node);
> -
> -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> -
>   	/*
>   	 * We can copy the memory contents after releasing the lock as we're
>   	 * no longer modifying the list links.
