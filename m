Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273CB19D247
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 10:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73C6E217;
	Fri,  3 Apr 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9916E247
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 08:32:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f6so6731997wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=At8sSIc806Hse8GwwvxColRQIHchAyJQdaYFJ9Ur+6A=;
 b=gB0RAbdpuPmhDh8TNpLk/DY70NyY7rBNfqJZShUBaqz7mMfB0camm2aSyG8gakGNCk
 0FIHODl/UHaEoGbKjuAlJLB4Lu5/L8027QrXq70uSjBNI7QhJ439R24vEFGjk74QfKpT
 MmPwBk+uxaO/lmEJLi7PHzQ/x5UYrhv9yk5G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=At8sSIc806Hse8GwwvxColRQIHchAyJQdaYFJ9Ur+6A=;
 b=fuWndb6yM1WdqwWpFT0kxzwyRZO6Aa1V5hhBjzVkoO+h92cokqPF8BYcDyp+M6qqGA
 6BdTlrP7o2hswEEkOJsbYq8UIg02wmPMB7r49VQnR9MJ47KtK8OLukC089U7Q+ixZjbQ
 uh1HVqkLY3ODO6OzJ9+oUV2upfnApVRpQv7MwvffzsZzengfDfEVqy077gyCOFniWkSB
 ZGVJUGrFl8+IZmAL9s69/wGTe+IpC9ynCqUcUkSG0kMUD1sTrnXq4ZdtvCwDfvgJLvJR
 QqMp3sFwe3jYNJLUPkQ8jvyM3YIFopK7xQyU9z+W1NPOOGvgi3o+glxgfKLeYXBIti51
 Wm0g==
X-Gm-Message-State: AGi0PuZQAAyYFdEgcWa7ab9IC1HSfsDO91r5pILCwfkD3ur29WoOkx7d
 UzGYmoclgOfHDEGouPW3W4sQqw==
X-Google-Smtp-Source: APiQypJHhwc18QFjz5o3a4OCVO6AhuKda1bPEwknUbs5tQxFuNFNLx4wX+t1pkklF2EaDAoWLRuXIw==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr7922848wma.83.1585902742891;
 Fri, 03 Apr 2020 01:32:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm10774114wmf.3.2020.04.03.01.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 01:32:22 -0700 (PDT)
Date: Fri, 3 Apr 2020 10:32:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
Message-ID: <20200403083220.GT2363188@phenom.ffwll.local>
References: <20200330135536.2997-1-christian.koenig@amd.com>
 <20200401113446.GR2363188@phenom.ffwll.local>
 <14063C7AD467DE4B82DEDB5C278E8663FFFC63C1@fmsmsx107.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663FFFC63C1@fmsmsx107.amr.corp.intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 01, 2020 at 04:04:14PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Daniel Vetter
> >Sent: Wednesday, April 1, 2020 7:35 AM
> >To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> >Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> >Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
> >
> >On Mon, Mar 30, 2020 at 03:55:31PM +0200, Christian K=F6nig wrote:
> >> Add a peer2peer flag noting that the importer can deal with device
> >> resources which are not backed by pages.
> >>
> >> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> >> ---
> >>  drivers/dma-buf/dma-buf.c |  2 ++
> >>  include/linux/dma-buf.h   | 10 ++++++++++
> >>  2 files changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index ccc9eda1bc28..570c923023e6 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -690,6 +690,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf,
> >struct device *dev,
> >>
> >>  	attach->dev =3D dev;
> >>  	attach->dmabuf =3D dmabuf;
> >> +	if (importer_ops)
> >> +		attach->peer2peer =3D importer_ops->allow_peer2peer;
> >
> >So an idea that crossed my mind to validate this, since we need quite so=
me
> >bad amounts of bad luck if someone accidentally introduces and access to
> >struct_page in sg lists in some slowpath.
> >
> >On map_sg, if ->peer2peer is set, we could mangle the struct_page
> >pointers, e.g. swap high bits for low bits (so that NULL stays NULL). On
> >unmap_sg we obviously need to undo that, in case the exporter needs those
> >pointers for its own book-keeping for some reason. I was also pondering
> >just setting them all to NULL, but that might break some exporters. With
> >the pointer mangling trick (especially if we flip high for low bits on 64
> >where this should result in invalid addresses in almost all cases) we
> >should be able to catch buggy p2p importers quite quickly.
> =

> The scatter list usage of the struct page pointer has other information i=
n the
> lower bits for keeping track of linking and other stuff.  Swizzling the p=
age
> pointers will probably make the scatter list unusable.

We'd need to swizzle only the pointers that are actual struct page
pointers. Plus keep the low bits as-is, and maybe only flip the top-most
60 bits or so. Doesn't break the idea fundamentally I think.
-Daniel

> =

> Mike
> =

> >Thoughts? Maybe add as a follow-up patch for testing?
> >-Daniel
> >>  	attach->importer_ops =3D importer_ops;
> >>  	attach->importer_priv =3D importer_priv;
> >>
> >> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >> index 1ade486fc2bb..82e0a4a64601 100644
> >> --- a/include/linux/dma-buf.h
> >> +++ b/include/linux/dma-buf.h
> >> @@ -334,6 +334,14 @@ struct dma_buf {
> >>   * Attachment operations implemented by the importer.
> >>   */
> >>  struct dma_buf_attach_ops {
> >> +	/**
> >> +	 * @allow_peer2peer:
> >> +	 *
> >> +	 * If this is set to true the importer must be able to handle peer
> >> +	 * resources without struct pages.
> >> +	 */
> >> +	bool allow_peer2peer;
> >> +
> >>  	/**
> >>  	 * @move_notify
> >>  	 *
> >> @@ -362,6 +370,7 @@ struct dma_buf_attach_ops {
> >>   * @node: list of dma_buf_attachment, protected by dma_resv lock of t=
he
> >dmabuf.
> >>   * @sgt: cached mapping.
> >>   * @dir: direction of cached mapping.
> >> + * @peer2peer: true if the importer can handle peer resources without
> >pages.
> >>   * @priv: exporter specific attachment data.
> >>   * @importer_ops: importer operations for this attachment, if provided
> >>   * dma_buf_map/unmap_attachment() must be called with the dma_resv
> >lock held.
> >> @@ -382,6 +391,7 @@ struct dma_buf_attachment {
> >>  	struct list_head node;
> >>  	struct sg_table *sgt;
> >>  	enum dma_data_direction dir;
> >> +	bool peer2peer;
> >>  	const struct dma_buf_attach_ops *importer_ops;
> >>  	void *importer_priv;
> >>  	void *priv;
> >> --
> >> 2.17.1
> >>
> >
> >--
> >Daniel Vetter
> >Software Engineer, Intel Corporation
> >http://blog.ffwll.ch
> >_______________________________________________
> >dri-devel mailing list
> >dri-devel@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
