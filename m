Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED1457A77
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 02:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92F96E87D;
	Sat, 20 Nov 2021 01:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11286E87E
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Nov 2021 01:39:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so49842549eda.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 17:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLN1vfgcyRQlxAHyF+psK311IXFnY0s78f1bUOpkVtg=;
 b=Y6JZvX6wq+iN5PV+GIf+qnDbIV0zWrmE8ZlcKvp4X9Loy3/rikgIIq0XLdQthYSaLg
 PhYMf2a8ZHvL0hrFIja5e3V4BLlStrbfGYEV8CTWgUs9DvEVbf4tdWIc6YpLu4SmNc9V
 eWdmu1sKnbD0uiaVy37+gJBg5G9+ek8LkSw7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLN1vfgcyRQlxAHyF+psK311IXFnY0s78f1bUOpkVtg=;
 b=iTL2OjsP/D1if1FcmEBY8NRXhKNwwSRaotJlB8LbN027ami8oWx3oby4yIgZp6Q4/7
 hbfhK1G1LREacGVKcQC5tkndUyRHy8hNiF477vDt2uSl+KdTGaHA4PSgB3poguhQLJ4e
 lAKRJ+k1e41vQ/wmze/oFW2A87EzkJAwRIJGZN7pboiDOgcXrRDD4wJaSZJT5RxJNjjS
 gCkMIdxrOiPmhcb1BgP8Xc1k6fxqIUMOZIXJTWqwZYcf7dOHQ5G+FEnVA8BDwgCEOl4Y
 1YicyHKJuytZlaqoEGbLTVFfcoRqwhcIU1xc/ST72F4pFKu1qZN8oFtpd8bHJHwep7sx
 Njqw==
X-Gm-Message-State: AOAM531s5aHCXcsNAJ+gCOE3IoJ8XX8/7w9qrhRPKH4RwNpRgQ4T3Xjj
 6Lvuq+uCdifQlay7NU15L84m3wrEXyjD+Q==
X-Google-Smtp-Source: ABdhPJyS+LDgigDMMN/kFm06bMeqcU6eRuLPmVqLk2Q5hOSCLMBjXA2RwD4OP17HTEwdtTiPQdhB3g==
X-Received: by 2002:a17:907:7f0f:: with SMTP id
 qf15mr14116462ejc.560.1637372343617; 
 Fri, 19 Nov 2021 17:39:03 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id qb28sm572349ejc.93.2021.11.19.17.39.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 17:39:02 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so8810347wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 17:39:01 -0800 (PST)
X-Received: by 2002:a7b:c310:: with SMTP id k16mr2312682wmj.169.1637372341241; 
 Fri, 19 Nov 2021 17:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
 <bc799da264c045fb9ad9ccad5dfba631@intel.com>
 <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
 <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
 <YZYUjh73sPYISNKc@phenom.ffwll.local>
 <CAF6AEGt5MiX7=Cf_zmDfW0pCM5OvSM9eTvWsubyRqmi+-bXi1g@mail.gmail.com>
In-Reply-To: <CAF6AEGt5MiX7=Cf_zmDfW0pCM5OvSM9eTvWsubyRqmi+-bXi1g@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 19 Nov 2021 17:38:46 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkscLUks+dSWHf=Nd+6s8AoD18P-LB22n6KeNKEdHzdfw@mail.gmail.com>
Message-ID: <CAAfnVBkscLUks+dSWHf=Nd+6s8AoD18P-LB22n6KeNKEdHzdfw@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c4511105d12e7420"
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
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 Greg KH <gregkh@linuxfoundation.org>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c4511105d12e7420
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 19, 2021 at 9:38 AM Rob Clark <robdclark@gmail.com> wrote:

