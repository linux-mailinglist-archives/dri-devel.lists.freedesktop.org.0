Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD28E3BC7AA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F61689BD2;
	Tue,  6 Jul 2021 08:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6714089BB2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:11:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a8so13287071wrp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ajbZA7MbtoT3nE34N4/HGLBeKz92y1HEALR7LZXvD+E=;
 b=IxLHk30B7XpkLA+4xZNhio8ww93sIlWFVosSEy5fK98A7CfqcnenakxTQUkISYllki
 xNy6w2nFL2DxMoDJ6X15t1G2cjJ5/ZVBWP7OdBl9AZfXIaPP1i6XdYdEibvOB3C01LMn
 ovgklRy81ZQd1yzrMrTFjUKpvc67VK6eNsf6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ajbZA7MbtoT3nE34N4/HGLBeKz92y1HEALR7LZXvD+E=;
 b=ny156I603RHf2nlnjmLmuHHgX9i7mx+AdQly45+N3mEl5MpQO9eDFbVOQ1x7sbXSnF
 OeeDNv2zJxvOJ3/qqOPGP+a2DlBF8TJZrVbVgqRyZpW0ujlxXwj9Vb1ZDGRqY0viMB9W
 I7fcabekOe44ZlEf9lFZgaG2hugoeouEFne/6lVhZ0xXUKhNbCah11E+nnki6Awg7hH7
 qxie4Z22INW5GKMGzRUmyEJn2V/IG4fo1kToD9n8XRfESxRCvouhVDIuSAXc5XByMn5b
 SoqfmgSH3ULsY6osLIRk+QM+NrrjOcprYDZSCw5Lqv64wrYbcMxnYdvW7D+vUvkcgMhJ
 uQYA==
X-Gm-Message-State: AOAM530xNRqiz2X3mkdF5/Rplbujw5CwbkuY2WmiTbtFeb8g2zT9KWQ2
 UlGinFWGEKBTwjvHJdkMhKdeYg==
X-Google-Smtp-Source: ABdhPJzZQYbqCCkPx66cXji+1Gi+XALE+SWLe0p/Zi79AXSNuPMO6fojyntZ6xEpfuEUARi8GZtQqQ==
X-Received: by 2002:adf:a404:: with SMTP id d4mr20382707wra.156.1625559078123; 
 Tue, 06 Jul 2021 01:11:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z3sm18563410wrv.45.2021.07.06.01.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:11:17 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:11:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Improve debug Kconfig texts a bit
Message-ID: <YOQQIyAlLbbC+hmd@phenom.ffwll.local>
References: <20210702201708.2075793-1-daniel.vetter@ffwll.ch>
 <162548570352.15289.12980604779254635228@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162548570352.15289.12980604779254635228@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 02:48:23PM +0300, Joonas Lahtinen wrote:
> Quoting Daniel Vetter (2021-07-02 23:17:08)
> > We're not consistently recommending these for developers only.
> > 
> > I stumbled over this due to DRM_I915_LOW_LEVEL_TRACEPOINTS, which was
> > added in
> > 
> > commit 354d036fcf70654cff2e2cbdda54a835d219b9d2
> > Author: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Date:   Tue Feb 21 11:01:42 2017 +0000
> > 
> >     drm/i915/tracepoints: Add request submit and execute tracepoints
> > 
> > to "alleviate the performance impact concerns."
> > 
> > Which is nonsense.
> 
> I think that was the original reason why the patch was developed and
> it got merged primarily for the latter reason. Unfortunately the patch
> commit messages don't always get rewritten.
> 
> > Tvrtko and Joonas pointed out on irc that the real (but undocumented
> > reason) was stable abi concerns for tracepoints, see
> > 
> > https://lwn.net/Articles/705270/
> > 
> > and the specific change that was blocked around tracepoints:
> > 
> > https://lwn.net/Articles/442113/
> > 
> > Anyway to make it a notch clearer why we have this Kconfig option
> > consistly add the "Recommended for driver developers only." to it and
> > all the other debug options we have.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Pushed to drm-intel-gt-next, thanks for taking a look.
-Daniel

> 
> Regards, Joonas
> 
> > ---
> >  drivers/gpu/drm/i915/Kconfig.debug | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> > index 2ca88072d30f..f27c0b5873f7 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.debug
> > +++ b/drivers/gpu/drm/i915/Kconfig.debug
> > @@ -215,6 +215,8 @@ config DRM_I915_LOW_LEVEL_TRACEPOINTS
> >           This provides the ability to precisely monitor engine utilisation
> >           and also analyze the request dependency resolving timeline.
> >  
> > +         Recommended for driver developers only.
> > +
> >           If in doubt, say "N".
> >  
> >  config DRM_I915_DEBUG_VBLANK_EVADE
> > @@ -228,6 +230,8 @@ config DRM_I915_DEBUG_VBLANK_EVADE
> >           is exceeded, even if there isn't an actual risk of missing
> >           the vblank.
> >  
> > +         Recommended for driver developers only.
> > +
> >           If in doubt, say "N".
> >  
> >  config DRM_I915_DEBUG_RUNTIME_PM
> > @@ -240,4 +244,6 @@ config DRM_I915_DEBUG_RUNTIME_PM
> >           runtime PM functionality. This may introduce overhead during
> >           driver loading, suspend and resume operations.
> >  
> > +         Recommended for driver developers only.
> > +
> >           If in doubt, say "N"
> > -- 
> > 2.32.0.rc2
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
