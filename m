Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4419A3A8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 04:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776D56E8C9;
	Wed,  1 Apr 2020 02:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80216E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 02:39:40 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k18so20933408oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzYWdS8ptvsQ51liRTuryFlYrkP2okzYwHKGEN31ccs=;
 b=Nq/iPOHjbrKHhHEg7yVZnvLxEKMFf/820C3C/aFENCC3Ud4sWUiWOSY1n+dd9o4ImW
 1VsfUnNc5H+/vhMsWgYq43Xsj6dRYzFob0jJBEbfF5Rpx9KfWIr121QrPrxUQOwjthhI
 LTj7ZuHPx1L9SDjBXg/RBqCccpV5+LfRy9YamUA2oZphtH2M2iCHSb+/MJ856eNWLvQo
 mbOQD0bbtqJLWBFy0K6g4NZ5w2eAMk8XNNV36pwq6Ev5rpml94OFfmCm3l2u31bAmkcP
 f6qj9BTkLmdXlaHUv+asusvU8nbNDhLz6OkUaWNKNIC3trkgtSeCecxUnIBSK9mQ552A
 7Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzYWdS8ptvsQ51liRTuryFlYrkP2okzYwHKGEN31ccs=;
 b=jg7Ky7oXEo21+TjdL7culcLqJwacfT3S66gSTBHKbr8mTjKIEixCkspzMh/JVE+GIM
 zZZN8kSnMOc8gji/Sa2e8zjJhxbCif6sLrQFYlZHXTCHXacqtSHlXSmvxWv+jp/diRhu
 7XEaMDfftdRTKBy+qSN9h3m+ctK5BslAqRtUoRm7I5okC+kPGW7d5ni5Qe5bqJb1AEDP
 /nGabZcGyCzvtRg01RafA7Uua0LCS1fyaYlXwgW2y3NwX67Dmpy0hE/HFxq3M9QxcRD8
 mdF+CNa2YYOwbU13ogqbAQCWXGLDZZNyjAk+Fou437Wc5EYWDuamHBl5roJ3wRPTdpjz
 JZIw==
X-Gm-Message-State: AGi0PubWt1RuPqQDCqDwuHreFissik/fmmU4BhGf/iH9S3duiqAygy+k
 zZ2tMeaiTdNBm0vKz4giy1T+pjYMExwB4kmTye601w==
X-Google-Smtp-Source: APiQypJ37iA4gNTyxVHb8JZchKlLqQ6xkw/Kwg0hme+Z8Pc4V9uPmDR3EZEriMGOb37UUNSz6Qs6z6Tk9hZ1EOBLl+g=
X-Received: by 2002:aca:4c1:: with SMTP id 184mr1373103oie.76.1585708780047;
 Tue, 31 Mar 2020 19:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200330135536.2997-1-christian.koenig@amd.com>
 <20200331084602.GJ2363188@phenom.ffwll.local>
In-Reply-To: <20200331084602.GJ2363188@phenom.ffwll.local>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Apr 2020 08:09:27 +0530
Message-ID: <CAO_48GGs4U_cAOMfAQ7qDwTciv+b28uYXjCdPXhYpAv5Um9GHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1278941747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1278941747==
Content-Type: multipart/alternative; boundary="0000000000008d63c605a231983f"

--0000000000008d63c605a231983f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, 31 Mar 2020, 14:16 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Mon, Mar 30, 2020 at 03:55:31PM +0200, Christian K=C3=B6nig wrote:
> > Add a peer2peer flag noting that the importer can deal with device
> > resources which are not backed by pages.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> On the series:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
Fwiw, for the series,
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

