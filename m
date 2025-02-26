Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DCA455D9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6485A10E856;
	Wed, 26 Feb 2025 06:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IJkUOYoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DED10E856
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:43:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so773144e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552200; x=1741157000; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=03hf7cikfkdqLENH/7Oyyab0bBLIcuddQc5/XdxjUHo=;
 b=IJkUOYoClJd40UrOKWdMlZFx0D/SQdwPdOS/APguhiRKp18NcRBo1Ur7hnuTVprwjA
 0u0WhJfw4JQV5j8EdoCBHzm0Cl+CFbMbpqBP+fMEp+V827Nz9MUhf+Kse6HhGWmMpZBo
 zQF9C8Wy3AubuTVL00cQjO4zcJKne/O7ewO1bgDHjWZoz42y7P+U1ZSpYEJuo9n1f+jA
 5yHxYkMrZjExhyixwNX45LroDBPbLk6BC92iL4GCfbFsrT6gSoKCU/81M7/MlvEy0zWZ
 V2OWYH5uQE8OrvPlR3UePcKWUdj+KT4t89G2+FlLSKrJ8exsxWUVGNb6amLjWv6Nu6FE
 v1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552200; x=1741157000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03hf7cikfkdqLENH/7Oyyab0bBLIcuddQc5/XdxjUHo=;
 b=XXsMBkYdWTfeKF4bzsCKxosQFw4qaOkU+2YwtDnKmGecMn5ioy7XEn8VnSz4UECPER
 saa7KaqK+W7T+/Np0veUxNL9txxgYoineIiZpe6JRIqo1A4yRJag5kcdoyJJZADsaD7d
 WCHYMQ0w8oovtIZNnkue3QSQ9kuI5Mpp2kmEudIurl2YKBZGHWXAdbR9xgdrODmd6/cI
 Jtc9ErP/0ru4dLWUa6C1pqb9PWVz1XT83qb9hA6W8hVpXmg8oM08VyhXw8X5doLKohWT
 BnoyrgeYA7a+8gCnIzbBPvnn1Mz6ui/md6hBpmnalQoACDGvfglLglmohCAdWxbwRsQg
 0fHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvqiUJxBmcwVcrhQun9EZ/weNpEKZiA6XVP14LzkxO8+IHIOVc/+yE7yK27RuMQE9H+MZ0hacHv0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxla+NW+/SRwbsfIwgP3x5yy13+CkmC/i74KUEY/9qnHnEmCK5S
 fQPYt3wGS7CTVr+SZI+D6Tp9V4N3JKi9dLryiEWYJmSlr0GFrW6dR2rMGu0xPpo=
X-Gm-Gg: ASbGncujo3O1etGHBvNEIq5cCQwbru7f6REkIpxsjiy4nRzfV+d9/aNOxDMpwvdGP+5
 c8LUd+hPGs83Cf7D6xNJ21OQjPVFsAY5qgDvus7Le1ui3MLCa2ZsJi4kF0khRSX/tDDgDgIZ6ZM
 9efEvIo4/2ALhTjtkIDFbm+CzNwB8G2IZB51xx8FgPs8SPdofxEeoD+I49Ujr45Zn5744ZspJ+q
 C38A9j/+xN/DrIXIZOfwdZKTYUQl+Tm3lHuSzy3/amLbHBvZgRkAiZnlBTqZJLSYOdiRWclFKlB
 0ZTZt/t0UEczMaGxo/nF1jqY0NgeSFZWlMU0B6AJwXYpf5pr3sXORMoMy17FupJAOf+8FubqdRR
 Zfqcs2g==
X-Google-Smtp-Source: AGHT+IFEQVjB/Rb0FAYpcYL2VJZKpn7jnf0itAzWlDQxr8WDDIYbvg6zpyGA3H8ls+OgOMlkXjdtfg==
X-Received: by 2002:a05:6512:1194:b0:545:3031:40aa with SMTP id
 2adb3069b0e04-5493c570f6dmr2016310e87.9.1740552200410; 
 Tue, 25 Feb 2025 22:43:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f9e3fsm362600e87.217.2025.02.25.22.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:43:19 -0800 (PST)
Date: Wed, 26 Feb 2025 08:43:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/15] drm/tests: bridge: Provide tests for
 drm_bridge_reset_crtc
Message-ID: <gf36bwz5kpoetdnmwu4xfupxrxciojw3yebfylbwwwu4dhdxkf@6hh5sc5ts3pa>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-8-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-8-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:56PM +0100, Maxime Ripard wrote:
> Let's provide a bunch of kunit tests to make sure
> drm_bridge_reset_crtc() works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 168 +++++++++++++++++++++++++++++++-
>  1 file changed, 167 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
> index c0a05c459d957c3f9d281957f002f6bd36cce367..4bcc761b3ba70bfa0ccc56b0685e35f86bde63fd 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -14,17 +14,57 @@ struct drm_bridge_init_priv {
>  	struct drm_plane *plane;
>  	struct drm_crtc *crtc;
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
>  	struct drm_connector *connector;
> +	unsigned int enable_count;
> +	unsigned int disable_count;
>  };
>  
> +static void drm_test_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_init_priv *priv =
> +		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +
> +	priv->enable_count++;
> +}
> +
> +static void drm_test_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_init_priv *priv =
> +		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +
> +	priv->disable_count++;
> +}
> +
>  static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs = {
> +	.enable			= drm_test_bridge_enable,
> +	.disable		= drm_test_bridge_disable,
>  };
>  
> +static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
> +{
> +	struct drm_bridge_init_priv *priv =
> +		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +
> +	priv->enable_count++;
> +}
> +
> +static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_bridge_init_priv *priv =
> +		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +
> +	priv->disable_count++;
> +}
> +
>  static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
> +	.atomic_enable		= drm_test_bridge_atomic_enable,
>  	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_disable		= drm_test_bridge_atomic_disable,

I think we usually use paired order rather than just ordering those
alphabetically. It makese sense to group .atomic_enable with
.atomic_disable.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_reset		= drm_atomic_helper_bridge_reset,
>  };
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(drm_bridge_remove_wrapper,

-- 
With best wishes
Dmitry
