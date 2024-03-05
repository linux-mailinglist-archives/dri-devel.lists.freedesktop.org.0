Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1228719E2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B04D10F763;
	Tue,  5 Mar 2024 09:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dHjABGRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A20010F763
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709632078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbI5i4Q4tsI2CMeqv6RPoW9fsJnk/FBruMClWqYDOF0=;
 b=dHjABGRkeXZVlBjhbvy9pyHLBXcpQSbixcNtn326AcKDi8JcHoxcq1SLaeqEUqy0f9Jj4g
 GVSkGjOk07PiBUSNstUkoUJJaZ+adrRICDq1C2GjTMUJ9drHMZbiFishPO7bIOtwzyXUVy
 GZYhlqMxj1AslLjrB4DwOgReaB9FBHs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-uAxWZHOUM4OyRASUn0eXQg-1; Tue, 05 Mar 2024 04:47:57 -0500
X-MC-Unique: uAxWZHOUM4OyRASUn0eXQg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-365bde344ebso63078305ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 01:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709632076; x=1710236876;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WbI5i4Q4tsI2CMeqv6RPoW9fsJnk/FBruMClWqYDOF0=;
 b=eNcLc224Sw72u46QXaxXZacmSf/HFMBRbMvLuVdbEJEQoyuYw6Cpicx1hi5AccchBM
 w9YfCaezlvxv4M12h2dLIrovgUc0sy4HXrkfTfq6FPeFr063pHlNF7PIZ85vFXgI/8b7
 OJJfxNGtYMlu8d+9FJxj3riR2iIF7GbPetmJgVxzzL3rUrBlierK8NM5Im0Bfbks4sPQ
 uKyZqcNNtZcREcA1B1IwZ8CQfqmAiCMUHnnSa8ifUZ39Kd98AtywKNdanz0N0ZdzfQBi
 JQNXGIqq7rqM366g6V6IKj8fY4pHprr9PfLv/yqX7xPBSS9uqOL9nMZi5Ni7HgeeeoEL
 Di5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/tZPslnBTxwWIy7xI1k1sY/I+TA9/pJcaB7++o3EP3ZAoSg0CkPNZSZZLZiGr4xTRqTzUgBcMuf2gmkA9qFg2RCNXnGh07RB9zyv88JcQ
X-Gm-Message-State: AOJu0Yzd1pES+KqRAykgGZsjLmYfuQzzgL6YDzHt9C6MDAeDhONrLmtO
 IdyNDdxYDxuXgY1L52Ko1SJK3ogSBqjqOE5UIxZeQlxHvgAhAEVjODaKwK/qinDMmhQd/Qnb9J5
 WqXRS96D7OSi2ifobOduSq0zeJ2n0rNgvRmwZJeFPRInB97FO8Hwv8007PN56kRd9oQ==
X-Received: by 2002:a05:620a:1242:b0:787:d904:c4a0 with SMTP id
 a2-20020a05620a124200b00787d904c4a0mr1202518qkl.22.1709630353363; 
 Tue, 05 Mar 2024 01:19:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR/eLfKqYtzfYee7+jBwIfv5EmSixRoxgVGr/h1uW7ijmEXZ0/siIVOehOVecT/HyGvhvi8w==
X-Received: by 2002:a05:620a:1242:b0:787:d904:c4a0 with SMTP id
 a2-20020a05620a124200b00787d904c4a0mr1202512qkl.22.1709630353047; 
 Tue, 05 Mar 2024 01:19:13 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b0078812f8a042sm3635157qkb.90.2024.03.05.01.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:19:12 -0800 (PST)
Message-ID: <123c38bd-5b68-4f28-a218-b96fbb41f15d@redhat.com>
Date: Tue, 5 Mar 2024 10:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: move more missing UAPI bits
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240304183157.1587152-1-kherbst@redhat.com>
 <20240304183157.1587152-2-kherbst@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240304183157.1587152-2-kherbst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 3/4/24 19:31, Karol Herbst wrote:
> Those are already de-facto UAPI, so let's just move it into the uapi
> header.
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_abi16.c | 20 +++++++++++++++-----
>   drivers/gpu/drm/nouveau/nouveau_abi16.h | 12 ------------
>   include/uapi/drm/nouveau_drm.h          | 22 ++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index cd14f993bdd1b..92f9127b284ac 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -312,11 +312,21 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>   	if (device->info.family >= NV_DEVICE_INFO_V0_KEPLER) {
>   		if (init->fb_ctxdma_handle == ~0) {
>   			switch (init->tt_ctxdma_handle) {
> -			case 0x01: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR    ; break;
> -			case 0x02: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC; break;
> -			case 0x04: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP ; break;
> -			case 0x08: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD ; break;
> -			case 0x30: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE    ; break;
> +			case NOUVEAU_FIFO_ENGINE_GR:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_VP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_PPP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_BSP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_CE:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE;
> +				break;
>   			default:
>   				return nouveau_abi16_put(abi16, -ENOSYS);
>   			}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 11c8c4a80079b..661b901d8ecc9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -50,18 +50,6 @@ struct drm_nouveau_grobj_alloc {
>   	int      class;
>   };
>   
> -struct drm_nouveau_notifierobj_alloc {
> -	uint32_t channel;
> -	uint32_t handle;
> -	uint32_t size;
> -	uint32_t offset;
> -};
> -
> -struct drm_nouveau_gpuobj_free {
> -	int      channel;
> -	uint32_t handle;
> -};
> -
>   struct drm_nouveau_setparam {
>   	uint64_t param;
>   	uint64_t value;
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 77d7ff0d5b110..5404d4cfff4c2 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -73,6 +73,16 @@ struct drm_nouveau_getparam {
>   	__u64 value;
>   };
>   
> +/*
> + * Those are used to support selecting the main engine used on Kepler.
> + * This goes into drm_nouveau_channel_alloc::tt_ctxdma_handle
> + */
> +#define NOUVEAU_FIFO_ENGINE_GR  0x01
> +#define NOUVEAU_FIFO_ENGINE_VP  0x02
> +#define NOUVEAU_FIFO_ENGINE_PPP 0x04
> +#define NOUVEAU_FIFO_ENGINE_BSP 0x08
> +#define NOUVEAU_FIFO_ENGINE_CE  0x30
> +
>   struct drm_nouveau_channel_alloc {
>   	__u32     fb_ctxdma_handle;
>   	__u32     tt_ctxdma_handle;
> @@ -95,6 +105,18 @@ struct drm_nouveau_channel_free {
>   	__s32 channel;
>   };
>   
> +struct drm_nouveau_notifierobj_alloc {
> +	__u32 channel;
> +	__u32 handle;
> +	__u32 size;
> +	__u32 offset;
> +};
> +
> +struct drm_nouveau_gpuobj_free {
> +	__s32 channel;
> +	__u32 handle;
> +};
> +
>   #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>   #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>   #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)

