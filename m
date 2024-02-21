Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5685E917
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19CE10E124;
	Wed, 21 Feb 2024 20:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XtfB3/La";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F910E124;
 Wed, 21 Feb 2024 20:35:03 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso5557424a12.2; 
 Wed, 21 Feb 2024 12:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708547702; x=1709152502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/bhYykhkdnbA79Ly3s+SMOT0nYqMLem10RWT+KTFTuU=;
 b=XtfB3/La7h5dq01NP9g1+saw1wItSq3qV1RZiW7dSI3I32ey8TW1Q0HZeTi8W2CbGR
 Mn7NYKVbS3gkNeEedwVxamTOBcmah3vAFZaQrs5dGYQ0mQj2H6AuFYMnSZy8S/hf/YDR
 QhXmYu7QkKSleMrJBLV8KCJTOQwHRR4VpEJZxR/K/RSgXq2Z8C6w9PJoUseLQ2SAutqC
 OAsr9vx9r+eXQaDsEY3na5I6gmhVzUo74Nw6kSXEt/W7VgWciAZ4ajPbXlEjIWQqjMOY
 gnCAers7ajRA5rS/kCuu9POeYB/zSxKw9umMYIMlv78zsNZUa51SjZzehgf8+BWyUkea
 CjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547702; x=1709152502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bhYykhkdnbA79Ly3s+SMOT0nYqMLem10RWT+KTFTuU=;
 b=XDKvtzfb37kAAH4JaGIXGRnBxoLjTWzzTDByvagb47GCgemKU78J8Jow581iUf5aig
 lCXgofl4x9qztXVlb+/qSdnwFN+lLcZEXkH6PwSnLA2gM7njIqbgPBjxGwtmsOccoCK4
 OBNJCz2S8SspDB+npFcBbYhhFIWshwwafeXxYZfAWhnRNax1aYBbzX2XWpEeCoFjE62W
 4WwmreS2CJ1MgdU+RnqmE27TiNIR1D1XmP2QvLQELS7STjs/uE/Gt46mlw2y80JcjS6q
 HLWraKiKvBdrKByIgAKj1W6PXA4x5Xjha1UhsVtzhOBp8ZMONBtxJD8faOsFdvjQLcWl
 D1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1BoiHU0DkxRHiYwo8BbwvcVAiAaMLPjDA1r8bM1yUnFHCdV+9dI9/01i4oSirBN1fi+WG4hjXYcqpQZg4yzLCkTPLqs/GjwNID6nBs0VHHfsIl4ymWukVmjsz7VPHjx+StLugdViRRHMrpfHTA==
X-Gm-Message-State: AOJu0Yy/p3p0C/TcTahIfMPtqwIPLYl+BMxW402KnCFgHtMwrqESgKEf
 SdTEjAGmn1gZHl8GgChAcd+RHA8NV4N0IiWkznIWbRo5hgTyige5VFOnN6Sx6fFb+rSq8QSTPsd
 Pqu1CUdqCrqckYWg5lPeLfFE1J/UWsMHr
X-Google-Smtp-Source: AGHT+IHUGdXylJFt2yo5p2Mwr4DIrtm0FgL8AyM6LN0zQs70eWze1pfy17ZubP/nB+Geq09MGrBssVmu6al/mnEo6iw=
X-Received: by 2002:a17:90b:397:b0:299:14e4:6579 with SMTP id
 ga23-20020a17090b039700b0029914e46579mr15246193pjb.22.1708547702507; Wed, 21
 Feb 2024 12:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20240221095907.172408-1-chentao@kylinos.cn>
 <75a4102e-b078-4e95-a5b5-a677ad9622fd@amd.com>
In-Reply-To: <75a4102e-b078-4e95-a5b5-a677ad9622fd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Feb 2024 15:34:50 -0500
Message-ID: <CADnq5_N42HwHG_LUENEb+ZFf_A7w4wH+YsbSmUDu-DS1oYqjgQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amdgpu: Use KMEM_CACHE instead of
 kmem_cache_create
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Kunwu Chan <chentao@kylinos.cn>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Wed, Feb 21, 2024 at 6:08=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 21.02.24 um 10:59 schrieb Kunwu Chan:
> > For where the cache name and the structure name match.
> > Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> > to simplify the creation of SLAB caches.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the enti=
re
> series.
>
> >
> > Kunwu Chan (3):
> >    drm/amdgpu: Simplify the allocation of fence slab caches
> >    drm/amdgpu: Simplify the allocation of mux_chunk slab caches
> >    drm/amdgpu: Simplify the allocation of sync slab caches
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c    | 4 +---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c | 4 +---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c     | 4 +---
> >   3 files changed, 3 insertions(+), 9 deletions(-)
> >
>
