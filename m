Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67326AB9090
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 22:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFAC10E960;
	Thu, 15 May 2025 20:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZF50NSpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6010E958;
 Thu, 15 May 2025 20:10:47 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85b4170f1f5so42986439f.3; 
 Thu, 15 May 2025 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339847; x=1747944647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fSgK7ssf2dm8Q7yOhdTUyMWZzsPLlNnfjUB0IW4r/o=;
 b=ZF50NSprlVcQBdVIhsmV5TkGJ8Q92b4y9DZi8GZe3UMKgCkBAS12KDYSuRc5lnsCmi
 ZopRbKArYkfLSv7daUBgvgqH2CKCpw9OE6Zs4kB5YmYPPAnvb9tBez03jl6nSteE0C+U
 2hNRGfcDghgtrHGw8alSwo17gpfckMiKUzxFOvOMRPP2oVKIY78MLXLMtOBUHERBdDzk
 LxEdItO7fylZblj5kirURFVfNRItjeXSCqqQrJjEj4NBQw1r8LcJ6xwWjow1ZEuxQIRr
 lVxIwWKILSVArPDcm1vBpJHKbTn9dXeUxWOjeqG5ceXp0ty3bXn0D/FKAB3g36f0Wtow
 qcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339847; x=1747944647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fSgK7ssf2dm8Q7yOhdTUyMWZzsPLlNnfjUB0IW4r/o=;
 b=EcLafTbdwREB7TOccHnBRnzPfGuO8n6GWCniyUWRd+yPZj0nRzLcQf8krc7uBykO+O
 UW7UMQevDvA8mzP+0mvi6gdhPe8eFI9TWWKdCO2g5BE3vlB+Cq9+MpHa6Xza2NGgqRiy
 pu2teMbXM6RLaTP/EYcNbGwRrQW3B6JQ1LDzh/BYE8YqEPtICe9/wwHf/wNGlkLGTbbX
 8onSbzPKS/oCyIu8Urf1j2OYDXjcieW2u02jOw88p0NKqysfVNkcgkiJwr4tMkbHTLWR
 0M4pXgGUIZ6qbbM6gGAEZ5vjUPqKsZA4NNuYXR1b+3wo7yN4/dYPvUQBssskkTv++1z6
 MWOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU2vh1PHbeuK33VYggLBP9JU8ncAz3fa27dGTj0djgzCdlA6OZM2kDV7SHNu9WFXondI0pfYy0N9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdwISEEtNbVDmc9LnuzrUyibjqY5L2K1odbSAcehd0MlgrOb/P
 2aElz3wyKcmHlr6utzW5UjG8vZJ+Jigv0Lhg0LfBDDkR7kPwMCCm2yFnZ2gEQ7GnnWoBS+xvijo
 Uex+CPCUVtxMfAGK7ENdDQMcTXrT+sKw=
X-Gm-Gg: ASbGncv7LMzTzEaZpxJFsksFn9V1Wbt1BCe10o9VB1w2T9DCP1WfNmFr3495owWWGgt
 2hIu2eX/CSxhdtDKjgGzl0uF69aU41jKY1a2oy5k6N9fxmoaUukHYWgW3Jy969G2aBPSrysCwTk
 /otbQ/pcojVjkYhyH63XDqUsN3pcdDcBz1GRTB5n/ejdLtsciNfwPekSQR09Z9JIsCeLEDFeTeH
 g==
X-Google-Smtp-Source: AGHT+IElYN1Rh6xvHEcxS29AOpeVEBIl+G958Hitti5xJMV3ss/DOnUlfOXj5cBcRSPr0KcHm1EawDhax9vJdzWBanE=
X-Received: by 2002:a05:6602:2744:b0:861:c238:bf03 with SMTP id
 ca18e2360f4ac-86a231ce6cbmr170432639f.8.1747339847033; Thu, 15 May 2025
 13:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
 <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
 <aCYIiJpMe1ljGxqz@pollux>
 <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>
 <aCYpjJPvSOf2RzbU@pollux>
In-Reply-To: <aCYpjJPvSOf2RzbU@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 13:10:34 -0700
X-Gm-Features: AX0GCFs_RUOGNUoophfLe_ZVT4ojoR2aoDzR_PRqcC6i1DAbUuDOdWeHDIPx-Z0
Message-ID: <CAF6AEGuUH6nZCvb3Qayh7Z9ydOmPhTn6rqMifPyagLknbjerng@mail.gmail.com>
Subject: Re: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Thu, May 15, 2025 at 10:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:34:07AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 8:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:
> > >
> > > Thanks for the detailed explanation!
> > >
> > > > On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Eases migration for drivers where VAs don't hold hard reference=
s to
> > > > > > their associated BO, avoiding reference loops.
> > > > > >
> > > > > > In particular, msm uses soft references to optimistically keep =
around
> > > > > > mappings until the BO is distroyed.  Which obviously won't work=
 if the