> On Thu, Nov 18, 2021 at 12:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Nov 16, 2021 at 06:31:10PM -0800, Gurchetan Singh wrote:
> > > On Tue, Nov 16, 2021 at 7:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:
> > > > > Hi Daniel, Greg,
> > > > >
> > > > > If it is the same or a similar crash reported here:
> > > > >
> > > >
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
> > > > > and here:
> > > >
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330212.html
> > > > > then the fix is already merged:
> > > > >
> > > >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76
> > >
> > > Yeah but that still leaves the problem of why exaxtly virtgpu is
> > > > reinventing drm_poll here?
> > >
> > >
> > > > Can you please replace it with drm_poll like all other drivers,
> including
> > > > the ones that have private events?
> > > >
> > >
> > > Hi Daniel,
> > >
> > > Allow me to explain the use case a bit.  It's for when virtgpu KMS is
> not
> > > used, but a special Wayland compositor does wayland passthrough
> instead:
> > >
> > >
> https://www.youtube.com/watch?v=WwrXqDERFm8https://www.youtube.com/watch?v=EkNBsBx501Q
> > >
> > > This technique has gained much popularity in the virtualized laptop
> > > space, where it offers better performance/user experience than virtgpu
> > > KMS.  The relevant paravirtualized userspace is "Sommelier":
> > >
> > >
> https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/
> > >
> https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc
> > >
> > > Previously, we were using the out-of-tree virtio-wl device and there
> > > were many discussions on how we could get this upstream:
> > >
> > >
> https://lists.freedesktop.org/archives/dri-devel/2017-December/160309.html
> > > https://lists.oasis-open.org/archives/virtio-dev/202002/msg00005.html
> > >
> > > Extending virtgpu was deemed the least intrusive option:
> > >
> > > https://www.spinics.net/lists/kvm/msg159206.html
> > >
> > > We ultimately settled on the context type abstraction and used
> > > virtio_gpu_poll to tell the guest "hey, we have a Wayland event".  The
> > > host response is actually in a buffer of type BLOB_MEM_GUEST.
> > >
> > > It is possible to use drm_poll(..), but that would have to be
> > > accompanied by a drm_read(..).  You'll need to define a dummy
> > > VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.
> > >
> > > That's originally how I did it, but some pointed out that's
> > > unnecessary since the host response is in the BLOB_MEM_GUEST buffer
> > > and virtgpu event is a dummy event.  So we decided just to modify
> > > virtio_gpu_poll(..) to have the desired semantics in that case.
> > >
> > > For the regular virtio-gpu KMS path, things remain unchanged.
> > >
> > > There are of course other ways to do it (perhaps polling a dma_fence),
> > > but that was the cleanest way we could find.
> > >
> > > It's not rare for virtio to "special things" (see virtio_dma_buf_ops,
> > > virtio_dma_ops), since they are in fake devices.
> >
> > These are all internal interfaces, not uapi.
> >
> > > We're open to other ideas, but hopefully that answers some of your
> > > questions.
> >
> > Well for one, why does the commit message not explain any of this. You're
> > building uapi, which is forever, it's paramount all considerations are
> > properly explained.
> >
> > Second, I really don't like that youre redefining poll semantics in
> > incompatible ways from all other drm drivers. If you want special poll
> > semantics then just create a sperate fd for that (or a dma_fence or
> > whatever, maybe that saves some typing), but bending the drm fd semantics
> > is no good at all. We have tons of different fd with their dedicated
> > semantics in drm, trying to shoehorn it all into one just isn't very good
> > design.
> >
> > Or do the dummy event which is just the event code, but does not contain
> > any data. Either is fine with me.
> >
> > Can you pls do this asap? I really don't want to bake this in as uapi
> > which we then have to quirk and support forever. I'd say revert for -rc2
> > of these two and then maybe sort it out properly in -next.
>
> I think as a general rule, if there is not consensus about uabi
> change, even if it is just a semantic change, then revert and reland
> later is ok..
>
> As far as dummy VIRTGPU_EVENT_FENCE_SIGNALED.. that doesn't entirely
> sound like a bad thing to me.  Actually, it sounds like a good thing..
> it makes it more explicit what is going on.  And would avoid confusing
> a different userspace polling for kms related events expecting to be
> able to do a read.
>

