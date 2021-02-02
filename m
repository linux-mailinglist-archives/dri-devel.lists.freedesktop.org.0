Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387E30D4CD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62926E9D7;
	Wed,  3 Feb 2021 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1176E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 18:15:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p20so12096305ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kmod/TM4yTTwB8JXm3ef9//IZzNhybL2qZHmMqtiATE=;
 b=Q4ovLeWSr2HSjosq07RfsWSRTkkrTIzF55woEYCclWG2sWZsLU3gMfHFjp0VwdGSIg
 gbpL1/09ScS2GuCTaxgTZWucWswzQIEJBQJhH5/XJtWlCSy6eiFDxWAbLEQO6fXCMr4I
 vstMFJDhHuR2TdY5NrWt1Zh3HF2nADwhtOJjSbw/V283UxPfP31Zttjke8SEswYxS3kO
 ulVRBRzMSXnb5KLmBJZrebvnx/pmtQLFw4CV6G/l1l4Jc7/oYptNtXB+pJIcUAHAWSAW
 So8H9zPvwwRYWOMdaE3EBBQkGBZlqxswwBS8Tnq+mOORzxVrUiLwTAwle3iJXqC5//A+
 aI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kmod/TM4yTTwB8JXm3ef9//IZzNhybL2qZHmMqtiATE=;
 b=uU9MWH8wPs7UVUPOLndTDSDqWqUXO6pMJ341aSOW+yjUfNR6KWXV+8L0TwMnTvGE8U
 zE+Wswf03wFBWTLVZgZoMcmAAmUbswoAvckxge8R+gnRU1rfd4YNA7T9VXNgdRpLsZ4W
 6FZlAAxdCrUE/61p5JUYtKByxX5GAmYZy1dNh1trEJJSEwTO9xepIp4UOxrkzbTZZJ68
 oSrjk03mwBpFWDGic9zhu+3v9y9V+SFQGaXyXHJatx5whq14DY4PvQQnjpwcDzwt+b5f
 KGCO82hon78Mv8hG//16bBEb4cbzHjR6dQ5P3Y9rb6B6zhtI7GD52yJXBTPeWZY6vhP+
 DdQw==
X-Gm-Message-State: AOAM5308EUJ6viLOU6HjTVPTb0Qe/e4CdEmtbu/F7A9uB8LuUzbqLRMe
 w9ymNL4609cm4fLZ9jcnPTrtxzcG/7/LtGgAsxVbgQ==
X-Google-Smtp-Source: ABdhPJy8qTG1B8uamv6+rAAXIcCkAhXeu4fLlQKg9iIWeMp/kwkvp+/jR2J+nXdJQV8nftel3Bi4g0SC/BrdYpcFYX0=
X-Received: by 2002:a17:906:7ca:: with SMTP id
 m10mr15717991ejc.257.1612289716695; 
 Tue, 02 Feb 2021 10:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
 <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
 <CACvgo52y219pp=oD3FPT46YmVYhSwa3BfaQEoq6rj7KwqZE1NA@mail.gmail.com>
In-Reply-To: <CACvgo52y219pp=oD3FPT46YmVYhSwa3BfaQEoq6rj7KwqZE1NA@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Tue, 2 Feb 2021 10:14:42 -0800
Message-ID: <CABjik9fQkkfmVZKLoVi8VAHYNOkUMaoFSYHxEGP6qKZvMh9VJA@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1398836760=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1398836760==
Content-Type: multipart/alternative; boundary="000000000000d6d02505ba5e7369"

--000000000000d6d02505ba5e7369
Content-Type: text/plain; charset="UTF-8"

I'm not sure what your suggestion is. Move which #ifdef block where?

I don't think everyone is of the opinion that adding drm.h and pulling in
unnecessary kernel structures is fine. If I'm not mistaken, the reason
people are making me jump through hoops in the first place is to avoid that.

I appreciate the feedback though.

- James

