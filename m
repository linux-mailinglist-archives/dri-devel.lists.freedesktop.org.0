Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349B8906CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 18:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56DA10E4E4;
	Thu, 28 Mar 2024 17:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IPk+e/Bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CAA10E564
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711645682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P9kc8AeNy7Pb1W4UwkpUGNPJcYVPgnE+JYjej0DV/M=;
 b=IPk+e/BwqlPedap7c5hVpSDYMfkhuSPkJG+JhAZ90lf6uk15U7qqyNZrteNXlcgeefBAXb
 9bxv2aYwy151SVCLITApyRHM/vpSlzOE0jclfamhqyFlBeJKJi0r0Pd02zr2APIUydFow+
 eY0efQW0jutU3FOLD/J82y8STvI1F4k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-0NhmAh-RNGiUST9knyVfhA-1; Thu, 28 Mar 2024 13:08:00 -0400
X-MC-Unique: 0NhmAh-RNGiUST9knyVfhA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33ed8677d16so690467f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711645679; x=1712250479;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5P9kc8AeNy7Pb1W4UwkpUGNPJcYVPgnE+JYjej0DV/M=;
 b=dfBUF3PACFRIri/0XAnzX+KB/EF9a4dwlkSVmksx++NODQe7AP3gk0KDjuMyTNlJXt
 0M+1EUlSrXP7BnyAMP99aKz6sxuCLw6guk01oLBaMhqB2Tt8FV/VueqYPJRrBAI27mk3
 g2MIyDAbnybmHMQvbaJ+R5sJIgvYmAU99QunJwLup5BV9g85cK1G7+0uwtuEJ4KjDXtQ
 KNlMjtwDsVFrF+GczBB/mz7F+VGXP18G5oftC9eaZ+PfVXCBNlmb1DB9GE3/a1zuN2G0
 cwFv1xLMpxLjjHN177K+xd0Es61bJ7tIOsBA95qKFonKY+U/DLVkOeZGIbdwFjGrUzba
 Wnaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8uhFjZRbKDmVNG3+gBFGPiT8EiJf2tBV07HshWfuJodCGVOkL9JOp5BOMIG8mMPAWIY5RX1vMR/7gm1e0iTMthQu3HMWAA9lqs2oKj4qY
X-Gm-Message-State: AOJu0YxoT4fYu/RgSGiZl0TUiMKgx3ccMZ3s9RUQJa7WsQhK6NVHKsmW
 Hbg6oqf1qzTiEG/Lp3h2C7B6/dfELbvCT26vnfTVfRHKf1815i0K3n33usoX9J5TIhhuyhI11nh
 PQoqLj6ym0f0eYkbWYcfATm3geK/jrCORPlH3+wkUK7UyrqHDzUDUBVeNcc2mNVP2qw==
X-Received: by 2002:a5d:568d:0:b0:341:90ec:c317 with SMTP id
 f13-20020a5d568d000000b0034190ecc317mr2649885wrv.63.1711645679065; 
 Thu, 28 Mar 2024 10:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0kCaWOgFqSkjDwOuZqLVH1dZGXlR4PgILPsTnPkro8qeZaiPDnYX63V0xNlrPUDMQT0nqMA==
X-Received: by 2002:a5d:568d:0:b0:341:90ec:c317 with SMTP id
 f13-20020a5d568d000000b0034190ecc317mr2649872wrv.63.1711645678706; 
 Thu, 28 Mar 2024 10:07:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b0033ec91c9eadsm2209121wrx.53.2024.03.28.10.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 10:07:58 -0700 (PDT)
Message-ID: <b55be4df-9541-4bbd-8b9e-26f6b48a3dd8@redhat.com>
Date: Thu, 28 Mar 2024 18:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/uvmm: fix addr/range calcs for remap operations
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20240328024317.2041851-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240328024317.2041851-1-airlied@gmail.com>
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

On 3/28/24 03:43, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> dEQP-VK.sparse_resources.image_rebind.2d_array.r64i.128_128_8
> was causing a remap operation like the below.
> 
> op_remap: prev: 0000003fffed0000 00000000000f0000 00000000a5abd18a 0000000000000000
> op_remap: next:
> op_remap: unmap: 0000003fffed0000 0000000000100000 0
> op_map: map: 0000003ffffc0000 0000000000010000 000000005b1ba33c 00000000000e0000
> 
> This was resulting in an unmap operation from 0x3fffed0000+0xf0000, 0x100000
> which was corrupting the pagetables and oopsing the kernel.

Good catch, thanks for looking into that.

> 
> Fixes the prev + unmap range calcs to use start/end and map back to addr/range.

I like how using start/end instead fixes the issue and keeps it simple.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>

Applied the patch to drm-misc-fixes.

> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 9675ef25b16d..87bce1a9d073 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -813,15 +813,15 @@ op_remap(struct drm_gpuva_op_remap *r,
>   	struct drm_gpuva_op_unmap *u = r->unmap;
>   	struct nouveau_uvma *uvma = uvma_from_va(u->va);
>   	u64 addr = uvma->va.va.addr;
> -	u64 range = uvma->va.va.range;
> +	u64 end = uvma->va.va.addr + uvma->va.va.range;
>   
>   	if (r->prev)
>   		addr = r->prev->va.addr + r->prev->va.range;
>   
>   	if (r->next)
> -		range = r->next->va.addr - addr;
> +		end = r->next->va.addr;
>   
> -	op_unmap_range(u, addr, range);
> +	op_unmap_range(u, addr, end - addr);
>   }
>   
>   static int