If dummy events work, then it's actually not a big change to make.  Expect
patches in the upcoming business days.


>
> BR,
> -R
>
> > Cheers, Daniel
> > >
> > >
> > > > Thanks, Daniel
> > > >
> > > > >
> > > > > Thanks,
> > > > > Vivek
> > > > >
> > > > > > On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > > > > > > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh
> wrote:
> > > > > > > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable
> event
> > > > > > > > to the DRM file descriptor when a fence on a specific ring is
> > > > > > > > signaled.
> > > > > > > >
> > > > > > > > One difference is the event is not exposed via the UAPI --
> this is
> > > > > > > > because host responses are on a shared memory buffer of type
> > > > > > > > BLOB_MEM_GUEST [this is the common way to receive responses
> with
> > > > > > > > virtgpu].  As such, there is no context specific read(..)
> > > > > > > > implementation either -- just a poll(..) implementation.
> > > > > > > >
> > > > > > > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > > > > > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43
> > > > +++++++++++++++++++++++++-
> > > > > > > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > > > > > > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > > > > > > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34
> ++++++++++++++++++++
> > > > > > > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > This commit seems to cause a crash in a virtual drm gpu driver
> for
> > > > > > > Android.  I have reverted this, and the next commit in the
> series
> > > > from
> > > > > > > Linus's tree and all is good again.
> > > > > > >
> > > > > > > Any ideas?
> > > > > >
> > > > > > Well no, but also this patch looks very questionable of
> hand-rolling
> > > > > > drm_poll. Yes you can do driver private events like
> > > > > > DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should
> not
> > > > need
> > > > > > to hand-roll the poll callback. vmwgfx (which generally is a
> very old
> > > > > > driver which has lots of custom stuff, so not a great example)
> doesn't
> > > > do
> > > > > > that either.
> > > > > >
> > > > > > So that part should go no matter what I think.
> > > > > > -Daniel
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>

