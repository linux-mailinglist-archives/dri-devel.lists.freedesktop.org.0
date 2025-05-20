Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2ECABDFA3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3810E52C;
	Tue, 20 May 2025 15:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWQ2+hZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F230110E518;
 Tue, 20 May 2025 15:55:09 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3db6ddcef4eso51753405ab.2; 
 Tue, 20 May 2025 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747756507; x=1748361307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QsfE5Ws7A5y4XkBVdsDW8KUKRVAk9/PTVUELtxrBWGA=;
 b=NWQ2+hZt8uWAmUHPTnuswJx88xG9eAWT/ld0Bqbx5h1YMHvVco1jqgSOSXmPPkgylp
 gapARpkq19yblWiFK3sgJwrvZm1+2HRS/ZvVNFctBKfGfjDNVBc5HspLBNuWvzHikeOa
 ocFyLHMAKcwAPm/zVQCs11h08PFFL4wT4kU9ty8Q7Mk5NUMnnpyjbgVtaBeekVYC2Gb+
 IwlDpjoRnrAw3AriwwFtR823HUBOzHO3Qrp2juJs2s7BRsH4RYOK97HJjbBZ4NAySt2/
 /2c3hzwK9T9YAnXc+KS7ylIy+9fnUTbd/3sUpnsdouZbQUF/c3+/TM6yvVHXbtOAGgmR
 DcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747756507; x=1748361307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QsfE5Ws7A5y4XkBVdsDW8KUKRVAk9/PTVUELtxrBWGA=;
 b=W3+8WtAfmG9R66aPhPYDU9K5BbQwmXhBWrN3nAnNqX457lQLTQs6woVlJ8CnvmCXsf
 TlOSUBr/RGrWLsO+6N9FhZuoyonKklgAe3dVOVEDjJBsR3GgWymxi8x8Sq9d+3I3rbIx
 FAtiVauCALpkYv5y3lBk8Ccw8jXtTSFBruCXnqAeeqWTIF0RLSWwgOVavk9Y2cdPgIGu
 wXlHd1HP1Zkfdm9XFH6D92iFVnjrRALhjPtNS/AbNoCp57AKLlVbnQGgk24482coCKQz
 dNSq7Qf6PdmyXHGLryayLPSP/W4P3ZWmDlKb+VjLOLGZrz2zgqOJB3OkV3V9tM6WTV89
 zwqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIDCncvN9pxmksUfhpvkql6SWcCyQsvHiUrqi0PIZiC+82FTvzWBbhd6HtxoJKBZFto/eXoisBRrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA7UjyJgGsF3MfCEJRtDghC3hmJ9IDRH892bhmKW9GC2cMfn5X
 TTQxQJu/kS00KIQYsXtXlaqxCioYkuhYrUzdRU6w0kqsFbCYZCvwjgMz+ungDnKXUVY2hycFcgG
 ItI9yOFGxRQI0tNvYGyi2v4Ndf3QXROQ=
X-Gm-Gg: ASbGncuaYncAs3tAo7IURC27Wik6KO9XKkf5MMidybTXfNWbXB5n7/ZShzDUQy7jDcg
 ISCBbdm1lzslYMKB/vas3XGZTkgRWNfNPnxcPm4EufcxwVFIQ4oF7oX+7CYFEtzV1yWwdzAFurT
 Ac7YB72RgDwUxDa26sx064gONtMNCAOL9qH/LStmYnbmqClPsHvZL7bfmrY6HNBcU=
X-Google-Smtp-Source: AGHT+IFhLr1++r1gjYcEo/FgI0W3OZZ8mTrCTZfvNmuvRbd7YcTCPIl0/iL0jILe3yB2gSChaKoPV9tO234fgVqUVIQ=
X-Received: by 2002:a05:6e02:1745:b0:3d9:36a8:3d98 with SMTP id
 e9e14a558f8ab-3db84296deemr208995435ab.2.1747756505533; Tue, 20 May 2025
 08:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-3-robdclark@gmail.com>
 <aCwx_9KIc9QBd7_0@pollux>
