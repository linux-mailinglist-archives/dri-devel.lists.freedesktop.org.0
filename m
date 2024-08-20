Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5146958772
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 14:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3B710E0BE;
	Tue, 20 Aug 2024 12:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fz+tVukL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F9A10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724158552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//fa7C7uMUVCVHWhUhIMdsYVMveoAIZ7MNgXZX6SAJo=;
 b=Fz+tVukLm0HNs10MFX/mqzd8fQkTAz3LOsGsRb5fEpo9J36uHQrVFSwsqU/Z7TpkXbWhsX
 BPFzkioGtA/43B9zZG062pYXX8f/Y3WS/ZY+zzpd7TFzs7jTX3dYjldhTM1jN8ErnF32Fs
 rlN9convRtUFrIvBbvNHHkZDihLinrA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Vx4Dvyz2OLSJjaI1Y_0goQ-1; Tue, 20 Aug 2024 08:55:51 -0400
X-MC-Unique: Vx4Dvyz2OLSJjaI1Y_0goQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4282164fcbcso47723675e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 05:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724158550; x=1724763350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//fa7C7uMUVCVHWhUhIMdsYVMveoAIZ7MNgXZX6SAJo=;
 b=n75BWzaYME3AyVCxFCaYpHF6jNAeaT0Y6+zOxuy6rNQ5KIvuSAczldkGqKF57ic3+m
 Y+gGGkYLd41tWyvMG/gkGmTT1MTsvHTgkgZzO9kYi4lBdzdk+CY6wYqVkxpFAC5tNn2Q
 6kHgRgbsBaHlEvHalwuANUxixZH+j5TTWmvRoZbAL+JB2jKkxXb/bszRO0nGsC/ESPuQ
 6wA390PAdmhdCRRjltgwXm9tlmDQdo/YCjhaiAZX9dvTPaDYq2SYglbYH3A9uTK2GxWU
 qKGs7PmqnIiXgbawjOsMjMw2rAYWvvLtlyzi3GYgPNRmxhPGyvPfL0tIqHbT6513NWK1
 uUxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0iXi0Go+8B7bPtFke/OjosURBCqGzKA3rVybEfd8FFTKEvM9J3fSKUjbFATWgiESFvLnJM8tVEAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw2DcjCW6HPto00WMpImFxLVhpEomr4EyuE+AKuFjbEvxF5Ba8
 d6TXo9GQVxqG6Danes5nzbx9yJiQjOjYQXhIHtru2XHfkK72jZjsl3QISJkhXb90/ZHHLw0z0wR
 hqEaYbvRRqYi7WEX8l/J6yqpFMEFn3IYuaTp1ftKCcmhucgabY3a85d87KXqRp9cXEA==
X-Received: by 2002:a05:600c:4614:b0:428:17b6:bcf1 with SMTP id
 5b1f17b1804b1-429ed7c1e45mr104694465e9.22.1724158549668; 
 Tue, 20 Aug 2024 05:55:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjumzqQN3renhqWclB/aglpoU88Ng3amSrt4D+SOxfHAVEPfbsjMcBnxYIKTunPJ2lcZZ4Hw==
X-Received: by 2002:a05:600c:4614:b0:428:17b6:bcf1 with SMTP id
 5b1f17b1804b1-429ed7c1e45mr104694295e9.22.1724158549180; 
 Tue, 20 Aug 2024 05:55:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm194550555e9.43.2024.08.20.05.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 05:55:48 -0700 (PDT)
Message-ID: <ddd41844-1d3e-4755-9013-9ae4e751c501@redhat.com>
Date: Tue, 20 Aug 2024 14:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/virtio: Fix host color format for big endian
 guests
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Javier Martinez Canillas <javierm@redhat.com>
References: <20240820090908.151042-1-jfalempe@redhat.com>
 <20240820090908.151042-2-jfalempe@redhat.com>
 <efe083ed-b83b-45e8-a418-1861f535e31f@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <efe083ed-b83b-45e8-a418-1861f535e31f@suse.de>
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

On 20/08/2024 14:48, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.08.24 um 11:07 schrieb Jocelyn Falempe:
>> The colors are inverted when testing a s390x VM on a s390x host.
>> Changing the conversion from DRM_FORMAT -> VIRTIO_GPU_FORMAT on big
>> endian guests fixes the colors. But it may break big-endian guest on
>> little-endian host. In this case, the fix should be in qemu, because
>> the host endianess is not known in the guest VM.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c 
>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> index 860b5757ec3fc..0ec6ecc96eb13 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -37,16 +37,24 @@ static const uint32_t virtio_gpu_cursor_formats[] = {
>>       DRM_FORMAT_ARGB8888,
>>   };
>> +#ifdef __BIG_ENDIAN
>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
>> +#else
>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
>> +#endif
> 
> As these defines are only used here, would it be beneficial to put the 
> __BIG_ENDIAN branch directly around the switch statement?

That was my first version, but I found it difficult to read, when I mix 
#ifdef in a switch case.


or maybe something like the following would be better ?


  	switch (drm_fourcc) {
#ifdef _BIG_ENDIAN
  	case DRM_FORMAT_XRGB8888:
		format = VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM;
  		break;
  	case DRM_FORMAT_ARGB8888:
		format = VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM;
  		break;
#else
  	case DRM_FORMAT_XRGB8888:
		format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
  		break;
  	case DRM_FORMAT_ARGB8888:
		format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
  		break;
#endif
> 
> Best regards
> Thomas
> 
>> +
>>   uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
>>   {
>>       uint32_t format;
>>       switch (drm_fourcc) {
>>       case DRM_FORMAT_XRGB8888:
>> -        format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
>> +        format = VIRTIO_GPU_HOST_XRGB8888;
>>           break;
>>       case DRM_FORMAT_ARGB8888:
>> -        format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
>> +        format = VIRTIO_GPU_HOST_ARGB8888;
>>           break;
>>       default:
>>           /*
> 

