Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCDAB8DD7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07410E929;
	Thu, 15 May 2025 17:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jbnr2F6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46A110E929;
 Thu, 15 May 2025 17:34:21 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-867355d9c4eso30072939f.0; 
 Thu, 15 May 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747330461; x=1747935261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBvq9UI2sATIO55B70P6yA+6iJUThTyZYQiqWABHx6U=;
 b=Jbnr2F6n2F9Qc0FZ7NJwqnoRiQ7Bjq3Gt3Y8c31uVsAOOx5PqnSh1FlGYPBQFMpDTk
 YusgsUCT273nk9Fn9rB7S6vH/2pLXYCAPwqv17X+gf6jAh0+oJ91S4JLfN6tsG5UrNCI
 euW/S7qbBvrgGx5BcReHIT5BH9k69/SHuc7/rvo7Ht362tv/s7GsFISJJv+PGFSoMddG
 oSGAAs0zQVkBwStI0s+79Xr9DNXpGFxCRlqVE7zmocmU9DeiOVFzGROj2tnEreYfRKzU
 OMI8uRJIT8pPdPatTxKaGu9Hg6TG2PXO++wns+cSC3Ouroosl7T0kwhYuMCmpoqe+ha3
 ZAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747330461; x=1747935261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBvq9UI2sATIO55B70P6yA+6iJUThTyZYQiqWABHx6U=;
 b=hb/rBDgst4R8cQUaAIfesVv29r9r3TaNA1nySQhAjkK1bmwih2nkvWApuajjdx2bXA
 235T/ZfTwGShcTKUnqwcMN4WX4T8//smtQTOpErebTM9i6lSV5hhjGlpojP44i10xygl
 Xwmaa0AUec1tniSkXKQqQPFxoM9oMl4LROSROKHn5zreEMMOK9o1D1ColPtVLFaPVK4S
 av15Gfi3rkvKsWma4QE9fuWDeJ1kO5+2C2RYeGkegbSA6fyc+AG9Fzlck6/za+Sq31PZ
 n4oEMB0xMnDTQAEIq+2IaFaPK8JTKp0Oc0gylEblsyDdveE/R/L/4cHb62Q98FlyBzQI
 YGIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWeAPjGCU7jnHXON13mah24VoFog6oCT8fqfFWdCqXWrYVRuICXqTxbE7ANtfAG5ImcC/KqA5HAW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm4E/5qGj2JVejsulUYUgUttcV04sFINeWMccn4xVjnIuiRyCn
 Awskw4L6iRcmPJAQ7tHmOIJuhHSo13DHn6A4ymHS2kWbMecuh+fUMGk3tOrg6XurTFGtiU9pogi
 PUx5j2CdT+zW8jPZ8GgG9ws9xzgwuBZo=
X-Gm-Gg: ASbGnctkVCuvdEzniyatXEsLzf7Nkn7ctV+XTLqcU42GEhCFSVKrRz4b/mexQ7xbJFY
 0biWAwBSn3xooLAsoUUqtflNt7egr6Vot57hVDwqSr2NFChSvFnJzdMq9TQ271Ujdj+7lATLOsp
 NcXdNdYObBQH57glVF/dTswEMS0WkWUdMNXAWR+higJ3oDThVbaq1QP8VR8cyrAGs=
X-Google-Smtp-Source: AGHT+IFo7dA4rLp6ykvkJGelKTIBK/jYm2mycq9pSqylADODrZL4vePtqwPyU+VeHrif1+6q3HNeRs0zSX7JtstjEZM=
X-Received: by 2002:a05:6e02:1a27:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3db842b9d5amr9264885ab.7.1747330460697; Thu, 15 May 2025
 10:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
 <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
 <aCYIiJpMe1ljGxqz@pollux>
