Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0F1E6022
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88C26E507;
	Thu, 28 May 2020 12:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA17C6E507
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:09:11 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id u7so15601112vsp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlCPWsCikMbIkUc1sTCekNqmdBoBnLya31ORGCOwPhU=;
 b=ZySQl11YuPWRM6VqOLd8sl9Vzw3SMolSxt0Py1lEBWxVqQTnGWqjqd5Vx4yQKcVL2f
 mSv6Ix7JDIG3eziJ4E0fTaQ1Gbj84RFAbymxvM23LcBWcIKavheRzH/I6V9HdwJvxfGe
 vpze94/hyiSgNvkhP3R3qGOfh2PsBtEBGl+Gb3bnuOrHKkwr8+KMHjZISe2QBUrHtW/X
 T4mRkdTCil1TUnT0n8KgNpfP6Zk2GDHEd022/IjrtZ5qu2A8WvNJMwTi0779UwML9ipo
 Xr2Lq4ln5TdeXO3Xf5a8ey8Y66qZSdmx/wu/zeiZEZqPhAj9FbaRP4/4Pnj8Qo3Ob00a
 DEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlCPWsCikMbIkUc1sTCekNqmdBoBnLya31ORGCOwPhU=;
 b=rSonXMR/cwCUkULT9Lif9YETvsI621slvmZK82/xlvjYWTex6vW56RRmjv6Q9w3yho
 M4SCZTknPILqTPpkI/PVeDELiTco+jhxdfSzFp5Jx0p9lLOpUAFcRRWIvp6I+S2Sfy2L
 Ekml8s116rrEd0MhTePv54cIsx4EQkQ9KhFRO40RP0Y5a2cFUnD5/Jy10mBIBwK24U9g
 LA6qxbzxvFDbCCFZ4NiH3ijcaAteT8xcgdLUjGPMnbTDTNv1VNmoTTjBC/i0Fm7iS40O
 vOPZNFXzUSEp2WLGqIHsU7jQ1S8EYPRYZ3O1F0axJ2ScDhu0GpFMDE/Fvv80oq6ahLCL
 RlJg==
X-Gm-Message-State: AOAM5310cGymlj0ZMqYntNdSzoxCU+cjmHXZA+lxUTW4uO6cm8omSrZy
 NRD+gZaCFhXaUJPa3dli9Uk/+qvj6klb86biYsA=
X-Google-Smtp-Source: ABdhPJwEjXdsQIhip4ZySPCF97pC9u0xxCwk4NWE8rFk4EiU43arg1MgAkwxnodIUX0h5C56GR7ZAa4FZEkcxE8Iorc=
X-Received: by 2002:a67:f30c:: with SMTP id p12mr567753vsf.11.1590667750571;
 Thu, 28 May 2020 05:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
In-Reply-To: <20200528082445.GR206103@phenom.ffwll.local>
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Thu, 28 May 2020 17:38:59 +0530
Message-ID: <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2042420493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2042420493==
Content-Type: multipart/alternative; boundary="0000000000003a81af05a6b432ae"

--0000000000003a81af05a6b432ae
Content-Type: text/plain; charset="UTF-8"

I am trying to find a way through Weston which will allow setting specific
encoding at display output. Could you please elaborate on  why it is best
to let DRM driver automatically configure which encoding to choose rather
than making it selectable by DRM client ? I am not able to find reference
to past discussion about this. I was only able to find a proposed change -
https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.html but
am not able to find why it got rejected.

Alternatively, is there existing way through which DRM clients can specify
preference for output encoding ? Or currently it's all up to the DRM driver
to choose what output encoding to use.

Thanks,
-Yogish

