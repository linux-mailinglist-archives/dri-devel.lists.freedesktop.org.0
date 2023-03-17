Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA36BE91D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AFF10E10C;
	Fri, 17 Mar 2023 12:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3B10E10C;
 Fri, 17 Mar 2023 12:21:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bi9so6209323lfb.12;
 Fri, 17 Mar 2023 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679055703;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gXGGCRhLPkmEcR0rNR4dhfc5uxv6Pk+veJcHJ54VdME=;
 b=SrA5vjehk1nmeRWMtHuPkTq7gzHT1s0W4NAXBHNBAWc2Lf83XpKGW1g8US6N3WQ8A2
 YFMJZesl8uaqXSfq2qy7WB1ymtdgr1RxcQLW6oifca4yl9iF4G9mWlNhJr6PiLMg3mmm
 xR/LgjI0A+0x0zv9oqtSoh9KFa6+JeL1+4b7RBzVTsgMicNHg7vK/zDYsnyGjkxr0MaC
 RL8RFc4OfYyygPYIvtAB8hlWRqZvVTfbPtTIinH2BwuSJ2tL3VXwSYIWCyVGnqs4naPX
 ffw62iPKE+i3neVJUd2XUXfOEQvtJgYZGGp+7jUA4A2klLQS4MSb4sYDET54kjlIadoi
 dM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679055703;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXGGCRhLPkmEcR0rNR4dhfc5uxv6Pk+veJcHJ54VdME=;
 b=6oW87UENuwQRRzzfgXc2NyPYYSyiUlA+kLHFF1ZLplTHPu3wSHxL9JIvVSZHe+l60j
 8dSSPpnPABw6WoAQOu2NlOTgYPwOj35mbnbiA9ydaYLVbxtZfumXisurpXkI2yiZxxTO
 J/gJhqQF474kLesB9vN63RLhEHijEzflNZXmZWm1eNI36je0W0OKqH/ee+j38wOadqq+
 wlUTTef7hK56exvDdvCSkYunrGvU5cxe3apCW+jFscbEkP2zCF2bE6d7zsEZhJbS8OZm
 Ui4Ci2+A7di8nC/6BYLkCPfxqSKgSUBDN8YQgdBZBtaA3RdYAYbY3B0nvFFG7nAJj68L
 Eyhw==
X-Gm-Message-State: AO0yUKU120XPuzHz3d6GxzIZPZ5F/M4z62bbNWxCN7uERk1njCLi9WGH
 rHN/pJE5CXGAm5dAbirMu4Y=
X-Google-Smtp-Source: AK7set+O2D9mxNruXnFsbXEfuHpJoiC54tXPGrX8I3SNwmUix9Zc5lj7x47OuygOt9wrWlLfRV76Kg==
X-Received: by 2002:ac2:5519:0:b0:4b4:f9df:c6ab with SMTP id
 j25-20020ac25519000000b004b4f9dfc6abmr3805868lfk.60.1679055703279; 
 Fri, 17 Mar 2023 05:21:43 -0700 (PDT)
Received: from gmail.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 g7-20020ac25387000000b004db0d97b053sm350196lfh.137.2023.03.17.05.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:21:42 -0700 (PDT)
Date: Fri, 17 Mar 2023 13:21:40 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <ZBRbVJyoH0Gn6gLw@gmail.com>
References: <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <20230313163311.11379-1-ville.syrjala@linux.intel.com>
 <ZBRCKIl+jdkohbVB@gmail.com> <ZBRQBfuEZS+2ieIM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBRQBfuEZS+2ieIM@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 01:33:25PM +0200, Ville Syrjälä wrote:
> On Fri, Mar 17, 2023 at 11:34:16AM +0100, Jonas Ådahl wrote:
> > On Mon, Mar 13, 2023 at 06:33:11PM +0200, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Add a new immutable plane property by which a plane can advertise
> > > a handful of recommended plane sizes. This would be mostly exposed
> > > by cursor planes as a slightly more capable replacement for
> > > the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> > > a one size fits all limit for the whole device.
> > > 
> > > Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> > > size via the cursor size caps. But always using the max sized
> > > cursor can waste a surprising amount of power, so a better
> > > stragey is desirable.
> > > 
> > > Most other drivers don't specify any cursor size at all, in
> > > which case the ioctl code just claims that 64x64 is a great
> > > choice. Whether that is actually true is debatable.
> > > 
> > > A poll of various compositor developers informs us that
> > > blindly probing with setcursor/atomic ioctl to determine
> > > suitable cursor sizes is not acceptable, thus the
> > > introduction of the new property to supplant the cursor
> > > size caps. The compositor will now be free to select a
> > > more optimal cursor size from the short list of options.
> > > 
> > > Note that the reported sizes (either via the property or the
> > > caps) make no claims about things such as plane scaling. So
> > > these things should only really be consulted for simple
> > > "cursor like" use cases.
> > > 
> > > v2: Try to add some docs
> > > v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
> > >     Drop the note about typical hardware (Pekka)
> > > 
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_mode_config.c |  7 ++++
> > >  drivers/gpu/drm/drm_plane.c       | 53 +++++++++++++++++++++++++++++++
> > >  include/drm/drm_mode_config.h     |  5 +++
> > >  include/drm/drm_plane.h           |  4 +++
> > >  include/uapi/drm/drm_mode.h       | 11 +++++++
> > >  5 files changed, 80 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > index 87eb591fe9b5..21860f94a18c 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
> > >  		return -ENOMEM;
> > >  	dev->mode_config.modifiers_property = prop;
> > >  
> > > +	prop = drm_property_create(dev,
> > > +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > > +				   "SIZE_HINTS", 0);
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +	dev->mode_config.size_hints_property = prop;
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index 24e7998d1731..d2a6fdff1a57 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -140,6 +140,26 @@
> > >   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
> > >   *     various bugs in this area with inconsistencies between the capability
> > >   *     flag and per-plane properties.
> > > + *
> > > + * SIZE_HINTS:
> > > + *     Blob property which contains the set of recommended plane size
> > > + *     which can used for simple "cursor like" use cases (eg. no scaling).
> > > + *     Using these hints frees userspace from extensive probing of
> > > + *     supported plane sizes through atomic/setcursor ioctls.
> > > + *
> > > + *     For optimal usage userspace should pick the smallest size
> > > + *     that satisfies its own requirements.
> > > + *
> > > + *     The blob contains an array of struct drm_plane_size_hint.
> > > + *
> > > + *     Drivers should only attach this property to planes that
> > > + *     support a very limited set of sizes.
> > > + *
> > > + *     Note that property value 0 (ie. no blob) is reserved for potential
> > > + *     future use. Current userspace is expected to ignore the property
> > > + *     if the value is 0, and fall back to some other means (eg.
> > > + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> > > + *     the appropriate plane size to use.
> > 
> > Does this intend to mean userspace has the kernel's blessing on choosing
> > an arbitrary size as long as it's smaller than &DRM_CAP_CURSOR_WIDTH x
> > &DRM_CAP_CURSOR_HEIGHT?
> > 
> > It's a bit to vague for me to make a confident interpretation whether I
> > can, or whether I should pretend I didn't see SIZE_HINTS and apply the
> > old logic, meaning only using the exact cap size.
> 
> Using the exact cap size is the only thing more or less
> guaranteed to work. But other approaches (such as probing
> the size with atomic/cursor ioctls) can also be used.

I think you should then just disallow drivers for exposing SIZE_HINTS
with the value 0, and make it a bug if they do, to let userspace know
when the value 0 means anything.

In other words, userspace should *not* ignore the property value being
0, but treat it as a kernel bug if there is a SIZE_HINTS only containing
a 0, until the value 0 has gotten any meaning. Otherwise I don't see how
it'll be usable in the future, since userspace doesn't know the
difference between 'legacy 0' and 'new 0' once it's defined to mean
anything.


Jonas
