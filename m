Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE53B1DBB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 17:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAD76E928;
	Wed, 23 Jun 2021 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9236E928
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:39:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 48bdc4bf-d439-11eb-a36f-0050568cd888;
 Wed, 23 Jun 2021 15:40:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 22AEB194B5F;
 Wed, 23 Jun 2021 17:39:52 +0200 (CEST)
Date: Wed, 23 Jun 2021 17:39:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/15] drm/atomic-helper: make
 drm_gem_plane_helper_prepare_fb the default
Message-ID: <YNNVwxu5MEI6r62R@ravnborg.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
 <YNI1i1D88TWZU1vR@ravnborg.org>
 <CAKMK7uGXvpLz=NxR9FB2YAA2DrAkC42OpnDy8Qr9NJdKMcvQLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGXvpLz=NxR9FB2YAA2DrAkC42OpnDy8Qr9NJdKMcvQLw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

> > >        * equivalent functionality should be implemented through private
> > >        * members in the plane structure.
> > >        *
> > > -      * Drivers which always have their buffers pinned should use
> > > -      * drm_gem_plane_helper_prepare_fb() for this hook.
> > > +      * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
> > s/not/nor/ ??
> 
> Yup.
> 
> > > +      * set drm_gem_plane_helper_prepare_fb() is called automatically to
> >               ^add comma?
> > > +      * implement this.
> >
> >
> > Leave cleanup_fb out of the description to make it more readable.
> 
> With the not->nor typo fixed, why does this make it more readable?
> Afaiui neither ... nor ... is fairly standard English, and I really
> want to make this the default only if you specify absolutely no plane
> fb handling of your own.

What I tried to suggest was like this:

"
Drivers which always have their buffers pinned should use
drm_gem_plane_helper_prepare_fb() for this hook.
For GEM drivers who do not have a @prepare_fb hook set,
drm_gem_plane_helper_prepare_fb() is called automatically to
implement this.
"

But anyway is fine and with the typo fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
