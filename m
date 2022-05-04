Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C02519C0B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076FC10EDD9;
	Wed,  4 May 2022 09:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499FB10F7EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:38:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b24so1035623edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=v445vAlme2zlrPL6XrM4JniIviakM8QqlAR33SjZ/5E=;
 b=hM2bbzfYB9M+Ca6zJVRzpxwIn7EMB8SBN8mUvDSIzsa+xWIcfUGlTfwqzMYyRTSfXm
 sisamAPFM5rcXf413mOFntR5wifzmK2GIzilqLQcVqKa74yGBGZzrTgfmApi2V4lxIkn
 D00G1ZxDPYQLCbCzPIezeBFYNL+fl0wRhgsPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=v445vAlme2zlrPL6XrM4JniIviakM8QqlAR33SjZ/5E=;
 b=jQ9USj3zILH7y/zdWusFXzkSgWTmfHsTafntGSAOamRc2lAEHVoguUOog8bnQlSlLn
 rQoGWYGn7SDOWp8J+b3R8AgJJaoBoq1vQ0+1s6ul7ND1V7YVpkS/AXlKOf/x9NVwXd5g
 i55RQ17wkz7PI0fwTO0uDtRobD1Hft4CydHbZeaR/ooRtNU9yKs3XvGFpVrF/RmGamqA
 GztmkDWgJjncbpcCczS8SpAn8CblAu6sqh7ud2B1YfJM0VRDx8RRbR4+u1P6s96pHCKX
 HZcBHzj+C6/AOAf3RLD7gbtN/YwdMlsiZ8+lbJLYIMPrVnd++kzmIPS/4uNVXo4WK7TC
 TVWg==
X-Gm-Message-State: AOAM532+TZbELEdQ/p1nJV7Nmg5iKnLYZ5uKZhlU9ekLwZE8Cl2I6cgm
 iVg+9pOpVD+5lRoFaUKom5Wz/w==
X-Google-Smtp-Source: ABdhPJyvZnRAfF291GMqjz7DLqK6y4u0GKdaL17PBCM4iimO9RBWYJ1fAx8Vy9Brbgoj0DSchPP6sA==
X-Received: by 2002:a05:6402:42c4:b0:426:a7a8:348f with SMTP id
 i4-20020a05640242c400b00426a7a8348fmr22175278edc.341.1651657133662; 
 Wed, 04 May 2022 02:38:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gv8-20020a1709072bc800b006f3ef214e5csm5520368ejc.194.2022.05.04.02.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 02:38:53 -0700 (PDT)
Date: Wed, 4 May 2022 11:38:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: drm_gem.h: Add explicit includes for
 DEFINE_DRM_GEM_FOPS
Message-ID: <YnJJq6UdCVIWcH3G@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
 <87y1zkq6vg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1zkq6vg.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 06:41:39PM +0300, Jani Nikula wrote:
> On Fri, 29 Apr 2022, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> > DEFINE_DRM_GEM_FOPS() references drm functions from other headers.  For
> > example drm_open() is defined in drm_file.h and drm_ioctl() is defined
> > in drm_ioctl.h.  Since drm_gem.h doesn't include these headers, it
> > relies on an implicit include from the .c file to have included these
> > required headers before DEFINE_DRM_GEM_FOPS() gets used.  Relying on
> > these implicit includes can cause build failures for new code that
> > doesn't know about these requirements, and can lead to future problems
> > if the headers ever get restructured as there will be a need to update
> > every downstream file that includes drm_gem.h.
> >
> > Lets fix this explicitly including the required headers in drm_gem.h so
> > that code that includes drm_gem.h does not need to worry about these
> > implicit dependencies.
> 
> In the general case, I tend to agree, but in this specific instance I
> think I'd err on the side of fewer includes. I think the more likely
> outcome here is accumulating implicit dependencies on symbols from
> drm_file.h and drm_ioctl.h by including drm_gem.h only!
> 
> I do think headers need to be self-contained, and we actually enforce
> this in i915 (see HDRTEST in drivers/gpu/drm/i915/Makefile), but not to
> the point of macro expansions.

Yeah we abuse macros in a bunch of places to untangle header dependencies,
so then going back and pulling in all the headers back in feels a bit
silly and defeats the point.

iow, I concur.
-Daniel

> 
> BR,
> Jani.
> 
> 
> 
> >
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > ---
> >  include/drm/drm_gem.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 9d7c61a..1cbe3d8 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -37,6 +37,8 @@
> >  #include <linux/kref.h>
> >  #include <linux/dma-resv.h>
> >  
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_ioctl.h>
> >  #include <drm/drm_vma_manager.h>
> >  
> >  struct iosys_map;
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
