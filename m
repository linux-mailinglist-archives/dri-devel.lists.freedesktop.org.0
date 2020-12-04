Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697D2D0C4D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BF26E5A4;
	Mon,  7 Dec 2020 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4F6E1F5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 19:08:31 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u7so151628vsg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 11:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kMNE1PjIen18YevrXlL+hQbXlGbOV2XWkhhcd2jGQE=;
 b=NCmRpDrN3e7hm9vAWrIQiZcI7qRPf5bfip0Jdyr2j1OdZtFf9d0icdSks9R7C5I1ze
 UjS9vhmUT4+wIuwDEDT2OEnurSQBZ+MZl13M/JNuNVUwUrUptesKYYNcgr4XyNymtF4+
 4wLFUzbd/A5YO/nqnP37g2bdp400/IdUv6xc6U2Z5ruCEySKXOKAn+IJ9kZQ0uXEZNVa
 XGOKY+6u41s1pfi4gDFekjk9AuxjtVroUa6EsBccL3/fUTr0KhLM+KKyVsLXWfy3s96c
 5pR/OE1HPqmtEx0OQvHn7JeotyFiLNrrYl4MF5WHAp2cZo7VeD5UX3XsBASlCyxMO7X4
 eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kMNE1PjIen18YevrXlL+hQbXlGbOV2XWkhhcd2jGQE=;
 b=C5e0Ge9KTkSQeIx0NMT12CTulc7/0lo53NYxPHUZkp8Iew5PTJkjFfmG6EKBbfTE81
 5sZUPGMaTP5RtysCGvW5W0x/jC/oTAs8zNhdb6WI80pWw0JanoXiSXW6PnOhr9GP5J9o
 1EV3LPAjDehlyY9DaHlHxcK+wDCuWJ3dP5PEBrSyeYjh7daRH3ckLu+7Fmknw5EY69Ez
 Jn+HlkAwvVGsValKKqz6asAvX/GEZV5d3/q+depHn1jyS3/K9nuehzGTC9uIQ4L2ZsbZ
 BdWiRqSPfCiJulT5Bvef9iv0AVDTMQ/xNlgMZbL0jLxusFeThuEeHYqz2nL0DfCec0Kc
 uOWw==
X-Gm-Message-State: AOAM5307ULhcJirSstSgKGGu+CIi5L4B9C0GTCe6YX1u90dMLaekwWXt
 habwZ2raDBOTnxGhT5+ZhGQdBHSPUPgoGrEDnQD2CQ==
X-Google-Smtp-Source: ABdhPJxEvG7X5hUHHvFD0h0HE9+OLWH367ZKbqiIpB0mxMWnftJBNsiKH+LuKLTAZJnfzQanGZIjA+pGtQuEKNbfu0k=
X-Received: by 2002:a05:6102:9c2:: with SMTP id
 g2mr5341368vsi.35.1607108910365; 
 Fri, 04 Dec 2020 11:08:30 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
In-Reply-To: <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Fri, 4 Dec 2020 11:07:41 -0800
Message-ID: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============0239036460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0239036460==
Content-Type: multipart/alternative; boundary="000000000000b7d45505b5a83332"

--000000000000b7d45505b5a83332
Content-Type: text/plain; charset="UTF-8"

I could adjust the block to look like this:

#ifdef DRM_FOURCC_STANDALONE
#if defined(__linux__)
#include <linux/types.h>
#else
#include <stdint.h>
typedef uint32_t __u32;
typedef uint64_t __u64;
#endif
#else
#include "drm.h"
#endif

Alternatively, I could create a new common header to be included from both
drm.h and drm_fourcc.h, drm_base_types.h or something like that:

#ifdef DRM_FOURCC_STANDALONE
#include "drm_base_types.h"
#else
#include "drm.h"
#endif

On Fri, Dec 4, 2020 at 7:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 3 Dec 2020 21:45:14 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Thu, Dec 3, 2020 at 7:55 PM James Park <james.park@lagfreegames.com>
> wrote:
> > > >
> > > > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > > > intentional, right? Should I put all the integer types, or just the
> > > > ones that are used in that file?
> > >
> > > Yeah that trailing _ just slipped in. And I'd just do the types
> > > already used. I don't think anything else than __u32 (for drm fourcc)
> > > and __u64 (for drm modifier) is needed.
> >
> > Hi,
> >
> > can that create conflicts if userspace first includes drm_fourcc.h and
> > then drm.h?
> >
> > I would find it natural to userspace have generic headers including
> > drm_fourcc.h and then DRM-specific C-files including drm.h as well
> > (through libdrm headers). I think Weston might already do this.
> >
> > The generic userspace (weston) header would obviously #define
> > DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as well.
>
> Hm yes that would break. I guess we could just include the linux types
> header for this. And I guess on windows you'd need to have that from
> somewhere. Or we just require that users of the standalone header pull
> the right header or defines in first?
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000b7d45505b5a83332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I could adjust the block to look like this:<div><br></div>=
<div>#ifdef DRM_FOURCC_STANDALONE<br>#if defined(__linux__)<br>#include &lt=
;linux/types.h&gt;<br>#else<br>#include &lt;stdint.h&gt;<br>typedef uint32_=
t __u32;<br>typedef uint64_t __u64;<br>#endif<br>#else<br>#include &quot;dr=
m.h&quot;<br>#endif<br></div><div><br></div><div>Alternatively, I could cre=
ate a new common header to be included from both drm.h and drm_fourcc.h, dr=
m_base_types.h or something like that:</div><div><br></div><div>#ifdef DRM_=
FOURCC_STANDALONE<br>#include &quot;drm_base_types.h&quot;<br>#else<br>#inc=
lude &quot;drm.h&quot;<br>#endif</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 7:58 AM Daniel=
 Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Dec 4=
, 2020 at 9:12 AM Pekka Paalanen &lt;<a href=3D"mailto:ppaalanen@gmail.com"=
 target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 3 Dec 2020 21:45:14 +0100<br>
&gt; Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank"=
>daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, Dec 3, 2020 at 7:55 PM James Park &lt;<a href=3D"mailto:j=
ames.park@lagfreegames.com" target=3D"_blank">james.park@lagfreegames.com</=
a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The trailing underscore for=C2=A0 DRM_FOURCC_STANDALONE_ isn=
&#39;t<br>
&gt; &gt; &gt; intentional, right? Should I put all the integer types, or j=
ust the<br>
&gt; &gt; &gt; ones that are used in that file?<br>
&gt; &gt;<br>
&gt; &gt; Yeah that trailing _ just slipped in. And I&#39;d just do the typ=
es<br>
&gt; &gt; already used. I don&#39;t think anything else than __u32 (for drm=
 fourcc)<br>
&gt; &gt; and __u64 (for drm modifier) is needed.<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; can that create conflicts if userspace first includes drm_fourcc.h and=
<br>
&gt; then drm.h?<br>
&gt;<br>
&gt; I would find it natural to userspace have generic headers including<br=
>
&gt; drm_fourcc.h and then DRM-specific C-files including drm.h as well<br>
&gt; (through libdrm headers). I think Weston might already do this.<br>
&gt;<br>
&gt; The generic userspace (weston) header would obviously #define<br>
&gt; DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as well.<=
br>
<br>
Hm yes that would break. I guess we could just include the linux types<br>
header for this. And I guess on windows you&#39;d need to have that from<br=
>
somewhere. Or we just require that users of the standalone header pull<br>
the right header or defines in first?<br>
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000b7d45505b5a83332--

--===============0239036460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0239036460==--
