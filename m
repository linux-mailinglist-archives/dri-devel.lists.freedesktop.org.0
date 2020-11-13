Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE652B279E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 23:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048096E85C;
	Fri, 13 Nov 2020 22:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7446E85B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 22:02:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f27so8208606pgl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 14:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRtOzH8Nc0MgC6/zLN3xO4F/ZQv+PfRqX49DwFMAUvQ=;
 b=BORVvPZ9l1qu0s+kVIE9t8hbaXdl/fkndHHYs4tH6WJMubhTTukjsEjVadYMUpURzQ
 VLKp6zV+JbW73vbgeevf6CTM2qVMhIgP480Nk+rHG2tvCWsr7y4jltOJGpORFtuPZclP
 twArjlKb2sasMshV0LM5Yc4eUtO2kzX9jn36iATCkqQKnO17vjgA++OeFKi881wxdjfJ
 wcHo8eBPT/P2/cVr1e5xRyiq+7CpggsJll+WtaQjJt1xignX8O8hnpN1yEwVzezbVAdh
 WbXi4AZTZpV1Hjwphngf8WXkL4Hy2GE6ve0bPaJVbVPr8LzhpzPdBNCGEiIxCJ7S+73F
 rJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRtOzH8Nc0MgC6/zLN3xO4F/ZQv+PfRqX49DwFMAUvQ=;
 b=dJClRnePd7AgUzxrMHSnVXITCjq5ke5I05PCG0+07ID6NAst9rFZ3fio/1u8eQw983
 g+C2UJv6UnqbH/vmyfSWByFoSMMGy8jTlzjjRa8gaJ3wCj9RF8MADrFO0zxRK9vdZb5H
 knsS2jmwSsjShB3MGBsPPEffnhvhUPLYVsca+vPBQi2WCI4Wfuw4h+QuHdges1YdAMvo
 4Qc3465qQPsA/A++0JcIkJiqX/xWD1E/NlVDaMEIWj0t4Ggu0g3JD4JjghPq3t1zC+ZE
 FTE44YS5Z1XPHGuxDLGGdKaGQF2T8JoPpIh6MfgK24syTLb/+0Ipgwouthn9Gk7xazbZ
 aSCw==
X-Gm-Message-State: AOAM5309YckS+KVqXPC1oobLdjmeEll+ziu478Ij5cR4AIyp/KYB2IdW
 Q4sxdDgPAKXpZ1823hibBwYF4GG4D7OtQzeCF4bIzve3G6B3/g==
X-Google-Smtp-Source: ABdhPJymZyPyc0RXzUUECHewnD6F6nXAdIMUulssOfv5xg32RuEw2hN5pXK4BhGpjd9yO+ml3bz70f36PDSnGE1fZPA=
X-Received: by 2002:a17:90b:3844:: with SMTP id
 nl4mr4976343pjb.93.1605304924506; 
 Fri, 13 Nov 2020 14:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
 <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 13 Nov 2020 22:01:57 +0000
Message-ID: <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1964056479=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1964056479==
Content-Type: multipart/alternative; boundary="000000000000c82b4605b4042d39"

--000000000000c82b4605b4042d39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Nov 2020, 21:31 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Fri, Nov 13, 2020 at 9:53 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> >
> >
> > On Fri, 13 Nov 2020, 20:50 Daniel Vetter, <daniel@ffwll.ch> wrote:
> >>
> >> On Thu, Nov 12, 2020 at 09:25:16PM +0100, Sam Ravnborg wrote:
> >> > Hi Lee,
> >> >
> >> > On Thu, Nov 12, 2020 at 07:00:11PM +0000, Lee Jones wrote:
> >> > > The precedent has already been set by other macros in the same fil=
e.
> >> > >
> >> > > Fixes the following W=3D1 kernel build warning(s):
> >> > >
> >> > >  drivers/gpu/drm/vkms/vkms_drv.c:55:19: warning: variable =E2=80=
=98crtc=E2=80=99
> set but not used [-Wunused-but-set-variable]
> >> > >  55 | struct drm_crtc *crtc;
> >> > >  | ^~~~
> >> > >
> >> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > > Cc: Maxime Ripard <mripard@kernel.org>
> >> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> > > Cc: David Airlie <airlied@linux.ie>
> >> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> > > Cc: Rob Clark <robdclark@gmail.com>
> >> > > Cc: dri-devel@lists.freedesktop.org
> >> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >> >
> >> > Also applied to drm-misc-next.
> >> > This was the last patch from this batch I will process.
> >> > The others are left for the maintainers to pick up.
> >>
> >> btw for patches that maintainers don't pick up, the usual process is
> that
> >> we give them 2 weeks, then just mass apply. Now you're producing a lot
> of
> >> patches, too much for me to keep track, so please just ping me with a
> >> resend for those that expired and I'll go through and pick them all up=
.
> >
> >
> > That's great Daniel. Thanks for your support.
> >
> > I can do one better than that.
> >
> > Would a pull-request suit you?
>
> We have a few trees going on, and your patches are landing through all
> kinds of them. So this might be more coordination pain. If you can
> exclude patches for the separately and usually fairly well maintained
> drivers out of the pull it should work (drm/amd, drm/radeon, drm/i915,
> drm/nouveau, drm/msm and drm/omapdrm probably the usual ones).
>
> Or you just send the next pile and we'll see.
>
> Also I guess I can't really interest you in commit rights so this
> patch bombs get off my back again? :-)
>

