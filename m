Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C22050A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 13:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7D6E3B2;
	Tue, 23 Jun 2020 11:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60536E398
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 11:30:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z13so8374214wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YCDs0iybqttBCahYy/kqnAWurPxWf72WH16Niv/dNjQ=;
 b=i2RJT0CIIaD58uNDArIusS7lT+8peZ+lZwRKWmAvoPEKpXw1/rh/28t6WOI9fbGmx7
 T96hc8fRq1p9FWPt4zadn/b1iMkxAvMwQStwImAuApvR4FqMikIyUE9+KojjxOFDkIkL
 XVGBto/ip3aat8qCWg236ceZf8icPSDIJzUlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YCDs0iybqttBCahYy/kqnAWurPxWf72WH16Niv/dNjQ=;
 b=KAPD6bsI9aXT2SZQ+icfCkVQOAVSWrnZjM9/lEf8A9iCs4UxnIEMWBgRS3XEK2tHMy
 XfWrDQQKO77qJaGtzY+/7gkC/rfEwzBbhOeefCPMGr1EzqC1+tl43SKqrPwg3aF7mkyy
 fNzfpc93oPlba5zc7LqeqeBa/914tXc9lTYxxm16rgNtVOKltMkJTYIn8z5lwElafmpm
 5wzPptKDJ4WuRr3xVjdU6GzSZ4Q4ZTMcEp2Y+nx7fvKomBK3Deafot6ZXsRXXzNTotbn
 sYm0iSN1q1HJYgnhkw3VGe+jMbmcdVMRF0cg+bYqCkC41Jp7C7s3Zqy9Wi9sUgSlsS9p
 6WRQ==
X-Gm-Message-State: AOAM5316GiA8b2/7AOGNddlBSvNXQqGDMExODiIZ6X8cy5Cq8BjrVJkj
 yrE/WSRH2REG9PB8rkjo5PDd6A==
X-Google-Smtp-Source: ABdhPJy57e4tceSNzBsShVcpKCAoRiPchSXstG0FEVOvGAzCM11yGfxDm4X692uIo1Xo/vCEbVMUhg==
X-Received: by 2002:adf:9525:: with SMTP id 34mr25775915wrs.313.1592911807359; 
 Tue, 23 Jun 2020 04:30:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm15885653wrm.64.2020.06.23.04.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 04:30:06 -0700 (PDT)
Date: Tue, 23 Jun 2020 13:30:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH libdrm] intel: sync i915_pciids.h
 with kernel
Message-ID: <20200623113004.GM20149@phenom.ffwll.local>
References: <20200616123758.3331-1-ramadevi.gandi@intel.com>
 <87wo3znmlv.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wo3znmlv.fsf@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com,
 ramadevi.gandi@intel.com, kalyan.kondapally@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 06:31:24PM +0300, Jani Nikula wrote:
> On Tue, 16 Jun 2020, ramadevi.gandi@intel.com wrote:
> > From: Gandi Ramadevi <ramadevi.gandi@intel.com>
> >
> > Add DG1 PCI ID
> 
> There are no DG1 PCI IDs in kernel. So please don't add them here
> either.

Also, do we have anything left using libdrm-intel?
-Daniel
> 
> BR,
> Jani.
> 
> 
> >
> > Signed-off-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
> > ---
> >  intel/i915_pciids.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
> > index 662d8351..724e68a0 100644
> > --- a/intel/i915_pciids.h
> > +++ b/intel/i915_pciids.h
> > @@ -605,4 +605,9 @@
> >  	INTEL_VGA_DEVICE(0x9AD9, info), \
> >  	INTEL_VGA_DEVICE(0x9AF8, info)
> >  
> > +/* DG1 */
> > +#define INTEL_DG1_IDS(info) \
> > +        INTEL_VGA_DEVICE(0x4905, info), \
> > +        INTEL_VGA_DEVICE(0x4906, info)
> > +
> >  #endif /* _I915_PCIIDS_H */
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
