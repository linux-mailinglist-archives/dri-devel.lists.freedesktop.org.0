Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBB30D4CA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3211E6E9DF;
	Wed,  3 Feb 2021 08:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360EF6E993
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:21:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id p20so13670595ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 17:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9Pnm95SUolHTnz+J5ISxm+v9KlKHALRKzJ5GODxh14=;
 b=bFf0yhWe0a1fB29uLPqRcBLUf+qD2Kh9RYGu+90c/2O6fYOgHlDowSX5kUHCZm9YWq
 k7iEu00wCjQKi95K2WK8/i/7MbZM3OSfqTPQ+kk7eazFL6hiSVzq9vXsj7hjrCoPI/Cz
 TkJjIAocpOXR6ettHWfKva3THOMA5yfyr8rGn9t7NTSuj+UbGuW1we3YfVPjcRblDTrJ
 pntC1/dI4DvlxgT/qO/+wWu4Rr/kOexVW1SwzE/WcP5xxwMQVJzo4QnGy1u2vGFpOu7K
 AsFZWgD6UJjRhhBH+XGXz/gyoM7OCQP+gdnXdc68z9viQ13rAmvsk7WJZLHheAY9EvVD
 XLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9Pnm95SUolHTnz+J5ISxm+v9KlKHALRKzJ5GODxh14=;
 b=KDRtxmGeV9lEu1aiPQ0NMl/QLXztVF8dPDTvuinoLFhXe3655cWDnGxbYsZOu7xQeM
 4U9Pb1RjBilwK6MYY1Zx3Du9aSV12HPZ/v2AOQj0xBeczlVqgPt5EgQU4kJ7bdqj0i50
 FUl+s4O5Wfs+JHGMoXlD5g4tGZcAKMBactWo0J/ZCeSu+Gv81onRWEtXZuPzgfMT2kmm
 0WRdClyTTJ4uZgbGThntpkaNVbhX0iPNAY56bieNDl+lBdezSItf5IQLbObcvOP1NJEF
 FQJtwB1ZTpc4AFc+YVKPot2pKktq76ItoofJCfQrP5wx0a5n6bH8GiVzd9UFFdmUZ8Xm
 pWuQ==
X-Gm-Message-State: AOAM531x15cNp7abnNlx2IcoiaZSJHluNNFmp7zoPm9jaMzNnk2XDVEx
 0hsMgNaCPoDMIpQOVJ/09yySK2I3T5nJ/oZQPt7pwiQeODTDWAS7
X-Google-Smtp-Source: ABdhPJxzKkbt/NUvuf9WNcr8lgvDa/JE2GJvMZ44y6GOSRVaUl+j24fDDzOvzvOgdnFiYy01ThL4Xpv+/yhiJwKJKR8=
X-Received: by 2002:a17:906:7ca:: with SMTP id
 m10mr694837ejc.257.1612315273839; 
 Tue, 02 Feb 2021 17:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
In-Reply-To: <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Tue, 2 Feb 2021 17:20:38 -0800
Message-ID: <CABjik9fqNkHNSx=5=8ETxh4+An5U+zAi57p9k8QZnHgvnGB-Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1893450372=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1893450372==
Content-Type: multipart/alternative; boundary="00000000000029da6f05ba6467a9"

