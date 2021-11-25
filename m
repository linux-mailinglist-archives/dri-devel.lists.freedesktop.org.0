Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEC45DD69
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460C4890D7;
	Thu, 25 Nov 2021 15:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02EC6E925
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:27:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77F8F610FE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637854079;
 bh=lkBTAYnePntmqvSbc15XoIItvFlZfl3Dj4ft7yKLNyA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e1p6kf765Tz8giU6qai9lWHGYrFrJ760sQUTy5riIpvw5bVrNCEi6pd1/It4veRx6
 MKtv3BKGgaqRkjmW0028TjkMvaBnyLaxedUZ33QXGVW04xpxvoyewh646UEU3I5Hnl
 pNpxlu7cTos1xeBYfArOEFhMcSm9RHvikZvqseTOF6BB8+/ajJpzlOOwvcaGS5R1im
 1fR1mF0mNN9T9u1tnFPHKI4nYf/qcCNjLl9dTbtJB2Cc5tiISZlsg7vMJLdCdyFhnV
 XYGFl8EAG3DMAplhavI3Gt9fWbU2gO3CUUyqA8rKWdr4HkRHDnxGUgLvJ7akmVj9Fs
 iDt42L/wOejJA==
Received: by mail-ed1-f44.google.com with SMTP id y13so27032531edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:27:59 -0800 (PST)
X-Gm-Message-State: AOAM530kwv6+SkbaqQxCmmkcxTzSuYTVnaKXK0aGn+LFw42vjVrGetyR
 kd5LybyWf1soey8UEZ66eCOWAecTwLINnKd2GA==
X-Google-Smtp-Source: ABdhPJxRnlTDMwjJTMbyVeiHvdVNzK7qHTegpzwQltBzxE62BB5fs9kpvgp3ICfrGp9FCSNqzG5hKMsbvXGW6tr1dZk=
X-Received: by 2002:a17:907:9612:: with SMTP id
 gb18mr32236041ejc.205.1637854077691; 
 Thu, 25 Nov 2021 07:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
In-Reply-To: <20211110130623.20553-8-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Nov 2021 23:27:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__+UCtV5pbJoZjp_T0yRPNaNEJUzPUZ=9k8-wt3x3wKQg@mail.gmail.com>
Message-ID: <CAAOTY__+UCtV5pbJoZjp_T0yRPNaNEJUzPUZ=9k8-wt3x3wKQg@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Guillaume Ranquet <granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

This is a big patch, so I give some comment first.

Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2021=E5=B9=B411=E6=9C=
=8810=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:06=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
>
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
>
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
>
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c              |    2 +-

Separate this to another patch.

>  drivers/gpu/drm/mediatek/Kconfig        |    7 +
>  drivers/gpu/drm/mediatek/Makefile       |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c       | 3094 +++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h   |  568 +++++
>  drivers/gpu/drm/mediatek/mtk_dpi.c      |  111 +-

Ditto.

>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   26 +

Ditto.

>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +

Ditto

>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +

Ditto

