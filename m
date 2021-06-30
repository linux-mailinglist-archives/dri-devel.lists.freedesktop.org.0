Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848D3B849F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0586E9D6;
	Wed, 30 Jun 2021 14:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A46E9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 14:03:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l8so3745095wry.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4L/YzOdz1UhlcjDjuZ4a57T2ZSYXYD1IEbKqdPYi7mE=;
 b=AhR/T/KFkN52GfHwT6YLee5osZDTo6zo+d9eizkdJ1Tm6A3YgV4NquEJD9U+2kWnJL
 3Oh+XHVYVvHcVscrSMUkuFbNaqk2ZE7Gveq8aMLFxlRHYHkiU3yfI3eIDZByNwrS0KKg
 Mf0OP8kDuSNelRLEUEGvg+UkcMjipahEnSWAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4L/YzOdz1UhlcjDjuZ4a57T2ZSYXYD1IEbKqdPYi7mE=;
 b=ZLFxaTCD2issfWsx45dwBSM18xCMQkjbeBq8xBxYGa2LQuGhTj55qdzcAAVlttKMGb
 /KmGJg0gSitWWLZPbj9ZZM3qYCnSZlyMywngYtdXmdJzk71pv4c/eCnLCgqNrM+rindd
 IZLCgt4URg0RDWfSbwn3b3XhgMRZzQIZxtZxmtCQ4mltdbEYFBEiszyc7YUrqqUqw/ja
 U4c8IcPxmISVbMtxEqC8F/8L10+9AkF5UrrqmYUzC+PBud9eCp4bu4XjeKIDyUbLAzMn
 6kAB1Ck3xnETIoXOIQFUkUQGHT9l1iugQ2StiLrAD0LHweiVu4ND5+oS/ce2Id6RRe2h
 /kdQ==
X-Gm-Message-State: AOAM532YcDEVkFe7xmR2L+HR7MXKh3wwdt456eM/o1zQe7CQtnigZGPt
 5a509iX8HqHwwASUTh9Ojf+rdg==
X-Google-Smtp-Source: ABdhPJyd7UQiV69OHT6zzdlmoWE/dHKnkZwM/1xpCumOB9mf9zW+pUv3bKlg5VYdDkUmq4DIhfXPYQ==
X-Received: by 2002:a05:6000:1a8e:: with SMTP id
 f14mr40271682wry.61.1625061802520; 
 Wed, 30 Jun 2021 07:03:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t83sm4686972wmf.36.2021.06.30.07.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 07:03:22 -0700 (PDT)
Date: Wed, 30 Jun 2021 16:03:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
Message-ID: <YNx5qAoQz2WeyA6W@phenom.ffwll.local>
References: <20210630120215.930829-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YNxh1UZew73jE0vb@phenom.ffwll.local>
 <SN6PR11MB3421C4C9144583F681277273DF019@SN6PR11MB3421.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3421C4C9144583F681277273DF019@SN6PR11MB3421.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 12:46:27PM +0000, Surendrakumar Upadhyay, TejaskumarX wrote:
> 
> 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: 30 June 2021 17:52
> > To: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> > chris@chris-wilson.co.uk
> > Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
> > 
> > On Wed, Jun 30, 2021 at 05:32:15PM +0530, Tejas Upadhyay wrote:
> > > Having different alignment requirement by different drivers, 256B
> > > aligned should work for all drm drivers.
> > 
> > What.
> > 
> > Like yes vgem abuses dumb_create, but it's not a kms driver. Pitch is
> > meaningless, and that's why we align it minimally to 1 byte (bpp = bits per
> > pixel here).
> > 
> > Maybe start with explaining what you're trying to do here.
> > -Daniel
> > >
> 
> Igt tool tests which are trying to exercise tests through VGEM are getting failure (if not 64B aligned) on Intel platforms in creating framebuffer as they need them to be 64B aligned. Then 64B alignment is not 
> A requirement for all drm drivers.

Fix the tests. We're not going to encode alignment constraints for all kms
drivers in vgem, that's not what vgem is for.

Really what we should have done is just give vgem an ioctl to allocate a
buffer, with the size specified in bytes. Not this "abuse dumb_create"
business we're doing. But that's a past mistake, can't really fix that.
-Daniel

> 
> Thanks,
> Tejas
> 
> > > Signed-off-by: Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
> > > b/drivers/gpu/drm/vgem/vgem_drv.c index bf38a7e319d1..1da6df5e256a
> > > 100644
> > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > @@ -215,7 +215,7 @@ static int vgem_gem_dumb_create(struct drm_file
> > *file, struct drm_device *dev,
> > >  	struct drm_gem_object *gem_object;
> > >  	u64 pitch, size;
> > >
> > > -	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
> > > +	pitch = ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 256);
> > >  	size = args->height * pitch;
> > >  	if (size == 0)
> > >  		return -EINVAL;
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
