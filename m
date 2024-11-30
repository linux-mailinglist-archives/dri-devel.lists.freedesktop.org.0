Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE89DEFA9
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 10:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38AF10E3A2;
	Sat, 30 Nov 2024 09:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fSZvnln/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5B010E3A2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:46:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53de880c77eso3143655e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959994; x=1733564794; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O7ukQKCjj+sldLQHYrJwAT1f/L5D9PF1X7vziPXtA6w=;
 b=fSZvnln/cu+Ech3kTOFxIj9jZCskibDk+Yq8synRp+DQg23xcuYF4wisehl1Zkb1zF
 m6OTEqkn2lPjwz91Md9KpOkJjkyqEbeZ/3BdZ5Tx+Gv0UYOUoYDnpz5/PdJbhIE3KPvY
 xIpVxVduahWw3E+kF7lJBWQa9qDHoDAATfc6SpUa60GWjWIHdfAULSQQA5+hdp6nzYWF
 I6KK78YfwT2X3NLLVTZPS/jKtH7YX3CUAi+j3i6M8yXToJCWkoxIEortdGcr9LisxKu5
 eyx8k2Jzy89F1wwtpo0G4E7pV054XR5PGB/q4D9SQKM9mLVKSigjkKQMqtEp9Jd6153t
 eVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959994; x=1733564794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7ukQKCjj+sldLQHYrJwAT1f/L5D9PF1X7vziPXtA6w=;
 b=AH3DCjiIDxqht0bpvGltmcdcnfop7aSJOjfy69WDT7pjI+BgKXM+TmLZwnPJNf9c1n
 qi/7uUu+5ZsxzzZ1MIgjZLfmj5pnfCVD9szMO+Z5F1XZgpt6ls55D8PcyN0GnPasxOoQ
 YkTcnQH9vIkMFloJB7eQJDTk4wLEM1mkGZxCFE26y3ihRpDKHjntB237ZEdC+RdiHv0w
 rcVt+W5vqDSyyyjlMepekiXEGcHvqpTcwuaS9fYTiZNUFRvMA8ysLgrvEr5TySv6u0eh
 J7AN7CT0RJ95vtfWHj3F2KLIdrsPZhdOYDChg72DsVsgo4AhBbK88r+0e8zBqnUsov6x
 Ovtw==
X-Gm-Message-State: AOJu0YzQM7FoAzmSkXzCFDnr/sZtxFn7V7lBf8t1wI4JzJxkJFWuwZct
 IAC7jrLfOdWZ4X2Yazxv9Ysb02feEb3jDlyTElsx6rqPdfaHGvBj1f3IwhbPaKI=
X-Gm-Gg: ASbGncsSXhF7OBwk3u/T26xbkRoYjWqvYoS0Wk2IQVFcxr8eFdj+D7B2p14/VeV1XHg
 nNHGxtscQbqm3+3WYLJthzAG2LbEse9cxTEtGrnf78m9UH9tscc1wHF0CEP5kXu67Uftlpmx+jA
 7B+NTBzRNQmRTU/fQvRtZBxhsVy81m15cVvF6MgySJHXUVrjlJOG03Wd+MpdbGy33LyBGP/Phoo
 mBIiAtPGymcnVW/jkJIuKx1lC2YEhx8jGkPIpDh57scfJB6AH3hxLIqrrPuGaMieW5+/8KkbFDA
 hVzFpT7IQJbbLsWK8sB5hb3pbaSEJw==
X-Google-Smtp-Source: AGHT+IGGGm0wLvdw3rzGApBnosBq0rIEyEKzpB6WvavDO1jpjLzwEUcFhhstL3HqJPE15XR8fgV2sw==
X-Received: by 2002:a05:6512:2215:b0:53d:a321:db74 with SMTP id
 2adb3069b0e04-53df0112176mr9569064e87.50.1732959994479; 
 Sat, 30 Nov 2024 01:46:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496a38sm717132e87.214.2024.11.30.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:46:33 -0800 (PST)
Date: Sat, 30 Nov 2024 11:46:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Uma Shankar <uma.shankar@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, 
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Message-ID: <bhjkznwq2776cpjun56fqi6qgfu7ezojxs6mv4itb3njws3aeu@ixhixfv6uknj>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-10-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126132730.1192571-10-uma.shankar@intel.com>
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

On Tue, Nov 26, 2024 at 06:57:14PM +0530, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Add helper to initialize 1D segmented LUT
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 27 ++++++++++++++++++++++++++-
>  include/drm/drm_colorop.h     |  4 ++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 111517c08216..871d5660e3b2 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -104,7 +104,6 @@ static int drm_create_colorop_capability_prop(struct drm_device *dev,
>  	return 0;
>  }
>  
> -__maybe_unused

Squash all three patches so that you don't have to play with
__maybe_unused. Then please expand commit message to describe the
problem that you are solving.

>  static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
>  				    struct drm_plane *plane,
>  				    const struct drm_color_lut_range *ranges,
> @@ -338,6 +337,32 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  }
>  EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
>  

Missing kerneldoc

> +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
> +					  struct drm_plane *plane,
> +					  const struct drm_color_lut_range *ranges,
> +					  size_t length, bool allow_bypass)
> +{
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT_MULTSEG, allow_bypass);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_colorop_lutcaps_init(colorop, plane, ranges, length);
> +	if (ret)
> +		return ret;
> +
> +	/* data */
> +	ret = drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_curve_1d_lut_multseg_init);
> +
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass)
>  {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 58e5b87c6d56..9268fffd04f6 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -391,6 +391,10 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  				  bool allow_bypass);
>  int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass);
> +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
> +					  struct drm_plane *plane,
> +					  const struct drm_color_lut_range *ranges,
> +					  size_t length, bool allow_bypass);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> -- 
> 2.42.0
> 

-- 
With best wishes
Dmitry
