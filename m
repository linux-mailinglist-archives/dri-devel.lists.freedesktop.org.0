Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7429505D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35BB6EB95;
	Wed, 21 Oct 2020 16:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7236EB95
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:05:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so3773868wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X5xBSx8P5vIQxkCMYnM437dWtqiOr6zduMIgB+XC5no=;
 b=k3pGiXfaYhwmyFPiJfTff9//+wABgo2btjGxtnGigvM3vnjzslUIqdDK2JEh3QcMcj
 su2QiVnkjuMUU9h70bZhBKeV4R/1MpCF4+OPwt3+/Lkjz0f5kLfaUvGqEXHZetdt1vjD
 OzbvOtzdG+G2yqwgOL+YY/nAQ3BoBYDvl4svw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X5xBSx8P5vIQxkCMYnM437dWtqiOr6zduMIgB+XC5no=;
 b=pPrWtt/L1ORTLpafcvocr4CvBRedhig81BB5wmBhgjvfn0NYjgULRXo4HrTnnwno+5
 PpOnTEzEcHAMSX8Z+gICXVg4znYfxSFjI5p7x/7RxQFDTQE4oP+bHGpVLScmOmYReMPq
 nMG6DOvOlJWoBMfpSpS3oju708XyWDZiBrnrFcnaHDwghDlpmzy1Pa4VHdsmulaZacjq
 N4LPC+kcUhk/7zyEjukPbw/MdrnNsIXEdfZwb0fBhg9MNK9hwWZHBfWVziMc3vm/hhUQ
 Fn0DSAvvFR8nN07I3b3voGFGuTar/7QPr90h+tyKfCVy+N5ngBHFlKVZI5l2UOfWx6CU
 OWXA==
X-Gm-Message-State: AOAM533sBYEZA1M8vxjQJzzlKnMIHeKVl7v84KxgVyzlQIAM/a+PgVor
 kWn9gVNbygMhdPckY9+LTtjEhP7RvODzfle4
X-Google-Smtp-Source: ABdhPJws0NKsCSXQU4/htmBw152X0Y8BoelW7Wp6AD1SUFJFYFbD+CzAT7Q9Zt1NShgKkEJvbdRt0A==
X-Received: by 2002:adf:f10e:: with SMTP id r14mr5324042wro.337.1603296302975; 
 Wed, 21 Oct 2020 09:05:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e15sm4456092wro.13.2020.10.21.09.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:05:02 -0700 (PDT)
Date: Wed, 21 Oct 2020 18:05:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm: Give irq_by_busid drm_legacy_ prefix
Message-ID: <20201021160500.GO401619@phenom.ffwll.local>
References: <20201008142927.2819321-1-daniel.vetter@ffwll.ch>
 <CADnq5_NedFqTz7k8LNOgC-XBUNta+dAR3H69h0WZPpndmTneDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NedFqTz7k8LNOgC-XBUNta+dAR3H69h0WZPpndmTneDA@mail.gmail.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 10:38:05AM -0400, Alex Deucher wrote:
> On Thu, Oct 8, 2020 at 10:29 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > It's the only ioctl handler purely for legacy drivers that didn't have
> > this yet.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks for reviewing, patch applied.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/drm_internal.h | 8 ++++----
> >  drivers/gpu/drm/drm_ioctl.c    | 2 +-
> >  drivers/gpu/drm/drm_pci.c      | 6 +++---
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index b65865c630b0..2bdac3557765 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -53,15 +53,15 @@ void drm_lastclose(struct drm_device *dev);
> >  #ifdef CONFIG_PCI
> >
> >  /* drm_pci.c */
> > -int drm_irq_by_busid(struct drm_device *dev, void *data,
> > -                    struct drm_file *file_priv);
> > +int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> > +                           struct drm_file *file_priv);
> >  void drm_pci_agp_destroy(struct drm_device *dev);
> >  int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
> >
> >  #else
> >
> > -static inline int drm_irq_by_busid(struct drm_device *dev, void *data,
> > -                                  struct drm_file *file_priv)
> > +static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> > +                                         struct drm_file *file_priv)
> >  {
> >         return -EINVAL;
> >  }
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index 87a44492957e..6def1621e32a 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -578,7 +578,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> >         DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
> >         DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
> >         DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
> > -       DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
> > +       DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
> >
> >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
> >
> > diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> > index c250fb5a88ca..6dba4b8ce4fe 100644
> > --- a/drivers/gpu/drm/drm_pci.c
> > +++ b/drivers/gpu/drm/drm_pci.c
> > @@ -139,7 +139,7 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
> >  }
> >
> >  /**
> > - * drm_irq_by_busid - Get interrupt from bus ID
> > + * drm_legacy_irq_by_busid - Get interrupt from bus ID
> >   * @dev: DRM device
> >   * @data: IOCTL parameter pointing to a drm_irq_busid structure
> >   * @file_priv: DRM file private.
> > @@ -150,8 +150,8 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int drm_irq_by_busid(struct drm_device *dev, void *data,
> > -                    struct drm_file *file_priv)
> > +int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
> > +                           struct drm_file *file_priv)
> >  {
> >         struct drm_irq_busid *p = data;
> >
> > --
> > 2.28.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
