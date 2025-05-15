Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05EAB8DE2
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7310E930;
	Thu, 15 May 2025 17:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q2TnIda0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852210E92F;
 Thu, 15 May 2025 17:35:35 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3db6d399491so8490535ab.3; 
 Thu, 15 May 2025 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747330535; x=1747935335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PSWCzGj/sFmI0Io82xchkWTY2rx5nyZZObNQUeNmKM=;
 b=Q2TnIda0K7AvvfWQiTVVhPuzQXg4lsJH7mVusfCs9uGoVF09OsFagGWTp42NjbyY3/
 K3ytETTWB9qCHNtdvoua4WxawrgBnImzW5lRN/+qxm5NaZ6XvQab62x2azL30ULbBuje
 fJ/MXqog0pQ8kU2nQjEQlBkObgUyKspjuQI1NEIyQTeAHCajvJr9+udI8LxB64tYuBLZ
 YmLCdvrpPZ6ZrA/SVMzeV80EniaNXcMs8uuI4Kw1fUh6pGV76i4iP/kpNEh8HPPs4Pco
 JtO6Q3gf5pFo2a85NbRiqErrVKtjZjTGbYAf/FE9khmSlBAnanK6a6HZ/EbeajZrIl1b
 1UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747330535; x=1747935335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PSWCzGj/sFmI0Io82xchkWTY2rx5nyZZObNQUeNmKM=;
 b=I6YeLraPwhq6UqBAUblsohg7KjMPQ+/dIoHVao9UrVqToTsWr0tu95eHtB4EkDnJ1a
 CghLltjps+r2FKQL8axAtoltc9CTymuuqeWqQbWgBHE6c7u6igY0pOSIp6JdWVeAiltb
 I5hxFTvxVUoujvzCo7C4GPbYnwM1yx6rYPEktCJuLt1AUArRAGcvRMsQwmyvcxeNHvhY
 joTFX5DUKrN5wIlMrseQzsZfmxOQrKAydOZ/F7bmHSK+0yUzAW4QlrGGzcN103tkCwY4
 A5Q99/bHhZj9xyzo3kg2xdxOM9+FiBKJMrqWI4Gcpknbzqf5zPGWw+M9jpAe+/tanuMX
 wwMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl1/+Muimg2Fav6e5Vy8qpAqZaqFytYNK0h1vdqlsKjPfhncbHEBW42E506AQpvwxGj0DkqkAZGs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh+q1vQz4Q0FTtw540jx0nH8mtg/mNWTbWv6bKhLTA7xJ+mh2X
 46lvb1kxJwaGsALE5XglLSeeqJbUqRw43hkToMf/NeFnLp59iHgQ5BH5IDRYr02Fhy0upb2YbFM
 yoq2gjRbqxNRXEe//wPgEX7s4ZpNsE3U=
X-Gm-Gg: ASbGnctbaHp956RPYdEoHB1d79zmXLEv9i2y2dqwwnfPuA5ox9FWGMydAIGtKsbZZal
 sb+r0hHfR0G3CLQuZtFmrqosY9ULyEJNQ5sFfnnrhLab6wvUkN/O8GLKu/b9uH5CQDbssqexNd7
 1OXNYRBM0HQ2Ta6m/CiHOwbLGLe+/+wUyDM9JqORty+eGmxFC1yOeEvqTa2Ll0dxQ=
X-Google-Smtp-Source: AGHT+IFnaHJhSF+qXjOEZChRhVJP0IqHwViZVyYjv9k8vn50TZKP4xP35nskjmikmzxxjX7AMj6ULqg71EZXsTUnIzQ=
X-Received: by 2002:a05:6e02:1745:b0:3db:6c09:a60d with SMTP id
 e9e14a558f8ab-3db84334772mr8200605ab.19.1747330534821; Thu, 15 May 2025
 10:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
In-Reply-To: <aCWueFzx2QzF7LVg@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:35:21 -0700
X-Gm-Features: AX0GCFumvveyUAOWs_iSbi5WGXb00N8fVXFXgYWhep6HNXGCfYgtjmCwkBKdiEY
Message-ID: <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
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

On Thu, May 15, 2025 at 2:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 10:54:27AM +0200, Danilo Krummrich wrote:
> > Hi Rob,
> >
> > Can you please CC me on patches for GPUVM?
> >
> > On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> > > msm_gem_free_object()") for justification.
> >
> > Please write a proper commit message that explains the problem and the =
solution.
> > Please don't just refer to another commit and leave it to the reviewer =
of the
> > patch to figure this out.
> >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> >
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.=
c
> > > index f9eb56f24bef..1e89a98caad4 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > >     drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > >     drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > >
> > > -   drm_gem_gpuva_assert_lock_held(obj);
> > > +   if (kref_read(&obj->refcount) > 0)
> > > +           drm_gem_gpuva_assert_lock_held(obj);
> > > +
> > >     list_del(&vm_bo->list.entry.gem);
> >
> > This seems wrong.
> >
> > A VM_BO object keeps a reference of the underlying GEM object, so this =
should
> > never happen.
> >
> > This function calls drm_gem_object_put() before it returns.
>
> I noticed your subsequent patch that allows VM_BO structures to have weak
> references to GEM objects.
>
> However, even with that this seems wrong. If the reference count of the G=
EM
> object is zero when drm_gpuvm_bo_destroy() is called it means that the GE=
M
> object is dead. However, until drm_gpuvm_bo_destroy() is called the GEM o=
bject
> potentially remains to be on the extobj and eviced list, which means that=
 other
> code paths might fetch it from those lists and consider it to be a valid =
GEM
> object.

We only iterate extobj or evicted in VM_BIND mode, where we aren't
using WEAK_REF.  I suppose some WARN_ON()s or BUG_ON()s could make
this more clear.

BR,
-R
