Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3781E645D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 16:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944756E591;
	Thu, 28 May 2020 14:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026566E593
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:45:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r15so3447842wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4/DQ8UHj3eZ+O03nohqRZylPD0WAI0q2xFdTgEVVQxc=;
 b=h3QWjDFwwX7fCm95VL9+fugs0sO2Vm14ewAJtiDcXaiBC/mE/wx5JbNwBkf/cJe1Xd
 U0dblIo/cVi3L5KCDZ2myPB1Ti3lHTnq9LxjmIroMWcIGLSOZxJ5hlTMVPc7nac9E4o2
 B2L+t2yGeS/XRt5SzU6CFOdpZ7kW5MKdpCpJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4/DQ8UHj3eZ+O03nohqRZylPD0WAI0q2xFdTgEVVQxc=;
 b=hwqZLLBr7rQBS1tkXU2YQmmON95vK2gD1zbZ4RV/LcVLArFXHte4uOLEa4VM54psVm
 BAGgNW3Dgo6Z9r+PyJn8C/DfGb6eLDj+lsZV+/Pib6qRSYIS2fhd31Zvlcz2lkNndX5u
 /TAeGLb17oDaVDlXSlbNR75DDj/Beb+3LFMSqgKBa6KrkkRTZv5PFjhpSNM1/grXZRu5
 uxYktvXjVkWwlKNLbKloUEv4DiyTmfNLHe/3Nilk8hvFDESQQCFp9XBbJ/R5VVPDTNGv
 yElUe4VGeme60PkViLgFpOTJflJqxtwEs6wmoi0Ox7J/Q5JH1sSQyAeNlNC8TkwYvpR8
 mScQ==
X-Gm-Message-State: AOAM532ovZEjPdzDQgXFyuY0Yd+x+tx3whnDDuvzO3cRGoFIvqHfa+m6
 7xtozXm0HLXMEzLfx+9MhpWrAg==
X-Google-Smtp-Source: ABdhPJz3tbP8gMSJUvzKfOwHkcrjLYNi+j5ufyHtMYdKSnqBEfwyjzSyQfm9qZcFv7TVmNcge7BRKg==
X-Received: by 2002:a1c:e40a:: with SMTP id b10mr3659016wmh.41.1590677148475; 
 Thu, 28 May 2020 07:45:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h5sm6239731wrw.85.2020.05.28.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 07:45:47 -0700 (PDT)
Date: Thu, 28 May 2020 16:45:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200528144545.GU206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
 <20200525142804.GD206103@phenom.ffwll.local>
 <20200525175519.0289a728@eldfell.localdomain>
 <20200525150955.GI206103@phenom.ffwll.local>
 <20200528151402.17aaeb9d@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528151402.17aaeb9d@eldfell.localdomain>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 03:27:57PM +0300, Pekka Paalanen wrote:
> On Mon, 25 May 2020 17:09:55 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> =

> > On Mon, May 25, 2020 at 05:55:19PM +0300, Pekka Paalanen wrote:
> > > On Mon, 25 May 2020 16:28:04 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   =

> > > > On Wed, May 20, 2020 at 10:50:41AM -0400, Andrey Grodzovsky wrote:  =

> > > > > =

> > > > > On 5/20/20 8:46 AM, Daniel Vetter wrote:    =

> > > > > > On Wed, May 20, 2020 at 02:19:08PM +0300, Pekka Paalanen wrote:=
    =

> > > > > > > On Tue, 19 May 2020 10:37:12 -0400
> > > > > > > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > > > > > >     =

> > > > > > > > Thanks for the summary, does put things in order and makes =
it easier to
> > > > > > > > comprehend all the TODOs, some questions bellow
> > > > > > > > =

> > > > > > > > On 5/19/20 6:06 AM, Pekka Paalanen wrote:    =

> > > > > > > > > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > > =

> > > > > > > > > Set up the expectations on how hot-unplugging a DRM devic=
e should look like to
> > > > > > > > > userspace.
> =

> ...
> =

> > > > > So currently drm_ioctl will just check for drm_dev_is_unplugged a=
nd return
> > > > > -ENODEV at the very beginning of the function (https://elixir.boo=
tlin.com/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L825)
> > > > > meaning that currently we blanket failure any IOCTL in case the d=
evice is
> > > > > unplagued (ignoring the race condition if the device unplugged af=
ter the
> > > > > check). So do we want to remove this check and put it only for re=
nder ioctls
> > > > > (which are those ? e.g. for amdgpu there is=A0 AMDGPU_CS ioctl) b=
ut not for
> > > > > mode setting/dma_buf_import/dma_buf_export ioctls ? What about ot=
her types
> > > > > of ioctls which are non of the listed above ?    =

