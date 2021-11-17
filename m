Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04065453E7F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 03:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CCC89A35;
	Wed, 17 Nov 2021 02:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101389A35
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 02:31:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y13so3604477edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0u0VN9wxlHx8RJ4Bh8Pz8uwr24ty1tZRCBI/6KIjnhA=;
 b=JE6PMjlyvrLuuOMAlsEQttHd8fwzNUBUJz1AutdNPhNeB//axYjqWXUpgdVZFPE0Ux
 qnjTreqoLdgBx0UhH+5YYe79GlWDkfX2osCUf/YmeeIKMcd8aEWzBUfrvZRpHjtLbCt0
 f+euYCut905ZQ2Fm1+TFditLh5fqQOX5/DCb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0u0VN9wxlHx8RJ4Bh8Pz8uwr24ty1tZRCBI/6KIjnhA=;
 b=JoRjQXZqVm7HS3lBqXaL6K7p2dmsOYY3075cjBcWEzs4Og6bGolgEpiRA0ZYS+WfgZ
 rvjK5jeAxMomaaoBbhMVuLUJFpjH22Or+n7S5IH2GaH24hlh3wN054Uj/VAfYyIC39uF
 d/J/Y4A5w/XBGoGXO6KbOhzJKTizTMemD7NhO/ZOrzq1Fbq9nFCpevodMPgIxB4m3Vas
 Ly2OxbZO+Us5w7ez4GIKwMSGr9mNJO2glAxW5Z6q27T+WxRU9R+mpH2dKoPAVnJJ9iwL
 GcvphoJRFIROQNPpv3UUn3rltFPt7OWs3fPfqZ0UX7Vk4XfC4rdpWdw4zR7RhrXfk23S
 kRzw==
X-Gm-Message-State: AOAM531HKusHDlXeSyg59BbluoI+G1OgTJof5i2k+UVw23BhJEpBsiSK
 QzAzWcgV+NlP8YjE1BoHZ73xQn231dWwfQ==
X-Google-Smtp-Source: ABdhPJwaLJy8DSeFdK/dTIpi7lXzmcaepYX5Ezf9Zwm+wI7CcOZ56x+Ct5NWakTBvIpNAgiROIo7HQ==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr11740715edd.113.1637116284378; 
 Tue, 16 Nov 2021 18:31:24 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id el20sm1738002ejc.40.2021.11.16.18.31.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 18:31:23 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id n29so1468362wra.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:31:23 -0800 (PST)
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr15904476wrs.374.1637116282797; 
 Tue, 16 Nov 2021 18:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
 <bc799da264c045fb9ad9ccad5dfba631@intel.com>
 <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
In-Reply-To: <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 16 Nov 2021 18:31:10 -0800
X-Gmail-Original-Message-ID: <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
Message-ID: <CAAfnVBms1Bi8MnaCZVv=4dgoG+REVzZ-zFq-hRQ-4tCzYBrDdA@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000007e925305d0f2d6bb"
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007e925305d0f2d6bb
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 7:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:
> > Hi Daniel, Greg,
> >
> > If it is the same or a similar crash reported here:
> >
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
> > and here:
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330212.html
> > then the fix is already merged:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76

Yeah but that still leaves the problem of why exaxtly virtgpu is
> reinventing drm_poll here?


> Can you please replace it with drm_poll like all other drivers, including
> the ones that have private events?
>

Hi Daniel,

Allow me to explain the use case a bit.  It's for when virtgpu KMS is not
used, but a special Wayland compositor does wayland passthrough instead:

https://www.youtube.com/watch?v=WwrXqDERFm8https://www.youtube.com/watch?v=EkNBsBx501Q

This technique has gained much popularity in the virtualized laptop
space, where it offers better performance/user experience than virtgpu
KMS.  The relevant paravirtualized userspace is "Sommelier":

https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/
https://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/virtgpu_channel.cc

Previously, we were using the out-of-tree virtio-wl device and there
were many discussions on how we could get this upstream:

