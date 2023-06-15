Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D69731DE5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 18:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAE610E194;
	Thu, 15 Jun 2023 16:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4F010E194
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kRWfxKU6iLOyQwwGx2ME57rRsTmS+Y/mv8gYh4DhOyg=;
 b=okJlCJ3JHQ3+H0XLiMBf0glJchvuuMsEcUCgzmvJnyKMoDMx5KHnSTtuAyw0+6C02Fj+PIczYsQAb
 1sJXFppRbmiGQviCKIb6gD9tGzLEdywy9YByMgoeRCa84fyqZkmGszeCCOuLk+544Y+QNzLZKDM87E
 R+MDZJ4STSxW54XyqvVk2jeDkTM+7hDVzHkzZIH7HZecVf7PLr7GF7PWoIRiAkQPtxs1vJ7iZjPeUI
 8aMMfkVKa1VnG0CWOwYTNA76VeemsnDscjlKWyMSZ0Wyx32wByG6pAy08mMt1KyZN9XMciIJhmstwO
 20X+A/bkr4Y7SdFgKgk+vxuxgnP+UnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kRWfxKU6iLOyQwwGx2ME57rRsTmS+Y/mv8gYh4DhOyg=;
 b=XINu3AbpGKXRusYWTJ6IxnhI3JYWGjV1+42EsWbHmdUP4+C57+XyPjz9QZOcgglPnTa8mYWRY3EwX
 WRTXCTvAw==
X-HalOne-ID: 4f77e8bb-0b9a-11ee-8d88-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 4f77e8bb-0b9a-11ee-8d88-b90637070a9d;
 Thu, 15 Jun 2023 16:33:10 +0000 (UTC)
Date: Thu, 15 Jun 2023 18:33:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v6 3/8] drm: bridge: Cadence: Add MHDP8501 DP driver
Message-ID: <20230615163308.GA1588386@ravnborg.org>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <67f54be91e91f6291c4ad3f5155598d699b8bc09.1686729444.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f54be91e91f6291c4ad3f5155598d699b8bc09.1686729444.git.Sandor.yu@nxp.com>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

On Thu, Jun 15, 2023 at 09:38:13AM +0800, Sandor Yu wrote:
> Add a new DRM DisplayPort bridge driver for Candence MHDP8501
> used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> standards according embedded Firmware running in the uCPU.
> 
> For iMX8MQ SOC, the DisplayPort FW was loaded and activated by SOC
> ROM code. Bootload binary included HDMI FW was required for the driver.

The bridge driver supports creating a connector, but is this really
necessary?

This part:
> +static const struct drm_connector_funcs cdns_dp_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_connector_helper_funcs cdns_dp_connector_helper_funcs = {
> +	.get_modes = cdns_dp_connector_get_modes,
> +};
> +
> +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct cdns_mhdp_device *mhdp = bridge->driver_private;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_connector *connector = &mhdp->connector;
> +	int ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		connector->interlace_allowed = 0;
> +
> +		connector->polled = DRM_CONNECTOR_POLL_HPD;
> +
> +		drm_connector_helper_add(connector, &cdns_dp_connector_helper_funcs);
> +
> +		drm_connector_init(bridge->dev, connector, &cdns_dp_connector_funcs,
> +				   DRM_MODE_CONNECTOR_DisplayPort);
> +
> +		drm_connector_attach_encoder(connector, encoder);
> +	}

Unless you have a display driver that do not create their own connector
then drop the above and error out if DRM_BRIDGE_ATTACH_NO_CONNECTOR is
not set.
It is encouraged that display drivers create their own connector.

This was the only detail I looked for in the driver, I hope some else
volunteer to review it.

	Sam
