Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE2402393
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390CA894FF;
	Tue,  7 Sep 2021 06:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430E894FF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:46:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b6so12807251wrh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 23:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Nx2PNTO1YHFoXZZxRMnydn4sjqSGxiSwf95PhaqI9Hw=;
 b=ngI7vI2isQQc5W1Qz4hoRem7qRV9s8htgljBRtnUuEHRTZiR6KdJRscNiRtgl1/Sbv
 sNbGUpMiJ9weEU3NYDuEHqUUaMhw5tZnf73Z1OqUvtw+iaeqxMdhWhZ6tYaox2XwALz6
 MOUbN6Un3tdgK4l5dMOjzuyBpbTn6evU+GjQXEQy0drgaTMfB6LfgBHdNwk9mimerbFD
 PiMRfWKUFoHm9ViwS04HNuK6vRa+oTTWrqMgS7Cv8PwnYShZONPIJoB6d8ufvsQKUxeQ
 Z91LHHhCf/SwLk7sKjBur7w8oNK5z2cAFecsGW1eJpy6Tr4njbs2tPXioKmwqHYZmo11
 MtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nx2PNTO1YHFoXZZxRMnydn4sjqSGxiSwf95PhaqI9Hw=;
 b=ubUupewPc1gt3pNwXnLs314WRgI1YYG45TgjEoRx4nuIN9jNFxmwzwGRCp4EkimLPH
 7+wtME9HhAC58Ays/8g6YT1hLGcGOWcIz4rVhLZrnZg9F4I2z6EjOdWb7UYreajw6JH4
 B0l3o7HkAWJE+uMUK5ewzcCCnNDV6pT1eparGZcTdj6JoU8cmfmubw/yH8p3xTTaApu/
 jY1KHUFMuabbhGvQBLlV9250oOA0f/HBR8sI7zfBN/hGtwYBiToVIfHdTMUN55TFLN3X
 xjoFsc/wuIfA2tJETUS0Fda2ZAX/7X5DHVXli6BEDISGQjl5FPGIF92XBfGhJZ0y5HEd
 mW7A==
X-Gm-Message-State: AOAM530nMekoNu6Zgf5vtFqcc549cF+wDC+zJlW0f7hxJE+aa0+76YkX
 HCO/512YIkqO1CjzMPOqYyqVUbbmN7K+zglV
X-Google-Smtp-Source: ABdhPJwc0s+JAA3msxE00H/4vz5G1BP2/v0Ehz+8BSb24ie+DbpESNNXQp4v9wMM5I0b3RNRRpwDBg==
X-Received: by 2002:a05:6000:34e:: with SMTP id
 e14mr16782553wre.401.1630997191195; 
 Mon, 06 Sep 2021 23:46:31 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id x11sm10071853wro.83.2021.09.06.23.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:46:30 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/ttm: remove the outdated kerneldoc section
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20210903123123.116575-1-christian.koenig@amd.com>
 <CAM0jSHMdNUbbE2EzFnpfaVJn6gg2JEiPUL=qV2STmgEtfoEsjQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bcdd369c-bef3-4b39-40a9-a5dc3fc85147@gmail.com>
Date: Tue, 7 Sep 2021 08:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMdNUbbE2EzFnpfaVJn6gg2JEiPUL=qV2STmgEtfoEsjQ@mail.gmail.com>
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



Am 03.09.21 um 16:22 schrieb Matthew Auld:
> On Fri, 3 Sept 2021 at 13:31, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Clean up to start over with new and more accurate documentation.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> For the series,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks.

>
> We could maybe also bring in ttm_pool.[ch]? It looks like it already
> has near complete kernel-doc?

Yes, just didn't had time to cleanup the remaining fallout yet.

The last and most important remaining beast is the BO documentation, but 
that will still take a while.

Regards,
Christian.

>
>> ---
>>   Documentation/gpu/drm-mm.rst | 49 ------------------------------------
>>   1 file changed, 49 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 0198fa43d254..8ca981065e1a 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -30,55 +30,6 @@ The Translation Table Manager (TTM)
>>
>>   TTM design background and information belongs here.
>>
>> -TTM initialization
>> -------------------
>> -
>> -    **Warning**
>> -    This section is outdated.
>> -
>> -Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
>> -<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
>> -initialized global reference to the memory manager.  The ttm_bo_driver
>> -structure contains several fields with function pointers for
>> -initializing the TTM, allocating and freeing memory, waiting for command
>> -completion and fence synchronization, and memory migration.
>> -
>> -The :c:type:`struct drm_global_reference <drm_global_reference>` is made
>> -up of several fields:
>> -
>> -.. code-block:: c
>> -
>> -              struct drm_global_reference {
>> -                      enum ttm_global_types global_type;
>> -                      size_t size;
>> -                      void *object;
>> -                      int (*init) (struct drm_global_reference *);
>> -                      void (*release) (struct drm_global_reference *);
>> -              };
>> -
>> -
>> -There should be one global reference structure for your memory manager
>> -as a whole, and there will be others for each object created by the
>> -memory manager at runtime. Your global TTM should have a type of
>> -TTM_GLOBAL_TTM_MEM. The size field for the global object should be
>> -sizeof(struct ttm_mem_global), and the init and release hooks should
>> -point at your driver-specific init and release routines, which probably
>> -eventually call ttm_mem_global_init and ttm_mem_global_release,
>> -respectively.
>> -
>> -Once your global TTM accounting structure is set up and initialized by
>> -calling ttm_global_item_ref() on it, you need to create a buffer
>> -object TTM to provide a pool for buffer object allocation by clients and
>> -the kernel itself. The type of this object should be
>> -TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
>> -ttm_bo_global). Again, driver-specific init and release functions may
>> -be provided, likely eventually calling ttm_bo_global_ref_init() and
>> -ttm_bo_global_ref_release(), respectively. Also, like the previous
>> -object, ttm_global_item_ref() is used to create an initial reference
>> -count for the TTM, which will call your initialization function.
>> -
>> -See the radeon_ttm.c file for an example of usage.
>> -
>>   The Graphics Execution Manager (GEM)
>>   ====================================
>>
>> --
>> 2.25.1
>>

