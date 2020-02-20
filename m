Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC216638D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AFC6E8ED;
	Thu, 20 Feb 2020 16:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C9C6E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:54:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so2769036wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HCV4RTyFbRjUlkR+2znmEPZvQhzJ01ZJC4KPRDbRdiA=;
 b=ci3XSzl5/9FLoby42AB2NrmejJncBGvT8ZGrlZNvzh7Z9s4ih5d2++c0QleQyF1JMw
 12Qdt4FM/Y1ipQFNixmF+GLb1c9pfrsaI9FGkHOoIHm2EjYQuEXk4Bxw/AlTjPNnMZdU
 QVdfxRJPLmqxjYaxfoaQ02j8g/qQhsxQXHidY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCV4RTyFbRjUlkR+2znmEPZvQhzJ01ZJC4KPRDbRdiA=;
 b=BzSn8CIAlSkL7wF8UD8Ybk/XUpN6HhC3qKHbvRHOb+uBJiigc6Z1VtQ5/gIjBIQIUM
 mdI1MXxsv5vR4bspRcHg2l2Y/159oiigPo0oNrrYoXxzdPUtT9Nzq5OP66tNOaTpqnfp
 UnsoT/wSnXL4e4cxjid1FBHw3nFs3BIGhkS2vsaa07Ge8xpVZu5pwqoYlNlzA0wFwn43
 ALK+HzXpcNzxmAmarLn1p/L0hfn9TD2YJBISwiQ6DIO9qJ+MWAtmCsgnhSR+wPCHA1EN
 WrvAakDKFYqX9h2IYWmMB4BrlfhOg7EL2wumF7TNNmbRCAJUhP4Clsya5kAk0WPP89tv
 g3dw==
X-Gm-Message-State: APjAAAW4tv8KlPv3uNAwIB9u4ASVqZ0P0FS041rZoF8Kj2ZwX5tcj+c+
 TU5eyHpl3aiqytoqAab505DT4w==
X-Google-Smtp-Source: APXvYqwWXxHzWvd29NPGMaVofLvxn5ZPBr+Z/UeGxiWtnFSNMVcN/dl3DyfVydEQCISmLc+yy7bTCA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr5261308wml.3.1582217666505;
 Thu, 20 Feb 2020 08:54:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm5028514wmc.47.2020.02.20.08.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 08:54:25 -0800 (PST)
