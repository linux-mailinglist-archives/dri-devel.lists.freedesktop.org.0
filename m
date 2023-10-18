Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442E7CE01A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 16:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA3C10E05D;
	Wed, 18 Oct 2023 14:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1310E04E;
 Wed, 18 Oct 2023 14:36:45 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-578b407045bso5159591a12.0; 
 Wed, 18 Oct 2023 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697639805; x=1698244605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2MBHQrqw55UjZKvbwXO22BYYyiwvKly9qhomQTJhZaA=;
 b=VXPc3EqkNw7XyuP/gq5udwbNddGHLAov2i9geV+OCoMBPX4ODqux+w1H+yg8CO6LXI
 2wrRzmJWu7szSuNKjlDy9LmMEBfo+IX9Nw4Eu5clZBSnOiudWez8cs4PFJLyEtK9KKdJ
 GZ4vNlBLmBPYeMIcc1AH83pCcx1Sa+VI5C5TtOEs+hOim08RyppKbLp/TmWZ1obPS1o0
 lDz4oX7x6X2zhhCF4FNE1bVdwOa21xmaemG4qxc0hOS7tJAZ8Y888rSeu3d/KeHXRHpM
 EFvf1TmAHJT23CkHgr+gf3DEahW1uLoexLarxRTktmjr/J+RqEjBajSs/kcpaXwLnpx5
 2SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697639805; x=1698244605;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2MBHQrqw55UjZKvbwXO22BYYyiwvKly9qhomQTJhZaA=;
 b=w/+zkrmdPZDvwIxIr2NNmAPXP/HL5EFMdU8+Gjl191wFZnVPVxdZjFfj38GpYuA0dI
 ryoO7IqLppfuuxcWx1UvEgh9a2XPxetZJUw0SLfPdGSJ2ifAOK32mZXFn6lsZcxqigMe
 XkR0EGBQHJcRCHKmbOSLC7aEuD1yrugjh0sp7vblYic/UDBxnmhFpIsIwh8S8wBMKPBq
 edZ4UA3q+47e6UrkebuWymxOwZuUjqiMWpNODxVq692hxTMC5bfNCbcdcJl72HRouFCP
 PZDBO9sHyKHmJ1EFTXNAFSQwk7jkKhQQhdynN80I6I0jJc57vTQJnQ7z1lKOyk3ojSHW
 UvAg==
X-Gm-Message-State: AOJu0Yw4yY9kM9OVyjpwGnycIq58noX2bgCAGz802fx1NEuvJHthzTSW
 KkNwLTa2mJAd0SbZfS5JpuE=
X-Google-Smtp-Source: AGHT+IEtWQEDU+xX49TW325o5ZdEYEM1SAd4UwkCDNJeh/9ChcecZD1WGA/QyoBI/Ln4jFvW9HeGow==
X-Received: by 2002:a05:6a20:9155:b0:15f:faab:1be1 with SMTP id
 x21-20020a056a20915500b0015ffaab1be1mr5760804pzc.20.1697639805239; 
 Wed, 18 Oct 2023 07:36:45 -0700 (PDT)
Received: from [192.168.1.13] ([27.4.124.129])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a6560cd000000b005aa800c149bsm1604838pgv.39.2023.10.18.07.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 07:36:44 -0700 (PDT)
Message-ID: <db7e32f5-440d-4e42-8a10-eab0f9d488c8@gmail.com>
Date: Wed, 18 Oct 2023 20:06:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Fixing indentation and adding License
 Identifier tag
Content-Language: en-US
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231008172751.21953-1-bragathemanick0908@gmail.com>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20231008172751.21953-1-bragathemanick0908@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/10/23 22:57, Bragatheswaran Manickavel wrote:
> On running checkpatch.pl to nouveau_drm.h identified
> few warnings. Fixing them in this patch
>
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> +/*
>
> WARNING: space prohibited between function name and open parenthesis '('
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>   include/uapi/drm/nouveau_drm.h | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 8d7402c13e56..900ca4f1ebe5 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */
>   /*
>    * Copyright 2005 Stephane Marchesin.
>    * All Rights Reserved.
> @@ -448,15 +449,15 @@ struct drm_nouveau_svm_bind {
>   
>   #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>   #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>   
>   #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>   #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>   
>   #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
>   #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>   #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>   
>   #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)

A Gentle remainder. Can someone please help in reviewing these changes ?

Thanks,
Bragathe

