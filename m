Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2C2D9BA0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50646E174;
	Mon, 14 Dec 2020 16:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF8E6E301
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:01:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t16so16952192wra.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xuAn2AWLkCbySGbNYHgaFvTH1KUCkQGoqqARemhHXts=;
 b=M5rqdhVemccRA4Ub1/bGlTFvIdgCI8kyDpzWUZrxheX9LPVPtFXOGokah3dktF4ank
 UaZLZ36qQi0BQ8FvkTw05lxCLOyCeDBj9FucBI5VIbvjaEcii9R10J+iZN5AtuB0iENE
 Xa7pWX104GmBzYTO1HFXg2Nu6+LhSNAA7W3BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xuAn2AWLkCbySGbNYHgaFvTH1KUCkQGoqqARemhHXts=;
 b=aJXOONp8/Bru66EqdnInTrKRa7X8b53xmR3w4TbYwuggSKhMhjxLFU8I7JyDorpgwq
 6Wu2O1iRX+WsMRp5ZHQ2CBe/tZZ1Tq8a17b4Qca/5o+zGJKQO0VLXg8YITdPXr9hRWUw
 a3hO+BtSG8pX4cIZmrMiTI33/37CV9spZF70rNq3REJN6TWt64PykXxg1dXWs7LzOVth
 87y89gIJIx4QFHUkj6WIb28iyv3KN9oRws9fty47OCg9mn3rZn2On14qiK4wqWnaSG6S
 GhewtJ1UfjrqQrsMBYlzHatQ7FJnOqyIyN5wrNBEOB8YoB/H3HOtxqIXvAUmPvHTNREp
 fQoQ==
X-Gm-Message-State: AOAM5317O2PIYlqhEHD9ea+i2Otie8m9afJBQdjppisBIb5SLGrX5URF
 CbU3qzMQXGdx8QpNl9Y0x4SuCw==
X-Google-Smtp-Source: ABdhPJxctEDGmgcO0tJRkf4x2MMbNwgGhzE9x1j21IqgC8EUS9EEyiRdDEZOiatQsWfdoTIT+lJboQ==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr30780291wrp.161.1607961706669; 
 Mon, 14 Dec 2020 08:01:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s13sm31174845wmj.28.2020.12.14.08.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 08:01:45 -0800 (PST)
Date: Mon, 14 Dec 2020 17:01:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] dma-buf: Remove kmap kerneldoc vestiges
Message-ID: <20201214160143.GZ401619@phenom.ffwll.local>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
 <9508713a-2a83-dd53-bddf-828a460e11cb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9508713a-2a83-dd53-bddf-828a460e11cb@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 11:33:10AM +0100, Christian K=F6nig wrote:
> Am 11.12.20 um 16:58 schrieb Daniel Vetter:
> > Also try to clarify a bit when dma_buf_begin/end_cpu_access should
> > be called.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   drivers/dma-buf/dma-buf.c | 20 ++++++++++++++------
> >   include/linux/dma-buf.h   | 25 +++++++++----------------
> >   2 files changed, 23 insertions(+), 22 deletions(-)
> > =

> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index e63684d4cd90..a12fdffa130f 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1001,15 +1001,15 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> >    *   vmalloc space might be limited and result in vmap calls failing.
> >    *
> >    *   Interfaces::
> > + *
> >    *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
> >    *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
> >    *
> >    *   The vmap call can fail if there is no vmap support in the export=
er, or if
> > - *   it runs out of vmalloc space. Fallback to kmap should be implemen=
ted. Note
> > - *   that the dma-buf layer keeps a reference count for all vmap acces=
s and
> > - *   calls down into the exporter's vmap function only when no vmappin=
g exists,
> > - *   and only unmaps it once. Protection against concurrent vmap/vunma=
p calls is
> > - *   provided by taking the dma_buf->lock mutex.
> > + *   it runs out of vmalloc space. Note that the dma-buf layer keeps a=
 reference
> > + *   count for all vmap access and calls down into the exporter's vmap=
 function
> > + *   only when no vmapping exists, and only unmaps it once. Protection=
 against
> > + *   concurrent vmap/vunmap calls is provided by taking the &dma_buf.l=
ock mutex.
> =

> Who is talking the lock? The caller of the dma_buf_vmap/vunmap() function=
s,
> the functions itself or the callback inside the exporter?