Date: Thu, 20 Feb 2020 17:54:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
Message-ID: <20200220165423.GR2363188@phenom.ffwll.local>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org, Mihail Atanassov <mihail.atanassov@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 03:49:46PM +0100, Andrzej Pietrasiewicz wrote:
> This series adds AFBC support for Rockchip. It is inspired by:
> 
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/factory-gru-9017.B-chromeos-4.4/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> 
> This is the fifth iteration of the afbc series. Between v3 and v4 a lot of
> rework has been done, the main goal of which was to move all afbc-related
> checks to helpers, so that core does not deal with it.
> 
> A new struct drm_afbc_framebuffer is added, which stores afbc-related
> driver-specific data. Because of that, in drivers that wish to
> use this feature, the struct must be allocated directly in the driver
> code rather than inside helpers, so the first portion of the patchset
> does the necessary refactoring.
> 
> Then, there are 3 users of afbc: komeda, malidp and, finally, rockchip,
> the latter being the ultimate purpose of this work and the 3 subsequent
> portions of the patchset move komeda and malidp to generic helpers and add
> afbc support to rockchip.
> 
> The idea is to make all afbc users follow a similar pattern. In fb_create()
> they allocate struct drm_afbc_framebuffer, do their specific checks which
> can be done before object lookups, do object lookups and a special version
> of a size check, which understands struct drm_afbc_framebuffer, followed
> by any other driver-specific checks and initializing the gem object.
> The helpers for the common parts are factored out so that drivers
> can use them.
> 
> The komeda driver has been the farthest away from such a pattern, so it
> required most changes. However, due to the fact that I don't have any
> komeda hardware I did the changes to komeda in an incremental fashion with
> a series of (usually) very small, easy to understand steps. malidp was
> pretty straightforward, and rockchip's afbc checks follow the pattern.
> 
> I kindly ask for reviewing the series. I need to mention that my ultimate
> goal is merging afbc for rockchip and I don't have other hardware, so some
> help from malidp and komeda developers/maintainers would be appreciated.
> 
> @Liviu, @James, @Mihail, @Brian: a kind request to you to have a look and
> test the patchset, as I don't have appropriate hardware.
> 
> Rebased onto drm-misc-next.
> 
> v4..v5:
> - used proper way of subclassing drm_framebuffer (Daniel Vetter)
> - added documentation to exported functions (Liviu Dudau)
> - reordered new functions in drm_gem_framebuffer_helper.c to make a saner
> diff (Liviu Dudau)
> - used "2" suffix instead of "_special" for the special version of size
> checks (Liviu Dudau)
> - dropped unnecessarily added condition in drm_get_format_info() (Liviu
> Dudau)
> - dropped "block_size = 0;" trick in framebuffer_check() (Daniel Vetter)
> - relaxed sticking to 80 characters per line rule in some cases
> 
> v3..v4:
> 
> - addressed (some) comments from Daniel Stone, Ezequiel Garcia, Daniel
> Vetter and James Qian Wang - thank you for input
> - refactored helpers to ease accommodating drivers with afbc needs
> - moved afbc checks to helpers
> - converted komeda, malidp and (the newly added) rockchip to use the afbc
> helpers
> - eliminated a separate, dedicated source code file
> 
> v2..v3:
> 
> - addressed (some) comments from Daniel Stone, Liviu Dudau, Daniel Vetter
> and Brian Starkey - thank you all
> 
> In this iteration some rework has been done. The checking logic is now moved
> to framebuffer_check() so it is common to all drivers. But the common part
> is not good for komeda, so this series is not good for merging yet.
> I kindly ask for feedback whether the changes are in the right direction.
> I also kindly ask for input on how to accommodate komeda.
> 
> The CONFIG_DRM_AFBC option has been eliminated in favour of adding
> drm_afbc.c to drm_kms_helper.
> 
> v1..v2:
> 
> - addressed comments from Daniel Stone, Ayan Halder, Mihail Atanassov
> - coding style fixes** BLURB HERE ***
> 
> 
> Andrzej Pietrasiewicz (34):
>   drm/core: Add afbc helper functions
>   drm/gem-fb-helper: Allow drivers to allocate struct drm_framebuffer on
>     their own
>   drm/gem-fb-helper: Add special version of drm_gem_fb_size_check
>   drm/gem-fb-helper: Add generic afbc size checks
>   drm/komeda: Use afbc helper
>   drm/komeda: Move checking src coordinates to komeda_fb_create
>   drm/komeda: Use the already available local variable
>   drm/komeda: Retrieve drm_format_info once
>   drm/komeda: Explicitly require 1 plane for AFBC
>   drm/komeda: Move pitches comparison to komeda_fb_create
>   drm/komeda: Provide and use komeda_fb_get_pixel_addr variant not
>     requiring a fb
>   drm/komeda: Factor out object lookups for non-afbc case
>   drm/komeda: Make komeda_fb_none_size_check independent from
>     framebuffer
>   drm/komeda: Factor out object lookups for afbc case
>   drm/komeda: Free komeda_fb_afbc_size_check from framebuffer dependency
>   drm/komeda: Simplify error handling
>   drm/komeda: Move object lookup before size checks
>   drm/komeda: Move object assignments to framebuffer to after size
>     checks
>   drm/komeda: Make the size checks independent from framebuffer
>     structure
>   drm/komeda: Move helper invocation to after size checks
>   drm/komeda: Use helper for common tasks
>   drm/komeda: Use return value of drm_gem_fb_lookup
>   drm/komeda: Use special helper for non-afbc size checks
>   drm/komeda: Factor in the invocation of special helper
>   drm/komeda: Use special helper for afbc case size check
>   drm/komeda: Factor in the invocation of special helper, afbc case
>   drm/komeda: Move special helper invocation outside if-else
>   drm/komeda: Move to helper checking afbc buffer size
>   drm/arm/malidp: Make verify funcitons invocations independent
>   drm/arm/malidp: Integrate verify functions
>   drm/arm/malidp: Factor in afbc framebuffer verification
>   drm/arm/malidp: Use generic helpers for afbc checks
>   drm/rockchip: Use helper for common task
>   drm/rockchip: Add support for afbc
> 
>  .../arm/display/komeda/d71/d71_component.c    |   6 +-
>  .../arm/display/komeda/komeda_framebuffer.c   | 273 ++++++++---------
>  .../arm/display/komeda/komeda_framebuffer.h   |  21 +-
>  .../display/komeda/komeda_pipeline_state.c    |  14 +-
>  drivers/gpu/drm/arm/malidp_drv.c              | 155 ++++------
>  drivers/gpu/drm/drm_fourcc.c                  |  53 ++++
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 287 ++++++++++++++----
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 111 ++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 147 ++++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  12 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  83 ++++-
>  include/drm/drm_fourcc.h                      |   4 +
>  include/drm/drm_framebuffer.h                 |  50 +++
>  include/drm/drm_gem_framebuffer_helper.h      |  34 +++
>  14 files changed, 907 insertions(+), 343 deletions(-)

