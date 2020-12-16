Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5355D2DBE9D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 11:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128C58984F;
	Wed, 16 Dec 2020 10:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAFF89842
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 10:29:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 91so22635501wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+2S4+s9iTlUkA+rD+TfXmUf258oCuXSlqXBKxTH4ifY=;
 b=UufF75+q6VDVD4ZOALHaq5W9GnuYSn/zsSOqkIlvqHY95TMj8qLZuF0Cei6ldsjBcO
 Ef88NFqAyQNJFytFGxN/XDR2auuUEGaNQ83w5oNTofutWrYvKpdsp9OydZ986fw9Vvw6
 LK5J9+4Ajl40jJ+yglaPEsdtDh2nKYxhVDdT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+2S4+s9iTlUkA+rD+TfXmUf258oCuXSlqXBKxTH4ifY=;
 b=ZdoVmtmB2dpjGg/dW3Hw5HgRYQ/o/afOTzdMI2X2rSSEr7QffbyHdROxrK1of9WFom
 n76XblKqa0ipyF3eX6m+PGA5e5SaHaancgprd0sFjI5OcpMcuXKCAdtEPyUjnOi4WrW2
 WAOMo+jqprTbRqqqAsit+EyAgum2Ct3MdQTShodbx5Wx9njpJGaa/UKlU5Ib2469emgX
 FJoXPecAZQOZV69a/2UGL4WzffoXsc+WW9nY0lOyr/EsbQ3sbRdBfgx3bgevErc5ep+l
 CWKwej0Ubu5FTnNucwk4ZquUTt5QqS3tGoT3ydEVbAZ2rI2hRSfNfy0s6iMuka/gW3rw
 7rdA==
X-Gm-Message-State: AOAM5339F59ZC7hhv9JAw0sj+AxTH//v+yLgtnbq4TI3VjTJldveXNdd
 KSvcrQszSerhTR0ChBS4EVT9Ug==
X-Google-Smtp-Source: ABdhPJw7Xr0YJ4hE8JPARxBK2CkHrdjlOAYU6pCgqI/McVj8vuPBy5nFNiN+TL0sNP/EAHl4ZXg8Rg==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr37945712wrm.360.1608114592051; 
 Wed, 16 Dec 2020 02:29:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u26sm2140822wmm.24.2020.12.16.02.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 02:29:51 -0800 (PST)
Date: Wed, 16 Dec 2020 11:29:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] dma-buf: Remove kmap kerneldoc vestiges
Message-ID: <X9nhnRtOSRsXwfF7@phenom.ffwll.local>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
 <9508713a-2a83-dd53-bddf-828a460e11cb@amd.com>
 <20201214160143.GZ401619@phenom.ffwll.local>
 <e0681309-c927-9b02-0d43-0853cd9bb9fb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0681309-c927-9b02-0d43-0853cd9bb9fb@amd.com>
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

On Tue, Dec 15, 2020 at 03:18:49PM +0100, Christian K=F6nig wrote:
> Am 14.12.20 um 17:01 schrieb Daniel Vetter:
> > On Mon, Dec 14, 2020 at 11:33:10AM +0100, Christian K=F6nig wrote:
> > > Am 11.12.20 um 16:58 schrieb Daniel Vetter:
> > > > Also try to clarify a bit when dma_buf_begin/end_cpu_access should
> > > > be called.
> > > > =

> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > ---
> > > >    drivers/dma-buf/dma-buf.c | 20 ++++++++++++++------
> > > >    include/linux/dma-buf.h   | 25 +++++++++----------------
> > > >    2 files changed, 23 insertions(+), 22 deletions(-)
> > > > =

> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index e63684d4cd90..a12fdffa130f 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -1001,15 +1001,15 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> > > >     *   vmalloc space might be limited and result in vmap calls fai=
ling.
> > > >     *
> > > >     *   Interfaces::
> > > > + *
> > > >     *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
> > > >     *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vadd=
r)
> > > >     *
> > > >     *   The vmap call can fail if there is no vmap support in the e=
xporter, or if
> > > > - *   it runs out of vmalloc space. Fallback to kmap should be impl=
emented. Note
> > > > - *   that the dma-buf layer keeps a reference count for all vmap a=
ccess and
> > > > - *   calls down into the exporter's vmap function only when no vma=
pping exists,
> > > > - *   and only unmaps it once. Protection against concurrent vmap/v=
unmap calls is
> > > > - *   provided by taking the dma_buf->lock mutex.
> > > > + *   it runs out of vmalloc space. Note that the dma-buf layer kee=
ps a reference
> > > > + *   count for all vmap access and calls down into the exporter's =
vmap function
> > > > + *   only when no vmapping exists, and only unmaps it once. Protec=
tion against
> > > > + *   concurrent vmap/vunmap calls is provided by taking the &dma_b=
uf.lock mutex.
> > > Who is talking the lock? The caller of the dma_buf_vmap/vunmap() func=
tions,
> > > the functions itself or the callback inside the exporter?
> > That's the part I didn't change at all here, just re-laid out the line
> > breaking. I only removed the outdated kmap section here.
> =

> I just wanted to point out that this still isn't described here very very.
> =

> =

