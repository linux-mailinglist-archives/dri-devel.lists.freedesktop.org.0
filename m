Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE329A4E83
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8210E29E;
	Sat, 19 Oct 2024 14:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="StMndGhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06710E29E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:11:08 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so4212853e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729347066; x=1729951866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
 b=StMndGheo+U6KxSI4zEtZQTARq0kFgFm2FvPp810XoTFvJxXzlBZjbz+7u576Tz8PG
 eYgTMYb20e9Zt5IzWnP/hAZzcr2uBszmhNa8zv1iflkGXuuY4XQyvIx5SZpWqSwkZ/3/
 YySohs5q8qPXfJMqlJyRCQHa8/i4ZIzBKQGqJxmCncNeaJ4cqSOFsBMcVq4ght2v4UgP
 tYoJQFtcaS2GAicrMU/EG2M40NfFUGJZzAbPiPw3WWFCVow5MP2hOcD54mlIMoW0alaz
 RxAAy7Y9iNbmgqB01X9qkdme2Lu8YJ+RME/60ufh5gs3JEiFNjX1nZMHOc/KnFuXuu94
 NZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729347066; x=1729951866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
 b=q1z8t4XUvuC0ZkM+CCff3K6S5Qrqpw6UclqGdQgJa+ToEeRQ+i8PkfUDwdL/q2qoku
 oJkDSKkhLHqJWHCpzwWREUyqkPBumBZWz71AkkH48pjD9YuvtPwpUKvnuCK8isS6FRt3
 I90q+hg+qMJv+CDJ5Mcw4yuRFCZKYlBxqBLOhzWvxvpztyQKQEjt3HjH/3h3eiAktHH9
 jz1jIReDXwbd9UHEsx+QWzB7TREQCLDfy+OGbFWc0j4itZNEIF2dsXpRzT49Kd4Ft/QH
 U7uR9nlS5JJye5YeNBYIBFnYvq8gmgIKAkfsbmq1mKKdVyX3gqpULPl0JaMR/wvhfgkJ
 tK5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIOT3a627VgV1PTZdfXr52gnnFGHRcK29B+uY2kk8zB6ixWqzPl4EegkMRTiVYN4CIiwUJ7JFf7Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKoozqWXXAThaq4WRNRTadLNJ2kfMGj03eI1EB8rWNq5NwSFLL
 pEPctX3VlOfAND9C+0otyv2DqKynf4pOWUbbFQeJPiuR+n/fw6baoWh+iLuYnzs=
X-Google-Smtp-Source: AGHT+IHpUlM2mb4sZE/F8kO/aL/+SbKMUhUOFGlRdpwHPf22GTTWehOQZojukTZmgNNOEorXiPGafQ==
X-Received: by 2002:a05:6512:3e0b:b0:539:eb44:7ec3 with SMTP id
 2adb3069b0e04-53a1522d8bfmr3412287e87.31.1729347066370; 
 Sat, 19 Oct 2024 07:11:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a152203c2sm543967e87.299.2024.10.19.07.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:11:05 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:11:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
Message-ID: <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-2-ryan@testtoast.com>
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

On Sun, Sep 29, 2024 at 10:04:33PM +1300, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Currently, CSC module takes care only for converting YUV to RGB.
> However, DE3 is more suited to work in YUV color space. Change CSC mode
> argument to format type to be more neutral. New argument only tells
> layer format type and doesn't imply output type.
> 
> This commit doesn't make any functional change.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 828b86fd0cabb..7322770f39f03 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -22,14 +22,14 @@ struct sun8i_mixer;
>  
>  #define SUN8I_CSC_CTRL_EN		BIT(0)
>  
> -enum sun8i_csc_mode {
> -	SUN8I_CSC_MODE_OFF,
> -	SUN8I_CSC_MODE_YUV2RGB,
> -	SUN8I_CSC_MODE_YVU2RGB,
> +enum format_type {

enum sun8i_format_type, unless there is a strong reason to name it
otherwise.

> +	FORMAT_TYPE_RGB,
> +	FORMAT_TYPE_YUV,
> +	FORMAT_TYPE_YVU,
>  };
>  
>  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum sun8i_csc_mode mode,
> +				     enum format_type fmt_type,
>  				     enum drm_color_encoding encoding,
>  				     enum drm_color_range range);
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> 

-- 
With best wishes
Dmitry
