Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F322A8C1CDB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 05:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3BC10E0E4;
	Fri, 10 May 2024 03:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQKyrzdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C910E09B;
 Fri, 10 May 2024 03:13:07 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a59cdf7cd78so384353366b.0; 
 Thu, 09 May 2024 20:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715310786; x=1715915586; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WsPsvb5/hkqxZ8TaOnTaYRaStciqOK1vNd66uQFFAAQ=;
 b=RQKyrzdhZS4veFe+49ds6fnPD3RUXuQsiMZtf+1ZJK0vsb17cEtC+eSJoAN7jBX1ri
 UIgAVzniZtfpe7l89LopcY2DDDgujzd1NLCS+bkUt2We6BOj4UE2rybpvOTt9iVtVFCa
 PDFgYPhNpi8u70CWXZOs3QOWKeSE1BKt+0OO625eyECqiGQi+XagQIeRhd1fAZuNnRwA
 pRO1orosfGEs/XkxudhsQa2tYxToAWdMkE4gQgfURTM1GpIRF2spBN84DVTlE+4tO7C0
 OZeCjGksBTptZ7nz7F6V6JLnmnNzR0+qvIRLHFDF0Ha70pv/fPFp3XAeiOfAYA3b5BJO
 EGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715310786; x=1715915586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsPsvb5/hkqxZ8TaOnTaYRaStciqOK1vNd66uQFFAAQ=;
 b=mgeEQhDoVYrD9ELwNzGoiktXWsZk12goQjJcK9bMMbm5u1WtJbrQ2vcNrX8/hj0B9N
 uZ4W2PKTGdBMG1kZ3o3HioWMSY8xFyFaxRuO9LH1Kt8Tc9WRrd0KksPaunPOSazZKmHS
 70LBQVJSoHds0awjl49m0VIp4ybeYFQhjDbWEb1MrgX5Q0uD5fAyhdkRpy7ScBQUnY5m
 Fzeh49sZDJkSd2ywuoGMw+w7p99i1A1DDH9hcWxtP8RoV9J/DkgiLz34K6RDGszknqpQ
 nONE0drMdKMCowQDobuOlaC4yLjkwa5e9p7SQOKKpE0Cm4WUiyon4lFJOp4vKoh9HLrj
 ouMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwzfAZB42wHWFtfb1cbm0J5qf6TvjXOm3K+XWlFxEUR4X2988eSAG0IBreM95Fk65NKgYmpBBSDFtM9L6789BxPwbvxBYcAtSpCBJvB9qu
X-Gm-Message-State: AOJu0YwQ4N2msQUKejgITaTavqQ55E3iwPbq/NYq4jzBdPgBYc9JKCtG
 7X91wjdUxWtQi2udGTchzKgLy0FcYLVh3O7/UL8iaGy3QwggTO4cN6yKvqMgzfwS/FUXmQrbcjE
 JOaC01wWOTw/3Wt+NuV6f/OjzxS0=
X-Google-Smtp-Source: AGHT+IEhcc4SKfyb+tXjY3Yxy8pPMa0OwIYLqZQLp1YpEr34sj+wfZJMrmLdJpIQWvrHO9NXquKMuXlvKJKrV/MwQrw=
X-Received: by 2002:a17:906:560d:b0:a5a:250d:de57 with SMTP id
 a640c23a62f3a-a5a2d57a3ddmr78571166b.19.1715310785769; Thu, 09 May 2024
 20:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240508230035.222124-1-alexander.deucher@amd.com>
In-Reply-To: <20240508230035.222124-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 May 2024 13:12:54 +1000
Message-ID: <CAPM=9tw1S3yFL7FF-DQqcwjnQuj=nF+ER+_nJWvOQWmUF=oLyw@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.9
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch
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

On Thu, 9 May 2024 at 09:00, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Hi Dave, Sima,
>
> Fixes for 6.9.
>
> The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:
>
>   Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-05-08
>
> for you to fetch changes up to 3d09248a06d285397e7b873415505d299202e1c6:
>
>   drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible (2024-05-08 18:47:52 -0400)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.9-2024-05-08:
>
> amdgpu:
> - DCN 3.5 fix
> - MST DSC fixes
> - S0i3 fix
> - S4 fix
> - Warning fix
> - HDP MMIO mapping fix
> - Fix a regression in visible vram handling
>
> amdkfd:
> - Spatial partition fix
>
> ----------------------------------------------------------------
> Agustin Gutierrez (2):
>       drm/amd/display: Fix DSC-re-computing
>       drm/amd/display: MST DSC check for older devices
>
> Alex Deucher (1):
>       drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
>
> Lijo Lazar (2):
>       Revert "drm/amdkfd: Add partition id field to location_id"
>       drm/amd/amdxcp: Fix warnings

Hey, this has a "fixes:" for a patch that doesn't exist.

Can we fix that up? I can pull this but I'd prefer it to get fixed if
you have a chance.

Dave.
