Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E78D1DC3
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 15:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DF810E824;
	Tue, 28 May 2024 13:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VMHF84Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC3A10E622
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716904721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54PHYlJ0PDEnDWhop/PaR+jnOIH2PsxLKNR7Lww/RKs=;
 b=VMHF84Szi7wSXjM9HU8RbBOhYLezt1AQtx5BkQ38lg+9tMI2fQJDpZ1faS/U8TqgKB35LY
 qbQbdgysOkeKafhStWvk8/qYtxNGrPy4Fw7jSI2Lil3pPLFC6B4oGjz4/uYY1kiSTQz9n9
 q+YXEGW4RINCI3HAkgfJZFUjwY/j55s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-1y1SUi_hNGCwFgvXnkKapA-1; Tue, 28 May 2024 09:58:39 -0400
X-MC-Unique: 1y1SUi_hNGCwFgvXnkKapA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a6266ffe72eso60736566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716904718; x=1717509518;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=54PHYlJ0PDEnDWhop/PaR+jnOIH2PsxLKNR7Lww/RKs=;
 b=kAhU+JcQVKqF4Wo+n7zmhhHeuSvvJlnJuYy/IhWZ4FnRnDBKvZdFsBxIkmHrsa+uFu
 WoBmOk7uaZ0M0e3i9/ITZ8NFRUk6wEjcpR3MLMPVr9lMTUHE6re3O0UKGizAQljdH5ry
 VNu/+2EPNsuv21gzoWacloGtsHFUaE5+v1dEUTSbqprqrLK6eLAFNAihssAnYMtBC3O4
 No13X/ljPhP2zfeG8fz7peR1Pl1Ov3zJWZ9Eu/Hr9Ko7M1R2+TT7T92WvfSq88mem4x4
 3WYENbRACLOgK3963zoGf4ryMefuHZmFur/Fkze/uLeggKsI8a7YYQGR7G5e7kPG0sxz
 JYAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0yw3R8MMtjpi5yR0FZSO32/uqobM5APoulAO3sYNuq4GxXVmgOWcWZk3OjcTj7UOzWL0WiGXDSEIwK2o7fZI40WdhghqeAUAsvgrwaK7e
X-Gm-Message-State: AOJu0Yw3gcEBS0PX9F7n+fp+K9FAIbrUKhJ1fjma0VzzTUKmIzfHgUcb
 cKRpmQHF4LOTwDzpyIuVK80a5ug0/TrhhfkNMpI7G4QaF3mDKguOFrd4F2RQbIeJwJ63UrIRkae
 qWcWodAWXVVa9aoSoVPPLSXQO8j0G389Gp/KcFSgvCXhn6af8jjEGB6x4v91PZmH7Zg==
X-Received: by 2002:a17:906:bc42:b0:a62:3c94:3bd2 with SMTP id
 a640c23a62f3a-a6265011270mr904384666b.73.1716904718492; 
 Tue, 28 May 2024 06:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQIR74emKom8ATw+snuAUy13d6llophtQiniGptcCuWj8oFnstnUM6NEvnixIbkTAxpA1/sA==
X-Received: by 2002:a17:906:bc42:b0:a62:3c94:3bd2 with SMTP id
 a640c23a62f3a-a6265011270mr904382466b.73.1716904718020; 
 Tue, 28 May 2024 06:58:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:4600:d3a7:6c26:54cf:e01e?
 (p200300d82f284600d3a76c2654cfe01e.dip0.t-ipconnect.de.
 [2003:d8:2f28:4600:d3a7:6c26:54cf:e01e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c818362sm617978566b.34.2024.05.28.06.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 06:58:37 -0700 (PDT)
Message-ID: <93ee4e04-bdc7-4ac6-b93b-b6cf1b3311af@redhat.com>
Date: Tue, 28 May 2024 15:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udmabuf: add CONFIG_MMU dependency
To: Arnd Bergmann <arnd@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20240528133138.2237237-1-arnd@kernel.org>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <20240528133138.2237237-1-arnd@kernel.org>
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

Am 28.05.24 um 15:31 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is no !CONFIG_MMU version of vmf_insert_pfn():
> 
> arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
> udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'
> 
> Fixes: f7254e043ff1 ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/dma-buf/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4dc53a36428..b46eb8a552d7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -35,6 +35,7 @@ config UDMABUF
>   	default n
>   	depends on DMA_SHARED_BUFFER
>   	depends on MEMFD_CREATE || COMPILE_TEST
> +	depends on MMU
>   	help
>   	  A driver to let userspace turn memfd regions into dma-bufs.
>   	  Qemu can use this to create host dmabufs for guest framebuffers.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

