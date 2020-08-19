Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAC24A261
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 17:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E46E3EB;
	Wed, 19 Aug 2020 15:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C786E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:04:06 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id x6so11405453qvr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vzojOIjXWxLiO6TIP3hVvjZj3nBXkO4u+Tv0gqgyYy4=;
 b=bF4X2rLiQ6gYsVqzGCpAtaMbPgC9tg9k7pWmdfdP7jhYjOW2lKP3GTqUtVfsNaZd8d
 +tqW/r6n8N1HbXApppScuxmidM2ViNHo/ZeAXiHiaLoQy3WPkXNNO7mPSQVydyqLXIuW
 XnpqxpmORbSAJVeFgOj201zzexuifWp1jNNvr321eHINNv2s3M1eX+wmoZA2L7kR6V6M
 SIW/RrePFN/BaiNWuUtMLtaEBR3/6yBkaBbGlru0XyWD9BdZxfHPGCoKhFB/ej+cb6+M
 vFTlEJzSyW8pN3j8a3+0/RXeGMps73CZtPy4yrelYf1bea10mWj7LectS+ERxQyNF0Kb
 +k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vzojOIjXWxLiO6TIP3hVvjZj3nBXkO4u+Tv0gqgyYy4=;
 b=cAM7YOpHBeBxbvBtF9neWOkqpfOG3KwtCkoosV/SBeAg6lSHjUguivkiWju6xptZ+r
 8qSRgC70qpdaddz5NcFm2DEIhMC3a0NXXL3YPXUchn8/Fu+Hfkhq3oe2PqjqdSLJEnaY
 9dUP2NYpX7Ae8JdsWHTqLkxMDuURpip+WwTIBWAmbwH8mrYcYCR4EN+2dQg6VrAJyQsi
 /z9XYmj8cvmnkieYzShgJpH5vr5CAMS77RYoffXHj3BtTVm3stXCYxS7UviHdqcL5WkO
 EEoisLVshkPUOYdabWQUCKQPmJRp7jH6oIl53K1kId6bTOltQ1smjTPg+NEx/smvDVSO
 QVfg==
X-Gm-Message-State: AOAM533dPrgengyQu6MNY3z2IgrEBwdhDoDQyaGkunEofPsDjtom9Tmq
 0Z2fEmgl94rZfsgA804FlLnMmQ==
X-Google-Smtp-Source: ABdhPJwgu8q8F0w+plBznp44QJ9D3FkKDpwk9b2oLbAg5Cc6+iUfzHSItu7Rm2kLrjAYixGSkmEQNw==
X-Received: by 2002:ad4:46ad:: with SMTP id
 br13mr24285816qvb.234.1597849444454; 
 Wed, 19 Aug 2020 08:04:04 -0700 (PDT)
Received: from localhost (mobile-166-177-185-175.mycingular.net.
 [166.177.185.175])
 by smtp.gmail.com with ESMTPSA id s56sm25374308qtk.72.2020.08.19.08.04.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 08:04:03 -0700 (PDT)
Date: Wed, 19 Aug 2020 11:03:59 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC 09/20] drm/i915/dp: Extract drm_dp_has_mst()
Message-ID: <20200819150359.GA46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-10-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811200457.134743-10-lyude@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 04:04:46PM -0400, Lyude Paul wrote:
> Just a tiny drive-by cleanup, we can consolidate i915's code for
> checking for MST support into a helper to be shared across drivers.
> 

Reviewed-by: Sean Paul <sean@poorly.run>

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 18 ++----------------
>  include/drm/drm_dp_mst_helper.h         | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 79c27f91f42c0..1e29d3a012856 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4699,20 +4699,6 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  	return true;
>  }
>  
> -static bool
> -intel_dp_sink_can_mst(struct intel_dp *intel_dp)
> -{
> -	u8 mstm_cap;
> -
> -	if (intel_dp->dpcd[DP_DPCD_REV] < 0x12)
> -		return false;
> -
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_MSTM_CAP, &mstm_cap) != 1)
> -		return false;
> -
> -	return mstm_cap & DP_MST_CAP;
> -}
> -
>  static bool
>  intel_dp_can_mst(struct intel_dp *intel_dp)
>  {
> @@ -4720,7 +4706,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>  
>  	return i915->params.enable_dp_mst &&
>  		intel_dp->can_mst &&
> -		intel_dp_sink_can_mst(intel_dp);
> +		drm_dp_has_mst(&intel_dp->aux, intel_dp->dpcd);
>  }
>  
>  static void
> @@ -4729,7 +4715,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder =
>  		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst = intel_dp_sink_can_mst(intel_dp);
> +	bool sink_can_mst = drm_dp_has_mst(&intel_dp->aux, intel_dp->dpcd);
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 8b9eb4db3381c..2d8983a713e8c 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -911,4 +911,26 @@ __drm_dp_mst_state_iter_get(struct drm_atomic_state *state,
>  	for ((__i) = 0; (__i) < (__state)->num_private_objs; (__i)++) \
>  		for_each_if(__drm_dp_mst_state_iter_get((__state), &(mgr), NULL, &(new_state), (__i)))
>  
> +/**
> + * drm_dp_has_mst() - check whether or not a sink supports MST
> + * @aux: The DP AUX channel to use
> + * @dpcd: A cached copy of the DPCD capabilities for this sink
> + *
> + * Returns: %True if the sink supports MST, %false otherwise
> + */
> +static inline bool
> +drm_dp_has_mst(struct drm_dp_aux *aux,
> +	       const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 mstm_cap;
> +
> +	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
> +		return false;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
> +		return false;
> +
> +	return !!(mstm_cap & DP_MST_CAP);
> +}
> +
>  #endif
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
