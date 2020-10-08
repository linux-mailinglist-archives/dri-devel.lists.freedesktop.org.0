Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2632875CE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8B6EA47;
	Thu,  8 Oct 2020 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E716EA47
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 14:14:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l15so6871520wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=SKpxYdUurmpOS5BkncePHyl2hsG1ycnDl5RK5GsXoXc=;
 b=fUX+sAvAlhLn8s9pMBv+CAJuKweXXzPXeQaXLLKXLzS93kfhlCTgAvIlGdaRzQ60Ej
 9iQX+6UZwIrYj21RORZgWLqnIxjjHHTZso4kF+xYv3yiS3nKviqo+RBzttefQD3uGI0n
 ypnYadZqRu/XN5JvDkbxL51lo817XHh2ps7SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=SKpxYdUurmpOS5BkncePHyl2hsG1ycnDl5RK5GsXoXc=;
 b=OQG6JsPG3C2a4Sisd9zg+pq/wC8+pOKerGj+hjrb0KO6FcyoIuSubGakcXxFILUtqc
 Jth1zS0SSAQZaXyCdgaLWvFVsA2DdeVd1faRW+95XTUickBaV+0ns9Lxi2cvZEnSYrWK
 OT42Lg+S3e4VP8TJbA+eX++QTI1b0vrrAUxLxB679+mIuIessteVkaySOt3vDuRJzAoq
 ojncHapfV8Dl25+2QRPIZ49UYhEwfslcrLESFB5pS723ephoz2FhpYHVwZonHHh+sk4Z
 LgApUEKIGIIF2632Kt72zbSLUaC/8TKM722Gorx7+ChgP6EiFemY25HT7GZy18BQcqIy
 UxFQ==
X-Gm-Message-State: AOAM530mYdyA3sAnOe1zIcqJz0Pt3KCXRsizltuXTI/L51r3qq61XUJN
 sIFxdrOeQdtML4nIwHmYXmIL78RIWs6jjjo/
X-Google-Smtp-Source: ABdhPJyZe4Z21U8phi7d2Xe/UNgxW53htdWoW10px59ECyLFlG/URS67GHq0loHUzd4W89hC8MwYlg==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr8613712wmf.113.1602166462550; 
 Thu, 08 Oct 2020 07:14:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x81sm7251502wmb.11.2020.10.08.07.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:14:21 -0700 (PDT)
Date: Thu, 8 Oct 2020 16:14:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
 airlied@redhat.com, akpm@linux-foundation.org, sumit.semwal@linaro.org
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
Message-ID: <20201008141419.GH438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
 airlied@redhat.com, akpm@linux-foundation.org,
 sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
 <20201008140914.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008140914.GF438822@phenom.ffwll.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 04:09:14PM +0200, Daniel Vetter wrote:
> On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian K=F6nig wrote:
> > We have reoccurring requests on this so better document that
> > this approach doesn't work and dma_buf_mmap() needs to be used instead.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/drm_prime.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 4910c446db83..16fa2bfc271e 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> >  /**
> >   * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page =
array
> >   * @sgt: scatter-gather table to convert
> > - * @pages: optional array of page pointers to store the page array in
> > + * @pages: deprecated array of page pointers to store the page array in
> >   * @addrs: optional array to store the dma bus address of each page
> >   * @max_entries: size of both the passed-in arrays
> >   *
> > @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> >   *
> >   * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
> >   * implementation.
> > + *
> > + * Specifying the pages array is deprecated and strongly discouraged f=
or new
> > + * drivers. The pages array is only useful for page faults and those c=
an
> > + * corrupt fields in the struct page if they are not handled by the ex=
porting
> > + * driver.
> >   */
> =

> I'd make this a _lot_ stronger: Aside from amdgpu and radeon all drivers
> using this only need it for the pages array. Imo just open-code the sg
> table walking loop in amdgpu/radeon (it's really not much code), and then
> drop the dma_addr_t parameter from this function here (it's set to NULL by
> everyone else).
> =

> And then deprecate this entire function here with a big warning that a)
> dma_buf_map_attachment is allowed to leave the struct page pointers NULL
> and b) this breaks mmap, users must call dma_buf_mmap instead.
> =

> Also maybe make it an uppercase DEPRECATED or something like that :-)

OK I just realized I missed nouveau. That would be 3 places where we need
to stuff the dma_addr_t list into something ttm can take. Still feels
better than this half-deprecated function kludge ...
-Daniel

> -Daniel
> =

> >  int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page=
 **pages,
> >  				     dma_addr_t *addrs, int max_entries)
> > -- =

> > 2.17.1
> > =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
