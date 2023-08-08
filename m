Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9B77407A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 19:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7610E3B8;
	Tue,  8 Aug 2023 17:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0BA10E1FD;
 Tue,  8 Aug 2023 17:03:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so7626139a12.2; 
 Tue, 08 Aug 2023 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691514228; x=1692119028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCtF+tlL9RHfHxmqFs9C5rEqPpa4jyBqd3r5LEKKols=;
 b=aBZltA2/j9gJFH0DRcIaD9UZ+V275GL4XmWvgdVWIUuVgUcK27xI5Ww5ou0S7ZgVMr
 snr8roKmVsjyHHP11xm9jT1M/Zp+uryGzqDuWIWnEzOxZ7D0ygH5UFIvdvX3eFJIMWIH
 G3VOIqnsf8GUXZY1dL3Bzcj3/Z8a8eGMNdO3vIFIJqH3hfYVuF5F0lXDnqZ1uE4LtLuX
 CDgwjYrk3+fPOwLG8R+U4eN3LV6sSG1M0xr7TjY1vQIQaz5YSfS66mP8qo23BCxne606
 h1CAp1VACppO8pFyUmq4aByRHoPBHz1f4Uf7NWs4wvGQfUPrmGlFOcMrNqTFl3go/TMV
 8Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691514228; x=1692119028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCtF+tlL9RHfHxmqFs9C5rEqPpa4jyBqd3r5LEKKols=;
 b=EwuwRRxChxyP9pXC1nTcnVlvuaujXh3dpNL4l1TkRtnqsWPmMve5dAsJL0ybQymJcT
 JmXXky8pV+1qucEqOWumwrVmfbC0Eqsryf6+scT+4YoOk0V+Y7UJrBb1hoeXET2bRwUd
 Vct3kXy38qo7yCrIJzXHnvsy+n+29jJb/ZfD9KYAgdfLIJshWXwgMfhGg2VFkRwJcQ8b
 j41Lc5cTTbiwOMaLccIpy8n+XAd9JLXrq0MBD8eXXa39OLyFxIs56CTnpcR+eEaKdmjR
 GAsF+am9a/7erUGsaanki/gdTUIzurEMioWzUwn2pBgmRCu7G5wbsGDFJF+Vs0Mklaxd
 Lumg==
X-Gm-Message-State: AOJu0YxZUYgNVXBErTNtkyinrgmh8kdr4BNrZFkRpRHkn6xOsd8k1l3G
 WbOZ7j/OY9rlHZNKznbubaRYDVpKpWzvh8BCaAn2kbgd
X-Google-Smtp-Source: AGHT+IGiRf3LjW21hBgVZPw8p0E39D05fmYq9Nt6u/oqdz7fmoq9LG0DSAo2VVHnZ97EOoXBgYqFG2/wFndCouOjoWo=
X-Received: by 2002:aa7:d04c:0:b0:523:9c4:544f with SMTP id
 n12-20020aa7d04c000000b0052309c4544fmr386743edo.31.1691514227607; Tue, 08 Aug
 2023 10:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
 <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
In-Reply-To: <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 8 Aug 2023 13:03:11 -0400
Message-ID: <CAAxE2A48uybsU6DY+fLTzQ9K2b0Ln+SW6bt3capbGAGb7L8fvQ@mail.gmail.com>
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
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the same situation as SIGSEGV. A process can catch the signal,
but if it doesn't, it gets killed. GL and Vulkan APIs give you a way
to catch the GPU error and prevent the process termination. If you
don't use the API, you'll get undefined behavior, which means anything
can happen, including process termination.



Marek

On Tue, Aug 8, 2023 at 8:14=E2=80=AFAM Sebastian Wick <sebastian.wick@redha=
t.com> wrote:
>
> On Fri, Aug 4, 2023 at 3:03=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> >
> > On Tue, Jun 27, 2023 at 10:23:23AM -0300, Andr=C3=A9 Almeida wrote:
> > > Create a section that specifies how to deal with DRM device resets fo=
r
> > > kernel and userspace drivers.
> > >
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > > ---
> > >
> > > v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@i=
galia.com/
> > >
> > > Changes:
> > >  - Grammar fixes (Randy)
> > >
> > >  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 68 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-u=
api.rst
> > > index 65fb3036a580..3cbffa25ed93 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a =
third handler for
> > >  mmapped regular files. Threads cause additional pain with signal
> > >  handling as well.
> > >
> > > +Device reset
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The GPU stack is really complex and is prone to errors, from hardwar=
e bugs,
> > > +faulty applications and everything in between the many layers. Some =
errors
> > > +require resetting the device in order to make the device usable agai=
n. This
> > > +sections describes the expectations for DRM and usermode drivers whe=
n a
> > > +device resets and how to propagate the reset status.
> > > +
> > > +Kernel Mode Driver
> > > +------------------
> > > +
> > > +The KMD is responsible for checking if the device needs a reset, and=
 to perform
