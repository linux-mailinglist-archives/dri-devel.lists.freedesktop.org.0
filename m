Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3E2D25F3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AE16E952;
	Tue,  8 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589316E5B9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:49:19 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id x16so18790721ejj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8GZqro5vfaSdFxUvxODTiXniaK4i00z0hUv+aKlaD8A=;
 b=W2jUDlYJT64XSwfjUsfGLbGXWWV7QqkjogZ0KzUz08xQsaT94TO8X1b4Po/T1KHQey
 O0Nbvt8YKcK6ErTOnEbPhasLMri2FlC4z64JgxR+jiSEKJaE8xdT7jQKws4CoXvnp72c
 udRIzsUZMZOp2tLouzNRv1zs/BpLcqXRc2uhhsi+AH5np4+8zsJraP+WcbITQ0Ar4jF5
 lOL8MKn76+GFp+ert3LNtdxsU4wlXDl/eGfrdWZOdRL692kkb/3ITqLjvpeceAFLgkh4
 647n7g1B7C+CUPkHJoEZL2hqPLl8rR6uVBRYCmf0YnAUH5xVy0ab1mETCg1JpBG7GNS4
 5eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GZqro5vfaSdFxUvxODTiXniaK4i00z0hUv+aKlaD8A=;
 b=sYcoNewQZhjced7kgUoabh9JG4sfzxuJ7UFj08AYvLLeAq/nNI76kMAL8AwvcDTgri
 5MnZ09Ex3NcgysW6pz5TvmdXyBZsUt7XxjNHrdAAvl0uGGiwa4o6B+DW82/rNUoDvXFY
 NGPA2yWmYDzPoX34hRzZgvfDN+G/nKI9EOb0uAqwI2yR3mXQeKi+5uuINEZ5qLUA0GPp
 nRJ++BgiqlOPYztF+T+x7vNT/alvq4ilkDJ2a4WnW0IaNQ40i7mP/LOX0LI4lsqf8P/c
 50zUSEvgWnoEi/Ab3cVPMUhiJT8oNbIhMzAYAA2H66NCng706vx78/lRz8buHqP647f7
 n2MQ==
X-Gm-Message-State: AOAM533UyP1uJPq+WKgwWOQHGZuX4AEdbxBt0DtO16f1alG54mvLLzFN
 A4XI8DxjVD1e0VWEZqRwqc/217ppunT6z/IaLmKHlQ==
X-Google-Smtp-Source: ABdhPJzfeAG4Lvi1QjmG49EF8mehIdtt/bhsgtMe3EdH8NFoDJqn5WOAXsD2q/Tujl7Tp7dCGPZQ4NB1i+vW3uD89Bg=
X-Received: by 2002:a17:906:d93c:: with SMTP id
 rn28mr18243556ejb.50.1607338157995; 
 Mon, 07 Dec 2020 02:49:17 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
 <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
In-Reply-To: <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 02:49:04 -0800
Message-ID: <CABjik9cd_NWOSH79Y1x7Hj5iW6nqoP44XrNSDr+o5am07Suzbg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
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
 James Park <jpark37@lagfreegames.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: multipart/mixed; boundary="===============0339321793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0339321793==
Content-Type: multipart/alternative; boundary="000000000000f10d9a05b5dd93ce"

--000000000000f10d9a05b5dd93ce
Content-Type: text/plain; charset="UTF-8"

That would work, but that's kind of an annoying requirement. I would prefer
the header to be self-sufficient.

Thanks,
James

On Mon, Dec 7, 2020 at 2:47 AM Simon Ser <contact@emersion.fr> wrote:

> On Monday, December 7th, 2020 at 11:44 AM, Pekka Paalanen <
> ppaalanen@gmail.com> wrote:
>
> > But then, the code in the header should be literally
> >
> > #ifndef DRM_FOURCC_STANDALONE
> > #include "drm.h"
> > #endif
> >
> > without an #else branch.
>
> As long as there is a #include "drm_basic_types.h" right before
> (drm_fourcc.h needs __u32 and __u64), I believe this can work too
> indeed.
>

--000000000000f10d9a05b5dd93ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That would work, but that&#39;s kind of an annoying requir=
ement. I would prefer the header to be self-sufficient.<div><br></div><div>=
Thanks,</div><div>James</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 7, 2020 at 2:47 AM Simon Ser &lt;=
<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Monday, Decemb=
er 7th, 2020 at 11:44 AM, Pekka Paalanen &lt;<a href=3D"mailto:ppaalanen@gm=
ail.com" target=3D"_blank">ppaalanen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; But then, the code in the header should be literally<br>
&gt;<br>
&gt; #ifndef DRM_FOURCC_STANDALONE<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
&gt;<br>
&gt; without an #else branch.<br>
<br>
As long as there is a #include &quot;drm_basic_types.h&quot; right before<b=
r>
(drm_fourcc.h needs __u32 and __u64), I believe this can work too<br>
indeed.<br>
</blockquote></div>

--000000000000f10d9a05b5dd93ce--

--===============0339321793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0339321793==--
