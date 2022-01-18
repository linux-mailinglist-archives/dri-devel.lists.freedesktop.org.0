Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4F49300B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 22:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3689ECD;
	Tue, 18 Jan 2022 21:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C900789ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 21:37:58 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id l16so528813pjl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 13:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iDq8s3Xs74YiCluh75TJCVZjxCkYXlG1IQO+4atrnQE=;
 b=XB8triqqGfvX+MO0SSSjLfGgRehuRrHKUWfwNz7JRRAL7zL/jvR9IdcA2oKx+QQ2b1
 FlCs5XAQ28WT27EUO0eMeXMWvxKe4n/gR4ui/AEfIr9gPj92S262VYORvL2bVr3+1wTi
 gRg5YKMCipALu1ghGGEYMrmk5/pKyHrt+iRLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iDq8s3Xs74YiCluh75TJCVZjxCkYXlG1IQO+4atrnQE=;
 b=SzKu7MbRkf2BlnII5Cfz+EzOdTUuBOkmi7pR66U/gsz+kgxxt0nnXzqj/WXv8XeTEL
 kI8MvZos0Bcwa5/Bfh0X0pz7gUfVNS5FN0SM+y01NVR8OAy/kLlTW9UjVcN6EDl4zL+/
 upbNFi+sppdxPLwM5RzYXGyLFvWuzjQpGlSEIpJpoxQeWHSCzL3DenK5yTbVp98Jp08+
 A7etDHLC72mnlzkyrQ8A309U67teInHDLAVPgdvCQSxLiB94EHBv+81OWPMPuKvzNndH
 b65cy8e2U9d/InfGBwQZebMmZczg1YyOFgnnqVFYtJu766LxFAdRH3aaJuJncrBT7iVQ
 ASLg==
X-Gm-Message-State: AOAM532yPMnMvru/UX2tmVTu6VpiMxB1oWjcX5IMds0QO6DR543iVAfF
 8ZuO7Mwyj09yZ8zFjEtg4lHxBQ==
X-Google-Smtp-Source: ABdhPJyfv4KZZskiJBhrdXMXSByEal1AQQYqMHNrmQ693fDkqhxfNsbSSrhpRFMiZRPF9DT6sng7rA==
X-Received: by 2002:a17:90b:3906:: with SMTP id
 ob6mr607002pjb.170.1642541878457; 
 Tue, 18 Jan 2022 13:37:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h3sm14566341pfg.18.2022.01.18.13.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 13:37:58 -0800 (PST)
Date: Tue, 18 Jan 2022 13:37:57 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drm/dp: Remove common Post Cursor2 register handling
Message-ID: <202201181337.3EE7821@keescook>
References: <20220105173507.2420910-1-keescook@chromium.org>
 <cae904f1-21f4-426f-8831-e122d965b131@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae904f1-21f4-426f-8831-e122d965b131@embeddedor.com>
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

On Tue, Jan 18, 2022 at 01:11:48PM -0600, Gustavo A. R. Silva wrote:
> 
> 
> On 1/5/22 11:35, Kees Cook wrote:
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
> 
> This should be tagged for -stable:
> 
> Cc: stable@vger.kernel.org

Ah yeah, good point. Added.

> 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!

-Kees

> 
> Thanks
> --
> Gustavo
> 
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
> > 

-- 
Kees Cook
