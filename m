Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA12E079D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201456E270;
	Tue, 22 Dec 2020 09:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9166E270
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:00:49 +0000 (UTC)
Date: Tue, 22 Dec 2020 09:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608627646;
 bh=lR7klNsmO7jgQIU2Ae5O7qtRhMf5MgVXgYqada6dLVw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=iAhPbD+UjjpDUoPzt7hLild06yv4xqeRBon2OhSa9Gshuk+WwQ/jkPM06OAOvgP0v
 LKUZmXA1Vetz6llSkbJ4VvX8dCcJzdpCANeCjBo1Y6ID/TDExj5ejDXR44/GMZ66rZ
 nXIKOaAE7cSqayCWqpyKuRB+jLuGEmnsSpSe4LVqW0Rt3hZv+ruIRlY4kbfsURLIvr
 bwwacjZPiw0Tfye/HfNj1raB5eE2+l2v8uTX/lHKs6yq+BKhtfTEXVIoi2211gdE2u
 BLzdE8qv7zbWB8WF02O416zD13iJZdvl1aRERZ/m2Dn3tFviKI9f/T+g1dUcGP+5v9
 CZEXUS0a/6b6w==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/fb-helper: Add a FIXME that generic_setup is very
 confusing
Message-ID: <ELmh1-LEs7frTA_s1mAofp1qBikYytSKjZi5fc36z41QdFuETpsx0qO-nUlvvsbJ2Xt6VrHYv8u9_1eNIqkUullDFmjPIsxIUMTxujYhktM=@emersion.fr>
In-Reply-To: <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
 <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
 <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 22nd, 2020 at 9:55 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Dec 11, 2020 at 05:11:13PM +0100, Daniel Vetter wrote:
> > I tried to fix this for real, but it's very sprawling and lots of
> > drivers get this mildly wrong one way or the other.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
>
> Anyone feeling like an ack on this one?

From my limited understanding of fbdev, this FIXME sounds correct to me.

Acked-by: Simon Ser <contact@emersion.fr>

> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 596255edf023..27deed4af015 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -2494,6 +2494,11 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
> >  		return;
> >  	}
> >
> > +	/*
> > +	 * FIXME: This mixes up depth with bpp, which results in a glorious
> > +	 * mess, resulting in some drivers picking wrong fbdev defaults and
> > +	 * others wrong preferred_depth defaults.
> > +	 */
> >  	if (!preferred_bpp)
> >  		preferred_bpp = dev->mode_config.preferred_depth;
> >  	if (!preferred_bpp)
> > --
> > 2.29.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