On Tue, Feb 2, 2021 at 9:28 AM Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> Hi James,
>
> On Tue, 2 Feb 2021 at 08:27, James Park <james.park@lagfreegames.com>
> wrote:
> >
> > Hello,
> >
> > Is there something I can do to help move this patch along?
> >
> > Thanks,
> > James Park
> >
> > On Thu, Dec 10, 2020 at 1:13 AM James Park <jpark37@lagfreegames.com>
> wrote:
> >>
> >> Create drm_basic_types.h to define types previously defined by drm.h.
> >>
> >> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
> >>
> >> This will allow Mesa to port code to Windows more easily.
> >>
> >> Signed-off-by: James Park <jpark37@lagfreegames.com>
> >> Acked-by: Simon Ser <contact@emersion.fr>
> >> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> ---
> >>  include/uapi/drm/drm.h             | 12 ++-------
> >>  include/uapi/drm/drm_basic_types.h | 52
> ++++++++++++++++++++++++++++++++++++++
> >>  include/uapi/drm/drm_fourcc.h      |  4 +++
> >>  3 files changed, 58 insertions(+), 10 deletions(-)
> >>  create mode 100644 include/uapi/drm/drm_basic_types.h
> >>
> Have you considered the possibility of having the ifdef block inlined
> within drm_fourcc.h?
>
> Sure some users might need to add an drm.h include in their code. At
> the same time they also need to explicitly define
> DRM_FOURCC_STANDALONE, so that is fine.
> We had all sorts of issues with these headers in the past, so adding
> another one might end up repeating some of those yet again.
>
> Thanks
> Emil
>

--000000000000d6d02505ba5e7369
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure what your suggestion is. Move which #ifde=
f block where?<div><br></div><div>I don&#39;t think everyone is of the opin=
ion that adding drm.h and pulling in unnecessary kernel structures is fine.=
 If I&#39;m not mistaken, the reason people are making me jump through hoop=
s in the first place is to avoid that.</div><div><br></div><div>I appreciat=
e the feedback though.</div><div><br></div><div>- James</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2,=
 2021 at 9:28 AM Emil Velikov &lt;<a href=3D"mailto:emil.l.velikov@gmail.co=
m">emil.l.velikov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi James,<br>
<br>
On Tue, 2 Feb 2021 at 08:27, James Park &lt;<a href=3D"mailto:james.park@la=
gfreegames.com" target=3D"_blank">james.park@lagfreegames.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; Is there something I can do to help move this patch along?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; James Park<br>
&gt;<br>
&gt; On Thu, Dec 10, 2020 at 1:13 AM James Park &lt;<a href=3D"mailto:jpark=
37@lagfreegames.com" target=3D"_blank">jpark37@lagfreegames.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; Create drm_basic_types.h to define types previously defined by drm=
.h.<br>
&gt;&gt;<br>
&gt;&gt; Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.<b=
r>
&gt;&gt;<br>
&gt;&gt; This will allow Mesa to port code to Windows more easily.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: James Park &lt;<a href=3D"mailto:jpark37@lagfreegam=
es.com" target=3D"_blank">jpark37@lagfreegames.com</a>&gt;<br>
&gt;&gt; Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" tar=
get=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt;&gt; Reviewed-by: Pekka Paalanen &lt;<a href=3D"mailto:pekka.paalanen@c=
ollabora.com" target=3D"_blank">pekka.paalanen@collabora.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++-------<br>
&gt;&gt;=C2=A0 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++=
++++++++++++++++++<br>
&gt;&gt;=C2=A0 include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 =
+++<br>
&gt;&gt;=C2=A0 3 files changed, 58 insertions(+), 10 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 include/uapi/drm/drm_basic_types.h<br>
&gt;&gt;<br>
Have you considered the possibility of having the ifdef block inlined<br>
within drm_fourcc.h?<br>
<br>
Sure some users might need to add an drm.h include in their code. At<br>
the same time they also need to explicitly define<br>
DRM_FOURCC_STANDALONE, so that is fine.<br>
We had all sorts of issues with these headers in the past, so adding<br>
another one might end up repeating some of those yet again.<br>
<br>
Thanks<br>
Emil<br>
</blockquote></div>

--000000000000d6d02505ba5e7369--

--===============1398836760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1398836760==--
