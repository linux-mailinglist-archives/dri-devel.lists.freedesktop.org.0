Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAED950C7E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253810E3CF;
	Tue, 13 Aug 2024 18:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ti14AuoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90A10E3D0;
 Tue, 13 Aug 2024 18:47:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so6784451a12.3; 
 Tue, 13 Aug 2024 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723574871; x=1724179671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zN4cfhjtg0m+qcxUsehbY/r8FCTmD8wIKaA1q9aup7w=;
 b=Ti14AuoEfD9/iWFuqQAH0LVeeiY8Pb4RvhRhaJIBzf6Z7uXTLB3x+JYX+/n/iKqqtH
 7hfGdCdiYfCqd51J5CIxM+RbR+nRG3an6ONG6V/N1HFGJXBDoGBKFgRwFdO8iXPFKEbb
 mZyZYx/2b2vTCgVNOsmOv5me2KrGS//2VdZgkjSOv1RNjoFQWKD6ohh+l2dkfjH8VJqG
 DI9HqpmznxpoqpoBc396NjGGNXARdzFYZg50QA4SlEVq/OTB6VsyJHZnfY5KTuUPeegL
 Iva2uVMdIiKYfO63vnz7QmrKBbbgNWikaXLhgql4Ki8/UJHISiXaKYv8aKy/3C+b4Yrt
 mbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723574871; x=1724179671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zN4cfhjtg0m+qcxUsehbY/r8FCTmD8wIKaA1q9aup7w=;
 b=EwStiN4WpehJMQarSquMH33LO6fC0KJBBegOdxFXM3ROw9IXVqXAmkNnHd6eq5SePE
 7kZyhMB7EnxYKZbbcMoGtnOYWsBGGYi0Y3bBt0/8lNTJ/9+E1pC7mYbkM6ibCn3WetQx
 G0ayomhk0cYl17JT1D0GyXXK3TCy19em+LgrE+IGLepz+x8btM3R/pUZmmjws/9yCcXY
 17gDbQm7VKFO9H+tZRlnULHtu0+clz5CimspCYLv56hom2yTlD7nEWU6u0R82jujpYbL
 fRVrSc8dprsQ2uplr07QEoWo35lBej7fQZthYLLCWBgTLEsl57TTrGpnorUQTbLQf35e
 SqMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqHXXYRGAkYgx49QuZUnHV56sLtcCGiIzNptsBwvxBFrLgcVgIdQTUXRa4ragFXZSEtaYBhMA/72+CiCMy3C1ECs5r8zcPMiX5lpbPfWuF
X-Gm-Message-State: AOJu0YyImlXp3TZO7N9Qbmj7mNOLrVoKUuximtw/eDegPAqakExz8k6i
 UR8isJMR2Xwg543FeOrkumPZrtQrE2HVzdd8KcWdDWsGwrhYwAckCata5giytwmLuWhJu3ZZdX5
 k2K8aUaB9yb1vAt7aB7YRB6yL63M=
X-Google-Smtp-Source: AGHT+IFnVaFQXYIcvXXDkk8GnJKLZo1nw2f88KFz1iXOrMa5BlQZCxf5Pf1DlScnwfnFrIVRMCc+xAulFJB59IpPnh0=
X-Received: by 2002:a05:6402:34cc:b0:5a3:e652:d59 with SMTP id
 4fb4d7f45d1cf-5bea1beaa8dmr338798a12.0.1723574871152; Tue, 13 Aug 2024
 11:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240813135712.82611-1-tursulin@igalia.com>
 <20240813135712.82611-2-tursulin@igalia.com>
In-Reply-To: <20240813135712.82611-2-tursulin@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Aug 2024 11:47:39 -0700
Message-ID: <CAF6AEGvbZDg4K642HJtNAhj2f8Sv9DvfU+en52gi42=ssPiNnQ@mail.gmail.com>
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

On Tue, Aug 13, 2024 at 6:57=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.com=
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

Reviewed-by: Rob Clark <robdclark@gmail.com>

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
