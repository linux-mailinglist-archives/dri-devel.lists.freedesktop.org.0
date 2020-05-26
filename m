Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5A1E2243
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5C16E199;
	Tue, 26 May 2020 12:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CA36E199
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:51:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so8132404wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+5yKSsmMtTmglDNUkTtOU5vu+p4JzlYFy3iga4sTF+A=;
 b=WBYgw0v7l8fDAU0LjaYa4L2FOP1149fkVxMMLDs/MXvJkiGmSMPS8UsFhh8zMM2Y/J
 Ig6g+Wkt/wywlA28XEZhKn58dS7fs7SkdPfVXcyKdT9DK4ziey3Uy9SCL1emBKV2l2jX
 CaY2cawGvRsOnVMtQoCHKheGR/zoMa22tjNjusXikgfrcKSWyFArKGrIL26ruA4zDsiB
 yxN3XM4dunDJajB84By8AY2hNshbQbSD6VEr61EGvL3xgfVsU16LAFYHa3nw9cOUtcK7
 ApKRLmIXMB8RmZqY/qPV83Ma4exZN7Gcka2LqF3MjnRnpTX3cVXkEtuqxAG1cJAkOczI
 f1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+5yKSsmMtTmglDNUkTtOU5vu+p4JzlYFy3iga4sTF+A=;
 b=tAlJs77k8+JAB4GV6GdJWXnzaGQXpzbTz8q31V3cWxhX/eKEfU5caMMbKxumzSAkNN
 rV+WqwW5fvnbgejn6UJIkOOyoNi99oPCf/Ype8XzdoTF3a5hiu2vEdAcGYxdiplWRSDm
 X4YvB2RqBReU3mYIo5tukpAYMrPuytqKy5utckbWVZ5J0/vYZ+A/AmxNBhTdrNUJpipn
 3EwJdmJZnT1JDF4GSF7xIsorEbsVqQeoO+43iW9YVY+Xg/+S2Iqfi6dJjAP0W25qfmvt
 VYZDWpX9e4ZBneKQQeQctFsqQzjLG9AKKDx4lpsVgT5ovTzLQgvW8IgQSYaVSPGmjbpW
 5SnQ==
X-Gm-Message-State: AOAM532qqaToTKdNMW3QyzJj4zoLvhvwpsNSIGbrAg4cqrdP++JDVeMK
 n7kyLvCMy175euOaZFYd6PQ0/w==
X-Google-Smtp-Source: ABdhPJwUFG9ng3QZu/7dfcx8V8myBbg8Je6fcgAqlRdKU3FI4vF3JS6+q0oaWJExLOTPevaNT+Pd9w==
X-Received: by 2002:adf:9166:: with SMTP id j93mr18782717wrj.289.1590497484201; 
 Tue, 26 May 2020 05:51:24 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id z22sm10857448wmf.9.2020.05.26.05.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:51:23 -0700 (PDT)
Subject: Re: [PATCH 10/27] drm: bridge: Pass drm_display_info to
 drm_bridge_funcs .mode_valid()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <d179ccc2-a098-ddd0-32fb-aa711beef810@baylibre.com>
Date: Tue, 26 May 2020 14:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Russell King <linux@armlinux.org.uk>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Chris Zhong <zyw@rock-chips.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Icenowy Zheng <icenowy@aosc.io>,
 Tomasz Stanislawski <t.stanislaws@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Jyri Sarha <jsarha@ti.com>,
 Maciej Purski <m.purski@samsung.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Cornu <philippe.cornu@st.com>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:14, Laurent Pinchart wrote:
