Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA72392C65
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C0D6EE7C;
	Thu, 27 May 2021 11:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0126EE77
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:12:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a5so6675702lfm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEpx0mv0zIx0GrKlcnbi7SSZ6s3uwNwuzb7fbvJrHQY=;
 b=cFuaOm0ZBT0UmJFAJEx9Sn4v2y3ZSbjLj8Ek9Oo0lSVT1FPuHzXk+5RkXmSSNcyBxL
 4KUK/XSZgXl6X0CohxieWKHEGewTfGOxPSNZNiBGj/4SXk8pMyMwyOQm2BbVPYIMHSGi
 Dsdm97BOt0tttX3YKMIBItkDeIHms8Hm605WI6tY4YKShFcQGhQy31c3fuplderQ27eQ
 P8DIofUdYACdPQBZEKKyYmL+2adTh744dvPiIWR/RMCfRB76TrDiFHnthzLqWOeP+2de
 /auE6ckHPnPgdM2LeufwXATQEYyzGXddC5RQhjIctsM5z0E27OCSS9svJoBhSDE/0OBH
 hiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEpx0mv0zIx0GrKlcnbi7SSZ6s3uwNwuzb7fbvJrHQY=;
 b=szeNBNu7x8+oqsWu3RSXobAfEQ1Je7+X+KVEHchnTnO1N4TqLlwkdh6BtNGmiCEzeF
 kRcv2u/Qy9gwRp8Gx+MLAL3ahC3VWGQQnRqE5bB8Xf2pGis1AKnqTCuN2GPqZ4r9JiEn
 2Wj6yvxo//cTKk51Vuy841Y0a/o95soNLBrT5FY8JlNE6FJlAcxjgAuJ2C5/f39TQp9k
 ZsVTBYGuPJCpQmENp+bkR/+MlmY8hHp+vR1lqY94VvoQXYGF74547cRiE2qg7wgau2eE
 jNTj1VvvzWoP0ru5NJvZyrSCgfQwIr7tDOBgIYViknqMDTjTWlFuVhMNDPYAW2qblgA3
 4IQQ==
X-Gm-Message-State: AOAM533pH86f1ChtGhQnI7+kxJ36dMNBLNDZZ3tPneV6szSGkBQ5XjD1
 qTY+ps/7pG1vvmDfYkFKvnlLGMKq/7GnaotT0Lc4dQ==
X-Google-Smtp-Source: ABdhPJzXfdzwWGzCmQAtAvCYd7+pLnvsJwtjGpH8e9hAcT8t8Kw9hReq2ICPnBJAMTNhSicXT71dCG3VyNJEwc+r9jE=
X-Received: by 2002:a05:6512:3208:: with SMTP id
 d8mr1916936lfe.361.1622113950702; 
 Thu, 27 May 2021 04:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-5-jason@jlekstrand.net>
 <YK92j8b8SZ61KTCO@phenom.ffwll.local>
In-Reply-To: <YK92j8b8SZ61KTCO@phenom.ffwll.local>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 27 May 2021 16:42:18 +0530
Message-ID: <CAO_48GE9p_CUnGNSvU1Sssa3ecBMy0wWvQWoM5Js7B6FAQ2N5g@mail.gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: Document DMA_BUF_IOCTL_SYNC
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000d1346005c34dd5ef"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d1346005c34dd5ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 27 May 2021 at 16:08, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, May 25, 2021 at 04:17:50PM -0500, Jason Ekstrand wrote:
> > This adds a new "DMA Buffer ioctls" section to the dma-buf docs and add=
s
> > documentation for DMA_BUF_IOCTL_SYNC.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
>
> We're still missing the doc for the SET_NAME ioctl, but maybe Sumit can b=
e
> motivated to fix that?
>

Yes, certainly, I'll cook up a patch and send it soon.

