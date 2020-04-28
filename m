Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F391BBE86
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2B89E06;
	Tue, 28 Apr 2020 13:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E472D897D7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:06:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y24so2779337wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GvCnubnVKmIVoSEYhFz+uK0U01NbdfHDTxNrt/s7zTM=;
 b=IT2kqtnhvzGdmdz5+97kbMxrBEF3M23KSFOw84igRCF3reesSLpKPRVaP0rO5e+YpD
 7giH92phiSHnd0MIfLWlZQTTN718o9kErQ+uFjDvIjJ6BzXHWxsIr4sdHfHc1ctTNmSE
 P0ivJas4Ds9oQCPzSsU0874DgbD0BsJwV4V7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GvCnubnVKmIVoSEYhFz+uK0U01NbdfHDTxNrt/s7zTM=;
 b=sU2Rbp2rs/yhR6qNESrnk1XpnFhGWBA1a0KqC0RN3v2yOs7HwW2qnmQuz3LosTk6+0
 z6EzKG7e7fVohpIgyc3NgQxdHTAl4el0wvizP//F6TQYJq4YJaKJ8U2SoFyC+BmoY7Jd
 UrOyJ+byQlrVtUVCCii6ymcXtf6LGiAvRytNHMYm77ETPVDrQuBG2QXqSNaVfnj88bje
 MXdMOeRQAgyp7SgiihaeXAzgsGTDviXRYXP+I5Z30TmiKYyH+72MmcpDKW56CnFvoygY
 +B+PR1WPsPQCV9sP+97If20bsS1KpvPkmFhTBejEgba8MD2YdsHnUSC9q71T3BKZjxTE
 G5rg==
X-Gm-Message-State: AGi0Pua21N8o247GfPiXejR/vZNX8ac5Ef5Xu4bNHVDFqG+1f/4iOAcs
 YUgOloOqjyBkiyiIGeBGKHemxw==
X-Google-Smtp-Source: APiQypJ9VrKGxZIPeEzgKtRg4Q1iG6C8ah9yulx2Kv2AdGFCAMOR++Kr7Z0rzxXagK+HWbpFMRQfpg==
X-Received: by 2002:a1c:a58b:: with SMTP id o133mr4445404wme.5.1588079191545; 
 Tue, 28 Apr 2020 06:06:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h5sm26169744wrp.97.2020.04.28.06.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 06:06:30 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:06:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200428130628.GH3456981@phenom.ffwll.local>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
 <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
 <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>
 <ea9c5a37-118f-1243-26f7-f03a3068dfeb@suse.de>
 <20200421203245.GA25673@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421203245.GA25673@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 10:32:45PM +0200, Sam Ravnborg wrote:
> Hi
> 
> > > Hm, I see the point of this (and the dev_field below, although I'd go
> > > with dev_member there for some consistency with other macros using
> > > offset_of or container_of), but I'm not sure about the dev_ prefix.
> > > Drivers use that sometimes for the struct device *, and usage for
> > > struct drm_device * is also very inconsistent. I've seen ddev, drm,
> > > dev and base (that one only for embedded structs ofc). So not sure
> > > which prefix to pick, aside from dev_ seems the most confusing. Got
> > > ideas?
> > 
> > We have pdev for the PCI device, dev for the abstract device, and things
> > like mdev for struct mga_device in mgag200. So I'd go with ddev. I don't
> > like drm, because it could be anything in DRM. I guess struct drm_driver
> > is more 'drm' than struct drm_device.
> > 
> > But all of this is bikeshedding. It's probably best to keep the patch
> > as-is, and maybe rename variables later if we ever find consent on the
> > naming.
> 
> bikeshedding - I know.
> But reading code is is quite natural for me that drm equals the central
> drm_device data structure. Maybe thats because this was is in the code
> I started looking at.
> 
> So as an example:
> 
> 	drm_err(drm, "bla bla\n");
> 
> This parses nicely and is easy to type and get right.
> And matches nicely that drm_device => drm.
> But bikeshedding  - I will go to bed...
> (Whatever is the conclusion we should not hold back the patch in
> questions).

Ok, since we can't agree on dev vs ddev vs drm vs something else I just
left it as-is. We can always repaint this later on.

Thanks everyone for comments and review.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
