Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042E180BF1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 23:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472926E8E5;
	Tue, 10 Mar 2020 22:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D756E8E5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 22:58:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c20so70517lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sOfspqHKFLo0u2wmHjBOIQ3knhBzQAlHIDtF2mR6yU=;
 b=gFFreeKE28Kq8R+sGRlj64Frbj66peTCYOAkAg/a5n2b4ZJbDZ1KTjhYQcJJv6zXQb
 i5d8HmU+wynaTd0KtfpjwRsMbrWxJU+aJ/lR4wRVI8iq+tZgfZt5Fx/Hwj/7K9RQNYRH
 4h26hBDe95CkYxTZZTxqD61cB9EW4B/5lCTIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sOfspqHKFLo0u2wmHjBOIQ3knhBzQAlHIDtF2mR6yU=;
 b=OcCX9wp+vnsml3+fdq6piF6g8piasI/7wTY/8f/awdBMa61lWZuQ9lz093k8URhklW
 2VZqOygd+fued+Ern87tioYBW968qFfQjnTW3yCpU2ZYany38//f2U8m4CM/7p8TvaGf
 551/3/IN8g2v+lLdgdzMpwEC3xIuf2O5S6pivedkIwfO0sHecsvwm8YjM53UztmK6UH3
 u1LVImyUrFC4YmAKc5azgaFpmUFJ9qFgJxD/RcZRMs1i8ElsjtxEaFRI6JsF9yfSHhxZ
 wixObMAM6IAMmYYuWpz/NQY3sd75FmlBfQSHBew+vIvKahWxSXT0U9jQO1kq2cyin5Bw
 Uavg==
X-Gm-Message-State: ANhLgQ0wVyKlw96ZDJ2Pj584XCmEeiQ0leyE5PGACVSJQibsS5/aJq3d
 1pUOuPPRyAEG+foMMidMd5bXac2BeR4=
X-Google-Smtp-Source: ADFU+vslOsTyZfAbxhrSXJniyADwrsxZk+BPc4VH0fOcnpz83CH70KaOgvPC8OSbkAGHEbFEzQUPCQ==
X-Received: by 2002:a19:4856:: with SMTP id v83mr200675lfa.151.1583881086548; 
 Tue, 10 Mar 2020 15:58:06 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id d12sm7943167lfi.86.2020.03.10.15.58.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 15:58:05 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id j11so56814lfg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:58:05 -0700 (PDT)
X-Received: by 2002:a19:760c:: with SMTP id c12mr229281lff.48.1583881085422;
 Tue, 10 Mar 2020 15:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
In-Reply-To: <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 10 Mar 2020 15:57:54 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
Message-ID: <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: multipart/mixed; boundary="===============1290286576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1290286576==
Content-Type: multipart/alternative; boundary="00000000000076e33e05a0880d3b"

--00000000000076e33e05a0880d3b
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 10, 2020 at 12:43 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mon, Mar 09, 2020 at 06:08:10PM -0700, Gurchetan Singh wrote:
> > We don't want fences from different 3D contexts/processes (GL, VK) to
> > be on the same timeline. Sending this out as a RFC to solicit feedback
> > on the general approach.
>
> NACK.
>
> virtio fences are global, period.  You can't simply change fence
> semantics like this.  At least not without a virtio protocol update
> because guest and host need to be on the same page here.


I should've been more clear -- this is an internal cleanup/preparation and
the per-context changes are invisible to host userspace.

Just look at
> virgl_renderer_callbacks->write_fences() and how it doesn't consider
> contexts at all.
>
> So one way out would be to add a virtio feature flag for this, so guest
> & host can negotiate whenever fences are global or per-context.
>

Yeah, we'll need something like VIRTIO_GPU_FLAG_FENCE_V2 eventually, which
means fences virgl_write_fence can not assume fence_id is the global
sequence number.  It's a bit tricky, and we have to consider a few cases:

1) Current kernel/current host userspace.  Everything works.

2) Newer kernel (with this series) on current host userspace.  For
that, fence_id needs to be a monotonically increasing value, which it
remains to be.  I ran the standard test apps (Unigine Valley, dEQP, etc.)
with this change and things seem fine.

3) Current kernel on newer host userspace.  New host won't see
VIRTIO_GPU_FLAG_FENCE_V2, everything should work as usual.

4) Newer kernel on new host host userspace.  virgl_write_fence signals
fences only in a specific context (or possibly only one fence at a time).
The guest kernel processing based on {fence_id, fence_context} will make a
difference in a multi-process environment.

