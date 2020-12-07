Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C02D25FE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4611F6E967;
	Tue,  8 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3116C89E65
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:55:15 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k4so13063687edl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 01:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvdMqxn7yL/A7V5dvnEDd5EKgj0lGu3DNOMJNz4ISG0=;
 b=XAJjPG5269F62tDKO4zPaH6P9/mziDbLz8W0JGFVwyofN1aht2zZSsLpx9JkIi/Uju
 GvERJbSZByTIza8dgtvknR7F2RxtaAOHn9f2ZeI/ZIcO85aBpm2ehrMQVWM4Cd4MYEsH
 4a282AhWKOmpVsKlVi9FFV05OxmoRVcN9G88yz3DAtcH7euNkz4TpOWq7cOzIZBWkSB5
 Bb1j/9aGW+Ux38gWsVo1PIcCxU0QiMpWNOEP0rNAoNazfA9O+RLIy9a3ChBNX5nw+AJE
 qZxCwiCd2aswXO5G0nJF+ovy35JQyjYH3eapT8Rb5CP8VmWHdlb1aiLElv2VPOT8Zd4m
 LjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvdMqxn7yL/A7V5dvnEDd5EKgj0lGu3DNOMJNz4ISG0=;
 b=qQUJAZs4xYJ/vrO1FH+ePUdQ8YOB8bzKr7EafmMBXVQwl29sTclf3OSm6MembxcoTg
 RMy9yIRSkkzFtoPBlIklBnsWHWw5CReSdZ3+qRXbp5nmTYNk8ejbxn+TWTOL6fuY1gvA
 bT3Iia6HnoChRP9rR1J956AJ2cASeIMiub8ttKpBUBd63EtuvZz7JxKNynpt0HJMxrjM
 P/sOMvH0o+7x8pyMc/DWqqNbo1RKzy9pITgWhGq7OhepsCG8huG6BpgdRNja99uWjRyJ
 hEOAXfY82DnPde9V4BbfTrcCCty4Ze9KLASBVgyfcgKlci/q1FUFQr3XI7EO8tli5F0Q
 AxJQ==
X-Gm-Message-State: AOAM532xVvWo41DbDn4n5JVosIzm3WgxiwIKQeedLlPYYXQNQWZd33pN
 v7I9HKldzwvUmUDQ49Gkk5r2hfv6ZuEdKLqeZ4SkIQ==
X-Google-Smtp-Source: ABdhPJwt/HZpmOT9/95L/EFDiiw5W16F1ogb7pYAs12pbtXd4OnalyUpgwgUFA8eaOKZdf4ytEXd+7HZevxpe+zscbk=
X-Received: by 2002:a05:6402:143a:: with SMTP id
 c26mr18452233edx.131.1607334913724; 
 Mon, 07 Dec 2020 01:55:13 -0800 (PST)
MIME-Version: 1.0
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
 <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
 <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
In-Reply-To: <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 01:55:00 -0800
Message-ID: <CABjik9dC26tm0KzOc4SqWm-f-LW=+JbzZQuOR1fZJdZXowHaVw@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============1004013377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1004013377==
Content-Type: multipart/alternative; boundary="0000000000009165d205b5dcd25a"

--0000000000009165d205b5dcd25a
Content-Type: text/plain; charset="UTF-8"

I'd noticed the #if could be combined, but they weren't in drm,h when they
could have been, so I didn't want to depart from the existing pattern.

I think "One of the BSDs" is more informative than "Not Linux" if that
statement is still true. Given the aversion to making drm.h robust to
Windows, I don't think we want to imply compatibility that isn't there.

Thanks,
James

On Mon, Dec 7, 2020 at 1:45 AM Simon Ser <contact@emersion.fr> wrote:

