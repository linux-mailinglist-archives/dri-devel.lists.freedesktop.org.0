Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E753527D3F5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 18:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129FB6E5A5;
	Tue, 29 Sep 2020 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5906E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 16:53:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o5so6174687wrn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LwXPeYC2QW8EEONWmM3ziIfpvY0EOTVA6dU9L4HdEIQ=;
 b=BEwLdszs5WLDDOwA2+JytlRrcFK6Qvk+5+Exo+HfYP8fIa8zvE5LVoiYjP1Zi3vuSL
 eqRtIBrgQCgLqXzzt+vIog1z/CFmMZrx1DAQIIA9jRvTdcRtOxrFoyFhvymuj0UDZWD4
 Gst/KlE+e6Gh7BjGyCuG1/GWXX0Yo32aXqcfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LwXPeYC2QW8EEONWmM3ziIfpvY0EOTVA6dU9L4HdEIQ=;
 b=rLwDXKfeMOILHTxUt/owXA+TMF9DsowMFN4qWR1UWkzLtAxA/cnYF2Kgbe20CGz9ft
 XYKNUchVx3B64xtsv8X5RmpxJAKRX+mrByyqgPctCMZzDF4y5hOqb4S4iSM+Ad9gKF3e
 e30LyzXanS8jWlKfGJGGtwrCiba3qL+OR6RI/jRBUClXsnev+LbsVBHBVP2HBfHpZIcZ
 6x1DipVQoDfb9GjuPepKnM7PMxcgfWuyL4jB6BxWLGaY+qqkj8JhbC42GwCTQhJS1dPe
 qYaDbLwADDjpLB/XirRqVRz0iVgFkqOH3AtGZn4ccxzzRufu8zRM0GBMeB0PGVtD4v2W
 uGGg==
X-Gm-Message-State: AOAM533xeZRgj7YDCkLafDE3J2PgUfa2PA0DDqaYbWmSoW0mX0PpIPrH
 FAa567B5EzV+i4g9wzwhEhAwtA==
X-Google-Smtp-Source: ABdhPJwIo2tJ6TDg29ghqA5hbxH5DaXgdQbWQnYQE1R6M4w9K5znhpCnksTfYqaLvk8D/vxSVZ3+Ng==
X-Received: by 2002:adf:e289:: with SMTP id v9mr5453131wri.14.1601398407127;
 Tue, 29 Sep 2020 09:53:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm6489563wmk.7.2020.09.29.09.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 09:53:26 -0700 (PDT)
Date: Tue, 29 Sep 2020 18:53:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm: update todo.rst
Message-ID: <20200929165324.GR438822@phenom.ffwll.local>
References: <20200929150333.3441576-1-daniel.vetter@ffwll.ch>
 <20200929155124.f5hcurcrhoxdp7be@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929155124.f5hcurcrhoxdp7be@smtp.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 12:51:24PM -0300, Melissa Wen wrote:
> On 09/29, Daniel Vetter wrote:
> > - debugfs cleanup has moved forward thanks to the cleanup Wambui has
> >   done
> > 
> > Cc: Wambui Karuga <wambui.karugax@gmail.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 3751ac976c3e..700637e25ecd 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -515,9 +515,6 @@ There's a bunch of issues with it:
> >    this (together with the drm_minor->drm_device move) would allow us to remove
> >    debugfs_init.
> >  
> > -- Drop the return code and error checking from all debugfs functions. Greg KH is
> > -  working on this already.
> > -
> >  Contact: Daniel Vetter
> >  
> >  Level: Intermediate
> > -- 
> > 2.28.0
> >
> Acked-by: Melissa Wen <melissa.srw@gmail.com>

Queued up in drm-misc-next for 5.11 or so, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
