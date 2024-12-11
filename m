Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C39ED68F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927A310E411;
	Wed, 11 Dec 2024 19:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qPSsMiQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3410E411
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 19:35:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3913511e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733945721; x=1734550521; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mlmxBycUGwX5pHsGKJE1We114Ns4Oa+/FIJwhXU3Bf0=;
 b=qPSsMiQONcwc7c+1YpPu+evtAjgnpbp5PSTefi7UT0T4ZZxqU26tOMmcfprPKBji8J
 on19O/k2G0Di/rq1NBbeRUDPcBd6E7bGe/qJXK3zUiRVW+roxosmNe/LknF94BvBmTvs
 qNec1LuaXGrJLc06tmnpOz7aV5WB1J1TYmcOXp4sfevFS9wwqS69yKcgRgzN6xW5VxKl
 HGSUSZgoUTWul8YpJv9LF55j4W6izk+XnZqxoXIb5f2W9eDlPA0Va5k8MB4H+HVJM/7B
 THeY0OyIDL/D41LgQqZpsdAWn7VwmKNGKWIAdcy+iVceALPS0ViXqvivQpJTk2iOZbiB
 iOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733945721; x=1734550521;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mlmxBycUGwX5pHsGKJE1We114Ns4Oa+/FIJwhXU3Bf0=;
 b=OEJRNJgGMTsvOV2AAHb79Gg+RSmBAux22QmzPR7yCsNuwChpklrixuaKql4VDnjpJi
 nVEOAtaztjE9HpNF/Om7SvZ1hEMzImuKvCmfSdbSH56kwLhJj6nRljBeKBWZAHi2oYZR
 tGJMXHdHgG0BVVZyyKNmwXfisMCkTV/iUcbZRs9E3OqjDKfbAtPsxigooUUsUHQeIMIb
 ysxCCdh2+NOFHwIIs9sO9KWHWompOanbYTr77nCW4WzOfNeEoW2h1+VJhVvPJJfqCxIX
 0nwpCGKjok6ETkhOI+Mw1uA5zTHk2Ol1buTr9ojqF3rW1LqGSnwLpQ+BaEoS9WuO7f/o
 rzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU49ggvUpI7lXAJ6Qo3kziblcor7Ybefsjc1LSmT2dJf1sNtDz5vlK7YZrsLPl441aZISWiwBQAxos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTD6W86qi5qUU4wtkS0oD1Tynv6XH/5AOF98gZDI2mF3x5fvrQ
 Bfqx4G9/tTlaKy5PP2TEk4lNhm3RWcowb0nc4dHuhy07ERI4M9mL0bk8ZGxxt7s=
X-Gm-Gg: ASbGnctH9pzTEJ5OVNJR0myvLytUSEiGOgn7D7xObPoolSWzoC8Z/S6o26gUb526Vgm
 BYKgWZTgOWlJq/tqTHh+ZiQGP4O4eQuwKDC/KP2alZKyJuZ+IPeG9K+KCT10sy7cCFlX7u0bkiE
 1pVFbrnQc2lieMnAP9TMS/ZuBDtXoI/UI4PtFmSmgBT7nXlN/990pnozGfCrw+t6CxzI0xLZ5ob
 DsgGi2zhuTDBNx/VgFeiKSP1M0Zs53HhOSvyzH+upa3wPvp2JCNb9c7gnfi6uaxIKFyvukWb/gz
 5RCZuMmsZ081HnaBfLGHLrcpzyXd4Sndfw==
X-Google-Smtp-Source: AGHT+IFXG9kNop6Dow/dfMq9L/6cEoHmDiwAQOF9Wkw7NDsQvYPpji8SHNbXQPAGHwNjq9pSMY6jew==
X-Received: by 2002:a05:6512:1302:b0:540:17ac:b372 with SMTP id
 2adb3069b0e04-5402a5eae13mr1520110e87.30.1733945720766; 
 Wed, 11 Dec 2024 11:35:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229c0d92sm2113398e87.171.2024.12.11.11.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:35:19 -0800 (PST)
Date: Wed, 11 Dec 2024 21:35:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Simon Ser <contact@emersion.fr>, 
 joshua@froggi.es, Xaver Hugl <xaver.hugl@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>, ville.syrjala@linux.intel.com,
 kernel-dev@igalia.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v10 0/2] drm/atomic: Ease async flip restrictions
Message-ID: <ouyulceg7zrnjirg2yf4qbgp5pfovz4y6hq5v6e573yx7ih5qe@uqqne6yq27wl>
References: <20241211-tonyk-async_flip-v10-0-6b1ff04847c2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211-tonyk-async_flip-v10-0-6b1ff04847c2@igalia.com>
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

On Wed, Dec 11, 2024 at 12:25:07AM -0300, André Almeida wrote:
> Hi,
> 
> The goal of this work is to find a nice way to allow amdgpu to perform
> async page flips in the overlay plane as well, not only on the primary
> one. Currently, when using the atomic uAPI, this is the only type of
> plane allowed to do async flips, and every driver accepts it.
> 
> This patchset re-uses the per-plane function atomic_async_check() to
> this purpose, so drivers can allow different plane types. There's a
> `bool flip` parameter so the atomic_async_check() can do different
> decisions if it's a complete page flip or a plane update.
> 
> igt test: https://lore.kernel.org/igt-dev/20241211031820.115844-1-andrealmeid@igalia.com/
> 
> Changelog
>  v9: https://lore.kernel.org/r/20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com
>  - Add a 'flip' flag to indicate where the atomic_async_check() is being called from.

I think something went wrong. There is no changelog for v10 and also no
tags that you've got for v9.

> 
>  v8: https://lore.kernel.org/lkml/20240806135300.114469-1-andrealmeid@igalia.com/
>  - Rebased on top of 6.12-rc1 (drm/drm-next)
> 
>  v7: https://lore.kernel.org/dri-devel/20240618030024.500532-1-andrealmeid@igalia.com/
>  - Complete rewrite
> 
> ---
> André Almeida (2):
>       drm/atomic: Let drivers decide which planes to async flip
>       drm/amdgpu: Enable async flip on overlay planes
> 
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 11 ++++---
>  drivers/gpu/drm/drm_atomic_helper.c                |  2 +-
>  drivers/gpu/drm/drm_atomic_uapi.c                  | 37 ++++++++++++++++------
>  drivers/gpu/drm/loongson/lsdc_plane.c              |  3 +-
>  drivers/gpu/drm/mediatek/mtk_plane.c               |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  2 +-
>  drivers/gpu/drm/tegra/dc.c                         |  3 +-
>  drivers/gpu/drm/vc4/vc4_plane.c                    |  2 +-
>  include/drm/drm_modeset_helper_vtables.h           |  7 +++-
>  10 files changed, 49 insertions(+), 22 deletions(-)
> ---
> base-commit: c40c32cf71b90d85386fcc066c19feb23eb42804
> change-id: 20241002-tonyk-async_flip-828cfe9cf3ca
> 
> Best regards,
> -- 
> André Almeida <andrealmeid@igalia.com>
> 

-- 
With best wishes
Dmitry
