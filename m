Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA00A05F8A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9A810E8E0;
	Wed,  8 Jan 2025 15:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XH+rgS6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8EE10E8E0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 15:03:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so6119634a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 07:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736348529; x=1736953329; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RJuigyfwmP8g+AjzZPBKqd3NanhyQaBWQuNEBkBgD08=;
 b=XH+rgS6/0IlZ7gScAlJ/F2UzBihtpp9X29sMd02e0rENaoexwMAvbfiKVt49gIhdVp
 osS8JnKKwu+qJ1Q0eR07vt3Sii6F3MNJPaBrAdGmIYPL1JX0M0BV6AsHq8DOXrqXtF5z
 bTNhrUDjXu7ve2bF5+lmdoVjo7EDEciR0c4o0GnppPfRjtuWNUCSbfd7m0puJejfj/hS
 IzvrqE1PfblrLdii9tjNNBkRCmjEZbGo7eA2EJdIRQKQdFNWlqErHxhkVNZqpPnmRtVN
 UJm1uT5q/K13PNoTcArue9KOg7KfWu4D6JNcIIF/rp2IdwP9Dk9X4NxPMdmFT6/MArW6
 FjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736348529; x=1736953329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJuigyfwmP8g+AjzZPBKqd3NanhyQaBWQuNEBkBgD08=;
 b=Y7eknzx9sH8nsW7ZljFySmcHCqcnUegazOhjrW2GRCqKJcriSX/pb5yRiUqpOsFEKz
 0jWNDIPvwR4I3SnOqXPzpXOv5ZJ4pxEEP+LAuaoRTYgtocL6CnlBIdxu5Ik5EoMEYV1T
 Gsi1HBPfBokWkORd/kwEEUA8HF3djeDsuonLUbatPdg0IDZXoXXQVe21uwU2AkSZz774
 xm2gNIhk6LmjKDrkqUwxbD7VUa7qP9JjcT9ZbZ0N0XKwaI/FLKEu0uJcOCWm5Yg8+t6D
 jT6tfOaqT4riobhaKtE/mk7Vfs5hMPn4zQGXMSkofDUzmjx1DqyG6frThK+EwPNJ/oJ+
 PG3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYOQhej0crYvjm3qmveenoV7u1gMGhghzUxdElvZ4L3ZU+WyTmkQOCp1lR7KuXy7q7+G/YxWvBq4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb9m6rQK7+8J6kWZHRTpmAPpJaIBqBrbaxja/Yh7yOTq+9S72t
 DmpThbPtcGFsG7vBQmeVjdnwqT2K5V6JM6I/Bpr+lreFwK2GTLlbdFuzdq7ASDwSJfClI5xFu/g
 5
X-Gm-Gg: ASbGncveW73wamki1zjmEyP/lBL4BgbLwHU2/gT3gVc9GxQvjbqMvh390tuggOI649c
 EuOsnNNIXIeRj7LGMIltbgY7ZueISzUoQQPgYI4ATEtXPwIEbeTQ46DWbHPtuPoY0MKclyPy7nw
 ZDSi8RhxgUMl5dBg6LrCqJzWutQgkVy1u34v+3fAE70D+z6jfwaqivrj9HSkOYFODlfyn3oqAft
 LE3agkGAiAB0ay26sSTSpZROUqnq8/UJ1u0d6gCUE2EVryqZs5/5/c=
X-Google-Smtp-Source: AGHT+IEBlTrxBtjf7901ssDCnGeSN4NcUwtvM8JV72Q4zJ9UCPrPz4BdIknjwwKXyCc18LVEe1ItmQ==
X-Received: by 2002:a05:600c:3b91:b0:436:46f9:4fc6 with SMTP id
 5b1f17b1804b1-436e26928e6mr24415245e9.8.1736342135088; 
 Wed, 08 Jan 2025 05:15:35 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e21e1esm20577465e9.38.2025.01.08.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:15:34 -0800 (PST)
Date: Wed, 8 Jan 2025 15:15:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <Z356cSOjqJYrSMvt@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
 <Z3vQfIIDDgnFJsDn@linaro.org>
 <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-01-08 15:11:50, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 02:45:48PM +0200, Abel Vesa wrote:
> > On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> > > On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > > > LTTPRs operating modes are defined by the DisplayPort standard and the
> > > > generic framework now provides a helper to switch between them, which
> > > > is handling the explicit disabling of non-transparent mode and its
> > > > disable->enable sequence mentioned in the DP Standard v2.0 section
> > > > 3.6.6.1.
> > > > 
> > > > So use the new drm generic helper instead as it makes the code a bit
> > > > cleaner.
> > > > 
> > > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> > > >  1 file changed, 5 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> > > >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > > >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > > >  
> > > > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > > > -		return false;
> > > > -
> > > >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> > > >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> > > >  
> > > > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> > > >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > > >  {
> > > >  	int lttpr_count;
> > > > +	int ret;
> > > >  
> > > >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> > > >  		return 0;
> > > > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > > >  		return lttpr_count;
> > > >  	}
> > > >  
> > > > -	/*
> > > > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > > > -	 * non-transparent mode and the disable->enable non-transparent mode
> > > > -	 * sequence.
> > > > -	 */
> > > > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > > > -
> > > > -	/*
> > > > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > > > -	 * non-transparent mode fall-back to transparent link training mode,
> > > > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > > > -	 */
> > > > -	if (lttpr_count < 0)
> > > > -		goto out_reset_lttpr_count;
> > > > -
> > > > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > > > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > > > +	if (ret) {
> > > >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> > > >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> > > >  
> > > > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > > >  		goto out_reset_lttpr_count;
> > > >  	}
> > > >  
> > > > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > > > +
> > > 
> > > I think the code now misses a way to update intel_dp->lttpr_common_caps
> > > in a transparent-mode case:
> > > intel_dp_set_lttpr_transparent_mode(intel_dp, true).
> > 
> > It is being called if the drm_dp_lttpr_init() returns a non-zero value,
> > but that is not part of the diff here.
> 
> Ack, thanks for the explanation. I'd suggest mentioning that in the
> commit message.

Sure. Will do.

> 
> > 
> > > 
> > > >  	return lttpr_count;
> > > >  
> > > >  out_reset_lttpr_count:
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing!

Abel
