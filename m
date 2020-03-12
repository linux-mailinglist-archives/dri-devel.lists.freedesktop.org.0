Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42223183D0B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C637E6EB4F;
	Thu, 12 Mar 2020 23:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E37C6EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 23:08:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f10so8436198ljn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OoF+OBxMdbYWaTz4CXOlHNkN8CmTDgt6DMscVbsH5gw=;
 b=fdyqBpEjR6PuuJ5gwMxsLKKfZxJGuoJK9FDFmX3ALQjMpWkMDUwZHdROftx4OhVV0O
 hmh7SY/iDMvmbYgNymkeJKGjKAcDo43jrehrzLm2WAqJBnZCGNuE5RlvLSW+XeAjtfD/
 /2vSkZJrLoAHRitchAt3nIdxeyex0LDn/e3qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OoF+OBxMdbYWaTz4CXOlHNkN8CmTDgt6DMscVbsH5gw=;
 b=TWS8QfRKPBW0RjTK1wFEz3LB2HDHUVFmTXVRSgUG0QTshS8skyx/wdUKXtcxaJ+a41
 alrLtf20tyI7ZAjo1R5jxquMlGKCxmFD8SIJWaJaYPHdoVtjZRmgUfM0XurtbBgrzbYn
 rYFabE7SmHJFwiIJR1sAbRbg7b68LBHY6E7hdZODOQhwu3VTlYlrd4Ci7eyYPOeNkHOX
 KZhjuMngJTru84zRW4GeYFR69GhO/AlD+Fc6hI3NBEyYQUk3DP8oxa+pvt5pyUQB1Z/Y
 /Mf+MIRQdSSFAJh26K7aJRNu1lEWAppdxfd76okyx67SRU1Vzsl0n8Uwi8X5wqtgBytC
 /fOQ==
X-Gm-Message-State: ANhLgQ1wBayAhoC2A6UDXUHAVMAl/0XYst7dCmJMqF12KGiVEA0aBCyr
 klqtiZ3l9H0pXStsQ/NidfUaU7+pjiU=
X-Google-Smtp-Source: ADFU+vu3yJp6PCx0+H5LoCOHgr5nrdBllb/E/v8zP2Uc2RWngTrDdWG1aMHJ33o70q3LL7EwmE0wEg==
X-Received: by 2002:a2e:8043:: with SMTP id p3mr6322034ljg.270.1584054507526; 
 Thu, 12 Mar 2020 16:08:27 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id a17sm20127819ljk.42.2020.03.12.16.08.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 16:08:26 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id b186so6205958lfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 16:08:26 -0700 (PDT)
X-Received: by 2002:a19:760c:: with SMTP id c12mr6647407lff.48.1584054506413; 
 Thu, 12 Mar 2020 16:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
In-Reply-To: <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 12 Mar 2020 16:08:13 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
Message-ID: <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
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
 David Stevens <stevensd@chromium.org>, John Bates <jbates@chromium.org>
Content-Type: multipart/mixed; boundary="===============0018948956=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0018948956==
Content-Type: multipart/alternative; boundary="000000000000292a9e05a0b06e44"

--000000000000292a9e05a0b06e44
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 2:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Wed, Mar 11, 2020 at 04:36:16PM -0700, Gurchetan Singh wrote:
> > On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > >   Hi,
> > >
> > > > I should've been more clear -- this is an internal
> cleanup/preparation
> > > and
> > > > the per-context changes are invisible to host userspace.
> > >
> > > Ok, it wasn't clear that you don't flip the switch yet.  In general the
> > > commit messages could be a bit more verbose ...
> > >
> > > I'm wondering though why we need the new fence_id in the first place.
> > > Isn't it enough to have per-context (instead of global) last_seq?
> > >
> >
> > Heh, that was to leave open the possibility of multiple timelines per
> > context.  Roughly speaking,
> >
> > V2 -- multiple processes
> > V3 -- multiple processes and multiple threads (due to VK multi-threaded
> > command buffers)
> >
> > I think we all agree on V2.  It seems we still have to discuss V3
> > (multi-queue, thread pools, a fence context associated with each thread)
> a
> > bit more before we start landing pieces.
>
> While thinking about the whole thing a bit more ...
> Do we need virtio_gpu_ctrl_hdr->fence_id at all?
>

A fence ID could be useful for sharing fences across virtio devices.  Think
FENCE_ASSIGN_UUID, akin to  RESOURCE_ASSIGN_UUID (+dstevens@).


