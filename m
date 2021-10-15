Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5442EABC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DCA6ECF6;
	Fri, 15 Oct 2021 07:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F586ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:56:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p21so1736735wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ouMND3NfgeuvBPlPm7cUu4Hy0WrY9I65gt8nxTJtUhE=;
 b=qHuQFtnCrLeQOkmQQhzU1KpIIJj3II+/U6afpBeQdPql25AeJeVFH6laPhmGzuz/Vz
 puoNkFkIilpJR9iF5nvC0NJ/3UilqqAlrg9izXiOZL5eL9/06OA/wpXvCB3D/56Pwh58
 Nvfb17mlh1LI4BlOe1yo8IFdENfILjqgC9cl7idZSQ4RKoYYHNU/x3UOhReyZ6HtAvNg
 WZa4gT+ObZROiNOGjNpQWDu8kz5bAubm7vfdZSbiWfMV4tAIMWOKfTcA8kXCEj5+A39L
 XFtoKYYZkgX/CQMdkfCyj6uuQxIMKKulRE1EG8HecSnDmtIYl4lmMWIOs1H6RC6AGIPs
 oAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ouMND3NfgeuvBPlPm7cUu4Hy0WrY9I65gt8nxTJtUhE=;
 b=oIEq8xnvUj2xDYPX/lVycXtehW2AX6U2LVsncEfctW5/m+59A1hzxyPoV86MmSRXV2
 Ebk3esd/SXw1QKa5QFhN5Oc0ivpsSUTOkljimnM/jhnB69cBB4wLNWBUzdzydilEhCAA
 cbsevuOUh5h0bSNMEPuuYqqmLD5DTBi7XPip5OkPoLEcwonjRvm3SPI6opRF68f+pvFr
 nxLZV3HNssMw53wgtXmkfc8GFW0RW45Fl8ArDlI2ovT2TdzJnjmVscHCYzUhxmbkb7XE
 F8IZV84fC/PaGhtIWsTfVCwrfeDLS3GGFJltTnZcp4EPVuhAcRCmE3TV7IAWQv5lXz2S
 1jdQ==
X-Gm-Message-State: AOAM5307QJRRP6S/7eS2+dqgERsEFxTH6LmDPII4gXyRs9xGFfrppFLP
 M+SngDea1IcIDVkgvSubxD9JHA==
X-Google-Smtp-Source: ABdhPJz16Agy1BFqoD4jlLaknHtUbUto/Gw7QmEJ6N1uhX8dPx0OUNX4UbhtHbEjgazVmylcYz0WpA==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr25135821wmh.167.1634284582825; 
 Fri, 15 Oct 2021 00:56:22 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb?
 ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id l20sm14239892wmq.42.2021.10.15.00.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 00:56:22 -0700 (PDT)
Subject: Re: [PATCH 7/7] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-8-narmstrong@baylibre.com>
 <YWhzyIBemCrm9U5v@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <774b3d69-6b54-433b-c59d-7f3375456072@baylibre.com>
Date: Fri, 15 Oct 2021 09:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWhzyIBemCrm9U5v@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi Sam,