> > > > > > VA (the mapping) is holding a reference to the BO.
> > > > >
> > > > > Ick! This is all complicated enough. Allow drivers to bypass the =
proper
> > > > > reference counting for GEM objects in the context of VM_BO struct=
ures seems like
> > > > > an insane footgun.
> > > > >
> > > > > I don't understand why MSM would need weak references here. Why d=
oes msm need
> > > > > that, but nouveau, Xe, panthor, PowerVR do not?
> > > >
> > > > Most of those drivers were designed (and had their UABI designed) w=
ith
> > > > gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> > > > about nouveau, but I guess it just got lucky that it's UABI semanti=
cs
> > > > fit having the VMA hold a reference to the BO.
> > > >
> > > > Unfortunately, msm pre-dates sparse.. and in the beginning there wa=
s
> > > > only a single global VM, multiple VMs was something retrofitted ~6y=
rs
> > > > (?) back.  For existing msm, the VMA(s) are implicitly torn down wh=
en
> > > > the GEM obj is freed.  This won't work with the VMA(s) holding hard
> > > > references to the BO.
> > >
> > > Ok, that makes sense to me, but why can't this be changed? I don't se=
e how the
> > > uAPI would be affected, this is just an implementation detail, no?
> >
> > It's about the behaviour of the API, there is no explicit VMA
> > creation/destruction in the uAPI.
>
> But that shouldn't matter? Userspace gives you a BO, the driver creates V=
MAs
> itself, which can have a reference on the VM_BO, which references the ori=
ginal
> BO. At this point you can drop the original reference of the BO and just =
destroy
> all corresponding VMAs once the driver fulfilled the request from userspa=
ce?

Having the submit hold a reference to the VM_BO, and then this funny
looking bit of code in gem_close() gets us part way there:

   vm_bo =3D drm_gpuvm_bo_find(ctx->vm, obj);
   if (vm_bo) {
      drm_gpuvm_bo_put(vm_bo);
      drm_gpuvm_bo_put(vm_bo);
  }

But we still leak BO's used in other VMs.. scanout, and various other
fw and other internal BOs... those would all have to be tracked down
and to find _someplace_ to break the VM_BO  circular reference loop.

> > > > When userspace opts-in to "VM_BIND" mode, which it has to do before
> > > > the VM is created, then we don't set this flag, the VMA holds a har=
d
> > > > reference to the BO as it does with other drivers.  But consider th=
is
> > > > use-case, which is perfectly valid for old (existing) userspace:
> > > >
> > > > 1) Userspace creates a BO
> > > > 2) Submits rendering referencing the BO
> > > > 3) Immediately closes the BO handle, without waiting for the submit=
 to complete
> > > >
> > > > In this case, the submit holds a reference to the BO which holds a
> > > > reference to the VMA.
> > >
> > > Can't you just instead create the VMAs, which hold a reference to the=
 VM_BO,
> > > which holds a reference to the BO, then drop the drop the original BO=
 reference
> > > and finally, when everything is completed, remove all VMAs of the VM_=
BO?
> >
> > Perhaps the submit could hold a ref to the VM_BO instead of the BO to
> > cover that particular case.
> >
> > But for the legacy world, the VMA is implicitly torn down when the BO
> > is freed.  Which will never happen if the VM_BO holds a reference to
> > the BO.
>
> Sure, I get that; what I do not get is why it can't be changed, e.g. in t=
he way
> described above.
>
> > > This should do exactly the same *and* be conformant with GPUVM design=
.
> > >
> > > > Everything is torn down gracefully when the
> > > > submit completes.  But if the VMA held a hard reference to the BO t=
hen
> > > > you'd have a reference loop.
> > > >
> > > > So there really is no other way to use gpuvm _and_ maintain backwar=
ds
> > > > compatibility with the semantics of the pre-VM_BIND UAPI without th=
is
> > > > flag.
> > >
> > > Again, how is this important for maintaining backwards compatibility =
with the
> > > uAPI? This all seems like a driver internal implementation detail to =
me.
> > >
> > > So, is there a technical reason, or is it more that it would be more =
effort on
> > > the driver end to rework things accordingly?
> >
> > If there were a way to work without WEAK_REF, it seems like it would
> > be harder and much less of a drop in change.
>
> So, you're saying there is no technical blocker to rework it?

Not clear.. it would certainly make conversion to gpuvm a much bigger
flag-day, because without WEAK_REF the way gpuvm works is exactly
backwards from how the thing it is replacing works.

BR,
-R
