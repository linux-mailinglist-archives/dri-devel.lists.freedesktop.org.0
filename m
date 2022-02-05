Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B24AA55D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 02:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD67110E1BB;
	Sat,  5 Feb 2022 01:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7593F10E251
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 01:41:14 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id z5so6583184plg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 17:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=myz4g6Qa1WY7AUZda/vmt1iCRBi20oOlq1O4D8Tshf4=;
 b=WEQzYtgsyGerlT0ueBcIUWjjZDgUC2+53EpsPoDGP3uuPFB3ymg9NKe2NrgyUf8MMH
 j70XqajQ2TjQz9wOVN/Nlh7yoDGCHNk5bpcoN+iylAwS7btXeZnMpIBr8krgWPajbzQM
 sX14DVY5wOg8lE0oYHYUxgXxalig0VFjYSbPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=myz4g6Qa1WY7AUZda/vmt1iCRBi20oOlq1O4D8Tshf4=;
 b=qyHfveq83YwG5acdpQZUbPbSXydUNDEZfx1Io9s0XDTAbdv8os+euf3LKg1ogIkCJ2
 s56AByBl3GYoReji/nfrHtxhKh/sIuPOxQNEmo/coZDwInCWfyyC3DgUFienMfTQ0TK9
 6Y/TJoQT700pXy+L8iYS3XCWJIPMrInPYVff5sLPhOYkd+U4TwWav2q6x5vtpaipfXFC
 kKYKrHgDKJMYT/KqTbko9Ka322D1Uzt7xc1Yh+xAv3vDbL7V0DJGuhtCNIy0b0dEy05X
 6kpV5ZGZdLJ3HJhz6XhxZ1Tu4cKEiN8B5YkI3wdhShFkZSCy3CYk9ayeVfw9+d6IxaAf
 B8HA==
X-Gm-Message-State: AOAM533NrSz4d8bn4GrY6tnb+0JNbSvhVxPknJMRW37+IhFDALBHin/1
 jRMnyHtHSWIQQfJ4K/1eGqJGBA==
X-Google-Smtp-Source: ABdhPJzXzaOsxAG+LTQCOUvqb9DGjAcqKyn2JVuV4Dl2+ulTvIQd3muaH0g4LnXS7BZmwpz/ijca3w==
X-Received: by 2002:a17:902:ce8a:: with SMTP id
 f10mr6014427plg.35.1644025273975; 
 Fri, 04 Feb 2022 17:41:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 8sm13774838pjs.39.2022.02.04.17.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:41:13 -0800 (PST)
Date: Fri, 4 Feb 2022 17:41:12 -0800
From: Kees Cook <keescook@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/dp: Remove common Post Cursor2 register handling
Message-ID: <202202041740.F368F91F5@keescook>
References: <20220105173507.2420910-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105173507.2420910-1-keescook@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping,

This is a OOB read fix. Can someone please pick this up?

-Kees

On Wed, Jan 05, 2022 at 09:35:07AM -0800, Kees Cook wrote:
> The link_status array was not large enough to read the Adjust Request
> Post Cursor2 register, so remove the common helper function to avoid
> an OOB read, found with a -Warray-bounds build:
> 
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Replace the only user of the helper with an open-coded fetch and decode,
> similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.
> 
> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> This is the alternative to:
> https://lore.kernel.org/lkml/20211203084354.3105253-1-keescook@chromium.org/
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 10 ----------
>  drivers/gpu/drm/tegra/dp.c      | 11 ++++++++++-
>  include/drm/drm_dp_helper.h     |  2 --
>  3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 23f9073bc473..c9528aa62c9c 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
>  
> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> -					 unsigned int lane)
> -{
> -	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
> -	u8 value = dp_link_status(link_status, offset);
> -
> -	return (value >> (lane << 1)) & 0x3;
> -}
> -EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
> -
>  static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
>  {
>  	if (rd_interval > 4)
> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
> index 70dfb7d1dec5..f5535eb04c6b 100644
> --- a/drivers/gpu/drm/tegra/dp.c
> +++ b/drivers/gpu/drm/tegra/dp.c
> @@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>  {
>  	struct drm_dp_link_train_set *adjust = &link->train.adjust;
>  	unsigned int i;
> +	u8 post_cursor;
> +	int err;
> +
> +	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
> +			       &post_cursor, sizeof(post_cursor));
> +	if (err < 0) {
> +		DRM_ERROR("failed to read post_cursor2: %d\n", err);
> +		post_cursor = 0;
> +	}
>  
>  	for (i = 0; i < link->lanes; i++) {
>  		adjust->voltage_swing[i] =
> @@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>  				DP_TRAIN_PRE_EMPHASIS_SHIFT;
>  
>  		adjust->post_cursor[i] =
> -			drm_dp_get_adjust_request_post_cursor(status, i);
> +			(post_cursor >> (i << 1)) & 0x3;
>  	}
>  }
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 472dac376284..fdf3cf6ccc02 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
>  					  int lane);
>  u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>  				   int lane);
> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> -					 unsigned int lane);
>  
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>  #define DP_RECEIVER_CAP_SIZE		0xf
> -- 
> 2.30.2
> 

-- 
Kees Cook
