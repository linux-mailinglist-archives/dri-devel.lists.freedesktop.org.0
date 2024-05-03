Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A158BB302
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B14B1131B0;
	Fri,  3 May 2024 18:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KT4iTuYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AAE1131B0;
 Fri,  3 May 2024 18:26:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2a2da57ab3aso5886a91.3; 
 Fri, 03 May 2024 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714760765; x=1715365565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOjTMYF0n4eXtqGvQxk2snOMEhYe782CBRhn/PML6D8=;
 b=KT4iTuYJXC2hcVynFxsLglQ6etLsp7vZPt2CMOBWT1PWefqGmzwAsVCNjTcYEbSJJb
 eSDMpCC8tO/+TJWk2mEK1+er5Kz/H9Vbsk8h7crsNqky83dY0hRlyc2vg7AR+QT5/nzR
 sIIIpgcKIFvGXgWHOcLr+R3U9w39f6UvR+bdnsr+0sW84QtFHEmxfUNefif+dnDXUB4h
 YMbsCIyJZwjBOAE//FpqeoYZKUJNfABkN35MGz0b8nygvX/sE/VHM0FzClgysdrUSL0l
 fmhoDrOqTHNhp274S5ZeWK6e8CND4/4d3Wy4AWddxDdmCZUfXfPxDUaFZVE7CkK/Hxd5
 yImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714760765; x=1715365565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOjTMYF0n4eXtqGvQxk2snOMEhYe782CBRhn/PML6D8=;
 b=rWRYkAflpadtVQF0ef6SCIByb1+7T9swyJ7Ad1CX6sTl4fDbLJPTkmJ8AQvrECbR6T
 oXZKNRMfRGbsdigckxQlTdyfDkT54KBB0uFzBmfdro3+d3Ku8pQIlAMgdV3RZ5jbQP0U
 JVMxyVLLCVFtp+UDtMoSkgLtVvdSkhqqbeNSrhw6I2ZJ0dMb0AMcmx00mskD/JD+kz+k
 CsHew7kzCP1TuAkwahaorzjzE109jcNeb0kH6THHrXmthhwfZmBLuipcfKbklEhLBFNq
 GVDX+G24j0fyDCnncyR9SQxnjaRs9F8f0jwHWqap5gwYkd2sQK7Xpxyk5eHypKnIoiGh
 JafA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQU90LJH8lVfsE2dXASHPmQ3VC08YRPfhm1NDYXcwkPXxE65eYq9211/XFAc3cnksDWSO2Qo++7EGc5XctMSjxzDM/kTYbA/mY+qXd0TbnR2Xw3NrTqq80Z1nM5CPPJWfGJQIYkJW7ozbuCyIs3w==
X-Gm-Message-State: AOJu0Ywp9IEMZqwf2BZGpyeCX4JsqARGa6kl47H5pTz/B8X5SD1CAnYB
 qB5QzeodGTprzWQa0vst87SkwxVegjIVNFfZHWjY0wyfQjiNHo1aGNvouvSuUJBN5+tz/TfEFGZ
 YXcVyqJfTksXxpRalA9KwPh2xYtY=
X-Google-Smtp-Source: AGHT+IGZ/Kmmmi5Ij+J3rI067uQ0zaXR4S0WvgNIxiTq/VJsaDLV7wvG1l9k1XDWE5B9TJGPIana2J97g322vSRjRlg=
X-Received: by 2002:a17:90a:eb0e:b0:2ac:8366:8ab4 with SMTP id
 j14-20020a17090aeb0e00b002ac83668ab4mr4045564pjz.38.1714760765104; Fri, 03
 May 2024 11:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
 <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
 <CADnq5_Mp0y559dGHuK2HWJp_UuiknOhvQB90yw_tdOuo1eV8gQ@mail.gmail.com>
 <4705c6e4-04e3-4f97-9f9a-629b6495e92a@igalia.com>
