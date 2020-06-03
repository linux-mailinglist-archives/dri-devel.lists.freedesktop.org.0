Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F81ECDFA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFC889A9B;
	Wed,  3 Jun 2020 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3989A9B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 11:06:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x6so1847283wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uMhpicvgNNDazgJ5G32MO7NUTJflxcVpr3r7bNyrpio=;
 b=OZMrvOh8hRoOI0dOnG2d+IoqlWW2C6Zxnf7EdXq4bJB9i8F+aMUFCdFLq2EPdm7U61
 1y7nMrPxVioba1VmsOHwbf9KG7e5o6EXhsS/6++XEh27131EZjX27QV9pO14hjXRsCfd
 Xk9hyabXymxSFHkrO+LOM9O5433dGl5wCWDkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uMhpicvgNNDazgJ5G32MO7NUTJflxcVpr3r7bNyrpio=;
 b=gFTktcVV24/zIiH72r/4bWyMMX4bzG52yCoe+CWg0S9J76JDuTAqSTOrifx6WRwxjO
 +Gfhc5jH5VaUDYOHAxvakWbxkjt/LR99seGldnJ6F1W8K/52yxD3jFDnt53uSkCzh0m7
 a/NjU7R2PPJEBqhOdycml2yngwbDo2WHtz86BliOzC0X7mozZ29JhQqrseoNNwUWB5Jn
 BVbWXzjgT95rQ7hGa//5seEVkLcgvVwxXJZNdhV9A/QCumZQd+NJimwqRCTNYlf155xV
 4o2G0IZ2/BpFxWHfNXLVoiemg6TyoNpFJ1oUnKK6Or+Sad9G72JJJsQCuxTG9dqVuq1a
 EReg==
X-Gm-Message-State: AOAM530hJj3bnozC1o1q09PllzW7WuSH6ju90YRCttw++XWl5BfX8Gp6
 Kdm+lb/RWO8v78M+SendlkM1OV2lYZU=
X-Google-Smtp-Source: ABdhPJxmGn/ZQffeiBuxVkZERyNC3FaRcEJBeE15TE1KaSx77K4k3xuJAVCxkf2s/58vajkmKY4QWQ==
X-Received: by 2002:a05:6000:100e:: with SMTP id
 a14mr30001151wrx.349.1591182370672; 
 Wed, 03 Jun 2020 04:06:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 23sm2357590wmg.10.2020.06.03.04.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 04:06:09 -0700 (PDT)
Date: Wed, 3 Jun 2020 13:06:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <20200603110607.GJ20149@phenom.ffwll.local>
References: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 10:45:23AM +0000, Simon Ser wrote:
> In update_output_state, the link-status property was reset to GOOD to
> ensure legacy drmModeSetCrtc re-trains the link. However this auto-reset
> is also performed on an atomic commit without ALLLOW_MODESET. If a
> driver reads link-status to figure out whether to re-train the link,
> this could cause an atomic commit failure. User-space doesn't expect
> such a failure, because commits without ALLOW_MODESET aren't supposed to
> fail because of link training issues.
> 
> Change update_output_state to implicitly reset link-status to GOOD only
> if ALLOW_MODESET is set. This is the case for legacy drmModeSetCrtc
> because drm_atomic_state_init sets it (and is used in
> drm_atomic_helper_set_config, called from drm_mode_setcrtc).
> 
> Drivers don't seem to read link-status at the moment -- they seem to
> rely on user-space performing a modeset instead. So this shouldn't
> result in any change in behaviour, this should only prevent future
> failures if drivers start reading link-status.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Pekka Paalanen <ppaalanen@gmail.com>

I think we should have Cc: stable@vger.kernel.org on this. Also I think
would be really awesome if we can update/extend the igt, but I guess if
you don't have a chamelium it's a bit hard to make that happen :-/

Also I guess you'll reflect this in your doc patch?

With the cc: stable this has my Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 965173fd0ac2..3d9d9e6f7397 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1426,7 +1426,8 @@ static int update_output_state(struct drm_atomic_state *state,
>  				return ret;
>  
>  			/* Make sure legacy setCrtc always re-trains */
> -			new_conn_state->link_status = DRM_LINK_STATUS_GOOD;
> +			if (state->allow_modeset)
> +				new_conn_state->link_status = DRM_LINK_STATUS_GOOD;
>  		}
>  	}
>  
> -- 
> 2.26.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
