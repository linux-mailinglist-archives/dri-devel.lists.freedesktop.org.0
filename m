Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F61ECE7C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAF789B8E;
	Wed,  3 Jun 2020 11:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4439F89B8E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 11:36:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q11so1996780wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 04:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=m0C3MnRb8Lak0wvIjJwftk0NXRcgsCpdh/oFRqjCoOE=;
 b=k/ipxKMxqqQnmzgQqGgiFtA4rQ13uIijyGm+xbBWztAJ3ioMUIERCu4DfT5v41FDqu
 J5Ml5esTerxTDKVwEP6PDuTiCDiinvoBeC6m0dR0jMhd7FQt/64Xh/q2/XEcy1ojVpLS
 mHLiT2VVVVyRFnIFXW6A6HqCgndnjFPG6H/xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m0C3MnRb8Lak0wvIjJwftk0NXRcgsCpdh/oFRqjCoOE=;
 b=uOPqIz1SAI1u42kkC72feXz8vIEMakhM5HlC2SX6qVYkGlMYEXf7VkN6pAGmfNgVU/
 +B094gQm4uc2JvJEMDXEnuw4UI19crmZxdts+HLKCsLE6PhTPtIIUFzGMUsii9SmSulQ
 cJNZzQVQ3/mshmZedxMpDduf1khJIY5CYxTE7ToSr7eOsixztJ4ehDvg7/ygRTJqVuRB
 +bx/X637Npyg/2UnIPOjHzNNB8x8rAp22P8VawQy3Sbyklbf6b6FaRxlITyD8RXI8GkM
 b3XGxm4KpmtmQtgKLsJcV+pzNsUy8PVjtPg8HVTAzJmXEaQxUj1Sv/3WikiqNNR3ZELW
 R2Kg==
X-Gm-Message-State: AOAM533Zqop0RMiovpHPue3dquRIl2TLG/PkZJq5o3segwto+NBWMlRr
 X1wymH+EdxfgONg+ky7dRaJD3A==
X-Google-Smtp-Source: ABdhPJxdy8qztc5SdrAtsCxukYtD0krvT+VnfArAg8u5SlvnHMWBmyDCUEvCTYFq3A7IeGtce+WZzw==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr30247669wrp.230.1591184209834; 
 Wed, 03 Jun 2020 04:36:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h7sm2569140wml.24.2020.06.03.04.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 04:36:48 -0700 (PDT)
Date: Wed, 3 Jun 2020 13:36:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <20200603113646.GK20149@phenom.ffwll.local>
References: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
 <20200603111343.GO6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603111343.GO6112@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 02:13:43PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Jun 03, 2020 at 10:45:23AM +0000, Simon Ser wrote:
> > In update_output_state, the link-status property was reset to GOOD to
> > ensure legacy drmModeSetCrtc re-trains the link. However this auto-reset
> > is also performed on an atomic commit without ALLLOW_MODESET. If a
> =

> I didn't think udate_output_state() was getting called for
> non-legacy paths. Where is that coming from?


Oops, I'm blind and you're right, there's no bug. We already only
force-set this for legacy modeset (and fbcon).

That also means that atomic userspace has to handle this, which is maybe
not so awesome ... So maybe we need to duct-tape over this for atomic too,
and in that case it should be only done when ALLOW_MODESET is set.

But maybe all the compositors that care will handle this :-/
-Daniel

> =

> > driver reads link-status to figure out whether to re-train the link,
> > this could cause an atomic commit failure. User-space doesn't expect
> > such a failure, because commits without ALLOW_MODESET aren't supposed to
> > fail because of link training issues.
> > =

> > Change update_output_state to implicitly reset link-status to GOOD only
> > if ALLOW_MODESET is set. This is the case for legacy drmModeSetCrtc
> > because drm_atomic_state_init sets it (and is used in
> > drm_atomic_helper_set_config, called from drm_mode_setcrtc).
> > =

> > Drivers don't seem to read link-status at the moment -- they seem to
> > rely on user-space performing a modeset instead. So this shouldn't
> > result in any change in behaviour, this should only prevent future
> > failures if drivers start reading link-status.
> > =

> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Suggested-by: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 965173fd0ac2..3d9d9e6f7397 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1426,7 +1426,8 @@ static int update_output_state(struct drm_atomic_=
state *state,
> >  				return ret;
> >  =

> >  			/* Make sure legacy setCrtc always re-trains */
> > -			new_conn_state->link_status =3D DRM_LINK_STATUS_GOOD;
> > +			if (state->allow_modeset)
> > +				new_conn_state->link_status =3D DRM_LINK_STATUS_GOOD;
> >  		}
> >  	}
> >  =

> > -- =

> > 2.26.2
> > =

> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
