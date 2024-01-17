Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E88302AE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCCC10E65E;
	Wed, 17 Jan 2024 09:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195B10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1705484818; x=1737020818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H93YTinsBD2X1eXiG2s9oou2D6Ybv6y0IABMI5784rg=;
 b=YbGviaiAU9pkW8RISXlfyuTvETQOeR/4zSmTl2D7CjE9IuzAgZcIEsgp
 YI1zJB7ExKa+x/D15T7IkztVPQyFjkI8bbrvNdde9dVk5geF6UgCTAnd1
 WKJkQ3vQrXgtwwiTlEzxKN/Nt02X/y28TMpfLpEVtozLPXOI4XfhsYdIb
 grxd68XPSh14/bP9kp791YaT8j+6SJN3SrtYTgl2mnTyNwTZ6M4FlKTZD
 QYCnTYctX25+spWypR6jJ29mf1YzWIj0ysUTjemits3ErwsqIjGyLD+Ba
 aoD23XcUKRlLXa9V8OHuRdHB8Lpf94q3YnAawRCPE0XRePrGOV7dj+9Iy Q==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; d="scan'208";a="34935822"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jan 2024 10:46:50 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4FDB1280075;
 Wed, 17 Jan 2024 10:46:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v12 4/7] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Date: Wed, 17 Jan 2024 10:46:49 +0100
Message-ID: <9223210.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d2d5d5bbde972eee5417c3e04db33895cf5ee88b.1704785836.git.Sandor.yu@nxp.com>
References: <cover.1704785836.git.Sandor.yu@nxp.com>
 <d2d5d5bbde972eee5417c3e04db33895cf5ee88b.1704785836.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

thanks for the update.

Am Mittwoch, 10. Januar 2024, 02:08:45 CET schrieb Sandor Yu:
> Add a new DRM DisplayPort and HDMI bridge driver for Candence MHDP8501
> used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> standards according embedded Firmware running in the uCPU.
>=20
> For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> SOC's ROM code. Bootload binary included respective specific firmware
> is required.
>=20
> Driver will check display connector type and
> then load the corresponding driver.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> v11->v12:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function
> cdns_dp_aux_transferi(). - Remove unused parmeter in function
> cdns_dp_get_msa_misc
>   and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
>=20
>  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
>  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 315 ++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699 ++++++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 678 +++++++++++++++++
>  6 files changed, 2075 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>=20
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> b/drivers/gpu/drm/bridge/cadence/Kconfig index e0973339e9e33..45848e741f5=
f4
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -51,3 +51,19 @@ config DRM_CDNS_MHDP8546_J721E
>  	  initializes the J721E Display Port and sets up the
>  	  clock and data muxes.
>  endif
> +
> +config DRM_CDNS_MHDP8501
> +	tristate "Cadence MHDP8501 DP/HDMI bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select CDNS_MHDP_HELPER
> +	select DRM_CDNS_AUDIO
> +	depends on OF
> +	help
> +	  Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> +	  Cadence MHDP8501 support one or more protocols,
> +	  including DisplayPort and HDMI.
> +	  To use the DP and HDMI drivers, their respective
> +	  specific firmware is required.
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> b/drivers/gpu/drm/bridge/cadence/Makefile index
> 087dc074820d7..02c1a9f3cf6fc 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -6,3 +6,5 @@ obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
>  cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D cdns-mhdp8546-j721e=
=2Eo
> +obj-$(CONFIG_DRM_CDNS_MHDP8501) +=3D cdns-mhdp8501.o
> +cdns-mhdp8501-y :=3D cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> cdns-mhdp8501-hdmi.o diff --git
> a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c new file mode 100644
> index 0000000000000..3080c7507a012
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence Display Port Interface (DP) driver
> + *
> + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <linux/clk.h>
> +#include <linux/irq.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>

