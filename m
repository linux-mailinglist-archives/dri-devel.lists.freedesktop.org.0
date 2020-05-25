Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833661E11AB
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476489B03;
	Mon, 25 May 2020 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD189AA2;
 Mon, 25 May 2020 15:26:36 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v79so7664123qkb.10;
 Mon, 25 May 2020 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0lUQ6DZQ5HW3zVZ78eBQpqE45pWlfZ+bqEH97DKz20=;
 b=WIL+6dZ9xah1AsbV+SrbEZAZWypwjog6fBOlBH8ywvaXVk3EqqWVrsIUdQVh9vsOWs
 +RKHgetxaGZ1Bq58nBsdk5DKQkMYPCkZggQHd0tUZ5tVRs0LOUnMDUqmPRQKQE0jW43y
 REloFdNFAAIXqJCLLdM1+Mp+B1sEZeJFu4V+PXSIcHnfCy5vbphBAkmTF+Dt1Fc2xKI8
 uysRtV5Z5C87wMPEgELmk7G79fCHuIUHLXQSfHRMRcOw9++ujfjCfV3JYdtFwrT1njIw
 N98Menlk8mrlvHGFYxynbVkQW5FSVtZ/oVmH4525e/3bXkqg3LDnVAuj/AB6h+wMK1hA
 C3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0lUQ6DZQ5HW3zVZ78eBQpqE45pWlfZ+bqEH97DKz20=;
 b=tAcf49rk4+YC3WoyhJzIsjYj9q+8YnPinZ+R5wvaMMwcMV452PaezmKz3wmNPYheWk
 a3qxqJxngqfPEphO4TrWQTyR7/MTJXmSS/BoWe6k00dFNLDjOy+9y/g4k6b9A6ZVfc3x
 qgkxqS3LHlC0PzHuDw4OlSpnsDL0d/2tG7ZIy4vpk3aONnepgLtHg+jicyprK2TvesyA
 cKRrhtTV+1QoTP71hjhTFT6rx4WATtmP5Y1PEZbnDEQX/IRoA3IicKCa+wGnuaz3Mppm
 pjNaz9CdDsQUe6wskB+jvlM0SfI3p5ifisywAAMJp68IUF6erRW+i08n51CKyCuX0kXd
 ssvQ==
X-Gm-Message-State: AOAM532aRnxybV0u46CpzegV58JBcdq0ru8Td8rrdx4Rh/6Q5Ctc2HAj
 s1jBaW+tcpJNKuSUiz+bxxPuM05A35VKDkiV+Dvl7Kqe
X-Google-Smtp-Source: ABdhPJxoKA6BqXfxB/J/Vv919kXamSFFjVlSXwDjOQPE1QYa/TEJShMLVSYjx++m+BRzoXPnCmaotoMOgPpsnP1rfYU=
X-Received: by 2002:a05:620a:526:: with SMTP id
 h6mr1931173qkh.338.1590420395229; 
 Mon, 25 May 2020 08:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <20200525151515.GK206103@phenom.ffwll.local>
 <y61UnQ7JgZGomUBsKxwazOBwHB6sLQG3RfeimrIQ97Z35kTL6kwdLyCekZVWVVYA05qTERecIAbZdORUorZVsm_WK7zz9tPYCdGzWc0d2aw=@emersion.fr>
In-Reply-To: <y61UnQ7JgZGomUBsKxwazOBwHB6sLQG3RfeimrIQ97Z35kTL6kwdLyCekZVWVVYA05qTERecIAbZdORUorZVsm_WK7zz9tPYCdGzWc0d2aw=@emersion.fr>
From: uday kiran pichika <udaykiran.pichika@gmail.com>
Date: Mon, 25 May 2020 20:56:24 +0530
Message-ID: <CAGcx_0Z-1fafZW1cK-VwA+6oDY+bi6j-YeAQDUthByExDO6i6Q@mail.gmail.com>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: Simon Ser <contact@emersion.fr>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2013705017=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2013705017==
Content-Type: multipart/alternative; boundary="000000000000b384ae05a67a9acd"

--000000000000b384ae05a67a9acd
Content-Type: text/plain; charset="UTF-8"

Thanks for the input simon. Sway Compositor is based on the wayland
protocol right !!

But we are trying to do it through Xorg modesetting driver..

On Mon, May 25, 2020 at 8:50 PM Simon Ser <contact@emersion.fr> wrote:

> On Monday, May 25, 2020 5:15 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:
> >
> > > Hello,
> > > Am working on enabling the Adaptive sync feature as part of the
> > > Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> > > (xf86-video-amdgpu). Below is the commit which i submitted.
> > >
> https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371cc3731ee805cc4a0ace80db
> > > I have made the below changes to enable this feature
> > >
> > > 1.  Enable Adaptive sync in Graphics Driver
> > > 2.  Added Xorg.conf file with VariableRefresh property which is read
> in the
> > >     Modesetting driver --> This is working fine.
> > >
> >
> > -modesetting, even in latest git master branch doesn't have VRR support.
> >
> > So yeah this wont work.
>
> FWIW, Sway supports VRR (via the output adaptive_sync command). So it
> would be a way to test your driver.
>

--000000000000b384ae05a67a9acd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the input simon. Sway Compositor is based on th=
e wayland protocol right !!=C2=A0<div><br></div><div>But we are trying to d=
o it through Xorg modesetting driver..=C2=A0</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2020 at 8=
:50 PM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersio=
n.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Monday, May 25, 2020 5:15 PM, Daniel Vetter &lt;<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
<br>
&gt; On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:<br=
>
&gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt; Am working on enabling the Adaptive sync feature as part of the<b=
r>
&gt; &gt; Xorg/Modesetting DDX driver by taking the reference of AMD DDX Dr=
iver<br>
&gt; &gt; (xf86-video-amdgpu). Below is the commit which i submitted.<br>
&gt; &gt; <a href=3D"https://gitlab.freedesktop.org/pichika/xserver/-/commi=
t/682565a645bda7371cc3731ee805cc4a0ace80db" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda=
7371cc3731ee805cc4a0ace80db</a><br>
&gt; &gt; I have made the below changes to enable this feature<br>
&gt; &gt;<br>
&gt; &gt; 1.=C2=A0 Enable Adaptive sync in Graphics Driver<br>
&gt; &gt; 2.=C2=A0 Added Xorg.conf file with VariableRefresh property which=
 is read in the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Modesetting driver --&gt; This is working fine=
.<br>
&gt; &gt;<br>
&gt;<br>
&gt; -modesetting, even in latest git master branch doesn&#39;t have VRR su=
pport.<br>
&gt;<br>
&gt; So yeah this wont work.<br>
<br>
FWIW, Sway supports VRR (via the output adaptive_sync command). So it<br>
would be a way to test your driver.<br>
</blockquote></div>

--000000000000b384ae05a67a9acd--

--===============2013705017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2013705017==--
