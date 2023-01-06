Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E465FE7E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E8710E84E;
	Fri,  6 Jan 2023 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5135510E84E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 10:02:34 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id h27so1017167vsq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 02:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jekSJNDJM0PJLMy4f5KDsvfnzQKi1NY+87HbB0AE0U=;
 b=J/UVP+6+33ygBtVRE7gxxYi8EPBYvNgKgg1P/ueQ9Q6VIxUVmlmuYJuo4pmPca9EXZ
 zBM2J1+zbzdyk+8ZaC9xDqk0dMGqib9m/C/rrnxNbLlZiwz0wrHgGwBikJ5huJmTmsCk
 feXz0uA0+PdLUA86V7UCWmsnADKH7DRyEIfZDRcYdAJnZCpSPukS7U1vPq3bOD7OAS5y
 kesH27Hb9H3mjrUpY+KQdUvvfsXp6SKI8moeBuVpgqSQbzTXpJ4GNd2EG8KRwcI/Fk0A
 qT7qfmxpGrsT4HWHA15uSc/n1kRtDLJQ6nPSoD9X+yUrdsphBgzi1vbautq52ajUXmtc
 KwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jekSJNDJM0PJLMy4f5KDsvfnzQKi1NY+87HbB0AE0U=;
 b=x58P+M6l2Y1MXezcUeGx0N7i2RzeDNq88Re+XZZdmimlQf63I3q0UBmAaXPnntJvLi
 Wurio/+0v93cOuxpXfrTnEHwltb9mT2PkT0Md0Jwd/Tk2Fn95QDK7mhyZEcWrOb3/cP4
 7cfkjx/W/L1tFvzsiw+J7mab7pMzBhVev89YZyMBl7tdYKna2AH7l4nkYYJapOA7ZdNp
 cJ33z+p6iYLRpDYyXTHBBYOi86gjMSIgR522FVyGs3gvZNCgvFexIgHZnS1Z99sWtbcj
 nnatjeAgGYOefHzVhT9nG75CHW4pXUxvbnj+jGV3qpy95fCpoFj+GiQwo1QYtryQ3Xw3
 UFGQ==
X-Gm-Message-State: AFqh2kpCXzIAjPEY2qPzW7EbO1XqYLUvRSDjIFVEi17MRgwGldIPkYVq
 n+Q+hOSuNMOlmfZp95DNQnKHvejEhDjDnzrDXE0mgw==
X-Google-Smtp-Source: AMrXdXtfpZRao6zStkGRHIaemBc1xBGK/o5uKUEd/CUsvHFCWMC0YjNSG3uz3obKG+Ngi4YFi7yzmwoYKKRO6X/ArWY=
X-Received: by 2002:a05:6102:45b:b0:3cb:ebf:ba6e with SMTP id
 e27-20020a056102045b00b003cb0ebfba6emr3709385vsq.54.1672999353157; Fri, 06
 Jan 2023 02:02:33 -0800 (PST)
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
From: Yi Xie <yixie@google.com>
Date: Fri, 6 Jan 2023 19:02:22 +0900
Message-ID: <CAHf1YQ7xnhMwVzLaqsETuDAcBH+U_m=_BA4avfKbjM0Z_KOZRA@mail.gmail.com>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have figured out the problem with importing buffers across vgem/vkms.

It's intentionally blocked by kernel here:
https://github.com/torvalds/linux/blob/a140a6a2d5ec0329ad05cd3532a91ad0ce58=
dceb/drivers/gpu/drm/drm_gem.c#L307

From the original patch https://patchwork.freedesktop.org/patch/172242/:
Reject mapping an imported dma-buf since it's an invalid use-case.

Looks like importing dumb buffers across different devices is
disallowed. Removing this check and then everything is working well on
vkms with vgem.

According to the patch thread we should use native map instead of dumb
map on imported buffers.

Since there is no native map ioctl in both vgem and vkms, I'm thinking
about adding a dumb_map_offset implementation in both of them with
that check removed.
From my testing vkms and vgem are now working happily together without
any (obvious) issues.

There are other drivers doing the same thing, for example virtgpu:
https://github.com/torvalds/linux/blob/a140a6a2d5ec0329ad05cd3532a91ad0ce58=
dceb/drivers/gpu/drm/virtio/virtgpu_gem.c#L102

Does this sound like a better idea than adding a render node?

On Fri, Jan 6, 2023 at 6:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
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
