Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655195A60E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD76810E672;
	Wed, 21 Aug 2024 20:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DlzBm1kN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F8910E672;
 Wed, 21 Aug 2024 20:47:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fc47aef524so95455ad.3; 
 Wed, 21 Aug 2024 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724273237; x=1724878037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJsIBLh0qk9XTFq5XsfvbLjOudAjFZYGOOSAUO8R1qQ=;
 b=DlzBm1kN2rGK4zZH0f6i8eJmFkyk81fYSVUhF84jZReAg1B5x+uCAE/WtRw8G3SL0I
 nZziAugPzq49X8f8L9ebkU6IVbyhynvgMVDifuJoJelW1Yz+ZdJchUysc87ArEC1OlSy
 BKmd7ZIZkyoLBrCdX2Ikv9Z0bRMFNEqQkfMhEbhnsSOv2NM11iZV8p+k628ncMAppzRt
 43ZeMO6xQqBB4nWJBlYOYiVfbrD1u16G/7lbwx2CjYLthNCb10nNlFmIA/nsHpYhiA7Q
 pdeXmRY90rDGE7paqoLRTnMQ8vy4v/MWiK3XvL4oNuyFsB+4aeDQhTflndCNBUOYja03
 G9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724273237; x=1724878037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJsIBLh0qk9XTFq5XsfvbLjOudAjFZYGOOSAUO8R1qQ=;
 b=uM49neqvNKqZJBsvXQfjL48s4LQYnpP/WB2KFhq4ZfpPFy8VD8hsPJiBDzjetJXRGF
 Ed4rwze8hACnEK2kljNfqwN21cYIBi9WcRzR1wIT25oj+YRvi2P1lwTjyJjPlRY7f1oZ
 5285xK8Qz1NrRTKRpFsxlyUYi1Jj3yY3QDzqtnvQDo2Yq5Zxtxn8uX1NNEagQpgY2sPs
 Q8TPaV1hspvzkbn7Do69dIKJGljIP/DyRijK/NnmWzCnpmfbjXVtAlo4+kNIlXD0aFtc
 J8guGLfC4OtMQDq8CT2i3XDHxUEn8B/GDQsmJnKq6Ry9qSdt54jPmfhi196q2nHcNeXm
 qsZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyi3zAjHb5cmNnbgZ3YMLiUWvqTzPb2UpcQGtne4RXM4QEnbrCPKTFXzCZkj+P5zlqgXtcUBQJkyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqQ/yKUCczPeWswD3nEtVxUPADw1n3lmP3joI7PPkaQsWk6QEp
 tSzK2X9qrLAQUJAUxdXgcavSBxddOJgN0mrdvjlDmiKO8TY2BpEqx6sA4vTDcPzS12DS+offjVS
 pPiWmcafd3Ft2z9BWbmNAG6CqMEA=
X-Google-Smtp-Source: AGHT+IE7gl3CWUQtvMpdFKl1QuSQjeTErzYztJPlIvPi3FBdTjdOvhimV676IwPuK07ganTxd3MMBLWOcKFvJeTQh0I=
X-Received: by 2002:a17:902:c406:b0:1fa:a9f5:64b1 with SMTP id
 d9443c01a7336-20367d0d354mr23870165ad.3.1724273236738; Wed, 21 Aug 2024
 13:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240813135712.82611-1-tursulin@igalia.com>
 <20240813135712.82611-2-tursulin@igalia.com>
In-Reply-To: <20240813135712.82611-2-tursulin@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2024 16:47:05 -0400
Message-ID: <CADnq5_Pv8B+nXkO3t05VLger+zwLN7PRDcB44K-=wXWo3CymhQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.keonig@amd.com>, 
 Rob Clark <robdclark@chromium.org>
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

On Tue, Aug 13, 2024 at 9:57=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.com=
> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Currently it is not well defined what is drm-memory- compared to other
> categories.
>
> In practice the only driver which emits these keys is amdgpu and in them
> exposes the current resident buffer object memory (including shared).
>
> To prevent any confusion, document that drm-memory- is deprecated and an
> alias for drm-resident-memory-.
>
> While at it also clarify that the reserved sub-string 'memory' refers to
> the memory region component, and also clarify the intended semantics of
> other memory categories.
>
> v2:
>  * Also mark drm-memory- as deprecated.
>  * Add some more text describing memory categories. (Alex)
>
> v3:
>  * Semantics of the amdgpu drm-memory is actually as drm-resident.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.keonig@amd.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/gpu/drm-usage-stats.rst | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index a80f95ca1b2f..ff964c707754 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -144,7 +144,9 @@ Memory
>
>  Each possible memory type which can be used to store buffer objects by t=
he
>  GPU in question shall be given a stable and unique name to be returned a=
s the
> -string here.  The name "memory" is reserved to refer to normal system me=
mory.
> +string here.
> +
> +The region name "memory" is reserved to refer to normal system memory.
>
>  Value shall reflect the amount of storage currently consumed by the buff=
er
>  objects belong to this client, in the respective memory region.
> @@ -152,6 +154,9 @@ objects belong to this client, in the respective memo=
ry region.
>  Default unit shall be bytes with optional unit specifiers of 'KiB' or 'M=
iB'
>  indicating kibi- or mebi-bytes.
>
> +This key is deprecated and is an alias for drm-resident-<region>. Only o=
ne of
> +the two should be present in the output.
> +

I'm not sure how best to handle this.  What should amdgpu do?  We have
customers out in the field using these existing fields and then with
patch 2, they go away.  Arguably we'd want both for backwards
compatibility.

Alex

>  - drm-shared-<region>: <uint> [KiB|MiB]
>
>  The total size of buffers that are shared with another file (e.g., have =
more
> @@ -159,20 +164,34 @@ than a single handle).
>
>  - drm-total-<region>: <uint> [KiB|MiB]
>
> -The total size of buffers that including shared and private memory.
> +The total size of all created buffers including shared and private memor=
y. The
> +backing store for the buffers does not have to be currently instantiated=
 to be
> +counted under this category.
>
>  - drm-resident-<region>: <uint> [KiB|MiB]
>
> -The total size of buffers that are resident in the specified region.
> +The total size of buffers that are resident (have their backing store pr=
esent or
> +instantiated) in the specified region.
> +
> +This is an alias for drm-memory-<region> and only one of the two should =
be
> +present in the output.
>
>  - drm-purgeable-<region>: <uint> [KiB|MiB]
>
>  The total size of buffers that are purgeable.
>
> +For example drivers which implement a form of 'madvise' like functionali=
ty can
> +here count buffers which have instantiated backing store, but have been =
marked
> +with an equivalent of MADV_DONTNEED.
> +
>  - drm-active-<region>: <uint> [KiB|MiB]
>
>  The total size of buffers that are active on one or more engines.
>
> +One practical example of this can be presence of unsignaled fences in an=
 GEM
> +buffer reservation object. Therefore the active category is a subset of
> +resident.
> +
>  Implementation Details
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.44.0
>
