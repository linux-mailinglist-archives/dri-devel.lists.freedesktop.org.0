Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B92DCFB9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5053989581;
	Thu, 17 Dec 2020 10:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E84189581
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:50:39 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id l207so31722744oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 02:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uSFvtoTR8s6Q/6Ae34xwArmA24xcfgZ1ZfANwqHIsvQ=;
 b=ZRyHDUd6wFofSBlO7eSZ8PogkH6FoIVY8ZbCQWjhe4CPgb/CIpa9YF/J7PVniUxbxP
 LIGbZ+M9kfgqmHdIXnybmH6G9jWl6JE35w6SjP+fEvwVhJPzNvZ5E7hCkBhJx3+z3fPA
 qlYfQMym1BimcxVTsa+X2IPjNgDpPRVtLBmeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uSFvtoTR8s6Q/6Ae34xwArmA24xcfgZ1ZfANwqHIsvQ=;
 b=MRwrfZdcjOHVxpvmWoZRMRa1HVyLGETMvkK67JOvU+le/8r8wLibFSQDnqz/+8djDT
 h6izQbdkQaB8yTNxQTs4r+/rNwsFeFJ57Cen5HGR4gaDDYFBLD6CT8I2m1pF+rwPZSin
 MFzDNJYdrGpDnZGyDYYZAAw9Y7+iX5cIgFGxw2wkiQdazr8c8DmebV9ip2d2l+2hhSAH
 bWc7hSHTUXZLEJXaTYFVG5f7J5CACmd/IsThWeWmO3NbIZ4fmBskwo5ipAbArROaRwoP
 pJK/sixiSePLjMqjoBknDlA24k2p+bIn9vjOf4IHKaSoSYZRWUalQlyQTYbAJ7hDnIW6
 dLAQ==
X-Gm-Message-State: AOAM531vF2TUKXK/wtnFAh2bMvTq7GcM8b9JNbbvyu/4LR/G9EOw0yoy
 11Qq+0ajgkQmdCbckeZgKc1EaCwDPKsJtwRuUobu+w==
X-Google-Smtp-Source: ABdhPJzl46fh/IuqZI/ELrkMxSf3VIyMwbyqucFJ5LFyjWmu7iTwx/rXY3h/vblr7vfJxFkKuDbqfLRPaxABuFiPvAg=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr4226812oib.14.1608202238887; 
 Thu, 17 Dec 2020 02:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-8-contact@emersion.fr>
 <X9p51qbZ6il8DH5T@phenom.ffwll.local>
 <co84HmvozNSpZ7qlBqqkMdcpXRupOTigvbWZJvGIdtKH4Fr6GlF8-Np3s15jhMLSqL_cANTarQaL-6ixnVZTmGa7pSIfn2u86oaqEE3ww7U=@emersion.fr>
In-Reply-To: <co84HmvozNSpZ7qlBqqkMdcpXRupOTigvbWZJvGIdtKH4Fr6GlF8-Np3s15jhMLSqL_cANTarQaL-6ixnVZTmGa7pSIfn2u86oaqEE3ww7U=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Dec 2020 11:50:27 +0100
Message-ID: <CAKMK7uE=oNuyaACKD1H+e5BGyGi8UZYhhgSGF=cZaB60NWNuaA@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/doc: fix drm_plane_type docs
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 11:37 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, December 16th, 2020 at 10:19 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Wed, Dec 16, 2020 at 09:22:21PM +0100, Simon Ser wrote:
> > > The docs for enum drm_plane_type mention legacy IOCTLs, however the
> > > plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
> > > cursor fields are. Add a small paragraph to reference these.
> > >
> > > Instead, document expectations for primary and cursor planes for
> > > non-legacy userspace. Note that these docs are for driver developers,
> > > not userspace developers, so internal kernel APIs are mentionned.
> > >
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > ---
> > >  include/drm/drm_plane.h | 21 +++++++++++++--------
> > >  1 file changed, 13 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > index 1d82b264e5e4..94fdd0c68450 100644
> > > --- a/include/drm/drm_plane.h
> > > +++ b/include/drm/drm_plane.h
> > > @@ -538,10 +538,14 @@ struct drm_plane_funcs {
> > >   *
> > >   * For compatibility with legacy userspace, only overlay planes are made
> > >   * available to userspace by default. Userspace clients may set the
> > > - * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> > > + * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> > >   * wish to receive a universal plane list containing all plane types. See also
> > >   * drm_for_each_legacy_plane().
> > >   *
> > > + * In addition to setting each plane's type, drivers need to setup the
> > > + * &drm_crtc.primary and optionally &drm_crtc.cursor for legacy IOCTLs. See
> >
> >                               insert "pointers" here ^ for readability.
> >
> > > + * drm_crtc_init_with_planes().
> > > + *
> > >   * WARNING: The values of this enum is UABI since they're exposed in the "type"
> > >   * property.
> > >   */
> > > @@ -557,19 +561,20 @@ enum drm_plane_type {
> > >     /**
> > >      * @DRM_PLANE_TYPE_PRIMARY:
> > >      *
> > > -    * Primary planes represent a "main" plane for a CRTC.  Primary planes
> > > -    * are the planes operated upon by CRTC modesetting and flipping
> > > -    * operations described in the &drm_crtc_funcs.page_flip and
> > > -    * &drm_crtc_funcs.set_config hooks.
> >
> > I think we should keep the notice which legacy entry hooks implicitly
> > operate on the primary plane. Not sure why you're removing the above
> > sentence. Maybe improve it by adding "See also &drm_crtc.primary." for
> > more context?
>
> I intentionally removed it, because setting the plane type will not magically
> make it used for legacy IOCTLs. The previous version documented the legacy
> IOCTLs behaviour in the primary and cursor type docs. That was misleading
> because only the drm_crtc.{primary,cursor} pointers make it so a plane is used
> for legacy IOCTLs, not the type.
>
> This patch does keep a reference to drm_crtc.{primary,cursor}, in the paragraph
> right above. Clicking on the reference will explain in detail which legacy
> IOCTLs are affected. I don't think repeating the paragraph again in the primary
> and cursor type docs is necessary.

Hm I guess works too, I'm not sure documentations must avoid
repetitions at all costs (since it generally makes stuff harder to
find, despite all the links). So without that change:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