> When validating a mode, bridges may need to do so in the context of a
> display, as specified by drm_display_info. An example is the meson
> dw-hdmi bridge that needs to consider the YUV 4:2:0 output format to
> perform clock calculations.
> 
> Bridges that need the display info currently retrieve it from the
> drm_connector created by the bridge. This gets in the way of moving
> connector creation out of bridge drivers. To make this possible, pass
> the drm_display_info to drm_bridge_funcs .mode_valid().
> 
> Changes to the bridge drivers have been performed with the following
> coccinelle semantic patch and have been compile-tested.
> 
> @ rule1 @
> identifier funcs;
> identifier fn;
> @@
>  struct drm_bridge_funcs funcs = {
>  	...,
>  	.mode_valid = fn
>  };
> 
> @ depends on rule1 @
> identifier rule1.fn;
> identifier bridge;
> identifier mode;
> @@
>  enum drm_mode_status fn(
>  	struct drm_bridge *bridge,
> +	const struct drm_display_info *info,
>  	const struct drm_display_mode *mode
>  )
>  {
>  	...
>  }
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 1 +
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 1 +
>  drivers/gpu/drm/bridge/cdns-dsi.c                  | 1 +
>  drivers/gpu/drm/bridge/chrontel-ch7033.c           | 1 +
>  drivers/gpu/drm/bridge/nwl-dsi.c                   | 1 +
>  drivers/gpu/drm/bridge/sii9234.c                   | 1 +
>  drivers/gpu/drm/bridge/sil-sii8620.c               | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 1 +
>  drivers/gpu/drm/bridge/tc358767.c                  | 1 +
>  drivers/gpu/drm/bridge/tc358768.c                  | 1 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c              | 1 +
>  drivers/gpu/drm/bridge/ti-tfp410.c                 | 1 +
>  drivers/gpu/drm/drm_atomic_helper.c                | 3 ++-
>  drivers/gpu/drm/drm_bridge.c                       | 4 +++-
>  drivers/gpu/drm/drm_probe_helper.c                 | 4 +++-
>  drivers/gpu/drm/i2c/tda998x_drv.c                  | 1 +
>  drivers/gpu/drm/omapdrm/dss/dpi.c                  | 1 +
>  drivers/gpu/drm/omapdrm/dss/sdi.c                  | 1 +
>  drivers/gpu/drm/omapdrm/dss/venc.c                 | 1 +
>  include/drm/drm_bridge.h                           | 3 +++
>  21 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 2bc6e4f85171..371f4a9f866d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -585,6 +585,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  anx6345_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
>  			  const struct drm_display_mode *mode)
>  {
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 0d5a5ad0c9ee..81debd02c169 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -944,6 +944,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  anx78xx_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
>  			  const struct drm_display_mode *mode)
>  {
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 69c3892caee5..76373e31df92 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -663,6 +663,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +			   const struct drm_display_info *info,
>  			   const struct drm_display_mode *mode)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index f8675d82974b..486f405c2e16 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -317,6 +317,7 @@ static void ch7033_bridge_detach(struct drm_bridge *bridge)
>  }
>  
>  static enum drm_mode_status ch7033_bridge_mode_valid(struct drm_bridge *bridge,
> +				     const struct drm_display_info *info,
>  				     const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 165000)
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index b14d725bf609..77a79af70914 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -818,6 +818,7 @@ static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
>  			  const struct drm_display_mode *mode)
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index b1258f0ed205..15c98a7bd81c 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -873,6 +873,7 @@ static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
>  }
>  
>  static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
> +					 const struct drm_display_info *info,
>  					 const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > MHL1_MAX_CLK)
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 92acd336aa89..7c0c93c7e61f 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2244,6 +2244,7 @@ static int sii8620_is_packing_required(struct sii8620 *ctx,
>  }
>  
>  static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
> +					 const struct drm_display_info *info,
>  					 const struct drm_display_mode *mode)
>  {
>  	struct sii8620 *ctx = bridge_to_sii8620(bridge);
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 30681398cfb0..b535354150db 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2767,6 +2767,7 @@ static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
>  
>  static enum drm_mode_status
>  dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
>  			  const struct drm_display_mode *mode)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 5ef0f154aa7b..c223fb9a04cb 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -924,6 +924,7 @@ static void dw_mipi_dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  static enum drm_mode_status
>  dw_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +			      const struct drm_display_info *info,
>  			      const struct drm_display_mode *mode)
>  {
>  	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index e4c0ea03ae3a..c2777b226c75 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1306,6 +1306,7 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>  }
>  
>  static enum drm_mode_status tc_mode_valid(struct drm_bridge *bridge,
> +					  const struct drm_display_info *info,
>  					  const struct drm_display_mode *mode)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 6650fe4cfc20..4a463fadf743 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -529,6 +529,7 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  tc358768_bridge_mode_valid(struct drm_bridge *bridge,
> +			   const struct drm_display_info *info,
>  			   const struct drm_display_mode *mode)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 97d8129760e9..86b06975bfdd 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -51,6 +51,7 @@ static int thc63_attach(struct drm_bridge *bridge,
>  }
>  
>  static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
> +					const struct drm_display_info *info,
>  					const struct drm_display_mode *mode)
>  {
>  	struct thc63_dev *thc63 = to_thc63(bridge);
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index f065a96a0917..1f49aca06a9f 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -192,6 +192,7 @@ static void tfp410_disable(struct drm_bridge *bridge)
>  }
>  
>  static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
> +					      const struct drm_display_info *info,
>  					      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock < 25000)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 85d163f16801..c1178518dc7a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -506,7 +506,8 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  	}
>  
>  	bridge = drm_bridge_chain_get_first_bridge(encoder);
> -	ret = drm_bridge_chain_mode_valid(bridge, mode);
> +	ret = drm_bridge_chain_mode_valid(bridge, &connector->display_info,
> +					  mode);
>  	if (ret != MODE_OK) {
>  		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index fe1e3460b486..64f0effb52ac 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -377,6 +377,7 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
>   * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
>   *				 encoder chain.
>   * @bridge: bridge control structure
> + * @info: display info against which the mode shall be validated
>   * @mode: desired mode to be validated
>   *
>   * Calls &drm_bridge_funcs.mode_valid for all the bridges in the encoder
> @@ -390,6 +391,7 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
>   */
>  enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
>  			    const struct drm_display_mode *mode)
>  {
>  	struct drm_encoder *encoder;
> @@ -404,7 +406,7 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  		if (!bridge->funcs->mode_valid)
>  			continue;
>  
> -		ret = bridge->funcs->mode_valid(bridge, mode);
> +		ret = bridge->funcs->mode_valid(bridge, info, mode);
>  		if (ret != MODE_OK)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 576b4b7dcd89..f5d141e0400f 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -114,7 +114,9 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  		}
>  
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		ret = drm_bridge_chain_mode_valid(bridge, mode);
> +		ret = drm_bridge_chain_mode_valid(bridge,
> +						  &connector->display_info,
> +						  mode);
>  		if (ret != MODE_OK) {
>  			/* There is also no point in continuing for crtc check
>  			 * here. */
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 9517f522dcb9..50fd119a5276 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -1379,6 +1379,7 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
>  }
>  
>  static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
> +				     const struct drm_display_info *info,
>  				     const struct drm_display_mode *mode)
>  {
>  	/* TDA19988 dotclock can go up to 165MHz */
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index 5110acb0c6c1..1d2992daef40 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -434,6 +434,7 @@ static int dpi_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  dpi_bridge_mode_valid(struct drm_bridge *bridge,
> +		       const struct drm_display_info *info,
>  		       const struct drm_display_mode *mode)
>  {
>  	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
> index 417a8740ad0a..033fd30074b0 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -140,6 +140,7 @@ static int sdi_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  sdi_bridge_mode_valid(struct drm_bridge *bridge,
> +		      const struct drm_display_info *info,
>  		      const struct drm_display_mode *mode)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 9701843ccf09..4406ce2a08b4 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -548,6 +548,7 @@ static int venc_bridge_attach(struct drm_bridge *bridge,
>  
>  static enum drm_mode_status
>  venc_bridge_mode_valid(struct drm_bridge *bridge,
> +		       const struct drm_display_info *info,
>  		       const struct drm_display_mode *mode)
>  {
>  	switch (venc_get_videomode(mode)) {
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index ea2aa5ebae34..e3d7f36d8c39 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -35,6 +35,7 @@
>  struct drm_bridge;
>  struct drm_bridge_timings;
>  struct drm_connector;
> +struct drm_display_info;
>  struct drm_panel;
>  struct edid;
>  struct i2c_adapter;
> @@ -112,6 +113,7 @@ struct drm_bridge_funcs {
>  	 * drm_mode_status Enum
>  	 */
>  	enum drm_mode_status (*mode_valid)(struct drm_bridge *bridge,
> +					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
>  	/**
> @@ -836,6 +838,7 @@ bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>  				 struct drm_display_mode *adjusted_mode);
>  enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
>  			    const struct drm_display_mode *mode);
>  void drm_bridge_chain_disable(struct drm_bridge *bridge);
>  void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
