Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44682D262C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832CB6E9AB;
	Tue,  8 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95766E93B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 01:08:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b73so15794641edf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWGzXnUvtPLZa2NT52BD9/ZoMYu2Cd8Chbn51HuZ19A=;
 b=JVCA5R8hFiNupjUpiuACFwWqNjlJnPwAJjDcVrTFW8LrQ2bAX1oyyOEgDJwvvRww7q
 8yWi1oMyIulD4Lq6YYeaIHl624jrHkoA7LjC1rNy2lM5m8Km0bgLvSxMaU9afL9jy5rD
 lqaEz9UiM/Hc/ZG20i0MLsJV2rxWb+amjdvjlIzgHgKAvJzNumedJEScSVmKNIk9cCgd
 BhkajA+fOpmCSxBQcs71ATzy4UIsCW055RkfHDAtOPoolZQUS/MKhFzdNpJzRRcAJ1sq
 GFpk9rTKC0+AfxRsQCHq7lQHxdorM9NyDJeXGntsZ5Xzc5OAyZSSS47tRqcrcIPqrefE
 Me1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWGzXnUvtPLZa2NT52BD9/ZoMYu2Cd8Chbn51HuZ19A=;
 b=Oxf91dceWmdFxjqjbIvov+HTuUw/oaOvIPwhoaqK7hulwxJVWDiI+W0ft/3inBzqFh
 F0S0WQAlt9qARTSmHSQKHnfiYW1zM68V/WlwMLPVj/biaeiSELXySh/80F8q8vBPbFnD
 EP2oo4tHydBN8qYaj2YcP07iyxp/4mTVXBhzCSfl+bpUbwBvcTeU9UIJeVqLM+ZejCI4
 eu5JQy71tI6nFSRaNAn2rtbGNIA3UzZSWSsZYL/F4NszqfvTXpJibqZftChwZivfjB8w
 T6k247bzoHK2+rbdb/Blx60SzDCuzbVKp/w6KL0+xkRv3EQ3Oo1V0gvmU1ZknXv1CPMQ
 tiLw==
X-Gm-Message-State: AOAM532YgVAKsJbHLAuQLcgEo0hqXo49tqYWHwlQsImgzlARwy/5LO3C
 iageI9pRLN9RNvwTVYmt3KBGxN1L6Z8U1XLU22QWUQ==
X-Google-Smtp-Source: ABdhPJw4OAeU9lKQ5z8QJBRa4uLgYvqpCEw6VufPlb+pkR4grx/b45Z+44ObEA107prcMtiq3nYA4E2uqsf9aV60GEo=
X-Received: by 2002:a05:6402:143a:: with SMTP id
 c26mr21803286edx.131.1607389716360; 
 Mon, 07 Dec 2020 17:08:36 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
 <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
 <CE57r-xvcKbKT0LCtCjasef7m8hy4jgYOsQ5_ntH16VGrzEFksPwVs2wL-gBdWHAhYrIDhXF2WmNIHvGd3bWhkqtUJvAakLI7vcgForuxM4=@emersion.fr>
 <20201207131401.3cf41501@eldfell>
In-Reply-To: <20201207131401.3cf41501@eldfell>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 17:08:23 -0800
Message-ID: <CABjik9fzC1gapjz7usrBM0jR0KDq_7wpMxMAvEm1OtmpjYO93g@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Pekka Paalanen <ppaalanen@gmail.com>
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============0483722413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0483722413==
Content-Type: multipart/alternative; boundary="0000000000000f4cee05b5e99567"

--0000000000000f4cee05b5e99567
Content-Type: text/plain; charset="UTF-8"

I updated the patch earlier today incorporating the suggestions. I also had
to bring back "#include <linux/types.h>" to drm.h because there's some
sanity check that fails, as if it doesn't scan past the first level of
#includes..

- James

