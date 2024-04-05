Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65989A2A5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3210ECAD;
	Fri,  5 Apr 2024 16:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NKNsYItO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F91D10E2BF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712335082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkF4QSWzhf6Nw/44NW74bQyP4bUB/6PnvqawpC9bEv4=;
 b=NKNsYItOuCy+lMvw2UcnqA5wEEMp0zo/QT4Llw7N5Rx8d8t5wODaoAaCZf3C/wmxFhDF+V
 AofiYIkPITIaePY18DdQef4AGy5aDC+dV/g902gVN4qMsS3U5JmHJDYwnA5yqng8xyf6WE
 B55HhmKqOapOZmO8bt6vpM/4tl0tPPU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-id_kRaaeNVSFslj8lvzhKA-1; Fri, 05 Apr 2024 12:38:00 -0400
X-MC-Unique: id_kRaaeNVSFslj8lvzhKA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-343da0a889dso837363f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 09:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335079; x=1712939879;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkF4QSWzhf6Nw/44NW74bQyP4bUB/6PnvqawpC9bEv4=;
 b=cccseWAudJ5L2tFy7TSA9ygU0chXPRtLiyTI1bQuK+D8M5AMMkhkOD8XeyAIP+p+Mj
 ZZGZAfSD8XXJ2GSTF01eRgXEMKSX2j/aAPcOIB/2jROzK2Y0vN1FTARJ51cpeK9LVzic
 T2urNjfJbwND/YLh1JKtSpBAByOPddxsN7iccujkkyRPJ3cBUnqC4ItvpPNUCKbRQQZZ
 BrTWB03CsOmHDXUF0BouiRTF3EmygfYvblWdqXrfqljysbC76W4MtB5dinXiQFYm9w4P
 a7FnCxdBlcnQXRtxhHVeevbvwK6bA842miPwjkgPMLt0tOJUCOxBvib1Xq9e4yby/l9p
 PC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJbWxNlZyBugWsl9Tubx1XSfAfEnLyNykXOrLNc7jeMU5Z1/kCdv0YmTKZl4KmBzs1vv1xBulyYTIDGmK7wTn2XDb5z+KfDOYajpIvO8iW
X-Gm-Message-State: AOJu0Ywz/FUr65JevXz/k+/5SnuGdl4jA5awWbTMdT5goGKYZ4JxYdJO
 i9vfEEvd+YCaG0YLpMRdERk3ZXkPz/45ZQ9WS49CRzSAcYzB5EVgWsSb+xHreiMlSpZ0J62Lg1I
 huWsL5Zx8qam2sf6GULic4Y3vlR/o+zPK15pcbyu7Yc1Vv0V0xe/vwPZOYdxztq+u0Q==
X-Received: by 2002:adf:e849:0:b0:343:e031:69b8 with SMTP id
 d9-20020adfe849000000b00343e03169b8mr1687203wrn.41.1712335079592; 
 Fri, 05 Apr 2024 09:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ46bQriV6ycJFTO0VuNynMncgm9/Re4exnqTKKZrOf8MmqZKAujsFuh4iSK3zn2MXU1fy4Q==
X-Received: by 2002:adf:e849:0:b0:343:e031:69b8 with SMTP id
 d9-20020adfe849000000b00343e03169b8mr1687176wrn.41.1712335079306; 
 Fri, 05 Apr 2024 09:37:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 q8-20020adfea08000000b00341c6440c36sm2409149wrm.74.2024.04.05.09.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 09:37:58 -0700 (PDT)
Message-ID: <cefb67c2-f5f5-4b54-8ed6-a9cab3718ff5@redhat.com>
Date: Fri, 5 Apr 2024 18:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] nouveau: fix function cast warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20240404160234.2923554-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240404160234.2923554-1-arnd@kernel.org>
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

On 4/4/24 18:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Calling a function through an incompatible pointer type causes breaks
> kcfi, so clang warns about the assignment:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c:73:10: error: cast from 'void (*)(const void *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>     73 |         .fini = (void(*)(void *))kfree,
> 
> Avoid this with a trivial wrapper.
> 
> Fixes: c39f472e9f14 ("drm/nouveau: remove symlinks, move core/ to nvkm/ (no code changes)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
> v2: avoid 'return kfree()' expression returning a void
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> index 4bf486b57101..cb05f7f48a98 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> @@ -66,11 +66,16 @@ of_init(struct nvkm_bios *bios, const char *name)
>   	return ERR_PTR(-EINVAL);
>   }
>   
> +static void of_fini(void *p)
> +{
> +	kfree(p);
> +}
> +
>   const struct nvbios_source
>   nvbios_of = {
>   	.name = "OpenFirmware",
>   	.init = of_init,
> -	.fini = (void(*)(void *))kfree,
> +	.fini = of_fini,
>   	.read = of_read,
>   	.size = of_size,
>   	.rw = false,

