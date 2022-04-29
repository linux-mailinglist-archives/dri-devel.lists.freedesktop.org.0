Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF51514464
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67F10FC0A;
	Fri, 29 Apr 2022 08:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BB010F972
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:39:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E6985813B0;
 Fri, 29 Apr 2022 04:39:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 29 Apr 2022 04:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221578; x=
 1651228778; bh=21tqyErkdm7cH26OQoWF/VqXYN/cUWjgUiSt8KhywGw=; b=L
 MXN8A5MT/vJe5if+TACu83PEO4w9U0+/MBcEnFbMmpg93q4/UJCVXfndFGTC5QaI
 jlLanXOP2eg40bWWYnEfj8ZtymQwgNi7pYTQkTHIKGlkA70B/l6oiha2+9uGOLJd
 HZyhZpsW9rFS4j3bd/WvtHG6wx6GQGBM0oSl+rNJa4yNHXsSVaAAkkgf1jL242kn
 NhY7E2e1E0t7KpADVB6gmaaUSwxVLACkwszvyjR86fNdVxoXwpdFLtHDQgjnG3Rq
 i/PrRukDAxbe0R5nq28MGdPwwjfIN/gT5G9RsVdIduNseseL/tfgdalpuyNX9Vlu
 eK6pgrqKCjzolnHGHYTNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651221578; x=1651228778; bh=21tqyErkdm7cH
 26OQoWF/VqXYN/cUWjgUiSt8KhywGw=; b=ABqziAFlc4dK2t1EHBDCCYvQDZVYn
 9GjIbxSEltsJgJtFN/MEam2btf4+Nji4H8E5IWgfgvmyt1p4AkXu3IfvTNt1qsuC
 MFl2cCtDD2o9OASZHClK9VJ3se/v/ArqHeIYV6wfhNki0UiulnhQZXCmZQpW3dKU
 ONa6VZT2MBR9Mnd6TAYot13qnfOHMXnm/OFavDryXarN6YcCucxb0YJwMA1L6nRb
 3L0n1CABD6tQReAzvcxcUdBOZun9Yk1BflyssTR3zrPVxdDgBsNUpJUcP/BvhH0O
 MA5lwRxSyKcYvmhUjf6YWZr297UUfKq0Gz4+9VxUSyqtOylcootIwc/0g==
X-ME-Sender: <xms:SKRrYuuJh9_t69LoRgc8xo3i3F0Xpnas7Mf9b_z8diej_fVkxIqzNA>
 <xme:SKRrYjf3OClCj7ikvjbRqr9HX-3AdgfQVbmVrXu2qhZQI1rMYFEvEcJC0AleKTEaa
 SVB_j3wuOGJuBYnxyo>
X-ME-Received: <xmr:SKRrYpwEcUtVIl8zRY_98wlOxw1W-g6pysaJ-HSAQVq8i6dmNwUNmYba5W4ReDX7kQyC5GmfSpnper0Ax7YvbWyb3P0KRyraFbH-IyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SKRrYpOK9nUt0UPEK4CD6XQ-0UNakVgg4rlk6UT5mLhbLxzyUFSqnQ>
 <xmx:SKRrYu_WQDBK7QDVmXxf88Sj9I4-jxWJYy4ZkVxPp0vTuZgCNo8sGw>
 <xmx:SKRrYhXa8LP6urRLKY0sho8TD9TwWrLA5kEKht8ple3WGuqou5z7Yg>
 <xmx:SqRrYgHWhSqNqudIy1rAZ4uEVOTy0sBKnhY0CONckg7wu18bthVekg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:39:35 -0400 (EDT)
Date: Fri, 29 Apr 2022 10:39:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
Message-ID: <20220429083933.q3w75q3zuyyuvo4w@houat>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220327223927.20848-19-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 kernel test robot <lkp@intel.com>, deller@gmx.de, kishon@ti.com,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de,
 Markus Schneider-Pargmann <msp@baylibre.com>, chunfeng.yun@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guillaume,

On Mon, Mar 28, 2022 at 12:39:23AM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
>=20
> It supports the mt8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
>=20
> The driver shares its iomap range with the mtk-dp-phy driver using
> the regmap/syscon facility.
>=20
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>

You don't need to set Reported-by on a patch introducing a new driver.
That would be typically done for a fix.

> ---
>  drivers/gpu/drm/mediatek/Kconfig       |    8 +
>  drivers/gpu/drm/mediatek/Makefile      |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c      | 2221 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>  6 files changed, 2801 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>=20
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 2976d21e9a34..03ffa9b896c3 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,11 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config MTK_DPTX_SUPPORT
> +	tristate "DRM DPTX Support for Mediatek SoCs"
> +	depends on DRM_MEDIATEK
> +	select PHY_MTK_DP
> +	select DRM_DP_HELPER
> +	help
> +	  DRM/KMS Display Port driver for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 29098d7c8307..d86a6406055e 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs :=3D mtk_cec.o \
>  			  mtk_hdmi_ddc.o
> =20
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) +=3D mediatek-drm-hdmi.o
> +
> +obj-$(CONFIG_MTK_DPTX_SUPPORT) +=3D mtk_dp.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> new file mode 100644
> index 000000000000..7cd8459cf719
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -0,0 +1,2221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre

2022?

> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/dp/drm_dp_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <sound/hdmi-codec.h>
> +#include <video/videomode.h>
> +
> +#include "mtk_dp_reg.h"
> +
> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> +
> +//TODO: platform/device data or dts?

DTS :)

> +#define MTK_DP_MAX_LANES 4
> +#define MTK_DP_MAX_LINK_RATE MTK_DP_LINKRATE_HBR3
> +
> +#define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> +
> +#define MTK_DP_TRAIN_RETRY_LIMIT 8
> +#define MTK_DP_TRAIN_MAX_ITERATIONS 5
> +
> +#define MTK_DP_AUX_WRITE_READ_WAIT_TIME_US 20
> +
> +#define MTK_DP_DP_VERSION_11 0x11
> +
> +enum mtk_dp_state {
> +	MTK_DP_STATE_INITIAL,
> +	MTK_DP_STATE_IDLE,
> +	MTK_DP_STATE_PREPARE,
> +	MTK_DP_STATE_NORMAL,
> +};
> +
> +enum mtk_dp_train_state {
> +	MTK_DP_TRAIN_STATE_STARTUP =3D 0,
> +	MTK_DP_TRAIN_STATE_CHECKCAP,
> +	MTK_DP_TRAIN_STATE_CHECKEDID,
> +	MTK_DP_TRAIN_STATE_TRAINING_PRE,
> +	MTK_DP_TRAIN_STATE_TRAINING,
> +	MTK_DP_TRAIN_STATE_NORMAL,
> +	MTK_DP_TRAIN_STATE_DPIDLE,
> +};
> +
> +struct mtk_dp_timings {
> +	struct videomode vm;
> +
> +	u16 htotal;
> +	u16 vtotal;
> +	u8 frame_rate;
> +	u32 pix_rate_khz;
> +};
> +
> +struct mtk_dp_train_info {
> +	bool tps3;
> +	bool tps4;
> +	bool sink_ssc;
> +	bool cable_plugged_in;
> +	bool cable_state_change;
> +	bool cr_done;
> +	bool eq_done;
> +
> +	/* link_rate is in multiple of 0.27Gbps */
> +	int link_rate;
> +	int lane_count;
> +
> +	u8  irq_status;
> +	int check_cap_count;
> +};
> +
> +/* Same values as used by the DP Spec for MISC0 bits 1 and 2 */
> +enum mtk_dp_color_format {
> +	MTK_DP_COLOR_FORMAT_RGB_444 =3D 0,
> +	MTK_DP_COLOR_FORMAT_YUV_422 =3D 1,
> +	MTK_DP_COLOR_FORMAT_YUV_444 =3D 2,
> +	MTK_DP_COLOR_FORMAT_YUV_420 =3D 3,
> +	MTK_DP_COLOR_FORMAT_YONLY =3D 4,
> +	MTK_DP_COLOR_FORMAT_RAW =3D 5,
> +	MTK_DP_COLOR_FORMAT_RESERVED =3D 6,
> +	MTK_DP_COLOR_FORMAT_DEFAULT =3D MTK_DP_COLOR_FORMAT_RGB_444,
> +	MTK_DP_COLOR_FORMAT_UNKNOWN =3D 15,
> +};

