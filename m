Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3582F9BF5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 10:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3E689FF6;
	Mon, 18 Jan 2021 09:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E9589FF6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:45:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a12so15745499wrv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MVwrB62WGXWkB0ZxFF6oGx3Y7OrQzOheaIXGmkiOFxU=;
 b=MQOWRc6aPWIIRAQi5G1yTK78eaMZlwZi6vp2HxFn06c7UrKuKidyX78iPADu2TH2Pl
 1tpDY3nLoLm33PV1GYEgj2z0l/L07AcC1kTinlhAn9OvZKlHHFO6pkVhdOtieS+5YCSZ
 KReoxVt0k5UYr4tvJ4qr3mWaq053cqp8ao8DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MVwrB62WGXWkB0ZxFF6oGx3Y7OrQzOheaIXGmkiOFxU=;
 b=VqqYqmEhTLpIiN0BJwNtNAW9fbI43AkiZQbJPoILpsul2szfGQEKl6Dewbpgu5miVL
 sAr/rshLnk7g7jAmYIXiIjYmoSoaSB3B5RWWhUdw4OKtDhfWKY3aROW0hnkfekwotND3
 MgnM5YqWojLyJdkmGFThX1UUQvWl/ZTTscz8ZeuBUmosPwgcpWKo9xj9PUSAlHKe/Gld
 UWe68oaynVw1l4NCmaq5N00ghN8NsUrpgkXOcGVP+V8Dw+YAsqe77+q+MGge2OOLRso5
 7QGOkp1GP7cxyLD8JZ8bPjX0qBXb1lAO9P1Eq14F2wg8vWMOJOm1Ugf5T9wfflKFuoiX
 9KMQ==
X-Gm-Message-State: AOAM532pHscUE3FneYoJWvAENEck1+lM7QxSFuLMLA3rP4Ma3ncNnqEH
 xImH06lIU6aj5Cfghmg+xB3MCQ==
X-Google-Smtp-Source: ABdhPJw3pvsUE/lFr0y1jWQVlUSxT5CUwRCiMaPT+VB+52z8rluCQhOxFzbbdRCJrP8CRdOeluhJOg==
X-Received: by 2002:adf:e452:: with SMTP id t18mr23994029wrm.177.1610963144434; 
 Mon, 18 Jan 2021 01:45:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f9sm31719367wrw.81.2021.01.18.01.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 01:45:43 -0800 (PST)
Date: Mon, 18 Jan 2021 10:45:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 1/2] drm/doc: fix drm_plane_type docs
Message-ID: <YAVYxQpGfkJ+CgfV@phenom.ffwll.local>
References: <20210115110626.12233-1-contact@emersion.fr>
 <20210118104052.092b0d85@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118104052.092b0d85@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 10:40:52AM +0200, Pekka Paalanen wrote:
> On Fri, 15 Jan 2021 12:06:25 +0100
> Simon Ser <contact@emersion.fr> wrote:
> 
> > The docs for enum drm_plane_type mention legacy IOCTLs, however the
> > plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
> > cursor fields are. Add a small paragraph to reference these.
> > 
> > Instead, document expectations for primary and cursor planes for
> > non-legacy userspace. Note that these docs are for driver developers,
> > not userspace developers, so internal kernel APIs are mentionned.
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  include/drm/drm_plane.h | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index 8ef06ee1c8eb..95ab14a4336a 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -538,10 +538,14 @@ struct drm_plane_funcs {
> >   *
> >   * For compatibility with legacy userspace, only overlay planes are made
> >   * available to userspace by default. Userspace clients may set the
> > - * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> > + * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> >   * wish to receive a universal plane list containing all plane types. See also
> >   * drm_for_each_legacy_plane().
> >   *
> > + * In addition to setting each plane's type, drivers need to setup the
> > + * &drm_crtc.primary and optionally &drm_crtc.cursor pointers for legacy
> > + * IOCTLs. See drm_crtc_init_with_planes().
> > + *
> >   * WARNING: The values of this enum is UABI since they're exposed in the "type"
> >   * property.
> >   */
> > @@ -557,19 +561,20 @@ enum drm_plane_type {
> >  	/**
> >  	 * @DRM_PLANE_TYPE_PRIMARY:
> >  	 *
> > -	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
> > -	 * are the planes operated upon by CRTC modesetting and flipping
> > -	 * operations described in the &drm_crtc_funcs.page_flip and
> > -	 * &drm_crtc_funcs.set_config hooks.
> > +	 * A primary plane attached to a CRTC is the most likely to be able to
> > +	 * light up the CRTC when no scaling/cropping is used and the plane
> > +	 * covers the whole CRTC.
> >  	 */
> >  	DRM_PLANE_TYPE_PRIMARY,
> >  
> >  	/**
> >  	 * @DRM_PLANE_TYPE_CURSOR:
> >  	 *
> > -	 * Cursor planes represent a "cursor" plane for a CRTC.  Cursor planes
> > -	 * are the planes operated upon by the DRM_IOCTL_MODE_CURSOR and
> > -	 * DRM_IOCTL_MODE_CURSOR2 IOCTLs.
> > +	 * A cursor plane attached to a CRTC is more likely to be able to be
> > +	 * enabled when no scaling/cropping is used and the framebuffer has the
> > +	 * size indicated by &drm_mode_config.cursor_width and
> > +	 * &drm_mode_config.cursor_height. Additionally, if the driver doesn't
> > +	 * support modifiers, the framebuffer should have a linear layout.
> 
> Hi,
> 
> is there anything to be said about positioning a cursor plane partially
> off-screen?

It should work, like anything partially off-screen placed plane. But
there's two issues:
- you might run into hw limitations (and uh there's even hw where this
  holds for the cursor plane, specifically cursor on 3rd crtc on
  cherrytrail i915 is broken and we can't do some of the placements you'd
  want from a cursor because the display block would die).
- there's still a bunch of drivers which don't even clip correctly :-/

Iow, it's a bit a mess ...
-Daniel

> 
> >  	 */
> >  	DRM_PLANE_TYPE_CURSOR,
> >  };
> 
> Anyway,
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
