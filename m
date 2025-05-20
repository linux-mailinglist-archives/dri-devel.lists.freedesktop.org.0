Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278AABDF6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D65310E556;
	Tue, 20 May 2025 15:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iDHO4QuI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1D10E4F1;
 Tue, 20 May 2025 15:45:38 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3db6ddcef4eso51686605ab.2; 
 Tue, 20 May 2025 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747755938; x=1748360738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fp84fGNOuFO7OjTxwwcVzPOPzNM836aZSD99K/DTOaI=;
 b=iDHO4QuIXXlbYGB9WEUz/581iOMKdJZVcURvLSvGSwMDI5S6Dfl/IJ7iYTBt8oyU5g
 OEznr+D1DbNEKzbFLDLT8HoVTb6GB7BX4re+GmkUmpt5XLtjRCe6EmUJtFayOSfqAd/x
 OjS3/BK3nW6TDYaa/Egs+rHCxc6MAbIap+qIerha+LP2nnk+NiNe7pZXe76PRhKkglrY
 L7cS5466fQ2iF4FcBL65UnNNFtq26iIdxcpIcz/gLboQGbcny7HVSMANKmyItKpKoCI3
 v735vLvRwGyn49q1zvn/7D+iQmz6d9U2029NgQyzJGWNn5Le70OBy2nikXmme61o+bz8
 wdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747755938; x=1748360738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fp84fGNOuFO7OjTxwwcVzPOPzNM836aZSD99K/DTOaI=;
 b=BWhXqAEauM+wm8NdZ6ualH+Qdt8h/8PK6PZ2Uc8kAtASSNXdcSlStez52/hT7lWoF0
 uDim7J3wjVwuXzZJYcWzWRtI8BVTa5X+w4hDzTNLytHWpUsYZn8a4peVoWD47wEAKfq1
 OM4piWlvKP+4hJ19pmCqh5BmCkKrOSM7QYs0EFkf4YwIJcH+yInmpmWRvP+xvcTnMEuh
 6p8MPMAJvlju0jlv1scXmLLcCantX8I0QZ2ugbD/K4Ce0xYIvLrBATSEqCcrEGz86g5o
 D2cZ/wKNyiEYBoKLOvVEEanJ44RWIW03kOxLxsk83KaBkmdJbSN91PqJWfqq0IL2agOp
 fXyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2lXWogd+TLnBlT6Pd6ygkAHS604cXQ11AUFZhP9OMx0zLud7sm0o4WeRrRP5cKpvb+bhNZHbcPlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9Drjq7wBdAmr24xTHQiQZFlKuBZXT3jpSKFsGcBIftJjo3s+H
 97jQBYOk1EGIgNxJzpL+Z43M5OWDDc72jXdWJX7KRT0Q3EkyO0XyBer+9sLVAMq9ynCq604pg8f
 OsLKn2lsVRRRkzrBAF1Mrcq+RzuG/OHM=
X-Gm-Gg: ASbGncvicP0Xx76AA7spX+BFg1KXJZFkjzOZEtmk0Ctd0FpI/I8oBCW3LMeKmM9WtWW
 lpxtyezX0luQa4fcdffTL6q8u0jpXYhekvt2Ml9QDeac8xYBz178ACllAM2+jb5W1/JzEk8BBCG
 apCphMDIisUmQr5HtKtWq4dDN89iOGoWs6m+9GTlk9mckRb7M7X5uCGMbone3MgqU=
X-Google-Smtp-Source: AGHT+IGN4Ae7MiwjqshqSOwa9RnPofm6UHtNufRI9UB2oE3FTsd5H9lYro9NuySAd/VoEiz241eDHysLB6CB02f8MRY=
X-Received: by 2002:a05:6e02:349c:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3db842ba729mr175051425ab.9.1747755937061; Tue, 20 May 2025
 08:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-2-robdclark@gmail.com>
 <aCwt20O7SH1zQLlV@pollux>
 <CAF6AEGvhxeCAz41F72hq=V3aD38jm+aUQqX3GwaOR4uzZGn6hg@mail.gmail.com>
 <aCyeAb0vnQqPVbiz@cassiopeiae>
In-Reply-To: <aCyeAb0vnQqPVbiz@cassiopeiae>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 08:45:24 -0700
X-Gm-Features: AX0GCFulaFKe4klpF3pskjrtIWjPk_gcNZG-3xTib3dA0tMpi1eMCo98W3HAy0U
Message-ID: <CAF6AEGvegfkAeMA9-3PZN3wectQwt7=YVHoDxoK2fJcjOLbH2g@mail.gmail.com>
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

On Tue, May 20, 2025 at 8:21=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 07:57:36AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 12:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > > On Mon, May 19, 2025 at 10:51:24AM -0700, Rob Clark wrote:
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuv=
m.c
> > > > index f9eb56f24bef..1e89a98caad4 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > >       drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > >       drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > >
> > > > -     drm_gem_gpuva_assert_lock_held(obj);
> > > > +     if (kref_read(&obj->refcount) > 0)
> > > > +             drm_gem_gpuva_assert_lock_held(obj);
> > >
> > > Again, this is broken. What if the reference count drops to zero righ=
t after
> > > the kref_read() check, but before drm_gem_gpuva_assert_lock_held() is=
 called?
> >
> > No, it is not.  If you find yourself having this race condition, then
> > you already have bigger problems.  There are only two valid cases when
> > drm_gpuvm_bo_destroy() is called.  Either:
> >
> > 1) You somehow hold a reference to the GEM object, in which case the
> > refcount will be a positive integer.  Maybe you race but on either
> > side of the race you have a value that is greater than zero.
> > 2) Or, you are calling this in the GEM object destructor path, in
> > which case no one else should have a reference to the object, so it
> > isn't possible to race
>
> What about:
>
> 3) You destroy the VM_BO, because the VM is destroyed, but someone else (=
e.g.
>    another VM) holds a reference of this BO, which is dropped concurrentl=
y?

I mean, that is already broken, so I'm not sure what your point is?

This patch is specifically about the case were VMAs are torn down in
gem->free_object().

BR,
-R

> Please don't tell me "but MSM doesn't do that". This is generic infrastru=
cture,
> it is perfectly valid for drivers to do that.
>
> > If the refcount drops to zero after the check, you are about to blow
> > up regardless.
>
> Exactly, that's why the whole approach of removing the reference count a =
VM_BO
> has on the BO, i.e. the proposed DRM_GPUVM_VA_WEAK_REF is broken.
>
> As mentioned, make it DRM_GPUVM_MSM_LEGACY_QUIRK and get an approval from=
 Dave /
> Sima for it.
>
> You can't make DRM_GPUVM_VA_WEAK_REF work as a generic thing without brea=
king
> the whole design and lifetimes of GPUVM.
>
> We'd just end up with tons of traps for drivers with lots of WARN_ON() pa=
ths and
> footguns like the one above if a driver works slightly different than MSM=
.
