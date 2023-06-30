Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021E743E1D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 16:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABDF10E17B;
	Fri, 30 Jun 2023 14:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52B710E17B;
 Fri, 30 Jun 2023 14:59:32 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56368c40e8eso1299521eaf.0; 
 Fri, 30 Jun 2023 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688137172; x=1690729172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5cxsukGjLHHC1AN7ZlOB+yLFNetCgrCMOChXyND0rU=;
 b=sF9HfKk9QEjWB4Fdw7VAY+2nywDHlUUmr+X/gp0dvkoHIWjEO8ozQ/1RBrYLbietcx
 7z+rhxly55VHVxKAX5Cba8MrBaxJ64HtLIKmhb6b08e2vNQukIqc2op5IwX/IAHEUkvR
 k3Fl8MBajuH5T7uWI/2kSBD+wbgG1Zq6+PjfQQ07OVKAln+mudKDT/ZlFq7IJx+oTkJq
 sgeXt0kCvJgklnCijNDbk7HhcNhaj/rBfDmrg28fq3a1dMqDHJuvqnhWqjRYE6PAS3LW
 0ElYX5iDjnZ0ic0Qca6Mko1VvEDg4Q7Su/ZpsSgDKSK1IfcGWcoEUiKel+2Gg2G5Gxy9
 Q1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688137172; x=1690729172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5cxsukGjLHHC1AN7ZlOB+yLFNetCgrCMOChXyND0rU=;
 b=lGRO03owUHMF2aucrwA1TDY4dS4LH5H+elRfyyW+mQRZkGIsCVinKCOA2a5gChOo56
 Tq8F6DYTOFLxPhjtkTByWVDaDv68wG7kJnCcMTuWj1CgPZyGryw6qH/59BCTSC3Prqky
 daIG7E5lNtxg1281+w1ZM46Jf8PT2BBupmmH/yiqsJlNw42U+mVObicj9fML5YGKA2om
 TY3TLGjhYwT6SmU5gK1JSeXkOuySA0D3pPf2ihgFJ/IM0WdqFEPwxrGVqQfIH5pRtwAQ
 fKXuof/L5FVHrBg3zFvWCTOHMxXE+sf8N/8kpixneIqmy6CCdzfdbjwkWujzHAiXLJv1
 osXg==
X-Gm-Message-State: AC+VfDyMq34YBCudXYXsWTJe23l+xFGbfeyaglJr36zKsslYSr5PsJCK
 zuTR24XdQJcjt1xDJKBMNGmoq2t0l64msSuACWU=
X-Google-Smtp-Source: ACHHUZ77fjzUEM9CA4oSgFRsjc0KmDYWjQOtVtPAdU6RYQI2Jo7gL72m5X51hiPMIMsCWEHPqb9+UuQwGec0/RyECV4=
X-Received: by 2002:a4a:1d81:0:b0:565:c862:ad77 with SMTP id
 123-20020a4a1d81000000b00565c862ad77mr2081087oog.5.1688137171633; Fri, 30 Jun
 2023 07:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
In-Reply-To: <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Jun 2023 10:59:20 -0400
Message-ID: <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@i=
galia.com> wrote:
> >
> > Create a section that specifies how to deal with DRM device resets for
> > kernel and userspace drivers.
> >
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >
> > v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@iga=
lia.com/
> >
> > Changes:
> >  - Grammar fixes (Randy)
> >
> >  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 65fb3036a580..3cbffa25ed93 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a th=
ird handler for
> >  mmapped regular files. Threads cause additional pain with signal
> >  handling as well.
> >
> > +Device reset
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The GPU stack is really complex and is prone to errors, from hardware =
bugs,
> > +faulty applications and everything in between the many layers. Some er=
rors
> > +require resetting the device in order to make the device usable again.=
 This
> > +sections describes the expectations for DRM and usermode drivers when =
a
> > +device resets and how to propagate the reset status.
> > +
> > +Kernel Mode Driver
> > +------------------
> > +
> > +The KMD is responsible for checking if the device needs a reset, and t=
o perform
> > +it as needed. Usually a hang is detected when a job gets stuck executi=
ng. KMD
> > +should keep track of resets, because userspace can query any time abou=
t the
> > +reset stats for an specific context. This is needed to propagate to th=
e rest of
> > +the stack that a reset has happened. Currently, this is implemented by=
 each
> > +driver separately, with no common DRM interface.
> > +
> > +User Mode Driver
> > +----------------
> > +
> > +The UMD should check before submitting new commands to the KMD if the =
device has
> > +been reset, and this can be checked more often if the UMD requires it.=
 After
> > +detecting a reset, UMD will then proceed to report it to the applicati=
on using
> > +the appropriate API error code, as explained in the section below abou=
t
> > +robustness.
> > +
> > +Robustness
> > +----------
> > +
> > +The only way to try to keep an application working after a reset is if=
 it
> > +complies with the robustness aspects of the graphical API that it is u=
sing.
> > +
> > +Graphical APIs provide ways to applications to deal with device resets=
. However,
> > +there is no guarantee that the app will use such features correctly, a=
nd the
> > +UMD can implement policies to close the app if it is a repeating offen=
der,
> > +likely in a broken loop. This is done to ensure that it does not keep =
blocking
> > +the user interface from being correctly displayed. This should be done=
 even if
> > +the app is correct but happens to trigger some bug in the hardware/dri=
ver.
>
> I still don't think it's good to let the kernel arbitrarily kill
> processes that it thinks are not well-behaved based on some heuristics
> and policy.
>
> Can't this be outsourced to user space? Expose the information about
> processes causing a device and let e.g. systemd deal with coming up
> with a policy and with killing stuff.

I don't think it's the kernel doing the killing, it would be the UMD.
E.g., if the app is guilty and doesn't support robustness the UMD can
just call exit().

Alex

>
> > +
> > +OpenGL
> > +~~~~~~
> > +
> > +Apps using OpenGL should use the available robust interfaces, like the
> > +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL E=
S). This
> > +interface tells if a reset has happened, and if so, all the context st=
ate is
> > +considered lost and the app proceeds by creating new ones. If it is po=
ssible to
> > +determine that robustness is not in use, the UMD will terminate the ap=
p when a
> > +reset is detected, giving that the contexts are lost and the app won't=
 be able
> > +to figure this out and recreate the contexts.
> > +
> > +Vulkan
> > +~~~~~~
> > +
> > +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submis=
sions.
> > +This error code means, among other things, that a device reset has hap=
pened and
> > +it needs to recreate the contexts to keep going.
> > +
> > +Reporting causes of resets
> > +--------------------------
> > +
> > +Apart from propagating the reset through the stack so apps can recover=
, it's
> > +really useful for driver developers to learn more about what caused th=
e reset in
> > +first place. DRM devices should make use of devcoredump to store relev=
ant
> > +information about the reset, so this information can be added to user =
bug
> > +reports.
> > +
> >  .. _drm_driver_ioctl:
> >
> >  IOCTL Support on Device Nodes
> > --
> > 2.41.0
> >
>
