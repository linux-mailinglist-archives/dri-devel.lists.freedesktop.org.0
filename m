Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8EECF1236
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 17:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345A410E27A;
	Sun,  4 Jan 2026 16:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="YaRIgq7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2EC10E27A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 16:31:05 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-34eeffdb197so1225124a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1767544264; x=1768149064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0RomknU/GCM3/OmUnsoA7ijntj4E5mkXg3iZXV7rKso=;
 b=YaRIgq7FKdvOmIlytlU5nAp13K6gU7h58gL9yu2jJIlF/ke5J1oSaok99f+CDQm46/
 fLWu9lgYhKrmYf763MNHOCciMV6MZADOjmcvMyyvxky5Nz4KU3PAqZb9D9c9tvUkGzFW
 NLVdVtAdGo/IhkuL9OTVyu6q0YLQoACRVzTRuk+BBi0pMWtyPzUQgtuLBm372vrAucHl
 sAH7X+7JABxiHh5ZCmVxnO87HQoeYjWejztt5VOO5LA4gVERI/vNkZwgmaNOZFPWWbn4
 0ai0KXjYO7BLvw4RBHVGKANGnXE5g+YyuvG+OAZvkcyPVlPigHNxD6sgy87tnfLefvIn
 lv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767544264; x=1768149064;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0RomknU/GCM3/OmUnsoA7ijntj4E5mkXg3iZXV7rKso=;
 b=b4SjBsIxkh4jl0d9F0BC4w5QUmfZRNdA1peV1sNVnuVOQMnqEzRem22qDMOjqI+wTB
 RHdr9c1+sQUiL+sl7C0r7z1m2mqGCEn1LgATYjc8gF7DN4RObE6vF6zL4iKPdqCjvpFa
 H7RaCCyxi9TYn3qHXxwfBOvlXQjMIgrbnAgQwDJVHAhWYj3pz5UEw38bu15jmhySHys9
 2INwbkHJRgnIEGDFdJDwN3ayWI876kgjKOpy1Y3mtxpzJRA8OXwF8h2ELBEWjzNr5QvP
 v0m+nfjThrGAnWwehtyPgwI+kXgNbCb1/RRY+UeJkxlMRI/QHqsF0kcGNFQqYsf1BvPN
 ZD4A==
X-Gm-Message-State: AOJu0YyDmPMwWAH8OdvLhvFJVCj3IZfdWwAyB9rCchZ036fiCDOdzG83
 1V5SKyHBAe7gAaGklrtIzwjJEC6eN25wgHsn7WY2zevtlITQId/XLugjmnXbsBC49evt/+QCbCW
 HK8Pg318=
X-Gm-Gg: AY/fxX6+sEUhCTPHVm8YPKXCfD8erKjFbrh1EAGn+jpolR6XHVbjmzytLqbHPXutAkN
 SZWZl/U3KD4JV+4dGjPLHVmVQwoVR8JeD5KaQHZblMqWiJ1JQqqpSvjgQ0fzmL7cEBoDD9wMsRJ
 2KdVgDT7R2LKLILLx7gRXZojyjtjLdlG172IUqjb+Uaqbg8TnnD1/87CQyr3XI1fo4ST7hfk38o
 fDscMlsM/vNjxXGNxoa3sEnHgRvfLenNGoeWf/rNcGJrE/MEgZlx2x802/GHOJYSfiaQ+qygbNi
 YTbznxRnD41dnJQCTAlmjxV0Y8AUJzhNySFdul8fJikZcGkgrCaqbde+uxncBdcBpG72Cz/O4nO
 1w/oes4zOQKRV9CMmufBBIajjISl1Tl2wD/wj9GZMZqBrQ9uYUE+25r0aF0ar6bI1qVHFsC3adE
 tlZMaPLqnwl+7ZJJsq25xBGfA=
X-Google-Smtp-Source: AGHT+IEyphB/ajEv2v7vYMeAencSQ8aaOId7S4htgyUdFabRaNSn/dlZEal8wFMrdx9zCnvbBanWcw==
X-Received: by 2002:a17:903:2348:b0:29f:f14:18a0 with SMTP id
 d9443c01a7336-2a2f28360cbmr324555775ad.4.1767544264522; 
 Sun, 04 Jan 2026 08:31:04 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d5ddedsm422272885ad.79.2026.01.04.08.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 08:31:03 -0800 (PST)
Message-ID: <73aa598f-4af2-4b92-b2fd-1d8fd3dcd784@shenghaoyang.info>
Date: Mon, 5 Jan 2026 00:30:59 +0800
MIME-Version: 1.0
From: Shenghao Yang <me@shenghaoyang.info>
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
 <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
 <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
Content-Language: en-US
In-Reply-To: <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Ruben,

On 4/1/26 03:18, Ruben Wauters wrote:
> Hi
> 
> This does work, however this ends up returning 0, which implies that
> the atomic check succeded. In my opinion in this case, -EINVAL should
> be returned, as both the crtc and fb don't exist, therefore the check
> should not succeed. I would personally prefer a more explicit check
> that does return -EINVAL instead of 0 from
> drm_atomic_helper_check_planes()

> As a side note, I'm not sure if there's a reasoning as to why
> drm_atomic_helper_check_planes() returns 0 if fb is NULL instead of 
> -EINVAL, I'm assuming it's not designed to come across this specific
> case. Either way it's not too much of an issue but maybe one of the drm
> maintainers can clarify why it's this way.

Maybe this is a result of the atomic conversions? It's possible that
now we get passed NULLs on hotplug and display disables. (I didn't know
enough about DRM to be sure and didn't reference that commit in the
previous email).

I think a return of 0 should be it - both exynos_plane_atomic_check()[1] and
virtio_gpu_plane_atomic_check()[2] return 0 on either a NULL fb or crtc -
I've tried returning -EINVAL and KDE can no longer disable the display
because the rejection is being propagated back to userspace.

I'll respin this patch to return 0 after an explicit check and include
another NULL dereference fix in the plane update path.

Thanks,

Shenghao

[1] https://elixir.bootlin.com/linux/v6.18.2/source/drivers/gpu/drm/exynos/exynos_drm_plane.c#L231
[2] https://elixir.bootlin.com/linux/v6.18.2/C/ident/virtio_gpu_plane_atomic_check
