Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EF400054
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BCC6E892;
	Fri,  3 Sep 2021 13:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F9A6E892
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:17:11 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id w17so4436562qta.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sfsrFXWULnWF8L5qk6neEdUYFV87D6epieAYX+CCHp4=;
 b=AAfZ8wB4vFL27eInDLJPF3UvP1DvFQ23YwIxkEAHnnnbAV2C9ARlZTufJ23+w/PCFW
 3JuWPWNIwGkoh5omVGIoJ8rLUNehxlkC6gxGPC0Nt+ggN7puJGTN5I8W2Mh0QbAhoa+q
 ElI/WdGMPaZhXlDufxHz40qMeYoRUTqncyr/cb6Sw6YB1HPr5CGUJJfdDDXU7Fhu35WG
 uycNXEstfRNKjIiUUg4mLPhcvzSM02qJU3A3lKtnn+rQAMAAeCZ42wTVbZHXpBwQkLkV
 FsYn6i+BAThD22uLz8ZnOCnL/z7xU8p0G0Eg7Rr69zBkT77sM85PQ44yN7SJHCoUE9ts
 xquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sfsrFXWULnWF8L5qk6neEdUYFV87D6epieAYX+CCHp4=;
 b=t+xW8OQfnviXvtoa4xyKEJ+Ne1MxDQvaCxyDDQvC0mdp0p8o5bmdnbRzlLIps79CsC
 8VV+ZMU9k/YCwRmB1nJEcr76OlpbtSQy3v/kCMX7fAPXRkGaHm0aLKuKwFbpZCRcyCOr
 BEFgkSRD5Z033+KWN9Jz18nLynNojo1J+tg5E7timH2fR+fnx2FKJmVcKSkLj/3cINPp
 tGZcnv2vqPRRJoaWhlrDNxAtvVrgFALhay76w/E1suepY0vHcrU/5WLTl/RKm0kqeCc+
 DdO/iC8JQujvGRVAo3ijbnanoUNFLnQJRaRdk5Tdo0thzyNe33AeRzgm/zGMP1/0/KWB
 k22g==
X-Gm-Message-State: AOAM533nndI7+LdXU2TKRQcnVOtsntU+DiDx/gRomK3XKb/d9BEahnZm
 VQ55KExqe/gxFTfnyUdW+gl2hcS5o86UKi7q6A/MY9iwDP4=
X-Google-Smtp-Source: ABdhPJzhg25G0o/BqhSQUQTboMLr+gVP5wvODA9BDLgj/ZY2CvyqK3mXNh2MVEyBoOLd4ziZjxddComD1lJPM6SpSWs=
X-Received: by 2002:a05:622a:1a9b:: with SMTP id
 s27mr3684654qtc.165.1630675030312; 
 Fri, 03 Sep 2021 06:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210903123123.116575-1-christian.koenig@amd.com>
 <20210903123123.116575-2-christian.koenig@amd.com>
In-Reply-To: <20210903123123.116575-2-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 3 Sep 2021 14:16:42 +0100
Message-ID: <CAM0jSHOfiW02WXX-Z93iNZwkoL+pZKfYTBJuxbj6bbQfGuj4rA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/ttm: enable TTM device object kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 3 Sept 2021 at 13:31, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the remaining warnings, switch to inline structure documentation
> and finally enable this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst |  9 +++++
>  include/drm/ttm/ttm_device.h | 73 +++++++++++++++++++++---------------
>  2 files changed, 51 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 8ca981065e1a..56b7b581567d 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -30,6 +30,15 @@ The Translation Table Manager (TTM)
>
>  TTM design background and information belongs here.
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

Would it be reasonable to move the ttm_global_mutex into ttm_global
here? That way everything is nicely grouped together, and we can
easily reference it here with @mutex or so?

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
>          */
>         struct delayed_work wq;
>  };
> --
> 2.25.1
>