>
> > ---
> >  Documentation/driver-api/dma-buf.rst |  8 +++++++
> >  include/uapi/linux/dma-buf.h         | 32 +++++++++++++++++++++++++++-
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/driver-api/dma-buf.rst
> b/Documentation/driver-api/dma-buf.rst
> > index 7f37ec30d9fd7..784f84fe50a5e 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -88,6 +88,9 @@ consider though:
> >  - The DMA buffer FD is also pollable, see `Implicit Fence Poll
> Support`_ below for
> >    details.
> >
> > +- The DMA buffer FD also supports a few dma-buf-specific ioctls, see
> > +  `DMA Buffer ioctls`_ below for details.
> > +
> >  Basic Operation and Device DMA Access
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > @@ -106,6 +109,11 @@ Implicit Fence Poll Support
> >  .. kernel-doc:: drivers/dma-buf/dma-buf.c
> >     :doc: implicit fence polling
> >
> > +DMA Buffer ioctls
> > +~~~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc:: include/uapi/linux/dma-buf.h
> > +
> >  Kernel Functions and Structures Reference
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index 7f30393b92c3b..1f67ced853b14 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -22,8 +22,38 @@
> >
> >  #include <linux/types.h>
> >
> > -/* begin/end dma-buf functions used for userspace mmap. */
> > +/**
> > + * struct dma_buf_sync - Synchronize with CPU access.
> > + *
> > + * When a DMA buffer is accessed from the CPU via mmap, it is not alwa=
ys
> > + * possible to guarantee coherency between the CPU-visible map and
> underlying
> > + * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to
> bracket
> > + * any CPU access to give the kernel the chance to shuffle memory
> around if
> > + * needed.
> > + *
> > + * Prior to accessing the map, the client should call DMA_BUF_IOCTL_SY=
NC
>
> s/should/must/
>
> > + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once
> the
> > + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> > + * DMA_BUF_SYNC_END and the same read/write flags.
>
> I think we should make it really clear here that this is _only_ for cache
> coherency, and that furthermore if you want coherency with gpu access you
> either need to use poll() for implicit sync (link to the relevant section=
)
> or handle explicit sync with sync_file (again link would be awesome).
>
> > + */
> >  struct dma_buf_sync {
> > +     /**
> > +      * @flags: Set of access flags
> > +      *
> > +      * - DMA_BUF_SYNC_START: Indicates the start of a map access
>
> Bikeshed, but I think the item list format instead of bullet point list
> looks neater, e.g.  DOC: standard plane properties in drm_plane.c.
>
>
> > +      *   session.
> > +      *
> > +      * - DMA_BUF_SYNC_END: Indicates the end of a map access session.
> > +      *
> > +      * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will
> > +      *   be read by the client via the CPU map.
> > +      *
> > +      * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will
>
> s/READ/WRITE/
>
> > +      *   be written by the client via the CPU map.
> > +      *
> > +      * - DMA_BUF_SYNC_RW: An alias for DMA_BUF_SYNC_READ |
> > +      *   DMA_BUF_SYNC_WRITE.
> > +      */
>
> With the nits addressed: Reviewed-by: Daniel Vetter <
> daniel.vetter@ffwll.ch>
>
> >       __u64 flags;
> >  };
> >
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal
Tech Lead - Android, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

--000000000000d1346005c34dd5ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 May 2021 at 16:08, D=
aniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
May 25, 2021 at 04:17:50PM -0500, Jason Ekstrand wrote:<br>
&gt; This adds a new &quot;DMA Buffer ioctls&quot; section to the dma-buf d=
ocs and adds<br>
&gt; documentation for DMA_BUF_IOCTL_SYNC.<br>
&gt; <br>
&gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.n=
et" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=
=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.co=
m" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=
=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
<br>
We&#39;re still missing the doc for the SET_NAME ioctl, but maybe Sumit can=
 be<br>