--000000000000c4511105d12e7420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 19, 2021 at 9:38 AM Rob C=
lark &lt;<a href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
Nov 18, 2021 at 12:53 AM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.c=
h" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Nov 16, 2021 at 06:31:10PM -0800, Gurchetan Singh wrote:<br>
&gt; &gt; On Tue, Nov 16, 2021 at 7:43 AM Daniel Vetter &lt;<a href=3D"mail=
to:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek w=
rote:<br>
&gt; &gt; &gt; &gt; Hi Daniel, Greg,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If it is the same or a similar crash reported here:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/=
2021-November/330018.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.freedesktop.org/archives/dri-devel/2021-November/330018.html</a><br>
&gt; &gt; &gt; &gt; and here:<br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/=
2021-November/330212.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.freedesktop.org/archives/dri-devel/2021-November/330212.html</a><br>
&gt; &gt; &gt; &gt; then the fix is already merged:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082da76" re=
l=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be08=
2da76</a><br>
&gt; &gt;<br>
&gt; &gt; Yeah but that still leaves the problem of why exaxtly virtgpu is<=
br>
&gt; &gt; &gt; reinventing drm_poll here?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Can you please replace it with drm_poll like all other drive=
rs, including<br>
&gt; &gt; &gt; the ones that have private events?<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi Daniel,<br>
&gt; &gt;<br>
&gt; &gt; Allow me to explain the use case a bit.=C2=A0 It&#39;s for when v=
irtgpu KMS is not<br>
&gt; &gt; used, but a special Wayland compositor does wayland passthrough i=
nstead:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://www.youtube.com/watch?v=3DWwrXqDERFm8https://w=
ww.youtube.com/watch?v=3DEkNBsBx501Q" rel=3D"noreferrer" target=3D"_blank">=
https://www.youtube.com/watch?v=3DWwrXqDERFm8https://www.youtube.com/watch?=
v=3DEkNBsBx501Q</a><br>
&gt; &gt;<br>
&gt; &gt; This technique has gained much popularity in the virtualized lapt=
op<br>
&gt; &gt; space, where it offers better performance/user experience than vi=
rtgpu<br>
&gt; &gt; KMS.=C2=A0 The relevant paravirtualized userspace is &quot;Sommel=
ier&quot;:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://chromium.googlesource.com/chromiumos/platform2=
/+/main/vm_tools/sommelier/" rel=3D"noreferrer" target=3D"_blank">https://c=
hromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/</a=
><br>
&gt; &gt; <a href=3D"https://chromium.googlesource.com/chromiumos/platform2=
/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc" rel=3D"norefe=
rrer" target=3D"_blank">https://chromium.googlesource.com/chromiumos/platfo=
rm2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc</a><br>
&gt; &gt;<br>
&gt; &gt; Previously, we were using the out-of-tree virtio-wl device and th=
ere<br>
&gt; &gt; were many discussions on how we could get this upstream:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2017-=
December/160309.html" rel=3D"noreferrer" target=3D"_blank">https://lists.fr=
eedesktop.org/archives/dri-devel/2017-December/160309.html</a><br>
&gt; &gt; <a href=3D"https://lists.oasis-open.org/archives/virtio-dev/20200=
2/msg00005.html" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-o=
pen.org/archives/virtio-dev/202002/msg00005.html</a><br>
&gt; &gt;<br>
&gt; &gt; Extending virtgpu was deemed the least intrusive option:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://www.spinics.net/lists/kvm/msg159206.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/kvm/msg1592=
06.html</a><br>
&gt; &gt;<br>
&gt; &gt; We ultimately settled on the context type abstraction and used<br=
>
&gt; &gt; virtio_gpu_poll to tell the guest &quot;hey, we have a Wayland ev=
ent&quot;.=C2=A0 The<br>
&gt; &gt; host response is actually in a buffer of type BLOB_MEM_GUEST.<br>
&gt; &gt;<br>
&gt; &gt; It is possible to use drm_poll(..), but that would have to be<br>
&gt; &gt; accompanied by a drm_read(..).=C2=A0 You&#39;ll need to define a =
dummy<br>
&gt; &gt; VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s originally how I did it, but some pointed out that&#39=
;s<br>
&gt; &gt; unnecessary since the host response is in the BLOB_MEM_GUEST buff=
er<br>
&gt; &gt; and virtgpu event is a dummy event.=C2=A0 So we decided just to m=
odify<br>
&gt; &gt; virtio_gpu_poll(..) to have the desired semantics in that case.<b=
r>
&gt; &gt;<br>
&gt; &gt; For the regular virtio-gpu KMS path, things remain unchanged.<br>
&gt; &gt;<br>
&gt; &gt; There are of course other ways to do it (perhaps polling a dma_fe=
nce),<br>
&gt; &gt; but that was the cleanest way we could find.<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s not rare for virtio to &quot;special things&quot; (see v=
irtio_dma_buf_ops,<br>
&gt; &gt; virtio_dma_ops), since they are in fake devices.<br>
&gt;<br>
&gt; These are all internal interfaces, not uapi.<br>
&gt;<br>
&gt; &gt; We&#39;re open to other ideas, but hopefully that answers some of=
 your<br>
&gt; &gt; questions.<br>
&gt;<br>
&gt; Well for one, why does the commit message not explain any of this. You=
&#39;re<br>
&gt; building uapi, which is forever, it&#39;s paramount all considerations=
 are<br>
