Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D077CC017
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 12:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3861F10E2BB;
	Tue, 17 Oct 2023 10:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083D210E2BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1697537031; x=1729073031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGAXuor8YebEhm8OWQ2f25pRHzYYPDWqyDOjZfuCUxw=;
 b=Tk3+hDKfaFmllWhy0JN2J3jRAQiTxbCUp922H74nJY0MwtseygdJrzrK
 /gisxOzOCG22J683/xhZDveC20MIAlU7P/Pzln1CegTr0O2j0nScGTyLB
 TXAQV4KxDOoD4X14tlABZMnr7om9xPvt+i2E3as12qQ7AnfqwzlOCBLet
 cBpyw2KHi3p2Eo6tYm4HGAQ+RzTBjWEK5qLsfGrLM9G2I1gFbEpKMFVj1
 cUr7iHGdDHfpyi1/WmvzFM1aN3xTN5zlGSdwbOVrwicFmGu/N0vYSOFn2
 Z8ZS75x9MglJ9UUXupbyNzukLl8VHHu2dWegJPUQ5keYk0TuarW3CDFyr Q==;
X-IronPort-AV: E=Sophos;i="6.03,231,1694728800"; d="scan'208";a="33502787"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Oct 2023 12:03:48 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 82896280082;
 Tue, 17 Oct 2023 12:03:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v11 1/7] drm: bridge: Cadence: Creat mhdp helper driver
Date: Tue, 17 Oct 2023 12:03:49 +0200
Message-ID: <2582168.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <c4b4b7a56fe79c62f5138593f8048ab5385eac09.1697524277.git.Sandor.yu@nxp.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
 <c4b4b7a56fe79c62f5138593f8048ab5385eac09.1697524277.git.Sandor.yu@nxp.com>
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

One small typo in the commit message: 'Creat' -> 'Create'

Am Dienstag, 17. Oktober 2023, 09:03:57 CEST schrieb Sandor Yu:
> MHDP8546 mailbox access functions will be share to other mhdp driver
> and Cadence HDP-TX HDMI/DP PHY drivers.
> Create a new mhdp helper driver and move all those functions into.
>=20
> cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
> because it use the DPTX command ID DPTX_WRITE_REGISTER.
>=20
> New cdns_mhdp_reg_write() is created with the general command ID
> GENERAL_REGISTER_WRITE.
>=20
> rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v10->v11:
> - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
> - use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
> and remove them from EXPORT_SYMBOL_GPL().
>=20
> v9->v10:
>  *use mhdp helper driver to replace macro functions,
>  move maibox access function and mhdp hdmi/dp common API
>  functions into the driver.
>=20
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
>  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 304 +++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 +++---------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
>  include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
>  6 files changed, 476 insertions(+), 374 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
>=20
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> b/drivers/gpu/drm/bridge/cadence/Kconfig index ec35215a20034..0b7b4626a7a=
f0
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -20,6 +20,9 @@ config DRM_CDNS_DSI_J721E
>  	  the routing of the DSS DPI signal to the Cadence DSI.
>  endif
>=20
> +config CDNS_MHDP_HELPER
> +	tristate
> +
>  config DRM_CDNS_MHDP8546
>  	tristate "Cadence DPI/DP bridge"
>  	select DRM_DISPLAY_DP_HELPER
> @@ -27,6 +30,7 @@ config DRM_CDNS_MHDP8546
>  	select DRM_DISPLAY_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL_BRIDGE
> +	select CDNS_MHDP_HELPER
>  	depends on OF
>  	help
>  	  Support Cadence DPI to DP bridge. This is an internal
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> b/drivers/gpu/drm/bridge/cadence/Makefile index
> c95fd5b81d137..087dc074820d7 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o
>  cdns-dsi-y :=3D cdns-dsi-core.o
>  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
>  cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D cdns-mhdp8546-j721e=
=2Eo
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c new file mode 100644
> index 0000000000000..8cabd79ad9663
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/bridge/cdns-mhdp-helper.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +
> +/* Mailbox helper functions */
> +static int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base)
> +{
> +	int ret, empty;
> +
> +	WARN_ON(!mutex_is_locked(base->mbox_mutex));

Actually this should be moved to cdns_mhdp_mailbox_recv_header() and=20
cdns_mhdp_mailbox_recv_data().

> +	ret =3D readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_EMPTY,
> +				 empty, !empty, MAILBOX_RETRY_US,
> +				 MAILBOX_TIMEOUT_US);
> +	if (ret < 0)
> +		return ret;
> +
> +	return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> +}
> +
> +static int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val)
> +{
> +	int ret, full;
> +
> +	WARN_ON(!mutex_is_locked(base->mbox_mutex));

I think this should be moved to cdns_mhdp_mailbox_send() as well.

> +	ret =3D readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_FULL,
> +				 full, !full, MAILBOX_RETRY_US,
> +				 MAILBOX_TIMEOUT_US);
> +	if (ret < 0)
> +		return ret;
> +
> +	writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
> +
> +	return 0;
> +}

