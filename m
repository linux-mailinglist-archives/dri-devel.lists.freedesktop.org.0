Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F42D25F9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB366E95B;
	Tue,  8 Dec 2020 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CECF89E26
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:09:53 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k4so12925588edl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 01:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkGPuF3AnU+rIV4nL9CIpLyDLs75o5UsxJlK2YK3PkQ=;
 b=WGMniTkZOge9lwF0fbpW+Y/jLV9ZIdoPXKcssv4ooEzl62lMyWGBtDnttYvOJ5hHeP
 YWZOwUXQauFZH5C94DveTbrCUGee3EdaXL4d/0O3PI9uLhDpL+NYZb/oB9afKoUhuz16
 sVC0seSq3qGhU3DO1jNru2JgKU5TcFC8kQdrhhiasETc9A9n093pkhs/LUAxjGQCH9mC
 mj+GhuoBldLWWyCXlNjJpeU4GQr+8se27bzs8mM8ABFxT2f/xCpURxulLdlGYWAzX+5T
 VEDlZhhuqtvRax3hcv+5xoCsQszSOhqEbyUJ5GAOcZEUlqrrNdInuI0cDgmj+z7jJHn1
 kSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkGPuF3AnU+rIV4nL9CIpLyDLs75o5UsxJlK2YK3PkQ=;
 b=kN4brIe84gdwiiuJMtxaCojVTmLCc3NkIaFhnRn29/fejlF6ona5fIHnp32aokjPf9
 84rU+3YRK9uE5FSP2tlTeNKNmJ62yt1yXJtXA3wyboKQTxWXoSyFtp67ddR2B77rgBwK
 WdpgIZVsEGNjksa1ZwjqSTP4fDUHxGwiFWy650V90M2hWdokER2Z+KxT6MsnV4n4Rmie
 5uI0FhQkhncWQGcKHW6mJuKK8vHZHu9JH1aCwf48D/EqdsqASmfcmK2NJ+rajlXhx9ch
 U6Hb5c8/WdnGN2A/ln2BMOIoe5UgTHAGI84+cwlw0OvT6B3nmmc45aCVUzRRrzmThizi
 ml6w==
X-Gm-Message-State: AOAM530x2aMuYoNUF9dwg2C0hovVW+RjnvkWaqc6kKavmr2GnGptXyNK
 BhZXW8AflhZj/4yKYKSb/u89a3rWcdy5lfXkMxCC0g==
X-Google-Smtp-Source: ABdhPJy5ShRSG9mtyitm/E6Z22TGS1tfIGBY+lKwCk4dwbBa8IxtT6Md9AZ3YJDVV/8gyYlyk//7s4VkuEkS4FlnU1A=
X-Received: by 2002:a50:85c6:: with SMTP id q6mr19643358edh.126.1607332192068; 
 Mon, 07 Dec 2020 01:09:52 -0800 (PST)
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
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
In-Reply-To: <20201207105109.599273be@eldfell>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 01:08:58 -0800
Message-ID: <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0821691003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0821691003==
Content-Type: multipart/alternative; boundary="000000000000583ca105b5dc301c"

--000000000000583ca105b5dc301c
Content-Type: text/plain; charset="UTF-8"

I'm not completely sure what you're saying, but doesn't drm_base_types.h
(now drm_basic_types.h) make things robust to header order? The patch is in
another email. You can also see it here:
https://github.com/jpark37/linux/commit/0cc8ae750bfd9eab7e31c7de6aa84f24682f4f18

Thanks,
James

On Mon, Dec 7, 2020 at 12:51 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 4 Dec 2020 11:07:41 -0800
> James Park <james.park@lagfreegames.com> wrote:
>
> > I could adjust the block to look like this:
> >
> > #ifdef DRM_FOURCC_STANDALONE
> > #if defined(__linux__)
> > #include <linux/types.h>
> > #else
> > #include <stdint.h>
> > typedef uint32_t __u32;
> > typedef uint64_t __u64;
> > #endif
> > #else
> > #include "drm.h"
> > #endif
> >
> > Alternatively, I could create a new common header to be included from
> both
> > drm.h and drm_fourcc.h, drm_base_types.h or something like that:
> >
> > #ifdef DRM_FOURCC_STANDALONE
> > #include "drm_base_types.h"
> > #else
> > #include "drm.h"
> > #endif
>
> Hi,
>
> my point is, any solution relying on DRM_FOURCC_STANDALONE will fail
> sometimes, because there is no reason why userspace would *not* #define
> DRM_FOURCC_STANDALONE. Hence, #ifdef DRM_FOURCC_STANDALONE is
> completely moot, you have to make the headers work in any include
> order when DRM_FOURCC_STANDALONE is defined anyway.
>
>
> Thanks.
> pq
>
> > On Fri, Dec 4, 2020 at 7:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen <ppaalanen@gmail.com>
> wrote:
> > > >
> > > > On Thu, 3 Dec 2020 21:45:14 +0100
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > > On Thu, Dec 3, 2020 at 7:55 PM James Park <
> james.park@lagfreegames.com>
> > > wrote:
> > > > > >
> > > > > > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > > > > > intentional, right? Should I put all the integer types, or just
> the
> > > > > > ones that are used in that file?
> > > > >
> > > > > Yeah that trailing _ just slipped in. And I'd just do the types
> > > > > already used. I don't think anything else than __u32 (for drm
> fourcc)
> > > > > and __u64 (for drm modifier) is needed.
> > > >
> > > > Hi,
> > > >
> > > > can that create conflicts if userspace first includes drm_fourcc.h
> and
> > > > then drm.h?
> > > >
> > > > I would find it natural to userspace have generic headers including
> > > > drm_fourcc.h and then DRM-specific C-files including drm.h as well
> > > > (through libdrm headers). I think Weston might already do this.
> > > >
> > > > The generic userspace (weston) header would obviously #define
> > > > DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as
> well.
> > >
> > > Hm yes that would break. I guess we could just include the linux types
> > > header for this. And I guess on windows you'd need to have that from
> > > somewhere. Or we just require that users of the standalone header pull
> > > the right header or defines in first?
> > > -Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > >
>
>

