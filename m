Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435F7BD7D6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 12:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0BF10E24F;
	Mon,  9 Oct 2023 10:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6A10E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696845707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufYQMM2zTtJe7s0CFAA4/u6w0YXBmw1++OvL3l9izZI=;
 b=cCi3d/Zn0qC5Pq2kTRnXlBFkylJd6IA4VYxldoPaLO5TltvR8IqQ6D3ID+Cgarv9BZE1Z9
 y9VT96EnT8PMVlZXIpI7xBzPA6n/LoVo5w0x5cFeZHYlfYoR3/RCxVqOaHp7DdBJTy9/jd
 j+56ke5/SoOLjk3kE6SdumDwBU9Ezvw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-QxI01jVkO1ev6TsiBZ-mMA-1; Mon, 09 Oct 2023 06:01:36 -0400
X-MC-Unique: QxI01jVkO1ev6TsiBZ-mMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3172a94b274so3051800f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 03:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845695; x=1697450495;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufYQMM2zTtJe7s0CFAA4/u6w0YXBmw1++OvL3l9izZI=;
 b=Qp/csFqJGmojCy8viAp39qxmmHKNfK6B0HGDgYLcRqKIt6nNxek0ryrp+R3g9FYZCt
 XZ/VAHIRUPs1P1hhUDg+5H7cT53NTuFC4Cgv0FJVqsfs7tjM11IgQPYDgXcKeR4CakGl
 J8/qV06QaOhHm38lf5Ss/J7ny878vRifcZTEeV5RrkAjWfRvvaDyu9OkUxxtK8ElA5Xw
 UaBxLJwAOjCafmvKfpxA4YIpqJh9sGNSuEOEfc4jE9gH1EVgpxurdiTR0CrQEkNzqu3W
 j9J7zpv+ih6Toje+sHtnsKaoG7HXCraJyLpzvAoBvTRex3PgX2KswZAqcbSNjT22rDIW
 bD7A==
X-Gm-Message-State: AOJu0YyvckjJ5G5rk/grVGXMfdAbqasQ7vPya9se+qZq9OWCnFHK2g5R
 bJHDI0QTQh3jZWU6wJ2DIz+9MqL/OTtJAunysq5af4G1iuXwhpbotgqidmieWpB2xiWiwU1yYiN
 ef7/5yt6dl2skAR4/6Z7yhHt6tXXy
X-Received: by 2002:adf:e388:0:b0:31a:e73f:3fe7 with SMTP id
 e8-20020adfe388000000b0031ae73f3fe7mr12912590wrm.3.1696845695183; 
 Mon, 09 Oct 2023 03:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZp2yYBF+Dib98nlX6iomQqEtGb1jDTgZlhjS1GPJCMVfYjOeoD6OtWZDr6+JHyaNyfOiBoQ==
X-Received: by 2002:adf:e388:0:b0:31a:e73f:3fe7 with SMTP id
 e8-20020adfe388000000b0031ae73f3fe7mr12912574wrm.3.1696845694830; 
 Mon, 09 Oct 2023 03:01:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d66c7000000b0031fd849e797sm9136998wrw.105.2023.10.09.03.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 03:01:34 -0700 (PDT)
Message-ID: <21b24a8d-265e-cb31-0ecb-d702bf2528f8@redhat.com>
Date: Mon, 9 Oct 2023 12:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 4/4] drm/mgag200: Add drm_panic support
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-5-jfalempe@redhat.com>
 <b010433e-ab8f-44b4-b3db-23966f5e6526@tronnes.org>
In-Reply-To: <b010433e-ab8f-44b4-b3db-23966f5e6526@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 16:30, Noralf Trønnes wrote:
> 
> 
> On 10/3/23 16:22, Jocelyn Falempe wrote:
>> Add support for the drm_panic module, which displays a message to
>> the screen when a kernel panic occurs.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 976f0ab2006b..229d9c116b42 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -12,10 +12,12 @@
>>   #include <drm/drm_aperture.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_generic.h>
>> +#include <drm/drm_framebuffer.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_ioctl.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_module.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_pciids.h>
>>   
>>   #include "mgag200_drv.h"
>> @@ -83,6 +85,27 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>>   	return offset - 65536;
>>   }
>>   
>> +static int mgag200_get_scanout_buffer(struct drm_device *dev,
>> +				      struct drm_scanout_buffer *sb)
>> +{
>> +	struct drm_plane *plane;
>> +	struct mga_device *mdev = to_mga_device(dev);
>> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
>> +
>> +	/* mgag200 has only one plane */
>> +	drm_for_each_plane(plane, dev) {
> 
> In my first 2016 attempt on a panic handler I was told to trylock crtc
> and plane and skip if it wasn't possible:
> 
> - We need locking. One of the biggest problems with the old oops handling
>    was that it was very good at trampling over driver state, causing more
>    (unrelated) oopses in kms code and making sure the original oops was no
>    longer visible. I think the shared code must take care of all the
>    locking needs to avoid fragile code in drivers. ww_mutex_trylock on the
>    drm_crtc and drm_plane should be enough (we need both for drivers where
>    planes can be reassigned between drivers).

drm_panic register a panic handler, so it won't get called on oopses.
So when the panic handler is called, no other task can run in parallel, 
and no drm code will run after it.

Also for the Matrox driver, it's always safe to write to the VRAM. The 
only risk is that if you're in the middle of a modeset, you may get 
garbage output.
There might still be a race condition for fb->format, width, height and 
pitches, and looping through the plane list.

I also need to check if crtc and plane locks are not taken when the 
driver is copying the damage region to the VRAM, otherwise the 
probability to actually see the panic will be very low.

I also need to wake up the monitor, if it's currently in DPMS off.

-- 

Jocelyn


> 
> See [1] for a list of other things to consider.
> 
> Noralf.
> 
> [1]
> https://lore.kernel.org/dri-devel/20160810091529.GQ6232@phenom.ffwll.local/
> 
>> +		if (!plane->state || !plane->state->fb)
>> +			return -ENODEV;
>> +		sb->format = plane->state->fb->format;
>> +		sb->width = plane->state->fb->width;
>> +		sb->height = plane->state->fb->height;
>> +		sb->pitch = plane->state->fb->pitches[0];
>> +		sb->map = map;
>> +		return 0;
>> +	}
>> +	return -ENODEV;
>> +}
>> +
>>   /*
>>    * DRM driver
>>    */
>> @@ -98,6 +121,7 @@ static const struct drm_driver mgag200_driver = {
>>   	.major = DRIVER_MAJOR,
>>   	.minor = DRIVER_MINOR,
>>   	.patchlevel = DRIVER_PATCHLEVEL,
>> +	.get_scanout_buffer = mgag200_get_scanout_buffer,
>>   	DRM_GEM_SHMEM_DRIVER_OPS,
>>   };
>>   
> 