On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:
> > For creating new source property, is it good to follow
> > "drm_mode_create_hdmi_colorspace_property()"  as an example ? It seems
> that
> > currently there is no standard DRM property which allows DRM client to
> set
> > a specific output encoding (like YUV420, YUV422 etc). Also, there is no
> > standard property for letting client select YUV/RGB color range. I see
> > there are two ways to introduce new properties, 1. do something like
> > drm_mode_create_hdmi_colorspace_property 2. create custom property
> similar
> > to "Broadcast RGB". Is there opinion on which is a preferable way to
> expose
> > encoding and color rage selection property ?
>
> I guess first question is "why?" Thus far we've gone with the opinion that
> automatically configuring output stuff as much as possible is best. What's
> the use-case where the driver can't select this?
> -Daniel
>
> >
> > Thanks,
> > -Yogish
> >
> > On Tue, May 26, 2020 at 5:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen <ppaalanen@gmail.com>
> > > wrote:
> > > >
> > > > On Tue, 26 May 2020 10:01:23 +0530
> > > > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > Is it possible to dynamically change enumeration list of  DRM
> > > enumeration
> > > > > property ? Motivation behind this question is to understand
> whether it
> > > is
> > > > > possible to create connector enum property (e.g a property which
> will
> > > list
> > > > > supported output encodings -  like yuv420, yuv422 etc) whose list
> of
> > > > > supported enum values could be changed dynamically e.g. based on
> which
> > > sink
> > > > > is connected.
> > > > >
> > > > > I think there is existing EDID connector property whose value
> changes
> > > based
> > > > > on connected sink. EDID is a BLOB property, I am trying to
> understand
> > > if
> > > > > this is also possible for ENUM type property. There is
> > > > > "drm_property_replace_blob" to replace blob but I wasn't able to
> find
> > > any
> > > > > API which could replace list of supported enums. Alternatively,
> would
> > > it be
> > > > > good idea to destroy custom enum property created by a driver and
> > > create
> > > > > new enum property with new list of supported enums e.g when there
> is a
> > > > > HOTPLUG event.
> > > >
> > > > Hi,
> > > >
> > > > looking at Weston code, it *might* cope with it. A hotplug event does
> > > > cause Weston to re-discover all properties of a connector. This is
> > > > specific to connectors only.
> > >
> > > Currently the kernel doesn't cope with that. Only objects which can be
> > > added/removed are connectors, blobs and fbs (iow the refcounted ones).
> > > Adding/removing properties isn't supported, nor is adding/removing
> > > which properties are attached to which object while that object is
> > > life.
> > >
> > > Also I think the uapi risk for this is way too big, see my other reply
> > > for what we've done in the past for stuff like this.
> > > -Daniel
> > >
> > > > The race exists though: userspace might be poking at KMS after you
> > > > changed the property in the kernel but before userspace handles the
> > > > hotplug event. You'd have to check that does not cause regressions. I
> > > > guess for a completely new property, the risk seems low, as userspace
> > > > does not know to poke at it (risk of using outdated property or value
> > > > IDs causing unexpected atomic commit failure). Also I'm not aware of
> > > > any KMS program that would yet attempt blind KMS state save & restore
> > > > to sanitize the KMS state after dropping and re-gaining DRM master.
> > > >
> > > > You'd have to check all other KMS using programs too: every Wayland
> > > > compositor, Xorg, DRM Vulkan WSI(?), ...
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000003a81af05a6b432ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am trying to find a way through Weston which will a=
llow setting specific encoding at display output. Could you please elaborat=
e on=C2=A0 why it is best to let DRM driver automatically configure which e=
ncoding to choose rather than making it selectable by DRM client ? I am not=
 able to find reference to past discussion about this. I was only able to f=
ind a proposed change - <a href=3D"https://lists.freedesktop.org/archives/i=
ntel-gfx/2017-April/125451.html">https://lists.freedesktop.org/archives/int=
el-gfx/2017-April/125451.html</a> but am not able to find why it got reject=
ed.</div><div><br></div><div>Alternatively, is there existing way through w=
hich DRM clients can specify preference for output encoding ? Or currently =
it&#39;s all up to the DRM driver to choose what output encoding to use.<br=
></div><div><br></div><div>Thanks,</div><div>-Yogish<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 2=
8, 2020 at 1:54 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">dan=
iel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote=
:<br>
&gt; For creating new source property, is it good to follow<br>
&gt; &quot;drm_mode_create_hdmi_colorspace_property()&quot;=C2=A0 as an exa=
mple ? It seems that<br>
&gt; currently there is no standard DRM property which allows DRM client to=
 set<br>
&gt; a specific output encoding (like YUV420, YUV422 etc). Also, there is n=
o<br>
&gt; standard property for letting client select YUV/RGB color range. I see=
<br>
&gt; there are two ways to introduce new properties, 1. do something like<b=
r>
&gt; drm_mode_create_hdmi_colorspace_property 2. create custom property sim=
ilar<br>
&gt; to &quot;Broadcast RGB&quot;. Is there opinion on which is a preferabl=
e way to expose<br>
&gt; encoding and color rage selection property ?<br>
<br>
I guess first question is &quot;why?&quot; Thus far we&#39;ve gone with the=
 opinion that<br>
