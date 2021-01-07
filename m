Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6732ED683
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 19:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C96E4BB;
	Thu,  7 Jan 2021 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5876E4BB;
 Thu,  7 Jan 2021 18:16:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id e25so6373163wme.0;
 Thu, 07 Jan 2021 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dtWKf6tRrhItSb5VhyeomkPrRBxGDF94Fh/7b2h+YY=;
 b=f83GeQ61iiYHRgZlKHsI0NE3Poh5y7ac0clGNTTttboEkJrJPRmg/+NeT8jBVAn4n4
 O0YutMlfykSaqaoo2PKPxMMKu6dxZzkvp8yljIYEdraVGkdgLwhMLjb/WFH2zMg9lB4o
 2uy6o/cqz5pfHwJmMOmeM3wIv4zgmiD+1D5U4g4w3DpeOuSENTuDLhp5m0QBGWWG7D+W
 gmnSCqrMdy3SLZdkIYNt+2CNEHmBZ1/1yUNSJd1ApXfRu8JP7pPxPBSbxru23uh8Fu6S
 mt9Yl2oOlwCSeDyRqt81dv5SJoBIvUNlSEi4tDE+PCkz1UQ/l9qzHwdYHdl0/kMcsHmz
 lRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dtWKf6tRrhItSb5VhyeomkPrRBxGDF94Fh/7b2h+YY=;
 b=BjYrEj2aC5Y3fL3QrnauKeL9RiMu5s09aN7aNx6NysoQMwEt64ht1+RkXriqi5KR8J
 Djd4vrTbVFD5VRT3AluCOkcRprPoIbVNJm7aXynyV3bTtCSIBZfV4lx/yH+t43h9ser5
 3yHy+Tw9d2PR0h+B7UN5RwZ4TaXSNHa9Q26QDgsg92mPJAX3eJuU8AkozusfM4p2k3u1
 vfhVU5rl4BrbNnJBncY+eWDPE1dCOzshIeRY+ssUjQtM/ZY6ZYmP9P9OTJoTPIjJ7kWo
 IeEDzJaJQe12l0elLBj2bJ8kV6H4Sqrnrb5nHKjFuhJ7phz1hwA/wJiWDS3BFH1MFJfB
 XcsQ==
X-Gm-Message-State: AOAM531a8PYJv2laWA3++rNYLPErCA3vOU+uUgkwgvDMQzfBf/a75LxB
 vux7voxH/q6oN2ds2qGr/y/9D/Hhk7JYr+52CPE=
X-Google-Smtp-Source: ABdhPJyohHOLXBDF2A+Es2kLllyqYL17Slm04RyTmG+z6+wwMM/DHVW0vxca8BAi/jzXtANNzMv5DOzyLYd8vHqLgUQ=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr8709260wma.105.1610043384314; 
 Thu, 07 Jan 2021 10:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
 <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
 <CAEsyxyjaYkBzp_nPifhUpUJ=7vJO7MbeimeZM5H13Cta7bj9Ew@mail.gmail.com>
 <CAKMK7uFBrkQhV=-Hqr3EfqAPn2Vu+hM9PVKh290fw2jQJ5TPCA@mail.gmail.com>
In-Reply-To: <CAKMK7uFBrkQhV=-Hqr3EfqAPn2Vu+hM9PVKh290fw2jQJ5TPCA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 7 Jan 2021 19:16:12 +0100
Message-ID: <CAEsyxyihZQNf-_UXeQQ+8XHad226XPMFqoJ9hFfoDae9NVi6pg@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
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
Cc: zhan.liu@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0253218522=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0253218522==
Content-Type: multipart/alternative; boundary="000000000000febe3f05b8536f87"