> > Should I do another patch and remove this one sentence here (it's kinda
> > pointless and generally we don't muse about implementation details that
> > callers don't care about)?
> =

> Na, works like this for me.
> =

> > I did try and do a cursory review of the dma-buf docs, but this is kinda
> > not meant as an all-out revamp. Just a few things I've noticed while
> > reviewing Thomas' vmap_local stuff.
> =

> =

> Fell free to add an Acked-by: Christian K=F6nig <christian.koenig@amd.com=
> to
> the series.

Thanks for taking a look, and yeah I actually want to do a review of all
the dma-buf docs but just haven't found the quiet time for that yet.

Patches pushed to drm-misc-next.
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > Christian.
> > > =

> > > >     *
> > > >     * - For full compatibility on the importer side with existing u=
serspace
> > > >     *   interfaces, which might already support mmap'ing buffers. T=
his is needed in
> > > > @@ -1098,6 +1098,11 @@ static int __dma_buf_begin_cpu_access(struct=
 dma_buf *dmabuf,
> > > >     * dma_buf_end_cpu_access(). Only when cpu access is braketed by=
 both calls is
> > > >     * it guaranteed to be coherent with other DMA access.
> > > >     *
> > > > + * This function will also wait for any DMA transactions tracked t=
hrough
> > > > + * implicit synchronization in &dma_buf.resv. For DMA transactions=
 with explicit
> > > > + * synchronization this function will only ensure cache coherency,=
 callers must
> > > > + * ensure synchronization with such DMA transactions on their own.
> > > > + *
> > > >     * Can return negative error values, returns 0 on success.
> > > >     */
> > > >    int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> > > > @@ -1199,7 +1204,10 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
> > > >     * This call may fail due to lack of virtual mapping address spa=
ce.
> > > >     * These calls are optional in drivers. The intended use for them
> > > >     * is for mapping objects linear in kernel space for high use ob=
jects.
> > > > - * Please attempt to use kmap/kunmap before thinking about these i=
nterfaces.
> > > > + *
> > > > + * To ensure coherency users must call dma_buf_begin_cpu_access() =
and
> > > > + * dma_buf_end_cpu_access() around any cpu access performed throug=
h this
> > > > + * mapping.
> > > >     *
> > > >     * Returns 0 on success, or a negative errno code otherwise.
> > > >     */
> > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > > index cf72699cb2bc..7eca37c8b10c 100644
> > > > --- a/include/linux/dma-buf.h
> > > > +++ b/include/linux/dma-buf.h
> > > > @@ -183,24 +183,19 @@ struct dma_buf_ops {
> > > >    	 * @begin_cpu_access:
> > > >    	 *
> > > >    	 * This is called from dma_buf_begin_cpu_access() and allows the
> > > > -	 * exporter to ensure that the memory is actually available for c=
pu
> > > > -	 * access - the exporter might need to allocate or swap-in and pi=
n the
> > > > -	 * backing storage. The exporter also needs to ensure that cpu ac=
cess is
> > > > -	 * coherent for the access direction. The direction can be used b=
y the
> > > > -	 * exporter to optimize the cache flushing, i.e. access with a di=
fferent
> > > > +	 * exporter to ensure that the memory is actually coherent for cpu
> > > > +	 * access. The exporter also needs to ensure that cpu access is c=
oherent
> > > > +	 * for the access direction. The direction can be used by the exp=
orter
> > > > +	 * to optimize the cache flushing, i.e. access with a different
> > > >    	 * direction (read instead of write) might return stale or even=
 bogus
> > > >    	 * data (e.g. when the exporter needs to copy the data to tempo=
rary
> > > >    	 * storage).
> > > >    	 *
> > > > -	 * This callback is optional.
> > > > +	 * Note that this is both called through the DMA_BUF_IOCTL_SYNC I=
OCTL
> > > > +	 * command for userspace mappings established through @mmap, and =
also
> > > > +	 * for kernel mappings established with @vmap.
> > > >    	 *
> > > > -	 * FIXME: This is both called through the DMA_BUF_IOCTL_SYNC comm=
and
> > > > -	 * from userspace (where storage shouldn't be pinned to avoid han=
ding
> > > > -	 * de-factor mlock rights to userspace) and for the kernel-intern=
al
> > > > -	 * users of the various kmap interfaces, where the backing storag=
e must
> > > > -	 * be pinned to guarantee that the atomic kmap calls can succeed.=
 Since
> > > > -	 * there's no in-kernel users of the kmap interfaces yet this isn=
't a
> > > > -	 * real problem.
> > > > +	 * This callback is optional.
> > > >    	 *
> > > >    	 * Returns:
> > > >    	 *
> > > > @@ -216,9 +211,7 @@ struct dma_buf_ops {
> > > >    	 *
> > > >    	 * This is called from dma_buf_end_cpu_access() when the import=
er is
> > > >    	 * done accessing the CPU. The exporter can use this to flush c=
aches and
> > > > -	 * unpin any resources pinned in @begin_cpu_access.
> > > > -	 * The result of any dma_buf kmap calls after end_cpu_access is
> > > > -	 * undefined.
> > > > +	 * undo anything else done in @begin_cpu_access.
> > > >    	 *
> > > >    	 * This callback is optional.
> > > >    	 *
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