motivated to fix that?<br></blockquote><div><br></div><div>Yes, certainly, =
I&#39;ll cook up a patch and send it soon.=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/driver-api/dma-buf.rst |=C2=A0 8 +++++++<br>
&gt;=C2=A0 include/uapi/linux/dma-buf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
32 +++++++++++++++++++++++++++-<br>
&gt;=C2=A0 2 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driv=
er-api/dma-buf.rst<br>
&gt; index 7f37ec30d9fd7..784f84fe50a5e 100644<br>
&gt; --- a/Documentation/driver-api/dma-buf.rst<br>
&gt; +++ b/Documentation/driver-api/dma-buf.rst<br>
&gt; @@ -88,6 +88,9 @@ consider though:<br>
&gt;=C2=A0 - The DMA buffer FD is also pollable, see `Implicit Fence Poll S=
upport`_ below for<br>
&gt;=C2=A0 =C2=A0 details.<br>
&gt;=C2=A0 <br>
&gt; +- The DMA buffer FD also supports a few dma-buf-specific ioctls, see<=
br>
&gt; +=C2=A0 `DMA Buffer ioctls`_ below for details.<br>
&gt; +<br>
&gt;=C2=A0 Basic Operation and Device DMA Access<br>
&gt;=C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 <br>
&gt; @@ -106,6 +109,11 @@ Implicit Fence Poll Support<br>
&gt;=C2=A0 .. kernel-doc:: drivers/dma-buf/dma-buf.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0:doc: implicit fence polling<br>
&gt;=C2=A0 <br>
&gt; +DMA Buffer ioctls<br>
&gt; +~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +.. kernel-doc:: include/uapi/linux/dma-buf.h<br>
&gt; +<br>
&gt;=C2=A0 Kernel Functions and Structures Reference<br>
&gt;=C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf=
.h<br>
&gt; index 7f30393b92c3b..1f67ced853b14 100644<br>
&gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; @@ -22,8 +22,38 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;linux/types.h&gt;<br>
&gt;=C2=A0 <br>
&gt; -/* begin/end dma-buf functions used for userspace mmap. */<br>
&gt; +/**<br>
&gt; + * struct dma_buf_sync - Synchronize with CPU access.<br>
&gt; + *<br>
&gt; + * When a DMA buffer is accessed from the CPU via mmap, it is not alw=
ays<br>
&gt; + * possible to guarantee coherency between the CPU-visible map and un=
derlying<br>
&gt; + * memory.=C2=A0 To manage coherency, DMA_BUF_IOCTL_SYNC must be used=
 to bracket<br>
&gt; + * any CPU access to give the kernel the chance to shuffle memory aro=
und if<br>
&gt; + * needed.<br>
&gt; + *<br>
&gt; + * Prior to accessing the map, the client should call DMA_BUF_IOCTL_S=
YNC<br>
<br>
s/should/must/<br>
<br>
&gt; + * with DMA_BUF_SYNC_START and the appropriate read/write flags.=C2=
=A0 Once the<br>
&gt; + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with=
<br>
&gt; + * DMA_BUF_SYNC_END and the same read/write flags.<br>
<br>
I think we should make it really clear here that this is _only_ for cache<b=
r>
coherency, and that furthermore if you want coherency with gpu access you<b=
r>
either need to use poll() for implicit sync (link to the relevant section)<=
br>
or handle explicit sync with sync_file (again link would be awesome).<br>
<br>
&gt; + */<br>
&gt;=C2=A0 struct dma_buf_sync {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @flags: Set of access flags<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - DMA_BUF_SYNC_START: Indicates the start of a=
 map access<br>
<br>
Bikeshed, but I think the item list format instead of bullet point list<br>
looks neater, e.g.=C2=A0 DOC: standard plane properties in drm_plane.c.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0session.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - DMA_BUF_SYNC_END: Indicates the end of a map=
 access session.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - DMA_BUF_SYNC_READ: Indicates that the mapped=
 DMA buffer will<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0be read by the client via the CPU =
map.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - DMA_BUF_SYNC_READ: Indicates that the mapped=
 DMA buffer will<br>
<br>
s/READ/WRITE/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0be written by the client via the C=
PU map.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - DMA_BUF_SYNC_RW: An alias for DMA_BUF_SYNC_R=
EAD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0DMA_BUF_SYNC_WRITE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
With the nits addressed: Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:d=
aniel.vetter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.31.1<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div><div><br></div>Best,<div>Sumit.<br clear=3D"all"><div><b=
r></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
Thanks and regards,<br><br>Sumit Semwal<br>Tech Lead - Android, Vertical Te=
chnologies<br>Linaro.org =E2=94=82 Open source software for ARM SoCs</div><=
/div></div></div>

--000000000000d1346005c34dd5ef--