--000000000000febe3f05b8536f87
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 7:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jan 7, 2021 at 7:00 PM Mario Kleiner <mario.kleiner.de@gmail.com>
> wrote:
> >
> > On Thu, Jan 7, 2021 at 6:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:
> >> > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> >> > <bas@basnieuwenhuizen.nl> wrote:
> >> > >
> >> > > With modifiers one can actually have different format_info structs
> >> > > for the same format, which now matters for AMDGPU since we convert
> >> > > implicit modifiers to explicit modifiers with multiple planes.
> >> > >
> >> > > I checked other drivers and it doesn't look like they end up
> triggering
> >> > > this case so I think this is safe to relax.
> >> > >
> >> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for
> converted metadata.")
> >> > > ---
> >> > >  drivers/gpu/drm/drm_plane.c | 2 +-
> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/drm_plane.c
> b/drivers/gpu/drm/drm_plane.c
> >> > > index e6231947f987..f5085990cfac 100644
> >> > > --- a/drivers/gpu/drm/drm_plane.c
> >> > > +++ b/drivers/gpu/drm/drm_plane.c
> >> > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct
> drm_device *dev,
> >> > >         if (ret)
> >> > >                 goto out;
> >> > >
> >> > > -       if (old_fb->format != fb->format) {
> >> > > +       if (old_fb->format->format != fb->format->format) {
> >> >
> >> > This was btw. the original way before Ville made it more strict about
> >> > 4 years ago, to catch issues related to tiling, and more complex
> >> > layouts, like the dcc tiling/retiling introduced by your modifier
> >> > patches. That's why I hope my alternative patch is a good solution for
> >> > atomic drivers while keeping the strictness for potential legacy
> >> > drivers.
> >>
> >> Yeah this doesn't work in full generality, because hw might need to do a
> >> full modeset to do a full modeset to reallocate resources (like scanout
> >> fifo space) if the format changes.
> >>
> >> But for atomic drivers that should be caught in ->atomic_check, which
> >> should result in -EINVAL, so should do the right thing. So it should be
> >> all good, but imo needs a comment to explain what's going on:
> >>
> >>         /*
> >>          * Only check the FOURCC format code, excluding modifiers. This
> is
> >>          * enough for all legacy drivers. Atomic drivers have their own
> >>          * checks in their ->atomic_check implementation, which will
> >>          * return -EINVAL if any hw or driver constraint is violated due
> >>          * to modifier changes.
> >>          */
> >>
> >> Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?
> >>
> >> With that:
> >>
> >> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>
> >
> > Ah, my "atomic expert", posting simultaneously with myself :). Happy new
> year. Opinions on my variant, just replied a minute ago?
>
> Full disclosure, Ville wanted to do something similar since forever
> I'm not a huge fan of removing limitations of legacy ioctls. Worst
> case we break something, best case no gain in features since why don't
> you just use atomic. Since this (amdgpu modifiers) broke something we
> have to fix it, hence I'd go with the more minimal version from Bas
> here.
>
>
Fair point. Means though that somebody will have to convert many user-space
clients, e.g., all OSS Vulkan drivers. And XOrg could not do that, as the
kernel uabi even blocks use of atomic drmSetClientCap(...ATOMIC...) for any
process whose taskname starts with 'X', as a workaround for a
modesetting-ddx with broken atomic implementation. So at least for (pun
ahead) "X" applications, atomic modesetting is not an option.

For my use cases, X11/XOrg native is still the only display server capable
enough to fulfill the needs, although I'm mixing in a bit of
Vulkan/WSI/DirectDisplay for direct DRM/KMS access to work around some
limitations, e.g., to get HDR or fp16 support.

But in general your patch should be correct too.
> -Daniel
>
>
Thanks for the feedback. I rest my case.
-mario


> >
> > thanks,
> > -mario
> >
> >> >
> >> > -mario
> >> >
> >> > >                 DRM_DEBUG_KMS("Page flip is not allowed to change
> frame buffer format.\n");
> >> > >                 ret = -EINVAL;
> >> > >                 goto out;
> >> > > --
> >> > > 2.29.2
> >> > >
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000febe3f05b8536f87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 7, 2021 at 7:04 PM Daniel Vet=
ter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Jan 7, 2021 at 7:00 PM Mario Kleiner &lt;<a href=3D"mail=
to:mario.kleiner.de@gmail.com" target=3D"_blank">mario.kleiner.de@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 7, 2021 at 6:57 PM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:<br>
&gt;&gt; &gt; On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=3D"_bla=
nk">bas@basnieuwenhuizen.nl</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; With modifiers one can actually have different format_in=
fo structs<br>
&gt;&gt; &gt; &gt; for the same format, which now matters for AMDGPU since =
we convert<br>
&gt;&gt; &gt; &gt; implicit modifiers to explicit modifiers with multiple p=
lanes.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I checked other drivers and it doesn&#39;t look like the=
y end up triggering<br>
&gt;&gt; &gt; &gt; this case so I think this is safe to relax.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:b=
as@basnieuwenhuizen.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<b=
r>
&gt;&gt; &gt; &gt; Fixes: 816853f9dc40 (&quot;drm/amd/display: Set new form=
at info for converted metadata.&quot;)<br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/drm_plane.c | 2 +-<br>
&gt;&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/d=
rm/drm_plane.c<br>
&gt;&gt; &gt; &gt; index e6231947f987..f5085990cfac 100644<br>
&gt;&gt; &gt; &gt; --- a/drivers/gpu/drm/drm_plane.c<br>
&gt;&gt; &gt; &gt; +++ b/drivers/gpu/drm/drm_plane.c<br>
&gt;&gt; &gt; &gt; @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struc=
t drm_device *dev,<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto out;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_fb-&gt;format !=3D f=
b-&gt;format) {<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_fb-&gt;format-&gt;fo=
rmat !=3D fb-&gt;format-&gt;format) {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This was btw. the original way before Ville made it more stri=
ct about<br>
&gt;&gt; &gt; 4 years ago, to catch issues related to tiling, and more comp=
lex<br>
&gt;&gt; &gt; layouts, like the dcc tiling/retiling introduced by your modi=
fier<br>
&gt;&gt; &gt; patches. That&#39;s why I hope my alternative patch is a good=
 solution for<br>
&gt;&gt; &gt; atomic drivers while keeping the strictness for potential leg=
acy<br>
&gt;&gt; &gt; drivers.<br>
&gt;&gt;<br>
&gt;&gt; Yeah this doesn&#39;t work in full generality, because hw might ne=
ed to do a<br>
&gt;&gt; full modeset to do a full modeset to reallocate resources (like sc=
anout<br>
&gt;&gt; fifo space) if the format changes.<br>
&gt;&gt;<br>
&gt;&gt; But for atomic drivers that should be caught in -&gt;atomic_check,=
 which<br>
&gt;&gt; should result in -EINVAL, so should do the right thing. So it shou=
ld be<br>
&gt;&gt; all good, but imo needs a comment to explain what&#39;s going on:<=
br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Only check the FOURCC format c=
ode, excluding modifiers. This is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * enough for all legacy drivers.=
 Atomic drivers have their own<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * checks in their -&gt;atomic_ch=
eck implementation, which will<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * return -EINVAL if any hw or dr=
iver constraint is violated due<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to modifier changes.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;<br>
&gt;&gt; Also can you pls cc: intel-gfx to get this vetted by the intel-gfx=
 ci?<br>
&gt;&gt;<br>
&gt;&gt; With that:<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffw=
ll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Ah, my &quot;atomic expert&quot;, posting simultaneously with myself :=
). Happy new year. Opinions on my variant, just replied a minute ago?<br>
<br>
Full disclosure, Ville wanted to do something similar since forever<br>
I&#39;m not a huge fan of removing limitations of legacy ioctls. Worst<br>
case we break something, best case no gain in features since why don&#39;t<=
br>
you just use atomic. Since this (amdgpu modifiers) broke something we<br>
have to fix it, hence I&#39;d go with the more minimal version from Bas<br>
here.<br>
<br></blockquote><div><br></div><div>Fair point. Means though that somebody=
 will have to convert many user-space clients, e.g., all OSS Vulkan drivers=
. And XOrg could not do that, as the kernel uabi even blocks use of atomic =
drmSetClientCap(...ATOMIC...) for any process whose taskname starts with &#=
39;X&#39;, as a workaround for a modesetting-ddx with broken atomic impleme=
ntation. So at least for (pun ahead) &quot;X&quot; applications, atomic mod=
esetting is not an option.<br></div><div><br></div><div>For my use cases, X=
11/XOrg native is still the only display server capable enough to fulfill t=
he needs, although I&#39;m mixing in a bit of Vulkan/WSI/DirectDisplay for =
direct DRM/KMS access to work around some limitations, e.g., to get HDR or =
fp16 support.<br></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
But in general your patch should be correct too.<br>
-Daniel<br>
<br></blockquote><div><div><br></div><div>Thanks for the feedback. I rest m=
y case.</div><div>-mario</div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt;<br>
&gt; thanks,<br>
&gt; -mario<br>
&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -mario<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_DEBUG_KMS(&quot;Page flip is not allowed to change frame buffer f=
ormat.\n&quot;);<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ret =3D -EINVAL;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto out;<br>
&gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt; &gt; 2.29.2<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Daniel Vetter<br>
&gt;&gt; Software Engineer, Intel Corporation<br>
&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bla=
nk">http://blog.ffwll.ch</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000febe3f05b8536f87--

--===============0253218522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0253218522==--
