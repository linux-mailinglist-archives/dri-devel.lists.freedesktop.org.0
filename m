Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8458CCF6E
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C33210E052;
	Thu, 23 May 2024 09:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d20eqLJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF110E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:37:47 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so106010991fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716457066; x=1717061866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SbtplpmpPo1tIVSyyQuZaq4Je2fwXqMCocDbrqYpVcE=;
 b=d20eqLJe1ag6QDJRPil2KZ7p6wx5yMd+qEr9Ei+RSYecCxXgGj2GE8dN41vM8gIl7u
 vRH6L7Yzri0vTPsBgCF+qhfPJz4jP6KbRzR5hp156JCDQMv8PBnDSfAB+0L+W9YdjWzQ
 KgSDQoPytdQU8JfxGKn8fd3sdxa1T0BnYKw7vQsLqKWRyNjRdUzB1YrBqh2bJ6MpE6oK
 SgN1CnfNld3swAr8P1UuJoNzy1HGrPjIoxtUxTxypyr6+AM+O31a/obF6BcW/HFeNxz8
 oKn/ZjU6x2lNOAyN+BhABbQZ4iFheoVno1MqBN2M+IG16S1TXRwFYa15e+qzkozzhua5
 PIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457066; x=1717061866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbtplpmpPo1tIVSyyQuZaq4Je2fwXqMCocDbrqYpVcE=;
 b=XxvgU8edUVizKe9vwNPjIO9SkS3/k+u23AYsjFS51NL6AqgZOaR8x2Oh9rjEXqLdVf
 EUoiJalZgkKHC5ydOIsc6ceb3bGoUqd6JAqDI6PimzXas9cQfuyZZvGjDRyYIsEznUqD
 3VU6rv0SoSS0f3QSrAiZfwivvW5lb8lPVKgvvqJ9cBOXr2WRop4UXkGNHyyk/V1Sj/lx
 myJdQfzdDOYz8Na3v51uNe4hoVsOmXT42gt0iYSitx6QTY9nwRBzZu5Q1Wqq20wQTfbl
 ARlYXQJy6z1w9c60B66pnrVa5cNqklQoejqZ2rvnznAxaJIDrzlyt5kxX+I7u2a+/Xrd
 ErfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVclzmyB65ZhXSxK+f9NC5s55/xT6F475B8oOjyC5vFzGZDVgd0pBcntz/crW24Yw50gL0YgytiLLYon/IoV6aMalZmzNNInAdP+0TuyvgV
X-Gm-Message-State: AOJu0YwLvT4Oi1J1FPUG9xHN9D3lSa0nEpx7CfkJE/6QOX0nVTbXGIX9
 GxBFHyPrHFqkExvD++4NRTVe/Ng4xYNCq49xsjXTce/4gs+oC4UFThCAxc3WeNFREpW/1tDPdzl
 L
X-Google-Smtp-Source: AGHT+IHqJtv15hUgyIuf/PqlwYbirx+pXbxomvRBOWOOi94YU/Q64qb1oAcP8REV+yec+knrG9zq/Q==
X-Received: by 2002:a2e:9dc8:0:b0:2e1:18d:5b4f with SMTP id
 38308e7fff4ca-2e949540b40mr26515691fa.42.1716457065632; 
 Thu, 23 May 2024 02:37:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbcba8sm42053591fa.2.2024.05.23.02.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:37:45 -0700 (PDT)
Date: Thu, 23 May 2024 12:37:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 09/28] drm/display: hdmi: Add HDMI compute clock helper
Message-ID: <vjsv2fn4wdlzkcu6bkssbzv26hjihzrjvzzoynyabuju7sigo6@gnmyc4nqfk22>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-9-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-9-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:42PM +0200, Maxime Ripard wrote:
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c | 57 +++++++++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_helper.h     |  4 +++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> index faf5e9efa7d3..679eb3e81393 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -193,5 +193,62 @@ void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
>  	}
>  
>  	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
>  }
>  EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
> +
> +/**
> + * drm_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
> + * @mode: Display mode to compute the clock for
> + * @bpc: Bits per character
> + * @fmt: Output Pixel Format used
> + *
> + * Returns the TMDS Character Rate for a given mode, bpc count and output format.
> + *
> + * RETURNS:
> + * The TMDS Character Rate, in Hertz, or 0 on error.
> + */
> +unsigned long long
> +drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +			    unsigned int bpc, enum hdmi_colorspace fmt)
> +{
> +	unsigned long long clock = mode->clock * 1000ULL;
> +	unsigned int vic = drm_match_cea_mode(mode);
> +
> +	/*
> +	 * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
> +	 * mandates that VIC 1 always uses 8 bpc.
> +	 */
> +	if (vic == 1 && bpc != 8)
> +		return 0;
> +
> +	if (fmt == HDMI_COLORSPACE_YUV422) {
> +		/*
> +		 * HDMI 1.4b Spec, section 6.2.3 - Pixel Encoding Requirements

This is probably 6.2.4, but it doesn't specify that it is 36-bit _only_.

> +		 * specifies that YUV422 is 36-bit only.
> +		 */
> +		if (bpc != 12)
> +			return 0;

6.5.1 allows using less than 12 bits (If fewer than 12 bits are
used...). So I think it would be more correct to allow less than 12 bpc,
but we'd still have to use 8 for the matter of the calculating the
clock.

> +
> +		/*
> +		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding
> +		 * specifies that YUV422 requires two 12-bits components per
> +		 * pixel clock, which is equivalent in our calculation to three
> +		 * 8-bits components
> +		 */
> +		bpc = 8;
> +	}
> +
> +	/*
> +	 * HDMI 2.0 Spec, Section 7.1 - YCbCr 4:2:0 Pixel Encoding
> +	 * specifies that YUV420 encoding is carried at a TMDS Character Rate
> +	 * equal to half the pixel clock rate.
> +	 */
> +	if (fmt == HDMI_COLORSPACE_YUV420)
> +		clock = clock / 2;
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		clock = clock * 2;
> +
> +	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> +}
> +EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
> index 76d234826e22..57e3b18c15ec 100644
> --- a/include/drm/display/drm_hdmi_helper.h
> +++ b/include/drm/display/drm_hdmi_helper.h
> @@ -22,6 +22,10 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
>  				    const struct drm_connector_state *conn_state);
>  
>  void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
>  					 const struct drm_connector_state *conn_state);
>  
> +unsigned long long
> +drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +			    unsigned int bpc, enum hdmi_colorspace fmt);
> +
>  #endif
> 
> -- 
> 2.45.0
> 

-- 
With best wishes
Dmitry
