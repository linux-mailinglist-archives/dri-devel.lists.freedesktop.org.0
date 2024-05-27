Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D538CFEE4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8110FA38;
	Mon, 27 May 2024 11:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gyVltNGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C062610F4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716809040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezJXdyF0CJ1UVaUvAyDpaA8e9pPvbwoD8x8nXFabkEM=;
 b=gyVltNGuPrAMQhZz8Q0NmHAbYIOCm1F5Ru6+4MJUZU0aqqcyiS+tuDhbNIdBejc5Tsi8Lv
 gPhGaF1XvGm4oppyVO4dO1o0VmYtKxjPL4HmBVOCeh9X4oyAKT+m+JqtNthw8K99TsD+r9
 RBTzHUA2tEaiPXPJpAehwsNNpH4dZJ8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-mRIAygcgOwSLxnTLJzG4tg-1; Mon, 27 May 2024 07:23:58 -0400
X-MC-Unique: mRIAygcgOwSLxnTLJzG4tg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42024ca94d0so12480905e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 04:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716809036; x=1717413836;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezJXdyF0CJ1UVaUvAyDpaA8e9pPvbwoD8x8nXFabkEM=;
 b=PLcQBubBjmxIQBUcnPu5VBoTJeGf/MPukadyaLPCC1dJDTKROohY8LebVbAfrFOJ25
 OHrSQjtQuiYA38xil3+F6Z3K1pbYgsRNu4sSM+zx5gvmgdzLCAczydV3wGj3wbPDoUbx
 hyaS8U5hjLxzzqUdWq2V8POzpHRiDBP10Rx0K6awqomMybLFth/iI3EDrPLSl3YrA/+/
 u//XjSNKK2HCRJwSupRj9t2IF9dTiB0YpkBoVSjQbdArFLwfmr2IvtV+nwJPza0BshjX
 12C3xLai9MimO92+kPBw1D94CUUbDfBox9KVI0uNKhSya/4KoKlBbnQmktlvXBGZuvg0
 R7sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVofn4QcXmRml1Kuc5lXrFiN1f1qgvzJxAy0H6N2dqg/7O1P+nJ2We/tSfqU8xB7w8YkvUY/zPFpGHf84p2dMPsi9hl50PZqnbpml9fxtRv
X-Gm-Message-State: AOJu0YyJA/7pFIC4JPbSmm+qECa+AVi5/FjMgFgU81UnO11AmvGvOm51
 DTISd6TsL8gWqQNvSJZzQK2glBlTG4fDLoPPZVvisbUB3UPpPK6FgNoHGs7E2082XH5uROCOWiE
 bInwdVlMAXHrg8Y+hd9mXH6wM3RdusT3svAatDYPx5LH4AlrpokjZqVz9KXdgGZj3Xw==
X-Received: by 2002:a05:600c:474f:b0:421:10e4:7f6b with SMTP id
 5b1f17b1804b1-42110e47fd9mr36926155e9.27.1716809036226; 
 Mon, 27 May 2024 04:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEikC1MDgYWGSkvxnXWs44q8PtsKnEAug1a4E0ySEMd1oLjB/kkI4c5l3efqErU0u/TQoTByQ==
X-Received: by 2002:a05:600c:474f:b0:421:10e4:7f6b with SMTP id
 5b1f17b1804b1-42110e47fd9mr36926025e9.27.1716809035839; 
 Mon, 27 May 2024 04:23:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089708f8sm105016995e9.20.2024.05.27.04.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 04:23:55 -0700 (PDT)
Message-ID: <59d4bf96-9a94-4e2c-9636-81e79d572438@redhat.com>
Date: Mon, 27 May 2024 13:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
To: Guenter Roeck <linux@roeck-us.net>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Joe Perches <joe@perches.com>, David Airlie <airlied@gmail.com>
References: <20240524134817.1369993-1-linux@roeck-us.net>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240524134817.1369993-1-linux@roeck-us.net>
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

On 5/24/24 15:48, Guenter Roeck wrote:
> Trying to build parisc:allmodconfig with gcc 12.x or later results
> in the following build error.
> 
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
> drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
> 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
>    161 |         memcpy(data, args->mthd.data, size);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
> drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
> 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
>    298 |                 memcpy(data, args->new.data, size);
> 
> gcc assumes that 'sizeof(*args) + size' can overflow, which would result
> in the problem.
> 
> The problem is not new, only it is now no longer a warning but an error
> since W=1 has been enabled for the drm subsystem and since Werror is
> enabled for test builds.
> 
> Rearrange arithmetic and use check_add_overflow() for validating the
> allocation size to avoid the overflow. While at it, split assignments
> out of if conditions.
> 
> Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Joe Perches <joe@perches.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to drm-misc-fixes, thanks!

> ---
> v3: Split assignments from if conditions.
> v2: Use check_add_overflow() to calculate the allocation size and to check
>      for overflows.
> 
>   drivers/gpu/drm/nouveau/nvif/object.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> index 4d1aaee8fe15..1d19c87eaec1 100644
> --- a/drivers/gpu/drm/nouveau/nvif/object.c
> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> @@ -142,11 +142,16 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
>   		struct nvif_ioctl_v0 ioctl;
>   		struct nvif_ioctl_mthd_v0 mthd;
>   	} *args;
> +	u32 args_size;
>   	u8 stack[128];
>   	int ret;
>   
> -	if (sizeof(*args) + size > sizeof(stack)) {
> -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
> +	if (check_add_overflow(sizeof(*args), size, &args_size))
> +		return -ENOMEM;
> +
> +	if (args_size > sizeof(stack)) {
> +		args = kmalloc(args_size, GFP_KERNEL);
> +		if (!args)
>   			return -ENOMEM;
>   	} else {
>   		args = (void *)stack;
> @@ -157,7 +162,7 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
>   	args->mthd.method = mthd;
>   
>   	memcpy(args->mthd.data, data, size);
> -	ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
> +	ret = nvif_object_ioctl(object, args, args_size, NULL);
>   	memcpy(data, args->mthd.data, size);
>   	if (args != (void *)stack)
>   		kfree(args);
> @@ -276,7 +281,15 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
>   	object->map.size = 0;
>   
>   	if (parent) {
> -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
> +		u32 args_size;
> +
> +		if (check_add_overflow(sizeof(*args), size, &args_size)) {
> +			nvif_object_dtor(object);
> +			return -ENOMEM;
> +		}
> +
> +		args = kmalloc(args_size, GFP_KERNEL);
> +		if (!args) {
>   			nvif_object_dtor(object);
>   			return -ENOMEM;
>   		}
> @@ -293,8 +306,7 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
>   		args->new.oclass = oclass;
>   
>   		memcpy(args->new.data, data, size);
> -		ret = nvif_object_ioctl(parent, args, sizeof(*args) + size,
> -					&object->priv);
> +		ret = nvif_object_ioctl(parent, args, args_size, &object->priv);
>   		memcpy(data, args->new.data, size);
>   		kfree(args);
>   		if (ret == 0)

