Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B951AE047
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764456E40F;
	Fri, 17 Apr 2020 14:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FE26E40F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:57:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f13so3352469wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=60VGtzwTiYwzXu9gSno8Albggq78bUOmhCjrGHuqcH0=;
 b=i0P3U0FK9NGXGLuA53xyepLNIxHPyEzf7CRFj1/kqsSEfq7usXaKYHjNKTVeO14lzm
 l+gvwwwSsSJD6qsl78aOdUwoiz9aO9r2c9l0/jlX46E2T3Gzu306zNYpvRYW7zRPR818
 hqjKDFWxbLlMW5LSLV8fkyGJLmhC7HPpcJbY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=60VGtzwTiYwzXu9gSno8Albggq78bUOmhCjrGHuqcH0=;
 b=TTijiA7ZSNmB76VHHWzqaqOyE3X/xe6rVfvmPc0hBHUWDXdmF1f3A41dx1dm6xWPXa
 6WTAv/X8Id7wRe0vCSZYyFk3uypiBzRVe7NymTdHZlzqAD4OjacUgs1Lo45JmUnGYGRy
 qIzl71rR/J+C5TzYnTp5S9gW4Tu5AS0GKdf+16Imja19a++2bcTYtS4kFf9xpB3kYcaG
 1q14+CQQ2VEyLoH3M6dEIhovb6RElal8IAyY2ndudY73L+GJ1PYPl956bdmUfT29L+1H
 DLwB2I8RAhfVRcx4rB1SkcXiVZ7lc8XVPNQw2/3YOQgSlfJAUvUIB7ve4Qs9lqgR/Q/g
 gM1g==
X-Gm-Message-State: AGi0PuaLP7kS6iziHZ5rGlqUM0bc9mxgyA/6BSOQ+gMO5/hB+Tb9een2
 jGkQAIcEtrg7AzFX57JECKSPVA==
X-Google-Smtp-Source: APiQypLKC1eYBIJEQSftPCEpKucLkLsl9E3R3bE56ebfjr+BqL6bkLixosIGS46bokv29dR4G89U2w==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr4572943wru.92.1587135478501; 
 Fri, 17 Apr 2020 07:57:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h16sm35085542wrw.36.2020.04.17.07.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 07:57:57 -0700 (PDT)
Date: Fri, 17 Apr 2020 16:57:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yussuf Khalil <dev@pp3345.net>
Subject: Re: [PATCH 1/5] drm/modes: Indicate CEA-861 CE modes to user-space
Message-ID: <20200417145755.GL3456981@phenom.ffwll.local>
Mail-Followup-To: Yussuf Khalil <dev@pp3345.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-2-dev@pp3345.net>
 <20200414124132.GV3456981@phenom.ffwll.local>
 <ac01c47a3b2c2ac73368882fb90eb6ee4e07fd04.camel@pp3345.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac01c47a3b2c2ac73368882fb90eb6ee4e07fd04.camel@pp3345.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 03:51:36PM +0200, Yussuf Khalil wrote:
> On Tue, 2020-04-14 at 14:41 +0200, Daniel Vetter wrote:
> > On Mon, Apr 13, 2020 at 11:40:22PM +0200, Yussuf Khalil wrote:
> > > Add a new flag to mark modes that are considered a CE mode
> > > according to the
> > > CEA-861 specification. Modes without this flag are implicitly
> > > considered to
> > > be IT modes.
> > > 
> > > User-space applications may use this flag to determine possible
> > > implications of using a CE mode (e.g., limited RGB range).
> > > 
> > > There is no use for this flag inside the kernel, so we set it only
> > > when
> > > communicating a mode to user-space.
> > > 
> > > Signed-off-by: Yussuf Khalil <dev@pp3345.net>
> > 
> > Do we have userspace for this?
> > 
> > If we go with the existing quant range property you don't need new
> > userspace for the property itself. But this flag here is new uapi, so
> > needs userspace per
> > 
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> > 
> > Also since this standardizes kms uapi, we need testcases per
> > 
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-requirements-for-userspace-api
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/drm_modes.c | 14 ++++++++++++++
> > >  include/uapi/drm/drm_mode.h |  2 ++
> > >  2 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_modes.c
> > > b/drivers/gpu/drm/drm_modes.c
> > > index d4d64518e11b..0d8a032f437d 100644
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -1973,6 +1973,14 @@ void drm_mode_convert_to_umode(struct
> > > drm_mode_modeinfo *out,
> > >  		break;
> > >  	}
> > >  
> > > +	if (drm_match_cea_mode(in) > 1) {
> > > +		/*
> > > +		 * All modes in CTA-861-G Table 1 are CE modes, except
> > > 640x480p
> > > +		 * (VIC 1).
> > > +		 */
> > > +		out->flags |= DRM_MODE_FLAG_CEA_861_CE_MODE;
> > > +	}
> > > +
> > >  	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
> > >  	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
> > >  }
> > > @@ -2045,6 +2053,12 @@ int drm_mode_convert_umode(struct drm_device
> > > *dev,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	/*
> > > +	 * The CEA-861 CE mode flag is purely informational and
> > > intended for
> > > +	 * userspace only.
> > > +	 */
> > > +	out->flags &= ~DRM_MODE_FLAG_CEA_861_CE_MODE;
> > > +
> > >  	out->status = drm_mode_validate_driver(dev, out);
> > >  	if (out->status != MODE_OK)
> > >  		return -EINVAL;
> > > diff --git a/include/uapi/drm/drm_mode.h
> > > b/include/uapi/drm/drm_mode.h
> > > index 735c8cfdaaa1..5e78b350b2e2 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -124,6 +124,8 @@ extern "C" {
> > >  #define  DRM_MODE_FLAG_PIC_AR_256_135 \
> > >  			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
> > >  
> > > +#define DRM_MODE_FLAG_CEA_861_CE_MODE (1<<23)
> > > +
> > >  #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
> > >  				 DRM_MODE_FLAG_NHSYNC |		\
> > >  				 DRM_MODE_FLAG_PVSYNC |		\
> > > -- 
> > > 2.26.0
> > > 
> 
> Sorry, I wasn't aware DRM had these additional requirements. I do have a user-
> space implementation in mutter and gnome-control-center that makes use of the
> new property and this flag on my local machine. I'll try to propose the branch
> upstream before sending in the next revision of this patchset.
> 
> Do I understand it correctly that this will require test cases for both the
> property itself and the new flag? I'll write a patch for IGT then.

Yup. We even have some edid injection stuff so you can (for some value of
"can") test this on systems without such a monitor. That would obviously
be the gold standard for this, so that CI systems can make sure we don't
break any of this in the driver side.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
