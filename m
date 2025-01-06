Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D4DA0260A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1510E646;
	Mon,  6 Jan 2025 12:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yd12AA/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2910E646
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:54:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so318549666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 04:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736168037; x=1736772837; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=Yd12AA/RD0pHgoVfDJ4KGhRoHSYFNaVAr7WC5qwnfOHHeIx+o8skso3fkZIYob6Qdw
 i2o3ROKEHQJmPWlpDK9NTaNaMO9q5L1QksRoiItvzMHXQxcgp2LHPmzaJzrMvfM09DY+
 LXHqcamUkGh72Q3wzm7306dqYOAfzMX+7ZI4dxoZcX4/QvICJWXfoEsrEfx+M59TJIcR
 69sPQVVAeD8RCkFAGlsen8tMcsUf+FcgO81gcPWRFUwXilRyBVHLKz9iQKnJMyU60FLD
 b5RmzqLpVBBq8SrsABbtKNjwM/BSpFfWrruB28dkHGBdnsY8ZD8cSuM9rPiMPRr6lOBT
 WvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736168037; x=1736772837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=nzZVrLQdZlhHrjktJAcYYZ7GlYX2a1Zii+a0SSF1FK85LrKbKWmYVXf6XGPAWnZ1Zv
 KQ3WOPXTSyehJ+7Kh7LjobVDiE5jN/by+XerhfWpRK/X+eKN8rUCU4z7sv7uPJvXrr+w
 w0SdCKxBx05GtACUBpoQI8ZfDYZYvT5CnlMsL7nCyusDi9TLyjCbb9cYRsNEbQ8kcEtR
 903Hj6u0KSJHLX8guoYDTBHB7IeGBIddCr485ws1rQUAeXk/pwlYY1tLJp1/XGTzjzvg
 R0qoGNI1g/71csFjIGP7ZdQHrU3GFnGZFyvfOoKAjeGcT26j/0HWWe7rZS0Be7xjnfQR
 SY0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQGw/L/o1oYhuVWMOAx5R0nFLNeh9UgMgoQPG5nf9cUNxj0WEaLczso+80GQBlt3hojdjpa1D7l+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvuf0A+r4Yz+IrvLndAPmcrIYiEfzf01kI6cCmO61WGpKthBlM
 ntEGOb7CTkMB7J4TQQs4/KHm/jzBDxXSw+wdiKB284bZ//Rm6UDBs5LK03LZn7wv6YKbN8croNi
 J
X-Gm-Gg: ASbGnctu9peoXFYFa3JHLYTccvkWApe0hNfMGtNR4JhG/zSOihUdflcVP5tmfhUVf24
 P9EiDmQCEuiwxZ1+AGHQbyGAu5LK8OYnt6Jw340cnUzWXS2iAOh1UxESTKU7AW0KxUjjI++ExAE
 LQlJCroQ18himHTxG1kQSqQe2YmW4cJThUY1VwQzmTV5dXyFEqKb3dUE3s+293TlKqnIJfirWiy
 Vcz0fRG1iI3HcTz3rvMyNtx03yl1TL2Iv4eyHQQ6BDYrzrRXhe8azc=
X-Google-Smtp-Source: AGHT+IGPXXCGpVVL8gkklF9ZQV+if58UuE9ZivrnPJUbIt2RzTzppNgGN6AJ5opvpHjGWhdKOASxmQ==
X-Received: by 2002:a05:6000:4b07:b0:385:fa20:658b with SMTP id
 ffacd0b85a97d-38a221f6135mr46513894f8f.24.1736167552118; 
 Mon, 06 Jan 2025 04:45:52 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm603466965e9.38.2025.01.06.04.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 04:45:51 -0800 (PST)
Date: Mon, 6 Jan 2025 14:45:48 +0200
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
Message-ID: <Z3vQfIIDDgnFJsDn@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
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

On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them, which
> > is handling the explicit disabling of non-transparent mode and its
> > disable->enable sequence mentioned in the DP Standard v2.0 section
> > 3.6.6.1.
> > 
> > So use the new drm generic helper instead as it makes the code a bit
> > cleaner.
> > 
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >  
> > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > -		return false;
> > -
> >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> >  
> > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> >  	int lttpr_count;
> > +	int ret;
> >  
> >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> >  		return 0;
> > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		return lttpr_count;
> >  	}
> >  
> > -	/*
> > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > -	 * non-transparent mode and the disable->enable non-transparent mode
> > -	 * sequence.
> > -	 */
> > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > -
> > -	/*
> > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > -	 * non-transparent mode fall-back to transparent link training mode,
> > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > -	 */
> > -	if (lttpr_count < 0)
> > -		goto out_reset_lttpr_count;
> > -
> > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > +	if (ret) {
> >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> >  
> > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		goto out_reset_lttpr_count;
> >  	}
> >  
> > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > +
> 
> I think the code now misses a way to update intel_dp->lttpr_common_caps
> in a transparent-mode case:
> intel_dp_set_lttpr_transparent_mode(intel_dp, true).

It is being called if the drm_dp_lttpr_init() returns a non-zero value,
but that is not part of the diff here.

> 
> >  	return lttpr_count;
> >  
> >  out_reset_lttpr_count:
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
