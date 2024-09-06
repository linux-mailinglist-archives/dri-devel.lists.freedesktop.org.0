Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37296FB0A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FC510EAD2;
	Fri,  6 Sep 2024 18:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k8R8R4lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC61E10EAD1;
 Fri,  6 Sep 2024 18:13:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2055a524017so2302745ad.1; 
 Fri, 06 Sep 2024 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725646386; x=1726251186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUzqVU8pKQuDKjf52S6dQCpWz0z0waevX8Zrg/GC9W0=;
 b=k8R8R4lfzr9Sb3ZejRVRttIrlIInOI3/dRwoD7P73hQBWnVhw55uIv/fp63KiAw3yK
 uR9/Z2nBuFDOhaOBJRN9o6QKj7gdP9xqcsuMGHwNhOXGV7T8GZI5eaBZ+2NNR/orDvYd
 uRGbcu27j0IC6bibUMGk4oqewHGJn621Qv5HEMAgncGO1qfqh0CCMlViqMRfIUdk2Y1l
 roJHRjzWUDqLim3kM0J3HN1uF+NJotO4VdkGfr0AqJdZtYHjZvULcZqA9iDlkmViIW7P
 ll2EzCeKCZR997ZSpwO9xJm599c4oNH/ypQdZRug2om0M9sEpd0+r+gJp7f2AIGWCgK5
 Ro+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725646386; x=1726251186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUzqVU8pKQuDKjf52S6dQCpWz0z0waevX8Zrg/GC9W0=;
 b=Dtxuqc/62M2pNRhxs9ZCohQguaqg+r5dKf/m/HrSWMx4Pp8EOsAaKieP1Qw7PIB23X
 XPtGLzc9MtVY2n+rSMNKJ4rJVnUPKkM3Il066fHXcirtqxH8avJSGcQEFO19SXOz8/wW
 tzO6XWDdETnLiU+EaEaGqB+n93XHm3npmevfckzK2pQx4QSesZnROxZTjY9NmMSmjAt5
 N+QvhRF2MBL3XsDEQzq6ROcBusRs8xN96dfGbthvUTx01SbjgGet2Dcc3xc+fBzhD+1d
 M35zazWTUz3Xo7eIzxwUKf8HRd1SZT1KPGGqazlXH9WYbNISkPdHqezEqaLyS/1w1Joa
 jYiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5PsvFebjrqT3mfMSh7xOk+YfpOrQIgnTdkd2zoR2fskl86wC7oOFMOTusBO/SruV6xHKvTTMJ@lists.freedesktop.org,
 AJvYcCXlrDFbTX5P7neEq6JPZOnCzzsvkV82O8tVIGfP0p9LOqdFjvZmmfz73DrqITVxvIl7yfPuBHJyfUTa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYw+WL8SqD6nwdj66l+OD0IWF6yOeWZ/wSIWNY4AcLh+CXlj5W
 VFos9lcwF4VqxyZh9lbgpMoY8x5oVlMltGLQwQ3LdcczktTndyF+8izKLVPk+yW558S7j2Rheui
 L5h/3j/DZd00OKwo9ZlhruT9KREQ=
X-Google-Smtp-Source: AGHT+IHfe8dIRPqArpvxKNQUJnmVWK0vqGqXZ/qCAjrrwVnRJfbn74Pmzo/9+yTC4auz9khUJpVO90Dc1mUVnALjbT8=
X-Received: by 2002:a17:902:e5c6:b0:206:b8b7:883 with SMTP id
 d9443c01a7336-206f04b2ef9mr19979045ad.1.1725646386058; Fri, 06 Sep 2024
 11:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240813135712.82611-1-tursulin@igalia.com>
 <20240813135712.82611-2-tursulin@igalia.com>
 <CADnq5_Pv8B+nXkO3t05VLger+zwLN7PRDcB44K-=wXWo3CymhQ@mail.gmail.com>
 <8c732c8e-27d3-46f8-83fe-6b3edb835d95@igalia.com>
In-Reply-To: <8c732c8e-27d3-46f8-83fe-6b3edb835d95@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Sep 2024 14:12:54 -0400
Message-ID: <CADnq5_NbC3NORJVCYifPDOP8Qt84RN=M0Cwa_LKpMKH8stRF9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
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

