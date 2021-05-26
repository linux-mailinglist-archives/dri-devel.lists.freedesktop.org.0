Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B7391D98
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 19:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB656ED65;
	Wed, 26 May 2021 17:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22AA6ED65
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 17:11:04 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f18so3581479ejq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 10:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0E/wl0VSi38fQLSMGSHNSYeoEaccOGS8kpezDAHovYw=;
 b=koHKfqa+olF7pRufGusVKJDwyELOgnuWIuMXsSljYnENITyWKjZ7VxLVSJQiozZC8T
 nRUoluit+4cAcXGq63EOsKtqZtN2Mfz3mdUUzHNrn+QteD+kdqyRCwIm5DAAEtySso4U
 U7hk3YnQbUO8jjueQFXrOHgo7zgT1RPVXaPK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0E/wl0VSi38fQLSMGSHNSYeoEaccOGS8kpezDAHovYw=;
 b=XDZb2D2qb+KgF/cgbV93I0nZtCEo41iFH6fJ4lGas/493RmnhOhzHS8B47ffWhxAGg
 Ktwmk8dXZe4J/v32RRcm59La79QrCs7/xmX2iDP975cUCcMTOv+RyCTms9TeCigmM61l
 wfhgydZdoBaHWJg9dvDBl3ccpiEwypRFw2Mr4oyKoolflG6yN3xkagINngEobB7MkgbL
 rMFM98NRuM686O6Y7MhHCn/zDkaDB0nRJrEy71qnjzS2t2fc0luf1sHp1T9F0V25Hs0M
 Vn3m7WmwSim5jtA6qmLpc2u2s8KxeM/HYfY0mBHxl9C64Vh05JFm9R6rHoqMnZQmUs7i
 Dznw==
X-Gm-Message-State: AOAM530J5qkVtpmKm/2kEYctvMUFX34r1Ou9RKdCUELY+h9q9n4FvmPJ
 aM6n9DfO1i/D4RS58QsYynvjxQ==
X-Google-Smtp-Source: ABdhPJztGA4LvhVlApj6c292oczFAqi5ELdfiqf4IXFBC/3qdvgwUl36Cg3rZMh7Ybqi/X/v4p7NmA==
X-Received: by 2002:a17:906:fb89:: with SMTP id
 lr9mr35653633ejb.523.1622049063377; 
 Wed, 26 May 2021 10:11:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id by3sm13184962edb.38.2021.05.26.10.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:11:02 -0700 (PDT)
Date: Wed, 26 May 2021 19:11:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] Clean a few backend interfaces in the i915
Message-ID: <YK6BJbKteLFGg92r@phenom.ffwll.local>
References: <20210521183215.65451-1-matthew.brost@intel.com>
 <YK0CKLSCx0qowxhy@phenom.ffwll.local>
 <040887b2-48f3-c4be-2a43-7e99492af5fc@linux.intel.com>
 <20210525155438.GB6585@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525155438.GB6585@sdutt-i7>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 08:54:38AM -0700, Matthew Brost wrote:
> On Tue, May 25, 2021 at 04:27:49PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 25/05/2021 14:56, Daniel Vetter wrote:
> > > On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
> > > > As discussed in [1] start merging some support patches as a precursor to
> > > > GuC submission the i915. This is step #1 mentioned in [1].
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/89844/
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
> > > ping John H or Daniele for pushing stuff for you, should be quicker than
> > > waiting for me to return from a lon w/e :-)
> > > 
> > > Plus I _really_ don't want to get back into the business of pushing other
> > > people's work ...
> > 
> > To Matt - Also please take care to preserve r-b's when resurrecting patches
> > because all of these three had mine from before which is now lost in git
> > history.
> >
> 
> Will do. Still getting used to the upstream rules and wasn't sure if
> should have included your old R-Bs.

If you have an r-b but for an old version with some significant changes
compared to the current one add a (v1) or similar tag at the end of that
r-b. That way it's not lost, but also not misattributed to a newer and
potentially buggy version of the patch.
-Daniel

> 
> Matt
>  
> > Regards,
> > 
> > Tvrtko

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