automatically configuring output stuff as much as possible is best. What&#3=
9;s<br>
the use-case where the driver can&#39;t select this?<br>
-Daniel<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Yogish<br>
&gt; <br>
&gt; On Tue, May 26, 2020 at 5:44 PM Daniel Vetter &lt;<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen &lt;<a href=3D"mai=
lto:ppaalanen@gmail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, 26 May 2020 10:01:23 +0530<br>
&gt; &gt; &gt; Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.c=
om" target=3D"_blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Is it possible to dynamically change enumeration list o=
f=C2=A0 DRM<br>
&gt; &gt; enumeration<br>
&gt; &gt; &gt; &gt; property ? Motivation behind this question is to unders=
tand whether it<br>
&gt; &gt; is<br>
&gt; &gt; &gt; &gt; possible to create connector enum property (e.g a prope=
rty which will<br>
&gt; &gt; list<br>
&gt; &gt; &gt; &gt; supported output encodings -=C2=A0 like yuv420, yuv422 =
etc) whose list of<br>
&gt; &gt; &gt; &gt; supported enum values could be changed dynamically e.g.=
 based on which<br>
&gt; &gt; sink<br>
&gt; &gt; &gt; &gt; is connected.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think there is existing EDID connector property whose=
 value changes<br>
&gt; &gt; based<br>
&gt; &gt; &gt; &gt; on connected sink. EDID is a BLOB property, I am trying=
 to understand<br>
&gt; &gt; if<br>
&gt; &gt; &gt; &gt; this is also possible for ENUM type property. There is<=
br>
&gt; &gt; &gt; &gt; &quot;drm_property_replace_blob&quot; to replace blob b=
ut I wasn&#39;t able to find<br>
&gt; &gt; any<br>
&gt; &gt; &gt; &gt; API which could replace list of supported enums. Altern=
atively, would<br>
&gt; &gt; it be<br>
&gt; &gt; &gt; &gt; good idea to destroy custom enum property created by a =
driver and<br>
&gt; &gt; create<br>
&gt; &gt; &gt; &gt; new enum property with new list of supported enums e.g =
when there is a<br>
&gt; &gt; &gt; &gt; HOTPLUG event.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; looking at Weston code, it *might* cope with it. A hotplug e=
vent does<br>
&gt; &gt; &gt; cause Weston to re-discover all properties of a connector. T=
his is<br>
&gt; &gt; &gt; specific to connectors only.<br>
&gt; &gt;<br>
&gt; &gt; Currently the kernel doesn&#39;t cope with that. Only objects whi=
ch can be<br>
&gt; &gt; added/removed are connectors, blobs and fbs (iow the refcounted o=
nes).<br>
&gt; &gt; Adding/removing properties isn&#39;t supported, nor is adding/rem=
oving<br>
&gt; &gt; which properties are attached to which object while that object i=
s<br>
&gt; &gt; life.<br>
&gt; &gt;<br>
&gt; &gt; Also I think the uapi risk for this is way too big, see my other =
reply<br>
&gt; &gt; for what we&#39;ve done in the past for stuff like this.<br>
&gt; &gt; -Daniel<br>
&gt; &gt;<br>
&gt; &gt; &gt; The race exists though: userspace might be poking at KMS aft=
er you<br>
&gt; &gt; &gt; changed the property in the kernel but before userspace hand=
les the<br>
&gt; &gt; &gt; hotplug event. You&#39;d have to check that does not cause r=
egressions. I<br>
&gt; &gt; &gt; guess for a completely new property, the risk seems low, as =
userspace<br>
&gt; &gt; &gt; does not know to poke at it (risk of using outdated property=
 or value<br>
&gt; &gt; &gt; IDs causing unexpected atomic commit failure). Also I&#39;m =
not aware of<br>
&gt; &gt; &gt; any KMS program that would yet attempt blind KMS state save =
&amp; restore<br>
&gt; &gt; &gt; to sanitize the KMS state after dropping and re-gaining DRM =
master.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You&#39;d have to check all other KMS using programs too: ev=
ery Wayland<br>
&gt; &gt; &gt; compositor, Xorg, DRM Vulkan WSI(?), ...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; pq<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; dri-devel mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D=
"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dr=
i-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org=
/mailman/listinfo/dri-devel</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Daniel Vetter<br>
&gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; +41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" rel=3D"no=
referrer" target=3D"_blank">http://blog.ffwll.ch</a><br>
&gt; &gt;<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000003a81af05a6b432ae--

--===============2042420493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2042420493==--