> ---
> >  drivers/dma-buf/dma-buf.c |  2 ++
> >  include/linux/dma-buf.h   | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index ccc9eda1bc28..570c923023e6 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -690,6 +690,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf,
> struct device *dev,
> >
> >       attach->dev =3D dev;
> >       attach->dmabuf =3D dmabuf;
> > +     if (importer_ops)
> > +             attach->peer2peer =3D importer_ops->allow_peer2peer;
> >       attach->importer_ops =3D importer_ops;
> >       attach->importer_priv =3D importer_priv;
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 1ade486fc2bb..82e0a4a64601 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -334,6 +334,14 @@ struct dma_buf {
> >   * Attachment operations implemented by the importer.
> >   */
> >  struct dma_buf_attach_ops {
> > +     /**
> > +      * @allow_peer2peer:
> > +      *
> > +      * If this is set to true the importer must be able to handle pee=
r
> > +      * resources without struct pages.
> > +      */
> > +     bool allow_peer2peer;
> > +
> >       /**
> >        * @move_notify
> >        *
> > @@ -362,6 +370,7 @@ struct dma_buf_attach_ops {
> >   * @node: list of dma_buf_attachment, protected by dma_resv lock of th=
e
> dmabuf.
> >   * @sgt: cached mapping.
> >   * @dir: direction of cached mapping.
> > + * @peer2peer: true if the importer can handle peer resources without
> pages.
> >   * @priv: exporter specific attachment data.
> >   * @importer_ops: importer operations for this attachment, if provided
> >   * dma_buf_map/unmap_attachment() must be called with the dma_resv loc=
k
> held.
> > @@ -382,6 +391,7 @@ struct dma_buf_attachment {
> >       struct list_head node;
> >       struct sg_table *sgt;
> >       enum dma_data_direction dir;
> > +     bool peer2peer;
> >       const struct dma_buf_attach_ops *importer_ops;
> >       void *importer_priv;
> >       void *priv;
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000008d63c605a231983f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Christian,<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, 31 Mar 2020, 14:16 Daniel Vetter,=
 &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Mon, Mar 30, 2020 at 03:55:31PM +020=
0, Christian K=C3=B6nig wrote:<br>
&gt; Add a peer2peer flag noting that the importer can deal with device<br>
&gt; resources which are not backed by pages.<br>
&gt; <br>
&gt; Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.ko=
enig@amd.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com=
</a>&gt;<br>
<br>
On the series:<br>
<br>
Acked-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" targe=
t=3D"_blank" rel=3D"noreferrer">daniel.vetter@ffwll.ch</a>&gt;<br></blockqu=
ote></div></div><div dir=3D"auto">Fwiw, for the series,</div><div dir=3D"au=
to">Acked-by: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org">s=
umit.semwal@linaro.org</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 drivers/dma-buf/dma-buf.c |=C2=A0 2 ++<br>
&gt;=C2=A0 include/linux/dma-buf.h=C2=A0 =C2=A0| 10 ++++++++++<br>
&gt;=C2=A0 2 files changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
&gt; index ccc9eda1bc28..570c923023e6 100644<br>
&gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; @@ -690,6 +690,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, str=
uct device *dev,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0attach-&gt;dev =3D dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0attach-&gt;dmabuf =3D dmabuf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (importer_ops)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attach-&gt;peer2peer =
=3D importer_ops-&gt;allow_peer2peer;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0attach-&gt;importer_ops =3D importer_ops;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0attach-&gt;importer_priv =3D importer_priv;<=
br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h<br>
&gt; index 1ade486fc2bb..82e0a4a64601 100644<br>
&gt; --- a/include/linux/dma-buf.h<br>
&gt; +++ b/include/linux/dma-buf.h<br>
&gt; @@ -334,6 +334,14 @@ struct dma_buf {<br>
&gt;=C2=A0 =C2=A0* Attachment operations implemented by the importer.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 struct dma_buf_attach_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @allow_peer2peer:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this is set to true the importer must be ab=
le to handle peer<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * resources without struct pages.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool allow_peer2peer;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @move_notify<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; @@ -362,6 +370,7 @@ struct dma_buf_attach_ops {<br>
&gt;=C2=A0 =C2=A0* @node: list of dma_buf_attachment, protected by dma_resv=
 lock of the dmabuf.<br>
&gt;=C2=A0 =C2=A0* @sgt: cached mapping.<br>
&gt;=C2=A0 =C2=A0* @dir: direction of cached mapping.<br>
&gt; + * @peer2peer: true if the importer can handle peer resources without=
 pages.<br>
&gt;=C2=A0 =C2=A0* @priv: exporter specific attachment data.<br>
&gt;=C2=A0 =C2=A0* @importer_ops: importer operations for this attachment, =
if provided<br>
&gt;=C2=A0 =C2=A0* dma_buf_map/unmap_attachment() must be called with the d=
ma_resv lock held.<br>
&gt; @@ -382,6 +391,7 @@ struct dma_buf_attachment {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head node;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sg_table *sgt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enum dma_data_direction dir;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool peer2peer;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dma_buf_attach_ops *importer_op=
s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *importer_priv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *priv;<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank" rel=3D=
"noreferrer">dri-devel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/dri-devel</a><br>
</blockquote></div></div></div>

--0000000000008d63c605a231983f--

--===============1278941747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1278941747==--