>  9 files changed, 3799 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 500279a82167a..bfd98b50ceb5b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5183,7 +5183,7 @@ static void drm_parse_hdmi_deep_color_info(struct d=
rm_connector *connector,
>          * modes and forbids YCRCB422 support for all video modes per
>          * HDMI 1.3 spec.
>          */
> -       info->color_formats =3D DRM_COLOR_FORMAT_RGB444;
> +       info->color_formats |=3D DRM_COLOR_FORMAT_RGB444;
>
>         /* YCRCB444 is optional according to spec. */
>         if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 2976d21e9a34a..029b94c716131 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,10 @@ config DRM_MEDIATEK_HDMI
>         select PHY_MTK_HDMI
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config MTK_DPTX_SUPPORT
> +       tristate "DRM DPTX Support for Mediatek SoCs"
> +       depends on DRM_MEDIATEK
> +       select PHY_MTK_DP
> +       help
> +         DRM/KMS Display Port driver for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 29098d7c8307c..d86a6406055e6 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs :=3D mtk_cec.o \
>                           mtk_hdmi_ddc.o
>
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) +=3D mediatek-drm-hdmi.o
> +
> +obj-$(CONFIG_MTK_DPTX_SUPPORT) +=3D mtk_dp.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> new file mode 100644
> index 0000000000000..83087219d5a5e
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -0,0 +1,3094 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_dp_helper.h>
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
> +       MTK_DP_STATE_INITIAL,
> +       MTK_DP_STATE_IDLE,
> +       MTK_DP_STATE_PREPARE,
> +       MTK_DP_STATE_NORMAL,
> +};
> +
> +enum mtk_dp_train_state {
> +       MTK_DP_TRAIN_STATE_STARTUP =3D 0,
> +       MTK_DP_TRAIN_STATE_CHECKCAP,
> +       MTK_DP_TRAIN_STATE_CHECKEDID,
> +       MTK_DP_TRAIN_STATE_TRAINING_PRE,
> +       MTK_DP_TRAIN_STATE_TRAINING,
> +       MTK_DP_TRAIN_STATE_CHECKTIMING,
> +       MTK_DP_TRAIN_STATE_NORMAL,
> +       MTK_DP_TRAIN_STATE_POWERSAVE,
> +       MTK_DP_TRAIN_STATE_DPIDLE,
> +};
> +
> +struct mtk_dp_timings {
> +       struct videomode vm;
> +
> +       u16 htotal;
> +       u16 vtotal;
> +       u8 frame_rate;
> +       u32 pix_rate_khz;
> +};
> +
> +struct mtk_dp_train_info {
> +       bool tps3;
> +       bool tps4;
> +       bool sink_ssc;
> +       bool cable_plugged_in;
> +       bool cable_state_change;
> +       bool cr_done;
> +       bool eq_done;
> +
> +       // link_rate is in multiple of 0.27Gbps
> +       int link_rate;
> +       int lane_count;
> +
> +       int irq_status;
> +       int check_cap_count;
> +};
> +
> +// Same values as used by the DP Spec for MISC0 bits 1 and 2
> +enum mtk_dp_color_format {
> +       MTK_DP_COLOR_FORMAT_RGB_444 =3D 0,
> +       MTK_DP_COLOR_FORMAT_YUV_422 =3D 1,
> +       MTK_DP_COLOR_FORMAT_YUV_444 =3D 2,
> +       MTK_DP_COLOR_FORMAT_YUV_420 =3D 3,
> +       MTK_DP_COLOR_FORMAT_YONLY =3D 4,
> +       MTK_DP_COLOR_FORMAT_RAW =3D 5,
> +       MTK_DP_COLOR_FORMAT_RESERVED =3D 6,
> +       MTK_DP_COLOR_FORMAT_DEFAULT =3D MTK_DP_COLOR_FORMAT_RGB_444,
> +       MTK_DP_COLOR_FORMAT_UNKNOWN =3D 15,
> +};
> +
> +// Multiple of 0.27Gbps
> +enum mtk_dp_linkrate {
> +       MTK_DP_LINKRATE_RBR =3D 0x6,
> +       MTK_DP_LINKRATE_HBR =3D 0xA,
> +       MTK_DP_LINKRATE_HBR2 =3D 0x14,
> +       MTK_DP_LINKRATE_HBR25 =3D 0x19,
> +       MTK_DP_LINKRATE_HBR3 =3D 0x1E,
> +};
> +
> +// Same values as used for DP Spec MISC0 bits 5,6,7
> +enum mtk_dp_color_depth {
> +       MTK_DP_COLOR_DEPTH_6BIT =3D 0,
> +       MTK_DP_COLOR_DEPTH_8BIT =3D 1,
> +       MTK_DP_COLOR_DEPTH_10BIT =3D 2,
> +       MTK_DP_COLOR_DEPTH_12BIT =3D 3,
> +       MTK_DP_COLOR_DEPTH_16BIT =3D 4,
> +       MTK_DP_COLOR_DEPTH_UNKNOWN =3D 5,
> +};
> +
> +struct mtk_dp_audio_cfg {
> +       int sample_rate;
> +       int word_length_bits;
> +       int channels;
> +};
> +
> +struct mtk_dp_info {
> +       enum mtk_dp_color_depth depth;
> +       enum mtk_dp_color_format format;
> +       struct mtk_dp_audio_cfg audio_caps;
> +       struct mtk_dp_timings timings;
> +};
> +
> +struct dp_cal_data {
> +       unsigned int glb_bias_trim;
> +       unsigned int clktx_impse;
> +
> +       unsigned int ln0_tx_impsel_pmos;
> +       unsigned int ln0_tx_impsel_nmos;
> +       unsigned int ln1_tx_impsel_pmos;
> +       unsigned int ln1_tx_impsel_nmos;
> +       unsigned int ln2_tx_impsel_pmos;
> +       unsigned int ln2_tx_impsel_nmos;
> +       unsigned int ln3_tx_impsel_pmos;
> +       unsigned int ln3_tx_impsel_nmos;
> +};
> +
> +struct mtk_dp {
> +       struct device *dev;
> +       struct platform_device *phy_dev;
> +       struct phy *phy;
> +       struct dp_cal_data cal_data;
> +
> +       struct drm_device *drm_dev;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct drm_dp_aux aux;
> +
> +       struct mutex edid_lock;
> +       struct edid *edid;
> +
> +       u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> +
> +       struct mtk_dp_info info;
> +       enum mtk_dp_state state;
> +
> +       struct mtk_dp_train_info train_info;
> +       enum mtk_dp_train_state train_state;
> +       unsigned int input_fmt;
> +
> +       struct regmap *regs;
> +       struct clk *dp_tx_clk;
> +
> +       bool enabled;
> +       bool audio_enable;
> +
> +       bool has_fec;
> +       struct mutex dp_lock;
> +
> +       struct mutex update_plugged_status_lock;
> +
> +       hdmi_codec_plugged_cb plugged_cb;
> +       struct device *codec_dev;
> +       u8 connector_eld[MAX_ELD_BYTES];
> +};
> +
> +enum mtk_dp_sdp_type {
> +       MTK_DP_SDP_NONE =3D 0x00,
> +       MTK_DP_SDP_ACM =3D 0x01,
> +       MTK_DP_SDP_ISRC =3D 0x02,
> +       MTK_DP_SDP_AVI =3D 0x03,
> +       MTK_DP_SDP_AUI =3D 0x04,
> +       MTK_DP_SDP_SPD =3D 0x05,
> +       MTK_DP_SDP_MPEG =3D 0x06,
> +       MTK_DP_SDP_NTSC =3D 0x07,
> +       MTK_DP_SDP_VSP =3D 0x08,
> +       MTK_DP_SDP_VSC =3D 0x09,
> +       MTK_DP_SDP_EXT =3D 0x0A,
> +       MTK_DP_SDP_PPS0 =3D 0x0B,
> +       MTK_DP_SDP_PPS1 =3D 0x0C,
> +       MTK_DP_SDP_PPS2 =3D 0x0D,
> +       MTK_DP_SDP_PPS3 =3D 0x0E,
> +       MTK_DP_SDP_DRM =3D 0x10,
> +       MTK_DP_SDP_MAX_NUM
> +};
> +
> +struct mtk_dp_sdp_packet {
> +       enum mtk_dp_sdp_type type;
> +       struct dp_sdp sdp;
> +};
> +
> +#define MTK_DP_IEC_CHANNEL_STATUS_LEN 5
> +union mtk_dp_audio_channel_status {
> +       struct {
> +               u8 rev : 1;
> +               u8 is_lpcm : 1;
> +               u8 copy_right : 1;
> +               u8 additional_format_info : 3;
> +               u8 channel_status_mode : 2;
> +               u8 category_code;
> +               u8 src_num : 4;
> +               u8 channel_num : 4;
> +               u8 sampling_freq : 4;
> +               u8 clk_accuracy : 2;
> +               u8 rev2 : 2;
> +               u8 word_len : 4;
> +               u8 original_sampling_freq : 4;
> +       } iec;
> +
> +       u8 buf[MTK_DP_IEC_CHANNEL_STATUS_LEN];
> +};
> +
> +static struct regmap_config mtk_dp_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .max_register =3D SEC_OFFSET + 0x90,
> +       .name =3D "mtk-dp-registers",
> +};
> +
> +static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)

