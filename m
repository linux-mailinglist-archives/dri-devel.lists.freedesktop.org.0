Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B077A8A63
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AF710E521;
	Wed, 20 Sep 2023 17:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614710E521
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:15:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9ae22bf33a0so264605166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695230139; x=1695834939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BA/1TKZ7fFQpqXSbCVNQn/zfVi+d+HyfuxOxnEyY4I=;
 b=GYgl162t5E/GiBRdU/hnqXnBoKGnoSx0BCsjLg8wt+ajFVTU8qaNAIQU6fn3W20orn
 ZkG7m9lo8sHO05Fe7K706/nKDVB0uLDzsa4uZGG3zK+/WVNYTTge/YpxS15uDPJs1jOi
 83cggrDjw/hbSUHogTWSgzph+GN+Z0e0f+GmZNu7AqcRXubkw3Fb5Fq62Nj2PmPVHGxw
 UUr3km/jamHQv3OhXyTbSNDBWWt9tHkL0oaPfEnsHa3jSDW91fitgr+nTckaBkTZVHOu
 0gQb3ybnVnIFKkLHMApAFkeiPBnFVBot5/nIlDqtpjbTZn+fztdFlPQLiyiaLkCz/vL8
 h8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695230139; x=1695834939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BA/1TKZ7fFQpqXSbCVNQn/zfVi+d+HyfuxOxnEyY4I=;
 b=EIkvO/s+7BpDDlS4YRpPX5QiWCaynxt+q1J3fXhzJEg8eP9H+V/SYqmwOeIVvECEPV
 9xeosaY870ntW9kM8CRpFZLKgPPeyLOR7HZSRFy0THpeWoW3F6ihsaw+djKL2qeRMNCj
 h9AWflK3yNWi5DxUivXnh8xxXJ8gATTUXKMrQgg8uiGV7NggnkkXebWRqwj9tUCqNWeV
 AX+JbmGL12UU0bDvGwfVMcUCPnpxOqcaz3+CGLesMBUccFNroSBo9r/tz+2gwG4TDazP
 UMww+voAr8tYOpw2KCwqRf9GRyANUXXcaVrNib7389hAqwFKZST9c++d8HCLI3vgBW2f
 yoTA==
X-Gm-Message-State: AOJu0Yx8sRDSoM16ItTlwiUPYQ+a6oUPZzeFqzp/UdL3DX+jsiF4o9d+
 nx4h/4DyTOy3GN9qmnmd7K4=
X-Google-Smtp-Source: AGHT+IEQhqAdu9sZQ70y0DS8nngdK+Mk0pkfbWS4qneo1KxLRSZ3qBsiVtqIu4sC8i/YErZyL1rzjQ==
X-Received: by 2002:a17:906:3147:b0:993:eee4:e704 with SMTP id
 e7-20020a170906314700b00993eee4e704mr4288238eje.38.1695230139300; 
 Wed, 20 Sep 2023 10:15:39 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 lx12-20020a170906af0c00b00988f168811bsm9649634ejb.135.2023.09.20.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 10:15:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC v2 07/37] drm/connector: hdmi: Add HDMI compute clock
 helper
Date: Wed, 20 Sep 2023 19:15:37 +0200
Message-ID: <1967070.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-7-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
 <20230920-kms-hdmi-connector-state-v2-7-17932daddd7d@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime!

Dne sreda, 20. september 2023 ob 16:35:22 CEST je Maxime Ripard napisal(a):
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  5 +++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b01cb4783ea6..4c1af97971bb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2944,6 +2944,37 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
>  }
>  EXPORT_SYMBOL(drm_connector_update_privacy_screen);
>  
> +/**
> + * drm_connector_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
> + * @mode: Display mode to compute the clock for
> + * @bpc: Bits per character
> + * @fmt: Output Pixel Format used
> + *
> + * Returns the TMDS Character Rate for a given mode, bpc count and output format.
> + *
> + * RETURNS:
> + * The TMDS Character Rate, in Hertz
> + */
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +				      unsigned int bpc,
> +				      enum hdmi_colorspace fmt)
> +{
> +	unsigned long long clock = mode->clock * 1000ULL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		clock = clock * 2;
> +
> +	if (fmt == HDMI_COLORSPACE_YUV422)
> +		bpc = 8;

I think you're missing YUV420 handling, which needs half of clock speed. But
this is a thing of HDMI2.

Best regards,
Jernej

> +
> +	clock = clock * bpc;
> +	do_div(clock, 8);
> +
> +	return clock;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_compute_mode_clock);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>  				    struct drm_property *property,
>  				    uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a66cb4e35d7b..d74e9c64ee88 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -38,6 +38,7 @@ struct drm_connector_helper_funcs;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>  struct drm_crtc;
> +struct drm_display_mode;
>  struct drm_encoder;
>  struct drm_panel;
>  struct drm_property;
> @@ -2115,6 +2116,10 @@ void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
>  void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +				      unsigned int bpc,
> +				      enum hdmi_colorspace fmt);
>  
>  /**
>   * struct drm_tile_group - Tile group metadata
> 
> 




