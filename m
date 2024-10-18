Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027159A425D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88D310E95E;
	Fri, 18 Oct 2024 15:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H8zSSoTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2CA10E95A;
 Fri, 18 Oct 2024 15:31:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e2ee0a47fdso391364a91.2; 
 Fri, 18 Oct 2024 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729265491; x=1729870291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ldtwzz9dPyek80LPE/AbHGfWkHGRej6147EyoNOJ5yY=;
 b=H8zSSoTaqZvj0+FAZT/tSzZ9qbSHS76S2AhTURGaUPcm2RxJYVkyJIXoORhtJCwuPk
 VkHM6isZz/3gXr1CGaEW/6nnfFnR0G0IoLalJaremxg4Q6iXYJ3zdLN6Nwm4NNxYp3+c
 MGhi8chEEGIg2oncZj7rPebOrlcKhuB3NbH/AU8zEMMKPigVqTGzOCLupieAtbzHo5mh
 Cneq+RyMBTotVGfL2H4DXUKUux9clPrMjPjfPASvylioHWCQvX5dhsyBCOJIXljhrqrO
 ciAEIwBUr8sFalFPKJEbnkcRKGETk47kzZ9+KrDaBDOxCXLvn+UtCc5LUZkDJsDS77HL
 mkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729265491; x=1729870291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ldtwzz9dPyek80LPE/AbHGfWkHGRej6147EyoNOJ5yY=;
 b=hkFWMPZTN1EUl+lGG9VsSSE+VWP329F6goiNDKH4eh9dHrGqqvop5KG02UAsXnQexD
 fOM997iPy2DdY763mECxr/9WKjx8JkIWyEybuI2PC018GxyQ6/3EYmPuoPjhb6tQWteX
 TmG5SBLnVagcRWnfVRr/WWX8IWqhZT9+aHloBdSc9VBppc1pGHD4mggGU30GI8go7xmo
 ILoxrIWDaNIn9zPRl41IrMjGOSjbwW3RZB1ExWZ+fD2MahRO/xPvhSCobIrc8sKn1qIj
 Z/tSteyMqhfgju4GTYimj7nXOaKKovD3vLX75lh8W42mJjdobxUWv/kF1UQSea7sa//o
 L9Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9BPM+ZgdD2daFaJm+0rO6Vf79kP2BBK8S4RAtC+VGat6N96lZDBtF1+3Q2xrCFfRnLP6pH0hyEzI=@lists.freedesktop.org,
 AJvYcCUWGxBP+NKoQgCVv6N3p8NXfUnDUSC7/PCu3u2889YNwKbcfank3MH5BBotdcjTqVIWTecL/cpKTYee@lists.freedesktop.org,
 AJvYcCXbq4RNMLhuuDv2AHzKkjd4vb/lX4FGpW3SrB2knBv6TFPAzVblodasYET8OkZVOeC0Npl+Hfpa/T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAMQZnQzIhwhf7mZbMvoIKwXlVUxW7zb9VwJfHFZl6kHyR0Bir
 IfTUgO88dTu7iEuZvTmrPWewAExGgjQTJk0GkGYrk62Eh51VBGypf4CeAlE5Q3d8VoSAlf371ua
 QDwNYziUiS/MoG7zVOytnvwpByKI=
X-Google-Smtp-Source: AGHT+IF/tdKk/gJ/37NPc9zFsXrZmNU3+hcYqkeofokDnJmNFroyywmAlvwHvFMZbDwQn+wylmHuC3AAUptMpBM7Ms0=
X-Received: by 2002:a17:90a:e001:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e5616d7091mr1470739a91.1.1729265490928; Fri, 18 Oct 2024
 08:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com> <ZxJ3DJWY9Lsc9Mn4@intel.com>
In-Reply-To: <ZxJ3DJWY9Lsc9Mn4@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Oct 2024 11:31:17 -0400
Message-ID: <CADnq5_M62YZRvBT7sQwrZTiHrUsifaqqgrWOD_z+YY=EiBtEcA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org, 
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com, 
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 lucas.demarchi@intel.com, tursulin@ursulin.net, francois.dugast@intel.com, 
 jani.nikula@linux.intel.com, airlied@gmail.com, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com, 
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com, 
 andriy.shevchenko@linux.intel.com, lina@asahilina.net, kernel-dev@igalia.com, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Fri, Oct 18, 2024 at 11:23=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@intel.c=
om> wrote:
>
> On Thu, Oct 17, 2024 at 04:16:09PM -0300, Andr=C3=A9 Almeida wrote:
> > Hi Raag,
> >
> > Em 30/09/2024 04:38, Raag Jadav escreveu:
> > > Introduce device wedged event, which will notify userspace of wedged
> > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > useful especially in cases where the device is no longer operating as
> > > expected even after a hardware reset and has become unrecoverable fro=
m
> > > driver context.
> > >
> > > Purpose of this implementation is to provide drivers a generic way to
> > > recover with the help of userspace intervention. Different drivers ma=
y
> > > have different ideas of a "wedged device" depending on their hardware
> > > implementation, and hence the vendor agnostic nature of the event.
> > > It is up to the drivers to decide when they see the need for recovery
> > > and how they want to recover from the available methods.
> > >
> > > Current implementation defines three recovery methods, out of which,
> > > drivers can choose to support any one or multiple of them. Preferred
> > > recovery method will be sent in the uevent environment as WEDGED=3D<m=
ethod>.
> > > Userspace consumers (sysadmin) can define udev rules to parse this ev=
ent
> > > and take respective action to recover the device.
> > >
> > >      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > >      Recovery method Consumer expectations
> > >      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > >      rebind          unbind + rebind driver
> > >      bus-reset       unbind + reset bus device + rebind
> > >      reboot          reboot system
> > >      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > >
> > >
> >
> > I proposed something similar in the past: https://lore.kernel.org/dri-d=
evel/20221125175203.52481-1-andrealmeid@igalia.com/
> >
> > The motivation was that amdgpu was getting stuck after every GPU reset,=
 and
> > there was just a black screen. The uevent would then trigger a daemon t=
o
> > reset the compositor and getting things back together. As you can see i=
n my
> > thread, the feature was blocked in favor of getting better overall GPU =
reset
> > from the kernel side.
> >
> > Which kind of scenarios are making i915/xe the need to have userspace
> > involvement? I tested a bunch of resets in i915 but never managed to ge=
t the
> > driver stuck.
>
> 2 scenarios:
>
> 1. Multiple levels of reset has failed and device was declared wedged. Th=
is is
> rare indeed as the resets improved a lot.
> 2. Debug case. We can boot the driver with option to declare device wedge=
d at
> any timeout, so the device can be debugged.
>
> >
> > For the bus-reset, amdgpu does that too, but it doesn't require userspa=
ce
> > intervention.
>
> How do you trigger that?

What do you mean by bus reset?  I think Chrisitian is just referring
to a full adapter reset (as opposed to a queue reset or something more
fine grained).  Driver can reset the device via MMIO or firmware,
depending on the device.  I think there are also PCI helpers for
things like PCI FLR.

Alex
