Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F05C896FD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CA510E5A1;
	Wed, 26 Nov 2025 11:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FdiR1tcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6EE10E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:07:20 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C37166DE;
 Wed, 26 Nov 2025 12:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764155109;
 bh=HlUaMFAxsmKNYWOafbexHRYhim8kovxpOOvKvBfIkYk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FdiR1tcgOT7t0jOd/x9icUyLa0ng2cR5qjqwDIOZPnt39CfgmsFxcZbe+Lvmj7tUO
 NEyp7pt+gHomHfJ5NYBydh4OeilWVK0As6wU2/AKzMbBtCphfQspI01Ho0bsmDgwRq
 f9g1D+w8xp7XLgVF8NRjpL5yLRohp5LuxnctXaWc=
Message-ID: <5c5e249f-6b42-41a3-a29d-233e84b4cad7@ideasonboard.com>
Date: Wed, 26 Nov 2025 13:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/atomic-helper: Export and namespace some
 functions
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 21/11/2025 16:08, Linus Walleij wrote:
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 54 +++++++++++++++++++++----------------
>  include/drm/drm_atomic_helper.h     | 19 +++++++++++++
>  2 files changed, 50 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d5ebe6ea0acb..906eb4b0852c 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1162,8 +1162,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>  	       new_state->self_refresh_active;
>  }
>  
> -static void
> -encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> @@ -1229,9 +1229,10 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(drm_encoder_bridge_disable);

I'm not sure if it's a hard rule, but probably exported functions should
have a kernel doc.

 Tomi

>  
> -static void
> -crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> @@ -1282,9 +1283,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  			drm_crtc_vblank_put(crtc);
>  	}
>  }
> +EXPORT_SYMBOL(drm_crtc_disable);
>  
> -static void
> -encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> @@ -1335,15 +1337,16 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
>  		drm_bridge_put(bridge);
>  	}
>  }
> +EXPORT_SYMBOL(drm_encoder_bridge_post_disable);
>  
>  static void
>  disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
>  {
> -	encoder_bridge_disable(dev, state);
> +	drm_encoder_bridge_disable(dev, state);
>  
> -	crtc_disable(dev, state);
> +	drm_crtc_disable(dev, state);
>  
> -	encoder_bridge_post_disable(dev, state);
> +	drm_encoder_bridge_post_disable(dev, state);
>  }
>  
>  /**
> @@ -1446,8 +1449,8 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
>  
> -static void
> -crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *new_crtc_state;
> @@ -1508,6 +1511,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
>  		drm_bridge_put(bridge);
>  	}
>  }
> +EXPORT_SYMBOL(drm_crtc_set_mode);
>  
>  /**
>   * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
> @@ -1531,12 +1535,12 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
>  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
>  	drm_atomic_helper_calc_timestamping_constants(state);
>  
> -	crtc_set_mode(dev, state);
> +	drm_crtc_set_mode(dev, state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
>  
> -static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
> -						struct drm_atomic_state *state)
> +void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
> +					 struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *new_conn_state;
> @@ -1555,9 +1559,10 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(drm_atomic_helper_commit_writebacks);
>  
> -static void
> -encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *new_conn_state;
> @@ -1588,9 +1593,10 @@ encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state
>  		drm_bridge_put(bridge);
>  	}
>  }
> +EXPORT_SYMBOL(drm_encoder_bridge_pre_enable);
>  
> -static void
> -crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
> @@ -1619,9 +1625,10 @@ crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(drm_crtc_enable);
>  
> -static void
> -encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
> +void
> +drm_encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *new_conn_state;
> @@ -1664,6 +1671,7 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  		drm_bridge_put(bridge);
>  	}
>  }
> +EXPORT_SYMBOL(drm_encoder_bridge_enable);
>  
>  /**
>   * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
> @@ -1682,11 +1690,11 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
>  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  					      struct drm_atomic_state *state)
>  {
> -	encoder_bridge_pre_enable(dev, state);
> +	drm_encoder_bridge_pre_enable(dev, state);
>  
> -	crtc_enable(dev, state);
> +	drm_crtc_enable(dev, state);
>  
> -	encoder_bridge_enable(dev, state);
> +	drm_encoder_bridge_enable(dev, state);
>  
>  	drm_atomic_helper_commit_writebacks(dev, state);
>  }
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537..39878aa485c3 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -60,6 +60,11 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  int drm_atomic_helper_check_planes(struct drm_device *dev,
>  			       struct drm_atomic_state *state);
>  int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
> +void drm_encoder_bridge_disable(struct drm_device *dev,
> +				struct drm_atomic_state *state);
> +void drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state);
> +void drm_encoder_bridge_post_disable(struct drm_device *dev,
> +				     struct drm_atomic_state *state);
>  int drm_atomic_helper_check(struct drm_device *dev,
>  			    struct drm_atomic_state *state);
>  void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
> @@ -89,8 +94,22 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
>  void
>  drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
>  
> +void drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state);
> +
>  void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
>  					       struct drm_atomic_state *state);
> +
> +void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
> +					 struct drm_atomic_state *state);
> +
> +void drm_encoder_bridge_pre_enable(struct drm_device *dev,
> +				   struct drm_atomic_state *state);
> +
> +void drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state);
> +
> +void drm_encoder_bridge_enable(struct drm_device *dev,
> +			       struct drm_atomic_state *state);
> +
>  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  					  struct drm_atomic_state *old_state);
>  
> 

