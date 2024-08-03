Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5794675A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2024 06:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6246610E08C;
	Sat,  3 Aug 2024 04:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cJO7o1Ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00310E08C
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2024 04:24:01 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5c661e75ff6so5915942eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 21:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722659040; x=1723263840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XheisaESTEudpbi3rO/WWYBhJwYeNAh4Hr324gZmrNU=;
 b=cJO7o1AbFnFGxJcjPArmBjZqZw7rGkBwhNRKmRWHZ3NKOh3qkMCjju9ssTUhMF+gNT
 oOhYMqUXEsturxGb0lqE6K2za6F80hpsr3ocVEmYp7rVvEtl1Y/Su+foe1UNHvGFU+No
 Mzepedo8bSSSBc7jJbQRPZyovRzhSPgMgzbJ5mAYpMY7jybndY7gT4E7FBwIlsUBm20O
 fIo5/OFWWgrvck0CMm0hxUCt1g5B4+X+d//mC0ddxep+c7fY3w4S9y3JfSc8Xoyrcsrh
 8McYP7WH0p3WQpujixYb9y+i6PrVp9gc4PiQzvqMXu9wgquZN3kc+o41hpgMkGSfEOce
 onfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722659040; x=1723263840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XheisaESTEudpbi3rO/WWYBhJwYeNAh4Hr324gZmrNU=;
 b=SYN6o7AlLG+L+8bRVRRBXWon7QiynppuaP3TkO7dvFA1Gvc21njuaY1dIMsyY52eSm
 gmXHMFTMwqEx2XAcqL95BRZ8H/jGwVZ+kkcFrrXzGnfsnDcnHcTouO8C2zoUpOG1TvWl
 iIpy9g36pT2c7HDPcVlpVgFYpS/cQJTsshb71/FyxnECyGveKNBibj1ZRJTG8PmaYnLY
 S0KcOv2QZCbeD4xYCNJ6YIpB6avEbfXO2ZpIRfy+LNc7dMvqZutFQLBl2VsQ7zVeo7dr
 91iOfGd1dysGFVBcdhaJUKJZpUd2kHP6EnF8hfD39L389JHvG6DfeJPvblw4/xqY2dpz
 GOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8BRRkftts80IsGG3aNQUxfxuND0sPgtK5HU6h2nmJPvKja5cmxi195TiLyi9qf8tLLKmiMn8LhDigm4OX8geCnDGgywTUqZt6bjXxPYNx
X-Gm-Message-State: AOJu0Yyz0PUDDt1JX8IoV/KdihYVwDBg8vuPg6GnthbqrpkUWX5CwcvC
 C4r9DRrfS//OGn6t8BwmD0fDYmP2QUffc4ZzhKNGoeZiWr9M07BF5bzy+PhGsrE=
X-Google-Smtp-Source: AGHT+IEhe7YsubngD93lp7hk+e4p2ONzcD+teDCo40j5gj0QLHG1gPkMMTeH6J6MEwjI5GGBN+DNRg==
X-Received: by 2002:a05:6820:221e:b0:5d6:79a:c4d6 with SMTP id
 006d021491bc7-5d6636d2bfamr7653033eaf.3.1722659040377; 
 Fri, 02 Aug 2024 21:24:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5d7571789fesm707877eaf.1.2024.08.02.21.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 21:23:59 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:23:57 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Document mutex in
 vme_dma_resource structure
Message-ID: <1e74a5ef-7d15-451e-8cb8-2743ef95089a@suswa.mountain>
References: <20240803001814.7752-1-riyandhiman14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803001814.7752-1-riyandhiman14@gmail.com>
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

On Sat, Aug 03, 2024 at 05:48:14AM +0530, Riyan Dhiman wrote:
> Adhere to Linux kernel coding style
> 
> Reported by checkpatch:
> 
> CHECK: mutex definition without comment
> 
> Proof for comment:
> 
> 1. The mutex is used to protect access to the 'running' list
> (line 1798 tsi148_dma_list_exec function)
> 	mutex_lock(&ctrlrl->mtx);
> 	if (!list_empty(&ctrlr->running)) {
> 		mutex_unlock(&ctrlr->mtx);
> 		return -EBUSY;
> 	}

Why did you chop out the "channel = ctrlr->number;" line?  That code
looks like this:

drivers/staging/vme_user/vme_tsi148.c
  1798          mutex_lock(&ctrlr->mtx);
  1799  
  1800          channel = ctrlr->number;
  1801  
  1802          if (!list_empty(&ctrlr->running)) {
  1803                  /*
  1804                   * XXX We have an active DMA transfer and currently haven't
  1805                   *     sorted out the mechanism for "pending" DMA transfers.
  1806                   *     Return busy.
  1807                   */
  1808                  /* Need to add to pending here */
  1809                  mutex_unlock(&ctrlr->mtx);
  1810                  return -EBUSY;
  1811          }
  1812  
  1813          list_add(&list->list, &ctrlr->running);


The first line after we take a lock and the last line before we drop
the lock are hopefully chosen because they need to be protected by the
lock.

>   This prevents race conditions when multiple threads attempt to start DMA
>   operations simultaneously.
> 
> 2. It's also used when removing DMA list from running list:
> (line 1862 tsi148_dma_list_exec function)
> 	mutex_lock(&ctrlr->mtx);
> 	list_del(&list->list);
> 	mutex_unlock(&ctrlr->mtx);
>   Ensuring thread-safe modification of the controller's state.
> 
> Without this mutex, concurrent access to the DMA controller's state could
> lead to data corruption or inconsistant state.
>

It's also used in drivers/staging/vme_user/vme.c
What you should do is rename the mutex from mtx to XXX_mtx and then
rename all the places where it is used.  Keep renaming until the driver
builds.

XXX_mtx is obviously not the correct name.  But "mtx" is vague and
useless.  There are 3 other locks in this header file which have the
same name so not only is it useless as a descriptive name, it's also
useless for searching.

Since you say that it is "protect access to the 'running' list", then
that means you need to check all the places where the running list is
accessed and ensure that the lock is held.  Or if it's not, what makes
that thread safe?

These comments are supposed to help us understand the locking but it
feels like we have a long way to go before it's fully understood.

> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
>  drivers/staging/vme_user/vme_bridge.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index 9bdc41bb6602..bb3750b40eb1 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -61,6 +61,7 @@ struct vme_dma_list {
>  struct vme_dma_resource {
>  	struct list_head list;
>  	struct vme_bridge *parent;
> +	/* Mutex to protect DMA controller resources and ensure thread-safe operations */

"resources" is too vague.  "ensure thread-safe operations" is obvious
and doesn't need to be said.

regards,
dan carpenter