Isn't that redundant with DP_MSA_MISC_COLOR_* ?

> +/* Multiple of 0.27Gbps */
> +enum mtk_dp_linkrate {
> +	MTK_DP_LINKRATE_RBR =3D 0x6,
> +	MTK_DP_LINKRATE_HBR =3D 0xA,
> +	MTK_DP_LINKRATE_HBR2 =3D 0x14,
> +	MTK_DP_LINKRATE_HBR25 =3D 0x19,
> +	MTK_DP_LINKRATE_HBR3 =3D 0x1E,
> +};
> +
> +/* Same values as used for DP Spec MISC0 bits 5,6,7 */
> +enum mtk_dp_color_depth {
> +	MTK_DP_COLOR_DEPTH_6BIT =3D 0,
> +	MTK_DP_COLOR_DEPTH_8BIT =3D 1,
> +	MTK_DP_COLOR_DEPTH_10BIT =3D 2,
> +	MTK_DP_COLOR_DEPTH_12BIT =3D 3,
> +	MTK_DP_COLOR_DEPTH_16BIT =3D 4,
> +	MTK_DP_COLOR_DEPTH_UNKNOWN =3D 5,
> +};

DP_MSA_MISC_*_BPC?

> +struct mtk_dp_info {
> +	enum mtk_dp_color_depth depth;
> +	enum mtk_dp_color_format format;
> +	struct mtk_dp_timings timings;
> +};
> +
> +struct dp_cal_data {
> +	unsigned int glb_bias_trim;
> +	unsigned int clktx_impse;
> +
> +	//TODO: see above with MTK_DP_MAX_LANES, make it SoC specific
> +	unsigned int ln_tx_impsel_pmos[MTK_DP_MAX_LANES];
> +	unsigned int ln_tx_impsel_nmos[MTK_DP_MAX_LANES];
> +};
> +
> +struct mtk_dp {
> +	struct device *dev;
> +	struct phy *phy;
> +	struct dp_cal_data cal_data;
> +
> +	struct drm_device *drm_dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct drm_dp_aux aux;
> +
> +	/* Protects edid as it is used in both bridge ops and IRQ handler */
> +	struct mutex edid_lock;
> +	struct edid *edid;
> +
> +	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> +
> +	struct mtk_dp_info info;
> +	enum mtk_dp_state state;
> +
> +	struct mtk_dp_train_info train_info;
> +	enum mtk_dp_train_state train_state;
> +	unsigned int input_fmt;
> +
> +	struct regmap *regs;
> +	struct clk *dp_tx_clk;
> +
> +	bool enabled;
> +
> +	bool has_fec;
> +	/* Protects the mtk_dp struct */
> +	struct mutex dp_lock;
> +
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct device *codec_dev;
> +	u8 connector_eld[MAX_ELD_BYTES];
> +	struct drm_connector *conn;
> +};
> +
> +static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
> +{
> +	return container_of(b, struct mtk_dp, bridge);
> +}
> +
> +static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
> +{
> +	u32 read_val;
> +	int ret;
> +
> +	ret =3D regmap_read(mtk_dp->regs, offset, &read_val);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to read register 0x%x: %d\n",
> +			offset, ret);
> +		return 0;
> +	}
> +
> +	return read_val;
> +}
> +
> +static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
> +{
> +	int ret;
> +
> +	ret =3D regmap_write(mtk_dp->regs, offset, val);
> +	if (ret)
> +		dev_err(mtk_dp->dev,
> +			"Failed to write register 0x%x with value 0x%x: %d\n",
> +			offset, val, ret);
> +	return ret;
> +}
> +
> +static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val,
> +			      u32 mask)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(mtk_dp->regs, offset, mask, val);
> +	if (ret)
> +		dev_err(mtk_dp->dev,
> +			"Failed to update register 0x%x with value 0x%x, mask 0x%x: %d\n",
> +			offset, val, mask, ret);
> +	return ret;
> +}
> +
> +static int mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8=
 *buf,
