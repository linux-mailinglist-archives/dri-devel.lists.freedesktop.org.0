Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E287F6C74
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 07:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF9210E2E7;
	Fri, 24 Nov 2023 06:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586B10E2E7;
 Fri, 24 Nov 2023 06:43:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-332ce50450dso974133f8f.1; 
 Thu, 23 Nov 2023 22:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700808237; x=1701413037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pM+/h9Co8SjkLd9Igncj0NF1FqghL66ToHBhvvebQBc=;
 b=aVNm6SAMZFJloynVRH/pS+di8jnJiTUqyR3H6GIBHxV8kX+JGfTJA026ZbZunGnB/U
 ylHbCrDYSFSCyPha79mw9KADa+A8bRDSQDlQ2k8quJEGCwQbdCnwQz4KACIxyz4qmtjc
 UrMgUJhkUQr2GHZDgjQHI2ex66Q8rqpbJYN+52ZDd8BTf1lUGkgsaHrKs/sHQQMkkMJ8
 zhl/uwd1zOLXWWTsFN1ResGEaAUlTpXzX0gsyLqwD+sgKLx9vVH1VU7GWJTeWUOuFQt+
 /Jqpz9SCEwtu0Sps505ODc/eSq4HA1XpjzvIPhXEmOAzAGCZgB72+dr81KxMOC0vT68d
 hYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700808237; x=1701413037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pM+/h9Co8SjkLd9Igncj0NF1FqghL66ToHBhvvebQBc=;
 b=on+Hydwdt/LfCnfl7bbBb+m+zKPd5BeonRX1YC43givqkkkUdsTpEjaZBzq+7+9VEc
 Twd1pi7H//m2Fs33GKQqxmhC65ysFzfdJ4lwC/jjszsZQYQBvTlIojF/O+SeYW9M5VvX
 Bvf8JZPVBR3KgDCkrwW9k9+ThJ05Oy7vs9a6eVyuM8c4jfK4fB7IPHj/M0CO9ZBZjjhZ
 VaBo5UrS0L/lForQyqjzdqRXm2DWkQzD7C3RrYJ8GbcTfrjcy4cd4pDShIPHrtAiudQc
 03sD/M0/c4GoU1fMZxRzB2seiuc+rqSK2DWpsq6wz9NgQT7pS9pZMI4OUuGATWLnq5hG
 p4Ww==
X-Gm-Message-State: AOJu0YzZl54a2LWf9Y8yvO2mFO95LKqfy7FmW73+zyoa8wPwvRyiypaf
 L21JPBiKe111wXHt4AmM2aA=
X-Google-Smtp-Source: AGHT+IHjgor7iE1uOggBwcoRUHwr7VTC6Ou5ytb+vu0r3QSNoLqnP1i2RjdOYKGbUENidKbG9QjYWw==
X-Received: by 2002:a05:6000:b8f:b0:332:c409:2c80 with SMTP id
 dl15-20020a0560000b8f00b00332c4092c80mr1237964wrb.48.1700808237092; 
 Thu, 23 Nov 2023 22:43:57 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056000180600b00332e73f8231sm1795851wrh.39.2023.11.23.22.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 22:43:56 -0800 (PST)
Message-ID: <e5086e55-814c-4db8-b708-9e1701c1fc6b@gmail.com>
Date: Fri, 24 Nov 2023 07:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.23 um 20:36 schrieb Felix Kuehling:
> [+Alex]
>
> On 2023-11-17 16:44, Felix Kuehling wrote:
>
>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>
>> These helper functions are needed for KFD to export and import DMABufs
>> the right way without duplicating the tracking of DMABufs associated 
>> with
>> GEM objects while ensuring that move notifier callbacks are working as
>> intended.
>>
>> CC: Christian König <christian.koenig@amd.com>
>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Re: our discussion about v2 of this patch: If this version is 
> acceptable, can I get an R-b or A-b?

 From my side feel free to add my Acked-by, I don't see how else you 
want to cleanly export DMA-bufs.

Regards,
Christian.

