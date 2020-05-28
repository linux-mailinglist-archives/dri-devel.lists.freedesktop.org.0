Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC21E580B
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AECC6E088;
	Thu, 28 May 2020 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DB489020
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 06:59:55 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v26so15205278vsa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 23:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=up5fxMufeUvZFe0iGGxEFXlvwfyFwayq+BDftOuTDfY=;
 b=H1wzNTaMSQjhMs7QpDT8hN/y7HveXgIjKgvRU0dK1LNEkK7yXPZ/Tc5ieJTREmLvm5
 57OLN+s6/B8JpR3zadDJChVO0uSaHbPzNFnpkL5F+3Hlufx5cE5TqPQ2BQPDd6Hk9Do9
 Cz2oERq2hWWUI5CAO0E+t1hQWhPSa8i00bOxWTt8R/yUWGeMMrab+drbN4cdVeZ+mipB
 5oabKqo+PZWNjizxaddJipze1mL7Euq3CkkFQWPIgDfBIjR9zuE4bMh57m5ZrCYcEz54
 ieyqIKA8Ck1Y+p4/EATmh9sSTdIDyO9BSfzTCMXXRCXSkxrrSnANWG9EPofIJKGMG3CK
 Ek9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=up5fxMufeUvZFe0iGGxEFXlvwfyFwayq+BDftOuTDfY=;
 b=TFn4XiGC/iGKk87MegE6HBStmVZxC+MI2yR/1OIIgi9KOVXnEHJRpUMQSji1WSdoWl
 NqebrrRu5oNbcAQIT2MPINFVQvA8oR0Hsja2S849lO4c0n6IkSLttAARVbgyob2hDXv1
 W5x5m1wRGKULxThlmWHwkEtX/OUPkOuhqFVdlc1UQ7gxeRRBUMDx9xFMMVRGDDaZEWcF
 6fO8vSzAXWTxpUvqKN/OEPhNl1+nkxHHF/fiV8gvM7YaxtPEC1kf5w6lNn8UXnGyRaLZ
 SpP8d3l1SvfbBdrbLMceFWfzyTEhP5/Eg4RuPNBXhM9WsKKvLa14fiiAbWu5nilbI1Sy
 Ph4Q==
X-Gm-Message-State: AOAM5327K6qZ/dbxwBySP9Vh0DgB/n7GvJQebsDydKIh2V1Xw9Y7CPX8
 meeIx36rG2t1qyAOZwPhcFfIbkZrW0t2SIJerO0=
X-Google-Smtp-Source: ABdhPJxKWFjGxdGeI7av0ydbQUhb0z49Bw2ERvsW1SAs2alwjhqtrnZBLqbZHZ8LsuvO3dLrDoM/gJslMBpgToiPpU4=
X-Received: by 2002:a67:fa81:: with SMTP id f1mr880766vsq.104.1590649195003;
 Wed, 27 May 2020 23:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
In-Reply-To: <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Thu, 28 May 2020 12:29:43 +0530
Message-ID: <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1574132490=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1574132490==
Content-Type: multipart/alternative; boundary="0000000000003b046705a6afe0de"

--0000000000003b046705a6afe0de
Content-Type: text/plain; charset="UTF-8"

For creating new source property, is it good to follow
"drm_mode_create_hdmi_colorspace_property()"  as an example ? It seems that
currently there is no standard DRM property which allows DRM client to set
a specific output encoding (like YUV420, YUV422 etc). Also, there is no
standard property for letting client select YUV/RGB color range. I see
there are two ways to introduce new properties, 1. do something like
drm_mode_create_hdmi_colorspace_property 2. create custom property similar
to "Broadcast RGB". Is there opinion on which is a preferable way to expose
encoding and color rage selection property ?

Thanks,
-Yogish

On Tue, May 26, 2020 at 5:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen <ppaalanen@gmail.com>
> wrote:
> >
> > On Tue, 26 May 2020 10:01:23 +0530
> > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> >
> > > Hi,
> > >
> > > Is it possible to dynamically change enumeration list of  DRM
> enumeration
> > > property ? Motivation behind this question is to understand whether it
> is
> > > possible to create connector enum property (e.g a property which will
> list
> > > supported output encodings -  like yuv420, yuv422 etc) whose list of
> > > supported enum values could be changed dynamically e.g. based on which
> sink
> > > is connected.
> > >
> > > I think there is existing EDID connector property whose value changes
> based
> > > on connected sink. EDID is a BLOB property, I am trying to understand
> if
> > > this is also possible for ENUM type property. There is
> > > "drm_property_replace_blob" to replace blob but I wasn't able to find
> any
> > > API which could replace list of supported enums. Alternatively, would
> it be
> > > good idea to destroy custom enum property created by a driver and
> create
> > > new enum property with new list of supported enums e.g when there is a
> > > HOTPLUG event.
> >
> > Hi,
> >
> > looking at Weston code, it *might* cope with it. A hotplug event does
> > cause Weston to re-discover all properties of a connector. This is
> > specific to connectors only.
>
> Currently the kernel doesn't cope with that. Only objects which can be
> added/removed are connectors, blobs and fbs (iow the refcounted ones).
> Adding/removing properties isn't supported, nor is adding/removing
> which properties are attached to which object while that object is
> life.
>
> Also I think the uapi risk for this is way too big, see my other reply
> for what we've done in the past for stuff like this.
> -Daniel
>
> > The race exists though: userspace might be poking at KMS after you
> > changed the property in the kernel but before userspace handles the
> > hotplug event. You'd have to check that does not cause regressions. I
> > guess for a completely new property, the risk seems low, as userspace
> > does not know to poke at it (risk of using outdated property or value
> > IDs causing unexpected atomic commit failure). Also I'm not aware of
> > any KMS program that would yet attempt blind KMS state save & restore
> > to sanitize the KMS state after dropping and re-gaining DRM master.
> >
> > You'd have to check all other KMS using programs too: every Wayland
> > compositor, Xorg, DRM Vulkan WSI(?), ...
> >
> >
> > Thanks,
> > pq
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>