> +				   size_t length)
> +{
> +	int i;
> +	int ret =3D 0;
> +	int num_regs =3D (length + 1) / 2;
> +
> +	/* 2 bytes per register */
> +	for (i =3D 0; i < num_regs; i++) {
> +		u32 val =3D buf[i * 2] |
> +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 : 0);
> +
> +		ret =3D mtk_dp_write(mtk_dp, offset + i * 4, val);
> +		if (ret)
> +			goto out;
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +static unsigned long mtk_dp_sip_atf_call(unsigned int cmd, unsigned int =
para)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0, 0, 0,
> +		      &res);
> +
> +	pr_debug("[DPTX]%s cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx", __func__, cmd,
> +		 para, res.a0, res.a1);
> +	return res.a1;
> +}
> +
> +static int mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
> +{
> +	const u16 bits_to_set =3D
> +		BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HSP_SEL_DP_ENC0_P0_SHIFT) | BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VSP_SEL_DP_ENC0_P0_SHIFT) | BIT(VSW_SEL_DP_ENC0_P0_SHIFT);
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030, bits_to_set,
> +			   bits_to_set);
> +}
> +
> +#define MTK_UPD_BITS_OR_OUT(mtk_dp, offset, val, mask, ret, label) \
> +	do {\
> +		ret =3D mtk_dp_update_bits(mtk_dp, offset, val, mask); \
> +		if (ret) \
> +			goto label; \
> +	} while (0)
> +
> +static int mtk_dp_set_msa(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +	struct mtk_dp_timings *timings =3D &mtk_dp->info.timings;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3010, timings->htotal,
> +			    HTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3018,
> +			    timings->vm.hsync_len + timings->vm.hback_porch,
> +			   HSTART_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028,
> +			    timings->vm.hsync_len << HSW_SW_DP_ENC0_P0_SHIFT,
> +			   HSW_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3028, 0,
> +			    HSP_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3020, timings->vm.hactive,
> +			    HWIDTH_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3014, timings->vtotal,
> +			    VTOTAL_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_301C,
> +			    timings->vm.vsync_len + timings->vm.vback_porch,
> +			   VSTART_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C,
> +			    timings->vm.vsync_len << VSW_SW_DP_ENC0_P0_SHIFT,
> +			   VSW_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_302C, 0,
> +			    VSP_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3024, timings->vm.vactive,
> +			    VHEIGHT_SW_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3064, timings->vm.hactive,
> +			    HDE_NUM_LAST_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3154, timings->htotal,
> +			    PGEN_HTOTAL_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3158,
> +			    timings->vm.hfront_porch,
> +			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_315C, timings->vm.hsync_len,
> +			    PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3160,
> +			    timings->vm.hback_porch + timings->vm.hsync_len,
> +			   PGEN_HFDE_START_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3164, timings->vm.hactive,
> +			    PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3168, timings->vtotal,
> +			    PGEN_VTOTAL_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_316C,
> +			    timings->vm.vfront_porch,
> +			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3170, timings->vm.vsync_len,
> +			    PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3174,
> +			    timings->vm.vback_porch + timings->vm.vsync_len,
> +			   PGEN_VFDE_START_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3178, timings->vm.vactive,
> +			    PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> +				   enum mtk_dp_color_format color_format)
> +{
> +	u32 val;
> +	int ret;
> +
> +	mtk_dp->info.format =3D color_format;
> +
> +	/* Update MISC0 */
> +	ret =3D mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +				 color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> +			   DP_TEST_COLOR_FORMAT_MASK);
> +
> +	if (ret)
> +		return ret;
> +
> +	switch (color_format) {
> +	case MTK_DP_COLOR_FORMAT_YUV_422:
> +		val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> +		break;
> +	case MTK_DP_COLOR_FORMAT_YUV_420:
> +		val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
> +		break;
> +	case MTK_DP_COLOR_FORMAT_YONLY:
> +	case MTK_DP_COLOR_FORMAT_RAW:
> +	case MTK_DP_COLOR_FORMAT_RESERVED:
> +	case MTK_DP_COLOR_FORMAT_UNKNOWN:
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
> +			 color_format);
> +		fallthrough;
> +	case MTK_DP_COLOR_FORMAT_RGB_444:
> +	case MTK_DP_COLOR_FORMAT_YUV_444:
> +		val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> +		break;
> +	}
> +
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> +			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
> +}
> +
> +static int mtk_dp_set_color_depth(struct mtk_dp *mtk_dp,
> +				  enum mtk_dp_color_depth color_depth)
> +{
> +	int ret;
> +	u32 val;
> +
> +	mtk_dp->info.depth =3D color_depth;
> +
> +	/* Update MISC0 */
> +	ret =3D mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +				 color_depth << DP_TEST_BIT_DEPTH_SHIFT,
> +			   DP_TEST_BIT_DEPTH_MASK);
> +
> +	if (ret)
> +		return ret;
> +
> +	switch (color_depth) {
> +	case MTK_DP_COLOR_DEPTH_6BIT:
> +		val =3D VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_8BIT:
> +		val =3D VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_10BIT:
> +		val =3D VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_12BIT:
> +		val =3D VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_16BIT:
> +		val =3D VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_UNKNOWN:
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color depth %d\n",
> +			 color_depth);
> +		return -EINVAL;
> +	}
> +
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> +			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
> +}
> +
> +static int mtk_dp_mn_overwrite_disable(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
> +			   VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK);
> +}
> +
> +static int mtk_dp_set_sram_read_start(struct mtk_dp *mtk_dp, u32 val)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
> +			   val << SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT,
> +			   SRAM_START_READ_THRD_DP_ENC0_P0_MASK);
> +}
> +
> +static int mtk_dp_setup_encoder(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_303C,
> +			    BIT(VIDEO_MN_GEN_EN_DP_ENC0_P0_SHIFT),
> +			VIDEO_MN_GEN_EN_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3040,
> +			    0x20 << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
> +			SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
> +			    0x20 << SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_SHIFT,
> +			SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3300,
> +			    2 << VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_SHIFT,
> +			VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3364,
> +			    4 << FIFO_READ_START_POINT_DP_ENC1_P0_SHIFT,
> +			FIFO_READ_START_POINT_DP_ENC1_P0_MASK, ret, out);
> +	ret =3D mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368,
> +			   1 << VIDEO_SRAM_FIFO_CNT_RESET_SEL_DP_ENC1_P0_SHIFT |
> +			1 << VIDEO_STABLE_CNT_THRD_DP_ENC1_P0_SHIFT |
> +			BIT(SDP_DP13_EN_DP_ENC1_P0_SHIFT) |
> +			1 << BS2BS_MODE_DP_ENC1_P0_SHIFT);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3038, 0,
> +			    VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31B0,
> +			    4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
> +{
> +	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> +		  HPD_DB_DP_TRANS_P0_MASK);
> +}
> +
> +static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
> +		     BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_CMD_RECV_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_MCCS_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_EDID_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT) |
> +		     BIT(AUX_RX_AUX_RECV_COMPLETE_IRQ_AUX_TX_P0_SHIFT));
> +}
> +
> +static int mtk_dp_aux_set_cmd(struct mtk_dp *mtk_dp, u8 cmd, u32 addr)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3644, cmd,
> +			    MCU_REQUEST_COMMAND_AUX_TX_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3648, addr,
> +			    MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_364C, addr >> 16,
> +			    MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_aux_cmd_complete(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
> +			   BIT(MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_SHIFT),
> +			   MCU_ACK_TRAN_COMPLETE_AUX_TX_P0_MASK |
> +				   PHY_FIFO_RST_AUX_TX_P0_MASK |
> +				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
> +}
> +
> +static int mtk_dp_aux_request_ready(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3630,
> +			   BIT(AUX_TX_REQUEST_READY_AUX_TX_P0_SHIFT),
> +			   AUX_TX_REQUEST_READY_AUX_TX_P0_MASK);
> +}
> +
> +static void mtk_dp_aux_fill_write_fifo(struct mtk_dp *mtk_dp, u8 *buf,
> +				       size_t length)
> +{
> +	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_AUX_P0_3708, buf, length);
> +}
> +
> +static int mtk_dp_aux_read_rx_fifo(struct mtk_dp *mtk_dp, u8 *buf,
> +				   size_t length, int read_delay)
> +{
> +	int ret;
> +	int read_pos;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620, 0,
> +			    AUX_RD_MODE_AUX_TX_P0_MASK, ret, out);
> +
> +	for (read_pos =3D 0; read_pos < length; read_pos++) {
> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3620,
> +				    BIT(AUX_RX_FIFO_R_PULSE_TX_P0_SHIFT),
> +				   AUX_RX_FIFO_READ_PULSE_TX_P0_MASK, ret, out);
> +		usleep_range(read_delay, read_delay * 2);
> +		buf[read_pos] =3D
> +			(u8)(mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3620) &
> +			     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_MASK >>
> +				     AUX_RX_FIFO_READ_DATA_AUX_TX_P0_SHIFT);
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
> +{
> +	int ret;
> +
> +	if (length > 0) {
> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3650,
> +				    (length - 1)
> +				    << MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT,
> +				    MCU_REQ_DATA_NUM_AUX_TX_P0_MASK, ret, out);
> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C, 0,
> +				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
> +				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
> +				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK, ret, out);
> +	} else {
> +		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_362C,
> +				    BIT(AUX_NO_LENGTH_AUX_TX_P0_SHIFT),
> +				    AUX_NO_LENGTH_AUX_TX_P0_MASK |
> +				    AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
> +				    AUX_RESERVED_RW_0_AUX_TX_P0_MASK, ret, out);
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is=
_read)
> +{
> +	int wait_reply =3D MTK_DP_AUX_WAIT_REPLY_COUNT;
> +
> +	while (--wait_reply) {
> +		u32 aux_irq_status;
> +
> +		if (is_read) {
> +			u32 fifo_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);
> +
> +			if (fifo_status &
> +			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
> +			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
> +				return 0;
> +			}
> +		}
> +
> +		aux_irq_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
> +		if (aux_irq_status & AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK)
> +			return 0;
> +
> +		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK)
> +			return -ETIMEDOUT;
> +
> +		usleep_range(100, 500);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u=
8 cmd,
> +				  u32 addr, u8 *buf, size_t length)
> +{
> +	int ret;
> +	u32 reply_cmd;
> +
> +	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
> +			(cmd =3D=3D DP_AUX_NATIVE_READ && !length)))
> +		return -EINVAL;
> +
> +	if (!is_read) {
> +		ret =3D mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
> +					 BIT(AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT),
> +				   AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	mtk_dp_aux_cmd_complete(mtk_dp);
> +	mtk_dp_aux_irq_clear(mtk_dp);
> +	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
> +		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
> +
> +	mtk_dp_aux_set_cmd(mtk_dp, cmd, addr);
> +	mtk_dp_aux_set_length(mtk_dp, length);
> +
> +	if (!is_read) {
> +		if (length)
> +			mtk_dp_aux_fill_write_fifo(mtk_dp, buf, length);
> +
> +		ret =3D mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3704,
> +					 AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK,
> +				   AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	mtk_dp_aux_request_ready(mtk_dp);
> +
> +	ret =3D mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
> +
> +	reply_cmd =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
> +		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
> +
> +	if (ret || reply_cmd) {
> +		u32 phy_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
> +				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
> +		if (phy_status !=3D AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
> +			drm_err(mtk_dp->drm_dev,
> +				"AUX Rx Aux hang, need SW reset\n");
> +			return -EIO;
> +		}
> +
> +		mtk_dp_aux_cmd_complete(mtk_dp);
> +		mtk_dp_aux_irq_clear(mtk_dp);
> +
> +		usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
> +			     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (!length) {
> +		ret =3D mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
> +					 AUX_NO_LENGTH_AUX_TX_P0_MASK |
> +				   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
> +				   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
> +
> +		if (ret)
> +			return ret;
> +
> +	} else if (is_read) {
> +		int read_delay;
> +
> +		if (cmd =3D=3D (DP_AUX_I2C_READ | DP_AUX_I2C_MOT) ||
> +		    cmd =3D=3D DP_AUX_I2C_READ)
> +			read_delay =3D 500;
> +		else
> +			read_delay =3D 100;
> +
> +		mtk_dp_aux_read_rx_fifo(mtk_dp, buf, length, read_delay);
> +	}
> +
> +	mtk_dp_aux_cmd_complete(mtk_dp);
> +	mtk_dp_aux_irq_clear(mtk_dp);
> +	usleep_range(MTK_DP_AUX_WRITE_READ_WAIT_TIME_US,
> +		     MTK_DP_AUX_WRITE_READ_WAIT_TIME_US * 2);
> +
> +	return 0;
> +}
> +
> +static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int lan=
e_num,
> +					  int swing_val, int preemphasis)
> +{
> +	int ret;
> +
> +	u32 lane_shift =3D lane_num * DP_TX1_VOLT_SWING_SHIFT;
> +
> +	if (lane_num < 0 || lane_num > 3)
> +		return false;
> +
> +	dev_dbg(mtk_dp->dev,
> +		"link training swing_val=3D 0x%x, preemphasis =3D 0x%x\n",
> +		swing_val, preemphasis);
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
> +			    swing_val << (DP_TX0_VOLT_SWING_SHIFT + lane_shift),
> +			   DP_TX0_VOLT_SWING_MASK << lane_shift, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_SWING_EMP,
> +			    preemphasis << (DP_TX0_PRE_EMPH_SHIFT + lane_shift),
> +			   DP_TX0_PRE_EMPH_MASK << lane_shift, ret, out);
> +
> +out:
> +	return !ret;
> +}
> +
> +static int mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP, 0,
> +			   DP_TX0_VOLT_SWING_MASK | DP_TX1_VOLT_SWING_MASK |
> +			   DP_TX2_VOLT_SWING_MASK |
> +			   DP_TX3_VOLT_SWING_MASK |
> +			   DP_TX0_PRE_EMPH_MASK | DP_TX1_PRE_EMPH_MASK |
> +			   DP_TX2_PRE_EMPH_MASK | DP_TX3_PRE_EMPH_MASK);
> +}
> +
> +static int mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
> +			   enable ? BIT(FEC_EN_DP_TRANS_P0_SHIFT) : 0,
> +			   FEC_EN_DP_TRANS_P0_MASK);
> +}
> +
> +static int mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	u32 val =3D 0;
> +
> +	if (!enable)
> +		val =3D IRQ_MASK_DP_TRANS_P0_DISC_IRQ |
> +		      IRQ_MASK_DP_TRANS_P0_CONN_IRQ |
> +		      IRQ_MASK_DP_TRANS_P0_INT_IRQ;
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, val,
> +			   IRQ_MASK_DP_TRANS_P0_MASK);
> +}
> +
> +static int mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_342C,
> +			    XTAL_FREQ_DP_TRANS_P0_DEFAULT,
> +			   XTAL_FREQ_DP_TRANS_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3540,
> +			    BIT(FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT),
> +			   FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31EC,
> +			    BIT(AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT),
> +			   AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
> +			    SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_IRQ_MASK, IRQ_MASK_AUX_TOP_IRQ,
> +			    IRQ_MASK_AUX_TOP_IRQ, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
> +{
> +	// Debounce threshold
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
> +			   HPD_DEB_THD_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
> +			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
> +				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
> +			   HPD_INT_THD_DP_TRANS_P0_MASK);
> +
> +	// Connect threshold 1.5ms + 5 x 0.1ms =3D 2ms
> +	// Disconnect threshold 1.5ms + 5 x 0.1ms =3D 2ms
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
> +				   (5 << HPD_CONN_THD_DP_TRANS_P0_SHIFT),
> +			   HPD_DISC_THD_DP_TRANS_P0_MASK |
> +				   HPD_CONN_THD_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
> +			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
> +			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
> +}
> +
> +static int mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	/* modify timeout threshold =3D 1595 [12 : 8] */
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_360C, 0x1595,
> +			    AUX_TIMEOUT_THR_AUX_TX_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3658, 0,
> +			    AUX_TX_OV_EN_AUX_TX_P0_MASK, ret, out);
> +	/* 25 for 26M */
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3634,
> +			    25 << AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT,
> +			   AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK, ret, out);
> +	/* 13 for 26M */
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_3614,
> +			    13 << AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT,
> +			   AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_AUX_P0_37C8,
> +			    BIT(MTK_ATOP_EN_AUX_TX_P0_SHIFT),
> +			   MTK_ATOP_EN_AUX_TX_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
> +			    VBID_VIDEO_MUTE_DP_ENC0_P0_MASK, ret, out);
> +	mtk_dp_set_color_format(mtk_dp, MTK_DP_COLOR_FORMAT_RGB_444);
> +	mtk_dp_set_color_depth(mtk_dp, MTK_DP_COLOR_DEPTH_8BIT);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3368,
> +			    1 << BS2BS_MODE_DP_ENC1_P0_SHIFT,
> +			   BS2BS_MODE_DP_ENC1_P0_MASK, ret, out);
> +
> +	/* dp tx encoder reset all sw */
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004,
> +			    BIT(DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT),
> +			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK, ret, out);
> +	usleep_range(1000, 5000);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
> +			    DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C,
> +			    BIT(DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT),
> +			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK, ret, out);
> +	usleep_range(1000, 5000);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_340C, 0,
> +			    DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35F0,
> +			    lanes =3D=3D 0 ? 0 : BIT(3), BIT(3) | BIT(2), ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3000, lanes,
> +			    LANE_NUM_DP_ENC0_P0_MASK, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_34A4,
> +			    lanes << LANE_NUM_DP_TRANS_P0_SHIFT,
> +			   LANE_NUM_DP_TRANS_P0_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int link_rate_to_mb_per_s(struct mtk_dp *mtk_dp,
> +				 enum mtk_dp_linkrate linkrate)
> +{
> +	switch (linkrate) {
> +	default:
> +		drm_err(mtk_dp->drm_dev,
> +			"Implementation error, unknown linkrate %d\n",
> +			linkrate);
> +		fallthrough;
> +	case MTK_DP_LINKRATE_RBR:
> +		return 1620;
> +	case MTK_DP_LINKRATE_HBR:
> +		return 2700;
> +	case MTK_DP_LINKRATE_HBR2:
> +		return 5400;
> +	case MTK_DP_LINKRATE_HBR3:
> +		return 8100;
> +	}
> +}
> +
> +static u32 check_cal_data_valid(u32 min, u32 max, u32 val, u32 default_v=
al)
> +{
> +	if (val < min || val > max)
> +		return default_val;
> +
> +	return val;
> +}
> +
> +static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
> +{
> +	struct dp_cal_data *cal_data =3D &mtk_dp->cal_data;
> +	struct device *dev =3D mtk_dp->dev;
> +	struct nvmem_cell *cell;
> +	u32 *buf;
> +	size_t len;
> +
> +	cell =3D nvmem_cell_get(dev, "dp_calibration_data");
> +	if (IS_ERR(cell)) {
> +		dev_err(dev,
> +			"Error: Failed to get nvmem cell dp_calibration_data\n");
> +		return PTR_ERR(cell);
> +	}
> +
> +	buf =3D (u32 *)nvmem_cell_read(cell, &len);
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(buf) || ((len / sizeof(u32)) !=3D 4)) {
> +		dev_err(dev,
> +			"Error: Failed to read nvmem_cell_read fail len %ld\n",
> +			(len / sizeof(u32)));
> +		return PTR_ERR(buf);
> +	}
> +
> +	cal_data->glb_bias_trim =3D
> +		check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
> +	cal_data->clktx_impse =3D
> +		check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_pmos[0] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_nmos[0] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_pmos[1] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_nmos[1] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_pmos[2] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_nmos[2] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_pmos[3] =3D
> +		check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
> +	cal_data->ln_tx_impsel_nmos[3] =3D
> +		check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
> +
> +	kfree(buf);
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_set_cal_data(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +	struct dp_cal_data *cal_data =3D &mtk_dp->cal_data;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_DPAUX_TX,
> +			    cal_data->clktx_impse << 20, RG_CKM_PT0_CKTX_IMPSEL, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_GLB_BIAS_GEN_00,
> +			    cal_data->glb_bias_trim << 16,
> +			   RG_XTP_GLB_BIAS_INTR_CTRL, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
> +			    cal_data->ln_tx_impsel_pmos[0] << 12,
> +			   RG_XTP_LN0_TX_IMPSEL_PMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_0,
> +			    cal_data->ln_tx_impsel_nmos[0] << 16,
> +			   RG_XTP_LN0_TX_IMPSEL_NMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
> +			    cal_data->ln_tx_impsel_pmos[1] << 12,
> +			   RG_XTP_LN1_TX_IMPSEL_PMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_1,
> +			    cal_data->ln_tx_impsel_nmos[1] << 16,
> +			   RG_XTP_LN1_TX_IMPSEL_NMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
> +			    cal_data->ln_tx_impsel_pmos[2] << 12,
> +			   RG_XTP_LN2_TX_IMPSEL_PMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_2,
> +			    cal_data->ln_tx_impsel_nmos[2] << 16,
> +			   RG_XTP_LN2_TX_IMPSEL_NMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
> +			    cal_data->ln_tx_impsel_pmos[3] << 12,
> +			   RG_XTP_LN3_TX_IMPSEL_PMOS, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, DP_PHY_LANE_TX_3,
> +			    cal_data->ln_tx_impsel_nmos[3] << 16,
> +			   RG_XTP_LN3_TX_IMPSEL_NMOS, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
> +				enum mtk_dp_linkrate link_rate, int lane_count)
> +{
> +	int ret;
> +	union phy_configure_opts phy_opts =3D {
> +		.dp =3D {
> +			.link_rate =3D link_rate_to_mb_per_s(mtk_dp, link_rate),
> +			.set_rate =3D 1,
> +			.lanes =3D lane_count,
> +			.set_lanes =3D 1,
> +			.ssc =3D mtk_dp->train_info.sink_ssc,
> +		}
> +		};
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> +			    DP_PWR_STATE_MASK, ret, out);
> +
> +	ret =3D phy_configure(mtk_dp->phy, &phy_opts);
> +
> +	if (ret)
> +		goto out;
> +
> +	mtk_dp_set_cal_data(mtk_dp);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			    DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_set_idle_pattern(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	const u32 val =3D POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK;
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3580, enable ? val : =
0, val);
> +}
> +
> +//TODO: check return value in callee
> +static int mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int pattern)
> +{
> +	if (pattern < 0 || pattern > 4) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Implementation error, no such pattern %d\n", pattern);
> +		return -EINVAL;
> +	}
> +
> +	if (pattern =3D=3D 1) /* TPS1 */
> +		mtk_dp_set_idle_pattern(mtk_dp, false);
> +
> +	return mtk_dp_update_bits(mtk_dp,
> +			   MTK_DP_TRANS_P0_3400,
> +			   pattern ? BIT(pattern - 1) << PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
> +			   PATTERN1_EN_DP_TRANS_P0_MASK | PATTERN2_EN_DP_TRANS_P0_MASK |
> +			   PATTERN3_EN_DP_TRANS_P0_MASK |
> +			   PATTERN4_EN_DP_TRANS_P0_MASK);
> +}
> +
> +static int mtk_dp_set_enhanced_frame_mode(struct mtk_dp *mtk_dp, bool en=
able)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
> +			   enable ? BIT(ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT) : 0,
> +			   ENHANCED_FRAME_EN_DP_ENC0_P0_MASK);
> +}
> +
> +static int mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool enab=
le)
> +{
> +	return mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3404,
> +			   enable ? DP_SCR_EN_DP_TRANS_P0_MASK : 0,
> +			   DP_SCR_EN_DP_TRANS_P0_MASK);
> +}
> +
> +static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	u32 val =3D BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
> +
> +	if (enable)
> +		val |=3D BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
> +			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
> +			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
> +
> +	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
> +}
> +
> +static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, 0,
> +			    SW_RST_B_PHYD, ret, out);
> +	usleep_range(10, 200);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, SW_RST_B_PHYD,
> +			    SW_RST_B_PHYD, ret, out);
> +	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			    DP_PWR_STATE_BANDGAP_TPLL,
> +			   DP_PWR_STATE_MASK, ret, out);
> +
> +out:
> +	return ret;
> +}
> +
> +static int mtk_dp_power_disable(struct mtk_dp *mtk_dp)
> +{
> +	int ret;
> +
> +	ret =3D mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> +
> +	if (ret)
> +		goto out;
> +
> +	usleep_range(10, 200);
> +	ret =3D mtk_dp_write(mtk_dp, MTK_DP_0034,
> +			   DA_CKM_CKTX0_EN_FORCE_EN | DA_CKM_BIAS_LPF_EN_FORCE_VAL |
> +		     DA_CKM_BIAS_EN_FORCE_VAL |
> +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
> +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
> +
> +	if (ret)
> +		goto out;
> +
> +	/* Disable RX */
> +	ret =3D mtk_dp_write(mtk_dp, MTK_DP_1040, 0);
> +
> +	if (ret)
> +		goto out;
> +
> +	ret =3D mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> +			   0x550 | BIT(FUSE_SEL_SHIFT) | BIT(MEM_ISO_EN_SHIFT));
> +
> +out:
> +	return ret;
> +}
> +
> +static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp->train_info.link_rate =3D MTK_DP_LINKRATE_HBR2;
> +	mtk_dp->train_info.lane_count =3D MTK_DP_MAX_LANES;
> +	mtk_dp->train_info.irq_status =3D 0;
> +	mtk_dp->train_info.cable_plugged_in =3D false;
> +	mtk_dp->train_info.cable_state_change =3D false;
> +	mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_STARTUP;
> +	mtk_dp->state =3D MTK_DP_STATE_INITIAL;
> +
> +	mtk_dp->info.format =3D MTK_DP_COLOR_FORMAT_RGB_444;
> +	mtk_dp->info.depth =3D MTK_DP_COLOR_DEPTH_8BIT;
> +	memset(&mtk_dp->info.timings, 0, sizeof(struct mtk_dp_timings));
> +	mtk_dp->info.timings.frame_rate =3D 60;
> +
> +	mtk_dp->has_fec =3D false;
> +}
> +
> +static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
> +{
> +	u32 sram_read_start =3D MTK_DP_TBC_BUF_READ_START_ADDR;
> +
> +	if (mtk_dp->train_info.lane_count > 0) {
> +		sram_read_start =3D min_t(u32,
> +					MTK_DP_TBC_BUF_READ_START_ADDR,
> +					mtk_dp->info.timings.vm.hactive /
> +					(mtk_dp->train_info.lane_count * 4 * 2 * 2));
> +		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
> +	}
> +
> +	mtk_dp_setup_encoder(mtk_dp);
> +}
> +
> +static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
> +{
> +	int target_frame_rate =3D 60;
> +	int target_pixel_clk;
> +
> +	if (mtk_dp->info.timings.frame_rate > 0) {
> +		target_frame_rate =3D mtk_dp->info.timings.frame_rate;
> +		target_pixel_clk =3D (int)mtk_dp->info.timings.htotal *
> +				   (int)mtk_dp->info.timings.vtotal *
> +				   target_frame_rate;
> +	} else if (mtk_dp->info.timings.pix_rate_khz > 0) {
> +		target_pixel_clk =3D mtk_dp->info.timings.pix_rate_khz * 1000;
> +	} else {
> +		target_pixel_clk =3D (int)mtk_dp->info.timings.htotal *
> +				   (int)mtk_dp->info.timings.vtotal *
> +				   target_frame_rate;
> +	}
> +
> +	if (target_pixel_clk > 0)
> +		mtk_dp->info.timings.pix_rate_khz =3D target_pixel_clk / 1000;
> +}
> +
> +static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_msa_bypass_disable(mtk_dp);
> +	mtk_dp_calculate_pixrate(mtk_dp);
> +	mtk_dp_pg_disable(mtk_dp);
> +	mtk_dp_setup_tu(mtk_dp);
> +}
> +
> +static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lan=
es,
> +					  u8 dpcd_adjust_req[2])
> +{
> +	int lane;
> +
> +	for (lane =3D 0; lane < lanes; ++lane) {
> +		u8 val;
> +		u8 swing;
> +		u8 preemphasis;
> +		int index =3D lane / 2;
> +		int shift =3D lane % 2 ? DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT : 0;
> +
> +		swing =3D (dpcd_adjust_req[index] >> shift) &
> +			DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
> +		preemphasis =3D ((dpcd_adjust_req[index] >> shift) &
> +			       DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
> +			      DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
> +		val =3D swing << DP_TRAIN_VOLTAGE_SWING_SHIFT |
> +		      preemphasis << DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +
> +		if (swing =3D=3D DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
> +			val |=3D DP_TRAIN_MAX_SWING_REACHED;
> +		if (preemphasis =3D=3D 3)
> +			val |=3D DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> +
> +		mtk_dp_set_swing_pre_emphasis(mtk_dp, lane, swing, preemphasis);
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_LANE0_SET + lane,
> +				   val);
> +	}
> +
> +	/* Wait for the signal to be stable enough */
> +	usleep_range(2000, 5000);
> +}
> +
> +static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
> +				    u8 link_status[DP_LINK_STATUS_SIZE])
> +{
> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
> +			 DP_LINK_STATUS_SIZE);
> +}
> +
> +static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, int target_link_rate,
> +			     int target_lane_count)
> +{
> +	u8 link_status[DP_LINK_STATUS_SIZE] =3D {};
> +	u8 lane_adjust[2] =3D {};
> +	bool pass_tps1 =3D false;
> +	bool pass_tps2_3 =3D false;
> +	int train_retries;
> +	int status_control;
> +	int iteration_count;
> +	u8 prev_lane_adjust;
> +	u8 val;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET, target_link_rate);
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> +			   target_lane_count | DP_LANE_COUNT_ENHANCED_FRAME_EN);
> +
> +	if (mtk_dp->train_info.sink_ssc)
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
> +				   DP_SPREAD_AMP_0_5);
> +
> +	train_retries =3D 0;
> +	status_control =3D 0;
> +	iteration_count =3D 1;
> +	prev_lane_adjust =3D 0xFF;
> +
> +	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
> +	mtk_dp_phy_configure(mtk_dp, target_link_rate, target_lane_count);
> +
> +	dev_dbg(mtk_dp->dev,
> +		"Link train target_link_rate =3D 0x%x, target_lane_count =3D 0x%x\n",
> +		target_link_rate, target_lane_count);
> +
> +	do {
> +		train_retries++;
> +		if (!mtk_dp->train_info.cable_plugged_in ||
> +		    ((mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) !=3D
> +		     0x0)) {
> +			return -ENODEV;
> +		}
> +
> +		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
> +			return -EAGAIN;
> +
> +		if (!pass_tps1) {
> +			mtk_dp_training_set_scramble(mtk_dp, false);
> +
> +			if (status_control =3D=3D 0) {
> +				status_control =3D 1;
> +				mtk_dp_train_set_pattern(mtk_dp, 1);
> +				val =3D DP_LINK_SCRAMBLING_DISABLE |
> +				      DP_TRAINING_PATTERN_1;
> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
> +						   DP_TRAINING_PATTERN_SET,
> +						   DP_LINK_SCRAMBLING_DISABLE |
> +						   DP_TRAINING_PATTERN_1);
> +				drm_dp_dpcd_read(&mtk_dp->aux,
> +						 DP_ADJUST_REQUEST_LANE0_1,
> +						 lane_adjust,
> +						 sizeof(lane_adjust));
> +				iteration_count++;
> +
> +				mtk_dp_train_update_swing_pre(mtk_dp,
> +							      target_lane_count, lane_adjust);
> +			}
> +
> +			drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
> +							       mtk_dp->rx_cap);
> +			mtk_dp_read_link_status(mtk_dp, link_status);
> +
> +			if (drm_dp_clock_recovery_ok(link_status,
> +						     target_lane_count)) {
> +				mtk_dp->train_info.cr_done =3D true;
> +				pass_tps1 =3D true;
> +				train_retries =3D 0;
> +				iteration_count =3D 1;
> +				dev_dbg(mtk_dp->dev, "Link train CR pass\n");
> +			} else if (prev_lane_adjust =3D=3D link_status[4]) {
> +				iteration_count++;
> +				if (prev_lane_adjust &
> +				    DP_ADJUST_VOLTAGE_SWING_LANE0_MASK)
> +					break;
> +			} else {
> +				prev_lane_adjust =3D link_status[4];
> +			}
> +			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
> +		} else if (pass_tps1 && !pass_tps2_3) {
> +			if (status_control =3D=3D 1) {
> +				status_control =3D 2;
> +				if (mtk_dp->train_info.tps4) {
> +					mtk_dp_train_set_pattern(mtk_dp, 4);
> +					val =3D DP_TRAINING_PATTERN_4;
> +				} else if (mtk_dp->train_info.tps3) {
> +					mtk_dp_train_set_pattern(mtk_dp, 3);
> +					val =3D DP_LINK_SCRAMBLING_DISABLE |
> +					      DP_TRAINING_PATTERN_3;
> +				} else {
> +					mtk_dp_train_set_pattern(mtk_dp, 2);
> +					val =3D DP_LINK_SCRAMBLING_DISABLE |
> +					      DP_TRAINING_PATTERN_2;
> +				}
> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
> +						   DP_TRAINING_PATTERN_SET,
> +						   val);
> +
> +				drm_dp_dpcd_read(&mtk_dp->aux,
> +						 DP_ADJUST_REQUEST_LANE0_1,
> +						 lane_adjust,
> +						 sizeof(lane_adjust));
> +
> +				iteration_count++;
> +				mtk_dp_train_update_swing_pre(mtk_dp,
> +							      target_lane_count, lane_adjust);
> +			}
> +
> +			drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
> +							   mtk_dp->rx_cap);
> +
> +			mtk_dp_read_link_status(mtk_dp, link_status);
> +
> +			if (!drm_dp_clock_recovery_ok(link_status,
> +						      target_lane_count)) {
> +				mtk_dp->train_info.cr_done =3D false;
> +				mtk_dp->train_info.eq_done =3D false;
> +				dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +				break;
> +			}
> +
> +			if (drm_dp_channel_eq_ok(link_status,
> +						 target_lane_count)) {
> +				mtk_dp->train_info.eq_done =3D true;
> +				pass_tps2_3 =3D true;
> +				dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +				break;
> +			}
> +
> +			if (prev_lane_adjust =3D=3D link_status[4])
> +				iteration_count++;
> +			else
> +				prev_lane_adjust =3D link_status[4];
> +		}
> +
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_ADJUST_REQUEST_LANE0_1,
> +				 lane_adjust, sizeof(lane_adjust));
> +		mtk_dp_train_update_swing_pre(mtk_dp, target_lane_count,
> +					      lane_adjust);
> +	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
> +		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
> +			   DP_TRAINING_PATTERN_DISABLE);
> +	mtk_dp_train_set_pattern(mtk_dp, 0);
> +
> +	if (!pass_tps2_3)
> +		return -ETIMEDOUT;
> +
> +	mtk_dp->train_info.link_rate =3D target_link_rate;
> +	mtk_dp->train_info.lane_count =3D target_lane_count;
> +
> +	mtk_dp_training_set_scramble(mtk_dp, true);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> +			   target_lane_count |
> +				   DP_LANE_COUNT_ENHANCED_FRAME_EN);
> +	mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
> +
> +	return 0;
> +}
> +
> +static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> +{
> +	u8 buf[DP_RECEIVER_CAP_SIZE] =3D {};
> +	u8 val;
> +	struct mtk_dp_train_info *train_info =3D &mtk_dp->train_info;
> +
> +	if (!mtk_dp_plug_state(mtk_dp))
> +		return false;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> +
> +	memcpy(mtk_dp->rx_cap, buf, min(sizeof(mtk_dp->rx_cap), sizeof(buf)));
> +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=3D DP_TRAINING_AUX_RD_MAS=
K;
> +
> +	train_info->link_rate =3D
> +		min_t(int, MTK_DP_MAX_LINK_RATE, buf[DP_MAX_LINK_RATE]);
> +	train_info->lane_count =3D
> +		min_t(int, MTK_DP_MAX_LANES, drm_dp_max_lane_count(buf));
> +
> +	train_info->tps3 =3D drm_dp_tps3_supported(buf);
> +	train_info->tps4 =3D drm_dp_tps4_supported(buf);
> +
> +	train_info->sink_ssc =3D
> +		!!(buf[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
> +
> +	train_info->sink_ssc =3D false;
> +
> +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> +	if (val & DP_MST_CAP) {
> +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> +		drm_dp_dpcd_readb(&mtk_dp->aux,
> +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0, &val);
> +		if (val)
> +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> +					   DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> +					   val);
> +	}
> +
> +	return true;
> +}
> +
> +static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
> +{
> +	phy_reset(mtk_dp->phy);
> +	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
> +
> +	usleep_range(2000, 5000);
> +}
> +
> +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> +{
> +	int ret =3D 0;
> +	int lane_count;
> +	int link_rate;
> +	int train_limit;
> +	int max_link_rate;
> +	int plug_wait;
> +
> +	for (plug_wait =3D 7; !mtk_dp_plug_state(mtk_dp) && plug_wait > 0;
> +	     --plug_wait)
> +		usleep_range(1000, 5000);
> +	if (plug_wait =3D=3D 0) {
> +		mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_DPIDLE;
> +		return -ENODEV;
> +	}
> +
> +	link_rate =3D mtk_dp->rx_cap[1];
> +	lane_count =3D mtk_dp->rx_cap[2] & 0x1F;
> +
> +	mtk_dp->train_info.link_rate =3D min(MTK_DP_MAX_LINK_RATE, link_rate);
> +	mtk_dp->train_info.lane_count =3D min(MTK_DP_MAX_LANES, lane_count);
> +	link_rate =3D mtk_dp->train_info.link_rate;
> +	lane_count =3D mtk_dp->train_info.lane_count;
> +
> +	switch (link_rate) {
> +	case MTK_DP_LINKRATE_RBR:
> +	case MTK_DP_LINKRATE_HBR:
> +	case MTK_DP_LINKRATE_HBR2:
> +	case MTK_DP_LINKRATE_HBR25:
> +	case MTK_DP_LINKRATE_HBR3:
> +		break;
> +	default:
> +		mtk_dp->train_info.link_rate =3D MTK_DP_LINKRATE_HBR3;
> +		break;
> +	};
>+
> +	max_link_rate =3D link_rate;
> +	for (train_limit =3D 6; train_limit > 0; train_limit--) {
> +		mtk_dp->train_info.cr_done =3D false;
> +		mtk_dp->train_info.eq_done =3D false;
> +
> +		mtk_dp_train_change_mode(mtk_dp);
> +		ret =3D mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> +		if (ret)
> +			return ret;
> +
> +		if (!mtk_dp->train_info.cr_done) {
> +			switch (link_rate) {
> +			case MTK_DP_LINKRATE_RBR:
> +				lane_count =3D lane_count / 2;
> +				link_rate =3D max_link_rate;
> +				if (lane_count =3D=3D 0) {
> +					mtk_dp->train_state =3D
> +						MTK_DP_TRAIN_STATE_DPIDLE;
> +					return -EIO;
> +				}
> +				break;
> +			case MTK_DP_LINKRATE_HBR:
> +				link_rate =3D MTK_DP_LINKRATE_RBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR2:
> +				link_rate =3D MTK_DP_LINKRATE_HBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR3:
> +				link_rate =3D MTK_DP_LINKRATE_HBR2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			};
> +		} else if (!mtk_dp->train_info.eq_done) {
> +			if (lane_count =3D=3D 0)
> +				return -EIO;
> +
> +			lane_count /=3D 2;
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	if (train_limit =3D=3D 0)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret =3D 0;
> +	int i =3D 50;
> +
> +	for (; ret && i; i--) {
> +		if (mtk_dp->train_state =3D=3D MTK_DP_TRAIN_STATE_NORMAL)
> +			continue;
> +
> +		switch (mtk_dp->train_state) {
> +		case MTK_DP_TRAIN_STATE_STARTUP:
> +			mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_CHECKCAP;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKCAP:
> +			if (mtk_dp_parse_capabilities(mtk_dp)) {
> +				mtk_dp->train_info.check_cap_count =3D 0;
> +				mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_CHECKEDID;
> +			} else {
> +				mtk_dp->train_info.check_cap_count++;
> +
> +				if (mtk_dp->train_info.check_cap_count >
> +					MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {
> +					mtk_dp->train_info.check_cap_count =3D 0;
> +					mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_DPIDLE;
> +					ret =3D -ETIMEDOUT;
> +				}
> +			}
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKEDID:
> +			mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> +			mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_TRAINING;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING:
> +			ret =3D mtk_dp_train_start(mtk_dp);
> +			if (!ret) {
> +				mtk_dp_video_mute(mtk_dp, true);
> +				mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_NORMAL;
> +				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> +			} else if (ret !=3D -EAGAIN) {
> +				mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_DPIDLE;
> +			}
> +
> +			ret =3D 0;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_NORMAL:
> +			break;
> +		case MTK_DP_TRAIN_STATE_DPIDLE:
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (ret)
> +		drm_err(mtk_dp->drm_dev, "Train handler failed %d\n", ret);
> +
> +	return ret;
> +}

I'm not really familiar with displayport, but it looks like you're
hand-rolling a significant part of what the drm_dp_* helpers provide.

> +static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	if (enable) {
> +		mtk_dp_set_tx_out(mtk_dp);
> +		mtk_dp_video_mute(mtk_dp, false);
> +	} else {
> +		mtk_dp_video_mute(mtk_dp, true);
> +	}
> +}
> +
> +static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_mn_overwrite_disable(mtk_dp);
> +
> +	mtk_dp_set_msa(mtk_dp);
> +
> +	mtk_dp_set_color_depth(mtk_dp, mtk_dp->info.depth);
> +	mtk_dp_set_color_format(mtk_dp, mtk_dp->info.format);
> +}
> +
> +static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
> +{
> +	switch (mtk_dp->state) {
> +	case MTK_DP_STATE_INITIAL:
> +		mtk_dp_video_mute(mtk_dp, true);
> +		mtk_dp->state =3D MTK_DP_STATE_IDLE;
> +		break;
> +
> +	case MTK_DP_STATE_IDLE:
> +		if (mtk_dp->train_state =3D=3D MTK_DP_TRAIN_STATE_NORMAL)
> +			mtk_dp->state =3D MTK_DP_STATE_PREPARE;
> +		break;
> +
> +	case MTK_DP_STATE_PREPARE:
> +		mtk_dp_video_config(mtk_dp);
> +		mtk_dp_video_enable(mtk_dp, true);
> +
> +		mtk_dp->state =3D MTK_DP_STATE_NORMAL;
> +		break;
> +
> +	case MTK_DP_STATE_NORMAL:
> +		if (mtk_dp->train_state !=3D MTK_DP_TRAIN_STATE_NORMAL) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp->state =3D MTK_DP_STATE_IDLE;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
> +static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_set_idle_pattern(mtk_dp, true);
> +	mtk_dp_initialize_priv_data(mtk_dp);
> +
> +	mtk_dp_initialize_settings(mtk_dp);
> +	mtk_dp_initialize_aux_settings(mtk_dp);
> +	mtk_dp_initialize_digital_settings(mtk_dp);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
> +			   BIT(RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT),
> +			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK);
> +	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
> +
> +	mtk_dp_digital_sw_reset(mtk_dp);
> +}
> +
> +static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
> +			   struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret =3D 0;
> +	void __iomem *base;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	mtk_dp->regs =3D syscon_node_to_regmap(dev->of_node);
> +	if (IS_ERR(mtk_dp->regs))
> +		return PTR_ERR(mtk_dp->regs);
> +
> +	//TODO: optional clock?
> +	mtk_dp->dp_tx_clk =3D devm_clk_get(dev, "faxi");
> +	if (IS_ERR(mtk_dp->dp_tx_clk)) {
> +		ret =3D PTR_ERR(mtk_dp->dp_tx_clk);
> +		dev_info(dev, "Failed to get dptx clock: %d\n", ret);
> +		mtk_dp->dp_tx_clk =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *br=
idge)
> +{
> +	return connector_status_connected;
> +}

I'm not quite sure what's going on there. You seem to have some support
for HPD interrupts above, but you always report the display as
connected?

I'd assume that either you don't have HPD support and then always report
it as connected, or you have HPD support and report the current status
in detect, but that combination seems weird.

> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +				    struct drm_connector *connector)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +	bool enabled =3D mtk_dp->enabled;
> +	struct edid *new_edid =3D NULL;
> +
> +	if (!enabled)
> +		drm_bridge_chain_pre_enable(bridge);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	if (mtk_dp_plug_state(mtk_dp))
> +		new_edid =3D drm_get_edid(connector, &mtk_dp->aux.ddc);
> +
> +	if (!enabled)
> +		drm_bridge_chain_post_disable(bridge);

Are you sure we can't get a mode set while get_edid is called?

If we can, then you could end up disabling the device while it's being
powered on.

> +	mutex_lock(&mtk_dp->edid_lock);
> +	kfree(mtk_dp->edid);
> +	mtk_dp->edid =3D NULL;
> +
> +	if (!new_edid) {
> +		mutex_unlock(&mtk_dp->edid_lock);
> +		return NULL;
> +	}
> +
> +	mtk_dp->edid =3D drm_edid_duplicate(new_edid);
> +	mutex_unlock(&mtk_dp->edid_lock);

Why do you need a copy of the edid there?

> +	return new_edid;
> +}
> +
> +static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
> +				   struct drm_dp_aux_msg *msg)
> +{
> +	struct mtk_dp *mtk_dp;
> +	bool is_read;
> +	u8 request;
> +	size_t accessed_bytes =3D 0;
> +	int retry =3D 3, ret =3D 0;
> +
> +	mtk_dp =3D container_of(mtk_aux, struct mtk_dp, aux);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in ||
> +	    mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) {
> +		mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_CHECKCAP;
> +		ret =3D -EAGAIN;
> +		goto err;
> +	}
> +
> +	switch (msg->request) {
> +	case DP_AUX_I2C_MOT:
> +	case DP_AUX_I2C_WRITE:
> +	case DP_AUX_NATIVE_WRITE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
> +		request =3D msg->request & ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
> +		is_read =3D false;
> +		break;
> +	case DP_AUX_I2C_READ:
> +	case DP_AUX_NATIVE_READ:
> +	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
> +		request =3D msg->request;
> +		is_read =3D true;
> +		break;
> +	default:
> +		drm_err(mtk_aux->drm_dev, "invalid aux cmd =3D %d\n",
> +			msg->request);
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> +	if (msg->size =3D=3D 0) {
> +		ret =3D mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> +					     msg->address + accessed_bytes,
> +					     msg->buffer + accessed_bytes, 0);
> +	} else {
> +		while (accessed_bytes < msg->size) {
> +			size_t to_access =3D
> +				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
> +				      msg->size - accessed_bytes);
> +			while (retry--) {
> +				ret =3D mtk_dp_aux_do_transfer(mtk_dp,
> +							     is_read, request,
> +							     msg->address + accessed_bytes,
> +							     msg->buffer + accessed_bytes,
> +							     to_access);
> +				if (ret =3D=3D 0)
> +					break;
> +				usleep_range(50, 100);
> +			}
> +			if (!retry || ret) {
> +				drm_info(mtk_dp->drm_dev,
> +					 "Failed to do AUX transfer: %d\n",
> +					 ret);
> +				break;
> +			}
> +			accessed_bytes +=3D to_access;
> +		}
> +	}
> +err:
> +	if (ret) {
> +		msg->reply =3D DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
> +		return ret;
> +	}
> +
> +	msg->reply =3D DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> +	return msg->size;
> +}
> +
> +static void mtk_dp_poweroff(struct mtk_dp *mtk_dp)
> +{
> +	mutex_lock(&mtk_dp->dp_lock);
> +
> +	mtk_dp_hwirq_enable(mtk_dp, false);
> +	mtk_dp_power_disable(mtk_dp);
> +	phy_exit(mtk_dp->phy);
> +	clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +
> +	mutex_unlock(&mtk_dp->dp_lock);
> +}
> +
> +static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&mtk_dp->dp_lock);
> +
> +	ret =3D clk_prepare_enable(mtk_dp->dp_tx_clk);
> +	if (ret < 0) {
> +		dev_err(mtk_dp->dev, "Fail to enable clock: %d\n", ret);
> +		goto err;
> +	}
> +	ret =3D phy_init(mtk_dp->phy);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to initialize phy: %d\n", ret);
> +		goto err_phy_init;
> +	}
> +	ret =3D mtk_dp_phy_configure(mtk_dp, MTK_DP_LINKRATE_RBR, 1);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to configure phy: %d\n", ret);
> +		goto err_phy_config;
> +	}
> +
> +	mtk_dp_init_port(mtk_dp);
> +	mtk_dp_power_enable(mtk_dp);
> +	mtk_dp_hwirq_enable(mtk_dp, true);
> +
> +err_phy_config:
> +	phy_exit(mtk_dp->phy);
> +err_phy_init:
> +	clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +err:
> +	mutex_unlock(&mtk_dp->dp_lock);
> +	return ret;
> +}
> +
> +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +	int ret;
> +
> +	ret =3D mtk_dp_poweron(mtk_dp);
> +	if (ret)
> +		return ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(mtk_dp->dev, "Driver does not provide a connector!");
> +		return -EINVAL;
> +	}
> +
> +	if (mtk_dp->next_bridge) {
> +		ret =3D drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> +					&mtk_dp->bridge, flags);
> +		if (ret) {
> +			drm_warn(mtk_dp->drm_dev,
> +				 "Failed to attach external bridge: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	mtk_dp->drm_dev =3D bridge->dev;
> +
> +	return 0;
> +}
> +
> +static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +
> +	mtk_dp->drm_dev =3D NULL;
> +}
> +
> +static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_state)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +
> +	mtk_dp_video_mute(mtk_dp, true);
> +	mtk_dp->state =3D MTK_DP_STATE_IDLE;
> +	mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_STARTUP;
> +
> +	mtk_dp->enabled =3D false;
> +	msleep(100);
> +	mtk_dp_poweroff(mtk_dp);
> +}
> +
> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
> +					  struct drm_display_mode *mode)
> +{
> +	struct mtk_dp_timings *timings =3D &mtk_dp->info.timings;
> +
> +	drm_display_mode_to_videomode(mode, &timings->vm);
> +	timings->frame_rate =3D mode->clock * 1000 / mode->htotal / mode->vtota=
l;

drm_mode_vrefresh()

> +	timings->htotal =3D mode->htotal;
> +	timings->vtotal =3D mode->vtotal;
> +}

It's not really clear to me why you need to duplicate drm_display_mode
here?

> +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_state)
> +{
> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +
> +	mtk_dp->conn =3D drm_atomic_get_new_connector_for_encoder(old_state->ba=
se.state,
> +								bridge->encoder);
> +	if (!mtk_dp->conn) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector is missing\n");
> +		return;
> +	}
> +
> +	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
> +
> +	conn_state =3D
> +		drm_atomic_get_new_connector_state(old_state->base.state, mtk_dp->conn=
);
> +	if (!conn_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state is missing\n");
> +		return;
> +	}
> +
> +	crtc =3D conn_state->crtc;
> +	if (!crtc) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state doesn't have a crtc\n");
> +		return;
> +	}
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(old_state->base.state, crt=
c);
> +	if (!crtc_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as crtc state is missing\n");
> +		return;
> +	}
> +
> +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state->adjusted_mode);
> +	if (!mtk_dp_parse_capabilities(mtk_dp)) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged in\n");
> +		return;
> +	}

All this needs to be done in atomic_check. You aren't allowed to fail in
atomic_enable.

Maxime