On Mon, Dec 7, 2020 at 3:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 07 Dec 2020 10:53:49 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > On Monday, December 7th, 2020 at 11:49 AM, James Park <
> james.park@lagfreegames.com> wrote:
> >
> > > That would work, but that's kind of an annoying requirement. I would
> > > prefer the header to be self-sufficient.
> >
> > I don't want to make it more confusing than before, but here Pekka (I
> > think) suggests to replace this:
> >
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
> >
> > With this:
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > index 82f3278..5eb07a5 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -24,7 +24,11 @@
> >  #ifndef DRM_FOURCC_H
> >  #define DRM_FOURCC_H
> >
> > +#include "drm_basic_types.h"
> > +
> > +#ifndef DRM_FOURCC_STANDALONE
> >  #include "drm.h"
> > +#endif
> >
> >  #if defined(__cplusplus)
> >  extern "C" {
> >
> > That wouldn't change whether the header is self-sufficient or not,
> > would it?
>
> Exactly this.
>
> This communicates properly that DRM_FOURCC_STANDALONE only affects
> whether drm.h gets pulled in or not, and there are no other effects.
>
> This also makes testing better: when you unconditionally include
> drm_basic_types.h, you are more likely to catch breakage there.
>
> For functionality, it makes no difference. Whether userspace does
>
> #include "drm.h"
> #define DRM_FOURCC_STANDALONE
> #include "drm_fourcc.h"
>
> or
>
> #define DRM_FOURCC_STANDALONE
> #include "drm_fourcc.h"
> #include "drm.h"
>
> the result must always be good.
>
>
> Thanks,
> pq
>

--0000000000000f4cee05b5e99567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I updated the patch=C2=A0earlier today incorporating the s=
uggestions. I also had to bring back &quot;#include &lt;linux/types.h&gt;&q=
uot; to drm.h because there&#39;s some sanity check that fails,=C2=A0as if =
it doesn&#39;t=C2=A0scan past the first level of #includes..<div><br></div>=
<div>- James</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Dec 7, 2020 at 3:14 AM Pekka Paalanen &lt;<a href=
=3D"mailto:ppaalanen@gmail.com">ppaalanen@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 07 Dec 2020 10:5=
3:49 +0000<br>
Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=3D"_blank">cont=
act@emersion.fr</a>&gt; wrote:<br>
<br>
&gt; On Monday, December 7th, 2020 at 11:49 AM, James Park &lt;<a href=3D"m=
ailto:james.park@lagfreegames.com" target=3D"_blank">james.park@lagfreegame=
s.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; That would work, but that&#39;s kind of an annoying requirement. =
I would<br>
&gt; &gt; prefer the header to be self-sufficient.=C2=A0 <br>
&gt; <br>
&gt; I don&#39;t want to make it more confusing than before, but here Pekka=
 (I<br>
&gt; think) suggests to replace this:<br>
&gt; <br>
&gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h<br>
&gt; index 82f3278..5eb07a5 100644<br>
&gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; @@ -24,7 +24,11 @@<br>
&gt;=C2=A0 #ifndef DRM_FOURCC_H<br>
&gt;=C2=A0 #define DRM_FOURCC_H<br>
&gt; <br>
&gt; +#ifdef DRM_FOURCC_STANDALONE<br>
&gt; +#include &quot;drm_basic_types.h&quot;<br>
&gt; +#else<br>
&gt;=C2=A0 #include &quot;drm.h&quot;<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 extern &quot;C&quot; {<br>
&gt; <br>
&gt; With this:<br>
&gt; <br>
&gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h<br>
&gt; index 82f3278..5eb07a5 100644<br>
&gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; @@ -24,7 +24,11 @@<br>
&gt;=C2=A0 #ifndef DRM_FOURCC_H<br>
&gt;=C2=A0 #define DRM_FOURCC_H<br>
&gt; <br>
&gt; +#include &quot;drm_basic_types.h&quot;<br>
&gt; +<br>
&gt; +#ifndef DRM_FOURCC_STANDALONE<br>
&gt;=C2=A0 #include &quot;drm.h&quot;<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 extern &quot;C&quot; {<br>
&gt; <br>
&gt; That wouldn&#39;t change whether the header is self-sufficient or not,=
<br>
&gt; would it?<br>
<br>
Exactly this.<br>
<br>
This communicates properly that DRM_FOURCC_STANDALONE only affects<br>
whether drm.h gets pulled in or not, and there are no other effects.<br>
<br>
This also makes testing better: when you unconditionally include<br>
drm_basic_types.h, you are more likely to catch breakage there.<br>
<br>
For functionality, it makes no difference. Whether userspace does<br>
<br>
#include &quot;drm.h&quot;<br>
#define DRM_FOURCC_STANDALONE<br>
#include &quot;drm_fourcc.h&quot;<br>
<br>
or<br>
<br>
#define DRM_FOURCC_STANDALONE<br>
#include &quot;drm_fourcc.h&quot;<br>
#include &quot;drm.h&quot;<br>
<br>
the result must always be good.<br>
<br>
<br>
Thanks,<br>
pq<br>
</blockquote></div>

--0000000000000f4cee05b5e99567--

--===============0483722413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0483722413==--