https://lists.freedesktop.org/archives/dri-devel/2017-December/160309.html
https://lists.oasis-open.org/archives/virtio-dev/202002/msg00005.html

Extending virtgpu was deemed the least intrusive option:

https://www.spinics.net/lists/kvm/msg159206.html

We ultimately settled on the context type abstraction and used
virtio_gpu_poll to tell the guest "hey, we have a Wayland event".  The
host response is actually in a buffer of type BLOB_MEM_GUEST.

It is possible to use drm_poll(..), but that would have to be
accompanied by a drm_read(..).  You'll need to define a dummy
VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.

That's originally how I did it, but some pointed out that's
unnecessary since the host response is in the BLOB_MEM_GUEST buffer
and virtgpu event is a dummy event.  So we decided just to modify
virtio_gpu_poll(..) to have the desired semantics in that case.

For the regular virtio-gpu KMS path, things remain unchanged.

There are of course other ways to do it (perhaps polling a dma_fence),
but that was the cleanest way we could find.

It's not rare for virtio to "special things" (see virtio_dma_buf_ops,
virtio_dma_ops), since they are in fake devices.

We're open to other ideas, but hopefully that answers some of your
questions.


> Thanks, Daniel
>
> >
> > Thanks,
> > Vivek
> >
> > > On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > > > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > > > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > > > > to the DRM file descriptor when a fence on a specific ring is
> > > > > signaled.
> > > > >
> > > > > One difference is the event is not exposed via the UAPI -- this is
> > > > > because host responses are on a shared memory buffer of type
> > > > > BLOB_MEM_GUEST [this is the common way to receive responses with
> > > > > virtgpu].  As such, there is no context specific read(..)
> > > > > implementation either -- just a poll(..) implementation.
> > > > >
> > > > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43
> +++++++++++++++++++++++++-
> > > > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > > > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > > > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> > > > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > > >
> > > > This commit seems to cause a crash in a virtual drm gpu driver for
> > > > Android.  I have reverted this, and the next commit in the series
> from
> > > > Linus's tree and all is good again.
> > > >
> > > > Any ideas?
> > >
> > > Well no, but also this patch looks very questionable of hand-rolling
> > > drm_poll. Yes you can do driver private events like
> > > DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not
> need
> > > to hand-roll the poll callback. vmwgfx (which generally is a very old
> > > driver which has lots of custom stuff, so not a great example) doesn't
> do
> > > that either.
> > >
> > > So that part should go no matter what I think.
> > > -Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000007e925305d0f2d6bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 7:43 AM Danie=
l Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ff=
wll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:<br>
&gt; Hi Daniel, Greg,<br>
&gt; <br>
&gt; If it is the same or a similar crash reported here:<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2021-Novem=
ber/330018.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedes=
ktop.org/archives/dri-devel/2021-November/330018.html</a><br>
&gt; and here: <a href=3D"https://lists.freedesktop.org/archives/dri-devel/=
2021-November/330212.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.freedesktop.org/archives/dri-devel/2021-November/330212.html</a><br>
&gt; then the fix is already merged:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082da76" rel=3D"noref=
errer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/commit/?id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082da76</a><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Yeah but that still leaves the problem of why exaxtly virtgpu is<br>
reinventing drm_poll here?</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
Can you please replace it with drm_poll like all other drivers, including<b=
r>
the ones that have private events?<br></blockquote><div><br></div><div>Hi D=
aniel,</div><div><br></div><div>Allow me to explain the use case a bit.=C2=
=A0 It&#39;s for when virtgpu KMS is not used, but a special Wayland compos=
itor does wayland passthrough instead:</div><div><pre style=3D"overflow-x:a=
uto;white-space:pre-wrap;color:rgb(0,0,0)"><a rel=3D"nofollow" href=3D"http=
s://www.youtube.com/watch?v=3DWwrXqDERFm8" target=3D"_blank">https://www.yo=
utube.com/watch?v=3DWwrXqDERFm8</a>
<a rel=3D"nofollow" href=3D"https://www.youtube.com/watch?v=3DEkNBsBx501Q" =
target=3D"_blank">https://www.youtube.com/watch?v=3DEkNBsBx501Q</a>
</pre><pre style=3D"overflow-x:auto;white-space:pre-wrap;color:rgb(0,0,0)">=
<div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;wh=
ite-space:normal">This technique has gained much popularity in the virtuali=
zed laptop space, where it offers better performance/user experience than v=
irtgpu KMS.=C2=A0 The relevant paravirtualized userspace is &quot;Sommelier=
&quot;:</div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,=
sans-serif;white-space:normal"><br></div><div style=3D"color:rgb(34,34,34);=
font-family:Arial,Helvetica,sans-serif;white-space:normal"><a href=3D"https=
://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier=
/" target=3D"_blank">https://chromium.googlesource.com/chromiumos/platform2=
/+/main/vm_tools/sommelier/</a><br></div><div style=3D"color:rgb(34,34,34);=
font-family:Arial,Helvetica,sans-serif;white-space:normal"><a href=3D"https=
://chromium.googlesource.com/chromiumos/platform2/+/main/vm_tools/sommelier=
/virtualization/virtgpu_channel.cc" target=3D"_blank">https://chromium.goog=
lesource.com/chromiumos/platform2/+/main/vm_tools/sommelier/virtualization/=
virtgpu_channel.cc</a><br></div><div style=3D"color:rgb(34,34,34);font-fami=
ly:Arial,Helvetica,sans-serif;white-space:normal"><br></div><div style=3D"c=
olor:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:norma=
l">Previously, we were using the out-of-tree virtio-wl device and there wer=
e many discussions on how we could get this upstream:</div><div style=3D"co=
lor:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:normal=
"><br></div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,s=
ans-serif;white-space:normal"><a href=3D"https://lists.freedesktop.org/arch=
ives/dri-devel/2017-December/160309.html" target=3D"_blank">https://lists.f=
reedesktop.org/archives/dri-devel/2017-December/160309.html</a><br></div><d=
iv style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;whit=
e-space:normal"><a href=3D"https://lists.oasis-open.org/archives/virtio-dev=
/202002/msg00005.html" target=3D"_blank">https://lists.oasis-open.org/archi=
ves/virtio-dev/202002/msg00005.html</a><br></div><div style=3D"color:rgb(34=
,34,34);font-family:Arial,Helvetica,sans-serif;white-space:normal"><br></di=
v><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
white-space:normal">Extending virtgpu was deemed the least intrusive option=
:</div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;white-space:normal"><br></div><div style=3D"color:rgb(34,34,34);font-f=
amily:Arial,Helvetica,sans-serif;white-space:normal"><a href=3D"https://www=
.spinics.net/lists/kvm/msg159206.html" target=3D"_blank">https://www.spinic=
s.net/lists/kvm/msg159206.html</a><br></div><div style=3D"color:rgb(34,34,3=
4);font-family:Arial,Helvetica,sans-serif;white-space:normal"><br></div><di=
v style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white=
-space:normal">We ultimately settled on the context type abstraction and us=
ed=C2=A0<span style=3D"color:rgb(0,0,0);white-space:pre-wrap">virtio_gpu_po=
ll to tell the guest &quot;hey, we have a Wayland event&quot;.  </span>The =
host response is actually in a buffer of type BLOB_MEM_GUEST.</div><div sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-spac=
e:normal"><br></div><div style=3D"color:rgb(34,34,34);font-family:Arial,Hel=
vetica,sans-serif;white-space:normal">It is possible to use drm_poll(..), b=
ut that would have to be accompanied by a drm_read(..).=C2=A0 You&#39;ll ne=
ed to define a dummy=C2=A0<span style=3D"color:rgb(0,0,0);white-space:pre-w=
rap">VIRTGPU_EVENT_FENCE_SIGNALED in the uapi too.  </span></div><div style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:=
normal"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></=
div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-seri=
f;white-space:normal"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"=
>That&#39;s originally how I did it, but some pointed out that&#39;s unnece=
ssary since the host response is in the BLOB_MEM_GUEST buffer and virtgpu e=
vent is a dummy event.  So we decided just to modify virtio_gpu_poll(..) to=
 have the desired semantics in that case.  </span></div><div style=3D"color=
:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:normal"><=
span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></div><div =
style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-s=
pace:normal"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">For the =
regular virtio-gpu KMS path, things remain unchanged.</span></div><div styl=
e=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space=
:normal"><br></div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helv=
etica,sans-serif;white-space:normal">There are of course other ways to do=
=C2=A0it (perhaps polling a dma_fence), but that was the cleanest way we co=
uld find.</div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;white-space:normal"><br></div><div style=3D"color:rgb(34,34,34=
);font-family:Arial,Helvetica,sans-serif;white-space:normal">It&#39;s not r=
are for virtio to &quot;special things&quot; (see virtio_dma_buf_ops, virti=
o_dma_ops), since they are in fake devices.=C2=A0=C2=A0</div><div style=3D"=
color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:norm=
al"><br></div><div style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica=
,sans-serif;white-space:normal">We&#39;re open to other ideas, but hopefull=
y that answers some of your questions.=C2=A0 =C2=A0 =C2=A0</div></pre></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks, Daniel<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Vivek<br>
&gt; <br>
&gt; &gt; On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:<br>
&gt; &gt; &gt; On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wr=
ote:<br>
&gt; &gt; &gt; &gt; Similar to DRM_VMW_EVENT_FENCE_SIGNALED.=C2=A0 Sends a =
pollable event<br>
&gt; &gt; &gt; &gt; to the DRM file descriptor when a fence on a specific r=
ing is<br>
&gt; &gt; &gt; &gt; signaled.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; One difference is the event is not exposed via the UAPI=
 -- this is<br>
