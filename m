Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530576660C0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930EA10E797;
	Wed, 11 Jan 2023 16:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8E710E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:39:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B7958320093B;
 Wed, 11 Jan 2023 11:39:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Jan 2023 11:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673455170; x=
 1673541570; bh=9mqaxzOXYaICyiwGPPEV14FUD/Q48iBQQ4un3VSJvDk=; b=h
 t1LpWN/kSDuwXH+linOSRFR/khwR12nX73rU3oD+14h3OjZ8RrK+ZTAVDYHgH8dl
 pMbN+uyVixl6gRtss/M8NmGuNi2fBOscXJnyvEE24Bh4igbXHXKFI9uW5+uzLpkJ
 auv8RKiOZzq+RtGnZkt7wPPvFdvWMQSJctlIFe3peg/fPTm+YGfAlFuvt+r3oxtX
 uM0+sQVxX7+ZMjNFDRETC0fJDYKnDcWuKqzo4b/lHP0Q0KateGg7SVmx/SW8DLAh
 4oUXWLacZK9FDL23ty9vykquQw8LvUtpW3tqhSLYIYhjGPcHMK4SmPs94AbNtIk8
 CjLE1p8NGeWPxWNhPRA0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673455170; x=
 1673541570; bh=9mqaxzOXYaICyiwGPPEV14FUD/Q48iBQQ4un3VSJvDk=; b=A
 s6kdqj68/tCyxkKvVQLyds7f1C81eVf2IYx3f8OO/UisEJ1VjY686rZ4cH6sJY/7
 HeMBeaRlIvwbWCqK3cEwMEX4b1o4kiweLjKoMRMxObCWRU7+S8XdJkWKxsYOa+Ds
 /GQn4lyHykaMBShpOabrF0MveNYjVuCxqrDaItiLDadh+olUmUyjhGjjbhPFAdqg
 bS+TtxmeaLZQ230e6i0qH9VCiAn/qtGD9v0bU1xwnH2qde6KpTwD6OO+QaSAg2Lm
 1xXzTMhkN6xZTkeKIwafnKFgcySIUFl1jKEcvOWrx9H3LH7hcVpUuyKj8VlR3FVc
 9muIl2MJ0V2ziuVxI62Bg==
X-ME-Sender: <xms:Qea-Y4ZZ1yoeze5Q7okMmJQ1vXTpZxkpndGQtL7aIN48t-ekp3h49Q>
 <xme:Qea-YzaenbtY8Et5auUFnZq2hJKkqaoLNXhu0XE_HWvC2ADVWgMf7RtDKLJDAmafa
 cFqZU391UJxBWBMzpg>
X-ME-Received: <xmr:Qea-Yy85aSP0SPHv4-wPhxp0OW1Obm7WCzcce_YPS3rLzVGNFvG0mk94AQ6BVnrJAOuENCZxAnEt0croCxFqD9RWd__jaM7VgecwBi4BLi39jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeggdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qea-Yyr_ZFtsfhf7sYWkygT6bxiSt0i4fMgqkcuOacbWIg-kFANsjQ>
 <xmx:Qea-YzolPIp-Ft3Jw_WnDwGQcxu6RuuqDL8xHMrvwUr3IZDZeQIn2g>
 <xmx:Qea-YwSSbAMEMjfdlRiG7bVWuqRFd8yyQ0bndCeJLqSLBsR1JZQX9Q>
 <xmx:Qua-Y618eBm1bfJ4AhjcpPMPoJA5bPfQ8sgi_tBErV-yhye0zNKn1w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 11:39:29 -0500 (EST)
Date: Wed, 11 Jan 2023 17:39:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v9 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <20230111163926.k3v32pdvq7o7wxwl@houat>
References: <20230111163012.310945-1-macroalpha82@gmail.com>
 <20230111163012.310945-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111163012.310945-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 11, 2023 at 10:30:09AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  drivers/gpu/drm/drm_of.c | 70 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     | 10 ++++++
>  2 files changed, 80 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 7bbcb999bb75..4ebb5bc4b595 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> =20
> @@ -493,3 +494,72 @@ int drm_of_get_data_lanes_count_ep(const struct devi=
ce_node *port,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
> +
> +/**
> + * drm_of_get_dsi_bus - find the DSI bus for a given device
> + * @dev: parent device of display (SPI, I2C)
> + * @info: DSI device info to be updated with correct DSI node
> + *
> + * Gets parent DSI bus for a DSI device controlled through a bus other
> + * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
> + *
> + * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
> + * request is unsupported, -EPROBE_DEFER if the DSI host is found but
> + * not available, or -ENODEV otherwise.
> + */
> +struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> +					 struct mipi_dsi_device_info *info)
> +{
> +	struct mipi_dsi_host *dsi_host;
> +	struct device_node *endpoint, *dsi_host_node;
> +
> +	/*
> +	 * Exit immediately if we attempt to call this function when
> +	 * DRM_MIPI_DSI is not enabled, in the event CONFIG_OF is
> +	 * enabled.
> +	 */
> +	if (!IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> +		return ERR_PTR(-EINVAL);

The commit log isn't super clear on why this is needed, but it would be
more consistent to add an ifdef and only compile the entire function if
DRM_MIPI_DSI is there, just like you did for OF already.

> +	/*
> +	 * Get first endpoint child from device.
> +	 */
> +	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!endpoint)
> +		return ERR_PTR(-ENODEV);
> +
> +	/*
> +	 * Follow the first endpoint to get the DSI host node.
> +	 */
> +	dsi_host_node =3D of_graph_get_remote_port_parent(endpoint);

There's no need to hold the reference to endpoint after that call. call
of_node_put(endpoint) here, and it will simplify the error path.

> +	if (!dsi_host_node)
> +		goto error;
> +
> +	/*
> +	 * Get the DSI host from the DSI host node. If we get an error
> +	 * or the return is null assume we're not ready to probe just
> +	 * yet. Release the DSI host node since we're done with it.
> +	 */
> +	dsi_host =3D of_find_mipi_dsi_host_by_node(dsi_host_node);
> +	of_node_put(dsi_host_node);
> +	if (IS_ERR_OR_NULL(dsi_host)) {
> +		of_node_put(endpoint);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	/*
> +	 * Set the node of the mipi_dsi_device_info to the correct node
> +	 * and then release the endpoint node since we're done with it.
> +	 */
> +	info->node =3D of_graph_get_remote_port(endpoint);

Ah, you're using it there.

I think I'd rework the function to:

- retrieve the endpoint
- retrieve the remote port, give up the endpoint
- retrieve the remote port parent

Also, I'm not entirely sure what you had in mind, but info might not be
there at all and it would be fine imho.

Maxime