On Wed, Sep 4, 2024 at 4:36=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
>
> On 21/08/2024 21:47, Alex Deucher wrote:
> > On Tue, Aug 13, 2024 at 9:57=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia=
.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>
> >> Currently it is not well defined what is drm-memory- compared to other
> >> categories.
> >>
> >> In practice the only driver which emits these keys is amdgpu and in th=
em
> >> exposes the current resident buffer object memory (including shared).
> >>
> >> To prevent any confusion, document that drm-memory- is deprecated and =
an
> >> alias for drm-resident-memory-.
> >>
> >> While at it also clarify that the reserved sub-string 'memory' refers =
to
> >> the memory region component, and also clarify the intended semantics o=
f
> >> other memory categories.
> >>
> >> v2:
> >>   * Also mark drm-memory- as deprecated.
> >>   * Add some more text describing memory categories. (Alex)
> >>
> >> v3:
> >>   * Semantics of the amdgpu drm-memory is actually as drm-resident.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: Christian K=C3=B6nig <christian.keonig@amd.com>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   Documentation/gpu/drm-usage-stats.rst | 25 ++++++++++++++++++++++---
> >>   1 file changed, 22 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu=
/drm-usage-stats.rst
> >> index a80f95ca1b2f..ff964c707754 100644
> >> --- a/Documentation/gpu/drm-usage-stats.rst
> >> +++ b/Documentation/gpu/drm-usage-stats.rst
> >> @@ -144,7 +144,9 @@ Memory
> >>
> >>   Each possible memory type which can be used to store buffer objects =
by the
> >>   GPU in question shall be given a stable and unique name to be return=
ed as the
> >> -string here.  The name "memory" is reserved to refer to normal system=
 memory.
> >> +string here.
> >> +
> >> +The region name "memory" is reserved to refer to normal system memory=
.
> >>
> >>   Value shall reflect the amount of storage currently consumed by the =
buffer
> >>   objects belong to this client, in the respective memory region.
> >> @@ -152,6 +154,9 @@ objects belong to this client, in the respective m=
emory region.
> >>   Default unit shall be bytes with optional unit specifiers of 'KiB' o=
r 'MiB'
> >>   indicating kibi- or mebi-bytes.
> >>
> >> +This key is deprecated and is an alias for drm-resident-<region>. Onl=
y one of
> >> +the two should be present in the output.
> >> +
> >
> > I'm not sure how best to handle this.  What should amdgpu do?  We have
> > customers out in the field using these existing fields and then with
> > patch 2, they go away.  Arguably we'd want both for backwards
> > compatibility.
>
> Exactly, so it looks you maybe missed that 2/2 is not removing the
> amdgpu "legacy" drm-memory-. It keeps outputting it and also duplicating
> under drm-resident-. This is mentioned in the commit paragraph:
>
> """
> Legacy keys have been preserved, with the outlook of only potentially
> removing only the drm-memory- when the time gets right.
> """
>
> Put differently, I don't think 2/2 should break the existing
> tools/parsers. Only if they have hardcoded assumptions about the order
> of keys perhaps?

You're right.  I totally missed that part.  The series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Happy to take the patches through my tree or patch 2 via mine and
patch 1 via drm-misc.

Alex

>
> Regards,
>
> Tvrtko
>
> >>   - drm-shared-<region>: <uint> [KiB|MiB]
> >>
> >>   The total size of buffers that are shared with another file (e.g., h=
ave more
> >> @@ -159,20 +164,34 @@ than a single handle).
> >>
> >>   - drm-total-<region>: <uint> [KiB|MiB]
> >>
> >> -The total size of buffers that including shared and private memory.
> >> +The total size of all created buffers including shared and private me=
mory. The
> >> +backing store for the buffers does not have to be currently instantia=
ted to be
> >> +counted under this category.
> >>
> >>   - drm-resident-<region>: <uint> [KiB|MiB]
> >>
> >> -The total size of buffers that are resident in the specified region.
> >> +The total size of buffers that are resident (have their backing store=
 present or
> >> +instantiated) in the specified region.
> >> +
> >> +This is an alias for drm-memory-<region> and only one of the two shou=
ld be
> >> +present in the output.
> >>
> >>   - drm-purgeable-<region>: <uint> [KiB|MiB]
> >>
> >>   The total size of buffers that are purgeable.
> >>
> >> +For example drivers which implement a form of 'madvise' like function=
ality can
> >> +here count buffers which have instantiated backing store, but have be=
en marked
> >> +with an equivalent of MADV_DONTNEED.
> >> +
> >>   - drm-active-<region>: <uint> [KiB|MiB]
> >>
> >>   The total size of buffers that are active on one or more engines.
> >>
> >> +One practical example of this can be presence of unsignaled fences in=
 an GEM
> >> +buffer reservation object. Therefore the active category is a subset =
of
> >> +resident.
> >> +
> >>   Implementation Details
> >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> --
> >> 2.44.0
> >>