&gt; &gt; &gt; &gt; because host responses are on a shared memory buffer of=
 type<br>
&gt; &gt; &gt; &gt; BLOB_MEM_GUEST [this is the common way to receive respo=
nses with<br>
&gt; &gt; &gt; &gt; virtgpu].=C2=A0 As such, there is no context specific r=
ead(..)<br>
&gt; &gt; &gt; &gt; implementation either -- just a poll(..) implementation=
.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gu=
rchetansingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a=
>&gt;<br>
&gt; &gt; &gt; &gt; Acked-by: Nicholas Verne &lt;<a href=3D"mailto:nverne@c=
hromium.org" target=3D"_blank">nverne@chromium.org</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.c=C2=A0 =C2=A0=
| 43 +++++++++++++++++++++++++-<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0=
|=C2=A0 7 +++++<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_fence.c | 10 +++++=
+<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 +++++=
+++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 93 insertions(+), 1 deletion(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This commit seems to cause a crash in a virtual drm gpu driv=
er for<br>
&gt; &gt; &gt; Android.=C2=A0 I have reverted this, and the next commit in =
the series from<br>
&gt; &gt; &gt; Linus&#39;s tree and all is good again.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Any ideas?<br>
&gt; &gt; <br>
&gt; &gt; Well no, but also this patch looks very questionable of hand-roll=
ing<br>
&gt; &gt; drm_poll. Yes you can do driver private events like<br>
&gt; &gt; DRM_VMW_EVENT_FENCE_SIGNALED, that&#39;s fine. But you really sho=
uld not need<br>
&gt; &gt; to hand-roll the poll callback. vmwgfx (which generally is a very=
 old<br>
&gt; &gt; driver which has lots of custom stuff, so not a great example) do=
esn&#39;t do<br>
&gt; &gt; that either.<br>
&gt; &gt; <br>
&gt; &gt; So that part should go no matter what I think.<br>
&gt; &gt; -Daniel<br>
&gt; &gt; --<br>
&gt; &gt; Daniel Vetter<br>
&gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bl=
ank">http://blog.ffwll.ch</a><br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--0000000000007e925305d0f2d6bb--