On 14/10/2021 20:15, Sam Ravnborg wrote:
> Hi Neil,
> 
> with include order fixed and the comment below considered:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> 
> On Thu, Oct 14, 2021 at 05:26:06PM +0200, Neil Armstrong wrote:
>> Drop the local connector and move all callback to bridge funcs in order
>> to leverage the generic CVBS diplay connector.
>>
>> This will also permit adding custom cvbs connectors for ADC based HPD
>> detection on some Amlogic SoC based boards.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 178 +++++++++------------
>>  1 file changed, 79 insertions(+), 99 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
>> index 01024c5f610c..0b974667cf55 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
>> @@ -13,6 +13,9 @@
>>  #include <linux/of_graph.h>
>>  
>>  #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_probe_helper.h>
> alphabetic order.
> 
>> @@ -30,14 +33,14 @@
>>  
>>  struct meson_encoder_cvbs {
>>  	struct drm_encoder	encoder;
>> -	struct drm_connector	connector;
>> +	struct drm_bridge	bridge;
>> +	struct drm_bridge	*next_bridge;
>> +	struct drm_connector	*connector;
> Maybe drop this - see later.
> 
>>  	struct meson_drm	*priv;
>>  };
>> -#define encoder_to_meson_encoder_cvbs(x) \
>> -	container_of(x, struct meson_encoder_cvbs, encoder)
>>  
>> -#define connector_to_meson_encoder_cvbs(x) \
>> -	container_of(x, struct meson_encoder_cvbs, connector)
>> +#define bridge_to_meson_encoder_cvbs(x) \
>> +	container_of(x, struct meson_encoder_cvbs, bridge)
>>  
>>  /* Supported Modes */
>>  
>> @@ -81,21 +84,18 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
>>  	return NULL;
>>  }
>>  
>> -/* Connector */
>> -
>> -static void meson_cvbs_connector_destroy(struct drm_connector *connector)
>> +static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
>> +				     enum drm_bridge_attach_flags flags)
>>  {
>> -	drm_connector_cleanup(connector);
>> -}
>> +	struct meson_encoder_cvbs *meson_encoder_cvbs =
>> +					bridge_to_meson_encoder_cvbs(bridge);
>>  
>> -static enum drm_connector_status
>> -meson_cvbs_connector_detect(struct drm_connector *connector, bool force)
>> -{
>> -	/* FIXME: Add load-detect or jack-detect if possible */
>> -	return connector_status_connected;
>> +	return drm_bridge_attach(bridge->encoder, meson_encoder_cvbs->next_bridge,
>> +				 &meson_encoder_cvbs->bridge, flags);
>>  }
>>  
>> -static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
>> +static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
>> +					struct drm_connector *connector)
>>  {
>>  	struct drm_device *dev = connector->dev;
>>  	struct drm_display_mode *mode;
>> @@ -116,40 +116,18 @@ static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
>>  	return i;
>>  }
>>  
>> -static int meson_cvbs_connector_mode_valid(struct drm_connector *connector,
>> -					   struct drm_display_mode *mode)
>> +static int meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
>> +					const struct drm_display_info *display_info,
>> +					const struct drm_display_mode *mode)
>>  {
>> -	/* Validate the modes added in get_modes */
>> -	return MODE_OK;
>> -}
>> -
>> -static const struct drm_connector_funcs meson_cvbs_connector_funcs = {
>> -	.detect			= meson_cvbs_connector_detect,
>> -	.fill_modes		= drm_helper_probe_single_connector_modes,
>> -	.destroy		= meson_cvbs_connector_destroy,
>> -	.reset			= drm_atomic_helper_connector_reset,
>> -	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
>> -	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>> -};
>> -
>> -static const
>> -struct drm_connector_helper_funcs meson_cvbs_connector_helper_funcs = {
>> -	.get_modes	= meson_cvbs_connector_get_modes,
>> -	.mode_valid	= meson_cvbs_connector_mode_valid,
>> -};
>> +	if (meson_cvbs_get_mode(mode))
>> +		return MODE_OK;
>>  
>> -/* Encoder */
>> -
>> -static void meson_encoder_cvbs_encoder_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> +	return MODE_BAD;
>>  }
>>  
>> -static const struct drm_encoder_funcs meson_encoder_cvbs_encoder_funcs = {
>> -	.destroy        = meson_encoder_cvbs_encoder_destroy,
>> -};
>> -
>> -static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
>> +static int meson_encoder_cvbs_atomic_check(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *bridge_state,
>>  					struct drm_crtc_state *crtc_state,
>>  					struct drm_connector_state *conn_state)
>>  {
>> @@ -159,10 +137,10 @@ static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
>>  	return -EINVAL;
>>  }
>>  
>> -static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
>> +static void meson_encoder_cvbs_disable(struct drm_bridge *bridge)
>>  {
>>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
>> -					encoder_to_meson_encoder_cvbs(encoder);
>> +					bridge_to_meson_encoder_cvbs(bridge);
>>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>>  
>>  	/* Disable CVBS VDAC */
>> @@ -175,10 +153,10 @@ static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
>>  	}
>>  }
>>  
>> -static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
>> +static void meson_encoder_cvbs_enable(struct drm_bridge *bridge)
>>  {
>>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
>> -					encoder_to_meson_encoder_cvbs(encoder);
>> +					bridge_to_meson_encoder_cvbs(bridge);
>>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>>  
>>  	/* VDAC0 source is not from ATV */
>> @@ -198,13 +176,13 @@ static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
>>  	}
>>  }
>>  
>> -static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
>> -				   struct drm_display_mode *mode,
>> -				   struct drm_display_mode *adjusted_mode)
>> +static void meson_encoder_cvbs_mode_set(struct drm_bridge *bridge,
>> +				   const struct drm_display_mode *mode,
>> +				   const struct drm_display_mode *adjusted_mode)
>>  {
>>  	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
>>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
>> -					encoder_to_meson_encoder_cvbs(encoder);
>> +					bridge_to_meson_encoder_cvbs(bridge);
>>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>>  
>>  	if (meson_mode) {
>> @@ -218,76 +196,78 @@ static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
>>  	}
>>  }
>>  
>> -static const struct drm_encoder_helper_funcs
>> -				meson_encoder_cvbs_encoder_helper_funcs = {
>> -	.atomic_check	= meson_encoder_cvbs_encoder_atomic_check,
>> -	.disable	= meson_encoder_cvbs_encoder_disable,
>> -	.enable		= meson_encoder_cvbs_encoder_enable,
>> -	.mode_set	= meson_encoder_cvbs_encoder_mode_set,
>> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>> +	.attach = meson_encoder_cvbs_attach,
>> +	.enable	= meson_encoder_cvbs_enable,
>> +	.disable = meson_encoder_cvbs_disable,
>> +	.mode_valid = meson_encoder_cvbs_mode_valid,
>> +	.mode_set = meson_encoder_cvbs_mode_set,
>> +	.get_modes = meson_encoder_cvbs_get_modes,
>> +	.atomic_check = meson_encoder_cvbs_atomic_check,
>>  };
>>  
>> -static bool meson_encoder_cvbs_connector_is_available(struct meson_drm *priv)
>> -{
>> -	struct device_node *remote;
>> -
>> -	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
>> -	if (!remote)
>> -		return false;
>> -
>> -	of_node_put(remote);
>> -	return true;
>> -}
>> -
>>  int meson_encoder_cvbs_init(struct meson_drm *priv)
>>  {
>>  	struct drm_device *drm = priv->drm;
>>  	struct meson_encoder_cvbs *meson_encoder_cvbs;
>> -	struct drm_connector *connector;
>> -	struct drm_encoder *encoder;
>> +	struct device_node *remote;
>>  	int ret;
>>  
>> -	if (!meson_encoder_cvbs_connector_is_available(priv)) {
>> +	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs), GFP_KERNEL);
>> +	if (!meson_encoder_cvbs)
>> +		return -ENOMEM;
>> +
>> +	/* CVBS Connector Bridge */
>> +	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
>> +	if (!remote) {
>>  		dev_info(drm->dev, "CVBS Output connector not available\n");
>>  		return 0;
>>  	}
>>  
>> -	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs),
>> -				       GFP_KERNEL);
>> -	if (!meson_encoder_cvbs)
>> -		return -ENOMEM;
>> +	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
>> +	if (!meson_encoder_cvbs->next_bridge) {
>> +		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
>> +		return -EPROBE_DEFER;
>> +	}
>>  
>> -	meson_encoder_cvbs->priv = priv;
>> -	encoder = &meson_encoder_cvbs->encoder;
>> -	connector = &meson_encoder_cvbs->connector;
>> +	/* CVBS Encoder Bridge */
>> +	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
>> +	meson_encoder_cvbs->bridge.of_node = priv->dev->of_node;
>> +	meson_encoder_cvbs->bridge.type = DRM_MODE_CONNECTOR_Composite;
>> +	meson_encoder_cvbs->bridge.ops = DRM_BRIDGE_OP_MODES;
>> +	meson_encoder_cvbs->bridge.interlace_allowed = true;
>>  
>> -	/* Connector */
>> +	drm_bridge_add(&meson_encoder_cvbs->bridge);
>>  
>> -	drm_connector_helper_add(connector,
>> -				 &meson_cvbs_connector_helper_funcs);
>> +	meson_encoder_cvbs->priv = priv;
>>  
>> -	ret = drm_connector_init(drm, connector, &meson_cvbs_connector_funcs,
>> -				 DRM_MODE_CONNECTOR_Composite);
>> +	/* Encoder */
>> +	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
>> +				      DRM_MODE_ENCODER_TVDAC);
>>  	if (ret) {
>> -		dev_err(priv->dev, "Failed to init CVBS connector\n");
>> +		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>> -	connector->interlace_allowed = 1;
>> +	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
>>  
>> -	/* Encoder */
>> -
>> -	drm_encoder_helper_add(encoder, &meson_encoder_cvbs_encoder_helper_funcs);
>> -
>> -	ret = drm_encoder_init(drm, encoder, &meson_encoder_cvbs_encoder_funcs,
>> -			       DRM_MODE_ENCODER_TVDAC, "meson_encoder_cvbs");
>> +	/* Attach CVBS Encoder Bridge to Encoder */
>> +	ret = drm_bridge_attach(&meson_encoder_cvbs->encoder, &meson_encoder_cvbs->bridge, NULL,
>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  	if (ret) {
>> -		dev_err(priv->dev, "Failed to init CVBS encoder\n");
>> +		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>> -	encoder->possible_crtcs = BIT(0);
>> -
>> -	drm_connector_attach_encoder(connector, encoder);
>> +	/* Initialize & attach Bridge Connector */
>> +	meson_encoder_cvbs->connector = drm_bridge_connector_init(priv->drm,
>> +							&meson_encoder_cvbs->encoder);
> I did not see other uses of meson_encoder_cvbs->connector, so if I am
> right a local variable can be used and the member dropped.

You're right, I'll drop this.

Thanks
Neil

> 
>> +	if (IS_ERR(meson_encoder_cvbs->connector)) {
>> +		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
>> +		return PTR_ERR(meson_encoder_cvbs->connector);
>> +	}
>> +	drm_connector_attach_encoder(meson_encoder_cvbs->connector,
>> +				     &meson_encoder_cvbs->encoder);
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.25.1

