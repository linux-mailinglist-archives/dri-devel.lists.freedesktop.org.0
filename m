Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41380A6BBD3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 14:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8653210E7D6;
	Fri, 21 Mar 2025 13:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VrvQlMxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0110E7D6;
 Fri, 21 Mar 2025 13:40:28 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-223fd44daf8so5689695ad.2; 
 Fri, 21 Mar 2025 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742564428; x=1743169228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfrrjcE+zmYhHfkZPIBiI6f0xELcKRCVGZ0NwSalX9A=;
 b=VrvQlMxu1Hfp0vBSD6ssA/jhFYy8GqnUP4sqFtHu62EC1jVeTnN9QX90vMBMO2uoHl
 kBhT8kMzrsx3cAupu5BiOr5e1VJCtgmf+iHoIXMgPGjSCgmrjQuFU/IQfUEVJ/gAnVnl
 THISj0ISsMCIlzP8lo65X0kg4qM8PQyEYbY90hxcqEitNkEC7LkcEjmXHzog9J/HsFEr
 a2wCzH/M340eYkBuQ0EuJ/Ar98soi5CVaWpRjVEVnQIYolaxt1AVO8fiHlvVdOt1FYQy
 Y8seo9a41ySUOZeZxeUiW4tvGcFk2w4W9D9Si1igRipAvT1HxP6fn72zkdKjLy4P+KJ7
 ShXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742564428; x=1743169228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfrrjcE+zmYhHfkZPIBiI6f0xELcKRCVGZ0NwSalX9A=;
 b=lGmqKe4usf1xB5dXKk/2lSfaPBvQGrHNpfRXn3gIXiVv2p99Ykn5dxTAFEFGyvhJMz
 aeKqMm/7dVVjQW8ZVzMzOzCQD5MzrRO3NVhZmwmq5rP7v0D9JfQEz9SPGP80lSbk5HWS
 ZjUmVs/M+qGtc216d6AThQCNmfHQTKoiLMtWg7lNRJ7wSSaxtQFyDJq20BxWYAa32Oej
 En6zoD+AVIhc9BkbVx9FG9YE3dKYAXki1CXD1T1uhsmlIizpm4H2bwOhOVvwCX64jY8r
 FPzP+aA4o20Bt/VVuzQPKioaYH7wNtpmXmtNon7LWkO5qOM6E7BlO76TZxoj0xt+aUr9
 1djQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmPHDbhC4Vv8LWSnSMtPF1+E/cC58lTBwbHDrCa1LM7MRZAuhnvYZdmoC8WHFP733uzX1RyV1f@lists.freedesktop.org,
 AJvYcCWwpCZNlmtXu39eawLToU+pA6EAcqEf5HwW33HmZcZ2I0jD8v3vpXB+2YjpOrrqLemlanl+eFzj+8fH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD1BBJ/4FjId8GkySRWdNs5eFDxN5GRwOJFTIaErjNjcB5zKqI
 T6GcvN2VHLg/WpE8y/tNNLZv8XVHEGx8ecdN/LVqZDM6mB9Ixn60xGys0HAX79ikRkt/IVebiIx
 K+kbKVSARiHxRBsYeR5mgzR25sNQ=
X-Gm-Gg: ASbGncukmCJuv58SEPFU5O7UE8TcsMu2AsSmGN6BqWAuKfn5YcdTVN4bcIR6mVtvnp4
 hcpHzLiU46ljXcg+fs+/rpnfm4fIQMWtACu8ojrHwbaZWmZLNs5tolTNK9majfxRqG1l93gLGVi
 8LL/SfdHmTOBd0M4PvTVLigMSUag==
X-Google-Smtp-Source: AGHT+IGAned/y4rCBJOi3ppXyF873op1FX24G4PcGsaD5IjbHrfCRwXex5G2mH5qkLiDPIUGm0+MJ2q8gINY/vvWO1w=
X-Received: by 2002:a17:902:d481:b0:215:2bfb:3cd7 with SMTP id
 d9443c01a7336-22780df0f46mr20400985ad.10.1742564427489; Fri, 21 Mar 2025
 06:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250321105239.10096-1-arefev@swemel.ru>
In-Reply-To: <20250321105239.10096-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Mar 2025 09:40:14 -0400
X-Gm-Features: AQ5f1JqaxGo0yV__5e9_Mt95IZ2ZGDSbqPVLFOF5KxJXhzOibt3Pbv0OgX88Ts8
Message-ID: <CADnq5_MsNtgObTgUWNQkS6EsHhXwVyi8EYROdhyvVin8YMsq5Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/amd/pm: Prevent division by zero
To: Denis Arefev <arefev@swemel.ru>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Ma Jun <Jun.Ma2@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Fri, Mar 21, 2025 at 6:53=E2=80=AFAM Denis Arefev <arefev@swemel.ru> wro=
te:
>
> This series of patches prevents possible division by zero.
>
> The user can set any speed value.
> If speed is greater than UINT_MAX/8, division by zero is possible.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

Applied the series.  Thanks!

Alex

>
> Denis Arefev (5):
>   drm/amd/pm: Prevent division by zero
>   drm/amd/pm: Prevent division by zero
>   drm/amd/pm: Prevent division by zero
>   drm/amd/pm: Prevent division by zero
>   drm/amd/pm: Prevent division by zero
>
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c   | 6 +++---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_thermal.c | 4 ++--
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_thermal.c | 2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c       | 3 +++
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c          | 2 +-
>  5 files changed, 10 insertions(+), 7 deletions(-)
>
> I did not change these files, because the functions you are
> interested in are not used there for a long time.
> drivers/gpu/drm/radeon/si_dpm.c
> drivers/gpu/drm/radeon/ci_dpm.c
>
> --
> 2.43.0
>