--00000000000029da6f05ba6467a9
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 4:57 PM Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> On Tue, 2 Feb 2021 at 23:25, James Park <james.park@lagfreegames.com>
> wrote:
> >
> > On Tue, Feb 2, 2021 at 2:47 PM Emil Velikov <emil.l.velikov@gmail.com>
> wrote:
> > >
> > > Currently, the drm_fourcc.h header depends on drm.h for __u32 and
> __u64.
> > > At the same time drm.h pulls a lot of unneeded symbols.
> > >
> > > Add new guard DRM_FOURCC_STANDALONE, which when set will use local
> > > declaration of said symbols.
> > >
> > > When used on linux - this is a trivial but only when building in
> strict c99
> > > mode. One is welcome to ignore the warning, silence it or use c11. If
> neither
> > > of the three is an option, then do _not_  set the new guard.
> > >
> > > Cc: James Park <james.park@lagfreegames.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > ---
> > > As mentioned before - there's little point in having yet another header
> > > since keeping those in sync has been a PITA in the past.
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > > index 6f0628eb13a6..c1522902f6c9 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -24,7 +24,26 @@
> > >  #ifndef DRM_FOURCC_H
> > >  #define DRM_FOURCC_H
> > >
> > > +/*
> > > + * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do
> not want
> > > + * to pull drm.h into your application.
> > > + */
> > > +#ifdef DRM_FOURCC_STANDALONE
> > > +#if defined(__linux__)
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#else /* One of the BSDs */
> > > +
> > > +#include <stdint.h>
> > > +typedef uint32_t __u32;
> > > +typedef uint64_t __u64;
> > > +
> > > +#endif /* __linux __ */
> > > +
> > > +#else
> > >  #include "drm.h"
> > > +#endif /* DRM_FOURCC_STANDALONE */
> > >
> > >  #if defined(__cplusplus)
> > >  extern "C" {
> > > --
> > > 2.30.0
> > >
> >
> > One of my earlier solutions similarly would have forced people to deal
> > with duplicate typedefs, and we arrived at the current solution
> > because we didn't want to burden anyone with that.
>
> As summed in the commit message the burden is only applicable when all
> of the following are set:
>  - non-linux
>  - force DRM_FOURCC_STANDALONE
>  - c99 -pedantic
>
> Even then, we're talking about a compilation warning. So yeah - let's
> keep things short and sweet.
>
> Side note: AFAICT MSVC will not trigger a warning so your logs should be
> clean.
>
> -Emil
>

I'm having trouble reading your commit message, this sentence in
particular: "When used on linux - this is a trivial but only when building
in strict c99 mode."

This asymmetric copy/paste grosses me out so much. I don't think a patch
like this should be opinionated about someone's build settings. Am I alone?
Doesn't this bother anyone else?

- James

--00000000000029da6f05ba6467a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 4:57 PM Emil Velikov &=
lt;<a href=3D"mailto:emil.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, 2 Feb 2021 at 23:25, James Park &lt;<a href=3D"mailto:james.park@lagfre=
egames.com" target=3D"_blank">james.park@lagfreegames.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Tue, Feb 2, 2021 at 2:47 PM Emil Velikov &lt;<a href=3D"mailto:emil=
.l.velikov@gmail.com" target=3D"_blank">emil.l.velikov@gmail.com</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; Currently, the drm_fourcc.h header depends on drm.h for __u32 and=
 __u64.<br>
&gt; &gt; At the same time drm.h pulls a lot of unneeded symbols.<br>
&gt; &gt;<br>
&gt; &gt; Add new guard DRM_FOURCC_STANDALONE, which when set will use loca=
l<br>
&gt; &gt; declaration of said symbols.<br>
&gt; &gt;<br>
&gt; &gt; When used on linux - this is a trivial but only when building in =
strict c99<br>
&gt; &gt; mode. One is welcome to ignore the warning, silence it or use c11=
. If neither<br>
&gt; &gt; of the three is an option, then do _not_=C2=A0 set the new guard.=
<br>
&gt; &gt;<br>
&gt; &gt; Cc: James Park &lt;<a href=3D"mailto:james.park@lagfreegames.com"=
 target=3D"_blank">james.park@lagfreegames.com</a>&gt;<br>
&gt; &gt; Cc: Pekka Paalanen &lt;<a href=3D"mailto:pekka.paalanen@collabora=
.com" target=3D"_blank">pekka.paalanen@collabora.com</a>&gt;<br>
&gt; &gt; Cc: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=
=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; &gt; Signed-off-by: Emil Velikov &lt;<a href=3D"mailto:emil.l.velikov@=
gmail.com" target=3D"_blank">emil.l.velikov@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; As mentioned before - there&#39;s little point in having yet anot=
her header<br>
&gt; &gt; since keeping those in sync has been a PITA in the past.<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 19 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm=
_fourcc.h<br>
&gt; &gt; index 6f0628eb13a6..c1522902f6c9 100644<br>
&gt; &gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; @@ -24,7 +24,26 @@<br>
&gt; &gt;=C2=A0 #ifndef DRM_FOURCC_H<br>
&gt; &gt;=C2=A0 #define DRM_FOURCC_H<br>
&gt; &gt;<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Define DRM_FOURCC_STANDALONE you&#39;re interested only FOURC=
C and do not want<br>
&gt; &gt; + * to pull drm.h into your application.<br>
&gt; &gt; + */<br>
&gt; &gt; +#ifdef DRM_FOURCC_STANDALONE<br>
&gt; &gt; +#if defined(__linux__)<br>
&gt; &gt; +<br>
&gt; &gt; +#include &lt;linux/types.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +#else /* One of the BSDs */<br>
&gt; &gt; +<br>
&gt; &gt; +#include &lt;stdint.h&gt;<br>
&gt; &gt; +typedef uint32_t __u32;<br>
&gt; &gt; +typedef uint64_t __u64;<br>
&gt; &gt; +<br>
&gt; &gt; +#endif /* __linux __ */<br>
&gt; &gt; +<br>
&gt; &gt; +#else<br>
&gt; &gt;=C2=A0 #include &quot;drm.h&quot;<br>
&gt; &gt; +#endif /* DRM_FOURCC_STANDALONE */<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #if defined(__cplusplus)<br>
&gt; &gt;=C2=A0 extern &quot;C&quot; {<br>
&gt; &gt; --<br>
&gt; &gt; 2.30.0<br>
&gt; &gt;<br>
&gt;<br>
&gt; One of my earlier solutions similarly would have forced people to deal=
<br>
&gt; with duplicate typedefs, and we arrived at the current solution<br>
&gt; because we didn&#39;t want to burden anyone with that.<br>
<br>
As summed in the commit message the burden is only applicable when all<br>
of the following are set:<br>
=C2=A0- non-linux<br>
=C2=A0- force DRM_FOURCC_STANDALONE<br>
=C2=A0- c99 -pedantic<br>
<br>
Even then, we&#39;re talking about a compilation warning. So yeah - let&#39=
;s<br>
keep things short and sweet.<br>
<br>
Side note: AFAICT MSVC will not trigger a warning so your logs should be cl=
ean.<br>
<br>
-Emil<br></blockquote><div><br></div><div>I&#39;m having trouble reading yo=
ur commit message, this sentence in particular: &quot;When used on linux - =
this is a trivial but only when building in strict c99 mode.&quot;</div><di=
v><br></div><div>

This asymmetric copy/paste grosses me out so much. I don&#39;t think a patc=
h like this should be opinionated about someone&#39;s build settings. Am I =
alone? Doesn&#39;t this bother anyone else?</div><div><br></div><div>- Jame=
s</div></div></div>

--00000000000029da6f05ba6467a9--

--===============1893450372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1893450372==--
