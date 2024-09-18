Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D174097C0BC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 22:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230A310E633;
	Wed, 18 Sep 2024 20:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9y4aR1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D910E633;
 Wed, 18 Sep 2024 20:29:46 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-846d536254fso37381241.1; 
 Wed, 18 Sep 2024 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726691385; x=1727296185; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z0+Veg0ajsYwcOQjqw+fgqS5nYmrOd6UXKJLeJklo8Q=;
 b=i9y4aR1ra/naOgldLWXzmTkow/K8N0nYHnqZAoDTwYfHVep/RF9pKD2SZQj8aYteuV
 W5FJldjRwRVZw6rDYm+lbrBSq1cJlX5im7VTozCEnl/wMB4IFnMIy9sNbm2LigsfonlM
 gKEAvFkjdYdU5ZqD3LPA/QTk0p6zW575CIm2R/fHNypu4jBbXyzU3K7VdoMUVIUkDjIB
 bFv0fB2wagheI7gfmiYtul+7CNKuWw0KsN0XrGanyp+XTZxAMgWdGgh42yK9ppmXSaWR
 WV7Gp3U7nrvEnlQXcCmY8P53rNMMt3jGQtbl5WchEBi/swDy7CRdUpm2kO3eRRAQt1SX
 3i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726691385; x=1727296185;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0+Veg0ajsYwcOQjqw+fgqS5nYmrOd6UXKJLeJklo8Q=;
 b=PppNzx/5j8y1f+5Gt/uZ/jhp0RXJ7j315cHhdU799iICsk+O5v9eAfcLjc83ffqbx1
 2u1hku0ZT3K/zGYABTkC3ABrqubkWcr0vTXoSrTK1jz2I1VEOFEMIL1KMKVnUY02PjZG
 m3kxAGYLTGrXH651SQOEIvVXmuQSlkCVQdc+iXK+s4krUsA/pADIdVUpyDymTGOWAHcf
 3TFscnv4wBnFDUoVCwAbOpadkjx1OapdQicBcdyH9KxyQjH2LxE0ZkQCobDpkzOxnOmi
 eWstMvaplG0WOBN+/JP6+YExft6AIHz/8BipQNZqWy75hJuLYzIJOKju0iue+3BA+IMV
 q8PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe1Z2wriKqKsEySevcql2gZGwXFsoGUMR5USyEOvfolSgT4FhY5KBhbpA2sA8TNH1KZGLvRGju@lists.freedesktop.org,
 AJvYcCXovhfUP/JLS3eOD944NPCBeUDn9Asg/0BK0Lil7rgBWTAd/63joo04rergjcErdYSnCE/ecOkZT9h7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwesuncCbRg677bofEqjgiJ+nWvaSoLIJlwYCppe+V++7pvH5yP
 +fnEYRdwIr2tEkLRofuiuU9U9Hswy3g4UobPFFtyJ9WB0h536yQPWObfyHnCptGuGOYE+4NWAEJ
 ec/yMokDcfoOcEVgxUfA3V1Qb/GI=
X-Google-Smtp-Source: AGHT+IEVrC+ErbrSJv9jeauTLrJtajhjtGNAO2ZDnBfXorHFZ062AREFhdCHG4ssi+Vfk/BSL/g1/dDRj/uTYjW9/78=
X-Received: by 2002:a05:6102:38d1:b0:49b:f5ed:4bcb with SMTP id
 ada2fe7eead31-49d4157db8cmr16663527137.24.1726691385640; Wed, 18 Sep 2024
 13:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
In-Reply-To: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
From: Sitsofe Wheeler <sitsofe@gmail.com>
Date: Wed, 18 Sep 2024 21:29:19 +0100
Message-ID: <CALjAwxiytz=FUy4Fu8j-hOa2BKXpYL0ZyjMHyOGRE0OdsfKDkA@mail.gmail.com>
Subject: Re: Kernel hang when amdgpu driver is loaded on old radeon card
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

