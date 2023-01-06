Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB866097C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 23:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E13E10E903;
	Fri,  6 Jan 2023 22:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A983B10E903
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 22:28:27 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id 3so2970913vsq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 14:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR5RN1uxOlX4A5+3fl/ntVUKRUAvOG1LeCxQUh2Kx2Q=;
 b=Cn5LvbiriJk+6e0nLVgCnK7AFoTi16mD2DhLVepXS6eBFXLrrd1Y2mNSxrPQpxg8ZN
 bx2SKuF1RFraktxOLI3Si8AOKTNJXRajCaidNQmXfROekGk5nMmPTqmbHc4s0TsYK8V8
 UNuW8gqdx0nqlJpBOUC3GGsR7DaCJLhTtGHSzhEnYxE8mlgyupqE5yKgMU6o/mCXs7yy
 G4ROj34ZjGPsdz1Y7IDhNdf404l/yTnT3GK1/5mKAHtuYmiC/4QGyxQCKDpYqf7OTPEx
 3BUE5youuvUqcJF+GJiVSzZ8sQ/nJrIPst7yWdvNbawQQb7r+DLu8CzQnKQOUkSTpBAo
 LACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR5RN1uxOlX4A5+3fl/ntVUKRUAvOG1LeCxQUh2Kx2Q=;
 b=hCvCHLB7v945Dmcw1j5ZupPGhqKWHEz8MuaWoHIUjgUiZVqj88b3fygjhu7gpZge5z
 gtbc2wwQ+0X6o2Cb7seCsvBWxrA64Vf7m3uQ2zL3t3jHeiXiVL8LqlDhkcOd6ahxLoIu
 hu4He2V8iGF/J0VSCDmvIKWDeiecybqZnPODEl/AMAlJH2vNN7rAzZHYVEstTy6FvytZ
 iOE5CCjGrO7+bpw/ppwdXJd/5zX3sJEkZTviTgu3N8up0m1lewXTnknkthOXkJ48leHj
 NlbUG22UZdpR8xVKNXey2BR1Qz+g2RAOowFzASWi0ow/b3yUktFNh5BrDhGNwn8iDrS+
 OIqg==
X-Gm-Message-State: AFqh2krUzN9L/2GyYtZ3EC9tXmWP5jmypX6HsFZyq0vX8ocVKPjwYOvD
 TE2Kw0WBG3WdhzF046nfMeM4XCsnhGj8SA6y1TVgCw==
X-Google-Smtp-Source: AMrXdXv71eiio7y+Yut9iBNcOF8dCpMKNSUAKtDFB5TUDuk917z/ZclKcgKncIxWzBewiQzALjLRteFQTThMVQUeuLM=
X-Received: by 2002:a05:6102:37a:b0:3cb:f195:b6cb with SMTP id
 f26-20020a056102037a00b003cbf195b6cbmr4147699vsa.21.1673044106434; Fri, 06
 Jan 2023 14:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
 <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
 <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
In-Reply-To: <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
From: =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Date: Fri, 6 Jan 2023 14:28:14 -0800
Message-ID: <CAOvqHj4r8OY53bQ6aKLVtSUKnpc4EnTyBjtpPcnWGtGqp8QyXA@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com, Yi Xie <yixie@google.com>,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 6, 2023 at 1:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 05, 2023 at 01:40:28PM -0800, Tao Wu(=E5=90=B4=E6=B6=9B@Eng) =
wrote:
> > Hi Daniel,
> >
> > May I know what's the requirement for adding render node support to a
> > "gpu"?  Why we just export render node for every drm devices?
> > I read document here
> > https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes
>
> Thus far we've only done it when there's actual rendering capability,
> which generally means at least some private ioctls.
Hi Daniel, it looks like vgem is exporting render node by default.
Per my understanding, vgem provides some  DRM API so users can play
with graphic buffers. I am feeling it's natural have a v*** device
which provide
the surperset which vgem and vkms provides, so it sounds like it's
natural add rendernode to vkms, or do the opposite, add kms related
stuff to vgem. I still don't get the point: what kind of issue it
could bring if we just
add render node to vkms? If your point is, we don't do that for other
kms only devices, then my question is, how about we just enable render
node for every DRM driver? what could go wrong with this approach?

thanks!
>
> Which vkms just doens't have. And it's by far not the only such case.
>
> Also note that display drivers side is _not_ shareable.
> -Daniel
>
> > and it seems render node allow multiple unprivileged clients
> > to work with the same gpu, I am not sure why we just enable it for all
> > kms-only device.
> > What's wrong if we enable it for all kms-only devices and also let
> > mesa to use llvmpipe with those devices by default.
> >
> > Thanks!
> >
> > On Thu, Jan 5, 2023 at 7:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Jan 06, 2023 at 12:16:07AM +0900, Yi Xie wrote:
> > > > On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > > > > > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > > > > >
> > > > > > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > > > > > This doesn't sound like a good idea to me. Devices withou=
t render
> > > > > > > > > capabilities should not fake it.
> > > > > > > > >
> > > > > > > > > User-space (e.g. wlroots) relies on "no render node" to e=
nable
> > > > > > > > > software rendering (Pixman instead of GL).
> > > > > > > >
> > > > > > > > We have virtgpu driver that exports a render node even when=
 virgl is
