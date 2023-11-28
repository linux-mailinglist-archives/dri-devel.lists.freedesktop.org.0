Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC77FC038
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD0410E58C;
	Tue, 28 Nov 2023 17:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52D310E18B;
 Tue, 28 Nov 2023 17:22:35 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1ef36a04931so3756746fac.2; 
 Tue, 28 Nov 2023 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701192155; x=1701796955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzkeMKrJwAap8TpqgWRyHUD01UHrQB9D2F34aPGr/tU=;
 b=Pwt6Z5CftBV3+osWqApRBbddOfgFKPoE+GmglMu3fVqZuPD4173s5iXg6d8/XXfjND
 6bCJeD2thn9omjHYPqXo4YYd/RatX1gmG9lyPja3exzSyBTGhTZ7KsRYQGUQhMAEGj14
 W7GMV3JHjRelES9KgQFCu31ee6xl4q/M8sdGMtByuKw8woIwIQyNcWd356oq47klVvW9
 f1Hq+tO9VAcO4ZvskGLdyU2VtoS94eupg3Hjt8OQ4mty0Ml2AArX+mV8ys1I49boLvJQ
 4xn+5NWY/rMSQLJSi1abu4CVgmTp80D9zXaqxg4jAPxDX8YXigkR9iMWe5qUqfq+8IYg
 kgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701192155; x=1701796955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzkeMKrJwAap8TpqgWRyHUD01UHrQB9D2F34aPGr/tU=;
 b=oKKAu+GjBjxQ6VTlSEVMX5IX+5pWEYA78fxgf/8CmeTSbBa3Rirr4ud4oB2Ffj+Oad
 rt3DEkHqp8sID3Wn47f7ncg8Ti5f4dhtd3/LQ9ylNfRfy9DulgLwfH/ASunr2ObhcKDu
 ta1pePFl+0LfnJm+2mKIa/Sr3NVnrRO0GpP+K0gvxlbOLeEsBrNEdK3a9Lun7LK6Objo
 QypVg1Azyra6NsJTE3p0ZVRdDnQnS8XJy13OaPEskpcC3U05Dyy3aW3/VyychQRz5+wI
 YYVG84a9f8P9gxnB1DbCMxo3mBJOjd+BNwEKzd3jdLGu8Qz3Q6FgRXjNLCIiMYJIKBjD
 8mPA==
X-Gm-Message-State: AOJu0YzKvqQHWLSGDBtJX1Nmhru8FglhOR/0d4DgcymnxkXkpy1nN0i9
 wIAV0hB7wyMEm49fDkcw+6dQ3EveRJ58vtrI9B4=
X-Google-Smtp-Source: AGHT+IHx7OJmyQW4PfkOMGg+fvIN+/N2DSbzoe5jpapEq1fRxK1caMtkCHOIlaExdJWvHsPN4UjuHdlfPAH1AwXvqqA=
X-Received: by 2002:a05:6870:5e48:b0:1fa:14e9:43ce with SMTP id
 ne8-20020a0568705e4800b001fa14e943cemr16091904oac.50.1701192154984; Tue, 28
 Nov 2023 09:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
In-Reply-To: <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Nov 2023 12:22:23 -0500
Message-ID: <CADnq5_Noy86ts4y3a2pns7U=biiFdLFjbYtq9sLaEsiXhLnNzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 6:12=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com> wrote:
>
> [+Alex]
>
> On 2023-11-17 16:44, Felix Kuehling wrote:
>
> > This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
> >
> > These helper functions are needed for KFD to export and import DMABufs
> > the right way without duplicating the tracking of DMABufs associated wi=
th
> > GEM objects while ensuring that move notifier callbacks are working as
> > intended.
> >
> > CC: Christian K=C3=B6nig <christian.koenig@amd.com>
> > CC: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Re: our discussion about v2 of this patch: If this version is
> acceptable, can I get an R-b or A-b?
>
> I would like to get this patch into drm-next as a prerequisite for
> patches 2 and 3. I cannot submit it to the current amd-staging-drm-next
> because the patch I'm reverting doesn't exist there yet.
>
> Patch 2 and 3 could go into drm-next as well, or go through Alex's
> amd-staging-drm-next branch once patch 1 is in drm-next. Alex, how do
> you prefer to coordinate this?

