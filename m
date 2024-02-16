Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1E858517
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3DA10E011;
	Fri, 16 Feb 2024 18:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b7G1oYpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D886010E011
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708108054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
 b=b7G1oYpE/YgSTfOcsSCobBMlXADGINEKcigntHlhFWa1FXuf+ZasoN4B1Eo38x66uE3TvU
 lQnlr2l93l/31xJuqvH+ZUpvwJ3G/3sTUeiMbDeeuTWnW2LQK4Vhq80htFQS6lVecE84V5
 Yj8w2ev+7WCNJ447CjTFfb0G6EqS/nM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-CLBupTgEPXSM-N2jmF_OMA-1; Fri, 16 Feb 2024 13:27:33 -0500
X-MC-Unique: CLBupTgEPXSM-N2jmF_OMA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-563ee06be88so584473a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108052; x=1708712852;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
 b=S1BfJSmXUP1xwwARoEwI56uaOgtGU019lc53U4LEfB5XGj0G4ECWF12t128Y6C3y8i
 Cj3PS/YXL6ngyVM2ylTCoBkQ3GxBeZ5m73nXpSL2YjPaDS4BifX5t/o2LZW0VTzKuT2N
 owlsHr7rjTaP6VZdo3/l/qdWd8lXmSTgXLnqODCL4MmoIv++6HjWGYQ5pyvR9v0YmBQj
 ylhoFt3Xz4yciy7RcKfPYGyvtCRGocKfELoUvjyIu9gsbHyb418gzMS1qrfKSrmKU8mJ
 lPTJzvUUewwBqjRYSHHhn46jGNDdNqQ5Ls7rdFP7m1QMwvKaWIamuSIxYmZKgX4X1Tdw
 e3ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRd2du+BYKA/kge+vOrUqulHhrWyfvsknT+SxIteBtZbCTx3fHlVDoQzEV5JPuRaa7F0UMMwI0k4KrjhMzhct6uflide0d2kCBGm68rfvA
X-Gm-Message-State: AOJu0YzzqHKIMrBrVlbWjcRbTi6vRT4GCjKs1R0X3lzURDw2SmMdo+sy
 tIND1SLfBaVeJ2HbrAmdUyX6vT9d5sEx/Ten0drNitVLHw6XTpuqwojPSYg+5z3oBhY99N+Tlvz
 sg9Wc7NIf3aFXcaNy8FOF3e2gJ+VZHuO8cangApigJ2QpWzRW3/NfGxwdRARj+vt1rw==
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id
 h14-20020aa7de0e000000b0056407b98c18mr1164594edv.22.1708108052537; 
 Fri, 16 Feb 2024 10:27:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc7HnCrb8Q59cHQe9Z/g3oIfkHjAxB+9md3uAcAJ23mrUVRozwXdVXewL5xF6l4JirE/riHw==
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id
 h14-20020aa7de0e000000b0056407b98c18mr1164581edv.22.1708108052264; 
 Fri, 16 Feb 2024 10:27:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 10:27:31 -0800 (PST)
Message-ID: <9d9fcdeb-4d0c-4371-b871-ad1fb8055033@redhat.com>
Date: Fri, 16 Feb 2024 19:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fix function cast warnings
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240213095753.455062-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240213095753.455062-1-arnd@kernel.org>
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

On 2/13/24 10:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about casting between incompatible function types:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:161:10: error: cast from 'void (*)(const struct firmware *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    161 |         .fini = (void(*)(void *))release_firmware,
> 
> This one was done to use the generic shadow_fw_release() function as a
> callback for struct nvbios_source. Change it to use the same prototype
> as the other five instances, with a trivial helper function that actually
> calls release_firmware.
> 
> Fixes: 70c0f263cc2e ("drm/nouveau/bios: pull in basic vbios subdev, more to come later")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> index 19188683c8fc..8c2bf1c16f2a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> @@ -154,11 +154,17 @@ shadow_fw_init(struct nvkm_bios *bios, const char *name)
>   	return (void *)fw;
>   }
>   
> +static void
> +shadow_fw_release(void *fw)
> +{
> +	release_firmware(fw);
> +}
> +
>   static const struct nvbios_source
>   shadow_fw = {
>   	.name = "firmware",
>   	.init = shadow_fw_init,
> -	.fini = (void(*)(void *))release_firmware,
> +	.fini = shadow_fw_release,
>   	.read = shadow_fw_read,
>   	.rw = false,
>   };