I think this isn't achieving it's goal. Even if we take out the rockchip
enabling patch at the ent it's still like 200 lines more for something
that's supposed to unify and clean code up.

Plus it looks enormously complicated, something that I missed in my
previous quick glance. Hence proposal for all the things you're going to
add to drm core/helpers, and not a bit more :-)

int
drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
			   struct drm_device *dev, struct drm_file *file,
			   const struct drm_mode_fb_cmd2 *mode_cmd,
			   const struct drm_framebuffer_funcs *funcs);

This is going to do _exactly_ what drm_gem_fb_create_with_funcs already
does, except it doesn't do the kzalloc (so that would need to be moved out
so we can share code). No other additional sub-parts exposed, I think
that's just not worth it in this case. So none of this size check stuff.

2nd piece, your drm_afbc_framebuffer as in patch 4, with the subclassing.

3rd piece, again in drm_gem_framebuffer_helper.c:

int drm_gem_afbc_init(struct drm_afbc_framebuffer *afbc_fb);

Drivers are supposed to call this after they've a) allocated their fb
structure, containing the drm_afbc_framebuffer somewhere and b) called
drm_gem_fb_init_with_funcs(). This function is going to fill out all the
additional fields, and this function is also going to do all the size
validation and everything else.

Nothing else, so no finer split up of helper check functions, or of afbc
computation functions, or of anything else. That mix of split-out stuff
and mix of computed values in drm_afbc_framebuffer but also functions that
compute afbc values from modifiers and fb sizes seems to just lead to a
huge confusion and not actually to a code reduction. So
- none of the functions exported in patch 1, just stuff them into
  drm_gem_framebuffer_helper.c.
- none of the helper subfunctions you export in patch 2, or adapt in patch
  3
- Also not this size check structure with the data pointer you add in
  patch 4.

The bikeshed I'm still seeing here is whether drm_afbc_framebuffer and the
drm_gem_afbc_init() function should be considered core stuff or not, I
guess you can make an argument for either.

This should also make conversion easier since as a first steps you'd do:

- Put the new drm_afbc_framebuffer in place and adjust all tha
  fb_to_komeda functions and upcasting (this should be mechanically)

- Add the call to drm_gem_afbc_init().

- Starting using the new values in drm_afbc_framebuffer and slowly delete
  code

- Optional, but would be nice to do: Convert driver over to
  drm_gem_fb_init_with_funcs().

Thoughts?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
