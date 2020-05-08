Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C431CA7FF
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569ED6E162;
	Fri,  8 May 2020 10:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20B6E162
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:12:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v8so9555728wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=80e4YhVYsBOu9hDZgrB+N7FSQ8gx2xhSHcqa3FFcxTg=;
 b=PdSLtzsTfw8LPinD94rHM7kHwUY2682vpO0onvuC8PzJMDLiA+m4D1Eh2qA6qtg1MQ
 T/lmg9cmNJ5zoOwV50V5eV5HbgIGokgAvPEvY5fyKy7xPk3MF6SHJC9BqwnWA8C197Mi
 Gt9p0KgYD1MctPcXYt4Zn3Y1NKz4vw0RRPps8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80e4YhVYsBOu9hDZgrB+N7FSQ8gx2xhSHcqa3FFcxTg=;
 b=CwQ8T37WWuoZ3oiqnfNwZG56XYU1tlEknI49z2srH+nXt3fdkUfI9a91zukmaZRJIo
 +RO2/CByvLYspElg4WQG1N9K6MMdFT23+xSNogeeKkV7kTh9NxmWZ9gFOmtvwaj6+Lz4
 cIRsQL7i/FA8KnDO5jPkE9DkdDj3TEAzJ4cdbO5mNlVGI7no8tvbsXkwy/qAKuHRPHjr
 i7AcPb+lZzJqdKQkbeTtg3CkvhZAQuLACYKLK9o8sdnd5sBsl9wB5ZrLPtjYCWYcCs6L
 QN6FmoTjU3WjCz66gKduPidXgNaTdDTVeV3Cgy2nZCOzpoXTHVMlV831ugb3QxEHoH8k
 quTQ==
X-Gm-Message-State: AGi0PuYT/5cA/tHrsQxHsbJUPMznqWVjkvYa/6FmnhbHzvI2XgMp7Q3t
 WTk+NAJjT7Isblc5BPfosmotHQ==
X-Google-Smtp-Source: APiQypJMij7IvC3lWLmIUqT0PRp+I0x/fqztWOHDiYOs7hTuFqUhNJB2oUX5ovP524jc7eNI208IfQ==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr1520574wmi.111.1588932772670; 
 Fri, 08 May 2020 03:12:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m1sm1751304wrx.44.2020.05.08.03.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 03:12:51 -0700 (PDT)
Date: Fri, 8 May 2020 12:12:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity
 for format modifiers
Message-ID: <20200508101249.GG1383626@phenom.ffwll.local>
References: <20200506120827.12250-1-mika.kahola@intel.com>
 <20200508065628.GD1383626@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508065628.GD1383626@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 08:56:28AM +0200, Daniel Vetter wrote:
> On Wed, May 06, 2020 at 03:08:27PM +0300, Mika Kahola wrote:
> > Make an additional note on DRM format modifiers for x and y tiling. These
> > format modifiers are defined for BDW+ platforms and therefore definition
> > is not valid for older gens. This is due to address swizzling for tiled
> > surfaces is no longer used. For newer platforms main memory controller has
> > a more effective address swizzling algorithm.
> > 
> > v2: Rephrase comment (Daniel)
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ok I assumed you'd just push that to drm-intel with commit rights or
something, but that got stuck so applying to drm-misc-next now.

Cheers, Daniel
> 
> > ---
> >  include/uapi/drm/drm_fourcc.h | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 8bc0b31597d8..9e488d10f8b4 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -354,9 +354,12 @@ extern "C" {
> >   * a platform-dependent stride. On top of that the memory can apply
> >   * platform-depending swizzling of some higher address bits into bit6.
> >   *
> > - * This format is highly platforms specific and not useful for cross-driver
> > - * sharing. It exists since on a given platform it does uniquely identify the
> > - * layout in a simple way for i915-specific userspace.
> > + * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
> > + * On earlier platforms the is highly platforms specific and not useful for
> > + * cross-driver sharing. It exists since on a given platform it does uniquely
> > + * identify the layout in a simple way for i915-specific userspace, which
> > + * facilitated conversion of userspace to modifiers. Additionally the exact
> > + * format on some really old platforms is not known.
> >   */
> >  #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
> >  
> > @@ -369,9 +372,12 @@ extern "C" {
> >   * memory can apply platform-depending swizzling of some higher address bits
> >   * into bit6.
> >   *
> > - * This format is highly platforms specific and not useful for cross-driver
> > - * sharing. It exists since on a given platform it does uniquely identify the
> > - * layout in a simple way for i915-specific userspace.
> > + * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
> > + * On earlier platforms the is highly platforms specific and not useful for
> > + * cross-driver sharing. It exists since on a given platform it does uniquely
> > + * identify the layout in a simple way for i915-specific userspace, which
> > + * facilitated conversion of userspace to modifiers. Additionally the exact
> > + * format on some really old platforms is not known.
> >   */
> >  #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
> >  
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
