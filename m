Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BA87A827
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 14:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4710EDCA;
	Wed, 13 Mar 2024 13:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F75qTZGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270D410EDCA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710335912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3BiRurxlo1riaYXhUsnPPPsEO6wf+0X/9a5TiUKPKM=;
 b=F75qTZGyv2TKW21FSdGoiEA/KrzC+yUI9d316KGmzK54EzsknozVG4VWbhXDnn6AYTUpLe
 mMZlcQjZQmom+zJ+/mIMHdDLorQG3Rg0/sYMeaHZYAt6qhPRJ/RXSgKR3PswuTpLm8nAHj
 TovBlKyTswBGchinc7wcT/HhdYGtnUc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-94TJ_RV1Np26EQTsV8eEzw-1; Wed, 13 Mar 2024 09:18:30 -0400
X-MC-Unique: 94TJ_RV1Np26EQTsV8eEzw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33e8b017632so2572148f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710335909; x=1710940709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q3BiRurxlo1riaYXhUsnPPPsEO6wf+0X/9a5TiUKPKM=;
 b=Uoy8E8D7ZTwmQtHS5KvgVZaLij6KHAzaVZW+wMkvSJPek5TLClY3jqLlDZbo14VJbh
 wBXCZsQkAFOiv0fUKtuhkK9gd0HJYBhLptwvMlfecT2q5fPMa82RSq4Sb5werdJqSmRZ
 N8smhffPE63hsFLYCXlbrdUw4KCIxtaApVua6HAqS7lzZFGpVlf80guhKdKytJX76jIx
 6q5wvV0OazH1+ZKEETABHftU1nNRAALzfBzZNdsttuAFv4+OGyOQsrxNFMYulSRQ5yYE
 jARUR37dbfrrQNpfe+7z+N2EQvywERDkM9g97nbsL7bjiysIhLvnNMp18QvZd4n9p1oG
 Ou/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvIjrSiZB1bgYx4dJbuHfCz6XOTvZOe/gnRoRrkP23ukiq5zNLTv+AYYqg71zxpK0Mvi9SfECJ5B5XOh2pUVw5lIgbCou8PN0uLTgVn5sl
X-Gm-Message-State: AOJu0YzTTAN1oJLr4s5tBET68QIp0bL0xzo4zV4fJnWfmyhjzpCb4AfC
 UrBKSbKSavrbotjzVlTvDxdX3octP/T6Kn9/8v4YnHvegUBgjBGOCaarQlX8XNKHvEBLMPLLG+P
 iTMCqsYblGp2AfcCBrwZPTi+gChOa78W6/UindG7ntSI8b7R0L473BmVr93WazgIN7Q==
X-Received: by 2002:adf:cd06:0:b0:33e:96ba:2d48 with SMTP id
 w6-20020adfcd06000000b0033e96ba2d48mr1806969wrm.57.1710335909340; 
 Wed, 13 Mar 2024 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG03mWF/n4uPVLfRz7zGs3t3rSo7PgnKnW7yYFghCsbNv6wgBKlXzKHtBHcGMM+Rza5NHNSbQ==
X-Received: by 2002:adf:cd06:0:b0:33e:96ba:2d48 with SMTP id
 w6-20020adfcd06000000b0033e96ba2d48mr1806952wrm.57.1710335908945; 
 Wed, 13 Mar 2024 06:18:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 bt11-20020a056000080b00b0033e9186f043sm9117873wrb.41.2024.03.13.06.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:18:28 -0700 (PDT)
Message-ID: <1c950b9b-96dd-4fdb-9ebb-95d59156f2cc@redhat.com>
Date: Wed, 13 Mar 2024 14:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] drm/panic: Add a drm panic handler
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-1-jfalempe@redhat.com>
 <1eda30fb-1ede-4941-9169-fad667325fe0@linux.dev>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1eda30fb-1ede-4941-9169-fad667325fe0@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/03/2024 16:16, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2024/3/7 17:14, Jocelyn Falempe wrote:
>> This introduces a new drm panic handler, which displays a message when 
>> a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the 
>> kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen 
>> must be done in the kernel.
>>
>> This is a proof of concept, and works with simpledrm, mgag200, ast, 
>> and imx.
>>
>> To test it, make sure you're using one of the supported driver, and 
>> trigger a panic:
>> echo c > /proc/sysrq-trigger
>>
>> or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > 
>> /sys/kernel/debug/dri/0/drm_panic_plane_0
> 
> Yes, the whole series works for me! I have tested with drm/loongson,
> Are you willing to add a implement for drm/loongson driver?
> If you do please add the fallowing code snippet info 
> drm/loongson/lsdc_plane.c.
> Thanks you.
> 
Thanks for testing, and for enabling drm_panic on loongson.

My plan is to have a first version of drm_panic merged before adding 
more drivers. You will be able to send this patch when drm_panic is 
merged in drm-misc-next, and I will review it.

Best regards,

-- 

Jocelyn

> 
> static int
> lsdc_primary_plane_get_scanout_buffer(struct drm_plane *plane,
>                        struct drm_scanout_buffer *scanout)
> {
>      struct drm_framebuffer *fb;
> 
>      if (!plane->state || !plane->state->fb)
>          return -ENODEV;
> 
>      fb = plane->state->fb;
>      if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>          return -ENODEV;
> 
>      scanout->format = fb->format;
>      scanout->width = fb->width;
>      scanout->height = fb->height;
>      scanout->pitch = fb->pitches[0];
> 
>      return drm_gem_vmap_unlocked(fb->obj[0], &scanout->map);
> }
> 
> hook this lsdc_primary_plane_get_scanout_buffer() up to the 
> .get_scanout_buffer
> member of lsdc_primary_helper_funcs, and include the #include 
> <drm/drm_panic.h>
> Thanks you in advance!
> 

