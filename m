Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC866126F7C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 22:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6D66E0C1;
	Thu, 19 Dec 2019 21:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773E6E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 21:14:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so7150383wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 13:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7+3AUvSLFzex0Kr4hrvfYxRuS/8TLoB+8TfqzACh6nw=;
 b=ViE51uIwPMekyEz2ZClXHrk7N41/S8cRa96NhcD5D81Jx46r2evAJ8H3x7Fv2LM4le
 Ik6mJPquCEVH+zzQTZMdtkZxp9s4+zLJMXQ+bQPgtobDXDuAMuhTbOeiGqdynZRBX8Cz
 tIbtHBLZx/OpMrVSETLutJXcgDSiRo9eZX6lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7+3AUvSLFzex0Kr4hrvfYxRuS/8TLoB+8TfqzACh6nw=;
 b=aFXTGBo6GIMvwklurCUE+bqvK+QmC1OpiNRxgwdyT+481B6WCRi8c5GnxlScUcxTpx
 oKFmZUPoBIAfHXoHCAm0H/b7yYfRSNQSIKyy51JpIFYVm+K52VGK1ICH1T1gWOMTpFCr
 TtlZpV/x72WwpD1byFYETqV9XYCvGnkWXK4vwmq/YNHcj8fdTP2bvVMYjDUMhnvZUAiL
 tCdD928Nd0W9vBzkRBZI+yXjsFUhboKwRG7SsnNdpgAnMp2m2PsfHaBfrFAacYh8lpV7
 5rjv7YkURHU/NptEWmBNY6nGzH2x1blLYPGynPrOB9YHzKsvEPpwNA8eMGyVkqMmiU0X
 xi0Q==
X-Gm-Message-State: APjAAAVJWcDz8koxhreal16SZXlhh1dhwrh8bV6zV5Mvp8SGqL2/sVdB
 APpGQLB46E+PS/FDL6s23mjIfg==
X-Google-Smtp-Source: APXvYqzqOdr9CvGfbQIkjr1+te65xkouC+nsIfCJ/kyDVqWJ7EBT/pHq+o08Y1CS/n7ayWPfEw5rFQ==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
 x5mr11900554wmj.72.1576790047059; 
 Thu, 19 Dec 2019 13:14:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id u8sm7175684wmm.15.2019.12.19.13.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 13:14:06 -0800 (PST)
Date: Thu, 19 Dec 2019 22:14:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/todo: Updating logging todo
Message-ID: <20191219211404.GF624164@phenom.ffwll.local>
References: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
 <87r210wabi.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r210wabi.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 06:26:41PM +0200, Jani Nikula wrote:
> On Thu, 19 Dec 2019, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > Jani has merged a new set of logging functions, which we hope to be
> > the One True solution now, pinky promises:
> >
> > commit fb6c7ab8718eb2543695d77ad8302ff81e8e1e32
> > Author: Jani Nikula <jani.nikula@intel.com>
> > Date:   Tue Dec 10 14:30:43 2019 +0200
> >
> >     drm/print: introduce new struct drm_device based logging macros
> >
> > Update the todo entry to match the new preference.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Wambui Karuga <wambui.karugax@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Might mention converting everything to the One True solution, but
> *shrug*.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Patch applied. And thanks for wrangling this bikeshed into at least a less
yelling color :-)

Cheers, Daniel

> 
> > ---
> >  Documentation/gpu/todo.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 2d85f37284a1..017f3090f8a1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -142,13 +142,13 @@ Contact: Daniel Vetter, respective driver maintainers
> >  
> >  Level: Advanced
> >  
> > -Convert instances of dev_info/dev_err/dev_warn to their DRM_DEV_* equivalent
> > -----------------------------------------------------------------------------
> > +Convert logging to drm_* functions with drm_device paramater
> > +------------------------------------------------------------
> >  
> >  For drivers which could have multiple instances, it is necessary to
> >  differentiate between which is which in the logs. Since DRM_INFO/WARN/ERROR
> >  don't do this, drivers used dev_info/warn/err to make this differentiation. We
> > -now have DRM_DEV_* variants of the drm print macros, so we can start to convert
> > +now have drm_* variants of the drm print functions, so we can start to convert
> >  those drivers back to using drm-formwatted specific log messages.
> >  
> >  Before you start this conversion please contact the relevant maintainers to make
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
