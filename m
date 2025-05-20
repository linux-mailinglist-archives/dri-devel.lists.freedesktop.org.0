Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD432ABDDFB
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304610E50E;
	Tue, 20 May 2025 14:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LJ8rbh3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569C710E4FC;
 Tue, 20 May 2025 14:57:49 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-86a55400875so74259839f.3; 
 Tue, 20 May 2025 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747753068; x=1748357868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ei0ZtzeEerH4n95EU2nYvZiHQHmnnzxXV15jRRTIMlc=;
 b=LJ8rbh3F9LQ4mNCmz+WZK1zRzCgIXb7zb2ouotnRQg/cp2EoUOIL8XB7+BdCO6Y5KW
 xq3yi/2l4PFH7skSz05G338YU0yjmt9Oky0SLaWKLOAn3OFQiHo7G5gQhNPbh+/uoAiw
 rGHBWvYjQE96nmeMLeeQo1ZLANESZqhDHEC7UtKOiWFOPWJvcvPEmQVfS6yRfbxr7mMn
 T/kULmQJlFGyWd8+TmW4GmP+wlCJKBBreCSCELGqVQWyveO1feqL+3hAvbyCP1o1m5fY
 x4FV7x1xL+jWfIrk09AYGLL3BLgloPqamZghwN75YwofKn79HdFezDdrEggMcclPG3+l
 Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747753068; x=1748357868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ei0ZtzeEerH4n95EU2nYvZiHQHmnnzxXV15jRRTIMlc=;
 b=BfT5xKu59i29eU1YivlMcu69D1NS05yXIV+Jybn670huHX7unb0hhCP0VL1nBtpaw/
 gUSp0aBS9HCa7pUmfKKCTM4iemooeulq3VU4d67yuobWV2TcXHnT1tk70wwtrsfgfczH
 vEw7BysuRp/t4POfPO1uC6GDP5LmlncYngTwU1Rg064BmI9LTZDz0ZXkDFHBuGvGO/x9
 fnwoeBfh8AVCjJ5a6jD69doRW2mdNRfxbTU13xb5j49ICrWcmjW1FOTTd9E9Z7fbX2at
 ylKjbm0x1/f3IxMrqWqz9Z771BS2gKrwU4mVaH5Om/umo+NAafyGNqPKsKWEo7hLuDml
 kElw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvZNG1MC48i1vMpY74qp9XZnlev4mlb6+65xTDafGe544mGqsPpSyZQ/9Ad5ZbgIwxhZ4h0ls4VPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbjPn7FogFWUyZ91pLb+KQBLwfx+BT8kpcmv8bFXClvCeVOwTT
 6MsKRmtBzPtK3avt+T4z83a7REzyXq47scnsjUn7PIvm8oN3FE5E3E39I8M00INCuOiR/Apj2IW
 mCwZ0yglWfTvHyeZ2tUeG9eag1thEcsY=
X-Gm-Gg: ASbGnct5+bO+6frMo/ompxWwMRjSZtHsH1ci588PMe4BNQD61o3rByYFijrp6dO5GZO
 DrYy9ry+uA3Q6bd0bvZ+7b5r+3bvArbEfeaGUTybCqJZdVnH4SJMVbfimBo7W2qwHPa0PgBoB2a
 e8oaK2eRZjcC6mhlofB5XQcXmDQzy1+vXdzxiGpdmd10Ar7mgquFWFzixqd0Y5efqRcwk=
X-Google-Smtp-Source: AGHT+IGo54Ph3lgCr2HThw2nynX0CfUtauGHA+UWZQjPIR4SenpHhKIQf4v2aZNtBDgA8aoC9oBCpwohCLzgA971GNc=
X-Received: by 2002:a05:6602:7284:b0:86a:26c8:4ba0 with SMTP id
 ca18e2360f4ac-86a26c84ca2mr1970379239f.8.1747753068536; Tue, 20 May 2025
 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux>
In-Reply-To: <aCwt20O7SH1zQLlV@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 07:57:36 -0700
X-Gm-Features: AX0GCFv7Ss4yKUe43JHrMItzf4ycbR76G6yDyHTTaHf43qdoHHxEMm7hFngKuk8
Message-ID: <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
Subject: Re: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor
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

On Tue, May 20, 2025 at 12:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > msm_gem_free_object()") for justification.
>
> I asked for a proper commit message in v4.

Sorry, I forgot that, here is what I am adding:

Destroying a GEM object is a special case.  Acquiring the resv lock
when the object is being freed can cause a locking order inversion
between reservation_ww_class_mutex and fs_reclaim.

This deadlock is not actually possible, because no one should be
already holding the lock when free_object() is called.
Unfortunately lockdep is not aware of this detail.  So when the
refcount drops to zero, we pretend it is already locked.

> Only referring to a driver commit and let the people figure out how the d=
river
> works and what it does in order to motivate a change in the generic
> infrastructure is simply unreasonable.
>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index f9eb56f24bef..1e89a98caad4 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> >
> > -     drm_gem_gpuva_assert_lock_held(obj);
> > +     if (kref_read(&obj->refcount) > 0)
> > +             drm_gem_gpuva_assert_lock_held(obj);
>
> Again, this is broken. What if the reference count drops to zero right af=
ter
> the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is cal=
led?

No, it is not.  If you find yourself having this race condition, then
you already have bigger problems.  There are only two valid cases when
drm_gpuvm_bo_destroy() is called.  Either:

1) You somehow hold a reference to the GEM object, in which case the
refcount will be a positive integer.  Maybe you race but on either
side of the race you have a value that is greater than zero.
2) Or, you are calling this in the GEM object destructor path, in
which case no one else should have a reference to the object, so it
isn't possible to race

If the refcount drops to zero after the check, you are about to blow
up regardless.

BR,
-R

> Putting conditionals on a refcount is always suspicious.
>
> If you still really want this, please guard it with
>
>         if (unlikely(gpuvm->flags & DRM_GPUVM_MSM_LEGACY_QUIRK))
>
> and get an explicit waiver from Dave / Sima.
>
