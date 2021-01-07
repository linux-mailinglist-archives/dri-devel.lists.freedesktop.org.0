Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0D2ED459
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E713F6E4B7;
	Thu,  7 Jan 2021 16:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FB76E4A2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 16:30:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m5so6223706wrx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 08:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7DZbfWQwEBtHFVTTRW9JwAWzOH08cxIhT5nfDRHECrA=;
 b=H5m2MTAbpcmBlCc1ZolAOaF6ox2ykf8lRDG5gdzUanBIDuo5nkpSIo2yQASOGIaHLS
 H8zVCeT4n8Aybxrk7OAN7TV289dXGsICaDONHR/UFl62YoDeWXC/qi0OG9Ju875brT6B
 XEZTUekcs7i6Vtjh122fHt5+jY7eB1zQV5yhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7DZbfWQwEBtHFVTTRW9JwAWzOH08cxIhT5nfDRHECrA=;
 b=beG/uNeooKi5lroxv4CVE4wrfH+N9w+1Ay4TO7W3vOKm7icHaPC0cQJmYd93GxGidB
 jJfDRcKtwOgUk/XI8mwpAST6KHTDDJ4lhO/mm0aRhheTi/IfN1gKBHDZF4deIjw4wBv9
 /JssHhKZIN1gg0b2He7/7HvvFaCFNwviYGD3qgiIeSncP587BAPGh8/IFxFM/m4Go2wv
 zZCsXb26RSNvHu/hjnF1oYWNsT5YLZbTzlNv+5l+8cZ5bSKaOlHW7HoUN0hQFauYbGiy
 HrFjDOhvdudgLrmkaKrFhJ02KHDCciSD+5+clUbAXz/xAVRpciyAe+HpQRKD2D36Rzh7
 KgPw==
X-Gm-Message-State: AOAM533KrGnRcOoYjUjKqs8HEYfiCsO8d5pnWSujRm2RpNouvWGfrr7/
 6d12/p0fpBYsYXFzLTajUlKnow==
X-Google-Smtp-Source: ABdhPJwUYCloeMmpy1rPIQcOkB8uQ2ump/XhiHjWAzJZDL+/ujPOOLEcu8z7nVtWaG1VJ4v7J9Q5tA==
X-Received: by 2002:adf:9b91:: with SMTP id d17mr9640142wrc.32.1610037055424; 
 Thu, 07 Jan 2021 08:30:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h14sm9079001wrx.37.2021.01.07.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 08:30:54 -0800 (PST)
Date: Thu, 7 Jan 2021 17:30:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Message-ID: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com, christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodzovsky wrote:
> =

> On 1/7/21 11:21 AM, Daniel Vetter wrote:
> > On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andrey Grodzovsky wrote:
> > > On 11/23/20 3:01 AM, Christian K=F6nig wrote:
> > > > Am 23.11.20 um 05:54 schrieb Andrey Grodzovsky:
> > > > > On 11/21/20 9:15 AM, Christian K=F6nig wrote:
> > > > > > Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> > > > > > > Will be used to reroute CPU mapped BO's page faults once
> > > > > > > device is removed.
> > > > > > Uff, one page for each exported DMA-buf? That's not something w=
e can do.
> > > > > > =

> > > > > > We need to find a different approach here.
> > > > > > =

> > > > > > Can't we call alloc_page() on each fault and link them together
> > > > > > so they are freed when the device is finally reaped?
> > > > > =

> > > > > For sure better to optimize and allocate on demand when we reach
> > > > > this corner case, but why the linking ?
> > > > > Shouldn't drm_prime_gem_destroy be good enough place to free ?
> > > > I want to avoid keeping the page in the GEM object.
> > > > =

> > > > What we can do is to allocate a page on demand for each fault and l=
ink
> > > > the together in the bdev instead.
> > > > =

> > > > And when the bdev is then finally destroyed after the last applicat=
ion
> > > > closed we can finally release all of them.
> > > > =