If I have things right (and again, it's a bit tricky), so the virtio
protocol update will be required at (4).  It would be nice to get in
refactorings to avoid mega-changes if we agree on the general approach..

Side note:

Fences do have an associated context ID in virglrenderer [1], though we
don't pass down the correct ctx ID just yet [2].

[1]
https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/virglrenderer.h#L204
[2] https://github.com/qemu/qemu/blob/master/hw/display/virtio-gpu-3d.c#L490

Another approach would be to go multiqueue, with each virtqueue being
> roughly the same as a rendering pipeline on physical hardware, then have
> per-virtqueue fences.
>

Multi-queue sounds very interesting indeed, especially with VK
multi-threaded command submission.  That to me is V3 rather than V2.. let's
start easy!

When going multiqueue we might also rethink the cursor queue approach.
> I think it makes sense to simply allow sending cursor commands to any
> queue then.  A separate cursor queue continues to be an option for the
> guest then, but I'm not sure how useful that actually is in practice
> given that cursor image updates are regular resource updates and have to
> go through the control queue, so virtio_gpu_cursor_plane_update() has to
> wait for the resource update finish before it can queue the cursor
> command.  I suspect the idea to fast-track cursor updates with a
> separate queue doesn't work that well in practice because of that.
>
> cheers,
>   Gerd
>
>

--00000000000076e33e05a0880d3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2020 at 12:43 AM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Mar 09, 2020 at 06:08:10PM -0700, Gurchetan Singh wrote:=
<br>
&gt; We don&#39;t want fences from different 3D contexts/processes (GL, VK)=
 to<br>
&gt; be on the same timeline. Sending this out as a RFC to solicit feedback=
<br>
&gt; on the general approach.<br>
<br>
NACK.<br>
<br>
virtio fences are global, period.=C2=A0 You can&#39;t simply change fence<b=
r>
semantics like this.=C2=A0 At least not without a virtio protocol update<br=
>
because guest and host need to be on the same page here.=C2=A0 </blockquote=
><div><br></div><div>I should&#39;ve been more clear -- this is an internal=
 cleanup/preparation and the per-context changes are invisible to host user=
space.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Just look at<br>
virgl_renderer_callbacks-&gt;write_fences() and how it doesn&#39;t consider=
<br>
contexts at all.<br>
<br>
So one way out would be to add a virtio feature flag for this, so guest<br>
&amp; host can negotiate whenever fences are global or per-context.<br></bl=
ockquote><div><br></div><div>Yeah, we&#39;ll need something like=C2=A0VIRTI=
O_GPU_FLAG_FENCE_V2 eventually, which means fences virgl_write_fence can no=
t assume fence_id is the global sequence number.=C2=A0 It&#39;s a bit trick=
y, and we have to consider a few cases:=C2=A0=C2=A0</div><div><div><br></di=
v><div>1) Current kernel/current host userspace.=C2=A0 Everything works.</d=
iv><div><br></div><div>2) Newer kernel (with this series) on current host u=
serspace.=C2=A0 For that,=C2=A0fence_id needs to be a monotonically=C2=A0in=
creasing=C2=A0value, which it remains to be.=C2=A0 I ran the standard test =
apps (Unigine Valley, dEQP, etc.) with this change and things seem fine.</d=
iv><div><br></div><div>3) Current kernel on newer host userspace.=C2=A0 New=
 host won&#39;t see VIRTIO_GPU_FLAG_FENCE_V2, everything should work as usu=
al.</div><div><br></div><div>4) Newer kernel on new=C2=A0host host userspac=
e.=C2=A0 virgl_write_fence signals fences only in a specific context (or po=
ssibly only one fence at a time).=C2=A0 The guest kernel processing based o=
n {fence_id, fence_context} will make a difference in a multi-process envir=
onment.</div><div><br></div><div>If I have things right (and again, it&#39;=
s a bit tricky), so the virtio protocol update will be required at (4).=C2=
=A0 It would be nice to get in refactorings to avoid mega-changes if we agr=
ee on the general approach..</div><div><br></div><div>Side note:</div><div>=
<br></div><div>Fences do have an associated context ID in virglrenderer [1]=
, though we don&#39;t pass down the correct ctx ID just yet [2].</div><div>=
<br></div><div>[1]=C2=A0<a href=3D"https://gitlab.freedesktop.org/virgl/vir=
glrenderer/-/blob/master/src/virglrenderer.h#L204" target=3D"_blank">https:=
//gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/virglrendere=
r.h#L204</a></div><div>[2]=C2=A0<a href=3D"https://github.com/qemu/qemu/blo=
b/master/hw/display/virtio-gpu-3d.c#L490" target=3D"_blank">https://github.=
com/qemu/qemu/blob/master/hw/display/virtio-gpu-3d.c#L490</a></div></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Another approach would be to go multiqueue, with each virtqueue being<br>
roughly the same as a rendering pipeline on physical hardware, then have<br=
>
per-virtqueue fences.<br></blockquote><div><br></div><div>Multi-queue sound=
s very interesting indeed, especially with VK multi-threaded command submis=
sion.=C2=A0 That to me is V3 rather than V2.. let&#39;s start easy!</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
When going multiqueue we might also rethink the cursor queue approach.<br>
I think it makes sense to simply allow sending cursor commands to any<br>
queue then.=C2=A0 A separate cursor queue continues to be an option for the=
<br>
guest then, but I&#39;m not sure how useful that actually is in practice<br=
>
given that cursor image updates are regular resource updates and have to<br=
>
go through the control queue, so virtio_gpu_cursor_plane_update() has to<br=
>
wait for the resource update finish before it can queue the cursor<br>
command.=C2=A0 I suspect the idea to fast-track cursor updates with a<br>
separate queue doesn&#39;t work that well in practice because of that.<br>
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--00000000000076e33e05a0880d3b--

--===============1290286576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1290286576==--
