Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FD2883CC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237A6EC4E;
	Fri,  9 Oct 2020 07:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6196EC4E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:40:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p15so8789281wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Y3zs5MyaJjxQczfNdG639aNsJL9caNjvPlFIB7wLkR4=;
 b=Re2HuNR4YnSz2NNNx0wCdYgdO3XvW6JJk1F7OiVGrn7H8vssSl0sr4fDhbdmRek7Ob
 J7NoAQOhGdhrEZhb81ooLcdoy9d15p/ullIXVzaI4OqRYddo1OdWO05Kov+w+RPBeDG+
 RLewmnU6pYoax9iu9ChjqA0AFepC7dSXIWdc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Y3zs5MyaJjxQczfNdG639aNsJL9caNjvPlFIB7wLkR4=;
 b=j2pWvimQDU4ZI6oFcKSPDvmsgo/wG0G5zHyqwnjdSGCCXOEkookEl1/xM5sNe2+1ih
 0cV7wtinIaD1fdI0jKTyzfOiiaC5Doy4ndNrZ+nR719k1rSdy8c+PTq3kUruvAh7b2KV
 F4gf/6GZdM2KHikW5ndHquOhopUQDw2+FHshrXRlnoWZ8CoCcE0pa2xq45jdlYhSpo/a
 R/wcqH98U6anOLEnN5BGkYKCQG3Roc6Vm97unZiIo2EFI0FLhF2TklYQGTNbfPRUjkKC
 qR2A9gBTlAkhtPOKPrXFB8gh0RAXwlRpURN1jSu/DEVGSgTYiyh3Ml8uaVrcyxDCimcV
 Pxpw==
X-Gm-Message-State: AOAM533MmVMyuj0JSwIRMAvgncoJqWe+002WtXX0LOW/b1z9HnJ4D0UE
 p2JJcB5u8EShr7NubGJlSOXSgw==
X-Google-Smtp-Source: ABdhPJzEZVjAyzHt2mUFBrus7xHA9Fz2PHmYxtWRjXFp1GdZ9Yug82fj27NzQMq9vnHe30s/bBamAQ==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr12070681wml.134.1602229250051; 
 Fri, 09 Oct 2020 00:40:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n3sm10383741wmn.28.2020.10.09.00.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:40:49 -0700 (PDT)
Date: Fri, 9 Oct 2020 09:40:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
Message-ID: <20201009074047.GM438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
 <20201008140914.GF438822@phenom.ffwll.local>
 <20201008141419.GH438822@phenom.ffwll.local>
 <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:36:41AM +0200, Christian K=F6nig wrote:
> Am 08.10.20 um 16:14 schrieb Daniel Vetter:
> > On Thu, Oct 08, 2020 at 04:09:14PM +0200, Daniel Vetter wrote:
> > > On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian K=F6nig wrote:
> > > > We have reoccurring requests on this so better document that
> > > > this approach doesn't work and dma_buf_mmap() needs to be used inst=
ead.
> > > > =

> > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_prime.c | 7 ++++++-
> > > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prim=
e.c
> > > > index 4910c446db83..16fa2bfc271e 100644
> > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> > > >   /**
> > > >    * drm_prime_sg_to_page_addr_arrays - convert an sg table into a =
page array
> > > >    * @sgt: scatter-gather table to convert
> > > > - * @pages: optional array of page pointers to store the page array=
 in
> > > > + * @pages: deprecated array of page pointers to store the page arr=
ay in
> > > >    * @addrs: optional array to store the dma bus address of each pa=
ge
> > > >    * @max_entries: size of both the passed-in arrays
> > > >    *
> > > > @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> > > >    *
> > > >    * Drivers can use this in their &drm_driver.gem_prime_import_sg_=
table
> > > >    * implementation.
> > > > + *
> > > > + * Specifying the pages array is deprecated and strongly discourag=
ed for new
> > > > + * drivers. The pages array is only useful for page faults and tho=
se can
> > > > + * corrupt fields in the struct page if they are not handled by th=
e exporting
> > > > + * driver.
> > > >    */
> > > I'd make this a _lot_ stronger: Aside from amdgpu and radeon all driv=
ers
> > > using this only need it for the pages array. Imo just open-code the sg
> > > table walking loop in amdgpu/radeon (it's really not much code), and =
then
> > > drop the dma_addr_t parameter from this function here (it's set to NU=
LL by
> > > everyone else).
> > > =

> > > And then deprecate this entire function here with a big warning that =
a)
> > > dma_buf_map_attachment is allowed to leave the struct page pointers N=
ULL
> > > and b) this breaks mmap, users must call dma_buf_mmap instead.
> > > =

> > > Also maybe make it an uppercase DEPRECATED or something like that :-)
> > OK I just realized I missed nouveau. That would be 3 places where we ne=
ed
> > to stuff the dma_addr_t list into something ttm can take. Still feels
> > better than this half-deprecated function kludge ...
> =

> Mhm, I don't see a reason why nouveau would need the struct page either.
> =

> How about we split that up into two function?
> =

> One for converting the sg_table into a linear dma_addr array.
> =

> And one for converting the sg_table into a linear struct page array with a
> __deprecated attribute on it?

Yeah makes sense, since converting ttm to just use sgt iterations directly
everywhere is probably a bit too much. Maybe keep that converter in ttm
code, since outside of ttm the rough consensus is to converge on sgt for
handling buffers. Well, for those drivers not stuck on struct page arrays
:-)
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > -Daniel
> > > =

> > > >   int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct=
 page **pages,
> > > >   				     dma_addr_t *addrs, int max_entries)
> > > > -- =

> > > > 2.17.1
> > > > =

> > > -- =

> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
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