> > > > > > > > not supported.
> > > > > > > > Mesa has special code path to enable software rendering on =
it:
> > > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/eg=
l/drivers/dri2/platform_device.c#L296
> > > > > > > > We can do the same for vkms to force software rendering.
> > > > > > >
> > > > > > > Yeah that is the old kmsro mesa issue, for every combination =
of kms and
> > > > > > > gem device you need one to make this work.
> > > > > > >
> > > > > > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.=
ch> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > > > > > Some libraries including Mesa and virglrenderer require=
 a render node to
> > > > > > > > > > fully function. By adding a render node to vkms those l=
ibraries will
> > > > > > > > > > work properly, supporting use cases like running crosvm=
 with virgl GPU
> > > > > > > > > > support via llvmpipe on a headless virtual machine.
> > > > > > > > >
> > > > > > > > > This is what vgem exists for. More or less at least ... I=
'm honestly not
> > > > > > > > > really understanding what you're trying to fix here, it s=
ounds a bit like
> > > > > > > > > userspace being stupid.
> > > > > > > > > -Daniel
> > > > > > > > The problem with vgem is that it crashes llvmpipe while wor=
king with vkms.
> > > > > > > > Looks like it's due to the same reason as described in this=
 thread in Mesa:
> > > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5=
830
> > > > > > >
> > > > > > > I'm not finding any bug description in there and how/why some=
thing
> > > > > > > crashes?
> > > > > >
> > > > > > The discussion is in the comment section under the first commen=
t by
> > > > > > Emil Velikov.
> > > > > > It's folded by default (inside "6 replies" at the bottom).
> > > > > >
> > > > > > >
> > > > > > > > Importing buffers allocated by vgem to vkms seems to be une=
xpected and
> > > > > > > > causes the crash. If we create a render node on vkms then l=
lvmpipe will use
> > > > > > > > vkms to allocate buffers and it no longer crashes.
> > > > > > >
> > > > > > > Uh importing vgem into virtio might not work because those so=
metimes need
> > > > > > > special buffers iirc. But importing vgem into vkms really sho=
uld work,
> > > > > > > there's no technical reason it cannot. If it doesn't, then th=
e right fix
> > > > > > > would be to fix that, not paper around it.
> > > > > >
> > > > > > The crash stack trace looks like this:
> > > > > > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da=
2
> > > > > >
> > > > > > Even if we fix the crash issue with vgem, we still need to work=
around
> > > > > > quite a few
> > > > > > places that has explicitly blocked vgem. A notable example is v=
irglrenderer:
> > > > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/maste=
r/src/vrend_winsys_gbm.c#L121
> > > > > >
> > > > > > Actually I have tried to force running virglrenderer on vgem an=
d it
> > > > > > didn't work. I
> > > > > > didn't look into why it wasn't working but I guess that's the r=
eason
> > > > > > for blocking
> > > > > > vgem in the first place. Virglrenderer works well on vkms with =
render node
> > > > > > enabled though.
> > > > >
> > > > > Ah ok. For next time around, copy a link to the comment you want,=
 e.g.
> > > > >
> > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#no=
te_582477
> > > > >
> > > > > The 3 dots menu on each comments has an option to copy that link =
tag. That
> > > > > also highlights the right comment.
> > > >
> > > > Thanks for the tips! Actually you need to sign in to reveal that 3 =
dots menu.
> > > >
> > > > >
> > > > > On this issue, I'm concurring with Emil:
> > > > >
> > > > > "- the import is broken
> > > > > "IMHO that should be fixed, regardless of the rest"
> > > > >
> > > > > The same should be done here. Unless it's a very special device, =
we should
> > > > > be able to import vgem buffers.
> > > >
> > > > How about the fact that vgem is blocked explicitly in virglrenderer=
?
> > > > We will have
> > > > to remove it from block list and that may break something that
> > > > resulted in blocking
> > > > in this commit:
> > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686d=
d46df27e9600f9df734303ec57bb38772
> > > > I can't find the reason why it's blocking vgem though. It shouldn't=
 be
> > > > related to
> > > > incompatibility with vkms/virtgpu.
> > > >
> > > > Are there any concerns that enabling render node on vkms may cause =
problems?
> > > > What if we add a driver option to add render node on demand?
> > >
> > > The thing is, that none of the other kms-only driver enable render no=
des.
> > > If we start adding them in one case just because userspace can't cope=
,
> > > then we'll have an endless stream of these patches.
> > >
> > > Instead of fixing userspace.
> > >
> > > Note that the issue is very old for at least mesa3d, and the only fix=
 is
> > > kmsro, where you have to build a driver for each combo. Maybe this sh=
ould
> > > be done better, dunno. But adding render node in just vkms for this u=
se
> > > case really doesn't make much sense to me, and it smells very much li=
ke
> > > opening a can of worms :-/
> > > -Daniel
> > >
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > > -Daniel
> > > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/=
gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_ini=
t(struct drm_minor *minor)
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  static const struct drm_driver vkms_driver =3D {
> > > > > > > > > > -     .driver_features        =3D DRIVER_MODESET | DRIV=
ER_ATOMIC | DRIVER_GEM,
> > > > > > > > > > +     .driver_features        =3D DRIVER_MODESET | DRIV=
ER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > > > > > >       .release                =3D vkms_release,
> > > > > > > > > >       .fops                   =3D &vkms_driver_fops,
> > > > > > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > > > > > --
> > > > > > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Daniel Vetter
> > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > http://blog.ffwll.ch
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