> On Sunday, December 6th, 2020 at 1:39 AM, James Park <
> jpark37@lagfreegames.com> wrote:
>
> > Create drm_basic_types.h to define types previously defined by drm.h.
> >
> > Use DRM_FOURCC_STANDALONE to include drm_fourcc.h, replacing drm.h
> > dependency with drm_basic_types.h.
>
> This approach looks better to me than the other alternatives.
>
> > This will allow Mesa to port code to Windows more easily.
> >
> > Signed-off-by: James Park <jpark37@lagfreegames.com>
> > ---
> >  include/uapi/drm/drm.h             | 14 ++--------
> >  include/uapi/drm/drm_basic_types.h | 52
> ++++++++++++++++++++++++++++++++++++++
> >  include/uapi/drm/drm_fourcc.h      |  4 +++
> >  3 files changed, 58 insertions(+), 12 deletions(-)
> >  create mode 100644 include/uapi/drm/drm_basic_types.h
> >
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 808b48a..a7f38fc 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -36,32 +36,22 @@
> >  #ifndef _DRM_H_
> >  #define _DRM_H_
> >
> > +#include "drm_basic_types.h"
> > +
> >  #if defined(__KERNEL__)
> >
> > -#include <linux/types.h>
> >  #include <asm/ioctl.h>
> >  typedef unsigned int drm_handle_t;
> >
> >  #elif defined(__linux__)
> >
> > -#include <linux/types.h>
> >  #include <asm/ioctl.h>
> >  typedef unsigned int drm_handle_t;
> >
> >  #else /* One of the BSDs */
> >
> > -#include <stdint.h>
> >  #include <sys/ioccom.h>
> >  #include <sys/types.h>
> > -typedef int8_t   __s8;
> > -typedef uint8_t  __u8;
> > -typedef int16_t  __s16;
> > -typedef uint16_t __u16;
> > -typedef int32_t  __s32;
> > -typedef uint32_t __u32;
> > -typedef int64_t  __s64;
> > -typedef uint64_t __u64;
> > -typedef size_t   __kernel_size_t;
> >  typedef unsigned long drm_handle_t;
> >
> >  #endif
> > diff --git a/include/uapi/drm/drm_basic_types.h
> b/include/uapi/drm/drm_basic_types.h
> > new file mode 100644
> > index 0000000..b3c00bb
> > --- /dev/null
> > +++ b/include/uapi/drm/drm_basic_types.h
> > @@ -0,0 +1,52 @@
> > +/*
> > + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> > + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> > + * All rights reserved.
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a
> > + * copy of this software and associated documentation files (the
> "Software"),
> > + * to deal in the Software without restriction, including without
> limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the
> next
> > + * paragraph) shall be included in all copies or substantial portions
> of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> > + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef _DRM_BASIC_TYPES_H_
> > +#define _DRM_BASIC_TYPES_H_
> > +
> > +#if defined(__KERNEL__)
> > +
> > +#include <linux/types.h>
> > +
> > +#elif defined(__linux__)
>
> Nit: these two #ifs can be combined together.
>
> > +#include <linux/types.h>
> > +
> > +#else /* One of the BSDs */
>
> Maybe replace with /* Not Linux */?
>
> > +#include <stdint.h>
> > +typedef int8_t   __s8;
> > +typedef uint8_t  __u8;
> > +typedef int16_t  __s16;
> > +typedef uint16_t __u16;
> > +typedef int32_t  __s32;
> > +typedef uint32_t __u32;
> > +typedef int64_t  __s64;
> > +typedef uint64_t __u64;
> > +typedef size_t   __kernel_size_t;
> > +
> > +#endif
> > +
> > +#endif
> > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > index 82f3278..5eb07a5 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -24,7 +24,11 @@
> >  #ifndef DRM_FOURCC_H
> >  #define DRM_FOURCC_H
> >
> > +#ifdef DRM_FOURCC_STANDALONE
> > +#include "drm_basic_types.h"
> > +#else
> >  #include "drm.h"
> > +#endif
> >
> >  #if defined(__cplusplus)
> >  extern "C" {
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000009165d205b5dcd25a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d noticed the #if could be combined, but they weren&=
#39;t in drm,h when they could have been, so I didn&#39;t want to depart fr=
om the existing pattern.<div><br></div><div>I think &quot;One of the BSDs&q=
uot; is more informative than &quot;Not Linux&quot; if that statement is st=
ill true. Given the aversion to making drm.h robust to Windows, I don&#39;t=
 think we want to imply compatibility that isn&#39;t there.</div><div><br><=
/div><div>Thanks,</div><div>James</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 7, 2020 at 1:45 AM Simon=
 Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sunda=
y, December 6th, 2020 at 1:39 AM, James Park &lt;<a href=3D"mailto:jpark37@=
lagfreegames.com" target=3D"_blank">jpark37@lagfreegames.com</a>&gt; wrote:=
<br>
<br>
&gt; Create drm_basic_types.h to define types previously defined by drm.h.<=
br>
&gt;<br>
&gt; Use DRM_FOURCC_STANDALONE to include drm_fourcc.h, replacing drm.h<br>
&gt; dependency with drm_basic_types.h.<br>
<br>
This approach looks better to me than the other alternatives.<br>
<br>
&gt; This will allow Mesa to port code to Windows more easily.<br>
&gt;<br>
&gt; Signed-off-by: James Park &lt;<a href=3D"mailto:jpark37@lagfreegames.c=
om" target=3D"_blank">jpark37@lagfreegames.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 14 ++--------<br>
&gt;=C2=A0 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<=
br>
&gt;=C2=A0 3 files changed, 58 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 create mode 100644 include/uapi/drm/drm_basic_types.h<br>
&gt;<br>
&gt; diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
&gt; index 808b48a..a7f38fc 100644<br>
&gt; --- a/include/uapi/drm/drm.h<br>
&gt; +++ b/include/uapi/drm/drm.h<br>
&gt; @@ -36,32 +36,22 @@<br>
&gt;=C2=A0 #ifndef _DRM_H_<br>
&gt;=C2=A0 #define _DRM_H_<br>
&gt;<br>
&gt; +#include &quot;drm_basic_types.h&quot;<br>
&gt; +<br>
&gt;=C2=A0 #if defined(__KERNEL__)<br>
&gt;<br>
&gt; -#include &lt;linux/types.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/ioctl.h&gt;<br>
&gt;=C2=A0 typedef unsigned int drm_handle_t;<br>
&gt;<br>
&gt;=C2=A0 #elif defined(__linux__)<br>
&gt;<br>
&gt; -#include &lt;linux/types.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/ioctl.h&gt;<br>
&gt;=C2=A0 typedef unsigned int drm_handle_t;<br>
&gt;<br>
&gt;=C2=A0 #else /* One of the BSDs */<br>
&gt;<br>
&gt; -#include &lt;stdint.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/ioccom.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/types.h&gt;<br>
&gt; -typedef int8_t=C2=A0 =C2=A0__s8;<br>
&gt; -typedef uint8_t=C2=A0 __u8;<br>
&gt; -typedef int16_t=C2=A0 __s16;<br>
&gt; -typedef uint16_t __u16;<br>
&gt; -typedef int32_t=C2=A0 __s32;<br>
&gt; -typedef uint32_t __u32;<br>
&gt; -typedef int64_t=C2=A0 __s64;<br>
&gt; -typedef uint64_t __u64;<br>
&gt; -typedef size_t=C2=A0 =C2=A0__kernel_size_t;<br>
&gt;=C2=A0 typedef unsigned long drm_handle_t;<br>
&gt;<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/include/uapi/drm/drm_basic_types.h b/include/uapi/drm/drm=
_basic_types.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b3c00bb<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/uapi/drm/drm_basic_types.h<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +/*<br>
&gt; + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.<br>
&gt; + * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.<br>
&gt; + * All rights reserved.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice (including t=
he next<br>
&gt; + * paragraph) shall be included in all copies or substantial portions=
 of the<br>
&gt; + * Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO =
EVENT SHALL<br>
&gt; + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR<br>
&gt; + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; + * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _DRM_BASIC_TYPES_H_<br>
&gt; +#define _DRM_BASIC_TYPES_H_<br>
&gt; +<br>
&gt; +#if defined(__KERNEL__)<br>
&gt; +<br>
&gt; +#include &lt;linux/types.h&gt;<br>
&gt; +<br>
&gt; +#elif defined(__linux__)<br>
<br>
Nit: these two #ifs can be combined together.<br>
<br>
&gt; +#include &lt;linux/types.h&gt;<br>
&gt; +<br>
&gt; +#else /* One of the BSDs */<br>
<br>
Maybe replace with /* Not Linux */?<br>
<br>
&gt; +#include &lt;stdint.h&gt;<br>
&gt; +typedef int8_t=C2=A0 =C2=A0__s8;<br>
&gt; +typedef uint8_t=C2=A0 __u8;<br>
&gt; +typedef int16_t=C2=A0 __s16;<br>
&gt; +typedef uint16_t __u16;<br>
&gt; +typedef int32_t=C2=A0 __s32;<br>
&gt; +typedef uint32_t __u32;<br>
&gt; +typedef int64_t=C2=A0 __s64;<br>
&gt; +typedef uint64_t __u64;<br>
&gt; +typedef size_t=C2=A0 =C2=A0__kernel_size_t;<br>
&gt; +<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h<br>
&gt; index 82f3278..5eb07a5 100644<br>
&gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; @@ -24,7 +24,11 @@<br>
&gt;=C2=A0 #ifndef DRM_FOURCC_H<br>
&gt;=C2=A0 #define DRM_FOURCC_H<br>
&gt;<br>
&gt; +#ifdef DRM_FOURCC_STANDALONE<br>
&gt; +#include &quot;drm_basic_types.h&quot;<br>
&gt; +#else<br>
&gt;=C2=A0 #include &quot;drm.h&quot;<br>
&gt; +#endif<br>
&gt;<br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 extern &quot;C&quot; {<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div>

--0000000000009165d205b5dcd25a--

--===============1004013377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1004013377==--
