Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97631E11B9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5B689AA2;
	Mon, 25 May 2020 15:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1192389AA2;
 Mon, 25 May 2020 15:29:14 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b27so7758813qka.4;
 Mon, 25 May 2020 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MajqGGcx8RiCQk6ATDHnRMGHO7PnNDZ6bn+cbs0zuV8=;
 b=b1ONgD+1A7f9mLzkzWrQltn8Kgv/t1vNYo6HhXiLvLj+X6OJZUnBbdwde+9b44rPW3
 hqh+G35ocCMptwXUByjUdiz79Byi51kTrJLoocljG/qFgG7ZxCEKnzns44ZQbQH/r2NJ
 vHWWV8xaAkGLmriz3BOhmGvcSL9PEFq4Gl4wmUwPZF9PqaQpBkORYeGpdCGVYI7YPKEh
 VWMwVBFIy/Mq5w2atgrXEtNj4ZWlmwzyLAJTSBnVOvpuTLdg2fRF+9Ic1s/ISV98HJbO
 zRINvZEA5dSvSC7qLuohWsxFGvcGn6RkhvEwzaMMuR+yunelp416HYVm2Q4YMx/Oc7Tt
 YPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MajqGGcx8RiCQk6ATDHnRMGHO7PnNDZ6bn+cbs0zuV8=;
 b=Ri8hYJfhG7vQBb7gsTSGq5RTvj17tD96bZkz+O9U4fbw+mqT25PpBbnZVO6lG9G41h
 OGACRrH6pWIfkL0WqZYxj2bvzczhCQBPkvic+DpddCsSTs2Vdp/vEEIGcNbaWyAyWWX8
 7WyxPaTZOtr7AX8PfcJwn1hsmRqSvJR85C8BorofcatYjr4w+Tiz5+Z5lLyohGrc43o3
 zvx67WcgMH7G1yPzyvoc+3M7pDWwNdEePNZ2RRFK088axyAz/3FoUm7I4BXr6/w3qmB2
 VzDC5cHIOY8tPrvfgjTXZ8hdai7ImR6tJrEfdhFf4J7PjQTpjG7UXwwKSdwwPf/FRMt9
 t/qw==
X-Gm-Message-State: AOAM533mHL6s4VvDf0vsgvwEXPH48Yk4lf5uym926Y/sU5IDXYrhQt/S
 sxgfhNsspIettpe5h+mQBs7S1OZai0R0NP8Tj6Y=
X-Google-Smtp-Source: ABdhPJyL0GULyOQ2cd85oWwtjExn3D87j3AKfthxULkpWdtU0VhE9YgiC5XNvtMENCFCHmvTS9HmwwiUXSoGMT8p/sw=
X-Received: by 2002:a37:a7c3:: with SMTP id
 q186mr23244835qke.499.1590420553256; 
 Mon, 25 May 2020 08:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <20200525151515.GK206103@phenom.ffwll.local>
In-Reply-To: <20200525151515.GK206103@phenom.ffwll.local>
From: uday kiran pichika <udaykiran.pichika@gmail.com>
Date: Mon, 25 May 2020 20:59:02 +0530
Message-ID: <CAGcx_0aMhyy85MDfWQQhdA7kEREeJdtbQMR8RB+AAftRWfuR9Q@mail.gmail.com>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1184547496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1184547496==
Content-Type: multipart/alternative; boundary="0000000000001ed1fb05a67aa42e"

--0000000000001ed1fb05a67aa42e
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

We are trying to enable this feature in the Modesetting driver based on AMD
DDX driver as a reference.
Do you have any pointers to make this work ?

Thanks
Uday Kiran

On Mon, May 25, 2020 at 8:45 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:
> > Hello,
> >
> > Am working on enabling the Adaptive sync feature as part of the
> > Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> > (xf86-video-amdgpu). Below is the commit which i submitted.
> >
> https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371cc3731ee805cc4a0ace80db
> >
> >
> > I have made the below changes to enable this feature
> > 1. Enable Adaptive sync in Graphics Driver
> > 2. Added Xorg.conf file with VariableRefresh property which is read in
> the
> > Modesetting driver --> This is working fine.
>
> -modesetting, even in latest git master branch doesn't have VRR support.
>
> So yeah this wont work.
> -Daniel
>
> >
> > After taking the above changes, am observing that Adaptive sync is not
> > working.
> >
> > Below are my observations.
> > 1. loader_dri3_helper.c  --> Adaptive sync property is being set once the
> > system is booted successfully on one Window. Once
> > set_adaptive_sync_property() method gets called, adaptive_sync_active
> flag
> > is setting to true. From the next time, when fullscreen applications are
> > loaded, this property never gets set on any window.
> > 2. Once this property is being set, received a notification in
> modesetting
> > ddx driver and read the property from the Stuff->window.
> > 3. But when the fullscreen application(Either DOTA or Xonotic), not
> > observing that this propety is not being set on any app window.
> >
> > Can any one please help me why this property is not being set in the
> > application windows ?
> >
> > Thanks
> > Uday Kiran
>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000001ed1fb05a67aa42e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,<div><br></div><div>We are trying to enable this=
 feature in the Modesetting driver based on AMD DDX driver as a reference.=
=C2=A0</div><div>Do you have any pointers to make this work ?=C2=A0</div><d=
iv><br></div><div>Thanks=C2=A0</div><div>Uday Kiran</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 20=
20 at 8:45 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@f=
fwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:<=
br>
&gt; Hello,<br>
&gt; <br>
&gt; Am working on enabling the Adaptive sync feature as part of the<br>
&gt; Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver<=
br>
&gt; (xf86-video-amdgpu). Below is the commit which i submitted.<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/pichika/xserver/-/commit/682=
565a645bda7371cc3731ee805cc4a0ace80db" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371c=
c3731ee805cc4a0ace80db</a><br>
&gt; <br>
&gt; <br>
&gt; I have made the below changes to enable this feature<br>
&gt; 1. Enable Adaptive sync in Graphics Driver<br>
&gt; 2. Added Xorg.conf file with VariableRefresh property which is read in=
 the<br>
&gt; Modesetting driver --&gt; This is working fine.<br>
<br>
-modesetting, even in latest git master branch doesn&#39;t have VRR support=
.<br>
<br>
So yeah this wont work.<br>
-Daniel<br>
<br>
&gt; <br>
&gt; After taking the above changes, am observing that Adaptive sync is not=
<br>
&gt; working.<br>
&gt; <br>
&gt; Below are my observations.<br>
&gt; 1. loader_dri3_helper.c=C2=A0 --&gt; Adaptive sync property is being s=
et once the<br>
&gt; system is booted successfully on one Window. Once<br>
&gt; set_adaptive_sync_property() method gets called, adaptive_sync_active =
flag<br>
&gt; is setting to true. From the next time, when fullscreen applications a=
re<br>
&gt; loaded, this property never gets set on any window.<br>
&gt; 2. Once this property is being set, received a notification in modeset=
ting<br>
&gt; ddx driver and read the property from the Stuff-&gt;window.<br>
&gt; 3. But when the fullscreen application(Either DOTA or Xonotic), not<br=
>
&gt; observing that this propety is not being set on any app window.<br>
&gt; <br>
&gt; Can any one please help me why this property is not being set in the<b=
r>
&gt; application windows ?<br>
&gt; <br>
&gt; Thanks<br>
&gt; Uday Kiran<br>
<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000001ed1fb05a67aa42e--

--===============1184547496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1184547496==--