What does that mean? Merge my own patches?

Not sure how that works with your group maintenance setup.

Is it just a `git push`?

>

--000000000000c82b4605b4042d39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 13 Nov 2020, 21:31 Daniel Vetter, &lt;<a href=
=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Fri, Nov 13, 2020 at 9:53 PM Lee Jones &lt;<a hr=
ef=3D"mailto:lee.jones@linaro.org" target=3D"_blank" rel=3D"noreferrer">lee=
.jones@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, 13 Nov 2020, 20:50 Daniel Vetter, &lt;<a href=3D"mailto:daniel=
@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Nov 12, 2020 at 09:25:16PM +0100, Sam Ravnborg wrote:<br>
&gt;&gt; &gt; Hi Lee,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Nov 12, 2020 at 07:00:11PM +0000, Lee Jones wrote:<br=
>
&gt;&gt; &gt; &gt; The precedent has already been set by other macros in th=
e same file.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Fixes the following W=3D1 kernel build warning(s):<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/vkms/vkms_drv.c:55:19: warning: va=
riable =E2=80=98crtc=E2=80=99 set but not used [-Wunused-but-set-variable]<=
br>
&gt;&gt; &gt; &gt;=C2=A0 55 | struct drm_crtc *crtc;<br>
&gt;&gt; &gt; &gt;=C2=A0 | ^~~~<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lank=
horst@linux.intel.com" target=3D"_blank" rel=3D"noreferrer">maarten.lankhor=
st@linux.intel.com</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.o=
rg" target=3D"_blank" rel=3D"noreferrer">mripard@kernel.org</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@=
suse.de" target=3D"_blank" rel=3D"noreferrer">tzimmermann@suse.de</a>&gt;<b=
r>
&gt;&gt; &gt; &gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie"=
 target=3D"_blank" rel=3D"noreferrer">airlied@linux.ie</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch"=
 target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">robdclark@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" t=
arget=3D"_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; &gt; &gt; Signed-off-by: Lee Jones &lt;<a href=3D"mailto:lee.jones=
@linaro.org" target=3D"_blank" rel=3D"noreferrer">lee.jones@linaro.org</a>&=
gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also applied to drm-misc-next.<br>
&gt;&gt; &gt; This was the last patch from this batch I will process.<br>
&gt;&gt; &gt; The others are left for the maintainers to pick up.<br>
&gt;&gt;<br>
&gt;&gt; btw for patches that maintainers don&#39;t pick up, the usual proc=
ess is that<br>
&gt;&gt; we give them 2 weeks, then just mass apply. Now you&#39;re produci=
ng a lot of<br>
&gt;&gt; patches, too much for me to keep track, so please just ping me wit=
h a<br>
&gt;&gt; resend for those that expired and I&#39;ll go through and pick the=
m all up.<br>
&gt;<br>
&gt;<br>
&gt; That&#39;s great Daniel. Thanks for your support.<br>
&gt;<br>
&gt; I can do one better than that.<br>
&gt;<br>
&gt; Would a pull-request suit you?<br>
<br>
We have a few trees going on, and your patches are landing through all<br>
kinds of them. So this might be more coordination pain. If you can<br>
exclude patches for the separately and usually fairly well maintained<br>
drivers out of the pull it should work (drm/amd, drm/radeon, drm/i915,<br>
drm/nouveau, drm/msm and drm/omapdrm probably the usual ones).<br>
<br>
Or you just send the next pile and we&#39;ll see.<br>
<br>
Also I guess I can&#39;t really interest you in commit rights so this<br>
patch bombs get off my back again? :-)<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">What does that mean? Merge my own pat=
ches?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Not sure how=
 that works with your group maintenance setup.=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Is it just a `git push`?=C2=A0</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000c82b4605b4042d39--

--===============1964056479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1964056479==--
