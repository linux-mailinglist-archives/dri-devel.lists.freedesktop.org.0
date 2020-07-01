Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CCF210AA5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6A26E89C;
	Wed,  1 Jul 2020 11:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DB06E89C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:59:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id w17so13321364otl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gxl3lfKFFa5tO2EgfognG9ijCcu9AhbS5i22kiQaKjo=;
 b=FvUkExqKiuHT2w0OLh6uTWPOABex1wdzYPavu+DGTTCahtailNMpEUEE6MELSok8tn
 qz/pl7b1+9sHNYfNY1DIKrHx07Tv2O5ZhIDpKa7L2mPYvYRFd1uXNEYErq5qTDfLSFom
 MwDFc6DM4Gqj47aBNxtU9deRr9keqFdI8f9HwhDCN8MtG+iXae2k4AbwI7aV4z2WPW3K
 M4RJwUsKyHWgKA0yL8eOhhmsIN6xoQocQELhCDIuGvdurS70qEJFzb7svZE0lR/1Ur+2
 PFzDJnley3JHsuwZgwTYtz+Hw2CLyibnSQcpSedDESHPjR3PK54S8amWIAi1sjt9EQS3
 6vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gxl3lfKFFa5tO2EgfognG9ijCcu9AhbS5i22kiQaKjo=;
 b=XluR41YCYakSW5KPjcf33QxeXD4ytrlRVbtDzJCN6Z4VLe0mTfqMRBs8M/kW8uRnWz
 UNAYFgeVcXej4RaFmSpNM1jhKB2vmURTX08zg/YurT+OO8zeppQ8OTLphb73pMX06rw5
 Pccfy6eu2rqOC357rIeHfLiuczbyKa+ucc22YHqkJKFYFC4gfTG+3ktProSQmty7LYVw
 BeS2u9KbARwG6ZzSybO94gU1SS/nIIgp0xhYlCITK6bUdMgvkivjAhnBQo28E4DCVIbT
 PZyxKT9jx0mlOgfNKiQScIu3DMXy4VR2cdyiGT9JT5SLgeWRvWotgmw8Dh6dwsjtN/lC
 v96A==
X-Gm-Message-State: AOAM533g8FC0QqxZEg+WeUbjjbhCMV3AS+j2PLYEohggouMJTcanlPB6
 F1fmENVavPJ8nVrU+JNEKSWYP2T3e7vQlWVKMMyxE6+lyAI=
X-Google-Smtp-Source: ABdhPJyxqfsGvU0ZTX2fGv+npKJmkZe28dpAQSBhjdlsqn3wwFxafYEfz6yBdoaMuv4RmfFNcxArMAePU6WjmwwoJSo=
X-Received: by 2002:a9d:7c98:: with SMTP id q24mr12273455otn.164.1593604754152; 
 Wed, 01 Jul 2020 04:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112559.22669-1-christian.koenig@amd.com>
 <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Jul 2020 17:29:00 +0530
Message-ID: <CAO_48GEXg=P-giE5YF=1Z0XS-Nd+-enQv7QZcz6YMvYBgmRB6A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0339333694=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0339333694==
Content-Type: multipart/alternative; boundary="00000000000048b7b405a960053c"

--00000000000048b7b405a960053c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for all the good work here, Christian!

On Wed, 1 Jul 2020, 17:20 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Wed, Jul 1, 2020 at 1:26 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > As discussed on the list.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

> ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 40474982a21d..5d7130f8d342 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5089,6 +5089,7 @@ F:        fs/dlm/
> >
> >  DMA BUFFER SHARING FRAMEWORK
> >  M:     Sumit Semwal <sumit.semwal@linaro.org>
> > +M:     Christian K=C3=B6nig <christian.koenig@amd.com>
> >  L:     linux-media@vger.kernel.org
> >  L:     dri-devel@lists.freedesktop.org
> >  L:     linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > --
> > 2.20.1
> >
>
Best,
Sumit.

>

--00000000000048b7b405a960053c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks for all the good work here, Christian!</div><=
div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 1 Jul 2020, 17:20 Daniel Vetter, &lt;<a hre=
f=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Wed, Jul 1, 2020 at 1:26 PM Christian K=C3=B6ni=
g<br>
&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; As discussed on the list.<br>
&gt;<br>
&gt; Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.ko=
enig@amd.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com=
</a>&gt;<br>
<br>
Acked-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" targe=
t=3D"_blank" rel=3D"noreferrer">daniel.vetter@ffwll.ch</a>&gt;<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Acked-by: Sum=
it Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org">sumit.semwal@linar=
o.org</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 40474982a21d..5d7130f8d342 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -5089,6 +5089,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs/dlm/<br>
&gt;<br>
&gt;=C2=A0 DMA BUFFER SHARING FRAMEWORK<br>
&gt;=C2=A0 M:=C2=A0 =C2=A0 =C2=A0Sumit Semwal &lt;<a href=3D"mailto:sumit.s=
emwal@linaro.org" target=3D"_blank" rel=3D"noreferrer">sumit.semwal@linaro.=
org</a>&gt;<br>
&gt; +M:=C2=A0 =C2=A0 =C2=A0Christian K=C3=B6nig &lt;<a href=3D"mailto:chri=
stian.koenig@amd.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig=
@amd.com</a>&gt;<br>
&gt;=C2=A0 L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-media@vger.kernel.=
org" target=3D"_blank" rel=3D"noreferrer">linux-media@vger.kernel.org</a><b=
r>
&gt;=C2=A0 L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:dri-devel@lists.freedesk=
top.org" target=3D"_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.o=
rg</a><br>
&gt;=C2=A0 L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linaro-mm-sig@lists.lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">linaro-mm-sig@lists.linaro.org=
</a> (moderated for non-subscribers)<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br></blockquote></div></div><div dir=3D"auto">Best,</div><div dir=3D"a=
uto">Sumit.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"></blockquote></div></div></div>

--00000000000048b7b405a960053c--

--===============0339333694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0339333694==--
