Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BC402BC9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9221893BC;
	Tue,  7 Sep 2021 15:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9EB893BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:28:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w19so13232757oik.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cl9HU1Ca9qTyAvB30kmJCpXTlYSwL6ELFL2u3X00hrc=;
 b=hpCpXQGLB7AcYGifL4mhTIEPA8QqC9BO3s5qSnzW0lFHFZy5eKAxBeyO9tVJ4jPbPE
 hk8WRuV7Ve1YEg4xYPhU1+nkW63ciIsVU5QPqz1wlckGi8f2ZlnQlkfnCtJA9sahdUEu
 7NCMPY8CP66xQQVGsnPJzChtEh2imTpbiUzwT+WPCaIS/SMO9iobc/qQugApfOjvvgaZ
 srxUfhJfRpHyH0BduDhIzxRMQ1caxEqNWtbja55BlI5xT1+yGJHTOxLT1wpFeFunIJcz
 y3/PUPIKKHYtgQc6C9LHAFR2Ht9i4IGeSYoMNg+HmE49Hc4HIFYtYRWrqWb1vm9Uyt52
 OhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cl9HU1Ca9qTyAvB30kmJCpXTlYSwL6ELFL2u3X00hrc=;
 b=qO9IOWR3VXNzSOQTrtDGijTfhz73Xdqk4augvDyGdb72FYGTUs9M7hrTwAnhNTyOqZ
 M/5I667Z8JTdohTPvFpziDjgm3e1BW/t/YvmIsa4psFvzrN+ce+FYRTblpoHv2MQ5r3B
 m1+2hdl0Eh11P7oG4EjAKSdljxKiOfpTTzATNx3pB89oQfYJCEAQ9z4EnhaHiBIZbKST
 zQNRJzWK4ltu/r7Yy+Bzb9DT0X6F4MPJcEtqfN5qOZ3Xy0h8qIJ6MAlj0cMtvLWetDZ2
 pjOARmNjMj6hbcArEfFTjTpk/Me2qZPNyB+xfLE8k3J/mi7v4fgZkUz0Ker2p6AbTzKz
 poEA==
X-Gm-Message-State: AOAM532B5N3LonjF/Rj82MViPm7RQflznUegVathdaMo4DUKkLghdYIa
 Rl97+nxF4RZYQ6MJkGr5NNOetuqDO5suUKsMhkI=
X-Google-Smtp-Source: ABdhPJyZkLS6W3yLzKIwLUAduYy+zPsrddh7dU6Dl/uhRU8esJeXUCAAw5CSdVx0WNR3gw+Lr0tpoV9YP9MwRJp26JY=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr3377420oiv.123.1631028516318; 
 Tue, 07 Sep 2021 08:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-4-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-4-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:28:25 -0400
Message-ID: <CADnq5_MBj7dJXSuyDaCnck33Y1cWJjxFp8imFV2BMBLfrF=4KQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/ttm: enable TTM device object kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the remaining warnings, switch to inline structure documentation
> and finally enable this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  Documentation/gpu/drm-mm.rst |  9 +++++
>  include/drm/ttm/ttm_device.h | 73 +++++++++++++++++++++---------------
>  2 files changed, 51 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index f22c9f9a2c0e..3da81b7b4e71 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -34,6 +34,15 @@ The Translation Table Manager (TTM)
>  .. kernel-doc:: include/drm/ttm/ttm_caching.h
>     :internal:
>
> +TTM device object reference
> +---------------------------
> +
> +.. kernel-doc:: include/drm/ttm/ttm_device.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
> +   :export:
> +
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 07d722950d5b..0b31ec731e66 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -39,31 +39,23 @@ struct ttm_operation_ctx;
>
>  /**
>   * struct ttm_global - Buffer object driver global data.
> - *
> - * @dummy_read_page: Pointer to a dummy page used for mapping requests
> - * of unpopulated pages.
> - * @shrink: A shrink callback object used for buffer object swap.
> - * @device_list_mutex: Mutex protecting the device list.
> - * This mutex is held while traversing the device list for pm options.
> - * @lru_lock: Spinlock protecting the bo subsystem lru lists.
> - * @device_list: List of buffer object devices.
> - * @swap_lru: Lru list of buffer objects used for swapping.
>   */
>  extern struct ttm_global {
>
>         /**
> -        * Constant after init.
> +        * @dummy_read_page: Pointer to a dummy page used for mapping req=
uests
> +        * of unpopulated pages. Constant after init.
>          */
> -
>         struct page *dummy_read_page;
>
>         /**
> -        * Protected by ttm_global_mutex.
> +        * @device_list: List of buffer object devices. Protected by
> +        * ttm_global_mutex.
>          */
>         struct list_head device_list;
>
>         /**
> -        * Internal protection.
> +        * @bo_count: Number of buffer objects allocated by devices.
>          */
>         atomic_t bo_count;
>  } ttm_glob;
> @@ -230,50 +222,69 @@ struct ttm_device_funcs {
>
>  /**
>   * struct ttm_device - Buffer object driver device-specific data.
> - *
> - * @device_list: Our entry in the global device list.
> - * @funcs: Function table for the device.
> - * @sysman: Resource manager for the system domain.
> - * @man_drv: An array of resource_managers.
> - * @vma_manager: Address space manager.
> - * @pool: page pool for the device.
> - * @dev_mapping: A pointer to the struct address_space representing the
> - * device address space.
> - * @wq: Work queue structure for the delayed delete workqueue.
>   */
>  struct ttm_device {
> -       /*
> +       /**
> +        * @device_list: Our entry in the global device list.
>          * Constant after bo device init
>          */
>         struct list_head device_list;
> +
> +       /**
> +        * @funcs: Function table for the device.
> +        * Constant after bo device init
> +        */
>         struct ttm_device_funcs *funcs;
>
> -       /*
> +       /**
> +        * @sysman: Resource manager for the system domain.
>          * Access via ttm_manager_type.
>          */
>         struct ttm_resource_manager sysman;
> +
> +       /**
> +        * @man_drv: An array of resource_managers.

Might want to provide some detail as to why there are multiple
resources managers.  E.g., one per pool.

> +        */
>         struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
>
>         /*
>          * Protected by internal locks.
>          */
> +
> +       /**
> +        * @vma_manager: Address space manager for finding BOs to mmap.
> +        */
>         struct drm_vma_offset_manager *vma_manager;
> +
> +       /**
> +        * @pool: page pool for the device.
> +        */
>         struct ttm_pool pool;
>
> -       /*
> -        * Protection for the per manager LRU and ddestroy lists.
> +       /**
> +        * @lru_lock: Protection for the per manager LRU and ddestroy lis=
ts.
>          */
>         spinlock_t lru_lock;
> +
> +       /**
> +        * @ddestroy: Destroyed but not yet cleaned up buffer objects.
> +        */
>         struct list_head ddestroy;
> +
> +       /**
> +        * @pinned: Buffer object which are pinned and so not on any LRU =
list.

objects

> +        */
>         struct list_head pinned;
>
> -       /*
> -        * Protected by load / firstopen / lastclose /unload sync.
> +       /**
> +        * @dev_mapping: A pointer to the struct address_space for invali=
dating
> +        * CPU mappings on buffer move. Protected by load/unload sync.
>          */
>         struct address_space *dev_mapping;
>
> -       /*
> -        * Internal protection.
> +       /**
> +        * @wq: Work queue structure for the delayed delete workqueue. Ha=
s
> +        * internal protection.

What does internal protection imply here?

>          */
>         struct delayed_work wq;
>  };
> --
> 2.25.1
>
