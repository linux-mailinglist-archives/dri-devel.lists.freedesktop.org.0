Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA440238D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844EE89CDF;
	Tue,  7 Sep 2021 06:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8489CDF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:42:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y132so358409wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kBgQJnuXrtG8647sz/TKMZMNTnklYZGx1uXC8wVYtSc=;
 b=Bmfg2CSfWEJ5M4YKHt0upPu2g+JQ+HEqVn+/EFm/AApKxJPmSQeZN548BngZyGuuoQ
 XJ9/iPLKymUPgiptCkXKvu4vEuAsMsl2PY2QUc8gNsqZxs/E0u2XHOU+n6iSv3xJ0dnb
 3gwFEeVdiIMz/u+3yiUGJvD4LWtrR/IWRsYYS/IAsp9Of+w93VQFXU+FyuthP40NisQr
 np5xeslS9pojmfnxv6ez8f3UitdKL8SX3UPhw17FEgiczv6ib0ud57+rr8h/9o7K+YD2
 FVFhgo/mKFvVy3EsgCFgjKpCsnH9Yh7eFE42JQwrMF9/eq/ATK39xqzxW1+g9j/9eXY7
 28Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kBgQJnuXrtG8647sz/TKMZMNTnklYZGx1uXC8wVYtSc=;
 b=PPWzP477AMaV5eLGzJUbD9Wts9moGMy1BLKQTjpepqaw653jxxMFHebhMwA4cc9MWi
 zHDiR/QKlWyIWRo5FT38bkUSeZrAa4PzdGYvpSH72m2sJmIOOGImVIEaQxL1MsCx8iHA
 R9OKTXSNbB9vODLIMm5JSHkjbwouPF3aA7fDKSlY1s1bHv4TFoW1IKVmV3Tad1fsmUcf
 cv2LWQgcyco1PjUEtjZ9w7Kkf5OsIiVs2+jWWVIcDg540vRattOu9RdxVnofuB4RIkmp
 Xw1047BEUs3KtkcWuV9zoapi06l73VtK/EmSjNyOVoapOkftroiwoc2VR+g/yVzeX64D
 nImg==
X-Gm-Message-State: AOAM533ebQk/M/E2GTIbWCtMDLqFI9d+rlFgKagCX0/vVBRu5T/YiwTk
 tMi4HwwYGZRZKeOZTWkdQpqBEHxwE0uspBHA
X-Google-Smtp-Source: ABdhPJwCwzr0xKeYK76TzENZUeS31O7L2n9zxkFONTIzrT0+2bFFbMkJ5o1nnGMbRX5FQD0qvNQx1Q==
X-Received: by 2002:a05:600c:acd:: with SMTP id
 c13mr2212685wmr.28.1630996960227; 
 Mon, 06 Sep 2021 23:42:40 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id t11sm1645318wmi.23.2021.09.06.23.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:42:39 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/ttm: enable TTM resource object kerneldoc
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20210903123123.116575-1-christian.koenig@amd.com>
 <20210903123123.116575-3-christian.koenig@amd.com>
 <CAM0jSHPHs3A9x8L91kbpzs-7QvM48nEXG0Swm=QXOVAbav7MBA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ff67645d-23ad-283f-bbfe-1a9b469b93f1@gmail.com>
Date: Tue, 7 Sep 2021 08:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPHs3A9x8L91kbpzs-7QvM48nEXG0Swm=QXOVAbav7MBA@mail.gmail.com>
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

Am 03.09.21 um 15:48 schrieb Matthew Auld:
> On Fri, 3 Sept 2021 at 13:31, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Fix the last two remaining warnings and finally enable this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/gpu/drm-mm.rst   | 9 +++++++++
>>   include/drm/ttm/ttm_resource.h | 6 ++----
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 56b7b581567d..094e367130db 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -39,6 +39,15 @@ TTM device object reference
>>   .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
>>      :export:
>>
>> +TTM resource object reference
>> +-----------------------------
>> +
>> +.. kernel-doc:: include/drm/ttm/ttm_resource.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
>> +   :export:
>> +
>>   The Graphics Execution Manager (GEM)
>>   ====================================
>>
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 32c5edd9e8b5..255fc8169d9a 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -103,10 +103,7 @@ struct ttm_resource_manager_func {
>>    * struct ttm_resource_manager
>>    *
>>    * @use_type: The memory type is enabled.
>> - * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
>> - * managed by this memory type.
>> - * @gpu_offset: If used, the GPU offset of the first managed page of
>> - * fixed memory or the first managed location in an aperture.
>> + * @use_tt: If a TT object should be used for the backing store.
>>    * @size: Size of the managed region.
>>    * @func: structure pointer implementing the range manager. See above
>>    * @move_lock: lock for move fence
>> @@ -144,6 +141,7 @@ struct ttm_resource_manager {
>>    * @addr:              mapped virtual address
>>    * @offset:            physical addr
>>    * @is_iomem:          is this io memory ?
>> + * @caching:           What CPU caching should be used
> Maybe add "See enum ttm_caching" or something, so it generates a link,
> once we also add kernel-doc for that?

Good point, going to do that as well.

Thanks,
Christian.

>
>>    *
>>    * Structure indicating the bus placement of an object.
>>    */
>> --
>> 2.25.1
>>