(CC'ing Hans de Goede who recently wrote a blog post
(https://hansdegoede.dreamwidth.org/28552.html ) which sounds like the
same issue I'm seeing)

On Sun, 15 Sept 2024 at 21:30, Sitsofe Wheeler <sitsofe@gmail.com> wrote:
>
> Hello,
>
> (Apologies if I have CC'd the wrong people/places - I just went by
> what get_maintainer.pl -f drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> said)
>
> I recently upgraded from Ubuntu 20.04 (5.15.0-119.129~20.04.1-generic
> kernel) to Ubuntu 24.04 (6.8.0-44-generic kernel) and found that while
> booting the kernel hangs for around 15 seconds just before the amdgpu
> driver is loaded:
>
> [    4.459519] radeon 0000:01:05.0: [drm] Cannot find any crtc or sizes
> [    4.460118] probe of 0000:01:05.0 returned 0 after 902266 usecs
> [    4.460184] initcall radeon_module_init+0x0/0xff0 [radeon] returned
> 0 after 902473 usecs
> [    4.465797] calling  drm_buddy_module_init+0x0/0xff0 [drm_buddy] @ 122
> [    4.465853] initcall drm_buddy_module_init+0x0/0xff0 [drm_buddy]
> returned 0 after 29 usecs
> [    4.469419] radeon 0000:01:05.0: [drm] Cannot find any crtc or sizes
> [    4.473831] calling  drm_sched_fence_slab_init+0x0/0xff0 [gpu_sched] @ 122
> [    4.473892] initcall drm_sched_fence_slab_init+0x0/0xff0
> [gpu_sched] returned 0 after 31 usecs
> [   18.724442] calling  amdgpu_init+0x0/0xff0 [amdgpu] @ 122
> [   18.726303] [drm] amdgpu kernel modesetting enabled.
> [   18.726576] amdgpu: Virtual CRAT table created for CPU
> [   18.726609] amdgpu: Topology: Add CPU node
> [   18.726787] initcall amdgpu_init+0x0/0xff0 [amdgpu] returned 0
> after 528 usecs
>
> I've checked and the problem still exists in 6.11.0-061100rc7-generic
> (which is close to vanilla upstream).
>
> The graphics card I have is:
> 01:05.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] RS880M [Mobility Radeon HD 4225/4250] (prog-if 00 [VGA
> controller])
> 01:05.0 0300: 1002:9712 (prog-if 00 [VGA controller])
> Subsystem: 103c:1609
>
> At first I thought the problem was related to the change
> https://github.com/torvalds/linux/commit/eb4fd29afd4aa1c98d882800ceeee7d1f5262803
> ("drm/amdgpu: bind to any 0x1002 PCI diplay [sic] class device") which
> now means my card is claimed by two drivers (radeon and amdgpu). That
> change complicated things because:
> - The amdgpu module and its dependencies remain permanently present (which
>   never used to happen)
> - It took some time for me to realise that the amdgpu driver hadn't suddenly
>   grown the ability to support this old card :-) There is a nice table on
>   https://www.x.org/wiki/RadeonFeature/#decoderringforengineeringvsmarketingnames
>   that shows it is part of the R600 family and
>   https://www.x.org/wiki/RadeonFeature/#featurematrixforfreeradeondrivers shows
>   that R600 is only supported by the radeon driver.
>
> However, testing a 5.16.20-051620-generic kernel showed that while the
> amdgpu module is loaded, there is no 15 second hang... So far my
> testing has the following results:
> - 5.16.20-051620-generic - amdgpu loaded, no hang
> - 5.18.19-051819-generic - amdgpu loaded, no hang
> - 6.0.0-060000-generic - amdgpu loaded, hang
> - 6.2.0-060200-generic - amdgpu loaded, hang
> - 6.8.0-44-generic - amdgpu loaded, hang
> - 6.11.0-061100rc7-generic - amdgpu loaded, hang
>
> To work around the problem I've taken to blacklisting amdgpu in
> /etc/modprobe.d/ which makes the hang disappear.
>
> Does anyone else see this issue? Is there something better than my
> current workaround? What do other drivers that want to bind to such a
> large set of devices do? Further, while I'm already using
> initcall_debug, is there any other kernel boot parameter to make
> what's happening more visible?
>
> --
> Sitsofe



-- 
Sitsofe
