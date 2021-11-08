Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B0449904
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB76E13C;
	Mon,  8 Nov 2021 16:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218A86E13C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 16:03:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b12so27770975wrh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SAkB/tCYgd7u4P/VlCiK9DERKVcmTqRHK823UX0ZX0U=;
 b=dVYMpL394eNyQcrt+B98aAH2Ph/lR8Tgtfc5TDaWJaCDFzjPFDFMohUq5+Qras6Yui
 ShYX8uwOoc97uyOX/rWZlbpbNx/6o9Ybu4urTIlAoct0Xy9O0PqVV8GQ6aHNwoQNzY2V
 LKCq9vbg31e5UAGRUGzqRlGqvZb0sGVWcWVJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SAkB/tCYgd7u4P/VlCiK9DERKVcmTqRHK823UX0ZX0U=;
 b=aaL5LCWTV+72F0PvwqFJ+dEhyXl2iVHkZNvJJjotNwH5JgqWBKUCcyQSRjYaRblwE2
 JF/GrgBKBSsQRK3ZpftAwhiuf1GykHTbB86yG4tJuZPQHjHW+O4osya1K7s30j92t2wh
 GvNs7MMjBnc2yvIm4WtdHcv0RvAtbwNEo6RtQGS0DxEd53Et4ABezpDg7KJ16ejKJIN6
 z7K2i6VUDAzrRdsyXgtQQwWf+QW5CN50xKrBe+VE+IwydJsKWJXFzfuhUBtumN8/F39H
 0ACwFQVi1gh8WyaB+kskXfcJJttSLHCM/X7YTOyQwpHrTCeAV1R4HFsxwMlkRHWiis4x
 XThQ==
X-Gm-Message-State: AOAM533TW8bK22Zh2b47/aZ8G1F8y44rdYvi17/ELEUVrvV7jXwiXIhn
 picWR+0Dg9dkYe8NF5v/3xSpgw==
X-Google-Smtp-Source: ABdhPJxFTAlkKSGysv1YzwDpBOacKqf7EWgZ8Hsxygpmn9FAvsCPyOjtWf9njWcnFA2VPRt6x7+h7A==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr332651wrn.82.1636387415679;
 Mon, 08 Nov 2021 08:03:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm11489864wri.74.2021.11.08.08.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:03:34 -0800 (PST)
Date: Mon, 8 Nov 2021 17:03:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYlKVFhOCWLCXu+X@phenom.ffwll.local>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com> <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
 <YYV0bArjRbvYJ2K2@intel.com>
 <20211108155834.6zz236ll75bxwcrk@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108155834.6zz236ll75bxwcrk@gilmour>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 04:58:34PM +0100, Maxime Ripard wrote:
> On Fri, Nov 05, 2021 at 08:14:04PM +0200, Ville Syrjälä wrote:
> > On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrjälä wrote:
> > > > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > > > --- a/include/drm/drm_modes.h
> > > > > +++ b/include/drm/drm_modes.h
> > > > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
> > > > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > > > >  }
> > > > >  
> > > > > +/**
> > > > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> > > > > + * @mode: DRM display mode
> > > > > + *
> > > > > + * Checks if a given display mode requires the scrambling to be enabled.
> > > > > + *
> > > > > + * Returns:
> > > > > + * A boolean stating whether it's required or not.
> > > > > + */
> > > > > +static inline bool
> > > > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> > > > > +{
> > > > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > > > +}
> > > > 
> > > > That's only correct for 8bpc. The actual limit is on the TMDS clock (or
> > > > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> > > > magic for the actually transmitted TMDS clock).
> > > 
> > > Yeah we might need to add the bus format for the cable here too, to make
> > > this complete.
> > 
> > I don't think we have a usable thing for that on the drm level, so
> > would need to invent something. Oh, and the mode->clock vs. 
> > mode->crtc_clock funny business also limits the usability of this
> > approach. So probably just easiest to pass in the the driver calculated
> > TMDS clock instead.
> 
> If we look at all (I think?) the existing users of scrambling in KMS as
> of 5.15, only i915 seems to use crtc_clock (which, in retrospect, seems
> to be the right thing to do), and only i915 and dw-hdmi use an output
> format, i915 rolling its own, and dw-hdmi using the mbus formats.
> 
> I think using the mbus format here makes the most sense: i915 already is
> rolling a whole bunch of other code, and we use the mbus defines for the
> bridge format enumeration as well which is probably going to have some
> interaction.
> 
> I'm not quite sure what to do next though. The whole point of that
> series is to streamline as much as possible the scrambling and TMDS
> ratio setup to avoid the duplication we already have in the drivers that
> support it, every one using the mostly-the-same-but-slightly-different
> logic to configure it.
> 
> The mode is fortunately stored in generic structures so it's easy to
> make that decision. Having to take into account the output format
> however makes it mandatory to move the bus format in the
> drm_connector_state(?) structure too.
> 
> It's already in the bridge_state though, so should we take the final
> bridge format as the cable format if it's tied to a bridge?

Maybe as a default, it nothing is set. Also if nothing is set in the
connector then just assume 8bpc rgb, and drivers can be fixed as we go.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