In-Reply-To: <aCwx_9KIc9QBd7_0@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 08:54:53 -0700
X-Gm-Features: AX0GCFstOcmcGHOhFOrI3CrX7srdksd9YcxyBYxwwonSJJrqAmG4Xy5DWrOKG6Y
Message-ID: <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to
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

On Tue, May 20, 2025 at 12:40=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Eases migration for drivers where VAs don't hold hard references to
> > their associated BO, avoiding reference loops.
> >
> > In particular, msm uses soft references to optimistically keep around
> > mappings until the BO is distroyed.  Which obviously won't work if the
> > VA (the mapping) is holding a reference to the BO.
> >
> > By making this a per-VM flag, we can use normal hard-references for
> > mappings in a "VM_BIND" managed VM, but soft references in other cases,
> > such as kernel-internal VMs (for display scanout, etc).
> >
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
> >  include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
> >  2 files changed, 49 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 1e89a98caad4..892b62130ff8 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpu=
vm,
> >       LIST_HEAD(extobjs);
> >       int ret =3D 0;
> >
> > +     WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
>
> No, here and below, please don't scatter WARN_ON() calls in various code =
paths
> for this hack.

I do prefer WARN_ON()s to make it clear what is or is not proper
usage, but if you really don't want them I can remove them.

> This won't ever be a valid and supported mode, please keep the diff as sm=
all as
> possible.
>
> <snip>
>
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 2a9629377633..652e0fb66413 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
> >        */
> >       DRM_GPUVM_RESV_PROTECTED =3D BIT(0),
> >
> > +     /**
> > +      * @DRM_GPUVM_VA_WEAK_REF:
> > +      *
> > +      * Flag indicating that the &drm_gpuva (or more correctly, the
> > +      * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_obj=
ect.
> > +      * This mode is intended to ease migration to drm_gpuvm for drive=
rs
> > +      * where the GEM object holds a referece to the VA, rather than t=
he
> > +      * other way around.
> > +      *
> > +      * In this mode, drm_gpuvm does not track evicted or external obj=
ects.
> > +      * It is intended for legacy mode, where the needed objects are a=
ttached
> > +      * to the command submission ioctl, therefore this tracking is un=
needed.
> > +      */
> > +     DRM_GPUVM_VA_WEAK_REF =3D BIT(1),
>
> As mentioned in v4, I do *not* agree with making this a valid and support=
ed
> mode. If at all, it should be an exception for MSM, i.e.
> DRM_GPUVM_MSM_LEGACY_QUIRK with an explicit approval from Dave / Sima [1]=
.

I can rename it if you really insist, but "legacy" implies it is
something that will go away.

Unfortunately there is too much map/unmap cost for things like
pageflip, so the VM related to scanout will continue to use this mode
forever, even if all of the userspace related VMs are not using this
flag.  If I could opportunistically keep around a mapping while using
gpuvm as it is "intended", I would.  But I don't see how that can work
when the VMA/VM_BO holds a reference to the GEM object.

> It invalidates the whole design and makes a lot of functions fundamentall=
y
> invalid to call, which is well demonstrated by all the WARN_ON() calls th=
is
> patch attempts to add.

I think of it more as adding a different mode of operation.  One
where, perhaps some functions of gpuvm are not available, but that is
fine because they are also unneeded in that mode of operation.  Hence
the WARN_ON()s to make that clear.

BR,
-R

> > +
> >       /**
> >        * @DRM_GPUVM_USERBITS: user defined bits
> >        */
> > -     DRM_GPUVM_USERBITS =3D BIT(1),
> > +     DRM_GPUVM_USERBITS =3D BIT(2),
> >  };
>
> [1] https://lore.kernel.org/dri-devel/aCb-72KH-NrzvGXy@pollux/
