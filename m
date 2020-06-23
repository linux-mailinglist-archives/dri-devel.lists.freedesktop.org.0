Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F35204EFE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 12:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F92289F3B;
	Tue, 23 Jun 2020 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE2389F3B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 10:25:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o8so719595wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SsR6FQwwmnq/+dS6MRnZY15bS0QmvZtf2wyw/uhcAdo=;
 b=dgjwJHK9bSbAejHh6PiOq0h7HA/rXIxo5Q/d6MWMYUb02YhujbOp/inHjQ/DOxSfYy
 VIMttLA1HaRjQctBYGFZgBLkJpJDqKwgdty7wh0pEG/wv5VR5zF58rdHaVBHrCKL7pRV
 yXEiPZ9nMN420aUrCUt3po38uBiTFFHaKh6d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SsR6FQwwmnq/+dS6MRnZY15bS0QmvZtf2wyw/uhcAdo=;
 b=k5/jPDhQeIDnR5CRwRC/ko6dGR7AhUVCfFcu7AjOB9OBhEjJDgZuWKSuRoL54l5FmK
 Z2vQnj65e3Q5OqVGC0FYx+AGNjiEDUB8ktaIBp5dyxnSbajkuHidPh7AW3gKVX4ure35
 BHyMKjiB3GjvhMvEDeynFKOGXdfkWkV3tBF8nu+cpBphjQvqoqksreYFDJHMXwmASLlL
 0mjC0CcG+IBMb6ZCnEMCxdHks91VJfJrGfSqOild2gxIUNGVoBcZj0MbIgvAKlTee5VL
 A+pfFyJHCkBe6tNODaiGGW5615QdAj8dqpv+o/b6vQSMeAQHZv2AxnH0ukuC0vVx1eoE
 O9Mw==
X-Gm-Message-State: AOAM530xzJGLIOnEmn9rtl9ta8pQbc5ebYzA/icjp64wDaR76tpNCyoS
 RqTjr1GB4p1mY2PyD3A4k0HOcg==
X-Google-Smtp-Source: ABdhPJyGzUwlpF4bRX63iCyKM4T/+1QRpahJd4/6k5nsAuV68Qx55rSix7LcyRBjs2NEHBm3arqhJQ==
X-Received: by 2002:a1c:750e:: with SMTP id o14mr22885737wmc.86.1592907954397; 
 Tue, 23 Jun 2020 03:25:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm1951129wrg.70.2020.06.23.03.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:25:53 -0700 (PDT)
Date: Tue, 23 Jun 2020 12:25:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device
 address space
Message-ID: <20200623102551.GL20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094502.GB20149@phenom.ffwll.local>
 <3a365581-0f00-32de-6656-77348dcd0ea2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a365581-0f00-32de-6656-77348dcd0ea2@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 01:00:02AM -0400, Andrey Grodzovsky wrote:
> =

> On 6/22/20 5:45 AM, Daniel Vetter wrote:
> > On Sun, Jun 21, 2020 at 02:03:03AM -0400, Andrey Grodzovsky wrote:
> > > Helper function to be used to invalidate all BOs CPU mappings
> > > once device is removed.
> > > =

> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > This seems to be missing the code to invalidate all the dma-buf mmaps?
> > =

> > Probably needs more testcases if you're not yet catching this. Or am I
> > missing something, and we're exchanging the the address space also for
> > dma-buf?
> > -Daniel
> =

> =

> IMHO the device address space includes all user clients having a CPU view=
 of
> the BO either from direct mapping though drm file or by=A0 mapping through
> imported BO's FD.

Uh this is all very confusing and very much midlayer-y thanks to ttm.

I think a much better solution would be to have a core gem helper for
this (well not even gem really, this is core drm), which directly uses
drm_device->anon_inode->i_mapping.

Then
a) it clearly matches what drm_prime.c does on export
b) can be reused across all drivers, not just ttm

So much better.

What's more, we could then very easily make the generic
drm_dev_unplug_and_unmap helper I've talked about for the amdgpu patch,
which I think would be really neat&pretty.

Thoughts?
-Daniel

> =

> Andrey
> =

> =

> > =

> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo.c    | 8 ++++++--
> > >   include/drm/ttm/ttm_bo_driver.h | 7 +++++++
> > >   2 files changed, 13 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_b=
o.c
> > > index c5b516f..926a365 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -1750,10 +1750,14 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_o=
bject *bo)
> > >   	ttm_bo_unmap_virtual_locked(bo);
> > >   	ttm_mem_io_unlock(man);
> > >   }
> > > -
> > > -
> > >   EXPORT_SYMBOL(ttm_bo_unmap_virtual);
> > > +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev)
> > > +{
> > > +	unmap_mapping_range(bdev->dev_mapping, 0, 0, 1);
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_unmap_virtual_address_space);
> > > +
> > >   int ttm_bo_wait(struct ttm_buffer_object *bo,
> > >   		bool interruptible, bool no_wait)
> > >   {
> > > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo=
_driver.h
> > > index c9e0fd0..39ea44f 100644
> > > --- a/include/drm/ttm/ttm_bo_driver.h
> > > +++ b/include/drm/ttm/ttm_bo_driver.h
> > > @@ -601,6 +601,13 @@ int ttm_bo_device_init(struct ttm_bo_device *bde=
v,
> > >   void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
> > >   /**
> > > + * ttm_bo_unmap_virtual_address_space
> > > + *
> > > + * @bdev: tear down all the virtual mappings for this device
> > > + */
> > > +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev);
> > > +
> > > +/**
> > >    * ttm_bo_unmap_virtual
> > >    *
> > >    * @bo: tear down the virtual mappings for this BO
> > > -- =

> > > 2.7.4
> > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