&gt; properly explained.<br>
&gt;<br>
&gt; Second, I really don&#39;t like that youre redefining poll semantics i=
n<br>
&gt; incompatible ways from all other drm drivers. If you want special poll=
<br>
&gt; semantics then just create a sperate fd for that (or a dma_fence or<br=
>
&gt; whatever, maybe that saves some typing), but bending the drm fd semant=
ics<br>
&gt; is no good at all. We have tons of different fd with their dedicated<b=
r>
&gt; semantics in drm, trying to shoehorn it all into one just isn&#39;t ve=
ry good<br>
&gt; design.<br>
&gt;<br>
&gt; Or do the dummy event which is just the event code, but does not conta=
in<br>
&gt; any data. Either is fine with me.<br>
&gt;<br>
&gt; Can you pls do this asap? I really don&#39;t want to bake this in as u=
api<br>
&gt; which we then have to quirk and support forever. I&#39;d say revert fo=
r -rc2<br>
&gt; of these two and then maybe sort it out properly in -next.<br>
<br>
I think as a general rule, if there is not consensus about uabi<br>
change, even if it is just a semantic change, then revert and reland<br>
later is ok..<br>
<br>
As far as dummy VIRTGPU_EVENT_FENCE_SIGNALED.. that doesn&#39;t entirely<br=
>
sound like a bad thing to me.=C2=A0 Actually, it sounds like a good thing..=
<br>
it makes it more explicit what is going on.=C2=A0 And would avoid confusing=
<br>
a different userspace polling for kms related events expecting to be<br>
able to do a read.<br></blockquote><div><br></div><div>If dummy events work=
, then it&#39;s actually not a big=C2=A0change to make.=C2=A0 Expect patche=
s in the upcoming business days.</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
BR,<br>
-R<br>
<br>
&gt; Cheers, Daniel<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Thanks, Daniel<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; Vivek<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gur=
chetan Singh wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Similar to DRM_VMW_EVENT_FENCE_SIGNALED.=
=C2=A0 Sends a pollable event<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; to the DRM file descriptor when a fence =
on a specific ring is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; signaled.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; One difference is the event is not expos=
ed via the UAPI -- this is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; because host responses are on a shared m=
emory buffer of type<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; BLOB_MEM_GUEST [this is the common way t=
o receive responses with<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; virtgpu].=C2=A0 As such, there is no con=
text specific read(..)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; implementation either -- just a poll(..)=
 implementation.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a hr=
ef=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@=
chromium.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Acked-by: Nicholas Verne &lt;<a href=3D"=
mailto:nverne@chromium.org" target=3D"_blank">nverne@chromium.org</a>&gt;<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv=
.c=C2=A0 =C2=A0| 43<br>
&gt; &gt; &gt; +++++++++++++++++++++++++-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv=
.h=C2=A0 =C2=A0|=C2=A0 7 +++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_fen=
ce.c | 10 ++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioc=
tl.c | 34 ++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 4 files changed, 93 insertions(+),=
 1 deletion(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This commit seems to cause a crash in a virtu=
al drm gpu driver for<br>
&gt; &gt; &gt; &gt; &gt; &gt; Android.=C2=A0 I have reverted this, and the =
next commit in the series<br>
&gt; &gt; &gt; from<br>
&gt; &gt; &gt; &gt; &gt; &gt; Linus&#39;s tree and all is good again.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Any ideas?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Well no, but also this patch looks very questionab=
le of hand-rolling<br>
&gt; &gt; &gt; &gt; &gt; drm_poll. Yes you can do driver private events lik=
e<br>
&gt; &gt; &gt; &gt; &gt; DRM_VMW_EVENT_FENCE_SIGNALED, that&#39;s fine. But=
 you really should not<br>
&gt; &gt; &gt; need<br>
&gt; &gt; &gt; &gt; &gt; to hand-roll the poll callback. vmwgfx (which gene=
rally is a very old<br>
&gt; &gt; &gt; &gt; &gt; driver which has lots of custom stuff, so not a gr=
eat example) doesn&#39;t<br>
&gt; &gt; &gt; do<br>
&gt; &gt; &gt; &gt; &gt; that either.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; So that part should go no matter what I think.<br>
&gt; &gt; &gt; &gt; &gt; -Daniel<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Daniel Vetter<br>
&gt; &gt; &gt; &gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer=
" target=3D"_blank">http://blog.ffwll.ch</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Daniel Vetter<br>
&gt; &gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=
=3D"_blank">http://blog.ffwll.ch</a><br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Daniel Vetter<br>
&gt; Software Engineer, Intel Corporation<br>
&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">=
http://blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000c4511105d12e7420--
