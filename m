Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B540238C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E6089CC9;
	Tue,  7 Sep 2021 06:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAD389CC9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:41:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g16so773394wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RYT+OS6vegBOvHTWdGJy8tRPWJIboAB9V4B+lVt8/5Y=;
 b=ogsf/Eh4KHXpovYkE24ogR+OcoLo+T9b7oC1zHtpy6hytRG3dMWLtZWEw5k7apDXCQ
 1d9wgRJRIt/t8QhxiI3QRJnD90ftdpmSCpBqUMP4iUrY/AHdOgMogztpj3mapOrLz0ro
 7Zjksg8OgQNCLde9+SfK6KHhqX8z58PyLmfYoD6821TV5ITyj7cJiZHpRCUF3bH7ZdXL
 kmC4cvJu62lOGueaeS71rQLyP/hkh6eywLq8TdZhR4FByJTBwJ80IFvR5qtD+0aldbry
 7VNEtbnE7iKBjSrrC9tMzqy/uapt8OFwCSPUg9CpO/LEbllYqKw5h16l1SlR/riuDFpG
 0/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RYT+OS6vegBOvHTWdGJy8tRPWJIboAB9V4B+lVt8/5Y=;
 b=ounjk0OK7igLG+KAnDYt4NQOoQk3ZF1Dis6bxSFbrorb6I2hd1yojRGT+VGw4LGdHg
 9Oa/maVRf/Ec7V/seU/YCufb0Q+ADLoJjJaHZ4m9rXldgGxywykQYagN3Wfw5pGZq4TS
 8DgCKwrm/E1ruVZJcdfl9+kJDEjOJq7Sh3UbmfSDwzonTLC+Y5s5PbNwMSG8mYEYTruW
 vfmgIEuPa3I+5f//5aZPC50IKtBO9LzGjyf9kZP6Nun5n1OVCUH78r4Rf7Ra7tnZSdMR
 0lF/hKF39uUaZG1o7AqWQPgk2iNMx5+864uYAc5LGPd6FxPJhvQZoc1ziKYDUOt9U66k
 CGag==
X-Gm-Message-State: AOAM530i6cMVgYD1xSNnEOt/XfFJXv1GaCKtqHhrtEVCQZd4Jo4IQamr
 vtUGxU5PRsJlF+685uXkgWAeAMRHVzeNb6p9
X-Google-Smtp-Source: ABdhPJzUyKYASuwLicxM5UrvH/Tkad2B8r6OLT3QuGnclPMUEt137N/PGFoNa5POy0SuT0IgIV7//g==
X-Received: by 2002:a05:6000:1603:: with SMTP id
 u3mr16687517wrb.227.1630996918156; 
 Mon, 06 Sep 2021 23:41:58 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id e9sm10550897wrd.69.2021.09.06.23.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:41:57 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/ttm: enable TTM device object kerneldoc
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20210903123123.116575-1-christian.koenig@amd.com>
 <20210903123123.116575-2-christian.koenig@amd.com>
 <CAM0jSHOfiW02WXX-Z93iNZwkoL+pZKfYTBJuxbj6bbQfGuj4rA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <227f3300-1e22-06a3-37bd-2b6e21b3a5b5@gmail.com>