In-Reply-To: <4705c6e4-04e3-4f97-9f9a-629b6495e92a@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 May 2024 14:25:53 -0400
Message-ID: <CADnq5_Nh_EfsdVCNGs+0juaf3-R_fvsJXfkTqaNMEn+vEHqP9w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Tvrtko Ursulin <tursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, May 3, 2024 at 1:06=E2=80=AFPM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
>
> On 03/05/2024 16:58, Alex Deucher wrote:
> > On Fri, May 3, 2024 at 11:33=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> >>
> >> On Fri, May 03, 2024 at 01:58:38PM +0100, Tvrtko Ursulin wrote:
> >>>
> >>> [And I forgot dri-devel.. doing well!]
> >>>
> >>> On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> >>>>
> >>>> [Correcting Christian's email]
> >>>>
> >>>> On 03/05/2024 13:36, Tvrtko Ursulin wrote:
> >>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>>>
> >>>>> Currently it is not well defined what is drm-memory- compared to ot=
her
> >>>>> categories.
> >>>>>
> >>>>> In practice the only driver which emits these keys is amdgpu and in=
 them
> >>>>> exposes the total memory use (including shared).
> >>>>>
> >>>>> Document that drm-memory- and drm-total-memory- are aliases to
> >>>>> prevent any
> >>>>> confusion in the future.
> >>>>>
> >>>>> While at it also clarify that the reserved sub-string 'memory' refe=
rs to
> >>>>> the memory region component.
> >>>>>
> >>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>> Cc: Christian K=C3=B6nig <christian.keonig@amd.com>
> >>>>
> >>>> Mea culpa, I copied the mistake from
> >>>> 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> >>>>
> >>>> Regards,
> >>>>
> >>>> Tvrtko
> >>>>
> >>>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>    Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
> >>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst
> >>>>> b/Documentation/gpu/drm-usage-stats.rst
> >>>>> index 6dc299343b48..ef5c0a0aa477 100644
> >>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>> @@ -128,7 +128,9 @@ Memory
> >>>>>    Each possible memory type which can be used to store buffer
> >>>>> objects by the
> >>>>>    GPU in question shall be given a stable and unique name to be
> >>>>> returned as the
> >>>>> -string here.  The name "memory" is reserved to refer to normal
> >>>>> system memory.
> >>>>> +string here.
> >>>>> +
> >>>>> +The region name "memory" is reserved to refer to normal system mem=
ory.
> >>>>>    Value shall reflect the amount of storage currently consumed by
> >>>>> the buffer
> >>>>>    objects belong to this client, in the respective memory region.
> >>>>> @@ -136,6 +138,9 @@ objects belong to this client, in the respectiv=
e
> >>>>> memory region.
> >>>>>    Default unit shall be bytes with optional unit specifiers of 'Ki=
B'
> >>>>> or 'MiB'
> >>>>>    indicating kibi- or mebi-bytes.
> >>>>> +This is an alias for drm-total-<region> and only one of the two
> >>>>> should be
> >>>>> +present.
> >>
> >> This feels a bit awkward and seems to needlessly complicate fdinfo uap=
i.
> >>
> >> - Could we just patch amdgpu to follow everyone else, and avoid the
> >>    special case? If there's no tool that relies on the special amdgpu
> >>    prefix then that would be a lot easier.
> >>
> >> - If that's not on the table, could we make everyone (with a suitable
> >>    helper or something) just print both variants, so that we again hav=
e
> >>    consisent fdinfo output? Or breaks that a different set of existing
> >>    tools.
> >>
> >> - Finally maybe could we get away with fixing amd by adding the common
> >>    format there, deprecating the old, fixing the tools that would brea=
k and
> >>    then maybe if we're lucky, remove the old one from amdgpu in a year=
 or
> >>    so?
> >
> > I'm not really understanding what amdgpu is doing wrong.  It seems to
> > be following the documentation.  Is the idea that we would like to
> > deprecate drm-memory-<region> in favor of drm-total-<region>?
> > If that's the case, I think the 3rd option is probably the best.  We
> > have a lot of tools and customers using this.  It would have also been
> > nice to have "memory" in the string for the newer ones to avoid
> > conflicts with other things that might be a total or shared in the
> > future, but I guess that ship has sailed.  We should also note that
> > drm-memory-<region> is deprecated.  While we are here, maybe we should
> > clarify the semantics of resident, purgeable, and active.  For
> > example, isn't resident just a duplicate of total?  If the memory was
> > not resident, it would be in a different region.
>
> Amdgpu isn't doing anything wrong. It just appears when the format was
> discussed no one noticed (me included) that the two keys are not clearly
> described. And it looks there also wasn't a plan to handle the uncelar
> duality in the future.
>
> For me deprecating sounds fine, the 3rd option. I understand we would
> only make amdgpu emit both sets of keys and then remove drm-memory- in
> due time.
>
> With regards to key naming, yeah, memory in the name would have been
> nice. We had a lot of discussion on this topic but ship has indeed
> sailed. It is probably workarble for anything new that might come to add
> their prefix. As long as it does not clash with the memory categories is
> should be fine.
>
> In terms of resident semantics, think of it as VIRT vs RES in top(1). It
> is for drivers which allocate backing store lazily, on first use.
>
> Purgeable is for drivers which have a form of MADV_DONTNEED ie.
> currently have backing store but userspace has indicated it can be
> dropped without preserving the content on memory pressure.
>
> Active is when reservation object says there is activity on the buffer.


I think you have the makings for a good patch right here :)

Alex

>
> Regards,
>
> Tvrtko
>
> >
> > Alex
> >
> >>
> >> Uapi that's "either do $foo or on this one driver, do $bar" is just
> >> guaranteed to fragement the ecosystem, so imo that should be the absol=
ute
> >> last resort.
> >> -Sima
> >>
> >>>>> +
> >>>>>    - drm-shared-<region>: <uint> [KiB|MiB]
> >>>>>    The total size of buffers that are shared with another file (e.g=
.,
> >>>>> have more
> >>>>> @@ -145,6 +150,9 @@ than a single handle).
> >>>>>    The total size of buffers that including shared and private memo=
ry.
> >>>>> +This is an alias for drm-memory-<region> and only one of the two
> >>>>> should be
> >>>>> +present.
> >>>>> +
> >>>>>    - drm-resident-<region>: <uint> [KiB|MiB]
> >>>>>    The total size of buffers that are resident in the specified reg=
ion.
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