Nice, much better having these as static now.

> +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> +				  u8 module_id, u8 opcode,
> +				  u16 req_size)
> +{
> +	u32 mbox_size, i;
> +	u8 header[4];
> +	int ret;
> +
> +	/* read the header of the message */
> +	for (i =3D 0; i < sizeof(header); i++) {
> +		ret =3D cdns_mhdp_mailbox_read(base);
> +		if (ret < 0)
> +			return ret;
> +
> +		header[i] =3D ret;
> +	}
> +
> +	mbox_size =3D get_unaligned_be16(header + 2);
> +
> +	if (opcode !=3D header[0] || module_id !=3D header[1] ||
> +	    req_size !=3D mbox_size) {
> +		/*
> +		 * If the message in mailbox is not what we want, we need=20
to
> +		 * clear the mailbox by reading its contents.
> +		 */
> +		for (i =3D 0; i < mbox_size; i++)
> +			if (cdns_mhdp_mailbox_read(base) < 0)
> +				break;
> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
> +
> +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> +				u8 *buff, u16 buff_size)
> +{
> +	u32 i;
> +	int ret;
> +
> +	for (i =3D 0; i < buff_size; i++) {
> +		ret =3D cdns_mhdp_mailbox_read(base);
> +		if (ret < 0)
> +			return ret;
> +
> +		buff[i] =3D ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
> +
> +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
> +			   u8 opcode, u16 size, u8 *message)
> +{
> +	u8 header[4];
> +	int ret, i;
> +
> +	header[0] =3D opcode;
> +	header[1] =3D module_id;
> +	put_unaligned_be16(size, header + 2);
> +
> +	for (i =3D 0; i < sizeof(header); i++) {
> +		ret =3D cdns_mhdp_mailbox_write(base, header[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i =3D 0; i < size; i++) {
> +		ret =3D cdns_mhdp_mailbox_write(base, message[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
> +
> +/* General helper functions */
> +int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value)
> +{
> +	u8 msg[4], resp[8];
> +	int ret;
> +
> +	put_unaligned_be32(addr, msg);
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> +				     GENERAL_REGISTER_READ,
> +				     sizeof(msg), msg);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_GENERAL,
> +					    GENERAL_REGISTER_READ,
> +					    sizeof(resp));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp));
> +	if (ret)
> +		goto out;
> +
> +	/* Returned address value should be the same as requested */
> +	if (memcmp(msg, resp, sizeof(msg))) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	*value =3D get_unaligned_be32(resp + 4);
> +
> +out:
> +	mutex_unlock(base->mbox_mutex);
> +	if (ret) {
> +		dev_err(base->dev, "Failed to read register\n");
> +		*value =3D 0;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
> +
> +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val)
> +{
> +	u8 msg[8];
> +	int ret;
> +
> +	put_unaligned_be32(addr, msg);
> +	put_unaligned_be32(val, msg + 4);
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> +				     GENERAL_REGISTER_WRITE,
> +				     sizeof(msg), msg);
> +
> +	mutex_unlock(base->mbox_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
> +
> +/* DPTX helper functions */
> +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 va=
l)
> +{
> +	u8 msg[6];
> +	int ret;
> +
> +	put_unaligned_be16(addr, msg);
> +	put_unaligned_be32(val, msg + 2);
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> +				     DPTX_WRITE_REGISTER, sizeof(msg),=20
msg);
> +
> +	mutex_unlock(base->mbox_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
> +
> +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
> +			       u8 start_bit, u8 bits_no, u32 val)
> +{
> +	u8 field[8];
> +	int ret;
> +
> +	put_unaligned_be16(addr, field);
> +	field[2] =3D start_bit;
> +	field[3] =3D bits_no;
> +	put_unaligned_be32(val, field + 4);
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> +				     DPTX_WRITE_FIELD, sizeof(field),=20
field);
> +
> +	mutex_unlock(base->mbox_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
> +
> +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> +			u32 addr, u8 *data, u16 len)
> +{
> +	u8 msg[5], reg[5];
> +	int ret;
> +
> +	put_unaligned_be16(len, msg);
> +	put_unaligned_be24(addr, msg + 2);
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> +				     DPTX_READ_DPCD, sizeof(msg),=20
msg);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
> +					    DPTX_READ_DPCD,
> +					    sizeof(reg) + len);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_data(base, data, len);
> +
> +out:
> +	mutex_unlock(base->mbox_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
> +
> +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value)
> +{
> +	u8 msg[6], reg[5];
> +	int ret;
> +
> +	put_unaligned_be16(1, msg);
> +	put_unaligned_be24(addr, msg + 2);
> +	msg[5] =3D value;
> +
> +	mutex_lock(base->mbox_mutex);
> +
> +	ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> +				     DPTX_WRITE_DPCD, sizeof(msg),=20
msg);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
> +					    DPTX_WRITE_DPCD,=20
sizeof(reg));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> +	if (ret)
> +		goto out;
> +
> +	if (addr !=3D get_unaligned_be24(reg + 2))
> +		ret =3D -EINVAL;

No need to have the mutex locked while doing this check. This should be mov=
ed=20
below 'out' label.

> +out:
> +	mutex_unlock(base->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(base->dev, "dpcd write failed: %d\n", ret);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
> +
> +MODULE_DESCRIPTION("Cadence MHDP Helper driver");
> +MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c index
> 6af565ac307ae..9d9dbb976868c 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -73,298 +73,28 @@ static void cdns_mhdp_bridge_hpd_disable(struct
> drm_bridge *bridge) mhdp->regs + CDNS_APB_INT_MASK);
>  }
>=20
> -static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> -{
> -	int ret, empty;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret =3D readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
> -				 empty, !empty, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> -}
> -
> -static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
> -{
> -	int ret, full;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret =3D readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
> -				 full, !full, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
> -					 u8 module_id, u8 opcode,
> -					 u16 req_size)
> -{
> -	u32 mbox_size, i;
> -	u8 header[4];
> -	int ret;
> -
> -	/* read the header of the message */
> -	for (i =3D 0; i < sizeof(header); i++) {
> -		ret =3D cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		header[i] =3D ret;
> -	}
> -
> -	mbox_size =3D get_unaligned_be16(header + 2);
> -
> -	if (opcode !=3D header[0] || module_id !=3D header[1] ||
> -	    req_size !=3D mbox_size) {
> -		/*
> -		 * If the message in mailbox is not what we want, we need=20
to
> -		 * clear the mailbox by reading its contents.
> -		 */
> -		for (i =3D 0; i < mbox_size; i++)
> -			if (cdns_mhdp_mailbox_read(mhdp) < 0)
> -				break;
> -
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
> -				       u8 *buff, u16 buff_size)
> -{
> -	u32 i;
> -	int ret;
> -
> -	for (i =3D 0; i < buff_size; i++) {
> -		ret =3D cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		buff[i] =3D ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8
> module_id, -				  u8 opcode, u16 size, u8=20
*message)
> -{
> -	u8 header[4];
> -	int ret, i;
> -
> -	header[0] =3D opcode;
> -	header[1] =3D module_id;
> -	put_unaligned_be16(size, header + 2);
> -
> -	for (i =3D 0; i < sizeof(header); i++) {
> -		ret =3D cdns_mhdp_mailbox_write(mhdp, header[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	for (i =3D 0; i < size; i++) {
> -		ret =3D cdns_mhdp_mailbox_write(mhdp, message[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static
> -int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *val=
ue)
> -{
> -	u8 msg[4], resp[8];
> -	int ret;
> -
> -	put_unaligned_be32(addr, msg);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
> -				     GENERAL_REGISTER_READ,
> -				     sizeof(msg), msg);
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
> -					    GENERAL_REGISTER_READ,
> -					    sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	/* Returned address value should be the same as requested */
> -	if (memcmp(msg, resp, sizeof(msg))) {
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
> -	*value =3D get_unaligned_be32(resp + 4);
> -
> -out:
> -	mutex_unlock(&mhdp->mbox_mutex);
> -	if (ret) {
> -		dev_err(mhdp->dev, "Failed to read register\n");
> -		*value =3D 0;
> -	}
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
> -{
> -	u8 msg[6];
> -	int ret;
> -
> -	put_unaligned_be16(addr, msg);
> -	put_unaligned_be32(val, msg + 2);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_REGISTER, sizeof(msg),=20
msg);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
>  static
> -int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
> -			    u8 start_bit, u8 bits_no, u32 val)
> -{
> -	u8 field[8];
> -	int ret;
> -
> -	put_unaligned_be16(addr, field);
> -	field[2] =3D start_bit;
> -	field[3] =3D bits_no;
> -	put_unaligned_be32(val, field + 4);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_FIELD, sizeof(field),=20
field);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
> -			u32 addr, u8 *data, u16 len)
> -{
> -	u8 msg[5], reg[5];
> -	int ret;
> -
> -	put_unaligned_be16(len, msg);
> -	put_unaligned_be24(addr, msg + 2);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_READ_DPCD, sizeof(msg),=20
msg);
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
> -					    DPTX_READ_DPCD,
> -					    sizeof(reg) + len);
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, data, len);
> -
> -out:
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 val=
ue)
> +int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool
> enable) {
> -	u8 msg[6], reg[5];
> +	u8 status;
>  	int ret;
>=20
> -	put_unaligned_be16(1, msg);
> -	put_unaligned_be24(addr, msg + 2);
> -	msg[5] =3D value;
> -
>  	mutex_lock(&mhdp->mbox_mutex);
>=20
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_DPCD, sizeof(msg),=20
msg);
> -	if (ret)
> -		goto out;
> -
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
> -					    DPTX_WRITE_DPCD,=20
sizeof(reg));
> -	if (ret)
> -		goto out;
> +	status =3D enable ? FW_ACTIVE : FW_STANDBY;

Initialising status can be done outside of the locked mutex.

> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
> +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
> +				     GENERAL_MAIN_CONTROL,=20
sizeof(status), &status);
>  	if (ret)
>  		goto out;
>=20
> -	if (addr !=3D get_unaligned_be24(reg + 2))
> -		ret =3D -EINVAL;
> -
> -out:
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	if (ret)
> -		dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool
> enable) -{
> -	u8 msg[5];
> -	int ret, i;
> -
> -	msg[0] =3D GENERAL_MAIN_CONTROL;
> -	msg[1] =3D MB_MODULE_ID_GENERAL;
> -	msg[2] =3D 0;
> -	msg[3] =3D 1;
> -	msg[4] =3D enable ? FW_ACTIVE : FW_STANDBY;
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	for (i =3D 0; i < sizeof(msg); i++) {
> -		ret =3D cdns_mhdp_mailbox_write(mhdp, msg[i]);
> -		if (ret)
> -			goto out;
> -	}
> -
> -	/* read the firmware state */
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, msg, sizeof(msg));
> +	ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,=20
MB_MODULE_ID_GENERAL,
> +					    GENERAL_MAIN_CONTROL,
> +					    sizeof(status));
>  	if (ret)
>  		goto out;
>=20
> -	ret =3D 0;
> +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,=20
sizeof(status));
>=20
>  out:
>  	mutex_unlock(&mhdp->mbox_mutex);
> @@ -382,18 +112,18 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device
> *mhdp)
>=20
>  	mutex_lock(&mhdp->mbox_mutex);
>=20
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
>  				     DPTX_HPD_STATE, 0, NULL);
>  	if (ret)
>  		goto err_get_hpd;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
>  					    DPTX_HPD_STATE,
>  					    sizeof(status));
>  	if (ret)
>  		goto err_get_hpd;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
> +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,=20
sizeof(status));
>  	if (ret)
>  		goto err_get_hpd;
>=20
> @@ -424,22 +154,22 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
>  		msg[0] =3D block / 2;
>  		msg[1] =3D block % 2;
>=20
> -		ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> +		ret =3D cdns_mhdp_mailbox_send(&mhdp->base,=20
MB_MODULE_ID_DP_TX,
>  					     DPTX_GET_EDID,=20
sizeof(msg), msg);
>  		if (ret)
>  			continue;
>=20
> -		ret =3D cdns_mhdp_mailbox_recv_header(mhdp,=20
MB_MODULE_ID_DP_TX,
> +		ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,=20
MB_MODULE_ID_DP_TX,
>  						    DPTX_GET_EDID,
>  						    sizeof(reg) +=20
length);
>  		if (ret)
>  			continue;
>=20
> -		ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
> +		ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, reg,=20
sizeof(reg));
>  		if (ret)
>  			continue;
>=20
> -		ret =3D cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
> +		ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, edid,=20
length);
>  		if (ret)
>  			continue;
>=20
> @@ -464,17 +194,17 @@ int cdns_mhdp_read_hpd_event(struct cdns_mhdp_device
> *mhdp)
>=20
>  	mutex_lock(&mhdp->mbox_mutex);
>=20
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
>  				     DPTX_READ_EVENT, 0, NULL);
>  	if (ret)
>  		goto out;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
>  					    DPTX_READ_EVENT,=20
sizeof(event));
>  	if (ret < 0)
>  		goto out;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
> +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &event,=20
sizeof(event));
>  out:
>  	mutex_unlock(&mhdp->mbox_mutex);
>=20
> @@ -512,20 +242,20 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mh=
dp,
> unsigned int nlanes,
>=20
>  	mutex_lock(&mhdp->mbox_mutex);
>=20
> -	ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
>  				     DPTX_ADJUST_LT,
>  				     sizeof(payload), payload);
>  	if (ret)
>  		goto out;
>=20
>  	/* Yes, read the DPCD read command response */
> -	ret =3D cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
> +	ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
>  					    DPTX_READ_DPCD,
>  					    sizeof(hdr) +=20
DP_LINK_STATUS_SIZE);
>  	if (ret)
>  		goto out;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
> +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, hdr, sizeof(hdr));
>  	if (ret)
>  		goto out;
>=20
> @@ -533,7 +263,7 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp,
> unsigned int nlanes, if (addr !=3D DP_LANE0_1_STATUS)
>  		goto out;
>=20
> -	ret =3D cdns_mhdp_mailbox_recv_data(mhdp, link_status,
> +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, link_status,
>  					  DP_LINK_STATUS_SIZE);
>=20
>  out:
> @@ -847,7 +577,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux
> *aux, unsigned int i;
>=20
>  		for (i =3D 0; i < msg->size; ++i) {
> -			ret =3D cdns_mhdp_dpcd_write(mhdp,
> +			ret =3D cdns_mhdp_dpcd_write(&mhdp->base,
>  						   msg->address +=20
i, buf[i]);
>  			if (!ret)
>  				continue;
> @@ -859,7 +589,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux
> *aux, return ret;
>  		}
>  	} else {
> -		ret =3D cdns_mhdp_dpcd_read(mhdp, msg->address,
> +		ret =3D cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
>  					  msg->buffer, msg->size);
>  		if (ret) {
>  			dev_err(mhdp->dev,
> @@ -887,12 +617,12 @@ static int cdns_mhdp_link_training_init(struct
> cdns_mhdp_device *mhdp) if (!mhdp->host.scrambler)
>  		reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_ENHNCD,
>  			    mhdp->sink.enhanced & mhdp->host.enhanced);
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LANE_EN,
>  			    CDNS_DP_LANE_EN_LANES(mhdp-
>link.num_lanes));
>=20
>  	cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link);
> @@ -913,7 +643,7 @@ static int cdns_mhdp_link_training_init(struct
> cdns_mhdp_device *mhdp) return ret;
>  	}
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
>  			    CDNS_PHY_COMMON_CONFIG |
>  			    CDNS_PHY_TRAINING_EN |
>  			    CDNS_PHY_TRAINING_TYPE(1) |
> @@ -1058,7 +788,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct
> cdns_mhdp_device *mhdp, CDNS_PHY_TRAINING_TYPE(eq_tps);
>  	if (eq_tps !=3D 4)
>  		reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
>=20
>  	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
>  			   (eq_tps !=3D 4) ? eq_tps |=20
DP_LINK_SCRAMBLING_DISABLE :
> @@ -1322,7 +1052,7 @@ static int cdns_mhdp_link_training(struct
> cdns_mhdp_device *mhdp, mhdp->host.scrambler ? 0 :
>  			   DP_LINK_SCRAMBLING_DISABLE);
>=20
> -	ret =3D cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
&reg32);
> +	ret =3D cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &reg32); if (ret < 0) {
>  		dev_err(mhdp->dev,
>  			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG=20
%d\n",
> @@ -1333,13 +1063,13 @@ static int cdns_mhdp_link_training(struct
> cdns_mhdp_device *mhdp, reg32 |=3D CDNS_DP_NUM_LANES(mhdp->link.num_lanes=
);
>  	reg32 |=3D CDNS_DP_WR_FAILING_EDGE_VSYNC;
>  	reg32 |=3D CDNS_DP_FRAMER_EN;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
reg32);
>=20
>  	/* Reset PHY config */
>  	reg32 =3D CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
>  	if (!mhdp->host.scrambler)
>  		reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
>=20
>  	return 0;
>  err:
> @@ -1347,7 +1077,7 @@ static int cdns_mhdp_link_training(struct
> cdns_mhdp_device *mhdp, reg32 =3D CDNS_PHY_COMMON_CONFIG |
> CDNS_PHY_TRAINING_TYPE(1);
>  	if (!mhdp->host.scrambler)
>  		reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
>=20
>  	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
>  			   DP_TRAINING_PATTERN_DISABLE);
> @@ -1461,7 +1191,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device
> *mhdp) mhdp->link.num_lanes =3D cdns_mhdp_max_num_lanes(mhdp);
>=20
>  	/* Disable framer for link training */
> -	err =3D cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
> +	err =3D cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &resp); if (err < 0) {
>  		dev_err(mhdp->dev,
>  			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG=20
%d\n",
> @@ -1470,7 +1200,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device
> *mhdp) }
>=20
>  	resp &=3D ~CDNS_DP_FRAMER_EN;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
resp);
>=20
>  	/* Spread AMP if required, enable 8b/10b coding */
>  	amp[0] =3D cdns_mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 : 0;
> @@ -1837,7 +1567,7 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		bnd_hsync2vsync |=3D CDNS_IP_DET_INTERLACE_FORMAT;
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_BND_HSYNC2VSYNC(stream_id),
>  			    bnd_hsync2vsync);
>=20
>  	hsync2vsync_pol_ctrl =3D 0;
> @@ -1845,10 +1575,10 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, hsync2vsync_pol_ctrl |=3D
> CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>  		hsync2vsync_pol_ctrl |=3D CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
> -	cdns_mhdp_reg_write(mhdp, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base,=20
CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
>  			    hsync2vsync_pol_ctrl);
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(stream_id),=20
pxl_repr);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_PXL_REPR(stream_id),
> pxl_repr);
>=20
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		dp_framer_sp |=3D CDNS_DP_FRAMER_INTERLACE;
> @@ -1856,19 +1586,19 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, dp_framer_sp |=3D CDNS_DP_FRAMER_HSYNC_POL_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>  		dp_framer_sp |=3D CDNS_DP_FRAMER_VSYNC_POL_LOW;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id),=20
dp_framer_sp);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_SP(stream_id),
> dp_framer_sp);
>=20
>  	front_porch =3D mode->crtc_hsync_start - mode->crtc_hdisplay;
>  	back_porch =3D mode->crtc_htotal - mode->crtc_hsync_end;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRONT_BACK_PORCH(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base,=20
CDNS_DP_FRONT_BACK_PORCH(stream_id),
>  			    CDNS_DP_FRONT_PORCH(front_porch) |
>  			    CDNS_DP_BACK_PORCH(back_porch));
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_BYTE_COUNT(stream_id),
>  			    mode->crtc_hdisplay * bpp / 8);
>=20
>  	msa_h0 =3D mode->crtc_htotal - mode->crtc_hsync_start;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base,=20
CDNS_DP_MSA_HORIZONTAL_0(stream_id),
>  			    CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
>  			    CDNS_DP_MSAH0_HSYNC_START(msa_h0));
>=20
> @@ -1877,11 +1607,11 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, CDNS_DP_MSAH1_HDISP_WIDTH(mode->crtc_hdisplay);
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		msa_horizontal_1 |=3D CDNS_DP_MSAH1_HSYNC_POL_LOW;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base,=20
CDNS_DP_MSA_HORIZONTAL_1(stream_id),
>  			    msa_horizontal_1);
>=20
>  	msa_v0 =3D mode->crtc_vtotal - mode->crtc_vsync_start;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_0(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_0(stream_id),
>  			    CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
>  			    CDNS_DP_MSAV0_VSYNC_START(msa_v0));
>=20
> @@ -1890,7 +1620,7 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>  		msa_vertical_1 |=3D CDNS_DP_MSAV1_VSYNC_POL_LOW;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_1(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_1(stream_id),
>  			    msa_vertical_1);
>=20
>  	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
> @@ -1902,14 +1632,14 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, if (pxlfmt =3D=3D DRM_COLOR_FORMAT_YCBCR420)
>  		misc1 =3D CDNS_DP_TEST_VSC_SDP;
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_MISC(stream_id),
>  			    misc0 | (misc1 << 8));
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_HORIZONTAL(stream_id),
>  			    CDNS_DP_H_HSYNC_WIDTH(hsync) |
>  			    CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_0(stream_id),
>  			    CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
>  			    CDNS_DP_V0_VSTART(msa_v0));
>=20
> @@ -1918,13 +1648,13 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, mode->crtc_vtotal % 2 =3D=3D 0)
>  		dp_vertical_1 |=3D CDNS_DP_V1_VTOTAL_EVEN;
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id),=20
dp_vertical_1);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_1(stream_id),
> dp_vertical_1);
>=20
> -	cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
> -				(mode->flags &=20
DRM_MODE_FLAG_INTERLACE) ?
> -				CDNS_DP_VB_ID_INTERLACED : 0);
> +	cdns_mhdp_dp_reg_write_bit(&mhdp->base, CDNS_DP_VB_ID(stream_id), 2,=20
1,
> +				   (mode->flags &=20
DRM_MODE_FLAG_INTERLACE) ?
> +				   CDNS_DP_VB_ID_INTERLACED : 0);
>=20
> -	ret =3D cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
&framer);
> +	ret =3D cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &framer); if (ret < 0) {
>  		dev_err(mhdp->dev,
>  			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG=20
%d\n",
> @@ -1933,7 +1663,7 @@ static void cdns_mhdp_configure_video(struct
> cdns_mhdp_device *mhdp, }
>  	framer |=3D CDNS_DP_FRAMER_EN;
>  	framer &=3D ~CDNS_DP_NO_VIDEO_MODE;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
framer);
>  }
>=20
>  static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
> @@ -1966,15 +1696,15 @@ static void cdns_mhdp_sst_enable(struct
> cdns_mhdp_device *mhdp,
>=20
>  	mhdp->stream_id =3D 0;
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_TU,
>  			    CDNS_DP_FRAMER_TU_VS(vs) |
>  			    CDNS_DP_FRAMER_TU_SIZE(tu_size) |
>  			    CDNS_DP_FRAMER_TU_CNT_RST_EN);
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LINE_THRESH(0),
>  			    line_thresh & GENMASK(5, 0));
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_STREAM_CONFIG_2(0),
>  			    CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs > 3) ?
>  						   0 : tu_size -=20
vs));
>=20
> @@ -2009,13 +1739,13 @@ static void cdns_mhdp_atomic_enable(struct
> drm_bridge *bridge, mhdp->info->ops->enable(mhdp);
>=20
>  	/* Enable VIF clock for stream 0 */
> -	ret =3D cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> +	ret =3D cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
>  	if (ret < 0) {
>  		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n",=20
ret);
>  		goto out;
>  	}
>=20
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
>  			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>=20
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> @@ -2083,16 +1813,16 @@ static void cdns_mhdp_atomic_disable(struct
> drm_bridge *bridge, cdns_mhdp_hdcp_disable(mhdp);
>=20
>  	mhdp->bridge_enabled =3D false;
> -	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
> +	cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
&resp);
>  	resp &=3D ~CDNS_DP_FRAMER_EN;
>  	resp |=3D CDNS_DP_NO_VIDEO_MODE;
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG,=20
resp);
>=20
>  	cdns_mhdp_link_down(mhdp);
>=20
>  	/* Disable VIF clock for stream 0 */
> -	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> +	cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
> +	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
>  			    resp & ~(CDNS_VIF_CLK_EN |=20
CDNS_VIF_CLK_RSTN));
>=20
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
> @@ -2502,6 +2232,11 @@ static int cdns_mhdp_probe(struct platform_device
> *pdev)
>=20
>  	platform_set_drvdata(pdev, mhdp);
>=20
> +	/* init base struct for access mailbox  */
> +	mhdp->base.dev =3D mhdp->dev;
> +	mhdp->base.regs =3D mhdp->regs;
> +	mhdp->base.mbox_mutex =3D &mhdp->mbox_mutex;
> +
>  	mhdp->info =3D of_device_get_match_data(dev);
>=20
>  	clk_prepare_enable(clk);
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h index
> bad2fc0c73066..f08db38c82bbd 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -15,6 +15,7 @@
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
>=20
> +#include <drm/bridge/cdns-mhdp-helper.h>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
> @@ -27,10 +28,6 @@ struct phy;
>  #define CDNS_APB_CTRL				0x00000
>  #define CDNS_CPU_STALL				BIT(3)
>=20
> -#define CDNS_MAILBOX_FULL			0x00008
> -#define CDNS_MAILBOX_EMPTY			0x0000c
> -#define CDNS_MAILBOX_TX_DATA			0x00010
> -#define CDNS_MAILBOX_RX_DATA			0x00014
>  #define CDNS_KEEP_ALIVE				0x00018
>  #define CDNS_KEEP_ALIVE_MASK			GENMASK(7, 0)
>=20
> @@ -198,45 +195,10 @@ struct phy;
>  #define CDNS_DP_BYTE_COUNT(s)		=09
(CDNS_DPTX_STREAM(s) + 0x7c)
>  #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
>=20
> -/* mailbox */
> -#define MAILBOX_RETRY_US			1000
> -#define MAILBOX_TIMEOUT_US			2000000
> -
> -#define MB_OPCODE_ID				0
> -#define MB_MODULE_ID				1
> -#define MB_SIZE_MSB_ID				2
> -#define MB_SIZE_LSB_ID				3
> -#define MB_DATA_ID				4
> -
> -#define MB_MODULE_ID_DP_TX			0x01
> -#define MB_MODULE_ID_HDCP_TX			0x07
> -#define MB_MODULE_ID_HDCP_RX			0x08
> -#define MB_MODULE_ID_HDCP_GENERAL		0x09
> -#define MB_MODULE_ID_GENERAL			0x0a
> -
> -/* firmware and opcodes */
> +/* firmware */
>  #define FW_NAME					"cadence/
mhdp8546.bin"
>  #define CDNS_MHDP_IMEM				0x10000
>=20
> -#define GENERAL_MAIN_CONTROL			0x01
> -#define GENERAL_TEST_ECHO			0x02
> -#define GENERAL_BUS_SETTINGS			0x03
> -#define GENERAL_TEST_ACCESS			0x04
> -#define GENERAL_REGISTER_READ			0x07
> -
> -#define DPTX_SET_POWER_MNG			0x00
> -#define DPTX_GET_EDID				0x02
> -#define DPTX_READ_DPCD				0x03
> -#define DPTX_WRITE_DPCD				0x04
> -#define DPTX_ENABLE_EVENT			0x05
> -#define DPTX_WRITE_REGISTER			0x06
> -#define DPTX_READ_REGISTER			0x07
> -#define DPTX_WRITE_FIELD			0x08
> -#define DPTX_READ_EVENT				0x0a
> -#define DPTX_GET_LAST_AUX_STAUS			0x0e
> -#define DPTX_HPD_STATE				0x11
> -#define DPTX_ADJUST_LT				0x12
> -
>  #define FW_STANDBY				0
>  #define FW_ACTIVE				1
>=20
> @@ -352,6 +314,8 @@ struct cdns_mhdp_hdcp {
>  };
>=20
>  struct cdns_mhdp_device {
> +	struct cdns_mhdp_base base;
> +
>  	void __iomem *regs;
>  	void __iomem *sapb_regs;
>  	void __iomem *j721e_regs;
> diff --git a/include/drm/bridge/cdns-mhdp-helper.h
> b/include/drm/bridge/cdns-mhdp-helper.h new file mode 100644
> index 0000000000000..477e67601ee5f
> --- /dev/null
> +++ b/include/drm/bridge/cdns-mhdp-helper.h
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 NXP Semiconductor, Inc.
> + */
> +#ifndef __CDNS_MHDP_HELPER_H__
> +#define __CDNS_MHDP_HELPER_H__
> +
> +#include <asm/unaligned.h>
> +#include <linux/iopoll.h>
> +
> +/* mailbox regs offset */
> +#define CDNS_MAILBOX_FULL			0x00008
> +#define CDNS_MAILBOX_EMPTY			0x0000c
> +#define CDNS_MAILBOX_TX_DATA			0x00010
> +#define CDNS_MAILBOX_RX_DATA			0x00014
> +
> +#define MAILBOX_RETRY_US			1000
> +#define MAILBOX_TIMEOUT_US			2000000
> +
> +/* Module ID Code */
> +#define MB_MODULE_ID_DP_TX			0x01
> +#define MB_MODULE_ID_HDMI_TX			0x03
> +#define MB_MODULE_ID_HDCP_TX			0x07
> +#define MB_MODULE_ID_HDCP_RX			0x08
> +#define MB_MODULE_ID_HDCP_GENERAL		0x09
> +#define MB_MODULE_ID_GENERAL			0x0A
> +
> +/* General Commands */
> +#define GENERAL_MAIN_CONTROL			0x01
> +#define GENERAL_TEST_ECHO			0x02
> +#define GENERAL_BUS_SETTINGS			0x03
> +#define GENERAL_TEST_ACCESS			0x04
> +#define GENERAL_REGISTER_WRITE			0x05
> +#define GENERAL_WRITE_FIELD			0x06
> +#define GENERAL_REGISTER_READ			0x07
> +#define GENERAL_GET_HPD_STATE			0x11
> +
> +/* DPTX Commands */
> +#define DPTX_SET_POWER_MNG			0x00
> +#define DPTX_SET_HOST_CAPABILITIES		0x01
> +#define DPTX_GET_EDID				0x02
> +#define DPTX_READ_DPCD				0x03
> +#define DPTX_WRITE_DPCD				0x04
> +#define DPTX_ENABLE_EVENT			0x05
> +#define DPTX_WRITE_REGISTER			0x06
> +#define DPTX_READ_REGISTER			0x07
> +#define DPTX_WRITE_FIELD			0x08
> +#define DPTX_TRAINING_CONTROL			0x09
> +#define DPTX_READ_EVENT				0x0a
> +#define DPTX_READ_LINK_STAT			0x0b
> +#define DPTX_SET_VIDEO				0x0c
> +#define DPTX_SET_AUDIO				0x0d
> +#define DPTX_GET_LAST_AUX_STAUS			0x0e
> +#define DPTX_SET_LINK_BREAK_POINT		0x0f
> +#define DPTX_FORCE_LANES			0x10
> +#define DPTX_HPD_STATE				0x11
> +#define DPTX_ADJUST_LT				0x12
> +
> +/* HDMI TX Commands */
> +#define HDMI_TX_READ				0x00
> +#define HDMI_TX_WRITE				0x01
> +#define HDMI_TX_UPDATE_READ			0x02
> +#define HDMI_TX_EDID				0x03
> +#define HDMI_TX_EVENTS				0x04
> +#define HDMI_TX_HPD_STATUS			0x05
> +
> +struct cdns_mhdp_base {
> +	struct device *dev;
> +	void __iomem *regs;
> +	/* protect mailbox communications with the firmware */
> +	struct mutex *mbox_mutex;
> +};
> +
> +/* Mailbox helper functions */
> +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
> +			   u8 opcode, u16 size, u8 *message);

Any reason to move the declaration for send before recv? It seems reasonabl=
e=20
to have the in alphabetical order.

> +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> +				  u8 module_id, u8 opcode, u16=20
req_size);
> +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> +				u8 *buff, u16 buff_size);

AFAICS while calling a sequence of these 3 functions mhdp->mbox_mutex is=20
locked. This should be noted here.

Best regards,
Alexander

> +/* General commands helper functions */
> +int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value=
);
> +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
> +
> +/* DPTX commands helper functions */
> +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 va=
l);
> +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr, +=
=09
	=09
>       u8 start_bit, u8 bits_no, u32 val);
> +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> +			u32 addr, u8 *data, u16 len);
> +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value=
);
> +
> +#endif /* __CDNS_MHDP_HELPER_H__ */


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


