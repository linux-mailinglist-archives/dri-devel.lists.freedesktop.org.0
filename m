Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D780054A025
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9031710F9B3;
	Mon, 13 Jun 2022 20:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jun 2022 20:51:24 UTC
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626D10F9B5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:51:24 +0000 (UTC)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net
 [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B2E006601668;
 Mon, 13 Jun 2022 21:51:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655153483;
 bh=8qUc74bLu4+4c99EHIFyhvDd9mzPx8O2XOjdFV43U5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYNVheWXO6w9qtes6hbwKf505NJi25Db4LnlIm04il/DtSS11i7s7OJivXqeJAMBa
 XfhS1OI2O4SE07CFs/Qd7MCrBrTdCW7yujHHv63RkvUoSKSup2r+C4iAcEHLxmUBJj
 kIKNRhishKcRtOY9mcKyWfVZXn8tjtg/Vs/BKIwHcSTfkEgQHAx3Kz7RR+Jf3Z04Mk
 Xiyu2BS6DWEuPt5ahU9OQRW0QJZKLv+oK61xsDijFX24wstblsr6nLE4qFIbQ869r+
 kKCLvTBylvo7v8LYk0+9IkL05/IOFEVoRyCrwni+xut8M71Lr+z/oBNSkOvpUDobXP
 m2azljGgHY6Sg==
Date: Mon, 13 Jun 2022 16:51:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
Message-ID: <20220613205117.aewpbdjolxmys4vy@notapiano>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-8-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609181106.3695103-8-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prashant,

On Thu, Jun 09, 2022 at 06:09:46PM +0000, Prashant Malani wrote:
> From: Pin-Yen Lin <treapking@chromium.org>
> 
> Add the callback function when the driver receives state
> changes of the Type-C port. The callback function configures the
> crosspoint switch of the anx7625 bridge chip, which can change the
> output pins of the signals according to the port state.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v2:
> - No changes.
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 58 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 13 +++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d41a21103bd3..2c308d12fab2 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/workqueue.h>
>  
> @@ -2582,9 +2583,66 @@ static void anx7625_runtime_disable(void *data)
>  	pm_runtime_disable(data);
>  }
>  
> +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> +					  enum typec_orientation orientation)
> +{
> +	if (orientation == TYPEC_ORIENTATION_NORMAL) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> +	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> +	}
> +}
> +
> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +	if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> +		/* Both ports available, do nothing to retain the current one. */
> +		return;
> +	else if (ctx->typec_ports[0].dp_connected)
> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> +	else if (ctx->typec_ports[1].dp_connected)
> +		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> +}
> +
>  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
>  				 struct typec_mux_state *state)
>  {
> +	struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
> +	struct anx7625_data *ctx = data->ctx;
> +	struct device *dev = &ctx->client->dev;
> +
> +	bool old_dp_connected = (ctx->typec_ports[0].dp_connected ||
> +				 ctx->typec_ports[1].dp_connected);

Here you're assuming you have 2 switches. Given that this on its own doesn't do
anything, just move it after the 

	if (ctx->num_typec_switches == 1)
		return 0;

check.

Thanks,
Nícolas

> +	bool new_dp_connected;
> +
> +	if (ctx->num_typec_switches == 1)
> +		return 0;
> +
> +	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
> +		ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_connected);
> +
> +	data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> +			      state->alt->mode == USB_TYPEC_DP_MODE);
> +
> +	new_dp_connected = (ctx->typec_ports[0].dp_connected ||
> +			    ctx->typec_ports[1].dp_connected);
> +
> +	/* dp on, power on first */
> +	if (!old_dp_connected && new_dp_connected)
> +		pm_runtime_get_sync(dev);
> +
> +	anx7625_typec_two_ports_update(ctx);
> +
> +	/* dp off, power off last */
> +	if (old_dp_connected && !new_dp_connected)
> +		pm_runtime_put_sync(dev);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 76cfc64f7574..7d6c6fdf9a3a 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -55,6 +55,18 @@
>  #define HPD_STATUS_CHANGE 0x80
>  #define HPD_STATUS 0x80
>  
> +#define TCPC_SWITCH_0 0xB4
> +#define SW_SEL1_DPTX0_RX2 BIT(0)
> +#define SW_SEL1_DPTX0_RX1 BIT(1)
> +#define SW_SEL1_SSRX_RX2 BIT(4)
> +#define SW_SEL1_SSRX_RX1 BIT(5)
> +
> +#define TCPC_SWITCH_1 0xB5
> +#define SW_SEL2_DPTX1_TX2 BIT(0)
> +#define SW_SEL2_DPTX1_TX1 BIT(1)
> +#define SW_SEL2_SSTX_TX2 BIT(4)
> +#define SW_SEL2_SSTX_TX1 BIT(5)
> +
>  /******** END of I2C Address 0x58 ********/
>  
>  /***************************************************************/
> @@ -444,6 +456,7 @@ struct anx7625_i2c_client {
>  };
>  
>  struct anx7625_port_data {
> +	bool dp_connected;
>  	struct typec_mux_dev *typec_mux;
>  	struct anx7625_data *ctx;
>  };
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 