--000000000000583ca105b5dc301c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not completely sure what you&#39;re saying, but do=
esn&#39;t drm_base_types.h (now drm_basic_types.h) make things robust to he=
ader order? The patch is in another email. You can also see it here:=C2=A0<=
a href=3D"https://github.com/jpark37/linux/commit/0cc8ae750bfd9eab7e31c7de6=
aa84f24682f4f18">https://github.com/jpark37/linux/commit/0cc8ae750bfd9eab7e=
31c7de6aa84f24682f4f18</a><div><br></div><div>Thanks,</div><div>James</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Dec 7, 2020 at 12:51 AM Pekka Paalanen &lt;<a href=3D"mailto:ppaala=
nen@gmail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 4 Dec 2020 11:0=
7:41 -0800<br>
James Park &lt;<a href=3D"mailto:james.park@lagfreegames.com" target=3D"_bl=
ank">james.park@lagfreegames.com</a>&gt; wrote:<br>
<br>
&gt; I could adjust the block to look like this:<br>
&gt; <br>
&gt; #ifdef DRM_FOURCC_STANDALONE<br>
&gt; #if defined(__linux__)<br>
&gt; #include &lt;linux/types.h&gt;<br>
&gt; #else<br>
&gt; #include &lt;stdint.h&gt;<br>
&gt; typedef uint32_t __u32;<br>
&gt; typedef uint64_t __u64;<br>
&gt; #endif<br>
&gt; #else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
&gt; <br>
&gt; Alternatively, I could create a new common header to be included from =
both<br>
&gt; drm.h and drm_fourcc.h, drm_base_types.h or something like that:<br>
&gt; <br>
&gt; #ifdef DRM_FOURCC_STANDALONE<br>
&gt; #include &quot;drm_base_types.h&quot;<br>
&gt; #else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
<br>
Hi,<br>
<br>
my point is, any solution relying on DRM_FOURCC_STANDALONE will fail<br>
sometimes, because there is no reason why userspace would *not* #define<br>
DRM_FOURCC_STANDALONE. Hence, #ifdef DRM_FOURCC_STANDALONE is<br>
completely moot, you have to make the headers work in any include<br>
order when DRM_FOURCC_STANDALONE is defined anyway.<br>
<br>
<br>
Thanks.<br>
pq<br>
<br>
&gt; On Fri, Dec 4, 2020 at 7:58 AM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen &lt;<a href=3D"mail=
to:ppaalanen@gmail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote=
:=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 3 Dec 2020 21:45:14 +0100<br>
&gt; &gt; &gt; Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; On Thu, Dec 3, 2020 at 7:55 PM James Park &lt;<a href=
=3D"mailto:james.park@lagfreegames.com" target=3D"_blank">james.park@lagfre=
egames.com</a>&gt;=C2=A0 <br>
&gt; &gt; wrote:=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The trailing underscore for=C2=A0 DRM_FOURCC_STAND=
ALONE_ isn&#39;t<br>
&gt; &gt; &gt; &gt; &gt; intentional, right? Should I put all the integer t=
ypes, or just the<br>
&gt; &gt; &gt; &gt; &gt; ones that are used in that file?=C2=A0 <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Yeah that trailing _ just slipped in. And I&#39;d just =
do the types<br>
&gt; &gt; &gt; &gt; already used. I don&#39;t think anything else than __u3=
2 (for drm fourcc)<br>
&gt; &gt; &gt; &gt; and __u64 (for drm modifier) is needed.=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; can that create conflicts if userspace first includes drm_fo=
urcc.h and<br>
&gt; &gt; &gt; then drm.h?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would find it natural to userspace have generic headers in=
cluding<br>
&gt; &gt; &gt; drm_fourcc.h and then DRM-specific C-files including drm.h a=
s well<br>
&gt; &gt; &gt; (through libdrm headers). I think Weston might already do th=
is.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The generic userspace (weston) header would obviously #defin=
e<br>
&gt; &gt; &gt; DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files=
 as well.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Hm yes that would break. I guess we could just include the linux =
types<br>
&gt; &gt; header for this. And I guess on windows you&#39;d need to have th=
at from<br>
&gt; &gt; somewhere. Or we just require that users of the standalone header=
 pull<br>
&gt; &gt; the right header or defines in first?<br>
&gt; &gt; -Daniel<br>
&gt; &gt; --<br>
&gt; &gt; Daniel Vetter<br>
&gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bl=
ank">http://blog.ffwll.ch</a><br>
&gt; &gt;=C2=A0 <br>
<br>
</blockquote></div>

--000000000000583ca105b5dc301c--

--===============0821691003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0821691003==--