Date: Tue, 7 Sep 2021 08:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOfiW02WXX-Z93iNZwkoL+pZKfYTBJuxbj6bbQfGuj4rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 03.09.21 um 15:16 schrieb Matthew Auld:
> On Fri, 3 Sept 2021 at 13:31, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Fix the remaining warnings, switch to inline structure documentation
>> and finally enable this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/gpu/drm-mm.rst |  9 +++++
>>   include/drm/ttm/ttm_device.h | 73 +++++++++++++++++++++---------------
>>   2 files changed, 51 insertions(+), 31 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 8ca981065e1a..56b7b581567d 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -30,6 +30,15 @@ The Translation Table Manager (TTM)
>>
>>   TTM design background and information belongs here.
>>
>> +TTM device object reference
>> +---------------------------
>> +
>> +.. kernel-doc:: include/drm/ttm/ttm_device.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
>> +   :export:
>> +
>>   The Graphics Execution Manager (GEM)
>>   ====================================
>>
>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>> index 07d722950d5b..0b31ec731e66 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -39,31 +39,23 @@ struct ttm_operation_ctx;
>>
>>   /**
>>    * struct ttm_global - Buffer object driver global data.
>> - *
>> - * @dummy_read_page: Pointer to a dummy page used for mapping requests
>> - * of unpopulated pages.
>> - * @shrink: A shrink callback object used for buffer object swap.
>> - * @device_list_mutex: Mutex protecting the device list.
>> - * This mutex is held while traversing the device list for pm options.
>> - * @lru_lock: Spinlock protecting the bo subsystem lru lists.
>> - * @device_list: List of buffer object devices.
>> - * @swap_lru: Lru list of buffer objects used for swapping.
>>    */
>>   extern struct ttm_global {
>>
>>          /**
>> -        * Constant after init.
>> +        * @dummy_read_page: Pointer to a dummy page used for mapping requests
>> +        * of unpopulated pages. Constant after init.
>>           */
>> -
>>          struct page *dummy_read_page;
>>
>>          /**
>> -        * Protected by ttm_global_mutex.
>> +        * @device_list: List of buffer object devices. Protected by
>> +        * ttm_global_mutex.
> Would it be reasonable to move the ttm_global_mutex into ttm_global
> here? That way everything is nicely grouped together, and we can
> easily reference it here with @mutex or so?

To be honest I'm in the process of decomposing the global structure. 
Those are essentially static information which can be kept inside the 
ttm_device.c file.

The only reason we had it in the first place was because we leaked the 
BO count and device list into other parts of TTM and even the driver.

Regards,
Christian.

>
>>           */
>>          struct list_head device_list;
>>
>>          /**
>> -        * Internal protection.
>> +        * @bo_count: Number of buffer objects allocated by devices.
>>           */
>>          atomic_t bo_count;
>>   } ttm_glob;
>> @@ -230,50 +222,69 @@ struct ttm_device_funcs {
>>
>>   /**
>>    * struct ttm_device - Buffer object driver device-specific data.
>> - *
>> - * @device_list: Our entry in the global device list.
>> - * @funcs: Function table for the device.
>> - * @sysman: Resource manager for the system domain.
>> - * @man_drv: An array of resource_managers.
>> - * @vma_manager: Address space manager.
>> - * @pool: page pool for the device.
>> - * @dev_mapping: A pointer to the struct address_space representing the
>> - * device address space.
>> - * @wq: Work queue structure for the delayed delete workqueue.
>>    */
>>   struct ttm_device {
>> -       /*
>> +       /**
>> +        * @device_list: Our entry in the global device list.
>>           * Constant after bo device init
>>           */
>>          struct list_head device_list;
>> +
>> +       /**
>> +        * @funcs: Function table for the device.
>> +        * Constant after bo device init
>> +        */
>>          struct ttm_device_funcs *funcs;
>>
>> -       /*
>> +       /**
>> +        * @sysman: Resource manager for the system domain.
>>           * Access via ttm_manager_type.
>>           */
>>          struct ttm_resource_manager sysman;
>> +
>> +       /**
>> +        * @man_drv: An array of resource_managers.
>> +        */
>>          struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
>>
>>          /*
>>           * Protected by internal locks.
>>           */
>> +
>> +       /**
>> +        * @vma_manager: Address space manager for finding BOs to mmap.
>> +        */
>>          struct drm_vma_offset_manager *vma_manager;
>> +
>> +       /**
>> +        * @pool: page pool for the device.
>> +        */
>>          struct ttm_pool pool;
>>
>> -       /*
>> -        * Protection for the per manager LRU and ddestroy lists.
>> +       /**
>> +        * @lru_lock: Protection for the per manager LRU and ddestroy lists.
>>           */
>>          spinlock_t lru_lock;
>> +
>> +       /**
>> +        * @ddestroy: Destroyed but not yet cleaned up buffer objects.
>> +        */
>>          struct list_head ddestroy;
>> +
>> +       /**
>> +        * @pinned: Buffer object which are pinned and so not on any LRU list.
>> +        */
>>          struct list_head pinned;
>>
>> -       /*
>> -        * Protected by load / firstopen / lastclose /unload sync.
>> +       /**
>> +        * @dev_mapping: A pointer to the struct address_space for invalidating
>> +        * CPU mappings on buffer move. Protected by load/unload sync.
>>           */
>>          struct address_space *dev_mapping;
>>
>> -       /*
>> -        * Internal protection.
>> +       /**
>> +        * @wq: Work queue structure for the delayed delete workqueue. Has
>> +        * internal protection.
>>           */
>>          struct delayed_work wq;
>>   };
>> --
>> 2.25.1
>>