> > > +it as needed. Usually a hang is detected when a job gets stuck execu=
ting. KMD
> > > +should keep track of resets, because userspace can query any time ab=
out the
> > > +reset stats for an specific context. This is needed to propagate to =
the rest of
> > > +the stack that a reset has happened. Currently, this is implemented =
by each
> > > +driver separately, with no common DRM interface.
> > > +
> > > +User Mode Driver
> > > +----------------
> > > +
> > > +The UMD should check before submitting new commands to the KMD if th=
e device has
> > > +been reset, and this can be checked more often if the UMD requires i=
t. After
> > > +detecting a reset, UMD will then proceed to report it to the applica=
tion using
> > > +the appropriate API error code, as explained in the section below ab=
out
> > > +robustness.
> > > +
> > > +Robustness
> > > +----------
> > > +
> > > +The only way to try to keep an application working after a reset is =
if it
> > > +complies with the robustness aspects of the graphical API that it is=
 using.
> > > +
> > > +Graphical APIs provide ways to applications to deal with device rese=
ts. However,
> > > +there is no guarantee that the app will use such features correctly,=
 and the
> > > +UMD can implement policies to close the app if it is a repeating off=
ender,
> >
> > Not sure whether this one here is due to my input, but s/UMD/KMD. Repea=
t
> > offender killing is more a policy where the kernel enforces policy, and=
 no
> > longer up to userspace to dtrt (because very clearly userspace is not
> > really doing the right thing anymore when it's just hanging the gpu in =
an
> > endless loop). Also maybe tune it down further to something like "the
> > kernel driver may implemnent ..."
> >
> > In my opinion the umd shouldn't implement these kind of magic guesses, =
the
> > entire point of robustness apis is to delegate responsibility for
> > correctly recovering to the application. And the kernel is left with
> > enforcing fair resource usage policies (which eventually might be a
> > cgroups limit on how much gpu time you're allowed to waste with gpu
> > resets).
>
> Killing apps that the kernel thinks are misbehaving really doesn't
> seem like a good idea to me. What if the process is a service getting
> restarted after getting killed? What if killing that process leaves
> the system in a bad state?
>
> Can't the kernel provide some information to user space so that e.g.
> systemd can handle those situations?
>
> > > +likely in a broken loop. This is done to ensure that it does not kee=
p blocking
> > > +the user interface from being correctly displayed. This should be do=
ne even if
> > > +the app is correct but happens to trigger some bug in the hardware/d=
river.
> > > +
> > > +OpenGL
> > > +~~~~~~
> > > +
> > > +Apps using OpenGL should use the available robust interfaces, like t=
he
> > > +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL=
 ES). This
> > > +interface tells if a reset has happened, and if so, all the context =
state is
> > > +considered lost and the app proceeds by creating new ones. If it is =
possible to
> > > +determine that robustness is not in use, the UMD will terminate the =
app when a
> > > +reset is detected, giving that the contexts are lost and the app won=
't be able
> > > +to figure this out and recreate the contexts.
> > > +
> > > +Vulkan
> > > +~~~~~~
> > > +
> > > +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for subm=
issions.
> > > +This error code means, among other things, that a device reset has h=
appened and
> > > +it needs to recreate the contexts to keep going.
> > > +
> > > +Reporting causes of resets
> > > +--------------------------
> > > +
> > > +Apart from propagating the reset through the stack so apps can recov=
er, it's
> > > +really useful for driver developers to learn more about what caused =
the reset in
> > > +first place. DRM devices should make use of devcoredump to store rel=
evant
> > > +information about the reset, so this information can be added to use=
r bug
> > > +reports.
> >
> > Since we do not seem to have a solid consensus in the community about
> > non-robust userspace, maybe we could just document that lack of consens=
us
> > to unblock this patch? Something like this:
> >
> > Non-Robust Userspace
> > --------------------
> >
> > Userspace that doesn't support robust interfaces (like an non-robust
> > OpenGL context or API without any robustness support like libva) leave =
the
> > robustness handling entirely to the userspace driver. There is no stron=
g
> > community consensus on what the userspace driver should do in that case=
,
> > since all reasonable approaches have some clear downsides.
> >
> > With the s/UMD/KMD/ further up and maybe something added to record the
> > non-robustness non-consensus:
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Cheers, Daniel
> >
> >
> >
> > > +
> > >  .. _drm_driver_ioctl:
> > >
> > >  IOCTL Support on Device Nodes
> > > --
> > > 2.41.0
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >
>