Since commit d57d584ef69de ("of: Stop circularly including of_device.h and=
=20
of_platform.h") you to explicitly include linux/platform_device.h here. Ple=
ase=20
compile against next tree.

> +#include <linux/phy/phy.h>
> +
> +#include "cdns-mhdp8501-core.h"
> +
> [snip]
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c new file mode 100644
> index 0000000000000..6963c7143a3b0
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> @@ -0,0 +1,699 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence MHDP8501 DisplayPort(DP) bridge driver
> + *
> + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-dp.h>
> +
> +#include "cdns-mhdp8501-core.h"
> +
> +#define LINK_TRAINING_TIMEOUT_MS	500
> +#define LINK_TRAINING_RETRY_MS		20
> +
> +ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux,
> +			     struct drm_dp_aux_msg *msg)
> +{
> +	struct cdns_mhdp8501_device *mhdp =3D dev_get_drvdata(aux->dev);
> +	bool native =3D msg->request & (DP_AUX_NATIVE_WRITE &=20
DP_AUX_NATIVE_READ);
> +	int ret;
> +
> +	/* Ignore address only message */
> +	if (!msg->size || !msg->buffer) {
> +		msg->reply =3D native ?
> +			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
> +		return msg->size;
> +	}
> +
> +	if (!native) {
> +		dev_err(mhdp->dev, "%s: only native messages supported\n",=20
__func__);
> +		return -EINVAL;
> +	}
> +
> +	/* msg sanity check */
> +	if (msg->size > DP_AUX_MAX_PAYLOAD_BYTES) {
> +		dev_err(mhdp->dev, "%s: invalid msg: size(%zu),=20
request(%x)\n",
> +			__func__, msg->size, (unsigned int)msg-
>request);
> +		return -EINVAL;
> +	}
> +
> +	if (msg->request =3D=3D DP_AUX_NATIVE_WRITE) {
> +		const u8 *buf =3D msg->buffer;
> +		int i;
> +
> +		for (i =3D 0; i < msg->size; ++i) {
> +			ret =3D cdns_mhdp_dpcd_write(&mhdp->base,
> +						   msg->address +=20
i, buf[i]);
> +			if (ret < 0) {
> +				dev_err(mhdp->dev, "Failed to write=20
DPCD\n");
> +				return ret;
> +			}
> +		}
> +		msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> +		return msg->size;
> +	}
> +
> +	if (msg->request =3D=3D DP_AUX_NATIVE_READ) {
> +		ret =3D cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
> +					  msg->buffer, msg->size);
> +		if (ret < 0)
> +			return ret;
> +		msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> +		return msg->size;
> +	}
> +	return 0;
> +}
> +
> +int cdns_dp_aux_destroy(struct cdns_mhdp8501_device *mhdp)
> +{
> +	drm_dp_aux_unregister(&mhdp->dp.aux);
> +
> +	return 0;
> +}
> +
> +static int cdns_dp_get_msa_misc(struct video_info *video)
> +{
> +	u32 msa_misc;
> +	u8 color_space =3D 0;
> +	u8 bpc =3D 0;
> +
> +	switch (video->color_fmt) {
> +	/* set YUV default color space conversion to BT601 */
> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		color_space =3D 6 + BT_601 * 8;
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		color_space =3D 5 + BT_601 * 8;
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		color_space =3D 5;
> +		break;
> +	case DRM_COLOR_FORMAT_RGB444:
> +	default:
> +		color_space =3D 0;
> +		break;
> +	};
> +
> +	switch (video->bpc) {
> +	case 6:
> +		bpc =3D 0;
> +		break;
> +	case 10:
> +		bpc =3D 2;
> +		break;
> +	case 12:
> +		bpc =3D 3;
> +		break;
> +	case 16:
> +		bpc =3D 4;
> +		break;
> +	case 8:
> +	default:
> +		bpc =3D 1;
> +		break;
> +	};
> +
> +	msa_misc =3D (color_space << 1) | (bpc << 5);

This looks much nicer, thanks. But please order them in descending shift=20
width: bpc first then color_space.

> +
> +	return msa_misc;
> +}
> +
> [snip]
> +int cdns_dp_set_host_cap(struct cdns_mhdp8501_device *mhdp)

This can be made static.

> +{
> +	u8 msg[8];
> +	int ret;
> +
> +	msg[0] =3D drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
> +	msg[1] =3D mhdp->dp.num_lanes | SCRAMBLER_EN;
> +	msg[2] =3D VOLTAGE_LEVEL_2;
> +	msg[3] =3D PRE_EMPHASIS_LEVEL_3;
> +	msg[4] =3D PTS1 | PTS2 | PTS3 | PTS4;
> +	msg[5] =3D FAST_LT_NOT_SUPPORT;
> +	msg[6] =3D mhdp->lane_mapping;
> +	msg[7] =3D ENHANCED;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +				     DPTX_SET_HOST_CAPABILITIES,
> +				     sizeof(msg), msg);
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "set host cap failed: %d\n", ret);
> +
> +	return ret;
> +}
> [snip]
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode 100644
> index 0000000000000..ae21f7dfe5e94
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> @@ -0,0 +1,678 @@
> [snip]
> +bool cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> +				 const struct drm_display_mode *mode,
> +				 struct drm_display_mode=20
*adjusted_mode)

This can be made static.

Thanks and best regards,
Alexander

> +{
> +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> +	struct video_info *video =3D &mhdp->video_info;
> +
> +	/* The only currently supported format */
> +	video->bpc =3D 8;
> +	video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> +
> +	return true;
> +}
> +
> +static enum drm_connector_status
> +cdns_hdmi_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> +
> +	return cdns_mhdp8501_detect(mhdp);
> +}
> +
> +static struct edid *cdns_hdmi_bridge_get_edid(struct drm_bridge *bridge,
> +					      struct drm_connector=20
*connector)
> +{
> +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> +
> +	return drm_do_get_edid(connector, cdns_hdmi_get_edid_block, mhdp);
> +}
> +
> +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state=20
*old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> +
> +	mhdp->curr_conn =3D NULL;
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	phy_power_off(mhdp->phy);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +}
> +
> +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state=20
*old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> +	struct drm_atomic_state *state =3D old_state->base.state;
> +	struct drm_connector *connector;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	const struct drm_display_mode *mode;
> +
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +							    =20
bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	mhdp->curr_conn =3D connector;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	mode =3D &crtc_state->adjusted_mode;
> +	dev_dbg(mhdp->dev, "Mode: %dx%dp%d\n",
> +		mode->hdisplay, mode->vdisplay, mode->clock);
> +	memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
> +
> +	cdns_hdmi_mode_set(mhdp);
> +}
> +
> +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs =3D {
> +	.attach =3D cdns_hdmi_bridge_attach,
> +	.detect =3D cdns_hdmi_bridge_detect,
> +	.get_edid =3D cdns_hdmi_bridge_get_edid,
> +	.mode_valid =3D cdns_hdmi_bridge_mode_valid,
> +	.mode_fixup =3D cdns_hdmi_bridge_mode_fixup,
> +	.atomic_enable =3D cdns_hdmi_bridge_atomic_enable,
> +	.atomic_disable =3D cdns_hdmi_bridge_atomic_disable,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


