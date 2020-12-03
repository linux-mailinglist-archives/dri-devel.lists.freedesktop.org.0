Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B364A2CE9C3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716E16EC71;
	Fri,  4 Dec 2020 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876866E056
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 18:55:55 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id 145so659984vky.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 10:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROBCAp0290we+VI2Iq0YmJ+Slmu/Ml/AstasaU/FxAA=;
 b=AFHQqrIszh36CQQZ23M5iM4JxOjADMjZS0KLXpyJwiQ8VEWPkVCjFHFswXICM/G64j
 GZn/sWF9LsZLAWpDLNVBGtMiYizFgYuS5UcN33ZjCWp/6gUTaQ1KK+SsbTTIq+GOC8Fv
 jGpy472xOFWciIwjoMG78ybzVTT5GB3b/QVul+R6OptK4ODbYRSS5IUPdA56nayegIQC
 +vQx5DlXgRmVpgTupGPQ7RoFAE9K6nnB2wTGhK+v7HIcgZCy9Yzc+7hNoIFu7uvn8C7P
 J80nwE7ZchPa7wOdute5DOucESZSp9aIHhinEx+s/SS3R+qdFjRerWzJFKt1SxRmCRYk
 h4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROBCAp0290we+VI2Iq0YmJ+Slmu/Ml/AstasaU/FxAA=;
 b=qpBVK+W4KDjxpC3wBOj6hs61qLo6UWY+W3OamtGVvIePEeOr3xYPVJyOgFce51bHS6
 mBNl+RSpVAvBEpGQu7Y6apz+gwY2iDWjFoiTpDMhOvUrARtXyXHRztyEO2rk/DxhYp0e
 us1vp3PAh3ENf7jMw3xpObeXiBhe1/K72m+28IAsedGqGx/ITlpWbaQptR6NMsnAByWs
 BEIA6293JPawlHszkN6iGW5W8+LLlXD1PPdLgc5PKbK15+GRrEay0a9NHSW/spXAR/42
 PsbSbF2ljHgDqAbOxvlKANAMTXiIrhCd70Il/wkFOTdwYzmmltKhEaX5b1PbciSrkb4b
 IaNg==
X-Gm-Message-State: AOAM531tlftqmbnTjoD4Jvzi8e5LyGtBVbJXVQDTg1t8kGL+ni0wscym
 7jucirfpz9DR1rq/faQEimOrzpZ/DIQB7EFSuG5xUg==
X-Google-Smtp-Source: ABdhPJxjTEHVzagN7NuZoTQW3Gt/ln/UX3XiZVzlV5wIECBcTwYrJFYY/fxti8hzCs0YJV/JznGnZ0CgzIJ9WFN/hcE=
X-Received: by 2002:a05:6122:84f:: with SMTP id 15mr617018vkk.25.1607021754610; 
 Thu, 03 Dec 2020 10:55:54 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
In-Reply-To: <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Thu, 3 Dec 2020 10:55:07 -0800
Message-ID: <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1192418987=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1192418987==
Content-Type: multipart/alternative; boundary="000000000000d4906d05b593e89f"

--000000000000d4906d05b593e89f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't intentional,
right? Should I put all the integer types, or just the ones that are used
in that file?

Thanks,
James

On Thu, Dec 3, 2020 at 6:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Dec 3, 2020 at 9:18 AM Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:
> >
> > On 2020-12-02 8:47 p.m., James Park wrote:
> > >
> > > If we're trying to cut ties with the drm-uapi folder entirely, the
> stuff
> > > ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h,
> > > and AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot for
> these
> > > definitions?
> >
> > The Mesa src/amd/ code should use platform-neutral abstractions for
> > these. This wasn't deemed necessary before, because nobody was trying t=
o
> > build these drivers for non-UNIX OSes. But now you are.
>
> I think that's a bit much busy work for not much gain. drm_fourcc.h is
> even included as the official source of truth of some khr extensions,
> making that header stand-alone and useable cross-platform sounds like
> a good idea to me. Something like the below is imo perfectly fine:
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index ca48ed0e6bc1..0a121b3efb58 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,11 @@
> #ifndef DRM_FOURCC_H
> #define DRM_FOURCC_H
>
> +#ifndef DRM_FOURCC_STANDALONE_
> +/* include the linux uapi types here */
> +#else
> #include "drm.h"
> +#endif
>
> #if defined(__cplusplus)
> extern "C" {
>
>
> Cheers, Daniel
>
> >
> >
> > --
> > Earthling Michel D=C3=A4nzer               |               https://redh=
at.com
> > Libre software enthusiast             |             Mesa and X develope=
r
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
> http://blog.ffwll.ch
>

--000000000000d4906d05b593e89f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The trailing underscore for=C2=A0

DRM_FOURCC_STANDALONE_

 isn&#39;t intentional, right? Should I put all the integer types, or just =
the ones that are used in that file?<div><br></div><div>Thanks,</div><div>J=
ames</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Dec 3, 2020 at 6:52 AM Daniel Vetter &lt;<a href=3D"mailt=
o:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, Dec 3, 2020 at 9:18 AM Michel D=
=C3=A4nzer &lt;<a href=3D"mailto:michel@daenzer.net" target=3D"_blank">mich=
el@daenzer.net</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2020-12-02 8:47 p.m., James Park wrote:<br>
&gt; &gt;<br>
&gt; &gt; If we&#39;re trying to cut ties with the drm-uapi folder entirely=
, the stuff<br>
&gt; &gt; ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h,=
<br>
&gt; &gt; and AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot fo=
r these<br>
&gt; &gt; definitions?<br>
&gt;<br>
&gt; The Mesa src/amd/ code should use platform-neutral abstractions for<br=
>
&gt; these. This wasn&#39;t deemed necessary before, because nobody was try=
ing to<br>
&gt; build these drivers for non-UNIX OSes. But now you are.<br>
<br>
I think that&#39;s a bit much busy work for not much gain. drm_fourcc.h is<=
br>
even included as the official source of truth of some khr extensions,<br>
making that header stand-alone and useable cross-platform sounds like<br>
a good idea to me. Something like the below is imo perfectly fine:<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index ca48ed0e6bc1..0a121b3efb58 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -24,7 +24,11 @@<br>
#ifndef DRM_FOURCC_H<br>
#define DRM_FOURCC_H<br>
<br>
+#ifndef DRM_FOURCC_STANDALONE_<br>
+/* include the linux uapi types here */<br>
+#else<br>
#include &quot;drm.h&quot;<br>
+#endif<br>
<br>
#if defined(__cplusplus)<br>
extern &quot;C&quot; {<br>
<br>
<br>
Cheers, Daniel<br>
<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a hre=
f=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redha=
t.com</a><br>
&gt; Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br=
>
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
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000d4906d05b593e89f--

--===============1192418987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1192418987==--
