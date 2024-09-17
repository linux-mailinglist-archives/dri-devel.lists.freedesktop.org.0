Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263897B551
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 23:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FE810E0EB;
	Tue, 17 Sep 2024 21:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwKGBgKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199B010E0EB;
 Tue, 17 Sep 2024 21:43:41 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-718e25d8b67so980074b3a.3; 
 Tue, 17 Sep 2024 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726609420; x=1727214220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJQxiek1sqcvJHX5DqbudjsXRtWsNh8pviYM7nr6zLw=;
 b=LwKGBgKgRVdVyY+2o9ydx/n1yKaAq9FHsn/WAk2hLNanbV81Cm+S+AMqO2C85AlSuU
 mmyfu9ormjpoE3bFzbs8CE7Va6voDrDrFUsSzp6PV8HBG1weNoX45whQH/PgUuroXefB
 1mlCvSMzrQoIVAFtY3Xn932+cs1E7NKtHcutycQPmj1UmZgn7leenU2JYvaFRSWLhKu4
 sZFF/hQ1IRSt/6YJ5aKPGSdn1UwVAtnxu8ULb6/UrRxfFbo6r8VGsHuN/LNZ0fSwCiwr
 ftxDvgFtZadgYK4SmWlZ557hGaaEyDs4onmqkU8vasTB34Dlw44ffe1vTPVq7KvEVyjK
 oL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726609420; x=1727214220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJQxiek1sqcvJHX5DqbudjsXRtWsNh8pviYM7nr6zLw=;
 b=E0NaNyoPC97Gbrx67x9GGaViyawv3BxN4sUII/pYFv9/yTx1fG/eMm1a56BwdzkUPk
 jdkczqHbrjwCuXuSS/OcdQv4Pv/h35+MSN/Wb12nIvCuJf6wmZQZHLtkqoi4vW9oVT1W
 VQxZrWeoOH+ICqcaQU/Pk8NQfNRnn9+N0Yi6bFwJGuMKBGrsQ9lfXxrQyLSQaSPetV/Y
 8DZYF7CrqoZ9LVrf0hRT5hqYmfOOQCOLWJ5nQJ9IiEbSQKCkCnrfT1QnBa1lKwRVPV5a
 U6Tv5gQBVVYY/vYzt6abwIPxj0MuSuMV5tjG1FU0srToGAaMxgM7j94h/ZUBHXw/rGLV
 9QOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1bWlXcUAtOQ+cJCTY3GEgCYMYZNsI+XaE8zvyRseUs9/vW2qd/yon7o4elqO3mMWF2U6c5I7fVqjG@lists.freedesktop.org,
 AJvYcCWDe0PKoSsKhNDGpK17fkNPpZ+UfXExHMJqnysVNXlJU/Kov5ETR4N5c/2HvBS6gU3VlKaDTDEv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2x99Tuq60DnmllPSs0XuvjG3Mj5PSCcMn1ujdw/hC11NQkAIu
 FROyrtQNHTbFI5kK03DAnzDg5i5eWTWB8Z1le20h2IwPDZMskIQOhUoZwdvAhnsDjzIOgGbDEd5
 j2eXeZMTkaSrGvaYdMlWIlz5I4dMX0wd7
X-Google-Smtp-Source: AGHT+IEsXGCscBSTzIZVFtTph5eEx9lv5jv9JkQZOd19AaH9N95Zw/Y9F1oQohL0rT+gFkpUIK4JksVk3CM0ErG+xqk=
X-Received: by 2002:a05:6a20:3d8f:b0:1cf:4845:67f with SMTP id
 adf61e73a8af0-1cf76233425mr12955383637.9.1726609420351; Tue, 17 Sep 2024
 14:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
In-Reply-To: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2024 17:43:27 -0400
Message-ID: <CADnq5_ODjqwMS8WNbjdMq++YU3XeVtEEn=KnyoWOzdddyyUw0g@mail.gmail.com>
Subject: Re: Kernel hang when amdgpu driver is loaded on old radeon card
To: Sitsofe Wheeler <sitsofe@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 15, 2024 at 5:28=E2=80=AFPM Sitsofe Wheeler <sitsofe@gmail.com>=
 wrote:
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
> [    4.473831] calling  drm_sched_fence_slab_init+0x0/0xff0 [gpu_sched] @=
 122
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
> https://github.com/torvalds/linux/commit/eb4fd29afd4aa1c98d882800ceeee7d1=
f5262803
> ("drm/amdgpu: bind to any 0x1002 PCI diplay [sic] class device") which
> now means my card is claimed by two drivers (radeon and amdgpu). That
> change complicated things because:
> - The amdgpu module and its dependencies remain permanently present (whic=
h
>   never used to happen)
> - It took some time for me to realise that the amdgpu driver hadn't sudde=
nly
>   grown the ability to support this old card :-) There is a nice table on
>   https://www.x.org/wiki/RadeonFeature/#decoderringforengineeringvsmarket=
ingnames
>   that shows it is part of the R600 family and
>   https://www.x.org/wiki/RadeonFeature/#featurematrixforfreeradeondrivers=
 shows
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

Do you have secureboot enabled?  If so, perhaps this is relevant:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219229

Alex

>
> --
> Sitsofe