> At virtio level it is pretty simple:  The host completes the SUBMIT_3D
> virtio command when it finished rendering, period.


> On the guest side we don't need the fence_id.  The completion callback
> gets passed the virtio_gpu_vbuffer, so it can figure which command did
> actually complete without looking at virtio_gpu_ctrl_hdr->fence_id.
>
> On the host side we depend on the fence_id right now, but only because
> that is the way the virgl_renderer_callbacks->write_fence interface is
> designed.  We have to change that anyway for per-context (or whatever)
> fences, so it should not be a problem to drop the fence_id dependency
> too and just pass around an opaque pointer instead.
>

For multiple GPU timelines per context, the (process local) sync object
handle looks interesting:

https://patchwork.kernel.org/patch/9758565/

Some have extended EXECBUFFER to support this flow:

https://patchwork.freedesktop.org/patch/msgid/1499289202-25441-1-git-send-email-jason.ekstrand@intel.com


> cheers,
>   Gerd
>
>

--000000000000292a9e05a0b06e44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 12, 2020 at 2:29 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Mar 11, 2020 at 04:36:16PM -0700, Gurchetan Singh wrote:=
<br>
&gt; On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann &lt;<a href=3D"mailto:kr=
axel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0Hi,<br>
&gt; &gt;<br>
&gt; &gt; &gt; I should&#39;ve been more clear -- this is an internal clean=
up/preparation<br>
&gt; &gt; and<br>
&gt; &gt; &gt; the per-context changes are invisible to host userspace.<br>
&gt; &gt;<br>
&gt; &gt; Ok, it wasn&#39;t clear that you don&#39;t flip the switch yet.=
=C2=A0 In general the<br>
&gt; &gt; commit messages could be a bit more verbose ...<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m wondering though why we need the new fence_id in the firs=
t place.<br>
&gt; &gt; Isn&#39;t it enough to have per-context (instead of global) last_=
seq?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Heh, that was to leave open the possibility of multiple timelines per<=
br>
&gt; context.=C2=A0 Roughly speaking,<br>
&gt; <br>
&gt; V2 -- multiple processes<br>
&gt; V3 -- multiple processes and multiple threads (due to VK multi-threade=
d<br>
&gt; command buffers)<br>
&gt; <br>
&gt; I think we all agree on V2.=C2=A0 It seems we still have to discuss V3=
<br>
&gt; (multi-queue, thread pools, a fence context associated with each threa=
d) a<br>
&gt; bit more before we start landing pieces.<br>
<br>
While thinking about the whole thing a bit more ...<br>
Do we need virtio_gpu_ctrl_hdr-&gt;fence_id at all?<br></blockquote><div><b=
r></div><div>A fence ID could be useful for sharing fences across virtio de=
vices.=C2=A0 Think FENCE_ASSIGN_UUID, akin to=C2=A0 RESOURCE_ASSIGN_UUID (+=
dstevens@).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
At virtio level it is pretty simple:=C2=A0 The host completes the SUBMIT_3D=
<br>
virtio command when it finished rendering, period.=C2=A0</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
On the guest side we don&#39;t need the fence_id.=C2=A0 The completion call=
back<br>
gets passed the virtio_gpu_vbuffer, so it can figure which command did<br>
actually complete without looking at virtio_gpu_ctrl_hdr-&gt;fence_id.<br>
<br>
On the host side we depend on the fence_id right now, but only because<br>
that is the way the virgl_renderer_callbacks-&gt;write_fence interface is<b=
r>
designed.=C2=A0 We have to change that anyway for per-context (or whatever)=
<br>
fences, so it should not be a problem to drop the fence_id dependency<br>
too and just pass around an opaque pointer instead.<br></blockquote><div><b=
r></div><div>For multiple GPU timelines per context, the (process local) sy=
nc object handle looks interesting:</div><div><br></div><div><a href=3D"htt=
ps://patchwork.kernel.org/patch/9758565/" target=3D"_blank">https://patchwo=
rk.kernel.org/patch/9758565/</a><br></div><div><br></div><div>Some have ext=
ended EXECBUFFER to support this flow:</div><div><br></div><div><a href=3D"=
https://patchwork.freedesktop.org/patch/msgid/1499289202-25441-1-git-send-e=
mail-jason.ekstrand@intel.com" target=3D"_blank">https://patchwork.freedesk=
top.org/patch/msgid/1499289202-25441-1-git-send-email-jason.ekstrand@intel.=
com</a></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000292a9e05a0b06e44--

--===============0018948956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0018948956==--
