Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9644367A1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0146ECCF;
	Thu, 21 Oct 2021 16:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7013A6ECCE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 16:24:56 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o11so189083ljg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILVpGdAYYw2YrQLeCpkGZ8gZ40IWlGBqDzddlrLjH/o=;
 b=WpOjSjXv4zeBj8AGC17KtiVREms7vmQkLelog3jDrY4SWECbo0kDT7RzpzGreceRfG
 jgd0BE1tDMpQuMXP9nQX7oHgSaCQV5PAZFS6DEVEQa9/ZzqdcJJTmiLzlIGDg6ZPPdO6
 gWZWEHKt6vqqvXgl+Pfv+Qs+exnSX4f2oP4JnhoxOGSwCYdUpKxr3pxgVKWBw/JKwyQ8
 6vzhAwxPXq3VXWeVvQ+JZY/LNQl4O6WImLmzp30mCLRE1tnHm6ilqUBzxblXpOfcofAp
 C8OaxCpHoZIG8Jw3bCjjx2mp3fRXAsjHffYD7Fk2AxWKZKmshEIBMLcNoQmA66L/KYkE
 7P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILVpGdAYYw2YrQLeCpkGZ8gZ40IWlGBqDzddlrLjH/o=;
 b=UB2sEwb0a/Ez6iSj86d6hRPYb+wonVzDR+tvGtKWRiOPBdgLFZ7TQaAGU+lsJ6b0oJ
 r/RdR756p0dqoSM+KIKlaIXQqlf5aclUMB2fS4Q6ivJdnfLKvR2TjAZH21mygf+6pkHg
 phgJNM0sI5ZSPWkeYCXwHwBsmij0bBmENwra3T41apax0h+mU/0I7O/rXGQJ8Z2kUmfS
 jb8G3v7Y+HQHFqw9RV5CQPbYy6CSC8f+AyfqH2icujqqMn21wPrn17Rc7Z6rgTX4Ms0J
 eZ6jOzVwQ/KPVC+HDtxablz3VnGHCHS/zd2h6MYfg4U7hxs1isqKSDxyF65Nsqvkuhna
 RjCQ==
X-Gm-Message-State: AOAM533bR0VpnwiUWmSwD3eDEZHmMhZ+v/oA03F4xxI6pX+EbGEKePjn
 LxONd573tyQBjLRCCbDTUrm/bqx4MTOM/d/PphbK+A==
X-Google-Smtp-Source: ABdhPJzP9oEQi/ou21Sri8IB7W9pQRuYDjtE1u1xYv0SkBr8Ic00KrjLos7zEjkdj20UNleTsxtsYKzsQRSjlKZybK4=
X-Received: by 2002:a05:651c:2328:: with SMTP id
 bi40mr6959084ljb.121.1634833492253; 
 Thu, 21 Oct 2021 09:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211021141945.84023-1-christian.koenig@amd.com>
 <CADnq5_N3N=RPzRPDB1aG1btmHOMqdRRce28YuuvEJc25Hw6Dcw@mail.gmail.com>
In-Reply-To: <CADnq5_N3N=RPzRPDB1aG1btmHOMqdRRce28YuuvEJc25Hw6Dcw@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 21 Oct 2021 21:54:39 +0530
Message-ID: <CAO_48GEg0CNWv+1ckwEqxYiu9R630uzPRkP9dRNo_qihYN+HUg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix kerneldoc for renamed members
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000092bb1b05cedf550b"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000092bb1b05cedf550b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Thu, 21 Oct 2021 at 19:55, Alex Deucher <alexdeucher@gmail.com> wrote:

> On Thu, Oct 21, 2021 at 10:19 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Those members where renamed, update the kerneldoc as well.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
LGTM, but perhaps you want to send it from your amd.com account?
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> > ---
> >  include/linux/dma-buf.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 02c2eb874da6..9807aef33685 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -433,8 +433,8 @@ struct dma_buf {
> >         /** @poll: for userspace poll support */
> >         wait_queue_head_t poll;
> >
> > -       /** @cb_excl: for userspace poll support */
> > -       /** @cb_shared: for userspace poll support */
> > +       /** @cb_in: for userspace poll support */
> > +       /** @cb_out: for userspace poll support */
> >         struct dma_buf_poll_cb_t {
> >                 struct dma_fence_cb cb;
> >                 wait_queue_head_t *poll;
> > --
> > 2.25.1
> >
>

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

--00000000000092bb1b05cedf550b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Christian,</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Oct 2021 at 19:55=
, Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, Oct 21, 2021 at 10:19 AM Christian K=C3=B6nig<br>
&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">c=
koenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Those members where renamed, update the kerneldoc as well.<br>
&gt;<br>
&gt; Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.ko=
enig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
<br>
Reviewed-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" =
target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br></blockquote><div>LG=
TM, but perhaps you want to send it from your <a href=3D"http://amd.com">am=
d.com</a> account?=C2=A0</div><div>Acked-by: Sumit Semwal &lt;<a href=3D"ma=
ilto:sumit.semwal@linaro.org">sumit.semwal@linaro.org</a>&gt;</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 include/linux/dma-buf.h | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h<br>
&gt; index 02c2eb874da6..9807aef33685 100644<br>
&gt; --- a/include/linux/dma-buf.h<br>
&gt; +++ b/include/linux/dma-buf.h<br>
&gt; @@ -433,8 +433,8 @@ struct dma_buf {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/** @poll: for userspace poll support=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t poll;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @cb_excl: for userspace poll support *=
/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @cb_shared: for userspace poll support=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @cb_in: for userspace poll support */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @cb_out: for userspace poll support */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_poll_cb_t {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dm=
a_fence_cb cb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queu=
e_head_t *poll;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div>Best,</div><div>Sumit.</div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
">Thanks and regards,<br><br>Sumit Semwal (he / him)<br>Tech Lead - LCG, Ve=
rtical Technologies<br>Linaro.org =E2=94=82 Open source software for ARM So=
Cs</div></div></div>

--00000000000092bb1b05cedf550b--