That's the part I didn't change at all here, just re-laid out the line
breaking. I only removed the outdated kmap section here.

Should I do another patch and remove this one sentence here (it's kinda
pointless and generally we don't muse about implementation details that
callers don't care about)?

I did try and do a cursory review of the dma-buf docs, but this is kinda
not meant as an all-out revamp. Just a few things I've noticed while
reviewing Thomas' vmap_local stuff.
-Daniel

> =

> Christian.
> =

> >    *
> >    * - For full compatibility on the importer side with existing usersp=
ace
> >    *   interfaces, which might already support mmap'ing buffers. This i=
s needed in
> > @@ -1098,6 +1098,11 @@ static int __dma_buf_begin_cpu_access(struct dma=
_buf *dmabuf,
> >    * dma_buf_end_cpu_access(). Only when cpu access is braketed by both=
 calls is
> >    * it guaranteed to be coherent with other DMA access.
> >    *
> > + * This function will also wait for any DMA transactions tracked throu=
gh
> > + * implicit synchronization in &dma_buf.resv. For DMA transactions wit=
h explicit
> > + * synchronization this function will only ensure cache coherency, cal=
lers must
> > + * ensure synchronization with such DMA transactions on their own.
> > + *
> >    * Can return negative error values, returns 0 on success.
> >    */
> >   int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> > @@ -1199,7 +1204,10 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
> >    * This call may fail due to lack of virtual mapping address space.
> >    * These calls are optional in drivers. The intended use for them
> >    * is for mapping objects linear in kernel space for high use objects.
> > - * Please attempt to use kmap/kunmap before thinking about these inter=
faces.
> > + *
> > + * To ensure coherency users must call dma_buf_begin_cpu_access() and
> > + * dma_buf_end_cpu_access() around any cpu access performed through th=
is
> > + * mapping.
> >    *
> >    * Returns 0 on success, or a negative errno code otherwise.
> >    */
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index cf72699cb2bc..7eca37c8b10c 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -183,24 +183,19 @@ struct dma_buf_ops {
> >   	 * @begin_cpu_access:
> >   	 *
> >   	 * This is called from dma_buf_begin_cpu_access() and allows the
> > -	 * exporter to ensure that the memory is actually available for cpu
> > -	 * access - the exporter might need to allocate or swap-in and pin the
> > -	 * backing storage. The exporter also needs to ensure that cpu access=
 is
> > -	 * coherent for the access direction. The direction can be used by the
> > -	 * exporter to optimize the cache flushing, i.e. access with a differ=
ent
> > +	 * exporter to ensure that the memory is actually coherent for cpu
> > +	 * access. The exporter also needs to ensure that cpu access is coher=
ent
> > +	 * for the access direction. The direction can be used by the exporter
> > +	 * to optimize the cache flushing, i.e. access with a different
> >   	 * direction (read instead of write) might return stale or even bogus
> >   	 * data (e.g. when the exporter needs to copy the data to temporary
> >   	 * storage).
> >   	 *
> > -	 * This callback is optional.
> > +	 * Note that this is both called through the DMA_BUF_IOCTL_SYNC IOCTL
> > +	 * command for userspace mappings established through @mmap, and also
> > +	 * for kernel mappings established with @vmap.
> >   	 *
> > -	 * FIXME: This is both called through the DMA_BUF_IOCTL_SYNC command
> > -	 * from userspace (where storage shouldn't be pinned to avoid handing
> > -	 * de-factor mlock rights to userspace) and for the kernel-internal
> > -	 * users of the various kmap interfaces, where the backing storage mu=
st
> > -	 * be pinned to guarantee that the atomic kmap calls can succeed. Sin=
ce
> > -	 * there's no in-kernel users of the kmap interfaces yet this isn't a
> > -	 * real problem.
> > +	 * This callback is optional.
> >   	 *
> >   	 * Returns:
> >   	 *
> > @@ -216,9 +211,7 @@ struct dma_buf_ops {
> >   	 *
> >   	 * This is called from dma_buf_end_cpu_access() when the importer is
> >   	 * done accessing the CPU. The exporter can use this to flush caches=
 and
> > -	 * unpin any resources pinned in @begin_cpu_access.
> > -	 * The result of any dma_buf kmap calls after end_cpu_access is
> > -	 * undefined.
> > +	 * undo anything else done in @begin_cpu_access.
> >   	 *
> >   	 * This callback is optional.
> >   	 *
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
