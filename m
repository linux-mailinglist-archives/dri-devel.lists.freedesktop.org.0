Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50801FBC80
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 19:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1B6E92D;
	Tue, 16 Jun 2020 17:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0946E927
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 17:12:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r15so3882730wmh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QF77TfpXaCpf3AajPTPB0V47GnH1aes+zvHcWXvs9K8=;
 b=W6TaR11rZdjNqUvWs05Qj7o52M7gzYRcpZx4oVhmEEAftItipznpReFrtyAckjiUnG
 7rKYsWPyW7RSd0JJFadJS6HHiC0LNdfPLXfBIEnd6AS0MRydSTgV6P4l5r0GiCYxnCih
 ieTeuk4i+udLxaseqJ2ZG5iuFOyNw6xtkjDbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QF77TfpXaCpf3AajPTPB0V47GnH1aes+zvHcWXvs9K8=;
 b=OcjJJWCk57L5MpDG27NkkIf8PgXuIg7TZBbs4S4pT92+EFsXQtUBSjdURRltbOodPo
 eLlS74/Ru+8a9rs3nRYSFoaz3fCmkof6Ixu7Y9YIOsmSFTd5EdhPbZTGqMcvt5F8K3H7
 IC1wLyIbcs8cqa7s9hgoqp2hWaRFr1RcxMyzqX/Eaqdk8Rjdt+miccnXdP6DeWTm9bZY
 lmv0PARaakXNPYbGDxeHVzabM6intX8u1T0l3GQ6oEjgQMHhWY66HcDIqcNOMdL0ZVHR
 4AWapTbhN45yayT2IabR6XDh9oGu7SZK6wCOziCxJvyo2XiFClGDK7NN9WDC+zcLgX1I
 c/sw==
X-Gm-Message-State: AOAM531T3sbhHD0yrINvWKOg7hfqw/5oe/jKvNg6tCj+RKdK+Qk8SUu5
 XL76iIVqufYQi+BC9Xp/+tX2OQ==
X-Google-Smtp-Source: ABdhPJyN3MEIvR8P4WTKEICd/+HgfywI20Ewu7aFZR9PEYw6m3bu6J846GPih+JcjvV14aTdz7J24g==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr4227814wmb.69.1592327566302;
 Tue, 16 Jun 2020 10:12:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y14sm4556985wma.25.2020.06.16.10.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:12:45 -0700 (PDT)
Date: Tue, 16 Jun 2020 19:12:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Only dma-buf imports are private obj
Message-ID: <20200616171243.GQ20149@phenom.ffwll.local>
References: <20200616114723.2363268-1-daniel.vetter@ffwll.ch>
 <8c125158-fe7c-29a9-d9a8-9e6b418b6dd5@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c125158-fe7c-29a9-d9a8-9e6b418b6dd5@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 02:06:24PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 16.06.20 um 13:47 schrieb Daniel Vetter:
> > I broke that in my refactoring:
> > =

> > commit 7d2cd72a9aa3df3604cafd169a2d4a525afb68ca
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Fri May 29 16:05:42 2020 +0200
> > =

> >     drm/shmem-helpers: Simplify dma-buf importing
> > =

> > I'm not entirely sure of the history here, but I suspect that in one
> > of the rebases or when applying the patch I moved the hunk from
> > drm_gem_shmem_prime_import_sg_table(), where it should be, to
> > drm_gem_shmem_create_with_handle(), which is totally wrong.
> > =

> > Remedy this.
> > =

> > Thanks for Thomas for the crucual hint in debugging this.
> > =

> > Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Now also merged, thanks a lot for your help.
-Daniel

> =

> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index 0a7e3b664bc2..837e0840990c 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -377,7 +377,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *f=
ile_priv,
> >  	struct drm_gem_shmem_object *shmem;
> >  	int ret;
> >  =

> > -	shmem =3D __drm_gem_shmem_create(dev, size, true);
> > +	shmem =3D drm_gem_shmem_create(dev, size);
> >  	if (IS_ERR(shmem))
> >  		return shmem;
> >  =

> > @@ -730,7 +730,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_devi=
ce *dev,
> >  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> >  	struct drm_gem_shmem_object *shmem;
> >  =

> > -	shmem =3D drm_gem_shmem_create(dev, size);
> > +	shmem =3D __drm_gem_shmem_create(dev, size, true);
> >  	if (IS_ERR(shmem))
> >  		return ERR_CAST(shmem);
> >  =

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





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