> > > > =

> > > > Hm right, and this goes back all the way to first usb udl support:
> > > > =

> > > > commit 2c07a21d6fb0be47fda696a618b726ea258ed1dd
> > > > Author: Dave Airlie <airlied@redhat.com>
> > > > Date:   Mon Feb 20 14:18:07 2012 +0000
> > > > =

> > > >     drm: add core support for unplugging a device (v2)
> > > > =

> > > > So I guess we need to change the uapi docs to explain that. Not sure
> > > > everyone can cope, but I guess they better do. Since the use-case b=
ack
> > > > then was just udl, so simple legacy kms only, the damage was probab=
ly
> > > > rather limited. I'm not sure we can get away with that now, where k=
ms code
> > > > has spread to funny places likey vulkan winsys code.
> > > > =

> > > > Or maybe we want a file priv flag you can set along the lines of "g=
ive me
> > > > less shitty hotunplug semantics for ioctls". Or maybe we can just c=
hange
> > > > the semantics, not crashing&burning shouldn't cause a regression :-)
> > > > =

> > > > For everything else (mmap, dma-buf fd, sync_file fd, syncobj fd) I =
think
> > > > the discussion is still more or less accurate.
> > > > =

> > > > Pekka, any thoughts?  =

> > > =

> > > Hi,
> > > =

> > > is ENODEV unique to this particular failure?  =

> > =

> > Not really sure, we'd need to audit all of drm ...
> =

> $ git ngrep ENODEV -- drivers/gpu/drm | wc -l
> 762
> =

> Yeah, grep is not enough.
> =

> > > Returning errors instead of faking success was my first idea, but you
> > > already convinced me that faking is at least as good if not better. :=
-)
> > > =

> > > So as long as the error code returned is unique to hot-unplug or other
> > > "oops, the device is gone" conditions, I think I'm fine. Weston does
> > > not handle ENODEV any way, it never did, and it certainly cannot be
> > > called a kernel regression.
> > > =

> > > As a Weston developer, I don't mind adding checks for ENODEV. But if I
> > > don't have to, even better. Weston is going to need more code to hand=
le
> > > DRM device unplug in any case.
> > > =

> > > Sorry, no preference from me. ;-)
> > > =

> > > I do agree that replacing ENODEV with fake success is hard to imagine
> > > regressing anything. It's something you can do in the kernel at any
> > > time easily, but going from fake success to error is going to be
> > > painful. Maybe don't change things until there is a good reason to?
> > > =

> > > We need a kernel that doesn't crash before we can properly test what
> > > would be best for userspace, fake or error.  =

> > =

> > One upshot of faking stuff and only bailing in low-level hw code is that
> > it makes validating the races when you hotunplug easier - if we remove =
the
> > early bail-out check even an ioctl later on will look like it raced with
> > the hotunplug path in the kernel. So better assurance that things won't
> > blow up badly.
> > =

> > Otoh the early bail out in the top-level ioctl code increases the odds
> > that you'll survive even on a driver that's totally buggy.
> > =

> > So yeah I guess maybe we should just document that currently you get an
> > -ENODEV and maybe have the option mentioned that we might change this
> > going forward. See also
> > =

> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioct=
l-return-values
> > =

> > I think that needs an update, at least clarify that "not present" inclu=
des
> > "no longer present".
> =

> So if dmabuf import related ioctl returns ENODEV, it means a Wayland
> compositor should not punish the client for giving a bad buffer.

Atm this is only for the drm fd. I think right now dma-buf keep "working",
where "working" =3D "probably results in some oopses". So maybe for dma-buf
we need to put down the rule that they're not allowed to go boom, and then
figure out how to do that, see below.

> If a compositor uses EGL to import a dmabuf, then the EGL
> implementation will be calling dmabuf import related ioctls, does it
> not? But I'm fairly sure that EGL has no way to signal this particular
> condition to the caller uniquely. That means that either a compositor
> accepts buffers it never should have, or that it punishes clients for
> the DRM device disappearing.
> =

> See the below quote for a reminder:
> =

