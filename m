Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B69B485B65
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 23:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E4D10E3F4;
	Wed,  5 Jan 2022 22:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6910E3F4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 22:11:51 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so5783467pjf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 14:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=23epZgha1vduYGwfVlyJXoEQeuHeRLa9G6BF3JRJdSs=;
 b=bfeddHzRv9HtJY5mtsQRXVAOEmYWMs7ngEG2ATROmYEtn24O+nonhf7KXPUwBbWEoo
 Wdhdhi1DkRY1Ss9sS4fVkhXWyStKlzF3BgmTaRXF8RixyXt4QlFk/ZjxDMkUfcSZLAkI
 Yaai59wXJJwwANPPLgBNPHaBM5LgVDD4YPl+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=23epZgha1vduYGwfVlyJXoEQeuHeRLa9G6BF3JRJdSs=;
 b=jZR0+NXGli20rCAYRvw+85kwGk63F2ShwYNQ9d1OfaA6t+l4/wGo19P2Vt8lq5nQa6
 UbxEE2pn+KDQKTJMyvfr+TT9Oac6ARdlYeBHxvCAGL1LtQ/ivobAwlmgHIyE0TlT/dQH
 iI+SU/Ty4r1M8mv6C/QXdTcrFI0nSiqViesmMppRt12D4Jz3kmC8wGc85roK3qA0//xe
 fiqBEpMWvJBryo/H/ssZyqT8POE9DbLchSyPa8RVDdiuPs8FFcC21Z0L9P2K0Rff1b7m
 S0OVxsZSDTzMuK5Kgz21EOv33n1zsUXJ+71yjo+0T/uEyQdhNxrcX2+DS+u3HF96f3X3
 kteA==
X-Gm-Message-State: AOAM532siosHMXXdkKt3ZMKWJ6YAtpq+sechoYOvm10kJ/niwW/2Iz1s
 0esB/y4yO6vnj2onSLLlkju+zA==
X-Google-Smtp-Source: ABdhPJzA1QQolIAGWUj/J4KwNJXn9ApDguH+fthMfPH6jJn1bm/a3nte3k2RSaxKz4wYYdX6DKcLWQ==
X-Received: by 2002:a17:902:d507:b0:149:e668:e340 with SMTP id
 b7-20020a170902d50700b00149e668e340mr2314029plg.66.1641420711267; 
 Wed, 05 Jan 2022 14:11:51 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ot7sm4268637pjb.12.2022.01.05.14.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 14:11:51 -0800 (PST)
Date: Wed, 5 Jan 2022 14:11:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Remove common Post Cursor2 register handling
Message-ID: <202201051410.8F65E4E0@keescook>
References: <20220105173507.2420910-1-keescook@chromium.org>
 <878rvujc4t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rvujc4t.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 05, 2022 at 08:00:50PM +0200, Jani Nikula wrote:
> On Wed, 05 Jan 2022, Kees Cook <keescook@chromium.org> wrote:
> > The link_status array was not large enough to read the Adjust Request
> > Post Cursor2 register, so remove the common helper function to avoid
> > an OOB read, found with a -Warray-bounds build:
> >
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Replace the only user of the helper with an open-coded fetch and decode,
> > similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.
> >
> > Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > This is the alternative to:
> > https://lore.kernel.org/lkml/20211203084354.3105253-1-keescook@chromium.org/
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 10 ----------
> >  drivers/gpu/drm/tegra/dp.c      | 11 ++++++++++-
> >  include/drm/drm_dp_helper.h     |  2 --
> >  3 files changed, 10 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> > index 23f9073bc473..c9528aa62c9c 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
> >  }
> >  EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
> >  
> > -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> > -					 unsigned int lane)
> > -{
> > -	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
> > -	u8 value = dp_link_status(link_status, offset);
> > -
> > -	return (value >> (lane << 1)) & 0x3;
> > -}
> > -EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
> > -
> >  static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
> >  {
> >  	if (rd_interval > 4)
> > diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
> > index 70dfb7d1dec5..f5535eb04c6b 100644
> > --- a/drivers/gpu/drm/tegra/dp.c
> > +++ b/drivers/gpu/drm/tegra/dp.c
> > @@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
> >  {
> >  	struct drm_dp_link_train_set *adjust = &link->train.adjust;
> >  	unsigned int i;
> > +	u8 post_cursor;
> > +	int err;
> > +
> > +	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
> > +			       &post_cursor, sizeof(post_cursor));
> 
> There's a drm_dp_dpcd_readb() for the common 1-byte reads. Other than
> that,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks!

> 
> Though obviously that's not enough to actually merge to tegra.

As in, "a review by Jani isn't sufficient to land via the tegra tree"?

What should next steps be?

-Kees

> 
> > +	if (err < 0) {
> > +		DRM_ERROR("failed to read post_cursor2: %d\n", err);
> > +		post_cursor = 0;
> > +	}
> >  
> >  	for (i = 0; i < link->lanes; i++) {
> >  		adjust->voltage_swing[i] =
> > @@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
> >  				DP_TRAIN_PRE_EMPHASIS_SHIFT;
> >  
> >  		adjust->post_cursor[i] =
> > -			drm_dp_get_adjust_request_post_cursor(status, i);
> > +			(post_cursor >> (i << 1)) & 0x3;
> >  	}
> >  }
> >  
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 472dac376284..fdf3cf6ccc02 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
> >  					  int lane);
> >  u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
> >  				   int lane);
> > -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> > -					 unsigned int lane);
> >  
> >  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
> >  #define DP_RECEIVER_CAP_SIZE		0xf
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Kees Cook
