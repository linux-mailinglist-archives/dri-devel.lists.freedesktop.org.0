Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589633A3537
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FBB6EDE2;
	Thu, 10 Jun 2021 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BEE6EDE2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:57:14 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id g142so1217792ybf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DpnSTeR7115bVWK3WvITtKQ3+i3DABz2B5xiwOPPFqI=;
 b=vawdFC4MorsrpAVm28Wap3hCr3Jw4mGFvAmk699Py2753ACI1HiV6kTgeWEhVaEHX3
 W0FtomLjGrbc07s6GbezckYK9nYtJeFQIu2j5dmPCjuHKekthx6ce+7uyg09JxrBbyMk
 8chiPrKuusR9pB7roXOXfr+GIIj4eBn5twZqv/rrL+l0nlrNjx2Sz53sJOV+YFTIWQ8U
 yH93xCgt8dPpEMYp/2QsAtDnOJzeXWOJGtge73Zlvd7p/EqXIA0SIX6IrVnhMnQWeO4i
 0tJD8ivikADazBTZ+R+n7odmWR4KbXPBLhq3x3IL5zdOfx+qe2eKdvgIz78LnHH57pD1
 DyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DpnSTeR7115bVWK3WvITtKQ3+i3DABz2B5xiwOPPFqI=;
 b=P8WlgiImU02oneq8wnGGn02MGaahlUfauX5RL0MvZvjYtHm6gkHN2czKYF+RHZ4vcF
 bwjB+5AkqXaDS4PUhjJ4J6veh3Hi1kDpfqbhGEjaHxGYfv/jNq00ePgnxARjQzotgc6S
 yEOXmBFsJPsUse7PICQQYD3XYqtLQw6w2SS6oPRyjOwNaNg1C8PBB+QQV1vAiVgkA4aq
 NoAiK+OxQVZDndIYrc17Zkfauk9X9CkF9daE+HsSCWqu+HDdVzNzpfEw4NI9oxfUM2p5
 /wlol1/sDWvX9sxBKImTXDNMRp69FQE2ciQY9Qujlzc9ER1Fy27ovZ3KDYJr5dEiUUwI
 UbOA==
X-Gm-Message-State: AOAM533KFq2DIZ2V8zWDfO/YRznQoeKO20jR58WK+U6xEFAVKUuDpo49
 /90t2ChTygsfDHIrvjknedsecQ9IUh3INSXPdHb3wA==
X-Google-Smtp-Source: ABdhPJxEVKKa0gKtt+vCKvho9tgUszHMdakQg5k5Ax2p8qzd4vDlXilVEfFx8l58fgiPfqf7SmMYdivMzJ7exAL1FB4=
X-Received: by 2002:a25:aba5:: with SMTP id v34mr1017767ybi.241.1623358633806; 
 Thu, 10 Jun 2021 13:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-5-jason@jlekstrand.net>
 <YK92j8b8SZ61KTCO@phenom.ffwll.local>
In-Reply-To: <YK92j8b8SZ61KTCO@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 15:57:02 -0500
Message-ID: <CAOFGe94uY7niows-zwCv2nb0bSVdJAB=rB0QPTeco5WdYcrdLQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: Document DMA_BUF_IOCTL_SYNC
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 5:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
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
> > ---
> >  Documentation/driver-api/dma-buf.rst |  8 +++++++
> >  include/uapi/linux/dma-buf.h         | 32 +++++++++++++++++++++++++++-
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 7f37ec30d9fd7..784f84fe50a5e 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -88,6 +88,9 @@ consider though:
> >  - The DMA buffer FD is also pollable, see `Implicit Fence Poll Support=
`_ below for
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
> > + * possible to guarantee coherency between the CPU-visible map and und=
erlying
> > + * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to br=
acket
> > + * any CPU access to give the kernel the chance to shuffle memory arou=
nd if
> > + * needed.
> > + *
> > + * Prior to accessing the map, the client should call DMA_BUF_IOCTL_SY=
NC
>
> s/should/must/
>
> > + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once=
 the
> > + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> > + * DMA_BUF_SYNC_END and the same read/write flags.
>
> I think we should make it really clear here that this is _only_ for cache
> coherency, and that furthermore if you want coherency with gpu access you
> either need to use poll() for implicit sync (link to the relevant section=
)
> or handle explicit sync with sync_file (again link would be awesome).

I've added such a comment.  I encourage you to look at v2 which I'll
be sending shortly.  I'm not sure how to get the poll() reference to
hyperlink, though.

> > + */
> >  struct dma_buf_sync {
> > +     /**
> > +      * @flags: Set of access flags
> > +      *
> > +      * - DMA_BUF_SYNC_START: Indicates the start of a map access
>
> Bikeshed, but I think the item list format instead of bullet point list
> looks neater, e.g.  DOC: standard plane properties in drm_plane.c.

Yeah, that's better.

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

Oops.

> > +      *   be written by the client via the CPU map.
> > +      *
> > +      * - DMA_BUF_SYNC_RW: An alias for DMA_BUF_SYNC_READ |
> > +      *   DMA_BUF_SYNC_WRITE.
> > +      */
>
> With the nits addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.=
ch>

Thanks!

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