> > > > > > > > > +- dmabuf which point to memory that has disappeared are =
rewritten to
> > > > > > > > > +  point to harmless zero pages, similar to mmaps. Import=
s still succeed
> > > > > > > > > +  both ways: an existing device importing a dmabuf point=
ing to
> > > > > > > > > +  disappeared memory, and a disappeared device importing=
 any dmabuf.    =

> > > > > > > > =

> > > > > > > > Same as above, I would expect drmPrimeHandleToFD and drmPri=
meFDToHandle
> > > > > > > > to return -EIO in case device is detached    =

> > > > > > > I imagined a use case behind this: a Wayland compositor attem=
pting to
> > > > > > > import a client's dmabuf. The GPU the client was using is
> > > > > > > hot-unplugged, meaning the dmabufs lose their storage. It is =
up to the
> > > > > > > client to handle its rendering GPU disappearance on its own, =
but also
> > > > > > > the compositor should not disconnect it because the GPU disap=
peared.
> > > > > > > It's not the client's fault the GPU disappeared.
> > > > > > > =

> > > > > > > In Wayland, failure to use a wl_buffer is considered a protoc=
ol error,
> > > > > > > and protocol errors are always fatal: the client is disconnec=
ted. The
> > > > > > > rationale is that the compositor must always be able to prese=
nt the
> > > > > > > client buffer somehow. If the compositor cannot, then the cli=
ent did
> > > > > > > not obey the protocol.
> > > > > > > =

> > > > > > > The fallback presentation path in a compositor is usually imp=
orting the
> > > > > > > dmabuf to EGL, to be sampled from OpenGL. Normally the protoc=
ol
> > > > > > > guarantees that this works, so any failure to do so is a prot=
ocol
> > > > > > > violation. But if the GPU used by the client suddenly disappe=
ars and
> > > > > > > the imports start to fail, that is interpreted as a protocol =
violation
> > > > > > > unless the compositor can see why the import failed. Since th=
e import
> > > > > > > is done via EGL, getting the right error code plumbed through=
 from
> > > > > > > libdrm functions to the EGL caller would be a hassle. I don't=
 see any
> > > > > > > error code in EGL_EXT_image_dma_buf_import reserved for "the =
dmabuf
> > > > > > > storage was hot-unplugged", and I doubt there is anything exc=
lusively
> > > > > > > for only that in the EGL base spec either.
> > > > > > > =

> > > > > > > The cost of lying that the import worked is that the composit=
or will
> > > > > > > paint black or transparent where the window was supposed to b=
e. It's a
> > > > > > > graphical glitch that is contrary to the Wayland design princ=
iples, but
> > > > > > > in this case a glitch is unavoidable: even if the compositor =
knew this
> > > > > > > buffer is now bad, what would it paint instead? It has nothin=
g else to
> > > > > > > paint from. I'm assuming the compositor is using a different =
GPU than
> > > > > > > what disappeared.
> > > > > > > =

> > > > > > > Ideally, the client will eventually react to losing the GPU a=
nd either
> > > > > > > crash, quit, or switch its rendering to something that works =
which
> > > > > > > simply gives the compositor a new, working buffer without los=
ing any
> > > > > > > window state in the process. If we risk the compositor discon=
necting
> > > > > > > the client, then the client might not recover even if it want=
ed to.
> =

> This goes for both ways: importing a good dmabuf to a bad device, and a
> bad dmabuf to a good device. In neither case there should be a risk of
> erroneously disconnecting the Wayland client.
> =

> Hmm. Maybe Wayland compositors should ignore all EGL import failures
> that happen after the wl_buffer has been created (which implies that
> the dmabuf has been validated to work initially). When import fails at
> a later time, the compositor should just paint some error pattern
> instead of the window. That would let the kernel keep on returning
> errors.
> =

> Yeah, ok. I'll keep the ENODEV there in my next version. Let's see how
> that looks then.

tbh I have no idea what to do with dma-buf shared across drivers.

For dma-fence it's fairly simple: Force-complete them all, with an error
code of ENODEV. But for dma-buf I have no idea. As long as the dma-buf
sits in system memory it should keep working, plus/minus bugs in the
exporter where it tries to look at device state that might no longer be
there.

The real fun starts when the buffer is in vram, or when the mmap somehow
goes through the device (but that's more a case for integrated gpu, and
it's a bit hard to hotunplug those and consider that a real use-case).
-Daniel

> =

> =

> Thanks,
> pq



-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