>
> I would like to get this patch into drm-next as a prerequisite for 
> patches 2 and 3. I cannot submit it to the current 
> amd-staging-drm-next because the patch I'm reverting doesn't exist 
> there yet.
>
> Patch 2 and 3 could go into drm-next as well, or go through Alex's 
> amd-staging-drm-next branch once patch 1 is in drm-next. Alex, how do 
> you prefer to coordinate this?
>
> Regards,
>   Felix
>
>
>> ---
>>   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>   include/drm/drm_prime.h     |  7 +++++++
>>   2 files changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 63b709a67471..834a5e28abbe 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>>   }
>>   EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>   -/*
>> +/**
>>    * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>>    * @dev: drm_device to import into
>>    * @file_priv: drm file-private structure
>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>    *
>>    * Returns 0 on success or a negative error code on failure.
>>    */
>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> -                      struct drm_file *file_priv, int prime_fd,
>> -                      uint32_t *handle)
>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> +                   struct drm_file *file_priv, int prime_fd,
>> +                   uint32_t *handle)
>>   {
>>       struct dma_buf *dma_buf;
>>       struct drm_gem_object *obj;
>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct 
>> drm_device *dev,
>>       dma_buf_put(dma_buf);
>>       return ret;
>>   }
>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>     int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>                    struct drm_file *file_priv)
>> @@ -408,7 +409,7 @@ static struct dma_buf 
>> *export_and_register_object(struct drm_device *dev,
>>       return dmabuf;
>>   }
>>   -/*
>> +/**
>>    * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>>    * @dev: dev to export the buffer from
>>    * @file_priv: drm file-private structure
>> @@ -421,10 +422,10 @@ static struct dma_buf 
>> *export_and_register_object(struct drm_device *dev,
>>    * The actual exporting from GEM object to a dma-buf is done 
>> through the
>>    * &drm_gem_object_funcs.export callback.
>>    */
>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> -                      struct drm_file *file_priv, uint32_t handle,
>> -                      uint32_t flags,
>> -                      int *prime_fd)
>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> +                   struct drm_file *file_priv, uint32_t handle,
>> +                   uint32_t flags,
>> +                   int *prime_fd)
>>   {
>>       struct drm_gem_object *obj;
>>       int ret = 0;
>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct 
>> drm_device *dev,
>>         return ret;
>>   }
>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>     int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>                    struct drm_file *file_priv)
>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>    * @obj: GEM object to export
>>    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>    *
>> - * This is the implementation of the &drm_gem_object_funcs.export 
>> functions
>> - * for GEM drivers using the PRIME helpers. It is used as the 
>> default for
>> - * drivers that do not set their own.
>> + * This is the implementation of the &drm_gem_object_funcs.export 
>> functions for GEM drivers
>> + * using the PRIME helpers. It is used as the default in
>> + * drm_gem_prime_handle_to_fd().
>>    */
>>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>                        int flags)
>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>    * @dev: drm_device to import into
>>    * @dma_buf: dma-buf object to import
>>    *
>> - * This is the implementation of the gem_prime_import functions for GEM
>> - * drivers using the PRIME helpers. It is the default for drivers 
>> that do
>> - * not set their own &drm_driver.gem_prime_import.
>> + * This is the implementation of the gem_prime_import functions for 
>> GEM drivers
>> + * using the PRIME helpers. Drivers can use this as their
>> + * &drm_driver.gem_prime_import implementation. It is used as the 
>> default
>> + * implementation in drm_gem_prime_fd_to_handle().
>>    *
>>    * Drivers must arrange to call drm_prime_gem_destroy() from their
>>    * &drm_gem_object_funcs.free hook when using this function.
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index a7abf9f3e697..2a1d01e5b56b 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>     struct drm_device;
>>   struct drm_gem_object;
>> +struct drm_file;
>>     /* core prime functions */
>>   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>                         struct dma_buf_export_info *exp_info);
>>   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>   +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> +                   struct drm_file *file_priv, int prime_fd, 
>> uint32_t *handle);
>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> +                   struct drm_file *file_priv, uint32_t handle, 
>> uint32_t flags,
>> +                   int *prime_fd);
>> +
>>   /* helper functions for exporting */
>>   int drm_gem_map_attach(struct dma_buf *dma_buf,
>>                  struct dma_buf_attachment *attach);