Separate edp and displayport into two patches. For example, the first
patch support edp only, and the second patch add displayport function.

> +{
> +       return mtk_dp->next_bridge !=3D NULL;
> +}
> +

[snip]

> +
> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +                                   struct drm_connector *connector)
> +{
> +       struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +       bool enabled =3D mtk_dp->enabled;
> +       struct edid *new_edid =3D NULL;
> +
> +       if (!enabled)
> +               drm_bridge_chain_pre_enable(bridge);

In mtk_hdmi_bridge_get_edid(), there does not check the power. Why in
this function need this?
Does mtk hdmi driver has a bug?

> +
> +       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> +       usleep_range(2000, 5000);
> +
> +       if (mtk_dp_plug_state(mtk_dp))
> +               new_edid =3D drm_get_edid(connector, &mtk_dp->aux.ddc);
> +
> +       if (!enabled)
> +               drm_bridge_chain_post_disable(bridge);
> +
> +       mutex_lock(&mtk_dp->edid_lock);
> +       kfree(mtk_dp->edid);
> +       mtk_dp->edid =3D NULL;
> +
> +       if (!new_edid) {
> +               mutex_unlock(&mtk_dp->edid_lock);
> +               return NULL;
> +       }
> +
> +       mtk_dp->edid =3D drm_edid_duplicate(new_edid);
> +       mutex_unlock(&mtk_dp->edid_lock);
> +
> +       return new_edid;
> +}
> +
> +static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
> +                                  struct drm_dp_aux_msg *msg)
> +{
> +       ssize_t err =3D -EAGAIN;
> +       struct mtk_dp *mtk_dp;
> +       bool is_read;
> +       u8 request;
> +       size_t accessed_bytes =3D 0;
> +       int retry =3D 3, ret =3D 0;
> +
> +       mtk_dp =3D container_of(mtk_aux, struct mtk_dp, aux);
> +
> +       if (!mtk_dp->train_info.cable_plugged_in ||
> +           mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) {
> +               mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_CHECKCAP;
> +               err =3D -EAGAIN;
> +               goto err;
> +       }
> +
> +       switch (msg->request) {
> +       case DP_AUX_I2C_MOT:
> +       case DP_AUX_I2C_WRITE:
> +       case DP_AUX_NATIVE_WRITE:
> +       case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> +       case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
> +               request =3D msg->request & ~DP_AUX_I2C_WRITE_STATUS_UPDAT=
E;
> +               is_read =3D false;
> +               break;
> +       case DP_AUX_I2C_READ:
> +       case DP_AUX_NATIVE_READ:
> +       case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
> +               request =3D msg->request;
> +               is_read =3D true;
> +               break;
> +       default:
> +               drm_err(mtk_aux->drm_dev, "invalid aux cmd =3D %d\n",
> +                       msg->request);
> +               err =3D -EINVAL;
> +               goto err;

Directly return here.

> +       }
> +
> +       if (msg->size =3D=3D 0) {
> +               mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> +                                      msg->address + accessed_bytes,
> +                                      msg->buffer + accessed_bytes, 0);
> +       } else {
> +               while (accessed_bytes < msg->size) {
> +                       size_t to_access =3D
> +                               min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
> +                                     msg->size - accessed_bytes);
> +                       retry =3D 3;
> +                       while (retry--) {
> +                               ret =3D mtk_dp_aux_do_transfer(
> +                                       mtk_dp, is_read, request,
> +                                       msg->address + accessed_bytes,
> +                                       msg->buffer + accessed_bytes,
> +                                       to_access);
> +                               if (ret =3D=3D 0)
> +                                       break;
> +                               udelay(50);
> +                       }
> +                       if (!retry && ret) {
> +                               drm_info(mtk_dp->drm_dev,
> +                                        "Failed to do AUX transfer: %d\n=
",
> +                                        ret);
> +                               break;
> +                       }
> +                       accessed_bytes +=3D to_access;
> +               }
> +       }
> +err:
> +       if (!ret) {
> +               msg->reply =3D DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY=
_ACK;
> +               ret =3D msg->size;
> +       } else {
> +               msg->reply =3D DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPL=
Y_NACK;
> +               return err;
> +       }
> +
> +       msg->reply =3D DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> +       return msg->size;
> +}
> +
> +static void mtk_dp_aux_init(struct mtk_dp *mtk_dp)
> +{
> +       drm_dp_aux_init(&mtk_dp->aux);
> +       mtk_dp->aux.name =3D "aux_mtk_dp";
> +       mtk_dp->aux.transfer =3D mtk_dp_aux_transfer;
> +}
> +
> +static void mtk_dp_poweroff(struct mtk_dp *mtk_dp)
> +{
> +       mutex_lock(&mtk_dp->dp_lock);
> +
> +       mtk_dp_hwirq_enable(mtk_dp, false);
> +       mtk_dp_power_disable(mtk_dp);
> +       phy_exit(mtk_dp->phy);
> +       clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +
> +       mutex_unlock(&mtk_dp->dp_lock);
> +}
> +
> +static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
> +{
> +       int ret =3D 0;
> +
> +       mutex_lock(&mtk_dp->dp_lock);
> +
> +       ret =3D clk_prepare_enable(mtk_dp->dp_tx_clk);
> +       if (ret < 0) {
> +               dev_err(mtk_dp->dev, "Fail to enable clock: %d\n", ret);
> +               goto err;
> +       }
> +       ret =3D phy_init(mtk_dp->phy);
> +       if (ret) {
> +               dev_err(mtk_dp->dev, "Failed to initialize phy: %d\n", re=
t);
> +               goto err_phy_init;
> +       }
> +       ret =3D mtk_dp_phy_configure(mtk_dp, MTK_DP_LINKRATE_RBR, 1);
> +       if (ret) {
> +               dev_err(mtk_dp->dev, "Failed to configure phy: %d\n", ret=
);
> +               goto err_phy_config;
> +       }
> +
> +       mtk_dp_init_port(mtk_dp);
> +       mtk_dp_power_enable(mtk_dp);
> +       mtk_dp_hwirq_enable(mtk_dp, true);
> +
> +err_phy_config:
> +       phy_exit(mtk_dp->phy);
> +err_phy_init:
> +       clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +err:
> +       mutex_unlock(&mtk_dp->dp_lock);
> +       return ret;
> +}
> +
> +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +       int ret;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               dev_err(mtk_dp->dev, "Driver does not provide a connector=
!");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D mtk_dp_poweron(mtk_dp);

Move the power on to mtk_dp_bridge_atomic_enable().

> +       if (ret)
> +               return ret;
> +
> +       if (mtk_dp->next_bridge) {
> +               ret =3D drm_bridge_attach(bridge->encoder, mtk_dp->next_b=
ridge,
> +                                       &mtk_dp->bridge, flags);
> +               if (ret) {
> +                       drm_warn(mtk_dp->drm_dev,
> +                                "Failed to attach external bridge: %d\n"=
, ret);
> +                       goto err_bridge_attach;
> +               }
> +       }
> +
> +       mtk_dp->drm_dev =3D bridge->dev;
> +
> +       return 0;
> +
> +err_bridge_attach:
> +       mtk_dp_poweroff(mtk_dp);
> +       return ret;
> +}
> +
> +static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
> +{
> +       struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +
> +       mtk_dp->drm_dev =3D NULL;
> +
> +       mtk_dp_poweroff(mtk_dp);
> +}
> +
> +static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                        struct drm_bridge_state *old_sta=
te)
> +{
> +       struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +
> +       mtk_dp_video_mute(mtk_dp, true);
> +       mtk_dp_audio_mute(mtk_dp, true);
> +       mtk_dp->state =3D MTK_DP_STATE_IDLE;
> +       mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_STARTUP;
> +
> +       mtk_dp->enabled =3D false;
> +       msleep(100);
> +}
> +
> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
> +                                         struct drm_display_mode *mode)
> +{
> +       struct mtk_dp_timings *timings =3D &mtk_dp->info.timings;
> +
> +       drm_display_mode_to_videomode(mode, &timings->vm);
> +       timings->frame_rate =3D mode->clock * 1000 / mode->htotal / mode-=
>vtotal;
> +       timings->htotal =3D mode->htotal;
> +       timings->vtotal =3D mode->vtotal;
> +}
> +
> +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *old_stat=
e)
> +{
> +       struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> +       struct drm_connector *conn;
> +       struct drm_connector_state *conn_state;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *crtc_state;
> +       int ret =3D 0;
> +       int i;
> +
> +       conn =3D drm_atomic_get_new_connector_for_encoder(old_state->base=
.state,
> +                                                       bridge->encoder);

mtk_dp->conn =3D drm_atomic_get_new_connector_for_encoder(old_state->base.s=
tate,
                                                       bridge->encoder);

> +       if (!conn) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Can't enable bridge as connector is missing\n");
> +               return;
> +       }
> +
> +       memcpy(mtk_dp->connector_eld, conn->eld, MAX_ELD_BYTES);
> +
> +       conn_state =3D
> +               drm_atomic_get_new_connector_state(old_state->base.state,=
 conn);