I guess ideally this would go through my drm-next tree since your
other patches depend on it unless others feel strongly that it should
go through drm-misc.

Alex


>
> Regards,
>    Felix
>
>
> > ---
> >   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
> >   include/drm/drm_prime.h     |  7 +++++++
> >   2 files changed, 25 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 63b709a67471..834a5e28abbe 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf=
)
> >   }
> >   EXPORT_SYMBOL(drm_gem_dmabuf_release);
> >
> > -/*
> > +/**
> >    * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
> >    * @dev: drm_device to import into
> >    * @file_priv: drm file-private structure
> > @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
> >    *
> >    * Returns 0 on success or a negative error code on failure.
> >    */
> > -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> > -                                   struct drm_file *file_priv, int pri=
me_fd,
> > -                                   uint32_t *handle)
> > +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> > +                            struct drm_file *file_priv, int prime_fd,
> > +                            uint32_t *handle)
> >   {
> >       struct dma_buf *dma_buf;
> >       struct drm_gem_object *obj;
> > @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_de=
vice *dev,
> >       dma_buf_put(dma_buf);
> >       return ret;
> >   }
> > +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
> >
> >   int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
> >                                struct drm_file *file_priv)
> > @@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(s=
truct drm_device *dev,
> >       return dmabuf;
> >   }
> >
> > -/*
> > +/**
> >    * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
> >    * @dev: dev to export the buffer from
> >    * @file_priv: drm file-private structure
> > @@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object=
(struct drm_device *dev,
> >    * The actual exporting from GEM object to a dma-buf is done through =
the
> >    * &drm_gem_object_funcs.export callback.
> >    */
> > -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> > -                                   struct drm_file *file_priv, uint32_=
t handle,
> > -                                   uint32_t flags,
> > -                                   int *prime_fd)
> > +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> > +                            struct drm_file *file_priv, uint32_t handl=
e,
> > +                            uint32_t flags,
> > +                            int *prime_fd)
> >   {
> >       struct drm_gem_object *obj;
> >       int ret =3D 0;
> > @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_de=
vice *dev,
> >
> >       return ret;
> >   }
> > +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
> >
> >   int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
> >                                struct drm_file *file_priv)
> > @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
> >    * @obj: GEM object to export
> >    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
> >    *
> > - * This is the implementation of the &drm_gem_object_funcs.export func=
tions
> > - * for GEM drivers using the PRIME helpers. It is used as the default =
for
> > - * drivers that do not set their own.
> > + * This is the implementation of the &drm_gem_object_funcs.export func=
tions for GEM drivers
> > + * using the PRIME helpers. It is used as the default in
> > + * drm_gem_prime_handle_to_fd().
> >    */
> >   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
> >                                    int flags)
> > @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
> >    * @dev: drm_device to import into
> >    * @dma_buf: dma-buf object to import
> >    *
> > - * This is the implementation of the gem_prime_import functions for GE=
M
> > - * drivers using the PRIME helpers. It is the default for drivers that=
 do
> > - * not set their own &drm_driver.gem_prime_import.
> > + * This is the implementation of the gem_prime_import functions for GE=
M drivers
> > + * using the PRIME helpers. Drivers can use this as their
> > + * &drm_driver.gem_prime_import implementation. It is used as the defa=
ult
> > + * implementation in drm_gem_prime_fd_to_handle().
> >    *
> >    * Drivers must arrange to call drm_prime_gem_destroy() from their
> >    * &drm_gem_object_funcs.free hook when using this function.
> > diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> > index a7abf9f3e697..2a1d01e5b56b 100644
> > --- a/include/drm/drm_prime.h
> > +++ b/include/drm/drm_prime.h
> > @@ -60,12 +60,19 @@ enum dma_data_direction;
> >
> >   struct drm_device;
> >   struct drm_gem_object;
> > +struct drm_file;
> >
> >   /* core prime functions */
> >   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
> >                                     struct dma_buf_export_info *exp_inf=
o);
> >   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
> >
> > +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> > +                            struct drm_file *file_priv, int prime_fd, =
uint32_t *handle);
> > +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> > +                            struct drm_file *file_priv, uint32_t handl=
e, uint32_t flags,
> > +                            int *prime_fd);
> > +
> >   /* helper functions for exporting */
> >   int drm_gem_map_attach(struct dma_buf *dma_buf,
> >                      struct dma_buf_attachment *attach);