--0000000000003b046705a6afe0de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For creating new source property, is it good to follo=
w &quot;drm_mode_create_hdmi_colorspace_property()&quot;=C2=A0 as an exampl=
e ? It seems that currently there is no standard DRM property which allows =
DRM client to set a specific output encoding (like YUV420, YUV422 etc). Als=
o, there is no standard property for letting client select YUV/RGB color ra=
nge. I see there are two ways to introduce new properties, 1. do something =
like drm_mode_create_hdmi_colorspace_property 2. create custom property sim=
ilar to &quot;Broadcast RGB&quot;. Is there opinion on which is a preferabl=
e way to expose encoding and color rage selection property ?<br></div><div>=
<br></div><div>Thanks,</div><div>-Yogish<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 26, 2020 at 5=
:44 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen &lt;<a href=3D"mailto:ppaala=
nen@gmail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 26 May 2020 10:01:23 +0530<br>
&gt; Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.com" target=
=3D"_blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Is it possible to dynamically change enumeration list of=C2=A0 DR=
M enumeration<br>
&gt; &gt; property ? Motivation behind this question is to understand wheth=
er it is<br>
&gt; &gt; possible to create connector enum property (e.g a property which =
will list<br>
&gt; &gt; supported output encodings -=C2=A0 like yuv420, yuv422 etc) whose=
 list of<br>
&gt; &gt; supported enum values could be changed dynamically e.g. based on =
which sink<br>
&gt; &gt; is connected.<br>
&gt; &gt;<br>
&gt; &gt; I think there is existing EDID connector property whose value cha=
nges based<br>
&gt; &gt; on connected sink. EDID is a BLOB property, I am trying to unders=
tand if<br>
&gt; &gt; this is also possible for ENUM type property. There is<br>
&gt; &gt; &quot;drm_property_replace_blob&quot; to replace blob but I wasn&=
#39;t able to find any<br>
&gt; &gt; API which could replace list of supported enums. Alternatively, w=
ould it be<br>
&gt; &gt; good idea to destroy custom enum property created by a driver and=
 create<br>
&gt; &gt; new enum property with new list of supported enums e.g when there=
 is a<br>
&gt; &gt; HOTPLUG event.<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; looking at Weston code, it *might* cope with it. A hotplug event does<=
br>
&gt; cause Weston to re-discover all properties of a connector. This is<br>
&gt; specific to connectors only.<br>
<br>
Currently the kernel doesn&#39;t cope with that. Only objects which can be<=
br>
added/removed are connectors, blobs and fbs (iow the refcounted ones).<br>
Adding/removing properties isn&#39;t supported, nor is adding/removing<br>
which properties are attached to which object while that object is<br>
life.<br>
<br>
Also I think the uapi risk for this is way too big, see my other reply<br>
for what we&#39;ve done in the past for stuff like this.<br>
-Daniel<br>
<br>
&gt; The race exists though: userspace might be poking at KMS after you<br>
&gt; changed the property in the kernel but before userspace handles the<br=
>
&gt; hotplug event. You&#39;d have to check that does not cause regressions=
. I<br>
&gt; guess for a completely new property, the risk seems low, as userspace<=
br>
&gt; does not know to poke at it (risk of using outdated property or value<=
br>
&gt; IDs causing unexpected atomic commit failure). Also I&#39;m not aware =
of<br>
&gt; any KMS program that would yet attempt blind KMS state save &amp; rest=
ore<br>
&gt; to sanitize the KMS state after dropping and re-gaining DRM master.<br=
>
&gt;<br>
&gt; You&#39;d have to check all other KMS using programs too: every Waylan=
d<br>
&gt; compositor, Xorg, DRM Vulkan WSI(?), ...<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; pq<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" =
target=3D"_blank">http://blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000003b046705a6afe0de--

--===============1574132490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1574132490==--