In-Reply-To: <aCYIiJpMe1ljGxqz@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:34:07 -0700
X-Gm-Features: AX0GCFuIl_V8-qE_5cvk8OrrV6aLtTAWInICihd0L8AvsvwbHBJVwOGaN3l2YtI
Message-ID: <CAF6AEGvLpekBNLxVOavkXJtcZZQBH6WznKA=F0Jn9idxBMypkA@mail.gmail.com>
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

On Thu, May 15, 2025 at 8:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 07:59:16AM -0700, Rob Clark wrote:
>
> Thanks for the detailed explanation!
>
> > On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Eases migration for drivers where VAs don't hold hard references to
> > > > their associated BO, avoiding reference loops.
> > > >
> > > > In particular, msm uses soft references to optimistically keep arou=
nd
> > > > mappings until the BO is distroyed.  Which obviously won't work if =
the
> > > > VA (the mapping) is holding a reference to the BO.
> > >
> > > Ick! This is all complicated enough. Allow drivers to bypass the prop=
er
> > > reference counting for GEM objects in the context of VM_BO structures=
 seems like
> > > an insane footgun.
> > >
> > > I don't understand why MSM would need weak references here. Why does =
msm need
> > > that, but nouveau, Xe, panthor, PowerVR do not?
> >
> > Most of those drivers were designed (and had their UABI designed) with
> > gpuvm, or at least sparse, in mind from the get go.  I'm not sure
> > about nouveau, but I guess it just got lucky that it's UABI semantics
> > fit having the VMA hold a reference to the BO.
> >
> > Unfortunately, msm pre-dates sparse.. and in the beginning there was
> > only a single global VM, multiple VMs was something retrofitted ~6yrs
> > (?) back.  For existing msm, the VMA(s) are implicitly torn down when
> > the GEM obj is freed.  This won't work with the VMA(s) holding hard
> > references to the BO.
>
> Ok, that makes sense to me, but why can't this be changed? I don't see ho=
w the
> uAPI would be affected, this is just an implementation detail, no?

It's about the behaviour of the API, there is no explicit VMA
creation/destruction in the uAPI.

> > When userspace opts-in to "VM_BIND" mode, which it has to do before
> > the VM is created, then we don't set this flag, the VMA holds a hard
> > reference to the BO as it does with other drivers.  But consider this
> > use-case, which is perfectly valid for old (existing) userspace:
> >
> > 1) Userspace creates a BO
> > 2) Submits rendering referencing the BO
> > 3) Immediately closes the BO handle, without waiting for the submit to =
complete
> >
> > In this case, the submit holds a reference to the BO which holds a
> > reference to the VMA.
>
> Can't you just instead create the VMAs, which hold a reference to the VM_=
BO,
> which holds a reference to the BO, then drop the drop the original BO ref=
erence
> and finally, when everything is completed, remove all VMAs of the VM_BO?

Perhaps the submit could hold a ref to the VM_BO instead of the BO to
cover that particular case.

But for the legacy world, the VMA is implicitly torn down when the BO
is freed.  Which will never happen if the VM_BO holds a reference to
the BO.

> This should do exactly the same *and* be conformant with GPUVM design.
>
> > Everything is torn down gracefully when the
> > submit completes.  But if the VMA held a hard reference to the BO then
> > you'd have a reference loop.
> >
> > So there really is no other way to use gpuvm _and_ maintain backwards
> > compatibility with the semantics of the pre-VM_BIND UAPI without this
> > flag.
>
> Again, how is this important for maintaining backwards compatibility with=
 the
> uAPI? This all seems like a driver internal implementation detail to me.
>
> So, is there a technical reason, or is it more that it would be more effo=
rt on
> the driver end to rework things accordingly?

If there were a way to work without WEAK_REF, it seems like it would
be harder and much less of a drop in change.

BR,
-R

> > Fortunately DRM_GPUVM_VA_WEAK_REF is minimally intrusive.  Otherwise I
> > probably would have had to fork my own copy of gpuvm.
> >
> > BR,
> > -R
