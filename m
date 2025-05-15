Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F559AB91F5
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 23:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD5F10E96B;
	Thu, 15 May 2025 21:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IjdnVIL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A248610E96B;
 Thu, 15 May 2025 21:58:00 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-861d7a09c88so36158539f.2; 
 Thu, 15 May 2025 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747346279; x=1747951079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWPIGi65hQLBAgzuyd+N24zLjShm5Vi7JZs1Wtdqzgg=;
 b=IjdnVIL6mwb+inSJ4DTrEWj9CDgdiDx/6dFAqk22Nswh3VV0NI3f06i2DHpTQ21F3F
 M5KCluNGDkOnnKc7gzwVZOqAirn/IxKsAEWGW5B0QgDFbrwKxG6zmHk4nBQJG4H2XPU2
 XmT5LbPjZSbqrLZEOwmWL8bW4fW7ONRRneccoNqn4UbEbILf2YvbIAoVmnrodhwAOcxg
 qNX6/boRESBZMlgwRNqqoanmdtO0qrKbz1WKlAYCAwUXSCUCQxqtTc2z+oH3JfdmR7EK
 ihVU4FkcR0BKNyxVb+2dTz26aCGhjPT0UcmUEAeB1sgs48PL/jX47MmT1ahiRcmHANjD
 0pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747346279; x=1747951079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWPIGi65hQLBAgzuyd+N24zLjShm5Vi7JZs1Wtdqzgg=;
 b=HOv8YN5oBufZkZ8qqVKeDruFtyZrfEdQ7pfeMqUj7IZRPOsiBd8yN2Ag50f2x3vmOX
 8aZ+t8ijlXC8dAy68LsUqYQop3Ls48afZRhTE3+pakZ2tygFCQWo7akthJ9f/LdA1EBP
 B/pwTLDXEwyDmr1tx1SEQsmbgDPtA4ETQ9ieQ862nKn7Ujoat2M5X7BNgg6Zc8IYABuU
 A8oL8giA3wfaqFI3zu+Da6LEl24pwmruzIdfgZJ2RygLwA/ozUpi2+mCpEhSlsKbQ12k
 TIksEDNfHqobHdvdJHheisC2KMiBmPuzUNy4wL54Z1OPPkPHY0SZjAlTVjqPVEOtkSC3
 1L0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEskYy4XZJF4sEHS3IHLAr/A4fT9BrBrMbxgOBCI4Az2bQ8gfc2YCC60HUrQSQ0TvHUuJAtAG/1n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS1ai/4T7p6DYQCLLIJrZmkYfsKuP3OmCXcEmlekcxey04wP+J
 yKG/3kc5EXx/Poty6G4eLdffeMnDr5oHzHX4mgYKeS4LjcBYiRWrRPlgcO7V/lFVIwr78KMZzel
 T8h4TZO0MBzCdN5vypCaGJF0EBZmlyVc=
X-Gm-Gg: ASbGncucnU0VkY/fsSYkUmkI6KkqiDBSS4lloqaMA8qyNnFp9fnUIPvBuD9C4/1ELPe
 XCrqq1aEJIZfnkSAgad6z2asaDn+foHpu11szO/0DjafoVo7OR+vbCAN951v5+eUM4OtVY0STQF
 b4UcwcUEiLJvbEj2dCAag7A6kuX6ggglJDvojYIJQ6avMClsst16IveCsr0PPWPqU=
X-Google-Smtp-Source: AGHT+IGZP3ADNraxTdjsvTc5WLL4t8pJQzUr1tqWOb0/phnP0YQRlQC1v5nNou1wGhWO4usCosXrLStB1fTg71/ymrw=
X-Received: by 2002:a05:6602:4c0e:b0:864:9cc7:b847 with SMTP id
 ca18e2360f4ac-86a24df598emr71745639f.14.1747346279173; Thu, 15 May 2025
 14:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
In-Reply-To: <aCYqlvp_T77LyuMa@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 14:57:46 -0700
X-Gm-Features: AX0GCFs6YgaO4c1gJb_pjyiu_k16Ux8vtO0EyxRMsKZHeJCwowWkm7UmCmbyt6U
Message-ID: <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
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

On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:35:21AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 2:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> > > > Hi Rob,
> > > >
> > > > Can you please CC me on patches for GPUVM?
> > > >
> > > > On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > > > > msm_gem_free_object()") for justification.
> > > >
> > > > Please write a proper commit message that explains the problem and =
the solution.
> > > > Please don't just refer to another commit and leave it to the revie=
wer of the
> > > > patch to figure this out.
> > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > >
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gp=
uvm.c
> > > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > > >     drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > > >     drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > > >
> > > > > -   drm_gem_gpuva_assert_lock_held(obj);
> > > > > +   if (kref_read(&obj->refcount) > 0)
> > > > > +           drm_gem_gpuva_assert_lock_held(obj);
> > > > > +
> > > > >     list_del(&vm_bo->list.entry.gem);
> > > >
> > > > This seems wrong.
> > > >
> > > > A VM_BO object keeps a reference of the underlying GEM object, so t=
his should
> > > > never happen.
> > > >
> > > > This function calls drm_gem_object_put() before it returns.
> > >
> > > I noticed your subsequent patch that allows VM_BO structures to have =
weak
> > > references to GEM objects.
> > >
> > > However, even with that this seems wrong. If the reference count of t=
he GEM
> > > object is zero when drm_gpuvm_bo_destroy() is called it means that th=
e GEM
> > > object is dead. However, until drm_gpuvm_bo_destroy() is called the G=
EM object
> > > potentially remains to be on the extobj and eviced list, which means =
that other
> > > code paths might fetch it from those lists and consider it to be a va=
lid GEM
> > > object.
> >
> > We only iterate extobj or evicted in VM_BIND mode, where we aren't
> > using WEAK_REF.  I suppose some WARN_ON()s or BUG_ON()s could make
> > this more clear.
>
> There is also the GEM object's list of VM_BOs, are you using that?

yes, but at this point there are no more ref's to the obj, and that
list is obj specific

> Anyways, I don't agree with that. Even if you can tweak your driver to no=
t run
> into trouble with this, we can't introduce a mode that violates GOUVM's i=
nternal
> lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
>
> I still don't see a real technical reason why msm can't be reworked to fo=
llow
> those lifetime rules.

The basic issue is that (a) it would be really awkward to have two
side-by-side VM/VMA management/tracking systems.  But in legacy mode,
we have the opposite direction of reference holding.  (But at the same
time, don't need/use most of the features of gpuvm.)

BR,
-R