> +       if (!conn_state) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Can't enable bridge as connector state is missin=
g\n");
> +               return;
> +       }
> +
> +       crtc =3D conn_state->crtc;
> +       if (!crtc) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Can't enable bridge as connector state doesn't h=
ave a crtc\n");
> +               return;
> +       }
> +
> +       crtc_state =3D drm_atomic_get_new_crtc_state(old_state->base.stat=
e, crtc);
> +       if (!crtc_state) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Can't enable bridge as crtc state is missing\n")=
;
> +               return;
> +       }
> +
> +       mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state->adjusted_mode)=
;

Refer to mtk_hdmi_bridge_atomic_enable() for getting the mode.

> +       if (!mtk_dp_parse_capabilities(mtk_dp)) {
> +               drm_err(mtk_dp->drm_dev,
> +                       "Can't enable bridge as nothing is plugged in\n")=
;
> +               return;
> +       }
> +
> +       //training

Run checkpatch first.

Regards,
Chun-Kuang.

> +       for (i =3D 0; i < 50; i++) {
> +               ret =3D mtk_dp_train_handler(mtk_dp);
> +               if (ret) {
> +                       drm_err(mtk_dp->drm_dev, "Train handler failed %d=
\n",
> +                               ret);
> +                       return;
> +               }
> +
> +               ret =3D mtk_dp_state_handler(mtk_dp);
> +               if (ret) {
> +                       drm_err(mtk_dp->drm_dev, "State handler failed %d=
\n",
> +                               ret);
> +                       return;
> +               }
> +       }
> +
> +       mtk_dp->enabled =3D true;
> +       mtk_dp_update_plugged_status(mtk_dp);
> +}
> +



> --
> 2.32.0
>
