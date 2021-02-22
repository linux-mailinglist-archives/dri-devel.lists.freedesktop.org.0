Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C724321CB5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B436E56A;
	Mon, 22 Feb 2021 16:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFE86E56A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:21:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v15so19717473wrx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4mQ9GAsz9Yz8HOTAKFDmDSdVZkxoH9s3m94s7cqHoDM=;
 b=jVSuyDLnGNmgl65vf/QLVlvy9dhtnh469nDCfcUpAIAsCc7V/rm9rhU8Cuml6qDhqO
 vRb02ed5h6NiVAlzwbPWzQ9S6KRV7+pn5E3P6ImNGDmx0G/vwMyN2hHp/trvMGcCsjzn
 wGd14SttIPsMBOYYjhkRTl7rwKNNuLd6Z4FPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4mQ9GAsz9Yz8HOTAKFDmDSdVZkxoH9s3m94s7cqHoDM=;
 b=QYEYGSEZdbc0HvlCsjz3zaGMP2EnBiG43Cx12tQQRpMlRc+SpyOL7TKyo6phl00YJp
 /RP2/ssmEPEg/BocuqlwGBcZbSftxcgFpDmcMf/2DxDhaIlX6d7+yQJ1f9Gfd75UzFu5
 LfKzA4F9L6+Q97NtAAsQXj+lbN7Lx/ccMlItFhJOJfMQiiWowFGdGXAtVCVBCTprD6ZF
 r5g99v3P9sDEToht4L3T0GcPu9SyekdkWL+Utmw0w6aRqSZj6y4BgwWNnO6G+lx+Wze9
 W5zpr2kA2UQsJOf2hQHr9pXT2YFkXUlos6tHUTvK+2jwTMPG3Zy3wOK6IG3rwzEdPIAN
 zgeQ==
X-Gm-Message-State: AOAM533AcI/F6v9Baa05qWAlBv7pX7rv9YJTggRhacPbcx3rw/CsCOMQ
 G7FUI0E7959rXZYbg7psgrCAnfDP5MJzSA==
X-Google-Smtp-Source: ABdhPJy4jIVtSRNvns/I1XgheLFS4UBrjfcND28jyB/HEbAE1Vq7TlNEGZLxKUpzG72DhdA7eti9yg==
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr8262097wrw.177.1614010905211; 
 Mon, 22 Feb 2021 08:21:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d20sm31336447wrc.12.2021.02.22.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:21:44 -0800 (PST)
Date: Mon, 22 Feb 2021 17:21:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
Message-ID: <YDPaFmG+swkP1QfJ@phenom.ffwll.local>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <8f3ea5bb-4bfa-a3de-2d45-ec7110338587@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f3ea5bb-4bfa-a3de-2d45-ec7110338587@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 03:24:17PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 17.02.21 um 17:59 schrieb Neil Roberts:
> > When mmapping the shmem, it would previously adjust the pgoff in the
> > vm_area_struct to remove the fake offset that is added to be able to
> > identify the buffer. This patch removes the adjustment and makes the
> > fault handler use the vm_fault address to calculate the page offset
> > instead. Although using this address is apparently discouraged, several
> > DRM drivers seem to be doing it anyway.
> > =

> > The problem with removing the pgoff is that it prevents
> > drm_vma_node_unmap from working because that searches the mapping tree
> > by address. That doesn't work because all of the mappings are at offset
> > 0. drm_vma_node_unmap is being used by the shmem helpers when purging
> > the buffer.
> =

> I just want to ask if this is how the mmap callbacks are supposed to work
> now?
> =

> I have a number of patches in here that convert several drivers to the GEM
> object's mmap callback. They might not be affected by the vm_pgoff bug, b=
ut
> I'd like to submit something that could work in the longer term.

Yeah we pretty much require the uniq vm_pgoff for runtime unmapping.
Especially with more dynamic memory managers like ttm that move buffers
around - for more static ones (most of the armsoc ones) it's just a bit a
security issue since you can potentially access memory after it's gone.
-Daniel

> Best regards
> Thomas
> =

> > =

> > It looks like panfrost is using drm_gem_shmem_purge so this might fix a
> > potential bug there.
> > =

> > Signed-off-by: Neil Roberts <nroberts@igalia.com>
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index 9825c378dfa6..4b14157f1962 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -526,11 +526,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_f=
ault *vmf)
> >   	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >   	loff_t num_pages =3D obj->size >> PAGE_SHIFT;
> >   	struct page *page;
> > +	pgoff_t page_offset;
> > -	if (vmf->pgoff >=3D num_pages || WARN_ON_ONCE(!shmem->pages))
> > +	/* We don't use vmf->pgoff since that has the fake offset */
> > +	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +
> > +	if (page_offset < 0 || page_offset >=3D num_pages ||
> > +	    WARN_ON_ONCE(!shmem->pages))
> >   		return VM_FAULT_SIGBUS;
> > -	page =3D shmem->pages[vmf->pgoff];
> > +	page =3D shmem->pages[page_offset];
> >   	return vmf_insert_page(vma, vmf->address, page);
> >   }
> > @@ -581,9 +586,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
> >   	struct drm_gem_shmem_object *shmem;
> >   	int ret;
> > -	/* Remove the fake offset */
> > -	vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
> > -
> >   	if (obj->import_attach) {
> >   		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> >   		drm_gem_object_put(obj);
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
