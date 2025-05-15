Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30370AB8A16
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3210E8E1;
	Thu, 15 May 2025 14:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EHpgWPn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C4510E8F0;
 Thu, 15 May 2025 14:59:30 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3db703f0fe7so2424575ab.3; 
 Thu, 15 May 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747321169; x=1747925969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ai3JE2gRuo1DcIeGYlU0Q0agCFDCnQ/jtzqrbDxw6yY=;
 b=EHpgWPn1JmgvnpIz66g9YmPC4queEC6hXuMLDJjJjWohpbgqzrUixuQO+/etoUZUkH
 UpfUwNzY/9BxLMQ+iaWQgEkWrh14QP9qvTIvBDTN9edhtp39Wd0g1X2zrs5KsCtlnlzA
 VS0dEfaXHIvJ6Pqo8KJjfIHxGc9vswjMaBdY8dHchGnwA9L2YCc/bZCitTv293P2+hjf
 HlK/0/EDwi0Ijh6xA8WNTmR/oaAUbrPbZOY2EA6Ff7MNXFlsU5iPJR1Wst8OOzdnSjlc
 UYVhjg8G/DTUgV7ee9oT1XEPiF7DpWiYYEqHCMcqGCQoXWc2LdSfQRpYoxibTHQruciR
 wyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321169; x=1747925969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ai3JE2gRuo1DcIeGYlU0Q0agCFDCnQ/jtzqrbDxw6yY=;
 b=fgXD/HVzBpaRmbkzJ/GVfXUlHLHuet2I8FsKpo8sBqxYivI7yy8eiy4UU8+XcU0Ik0
 mtPufVWxxXYAsbVXdgofbPY1x75ZQcT/fnwBSQLmdRZ1mheCsiN6PxTVxUavS9ij+Ti6
 rD++sSVp+DzIB9ZNXk6HBO4p3x6gaaeJARqBWqoLFhfh89cKtCxhAlGrZ7sb4GBKM2ev
 +rEcLyV8t5AlGkE/cUxnQAHSNpSlN8L6w9MlDzdfP9Y90TWGIBJ2SzV7qLyoCJoSGGYb
 PIHTL2wubCUjoxkJt2RJOBKsorRl1SL8X3nSnsfM9atV2wNXngrgYwgvyY5Rea7DXABW
 nuQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrgADPjNHUJeVtwPxzmmItKi3a1+P50juUsLX0N46vfrP41s/eOUiVoOay7UNITijQW1s8U+cCGhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyEa3/vgRhQJNuA7UuGgeLWbVh1WjktVPEyhNaxE1+I+AUQYGo
 O71oJ9JVaGvroSQhGP9aZVZ76C3sPnADXMS7z8NnVvMQGA0yrowbqZrdGJXUwAhNnSsTNuw0NvK
 OQ4IUMB2lEiUQnXx+smvsxZ0XN18=
X-Gm-Gg: ASbGncundmfq1p3ZxIWVV4K+4WxQp+m/gb667zoxjQiMbXR+WqQO1CHrodcrO+hEWub
 2rOSdk+FgLigRjo68Uq1Aqda+3sflySjFWUlvmjqz4v4pFmtDut954/4xwB5Df6i7tpBwbs440u
 pmpyP+9ZH0tFpSdvGzfFPctJk+PQb8R78pmf+/NB5To3PFQL99U0EZVG48b4ir1SijT3WxZwQt
X-Google-Smtp-Source: AGHT+IFhwb1aHVDWQT2DotxPddMrIXAsyc7GtSwGLdaPnNhe4mmVsOhHkzr0eOCiBxROadLks/dyF/DiJSTcnVlhE4c=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6c9a:f35d with SMTP id
 e9e14a558f8ab-3db6f7ad066mr76962555ab.10.1747321169233; Thu, 15 May 2025
 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
 <aCWtINcOUWciwx8L@pollux>
In-Reply-To: <aCWtINcOUWciwx8L@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 07:59:16 -0700
X-Gm-Features: AX0GCFvg3Gk9PZrr9NChGdOFWYav5BAv3wwqizYexi8V7IxD4FVYadqwmvbUzQM
Message-ID: <CAF6AEGsm6JgK6QQe7se6bzv6QLnm-sxsJRmv=r3OWKhf6rfOSA@mail.gmail.com>
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

On Thu, May 15, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Eases migration for drivers where VAs don't hold hard references to
> > their associated BO, avoiding reference loops.
> >
> > In particular, msm uses soft references to optimistically keep around
> > mappings until the BO is distroyed.  Which obviously won't work if the
> > VA (the mapping) is holding a reference to the BO.
>
> Ick! This is all complicated enough. Allow drivers to bypass the proper
> reference counting for GEM objects in the context of VM_BO structures see=
ms like
> an insane footgun.
>
> I don't understand why MSM would need weak references here. Why does msm =
need
> that, but nouveau, Xe, panthor, PowerVR do not?

Most of those drivers were designed (and had their UABI designed) with
gpuvm, or at least sparse, in mind from the get go.  I'm not sure
about nouveau, but I guess it just got lucky that it's UABI semantics
fit having the VMA hold a reference to the BO.

Unfortunately, msm pre-dates sparse.. and in the beginning there was
only a single global VM, multiple VMs was something retrofitted ~6yrs
(?) back.  For existing msm, the VMA(s) are implicitly torn down when
the GEM obj is freed.  This won't work with the VMA(s) holding hard
references to the BO.

When userspace opts-in to "VM_BIND" mode, which it has to do before
the VM is created, then we don't set this flag, the VMA holds a hard
reference to the BO as it does with other drivers.  But consider this
use-case, which is perfectly valid for old (existing) userspace:

1) Userspace creates a BO
2) Submits rendering referencing the BO
3) Immediately closes the BO handle, without waiting for the submit to comp=
lete

In this case, the submit holds a reference to the BO which holds a
reference to the VMA.  Everything is torn down gracefully when the
submit completes.  But if the VMA held a hard reference to the BO then
you'd have a reference loop.

So there really is no other way to use gpuvm _and_ maintain backwards
compatibility with the semantics of the pre-VM_BIND UAPI without this
flag.

Fortunately DRM_GPUVM_VA_WEAK_REF is minimally intrusive.  Otherwise I
probably would have had to fork my own copy of gpuvm.

BR,
-R
