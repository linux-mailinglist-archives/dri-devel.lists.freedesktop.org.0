Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEF95D182
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761DE10EB43;
	Fri, 23 Aug 2024 15:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DLYGDSvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39710EB43
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724427344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3rLYGJgK6z9fhn+qYuQPwIKQkobSIo3O9qdPTM0OPg=;
 b=DLYGDSvtUKPFRK+DTWcguVlwuZSgwiqmTutk6sCppYDImLmw9jZaLMwoxx5OEPQxaAiwK+
 6OssaGYN0RH2ogrsS/E7dHRlZP3pfbaKXaXHK/pxRgxmS4SOQek9t5bMrOBJ4PU/sW5H9H
 rlaDnpG06pCohfUicPs6/8FQWnZlrUQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-CMBvAOUUMqqAVTNflKCo6Q-1; Fri, 23 Aug 2024 11:35:43 -0400
X-MC-Unique: CMBvAOUUMqqAVTNflKCo6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso18393375e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724427342; x=1725032142;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c3rLYGJgK6z9fhn+qYuQPwIKQkobSIo3O9qdPTM0OPg=;
 b=tHELAJMjhoZ4pTpf2zE3pD6cxroJh3tzIMYpq9jFu0aIoIEJKuaRYiYQ1RIKftsz+7
 XzYtzLSYag2S4htcaUyGk6v6s/uEQa2z+xplY1QBnSJ9KpRrvpPCN0Ic6XuiRLHEnKhI
 OL6C0YzR8JA1tKnqrnpagEAxKgBitcMwP9hN3DpC9hds7BwWnGKKtfd0mwvxGHxqveza
 SigsyFYvyoMy5lCQKwN/w1sc78kM+upNHML5Hbnx5bwxd299kUF9imhvohOzFqG53Vbw
 9giXF1G3SGLFpPHAWVabJEgDXP4Ap44InIpAYKVdHTyPtf+PAX9FVJwjKsnCvOmZbm/d
 fSFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVeOAn9mjRjZjISZisv5heq0TbPvX1Mj/ILUOkvwIFvLAHsl4RwDI+5dvoVjWWryGypHTHkqhQEiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy53pX9gz5AKTJ8kWtnT3RQWpRz8XLx1iHpkTE2iSMS5a01Adj+
 uWMkERfqq8NXBegwOB4pK5eIa36Qk+rUxBRpvBVMxgRKbOZ+qU80BWM0djsa1TrD0asHdryD8w5
 mPzRJAJO8DZoYofAHqrCT45ZwBiasJFzeOa9w206Ao8Vn1V8PkBBW2JvhGUg2JjgQUQ==
X-Received: by 2002:a05:600c:354b:b0:428:c0a:27ea with SMTP id
 5b1f17b1804b1-42acc8dc557mr18724185e9.12.1724427341988; 
 Fri, 23 Aug 2024 08:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQm2FCaknjRgK8aLmW41cDwSvcHK2xRo53SrzU02DJUIR/S6S0b/YsrbuHurrpfHMGWC2T6A==
X-Received: by 2002:a05:600c:354b:b0:428:c0a:27ea with SMTP id
 5b1f17b1804b1-42acc8dc557mr18723885e9.12.1724427341447; 
 Fri, 23 Aug 2024 08:35:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162609sm63072885e9.27.2024.08.23.08.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 08:35:40 -0700 (PDT)
Message-ID: <6496591e-fa98-49ed-b85e-c76734c25568@redhat.com>
Date: Fri, 23 Aug 2024 17:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/virtio: Defer the host dumb buffer creation
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20240822172338.698922-1-jfalempe@redhat.com>
 <mlqofcqa2yki43bkcl2kq6wfwchmkisnybbadd32khln5tv4ux@u4xuf6gumcqa>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <mlqofcqa2yki43bkcl2kq6wfwchmkisnybbadd32khln5tv4ux@u4xuf6gumcqa>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/08/2024 09:04, Gerd Hoffmann wrote:
>> +static void virtio_gpu_deferred_create(struct virtio_gpu_object *bo,
>> +				       struct virtio_gpu_device *vgdev,
>> +				       const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	struct virtio_gpu_object_params params = { 0 };
>> +
>> +	params.format = virtio_gpu_translate_format(mode_cmd->pixel_format);
>> +	params.width = mode_cmd->width;
>> +	params.height = mode_cmd->height;
>> +	params.size = params.height * params.width * 4;
>> +	params.size = ALIGN(params.size, PAGE_SIZE);
>> +	params.dumb = true;
> 
> I'd suggest to simply store the complete virtio_gpu_object_params struct
> in virtio_gpu_object instead of re-creating it here.

The struct params is much bigger than the struct virtio_gpu_object, so I 
though it would waste too much memory. Using a pointer would add an 
alloc/free pair, and a potential source of memleak. And as we have the 
required parameters in struct drm_mode_fb_cmd2, I found it better this way.

> 
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> index 64c236169db88..8d1e8dcfa8c15 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> @@ -93,6 +93,9 @@ struct virtio_gpu_object {
>>   	bool dumb;
>>   	bool created;
>>   	bool host3d_blob, guest_blob;
>> +	bool deferred;
>> +	struct virtio_gpu_mem_entry *ents;
>> +	unsigned int nents;
>>   	uint32_t blob_mem, blob_flags;
> 
> Put them into a new block separated by newline, add a comment saying
> those are needed for virtio_gpu_deferred_create?
Yes, I will do that in v2

> 
>> @@ -229,9 +231,14 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>>   						  objs, fence);
>>   		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>>   	} else {
>> -		virtio_gpu_cmd_create_resource(vgdev, bo, params,
>> -					       objs, fence);
>> -		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>> +		/* Fence is used only with blob or virgl */
>> +		WARN_ONCE(fence != NULL, "deferred doesn't support fence\n");
> 
> Additionally check for param->dumb to take the deferred code path?  That
> should make sure there is no fence.

I think I can also duplicate virtio_gpu_object_create(), and have one 
version only for deferred dumb buffer. I will see if that doesn't make 
too much code duplication.

> 
> take care,
>    Gerd
> 

Thanks for the review,

-- 

Jocelyn