> > > > Christian.
> > > =

> > > Hey, started to implement this and then realized that by allocating a=
 page
> > > for each fault indiscriminately
> > > we will be allocating a new page for each faulting virtual address wi=
thin a
> > > VA range belonging the same BO
> > > and this is obviously too much and not the intention. Should I instea=
d use
> > > let's say a hashtable with the hash
> > > key being faulting BO address to actually keep allocating and reusing=
 same
> > > dummy zero page per GEM BO
> > > (or for that matter DRM file object address for non imported BOs) ?
> > Why do we need a hashtable? All the sw structures to track this should
> > still be around:
> > - if gem_bo->dma_buf is set the buffer is currently exported as a dma-b=
uf,
> >    so defensively allocate a per-bo page
> > - otherwise allocate a per-file page
> =

> =

> That exactly what we have in current implementation
> =

> =

> > =

> > Or is the idea to save the struct page * pointer? That feels a bit like
> > over-optimizing stuff. Better to have a simple implementation first and
> > then tune it if (and only if) any part of it becomes a problem for norm=
al
> > usage.
> =

> =

> Exactly - the idea is to avoid adding extra pointer to drm_gem_object,
> Christian suggested to instead keep a linked list of dummy pages to be
> allocated on demand once we hit a vm_fault. I will then also prefault the=
 entire
> VA range from vma->vm_end - vma->vm_start to vma->vm_end and map them
> to that single dummy page.

This strongly feels like premature optimization. If you're worried about
the overhead on amdgpu, pay down the debt by removing one of the redundant
pointers between gem and ttm bo structs (I think we still have some) :-)

Until we've nuked these easy&obvious ones we shouldn't play "avoid 1
pointer just because" games with hashtables.
-Daniel

> =

> Andrey
> =

> =

> > -Daniel
> > =

> > > Andrey
> > > =

> > > =

> > > > > Andrey
> > > > > =

> > > > > =

> > > > > > Regards,
> > > > > > Christian.
> > > > > > =

> > > > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > > > ---
> > > > > > >  =A0 drivers/gpu/drm/drm_file.c=A0 |=A0 8 ++++++++
> > > > > > >  =A0 drivers/gpu/drm/drm_prime.c | 10 ++++++++++
> > > > > > >  =A0 include/drm/drm_file.h=A0=A0=A0=A0=A0 |=A0 2 ++
> > > > > > >  =A0 include/drm/drm_gem.h=A0=A0=A0=A0=A0=A0 |=A0 2 ++
> > > > > > >  =A0 4 files changed, 22 insertions(+)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm=
_file.c
> > > > > > > index 0ac4566..ff3d39f 100644
> > > > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > > > @@ -193,6 +193,12 @@ struct drm_file *drm_file_alloc(struct d=
rm_minor *minor)
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_prime_destr=
oy;
> > > > > > >  =A0=A0=A0=A0=A0 }
> > > > > > >  =A0 +=A0=A0=A0 file->dummy_page =3D alloc_page(GFP_KERNEL | =
__GFP_ZERO);
> > > > > > > +=A0=A0=A0 if (!file->dummy_page) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENOMEM;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 goto out_prime_destroy;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > >  =A0=A0=A0=A0=A0 return file;
> > > > > > >  =A0 =A0 out_prime_destroy:
> > > > > > > @@ -289,6 +295,8 @@ void drm_file_free(struct drm_file *file)
> > > > > > >  =A0=A0=A0=A0=A0 if (dev->driver->postclose)
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 dev->driver->postclose(dev, file=
);
> > > > > > >  =A0 +=A0=A0=A0 __free_page(file->dummy_page);
> > > > > > > +
> > > > > > >  =A0=A0=A0=A0=A0 drm_prime_destroy_file_private(&file->prime);
> > > > > > >  =A0 =A0=A0=A0=A0=A0 WARN_ON(!list_empty(&file->event_list));
> > > > > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/dr=
m_prime.c
> > > > > > > index 1693aa7..987b45c 100644
> > > > > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > > > > @@ -335,6 +335,13 @@ int drm_gem_prime_fd_to_handle(struct dr=
m_device *dev,
> > > > > > >  =A0 =A0=A0=A0=A0=A0 ret =3D drm_prime_add_buf_handle(&file_p=
riv->prime,
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_buf, *handle);
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (!ret) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 obj->dummy_page =3D alloc_page(GFP_KER=
NEL | __GFP_ZERO);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (!obj->dummy_page)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENOMEM;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > >  =A0=A0=A0=A0=A0 mutex_unlock(&file_priv->prime.lock);
> > > > > > >  =A0=A0=A0=A0=A0 if (ret)
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto fail;
> > > > > > > @@ -1020,6 +1027,9 @@ void drm_prime_gem_destroy(struct
> > > > > > > drm_gem_object *obj, struct sg_table *sg)
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_buf_unmap_attachment(attach,=
 sg, DMA_BIDIRECTIONAL);
> > > > > > >  =A0=A0=A0=A0=A0 dma_buf =3D attach->dmabuf;
> > > > > > >  =A0=A0=A0=A0=A0 dma_buf_detach(attach->dmabuf, attach);
> > > > > > > +
> > > > > > > +=A0=A0=A0 __free_page(obj->dummy_page);
> > > > > > > +
> > > > > > >  =A0=A0=A0=A0=A0 /* remove the reference */
> > > > > > >  =A0=A0=A0=A0=A0 dma_buf_put(dma_buf);
> > > > > > >  =A0 }
> > > > > > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > > > > > index 716990b..2a011fc 100644
> > > > > > > --- a/include/drm/drm_file.h
> > > > > > > +++ b/include/drm/drm_file.h
> > > > > > > @@ -346,6 +346,8 @@ struct drm_file {
> > > > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > > >  =A0=A0=A0=A0=A0 struct drm_prime_file_private prime;
> > > > > > >  =A0 +=A0=A0=A0 struct page *dummy_page;
> > > > > > > +
> > > > > > >  =A0=A0=A0=A0=A0 /* private: */
> > > > > > >  =A0 #if IS_ENABLED(CONFIG_DRM_LEGACY)
> > > > > > >  =A0=A0=A0=A0=A0 unsigned long lock_count; /* DRI1 legacy loc=
k count */
> > > > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > > > index 337a483..76a97a3 100644
> > > > > > > --- a/include/drm/drm_gem.h
> > > > > > > +++ b/include/drm/drm_gem.h
> > > > > > > @@ -311,6 +311,8 @@ struct drm_gem_object {
> > > > > > >  =A0=A0=A0=A0=A0=A0 *
> > > > > > >  =A0=A0=A0=A0=A0=A0 */
> > > > > > >  =A0=A0=A0=A0=A0 const struct drm_gem_object_funcs *funcs;
> > > > > > > +
> > > > > > > +=A0=A0=A0 struct page *dummy_page;
> > > > > > >  =A0 };
> > > > > > >  =A0 =A0 /**
> > > > > _______________________________________________
> > > > > amd-gfx mailing list
> > > > > amd-gfx@lists.freedesktop.org
> > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%=
7CAndrey.Grodzovsky%40amd.com%7C3997b06c55f64db960ee08d8b3285ad4%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637456333209139294%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3DOrg1D62C0GXyVn6rW8SnAkhhX8xvJXFCqA5zqyaR%2BeU%3D&amp;reserved=
=3D0
> > > > > =

> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7C=
Andrey.Grodzovsky%40amd.com%7C3997b06c55f64db960ee08d8b3285ad4%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637456333209149289%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DWcnuJGZg%2B8jysOk2nTN9jXeyFkhauxMr4ajQYjP39zQ%3D&amp;reserved=
=3D0
> > > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
