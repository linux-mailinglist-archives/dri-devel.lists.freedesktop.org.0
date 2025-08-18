Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8EB29D6E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997D210E40E;
	Mon, 18 Aug 2025 09:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dt0b/V1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43C910E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:16:52 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-74381df8cf1so1034243a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755508612; x=1756113412;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRCn+w2WlhikEACTjLwDxl/gDVfsy/iHTvrq0Usysks=;
 b=Dt0b/V1rJrTbgEzHLcBQsEi817nLWLcJ9b2CAzwWWu7DDF9sD4nNmh8NRY+xiLsND7
 RBJ53KkPJ5ncbFHintHS+pnbELD3Wwd3I4qz3l9NovsQzmh/ZcdCwKOHi6OeV9OI/Kmh
 y9plZJVvr5cHQLxlx3kosfJd7T6QviwopYnQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755508612; x=1756113412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRCn+w2WlhikEACTjLwDxl/gDVfsy/iHTvrq0Usysks=;
 b=a0Ojc2URqx1WwiyG0iDhjvwt2Iuu1AnqdHzNEA2DUIjjrSr3FccbRUlZhssQshfOom
 sutWGCkpn2LmixFrHdq28czn0qfyF4vYDfjov8dYNo+Hmks5E67i6QY/pB7XR1iANLQR
 Ac0SurCgJ631XuFQUUhfNE9gz6IdSPQBSdbEHnrSCTk9DmMvLuEnniD5h7lz21NgqDo9
 yqwiu5WlIsMyZsdfXe8DnM/sY82ivKHgfQpeF6gKqvotQMQIqKLY2P1DYrS1U0rn1Cem
 vga9XlDE0K+vX27qYCvlsO7W9WBsZhdx7TyhFS5eQwVrb93/jgJ9GbLIEcbGz6ByZHW9
 A7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS7ccvNyHg3Yl/lEJBnIxLkdHMWiN19ayUsZxpCT4bTK6sJXVxjqHShlEqssaHPWX89Rpd687F+4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygY46eDJYJYG0tExQfA33gcmPKUg77hndTULmu5LSeu3M/alCq
 4icVv9XN/J0OSAKYQM2fHX71+L2vIZRTpNG3d93Pt+QNpdcBX2YioDYhAdfGWetX/EMMbpErAnC
 idHnmnw7n4QYB6TEqvIOm+Bw15LBLgCgDJE3jIbO6
X-Gm-Gg: ASbGncsDgvOvvalfG4SIu2C8HRn2uc/WtEOazRp2fGs26Z5tR0VaA8x9wO7x1swqvjf
 jE/sokvKZ78x9DpSUslnromJpWbLi50ZcKSyTEXwiOybABMRPeMqb2P6SX8OdXLvmL53o8vzEmk
 NxKeFHMQlqsT6Ou/CeYgtAkgJK882FGG35udalAx+teZbI4z1yP2Htpwt2WlOP0Nxd8Hu/uRA2v
 opsdkOn95/jeZc13/uIp7RSl4PPcjiAHOIwOc/tmMLFXg==
X-Google-Smtp-Source: AGHT+IFJsJyFBPTd59QK+FCqYBg/hLiwdVRqA172f7ZbuAyxvShD2Q1Ls6hOxY7Z3sXlQsekejW6zio2m2MIZ1zx+m8=
X-Received: by 2002:a05:6830:370f:b0:742:fca4:6e0d with SMTP id
 46e09a7af769-743924e940emr7521460a34.24.1755508610878; Mon, 18 Aug 2025
 02:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
 <20250714-it61620-0714-v1-2-3761164d0b98@ite.com.tw>
In-Reply-To: <20250714-it61620-0714-v1-2-3761164d0b98@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 18 Aug 2025 17:16:39 +0800
X-Gm-Features: Ac12FXwaZnmJHJr0puxaaSkEo-AsxiaQHLoGGqAXM-3KcLAmuZ69ob0akO2rzaQ
Message-ID: <CAEXTbpcYrYnHjHrTeNVhemhRbv=bJgRStg8hM8iCw6VV_d3+xg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ITE IT61620 MIPI DSI to HDMI bridge
 driver
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <hermes.Wu@ite.com.tw>, 
 Kenneth Hung <kenneth.Hung@ite.com.tw>, Pin-yen Lin <treapking@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pet,

On Mon, Aug 18, 2025 at 5:01=E2=80=AFPM Pet Weng <pet.weng@ite.com.tw> wrot=
e:
>
> This adds support for the ITE IT61620 bridge chip which converts
> MIPI DSI input to HDMI output. The Driver implements the basic
> bridge functions and integrates with the DRM bridge and connector
> frameworks.
>
> Supported fetures include:
> MIPI DSI input handling
> HDMI output setup
> Basic mode configuration
> I2C-based control and initialization
> HDCP 1.4 handling
>
> This driver will be used on platforms embedding the IT61620 for
> video output via HDMI from SoCs with MIPI DSI output.
>
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/Kconfig       |   19 +
>  drivers/gpu/drm/bridge/Makefile      |    1 +
>  drivers/gpu/drm/bridge/ite-it61620.c | 3004 ++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3024 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index b9e0ca85226a603a24f90c6879d1499f824060cb..a64ae9004197d0ae9c49f450b=
799cc4be253ffa9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -111,6 +111,25 @@ config DRM_ITE_IT6263
>         help
>           ITE IT6263 LVDS to HDMI bridge chip driver.
>
> +config DRM_ITE_IT61620
> +       tristate "ITE IT61620 DSI/HDMI bridge"
> +       depends on OF
> +       select DRM_DISPLAY_CONNECTOR
> +       select DRM_DISPLAY_HDMI_HELPER
> +       select DRM_DISPLAY_HDCP_HELPER
> +       select DRM_DISPLAY_HELPER
> +       select DRM_MIPI_DSI
> +       select DRM_KMS_HELPER
> +       select DRM_HDMI_HELPER
> +       select CRYPTO
> +       select CRYPTO_HASH
> +       help
> +         Driver for ITE IT61620 MIPI DSI to HDMI bridge
> +         chip driver.
> +
> +         It enables display output through HDMI when connected to a MIPI
> +         DSI source. The bridge translates the video signals for HDMI mo=
nitors.
> +
>  config DRM_ITE_IT6505
>         tristate "ITE IT6505 DisplayPort bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index 245e8a27e3fc525ffe02103e4436c71313f55d9a..c6cc41ea120c9d05146bd414e=
3dc5e7318867057 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -11,6 +11,7 @@ tda998x-y :=3D tda998x_drv.o
>  obj-$(CONFIG_DRM_I2C_NXP_TDA998X) +=3D tda998x.o
>
>  obj-$(CONFIG_DRM_ITE_IT6263) +=3D ite-it6263.o
> +obj-$(CONFIG_DRM_ITE_IT61620) +=3D ite-it61620.o
>  obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o
> diff --git a/drivers/gpu/drm/bridge/ite-it61620.c b/drivers/gpu/drm/bridg=
e/ite-it61620.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d3db2fdf3da714e54efe2d198=
bb814550880d45f
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ite-it61620.c
> @@ -0,0 +1,3004 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 ITE Tech. Inc.
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +#include <drm/display/drm_hdcp_helper.h>
> +#include <drm/display/drm_hdmi_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <video/videomode.h>
> +#include <sound/hdmi-codec.h>
> +#include <crypto/hash.h>
> +
> +#define EDID_R_BURST_NUM 16
> +#define DDC_FIFO_DEPTH 32
> +
> +#define MIPIRX_I2C_ADDRESS (0x78 >> 1)
> +#define TX_I2C_ADDRESS (0xC0 >> 1)
> +
> +#define REG_CTRL_PW 0xFF
> +
> +#define REG_VENDER_ID_L 0x00
> +#define REG_VENDER_ID_H 0x01
> +#define REG_DEVICE_ID_L 0x02
> +#define REG_DEVICE_ID_H 0x03
> +#define REG_DEV_VERSION 0x04
> +#define DEV_VERSION_A0 0xA0
> +#define DEV_VERSION_C0 0xC0
> +
> +#define RX_REG_BANK 0x0F
> +#define M_MIPIRX_BANK 0x01
> +
> +#define RX_REG_RESET_CTRL 0x05
> +#define B_REF_CLOCK_RESET BIT(3)
> +#define RX_REG_CLK_CTRL 0x10
> +#define B_MIPI_INT_STATUS BIT(7)
> +#define RX_REG_D_RST 0x1A
> +#define B_D_RST BIT(0)
> +#define RX_REG_INT_STATUS_01 0x0A
> +#define B_INI_V_CHG BIT(0)
> +#define RX_REG_INT_POL 0x11
> +#define RX_REG_INT_MASK 0x114
> +#define B_V_CHG BIT(0)
> +#define RX_REG_INT_STATUS_02 0x22
> +#define B_INI_V_STB BIT(5)
> +#define RX_REG_MPPCLKI 0x12
> +
> +#define RX_REG_HFP_L 0x30
> +#define RX_REG_HFP_H 0x31
> +#define RX_REG_HSW_L 0x32
> +#define RX_REG_HSW_H 0x33
> +#define RX_REG_HBP_L 0x34
> +#define RX_REG_HBP_H 0x35
> +#define RX_REG_HDEW_L 0x36
> +#define RX_REG_HDEW_H 0x37
> +#define RX_REG_HTOTAL_L 0x48
> +#define RX_REG_HTOTAL_H 0x49
> +
> +#define RX_REG_SELDCLK 0x24
> +#define RX_REG_VFP_L 0x3A
> +#define RX_REG_VFP_H 0x3B
> +#define RX_REG_VSW_L 0x3C
> +#define RX_REG_VSW_H 0x3D
> +#define RX_REG_VBP_L 0x3E
> +#define RX_REG_VBP_H 0x3F
> +#define RX_REG_VDEW_L 0x40
> +#define RX_REG_VDEW_H 0x41
> +#define RX_REG_POL 0x4E
> +#define B_MIPI_H_POL BIT(0)
> +#define B_MIPI_V_POL BIT(1)
> +
> +#define RX_REG_DSCCTRL 0x25
> +#define RX_REG_SYNC_NUM 0x4D
> +#define RX_REG_BSP_SEL 0x1F
> +#define RX_REG_PWD_CTRL 0xE0
> +#define RX_REG_ENVRR 0x1AC
> +#define RX_REG_ENVBLK 0x1AD
> +
> +#define RX_REG_D2P_RESET 0xA0
> +#define RX_REG_D2P_CTRL 0xA1
> +#define RX_REG_AUTO_D2P_RESET 0xA2
> +#define RX_REG_TUNEOPT 0xA9
> +#define RX_REG_TUNETHRE 0xAA
> +#define RX_REG_DSC_RESET 0xAB
> +#define RX_REG_DSC_VFRD 0xAC
> +
> +#define RX_REG_MIPI_CONFIG 0x112
> +#define B_MIPI_LANE_NUM 0x03
> +#define B_MIPI_PN_SWAP BIT(2)
> +#define B_MIPI_LANE_SWAP BIT(3)
> +#define RX_REG_HS_CTRL 0x118
> +#define RX_REG_LP_CTRL 0x119
> +#define RX_REG_MIPI_CTRL01 0x44
> +#define RX_REG_AUTO_SYNC 0x144
> +#define RX_REG_MV_MAX 0x146
> +#define RX_REG_FORCE_M 0x147
> +#define B_FORCE_MHT_STB BIT(0)
> +#define B_FORCE_MVT_STB BIT(3)
> +#define RX_REG_MIPI_CTRL02 0x14E
> +#define B_FIFO_RST BIT(5)
> +
> +#define TX_REG_STATUS01 0x07
> +#define B_INT_STATUS BIT(0)
> +#define B_HPD_STATUS BIT(1)
> +#define B_VIDEO_STB BIT(2)
> +
> +#define TX_REG_HDMITX_BANK 0x0F
> +#define M_HDMITX_BANK 0x03
> +#define B_INT_EVENT_HDMI BIT(4)
> +#define TX_REG_RESET_1_CTRL 0x05
> +#define B_REFERENCE_CLOCK_RESET BIT(0)
> +#define B_VIDEO_RESET BIT(1)
> +#define B_AUDIO_RESET BIT(2)
> +#define B_AUX_RESET BIT(3)
> +#define B_IPCLK_RESET BIT(4)
> +#define B_SDM_RESET BIT(5)
> +#define B_TCLK_RESET BIT(6)
> +
> +#define TX_REG_RESET_2_CTRL 0x06
> +
> +#define TX_REG_V_STS 0x09
> +#define B_RXSEN BIT(1)
> +#define B_V_STABLE BIT(2)
> +#define B_TMDS_STABLE BIT(3)
> +
> +#define TX_REG_SYS_CONFIG 0x0C
> +#define B_EN_HDMI BIT(6)
> +#define B_INT_POL BIT(0)
> +#define B_INT_MODE BIT(1)
> +#define B_INT_OUT_STATUS BIT(2)
> +#define B_INT_OUTPUT BIT(3)
> +
> +#define BIT_OFFSET(x) ((x) * BITS_PER_BYTE)
> +
> +#define TX_REG_INT1 0x10
> +#define TX_REG_INT_MASK1 0x18
> +#define INT_HPD_CHG 0
> +#define B_HPD_CHG BIT(INT_HPD_CHG)
> +#define BIT_HPD_CHG (BIT_OFFSET(0) + INT_HPD_CHG)
> +#define INT_RXSEN_CHANGE 2
> +#define B_RXSEN_CHANGE BIT(INT_RXSEN_CHANGE)
> +#define BIT_RXSEN_CHANGE (BIT_OFFSET(0) + INT_RXSEN_CHANGE)
> +#define INT_AUTH_F 3
> +#define B_INT_AUTH_F BIT(INT_AUTH_F)
> +#define BIT_INT_AUTH_F (BIT_OFFSET(0) + INT_AUTH_F)
> +#define INT_AUTH_D 4
> +#define B_INT_AUTH_D BIT(INT_AUTH_D)
> +#define BIT_INT_AUTH_D (BIT_OFFSET(0) + INT_AUTH_D)
> +
> +#define TX_REG_INT2 0x11
> +#define TX_REG_INT_MASK2 0x19
> +#define INT_KSV_CHECK 1
> +#define B_KSV_CHECK BIT(INT_KSV_CHECK)
> +#define BIT_KSV_CHECK  (BIT_OFFSET(1) + INT_KSV_CHECK)
> +
> +#define TX_REG_INT3 0x16
> +#define TX_REG_INT_MASK3 0x1E
> +#define INT_TMDS_STB_CHG 6
> +#define B_TMDS_STB_CHG BIT(INT_TMDS_STB_CHG)
> +#define BIT_TMDS_STB_CHG (BIT_OFFSET(2) + INT_TMDS_STB_CHG)
> +
> +#define REG_TX_INT_CTRL 0x21
> +#define B_DIS_INT_OUTPUT BIT(5)
> +#define TX_REG_CLOCK_PWD_CTRL 0x2B
> +
> +#define TX_REG_AFE0E 0x0E
> +#define TX_REG_AFE30 0x30
> +#define TX_REG_AFE33 0x33
> +#define TX_REG_AFE34 0x34
> +#define TX_REG_AFE35 0x35
> +#define TX_REG_AFEE9 0xE9
> +#define TX_REG_AFE_XP 0x219
> +#define TX_REG_AFE_XLC1 0x220
> +#define TX_REG_AFE_XLC2 0x223
> +#define TX_REG_AFE_XLC3 0x226
> +#define TX_REG_AFE_DRV 0x23B
> +
> +#define TX_REG_CR_1_CTRL 0x3A
> +#define TX_REG_CR_2_CTRL 0x3F
> +
> +#define TX_REG_R0TM 0x5A
> +#define TX_REG_SHA_SEL 0x5D
> +
> +#define TX_REG_HDCP_CTRL1 0x60
> +#define B_CPDESIRED BIT(0)
> +#define TX_REG_HDCP_PRO 0x61
> +#define B_AUTH_FIRE BIT(0)
> +#define B_LIST_CHK_DONE BIT(4)
> +#define B_LIST_CHK_FAIL BIT(5)
> +#define TX_REG_HDCP_CTRL2 0x62
> +#define TX_REG_AUTOMUTE 0x65
> +#define B_AN_SEL BIT(0)
> +#define B_EN_AN_GEN BIT(1)
> +#define B_EN_M0_RD BIT(5)
> +#define TX_REG_HDCP_AUTH_CS 0x66
> +#define M_AUTH_CH 0x7F
> +#define CS_AUTH_DONE 0x4E
> +#define CS_AUTH_FAIL 0x02
> +#define CS_KSVLIST_CHK 0x19
> +#define TX_REG_HDCP_CTRL3 0x1BA
> +#define B_ENC_DIS BIT(6)
> +#define B_PAUSE BIT(7)
> +
> +#define TX_REG_VD_CTRL1 0xA8
> +#define TX_REG_VD_CTRL2 0xA4
> +#define B_VIDEO_FIFO_REST BIT(0)
> +#define TX_REG_VD_CTRL3 0xB7
> +
> +#define TX_REG_AUD_SPDIF 0x23
> +#define TX_REG_AUD_CTRL 0xB8
> +#define TX_REG_AUD_FMT 0xBA
> +#define TX_REG_EN_AUDIO 0xBB
> +#define TX_REG_AUD_FIFO1 0xBC
> +#define TX_REG_AUD_FIFO2 0xBD
> +#define TX_REG_AUD_STS1 0x1F0
> +#define B_EN_AUD_NLPCM BIT(1)
> +#define TX_REG_AUD_STS2 0x1F3
> +#define TX_REG_AUD_STS3 0x1F4
> +
> +#define TX_REG_LINK_CTRL0 0xD3
> +#define B_EN_AUDIO_MUTE BIT(5)
> +
> +#define TX_REG_V_QUEUE 0xE7
> +#define TX_REG_V_TU 0xEB
> +
> +#define TX_REG_HPD_CONFIG 0xF6
> +
> +#define TX_REG_CEC_CONFIG 0xFA
> +#define B_EN_CEC BIT(0)
> +
> +#define TX_REG_DDC_CTRL1 0x1A0
> +#define TX_REG_DDC_ADDR 0x1A1
> +#define DDC_HDCP_ADDR (DRM_HDCP_DDC_ADDR << 1)
> +#define DDC_EDID_ADDR (DDC_ADDR << 1)
> +#define TX_REG_DDC_OFFSET 0x1A2
> +#define TX_REG_DDC_NUM_L 0x1A3
> +#define TX_REG_DDC_NUM_H 0x1A4
> +#define TX_REG_DDC_SEGMENT 0x1A5
> +#define TX_REG_DDC_COMMAND 0x1A6
> +#define DDC_COMMAND_BURST_R 0X00
> +#define DDC_COMMAND_BURST_W 0X01
> +#define DDC_COMMAND_EDID_RD 0X03
> +#define DDC_COMMAND_FIFO_CLR 0X09
> +#define DDC_COMMAND_ABORT 0X0F
> +#define TX_REG_DDC_CTRL2 0x1AD
> +#define B_DDC_REST BIT(4)
> +#define TX_REG_DDC_STATUS 0x1A7
> +#define B_DDC_TX_DONE BIT(7)
> +#define B_DDC_NOACK BIT(5)
> +#define B_DDC_FULL BIT(2)
> +#define TX_REG_DDC_FIFO 0x1A8
> +#define TX_REG_DDC_FIFO_STS 0x1AE
> +#define M_DDC_STAGE_NUM        0x3F
> +
> +#define TX_REG_HDMI_CTRL1 0x1B8
> +#define B_EN_HDMI_MODE BIT(0)
> +#define TX_REG_HDMI_CTRL2 0x1B9
> +#define B_EN_AVMUTE BIT(0)
> +#define TX_REG_EN_PKT1 0x1BF
> +#define B_EN_AVI BIT(0)
> +#define B_AVI_RP BIT(1)
> +#define B_EN_AUD BIT(2)
> +#define B_EN_AUD_RP BIT(3)
> +#define TX_REG_EN_PKT2 0x1C0
> +#define B_EN_GEN BIT(4)
> +#define B_GEN_RP BIT(5)
> +
> +#define TX_REG_VH_TIME 0x165
> +#define TX_REG_PG_HFP_L 0x150
> +#define TX_REG_PG_HFP_H 0x151
> +#define TX_REG_PG_HSW_L 0x152
> +#define TX_REG_PG_HSW_H 0x153
> +#define TX_REG_PG_HBP_L 0x154
> +#define TX_REG_PG_HBP_H 0x155
> +#define TX_REG_PG_DEW_L 0x156
> +#define TX_REG_PG_DEW_H 0x157
> +#define TX_REG_PG_HVR2_L 0x158
> +#define TX_REG_PG_HVR2_H 0x159
> +#define TX_REG_PG_VFP_L 0x15A
> +#define TX_REG_PG_VFP_H 0x15B
> +#define TX_REG_PG_VSW_L 0x15C
> +#define TX_REG_PG_VSW_H 0x15D
> +#define TX_REG_PG_VBP_L 0x15E
> +#define TX_REG_PG_VBP_H 0x15F
> +#define TX_REG_PG_VDEW_L 0x160
> +#define TX_REG_PG_HDEW_H 0x161
> +#define TX_REG_PG_VFP2_L 0x162
> +#define TX_REG_PG_VFP2_H 0x163
> +#define TX_REG_PG_POL 0x164
> +
> +#define TX_REG_AVIINFO_DB00 0x1D0
> +#define TX_REG_AVIINFO_DB01 0x1D1
> +#define TX_REG_AVIINFO_DB02 0x1D2
> +#define TX_REG_AVIINFO_DB03 0x1D3
> +#define TX_REG_AVIINFO_DB04 0x1D4
> +#define TX_REG_AVIINFO_DB05 0x1D5
> +#define TX_REG_AVIINFO_DB06 0x1D6
> +#define TX_REG_AVIINFO_DB07 0x1D7
> +#define TX_REG_AVIINFO_DB08 0x1D8
> +#define TX_REG_AVIINFO_DB09 0x1D9
> +#define TX_REG_AVIINFO_DB10 0x1DA
> +#define TX_REG_AVIINFO_DB11 0x1DB
> +#define TX_REG_AVIINFO_DB12 0x1DC
> +#define TX_REG_AVIINFO_DB13 0x1DD
> +#define TX_REG_AVIINFO_DB14 0x1DE
> +
> +#define TX_REG_AUDINFO_DB01 0x1E0
> +#define TX_REG_AUDINFO_DB02 0x1E1
> +#define TX_REG_AUDINFO_DB03 0x1E2
> +#define TX_REG_AUDINFO_DB04 0x1E3
> +#define TX_REG_AUDINFO_DB05 0x1E4
> +#define TX_REG_AUDINFO_DB06 0x1E5
> +#define TX_REG_AUDINFO_DB07 0x1E6
> +#define TX_REG_AUDINFO_DB08 0x1E7
> +#define TX_REG_AUDINFO_DB09 0x1E8
> +#define TX_REG_AUDINFO_DB10 0x1E9
> +
> +#define TX_REG_SSC_PD 0x211
> +
> +#define TX_REG_TXPLL_CTRL 0x218
> +#define TX_REG_XLC_7_CTRL 0x227
> +
> +#define TX_REG_TXDRV_PD_CTRL 0x23D
> +#define TX_REG_TXDRV_CTRL 0x240
> +#define TX_REG_AUX_CTRL 0x244
> +#define TX_REG_IPLL_CTRL 0x248
> +#define TX_REG_RDROM_TRG 0x271
> +
> +#define TX_REG_HDCP_ARI_L 0x63
> +#define TX_REG_HDCP_ARI_H 0x64
> +
> +#define TX_REG_HDCP_AUTH_STS 0x67
> +
> +#define TX_REG_HDCP_BKSV1 0x68
> +#define TX_REG_HDCP_BKSV2 0x69
> +#define TX_REG_HDCP_BKSV3 0x6A
> +#define TX_REG_HDCP_BKSV4 0x6B
> +#define TX_REG_HDCP_BKSV5 0x6C
> +
> +#define TX_REG_HDCP_BRI_L 0x6D
> +#define TX_REG_HDCP_BRI_H 0x6E
> +
> +#define TX_REG_HDCP_AKSV1 0x6F
> +#define TX_REG_HDCP_AKSV2 0x70
> +#define TX_REG_HDCP_AKSV3 0x71
> +#define TX_REG_HDCP_AKSV4 0x72
> +#define TX_REG_HDCP_AKSV5 0x73
> +
> +#define TX_REG_ANM0V1 0x74
> +#define TX_REG_ANM0V2 0x75
> +#define TX_REG_ANM0V3 0x76
> +#define TX_REG_HDCP_AN_M0_V4 0x77
> +#define TX_REG_HDCP_AN_M05 0x78
> +#define TX_REG_HDCP_AN_M06 0x79
> +#define TX_REG_HDCP_AN_M07 0x7A
> +#define TX_REG_HDCP_AN_M08 0x7B
> +
> +#define TX_REG_HDCP_BCAPS 0x7C
> +#define B_KSV_READY BIT(5)
> +#define TX_REG_HDCP_BSTS_L 0x7D
> +#define TX_REG_HDCP_BSTS_H 0x7E
> +
> +#define TX_REG_AUDPKT_CTS_0 0x3A8
> +#define TX_REG_AUDPKT_CTS_1 0x3A9
> +#define TX_REG_AUDPKT_CTS_2 0x3AA
> +
> +#define TX_REG_AUDPKT_N_0 0x3AB
> +#define TX_REG_AUDPKT_N_1 0x3AC
> +#define TX_REG_AUDPKT_N_2 0x3AD
> +
> +#define SOFT_DDC_TIMEOUT_MS 100
> +
> +#define MAX_HDCP_DOWN_STREAM_COUNT 127
> +#define HDCP_SHA1_FIFO_LEN (MAX_HDCP_DOWN_STREAM_COUNT * DRM_HDCP_KSV_LE=
N + 10)
> +
> +#define HI_BYTE(x) (((x) >> 8) & 0xFF)
> +#define LO_BYTE(x) ((x) & 0xFF)
> +
> +enum video_state {
> +       it61620_VIDEO_OFF =3D 0x00,
> +       it61620_VIDEO_WAIT,
> +       it61620_VIDEO_ON,
> +};
> +
> +enum hdcp_state {
> +       CP_NONE =3D 0x00,
> +       CP_GOING =3D 0x01,
> +};
> +
> +enum it61620_audio_select {
> +       I2S =3D 0,
> +       SPDIF,
> +};
> +
> +enum it61620_audio_word_length {
> +       WORD_LENGTH_16BIT =3D 0x0,
> +       WORD_LENGTH_18BIT =3D 0x1,
> +       WORD_LENGTH_20BIT =3D 0x2,
> +       WORD_LENGTH_24BIT =3D 0x3,
> +};
> +
> +enum it61620_audio_sample_rate {
> +       SAMPLE_RATE_32K =3D 0x3,
> +       SAMPLE_RATE_48K =3D 0x2,
> +       SAMPLE_RATE_64K =3D 0xB,
> +       SAMPLE_RATE_96K =3D 0xA,
> +       SAMPLE_RATE_192K =3D 0xE,
> +       SAMPLE_RATE_44_1K =3D 0x0,
> +       SAMPLE_RATE_88_2K =3D 0x8,
> +       SAMPLE_RATE_176_4K =3D 0xC,
> +};
> +
> +enum it61620_audio_type {
> +       LPCM =3D 0,
> +       NLPCM,
> +};
> +
> +struct it6162_chip_info {
> +       u16 vid;
> +       u16 pid;
> +};
> +
> +struct it61620_audio {
> +       enum it61620_audio_select select;
> +       enum it61620_audio_type type;
> +       enum it61620_audio_sample_rate sample_rate;
> +       u8 word_length;
> +       u8 channel_count;
> +       u8 audfmt;
> +       unsigned int audio_enable;
> +       unsigned int sample_width;
> +       unsigned int channel_number;
> +       u8 infoframe[HDMI_INFOFRAME_SIZE(AUDIO)];
> +       unsigned char channel_status[AES_IEC958_STATUS_SIZE];
> +};
> +
> +struct it61620_mipirx {
> +       u8 lane_num;
> +       u8 pn_swap;
> +       u8 lane_swap;
> +};
> +
> +struct it61620_hdmi_afe_setting {
> +       unsigned int clock;
> +       unsigned int h2on_pll;
> +       unsigned int hs;
> +       unsigned int afe_val[24];
> +};
> +
> +struct it61620_platform_data {
> +       struct regulator *ovdd1833;
> +       struct regulator *ivdd;
> +       struct regulator *ovdd33;
> +       struct gpio_desc *gpiod_reset;
> +};
> +
> +struct it61620 {
> +       struct drm_bridge bridge;
> +       struct drm_connector connector;
> +       struct device *dev;
> +       enum drm_connector_status connector_status;
> +       struct drm_device *drm;
> +       struct drm_bridge *next_bridge;
> +
> +       struct i2c_client *it61620_i2c;
> +       struct i2c_client *mipirx_i2c;
> +       struct i2c_client *tx_i2c;
> +       struct regmap *it61620_regmap;
> +       struct regmap *mipirx_regmap;
> +       struct regmap *tx_regmap;
> +
> +       struct delayed_work hdcp_work;
> +       struct wait_queue_head wq;
> +
> +       struct it61620_platform_data pdata;
> +       bool powered;
> +       bool is_hdmi;
> +       bool en_audio;
> +       bool hpd;
> +       u8 dev_ver;
> +       const struct drm_edid *cached_edid;
> +
> +       /* operations can only be served one at the time */
> +       struct mutex ddc_lock;
> +
> +       enum video_state video_state;
> +
> +       struct it61620_audio audio_config;
> +
> +       /* it61620 DSI RX related params */
> +       struct mipi_dsi_device *dsi;
> +
> +       struct it61620_mipirx mipirx_config;
> +
> +       struct videomode vm;
> +
> +       struct i2c_adapter ddc;
> +
> +       enum hdcp_state hdcp_state;
> +       u8 sha1_input[HDCP_SHA1_FIFO_LEN];
> +       const struct it6162_chip_info *chip_info;
> +};
> +
> +static void it61620_show_drm_video_mode(struct it61620 *it61620,
> +                                       const struct videomode *vm);
> +static void it61620_stop_hdcp_work(struct it61620 *it61620);
> +static void it61620_start_hdcp_work(struct it61620 *it61620);
> +static void it61620_hdmi_hdcp_wait_ksv_list(struct it61620 *it61620);
> +static inline void it61620_hdmi_enable_avmute(struct it61620 *it61620,
> +                                             bool enable);
> +
> +static struct it61620 *bridge_to_it61620(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct it61620, bridge);
> +}
> +
> +static const struct regmap_config it61620_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .max_register =3D 0xff,
> +       .cache_type =3D REGCACHE_NONE,
> +};
> +
> +static const struct regmap_range it61620_tx_volatile_ranges[] =3D {
> +       { .range_min =3D 0, .range_max =3D 0x3ff},
> +};
> +
> +static const struct regmap_access_table it61620_tx_volatile_table =3D {
> +       .yes_ranges =3D it61620_tx_volatile_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(it61620_tx_volatile_ranges),
> +};
> +
> +static const struct regmap_range_cfg it61620_tx_regmap_ranges[] =3D {
> +       {
> +               .range_min =3D 0,
> +               .range_max =3D 0x3ff,
> +               .selector_reg =3D TX_REG_HDMITX_BANK,
> +               .selector_mask =3D M_HDMITX_BANK,
> +               .selector_shift =3D 0,
> +               .window_start =3D 0x00,
> +               .window_len =3D 0x100,
> +       },
> +};
> +
> +static const struct regmap_config it61620_tx_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .volatile_table =3D &it61620_tx_volatile_table,
> +       .ranges =3D it61620_tx_regmap_ranges,
> +       .num_ranges =3D ARRAY_SIZE(it61620_tx_regmap_ranges),
> +       .max_register =3D 0x3FF,
> +       .cache_type =3D REGCACHE_NONE,
> +};
> +
> +static const struct regmap_range it61620_mipirx_volatile_ranges[] =3D {
> +       { .range_min =3D 0, .range_max =3D 0x1ff },
> +};
> +
> +static const struct regmap_access_table it61620_mipirx_volatile_table =
=3D {
> +       .yes_ranges =3D it61620_mipirx_volatile_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(it61620_mipirx_volatile_ranges),
> +};
> +
> +static const struct regmap_range_cfg it61620_mipirx_regmap_ranges[] =3D =
{
> +       {
> +               .range_min =3D 0,
> +               .range_max =3D 0x1ff,
> +               .selector_reg =3D RX_REG_BANK,
> +               .selector_mask =3D M_MIPIRX_BANK,
> +               .selector_shift =3D 0,
> +               .window_start =3D 0x00,
> +               .window_len =3D 0x100,
> +       },
> +};
> +
> +static const struct regmap_config it61620_mipi_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .volatile_table =3D &it61620_mipirx_volatile_table,
> +       .ranges =3D it61620_mipirx_regmap_ranges,
> +       .num_ranges =3D ARRAY_SIZE(it61620_mipirx_regmap_ranges),
> +       .max_register =3D 0x1FF,
> +       .cache_type =3D REGCACHE_NONE,
> +};
> +
> +static unsigned int it61620_mipi_reg_read(struct it61620 *it61620,
> +                                         unsigned int reg)
> +{
> +       unsigned int val;
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_read(it61620->mipirx_regmap, reg, &val);
> +       if (err < 0) {
> +               dev_err(dev, "read failed rx reg[0x%x] err: %d", reg, err=
);
> +               return err;
> +       }
> +
> +       return val;
> +}
> +
> +static int it61620_mipi_reg_write(struct it61620 *it61620, unsigned int =
reg,
> +                                 unsigned int val)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_write(it61620->mipirx_regmap, reg, val);
> +
> +       if (err < 0) {
> +               dev_err(dev, "write failed rx reg[0x%x] =3D 0x%x err =3D =
%d",
> +                       reg, val, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int it61620_mipi_reg_set(struct it61620 *it61620, unsigned int re=
g,
> +                               unsigned int mask, unsigned int val)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_update_bits(it61620->mipirx_regmap, reg, mask, val=
);
> +       if (err < 0) {
> +               dev_err(dev,
> +                       "write rx reg[0x%x] =3D 0x%x mask =3D 0x%x failed=
 err %d",
> +                       reg, val, mask, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned int it61620_hdmi_reg_read(struct it61620 *it61620,
> +                                         unsigned int reg)
> +{
> +       unsigned int val;
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_read(it61620->tx_regmap, reg, &val);
> +       if (err < 0) {
> +               dev_err(dev, "read failed tx reg[0x%x] err: %d", reg, err=
);
> +               return err;
> +       }
> +
> +       return val;
> +}
> +
> +static int it61620_hdmi_reg_write(struct it61620 *it61620, unsigned int =
reg,
> +                                 unsigned int val)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_write(it61620->tx_regmap, reg, val);
> +
> +       if (err < 0) {
> +               dev_err(dev, "write failed tx reg[0x%x] =3D 0x%x err =3D =
%d",
> +                       reg, val, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int it61620_hdmi_reg_set(struct it61620 *it61620, unsigned int re=
g,
> +                               unsigned int mask, unsigned int val)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_update_bits(it61620->tx_regmap, reg, mask, val);
> +       if (err < 0) {
> +               dev_err(dev,
> +                       "write tx reg[0x%x] =3D 0x%x mask =3D 0x%x failed=
 err %d",
> +                       reg, val, mask, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static void it61620_mipi_reset_video(struct it61620 *it61620)
> +{
> +       it61620_mipi_reg_write(it61620, RX_REG_DSC_RESET, 0x38);
> +       usleep_range(100, 200);
> +       it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x70);
> +       it61620_mipi_reg_write(it61620, RX_REG_DSC_RESET, 0x00);
> +
> +       it61620_mipi_reg_set(it61620, RX_REG_RESET_CTRL, 0x57, 0x00);
> +       usleep_range(1000, 2000);
> +}
> +
> +static void it61620_mipi_m2p_reset(struct it61620 *it61620)
> +{
> +       if (it61620->dev_ver !=3D DEV_VERSION_A0)
> +               return;
> +       it61620_mipi_reg_set(it61620, RX_REG_MIPI_CTRL02, B_FIFO_RST,
> +                            B_FIFO_RST);
> +       usleep_range(1000, 2000);
> +       it61620_mipi_reg_set(it61620, RX_REG_MIPI_CTRL02, B_FIFO_RST, 0x0=
0);
> +}
> +
> +static void it61620_mipi_d2p_reset_fifo(struct it61620 *it61620)
> +{
> +       it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x70);
> +       usleep_range(1000, 2000);
> +       it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x50);
> +       usleep_range(100, 200);
> +       it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x10);
> +       usleep_range(100, 200);
> +       it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x00);
> +}
> +
> +static void it61620_mipi_d2p_reset(struct it61620 *it61620)
> +{
> +       it61620_mipi_m2p_reset(it61620);
> +       it61620_mipi_reg_set(it61620, RX_REG_D_RST, B_D_RST, B_D_RST);
> +       usleep_range(1000, 2000);
> +       it61620_mipi_reg_set(it61620, RX_REG_D_RST, B_D_RST, 0x00);
> +       it61620_mipi_d2p_reset_fifo(it61620);
> +}
> +
> +static void it61620_mipi_reset(struct it61620 *it61620)
> +{
> +       unsigned int val;
> +       u8 dev_ver =3D it61620->dev_ver;
> +       struct it61620_mipirx *mipirx =3D &it61620->mipirx_config;
> +
> +       it61620_mipi_reg_set(it61620, RX_REG_RESET_CTRL, B_REF_CLOCK_RESE=
T,
> +                            B_REF_CLOCK_RESET);
> +       usleep_range(1000, 2000);
> +       it61620_mipi_reg_set(it61620, RX_REG_RESET_CTRL, B_REF_CLOCK_RESE=
T,
> +                            0x00);
> +       usleep_range(1000, 2000);
> +
> +       it61620_mipi_d2p_reset(it61620);
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HS_CTRL, 0x93);
> +       it61620_mipi_reg_write(it61620, RX_REG_LP_CTRL, 0x0C);
> +       it61620_mipi_reg_write(it61620, RX_REG_AUTO_SYNC, 0x01);
> +       it61620_mipi_reg_write(it61620, RX_REG_MV_MAX, 0x0F);
> +       it61620_mipi_reg_write(it61620, RX_REG_FORCE_M, B_FORCE_MHT_STB);
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_MIPI_CTRL01, 0x2C);
> +       it61620_mipi_reg_write(it61620, RX_REG_AUTO_D2P_RESET, 0x13);
> +       it61620_mipi_reg_write(it61620, RX_REG_D2P_CTRL, 0x28);
> +       it61620_mipi_reg_write(it61620, RX_REG_TUNEOPT, 0x9C);
> +
> +       it61620_mipi_reg_set(it61620, RX_REG_CLK_CTRL, 0x30, 0x20);
> +
> +       if (dev_ver !=3D DEV_VERSION_A0) {
> +               it61620_mipi_reg_write(it61620, RX_REG_TUNETHRE, 0x02);
> +               it61620_mipi_reg_write(it61620, RX_REG_AUTO_D2P_RESET, 0x=
83);
> +               it61620_mipi_reg_set(it61620, RX_REG_FORCE_M, B_FORCE_MVT=
_STB,
> +                                    B_FORCE_MVT_STB);
> +               it61620_mipi_reg_set(it61620, RX_REG_SYNC_NUM, 0xF7, 0x44=
);
> +               it61620_mipi_reg_set(it61620, RX_REG_BSP_SEL, 0x03, 0x02)=
;
> +               it61620_mipi_reg_set(it61620, RX_REG_PWD_CTRL, 0x24, 0x24=
);
> +               it61620_mipi_reg_set(it61620, RX_REG_ENVRR, 0x01, 0x00);
> +               it61620_mipi_reg_write(it61620, RX_REG_ENVBLK, 0x00);
> +               it61620_mipi_reg_set(it61620, RX_REG_DSCCTRL, 0x40, 0x00)=
;
> +       }
> +       val =3D (mipirx->lane_num - 1) |
> +             (mipirx->pn_swap ? B_MIPI_PN_SWAP : 0x00) |
> +             (mipirx->lane_swap ? B_MIPI_LANE_SWAP : 0x00);
> +
> +       it61620_mipi_reg_set(it61620, RX_REG_MIPI_CONFIG, 0x0F, val);
> +
> +       it61620_mipi_reset_video(it61620);
> +}
> +
> +static void it61620_mipi_video_change_irq(struct it61620 *it61620)
> +{
> +       unsigned int reg22;
> +       unsigned int video_stable;
> +
> +       reg22 =3D it61620_mipi_reg_read(it61620, RX_REG_INT_STATUS_02);
> +       video_stable =3D reg22 & B_INI_V_STB;
> +
> +       if (video_stable) {
> +               it61620_mipi_m2p_reset(it61620);
> +               it61620_mipi_d2p_reset_fifo(it61620);
> +       } else {
> +               it61620_mipi_reg_set(it61620, RX_REG_D_RST, 0x01, 0x01);
> +               usleep_range(1000, 2000);
> +               it61620_mipi_reg_set(it61620, RX_REG_D_RST, 0x01, 0x00);
> +               it61620_mipi_reg_set(it61620, RX_REG_D2P_RESET, 0x70, 0x7=
0);
> +       }
> +}
> +
> +static void it61620_mipi_irq_handler(struct it61620 *it61620)
> +{
> +       unsigned int reg0a, reg_val;
> +
> +       reg_val =3D it61620_mipi_reg_read(it61620, RX_REG_CLK_CTRL) &
> +                 B_MIPI_INT_STATUS;
> +       if (reg_val =3D=3D 0)
> +               return;
> +
> +       reg0a =3D it61620_mipi_reg_read(it61620, RX_REG_INT_STATUS_01);
> +       it61620_mipi_reg_write(it61620, RX_REG_INT_STATUS_01, reg0a);
> +       if (reg0a & B_INI_V_CHG)
> +               it61620_mipi_video_change_irq(it61620);
> +}
> +
> +static void it61620_mipi_set_d2v_video_timing(struct it61620 *it61620)
> +{
> +       u8 seldckval;
> +       u32 htotal, hfp, hsw, hbp, hdew;
> +       u32 vfp, vsw, vbp, vdew;
> +       u32 clock;
> +       bool hpol_high =3D 0, vpol_high =3D 0;
> +       struct videomode *vm =3D &it61620->vm;
> +
> +       it61620_show_drm_video_mode(it61620, &it61620->vm);
> +
> +       if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +               hpol_high =3D true;
> +
> +       if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +               vpol_high =3D true;
> +
> +       clock =3D vm->pixelclock / 1000;
> +       hdew =3D vm->hactive;
> +
> +       hfp =3D vm->hfront_porch;
> +       hsw =3D vm->hsync_len;
> +       hbp =3D vm->hback_porch;
> +       htotal =3D vm->hactive + vm->hfront_porch + vm->hsync_len +
> +                vm->hback_porch;
> +
> +       vdew =3D vm->vactive;
> +       vfp =3D vm->vfront_porch;
> +       vsw =3D vm->vsync_len;
> +       vbp =3D vm->vback_porch;
> +
> +       if (it61620->dev_ver !=3D DEV_VERSION_A0) {
> +               if (it61620->dev_ver =3D=3D DEV_VERSION_C0) {
> +                       seldckval =3D 0x04;
> +               } else {
> +                       if (clock > 270000)
> +                               seldckval =3D 0x0C;
> +                       else
> +                               seldckval =3D 0x18;
> +               }
> +               it61620_mipi_reg_set(it61620, RX_REG_SELDCLK, 0x1C, seldc=
kval);
> +       }
> +
> +       if (hdew > 2000)
> +               it61620_mipi_reg_write(it61620, RX_REG_DSC_VFRD, 0x50);
> +       else
> +               it61620_mipi_reg_write(it61620, RX_REG_DSC_VFRD, hdew / 3=
6);
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HFP_L, LO_BYTE(hfp));
> +       it61620_mipi_reg_write(it61620, RX_REG_HFP_H, HI_BYTE(hfp));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HSW_L, LO_BYTE(hsw));
> +       it61620_mipi_reg_write(it61620, RX_REG_HSW_H, HI_BYTE(hsw));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HBP_L, LO_BYTE(hbp));
> +       it61620_mipi_reg_write(it61620, RX_REG_HBP_H, HI_BYTE(hbp));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HDEW_L, LO_BYTE(hdew));
> +       it61620_mipi_reg_write(it61620, RX_REG_HDEW_H, HI_BYTE(hdew));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_HTOTAL_L, LO_BYTE(htotal))=
;
> +       it61620_mipi_reg_write(it61620, RX_REG_HTOTAL_H, HI_BYTE(htotal))=
;
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_VFP_L, LO_BYTE(vfp));
> +       it61620_mipi_reg_write(it61620, RX_REG_VFP_H, HI_BYTE(vfp));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_VSW_L, LO_BYTE(vsw));
> +       it61620_mipi_reg_write(it61620, RX_REG_VSW_H, HI_BYTE(vsw));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_VBP_L, LO_BYTE(vbp));
> +       it61620_mipi_reg_write(it61620, RX_REG_VBP_H, HI_BYTE(vbp));
> +
> +       it61620_mipi_reg_write(it61620, RX_REG_VDEW_L, LO_BYTE(vdew));
> +       it61620_mipi_reg_write(it61620, RX_REG_VDEW_H, HI_BYTE(vdew));
> +
> +       it61620_mipi_reg_set(it61620, RX_REG_POL, 0x03, ((!vpol_high) << =
1) |
> +                            (!hpol_high));
> +
> +       if (it61620->dev_ver =3D=3D DEV_VERSION_A0 &&
> +           ((hdew =3D=3D 2560 && vdew =3D=3D 1440 && clock =3D=3D 241500=
) ||
> +            (hdew =3D=3D 720 && vdew =3D=3D 400 && clock =3D=3D 28320) |=
|
> +            (hdew =3D=3D 720 && vdew =3D=3D 576 && clock =3D=3D 27000)))=
 {

Why are these modes special? How do we make sure we're not missing any
modes that require extra operations?

> +               dev_dbg(it61620->dev, "device A0 %dx%d %d Khz",
> +                       hdew, vdew, clock);
> +               it61620_mipi_reg_set(it61620, RX_REG_MPPCLKI, 0x80, 0x80)=
;
> +               it61620_hdmi_reg_set(it61620, TX_REG_VH_TIME, 0x48, 0x48)=
;
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HFP_L, LO_BYTE(=
hfp));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HFP_H, HI_BYTE(=
hfp));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HSW_L, LO_BYTE(=
hsw));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HSW_H, HI_BYTE(=
hsw));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HBP_L, LO_BYTE(=
hbp));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HBP_H, HI_BYTE(=
hbp));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_DEW_L, LO_BYTE(=
hdew));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_DEW_H, HI_BYTE(=
hdew));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HVR2_L, 0xFF);
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HVR2_H, 0x0F);
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VFP_L, LO_BYTE(=
vfp));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VFP_H, HI_BYTE(=
vfp));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VSW_L, LO_BYTE(=
vsw));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VSW_H, HI_BYTE(=
vsw));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VBP_L, LO_BYTE(=
vbp));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VBP_H, HI_BYTE(=
vbp));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VDEW_L, LO_BYTE=
(vdew));
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_HDEW_H, HI_BYTE=
(vdew));
> +
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VFP2_L, 0xFF);
> +               it61620_hdmi_reg_write(it61620, TX_REG_PG_VFP2_H, 0x0F);
> +
> +               it61620_hdmi_reg_set(it61620, TX_REG_PG_POL, 0x07,
> +                                    ((vpol_high) << 1) | (hpol_high));
> +
> +       } else {
> +               it61620_mipi_reg_set(it61620, RX_REG_MPPCLKI, 0x80, 0x00)=
;
> +               it61620_hdmi_reg_set(it61620, TX_REG_VH_TIME, 0x48, 0x00)=
;
> +       }
> +
> +       it61620_mipi_d2p_reset(it61620);
> +}
> +
> +static void it61620_hdmi_reset(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_1_CTRL, 0x7E, 0x7E);
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x36, 0x36);
> +       usleep_range(1000, 2000);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_1_CTRL, 0x1F, 0x00);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_1_CTRL, 0x40, 0x00);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_RDROM_TRG, 0x04);
> +       usleep_range(1000, 2000);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_SYS_CONFIG, B_EN_HDMI, B_EN_=
HDMI);
> +
> +       /* Reset AFE */
> +       it61620_hdmi_reg_set(it61620, TX_REG_XLC_7_CTRL, 0x04, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_IPLL_CTRL, 0x02, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0x04, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0x01, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_XLC_7_CTRL, 0x04, 0x04);
> +       it61620_hdmi_reg_set(it61620, TX_REG_IPLL_CTRL, 0x02, 0x02);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0x04, 0x04);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0x01, 0x01);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0x08, 0x08);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_V_QUEUE, 0x08);
> +       it61620_hdmi_reg_write(it61620, TX_REG_V_TU, 0x07);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_CR_1_CTRL, 0x09);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_CR_2_CTRL, 0x16);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_VD_CTRL1, 0x04);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_HDCP_CTRL2, 0x04);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_VD_CTRL3, 0x84);
> +       it61620_hdmi_reg_write(it61620, TX_REG_HPD_CONFIG, 0x06);
> +       usleep_range(1000, 2000);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_VD_CTRL2, 0x2E);
> +       it61620_hdmi_reg_write(it61620, TX_REG_HDMI_CTRL1, 0x30);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_HDMI_CTRL2, 0x04);
> +}
> +
> +static void it61620_hdmi_poweron(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_PD_CTRL, 0x70, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_XLC_7_CTRL, 0x07, 0x06);
> +       it61620_hdmi_reg_set(it61620, TX_REG_IPLL_CTRL, 0x12, 0x12);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0xc6, 0x84);
> +       it61620_hdmi_reg_set(it61620, TX_REG_SSC_PD, 0x03, 0x03);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_CLOCK_PWD_CTRL, 0x0F, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_VD_CTRL2, B_VIDEO_FIFO_REST,
> +                            B_VIDEO_FIFO_REST);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_VD_CTRL2, B_VIDEO_FIFO_REST,=
 0x00);
> +}
> +
> +static void it61620_hdmi_powerdown(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_PD_CTRL, 0x70, 0x70);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_SSC_PD, 0x03, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_IPLL_CTRL, 0x12, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0xc6, 0xc2);
> +       it61620_hdmi_reg_set(it61620, TX_REG_XLC_7_CTRL, 0x07, 0x01);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0xf9, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_AUX_CTRL, 0x90, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_CLOCK_PWD_CTRL, 0x0F, 0x0a);
> +       it61620_hdmi_reg_set(it61620, TX_REG_CEC_CONFIG, B_EN_CEC, 0x00);
> +}
> +
> +static bool it61620_hdmi_get_hpd_status(struct it61620 *it61620)
> +{
> +       int val;
> +
> +       val =3D it61620_hdmi_reg_read(it61620, TX_REG_STATUS01);
> +       if (val < 0)
> +               return false;
> +
> +       return !!(val & B_HPD_STATUS);
> +}
> +
> +static void it61620_hdmi_ddc_abort(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_DDC_CTRL2, B_DDC_REST, B_DDC=
_REST);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_DDC_CTRL2, B_DDC_REST, 0x00)=
;
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_A=
BORT);
> +       usleep_range(1000, 2000);
> +       drm_dbg(drm, "tx ddc ststus %02X\n",
> +               it61620_hdmi_reg_read(it61620, TX_REG_DDC_STATUS));
> +}
> +
> +static int it61620_hdmi_ddc_wait(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       unsigned int ddc_status;
> +       int ret =3D 0;
> +       unsigned long timeout;
> +
> +       timeout =3D jiffies + msecs_to_jiffies(SOFT_DDC_TIMEOUT_MS) + 1;
> +
> +       for (;;) {
> +               usleep_range(1000, 2000);
> +               ddc_status =3D it61620_hdmi_reg_read(it61620, TX_REG_DDC_=
STATUS);
> +
> +               if (ddc_status & B_DDC_NOACK) {
> +                       drm_dbg(drm, "DDC no ack");
> +                       ret =3D -EIO;
> +                       break;
> +               }
> +
> +               if (ddc_status & B_DDC_TX_DONE)
> +                       break;
> +
> +               if (ddc_status & B_DDC_FULL) {
> +                       drm_dbg(drm, "DDC FULL");
> +                       break;
> +               }
> +
> +               if (time_after(jiffies, timeout)) {
> +                       drm_dbg(drm, "DDC SOFT timeout %x\n", ddc_status)=
;
> +                       ret =3D -ETIMEDOUT;
> +                       break;
> +               }
> +       }
> +
> +       return ret;
> +}

Can we re-write this function with readx_poll_timeout() or
regmap_read_poll_timeout()?

To use readx_poll_timeout(), you might need to introduce a dedicated
function for reading TX_REG_DDC_STATUS. anx7625.c has some example
usages with this.

To use regmap_read_poll_timeout(), you will have to handle the checked
in it61620_hdmi_reg_read() here.

> +
> +static int it61620_hdmi_get_ddc_fifo(struct it61620 *it61620, u8 *buf,
> +                                    size_t len)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_bulk_read(it61620->tx_regmap, TX_REG_DDC_FIFO, buf=
, len);
> +       if (err < 0) {
> +               dev_err(dev, "read ddc fifo failed tx reg[0x%x] err =3D %=
d",
> +                       TX_REG_DDC_FIFO, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int it61620_hdmi_set_ddc_fifo(struct it61620 *it61620, u8 *buf,
> +                                    size_t len)
> +{
> +       int err;
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->powered)
> +               return -ENODEV;
> +
> +       err =3D regmap_bulk_write(it61620->tx_regmap, TX_REG_DDC_FIFO, bu=
f, len);
> +       if (err < 0) {
> +               dev_err(dev, "write ddc fifo failed tx reg[0x%x] err =3D =
%d",
> +                       TX_REG_DDC_FIFO, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct it61620_hdmi_afe_setting hdmi_afe[4] =3D {
> +       {375000, 0x01, 0x02,
> +               {0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x01, 0x4B, 0x0F, 0x00, 0x07, 0x04}},
> +       {340000, 0x01, 0x02,
> +               {0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x03, 0x53, 0x1A, 0x03, 0x00, 0x04,
> +               0x01, 0x4B, 0x0F, 0x00, 0x07, 0x04}},
> +       {150000, 0x00, 0x00,
> +               {0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04}},
> +       {0, 0x00, 0x00,
> +               {0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04,
> +               0x03, 0x43, 0x18, 0x03, 0x00, 0x04}}
> +};
> +
> +static void it61620_hdmi_setup_afe(struct it61620 *it61620, int clock)
> +{
> +       int i;
> +       unsigned int reg_ofset;
> +       const struct it61620_hdmi_afe_setting *afe;
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_AFE30, 0x1F, 0x07);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFEE9, 0x10);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFE33, 0x00);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFE34, 0xE4);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFE35, 0x00);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFEE9, 0x10);
> +
> +       for (i =3D 0; i < sizeof(hdmi_afe); i++) {
> +               if (clock > hdmi_afe[i].clock || hdmi_afe[i].clock =3D=3D=
 0)
> +                       break;
> +       }
> +
> +       afe =3D &hdmi_afe[i];
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFE0E, 0xF0);
> +
> +       if (clock > 100000)
> +               it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0x19, 0x=
08);
> +       else
> +               it61620_hdmi_reg_set(it61620, TX_REG_TXPLL_CTRL, 0x19, 0x=
11);
> +
> +       if (afe->h2on_pll) {
> +               it61620_hdmi_reg_write(it61620, TX_REG_AFE_XP, 0x48);
> +               it61620_hdmi_reg_set(it61620, TX_REG_AFE_XLC1, 0x87, 0x81=
);
> +               it61620_hdmi_reg_set(it61620, TX_REG_AFE_XLC2, 0x40, 0x00=
);
> +               it61620_hdmi_reg_write(it61620, TX_REG_AFE_XLC3, 0x32);
> +               it61620_hdmi_reg_set(it61620, TX_REG_XLC_7_CTRL, 0xFF, 0x=
B6);
> +       } else {
> +               it61620_hdmi_reg_write(it61620, TX_REG_AFE_XP, 0x00);
> +       }
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AFE_DRV, 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0x02, afe->hs);
> +
> +       for (i =3D 0, reg_ofset =3D 0x280; reg_ofset <=3D 0x297; reg_ofse=
t++)
> +               it61620_hdmi_reg_write(it61620, reg_ofset, afe->afe_val[i=
++]);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_INT_MASK3, B_TMDS_STB_CHG,
> +                            B_TMDS_STB_CHG);
> +}
> +
> +static inline void it61620_hdmi_fire_afe(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0xF1, 0xF1);
> +}
> +
> +static inline void it61620_hdmi_disable_afe(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_TXDRV_CTRL, 0xF1, 0x00);
> +}
> +
> +static int it61620_hdmi_hdcprd(struct it61620 *it61620, int offset, int =
bytenum)
> +{
> +       int ret =3D 0;
> +
> +       guard(mutex)(&it61620->ddc_lock);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND,
> +                              DDC_COMMAND_FIFO_CLR);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_ADDR, DDC_HDCP_ADDR);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_OFFSET, offset);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_L, bytenum);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_H, (bytenum & 0x30=
0) >> 8);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_B=
URST_R);
> +
> +       if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +               it61620_hdmi_ddc_abort(it61620);
> +               ret =3D -EIO;
> +               dev_dbg(it61620->dev, "ddc fail");
> +       }
> +       return ret;
> +}
> +
> +static int it61620_hdmi_hdcp_ksvlist_rd(struct it61620 *it61620,
> +                                       unsigned int bytenum, u8 *out)
> +{
> +       int ret =3D 0;
> +       unsigned int i;
> +       unsigned int count;
> +
> +       guard(mutex)(&it61620->ddc_lock);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_F=
IFO_CLR);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_ADDR, DDC_HDCP_ADDR);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_OFFSET, 0x43);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_L, bytenum);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_H, (bytenum & 0x30=
0) >> 8);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_B=
URST_R);
> +
> +       for (i =3D 0; i < bytenum;) {
> +               if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +                       it61620_hdmi_ddc_abort(it61620);
> +                       ret =3D -EIO;
> +                       dev_dbg(it61620->dev, "ddc fail");
> +                       break;
> +               }
> +
> +               count =3D it61620_hdmi_reg_read(it61620, TX_REG_DDC_FIFO_=
STS) &
> +                       M_DDC_STAGE_NUM;
> +               it61620_hdmi_get_ddc_fifo(it61620, (out + i), count);
> +               i +=3D count;
> +       }
> +
> +       return ret;
> +}
> +
> +static int it61620_hdmi_enable_hdcp(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       unsigned int sts, auth_cs;
> +
> +       sts =3D it61620_hdmi_reg_read(it61620, TX_REG_V_STS);
> +       if ((sts & B_TMDS_STABLE) !=3D B_TMDS_STABLE) {
> +               drm_dbg(drm, "TMDS not stable, stop hdcp %x", sts);
> +               return false;
> +       }
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL3, B_ENC_DIS, B_ENC=
_DIS);
> +       usleep_range(1000, 2000);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x10, 0x10);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x10, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_R0TM, 0xC0, 0x40);
> +       it61620_hdmi_reg_write(it61620, TX_REG_SHA_SEL, 0x00);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUTOMUTE, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2, B_AN_SEL, B_AN_S=
EL);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2, B_EN_AN_GEN,
> +                            B_EN_AN_GEN);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2, B_EN_AN_GEN, 0x0=
0);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL1, B_CPDESIRED,
> +                            B_CPDESIRED);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL3, (B_PAUSE | B_ENC=
_DIS),
> +                            0x00);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_HDCP_PRO, B_AUTH_FIRE);
> +
> +       /*
> +        * HDCP start requires 100ms for the first part of the authentica=
tion
> +        * protocol,20ms is used to wait for 61620 HW completion.
> +        */
> +       if (wait_event_timeout(it61620->wq, !it61620->hpd, msecs_to_jiffi=
es(120)))
> +               return false;
> +
> +       auth_cs =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_AUTH_CS) &=
 M_AUTH_CH;
> +       if (auth_cs =3D=3D CS_KSVLIST_CHK) {
> +               it61620_hdmi_hdcp_wait_ksv_list(it61620);
> +               usleep_range(1000, 2000);
> +               auth_cs =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_AU=
TH_CS) &
> +                                               M_AUTH_CH;
> +       }
> +
> +       if (auth_cs =3D=3D CS_AUTH_DONE) {
> +               it61620_hdmi_enable_avmute(it61620, false);
> +               it61620_hdmi_reg_set(it61620, TX_REG_INT1, B_INT_AUTH_F,
> +                                    B_INT_AUTH_F);
> +               it61620_hdmi_reg_set(it61620, TX_REG_INT_MASK1, B_INT_AUT=
H_F,
> +                                    B_INT_AUTH_F);
> +               drm_dbg(drm, "auth done");
> +               return true;
> +       }
> +
> +       drm_dbg(drm, "auth fail");
> +       it61620_hdmi_enable_avmute(it61620, true);
> +       return false;
> +}
> +
> +static void it61620_hdmi_reset_hdcp(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_INT_MASK1,
> +                            (B_INT_AUTH_D | B_INT_AUTH_F), 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_INT_MASK2, B_KSV_CHECK, 0x00=
);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL3, B_ENC_DIS, B_ENC=
_DIS);
> +       usleep_range(1000, 2000);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x18, 0x18);
> +       usleep_range(1000, 2000);
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x18, 0x00);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL1, B_CPDESIRED,
> +                            B_CPDESIRED);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL3,
> +                            (B_PAUSE | B_ENC_DIS), B_PAUSE);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUTOMUTE, 0x00);
> +}
> +
> +static bool it61620_hdmi_hdcp_is_ksv_valid(u8 *ksv)
> +{
> +       int i, ones =3D 0;
> +
> +       if ((ksv[4] =3D=3D 0x93 && ksv[3] =3D=3D 0x43 && ksv[2] =3D=3D 0x=
5C &&
> +            ksv[1] =3D=3D 0xDE && ksv[0] =3D=3D 0x23) ||
> +           (ksv[4] =3D=3D 0x7D && ksv[3] =3D=3D 0xB4 && ksv[2] =3D=3D 0x=
21 &&
> +            ksv[1] =3D=3D 0x37 && ksv[0] =3D=3D 0x0B))
> +               return false;
> +
> +       /* KSV has 20 1's and 20 0's */
> +       for (i =3D 0; i < 5; i++)
> +               ones +=3D hweight8(ksv[i]);
> +
> +       return ones =3D=3D 20;
> +}
> +
> +static void it61620_hdmi_disable_hdcp(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reset_hdcp(it61620);
> +}
> +
> +static int it61620_hdmi_start_hdcp(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       u8 rx_hdmi_mode;
> +       u8 bksv[DRM_HDCP_KSV_LEN];
> +       bool retcheck;
> +
> +       if (it61620_hdmi_hdcprd(it61620, DRM_HDCP_DDC_BSTATUS,
> +                               DRM_HDCP_BSTATUS_LEN) < 0) {
> +               drm_dbg(drm, "read bstatus fail!\n");
> +               return false;
> +       }
> +
> +       rx_hdmi_mode =3D (it61620_hdmi_reg_read(it61620, 0x7E) & 0x10) >>=
 4;
> +       if (it61620->is_hdmi !=3D rx_hdmi_mode)
> +               return false;
> +
> +       it61620_hdmi_hdcprd(it61620, DRM_HDCP_DDC_BKSV, DRM_HDCP_KSV_LEN)=
;
> +       bksv[0] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BKSV1);
> +       bksv[1] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BKSV2);
> +       bksv[2] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BKSV3);
> +       bksv[3] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BKSV4);
> +       bksv[4] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BKSV5);
> +       retcheck =3D it61620_hdmi_hdcp_is_ksv_valid(bksv);
> +       if (!retcheck) {
> +               drm_dbg(drm, "ksv valid!\n");
> +               return false;
> +       }
> +
> +       if (drm_hdcp_check_ksvs_revoked(drm, bksv, 1) > 0)
> +               return false;
> +
> +       return it61620_hdmi_enable_hdcp(it61620);
> +}
> +
> +static int it61620_hdmi_sha1_digest(struct it61620 *it61620, u8 *sha1_in=
put,
> +                                   unsigned int size, u8 *output_av)
> +{
> +       struct shash_desc *desc;
> +       struct crypto_shash *tfm;
> +       int err;
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       tfm =3D crypto_alloc_shash("sha1", 0, 0);
> +       if (IS_ERR(tfm)) {
> +               drm_dbg(drm, "crypto_alloc_shash sha1 failed");
> +               return PTR_ERR(tfm);
> +       }
> +       desc =3D kzalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_=
KERNEL);
> +       if (!desc) {
> +               crypto_free_shash(tfm);
> +               return -ENOMEM;
> +       }
> +
> +       desc->tfm =3D tfm;
> +       err =3D crypto_shash_digest(desc, sha1_input, size, output_av);
> +       if (err)
> +               drm_dbg(drm, "crypto_shash_digest sha1 failed");
> +
> +       crypto_free_shash(tfm);
> +       kfree(desc);
> +       return err;
> +}
> +
> +static int it61620_hdmi_setup_sha1_input(struct it61620 *it61620, u8 *in=
put)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       u8 bstatus[2];
> +       int down_stream_count, i, count =3D 0;
> +
> +       it61620_hdmi_hdcprd(it61620, DRM_HDCP_DDC_BSTATUS, DRM_HDCP_BSTAT=
US_LEN);
> +       bstatus[0] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BSTS_L)=
;
> +       bstatus[1] =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BSTS_H)=
;
> +
> +       down_stream_count =3D DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
> +       if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus[0]) ||
> +           DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus[1])) {
> +               it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL3,
> +                                    (B_PAUSE | B_ENC_DIS), B_PAUSE);
> +               return 0;
> +       }
> +
> +       if (!down_stream_count ||
> +           down_stream_count > MAX_HDCP_DOWN_STREAM_COUNT) {
> +               drm_dbg(drm, "HDCP down stream count Error %d",
> +                       down_stream_count);
> +               return 0;
> +       }
> +       drm_dbg(drm, "down stream count %d\n", down_stream_count);
> +
> +       count =3D down_stream_count * DRM_HDCP_KSV_LEN;
> +       it61620_hdmi_hdcp_ksvlist_rd(it61620, count, input);
> +       if (drm_hdcp_check_ksvs_revoked(drm, input, down_stream_count) > =
0)
> +               return 0;
> +
> +       input[count++] =3D bstatus[0];
> +       input[count++] =3D bstatus[1];
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_SHA_SEL, 0x70, 0x70);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2, B_EN_M0_RD, B_EN=
_M0_RD);
> +       for (i =3D 0; i < 8; i++)
> +               input[count++] =3D it61620_hdmi_reg_read(it61620,
> +                                                      (TX_REG_ANM0V1 + i=
));
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2, B_EN_M0_RD, 0x00=
);
> +
> +       return count;
> +}
> +
> +static bool it61620_hdmi_hdcp_part2_ksvlist_check(struct it61620 *it6162=
0)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       u8 av[5][4], bv[5][4];
> +       int i, j;
> +
> +       i =3D it61620_hdmi_setup_sha1_input(it61620, it61620->sha1_input)=
;
> +       if (i <=3D 0)
> +               return false;
> +
> +       it61620_hdmi_sha1_digest(it61620, it61620->sha1_input, i, (u8 *)a=
v);
> +
> +       for (i =3D 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
> +               it61620_hdmi_hdcprd(it61620, DRM_HDCP_DDC_V_PRIME(i),
> +                                   DRM_HDCP_V_PRIME_PART_LEN);
> +               it61620_hdmi_reg_set(it61620, TX_REG_HDCP_CTRL2,
> +                                    B_EN_M0_RD, B_EN_M0_RD);
> +               it61620_hdmi_reg_set(it61620, TX_REG_SHA_SEL, 0x70, (i <<=
 4));
> +
> +               for (j =3D 0; j < DRM_HDCP_V_PRIME_PART_LEN; j++)
> +                       bv[i][j] =3D it61620_hdmi_reg_read(it61620,
> +                                                        TX_REG_ANM0V1 + =
j);
> +       }
> +
> +       for (i =3D 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++)
> +               if (bv[i][3] !=3D av[i][0] || bv[i][2] !=3D av[i][1] ||
> +                   bv[i][1] !=3D av[i][2] || bv[i][0] !=3D av[i][3])
> +                       break;
> +
> +       if (i =3D=3D DRM_HDCP_V_PRIME_NUM_PARTS)
> +               return true;
> +
> +       drm_dbg(drm, "V' Not match!!");
> +       return false;
> +}
> +
> +static void it61620_hdmi_hdcp_wait_ksv_list(struct it61620 *it61620)
> +{
> +       u8 bcaps =3D 0;
> +       unsigned long timeout;
> +
> +       timeout =3D jiffies + msecs_to_jiffies(5000) + 1;
> +       for (;;) {
> +               usleep_range(1000, 2000);
> +               it61620_hdmi_hdcprd(it61620, DRM_HDCP_DDC_BCAPS, 1);
> +               bcaps =3D it61620_hdmi_reg_read(it61620, TX_REG_HDCP_BCAP=
S);
> +               if (bcaps & B_KSV_READY)
> +                       break;
> +
> +               if (it61620->hdcp_state !=3D CP_GOING)
> +                       break;
> +
> +               if (time_after(jiffies, timeout))
> +                       break;
> +       }
> +
> +       if ((bcaps & B_KSV_READY) &&
> +           it61620_hdmi_hdcp_part2_ksvlist_check(it61620)) {
> +               it61620_hdmi_reg_write(it61620, TX_REG_HDCP_PRO,
> +                                      B_LIST_CHK_DONE);
> +               return;
> +       }
> +       it61620_hdmi_reg_write(it61620, TX_REG_HDCP_PRO,
> +                              B_LIST_CHK_DONE | B_LIST_CHK_FAIL);
> +}
> +
> +static void it61620_remove_edid(struct it61620 *it61620)
> +{
> +       drm_edid_free(it61620->cached_edid);
> +       it61620->cached_edid =3D NULL;
> +}
> +
> +static void it61620_hdmi_irq_hdcp_auth_fail(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       if (it61620->hdcp_state =3D=3D CP_GOING) {
> +               it61620_hdmi_enable_avmute(it61620, true);
> +               drm_dbg(drm, "auth fail after done, set avmute");
> +               it61620_start_hdcp_work(it61620);
> +       }
> +}
> +
> +static void it61620_hdmi_irq_hpd(struct it61620 *it61620)
> +{
> +       it61620->hpd =3D it61620_hdmi_get_hpd_status(it61620);
> +
> +       if (!it61620->hpd) {
> +               wake_up(&it61620->wq);
> +               it61620_stop_hdcp_work(it61620);
> +               it61620_hdmi_disable_afe(it61620);
> +               it61620_remove_edid(it61620);
> +       } else if (it61620->video_state =3D=3D it61620_VIDEO_ON) {
> +               it61620_hdmi_fire_afe(it61620);
> +               it61620_start_hdcp_work(it61620);
> +       }
> +}
> +
> +static void it61620_hdmi_irq_rxsen_chg(struct it61620 *it61620)
> +{
> +       unsigned int rxsen;
> +
> +       if (!it61620_hdmi_get_hpd_status(it61620))
> +               return;
> +
> +       rxsen =3D it61620_hdmi_reg_read(it61620, TX_REG_V_STS) & B_RXSEN;
> +       if (it61620->video_state =3D=3D it61620_VIDEO_ON) {
> +               if (rxsen) {
> +                       it61620_hdmi_fire_afe(it61620);
> +                       it61620_start_hdcp_work(it61620);
> +               } else {
> +                       it61620_stop_hdcp_work(it61620);
> +                       it61620_hdmi_disable_afe(it61620);
> +               }
> +       }
> +}
> +
> +static void it61620_hdmi_irq_TMDS_stb_change(struct it61620 *it61620)
> +{
> +       unsigned int video_status;
> +
> +       video_status =3D it61620_hdmi_reg_read(it61620, TX_REG_V_STS);
> +
> +       if (video_status & B_TMDS_STABLE)
> +               it61620_start_hdcp_work(it61620);
> +}
> +
> +static bool it61620_test_bit(unsigned int bit, const unsigned int *addr)
> +{
> +       return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> +}
> +
> +static void it61620_hdmi_interrupt_handler(struct it61620 *it61620)
> +{
> +       unsigned int int_status[3], i;
> +       static const struct {
> +               int bit;
> +               void (*handler)(struct it61620 *it61620);
> +       } irq_vec[] =3D {
> +               { BIT_HPD_CHG, it61620_hdmi_irq_hpd },
> +               { BIT_RXSEN_CHANGE, it61620_hdmi_irq_rxsen_chg },
> +               { BIT_INT_AUTH_F, it61620_hdmi_irq_hdcp_auth_fail },
> +               { BIT_TMDS_STB_CHG, it61620_hdmi_irq_TMDS_stb_change },
> +       };
> +
> +       int_status[0] =3D it61620_hdmi_reg_read(it61620, TX_REG_INT1);
> +       int_status[1] =3D it61620_hdmi_reg_read(it61620, TX_REG_INT2);
> +       int_status[2] =3D it61620_hdmi_reg_read(it61620, TX_REG_INT3);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_INT1, int_status[0]);
> +       it61620_hdmi_reg_write(it61620, TX_REG_INT2, int_status[1]);
> +       it61620_hdmi_reg_write(it61620, TX_REG_INT3, int_status[2]);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(irq_vec); i++) {
> +               if (it61620_test_bit(irq_vec[i].bit, (unsigned int *)int_=
status))
> +                       irq_vec[i].handler(it61620);
> +       }
> +}
> +
> +static void it61620_hdmi_irq(struct it61620 *it61620)
> +{
> +       unsigned int reg_val;
> +
> +       reg_val =3D it61620_hdmi_reg_read(it61620, TX_REG_HDMITX_BANK);
> +       if (reg_val & B_INT_EVENT_HDMI)
> +               it61620_hdmi_interrupt_handler(it61620);
> +}
> +
> +static void it61620_hdmi_audio_set_ncts(struct it61620 *it61620,
> +                                       unsigned int sample_rate)
> +{
> +       unsigned int n, cts;
> +
> +       drm_hdmi_acr_get_n_cts(it61620->vm.pixelclock, sample_rate, &n, &=
cts);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_N_0, (u8)((n) & 0xF=
F));
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_N_1,
> +                              (u8)((n >> 8) & 0xFF));
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_N_2,
> +                              (u8)((n >> 16) & 0x0F));
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_CTS_0, (u8)((cts) &=
 0xFF));
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_CTS_1,
> +                              (u8)((cts >> 8) & 0xFF));
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDPKT_CTS_2,
> +                              (u8)((cts >> 16) & 0x0F));
> +}
> +
> +static inline void it61620_hdmi_disable_audio_infoframe(struct it61620 *=
it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT1,
> +                            (B_EN_AUD | B_EN_AUD_RP), 0x00);
> +}
> +
> +static inline void it61620_hdmi_enable_audio_infoframe(struct it61620 *i=
t61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT1, (B_EN_AUD | B_EN_AU=
D_RP),
> +                            (B_EN_AUD | B_EN_AUD_RP));
> +}
> +
> +static inline void it61620_hdmi_disable_avi_infoframe(struct it61620 *it=
61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT1,
> +                            (B_EN_AVI | B_AVI_RP), 0x00);
> +}
> +
> +static inline void it61620_hdmi_enable_avi_infoframe(struct it61620 *it6=
1620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT1, (B_EN_AVI | B_AVI_R=
P),
> +                            (B_EN_AVI | B_AVI_RP));
> +}
> +
> +static inline void it61620_hdmi_enable_hdmi_mode(struct it61620 *it61620=
)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDMI_CTRL1, B_EN_HDMI_MODE,
> +                            B_EN_HDMI_MODE);
> +}
> +
> +static inline void it61620_hdmi_enable_DVI_mode(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDMI_CTRL1, B_EN_HDMI_MODE, =
0x00);
> +}
> +
> +static inline void it61620_hdmi_enable_avmute(struct it61620 *it61620,
> +                                             bool enable)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDMI_CTRL2, B_EN_AVMUTE, ena=
ble);
> +}
> +
> +static void it61620_hdmi_avi_infoframe_set(struct it61620 *it61620,
> +                                          const u8 *buffer, size_t len)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +       const u8 *ptr;
> +       u8 i;
> +
> +       drm_dbg(drm, "avinfo set\n");
> +       it61620_hdmi_disable_avi_infoframe(it61620);
> +
> +       it61620_hdmi_enable_hdmi_mode(it61620);
> +       /* fill PB */
> +       ptr =3D buffer + HDMI_INFOFRAME_HEADER_SIZE;
> +       for (i =3D 0; i < len - HDMI_INFOFRAME_HEADER_SIZE; i++)
> +               it61620_hdmi_reg_write(it61620, TX_REG_AVIINFO_DB01 + i, =
ptr[i]);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AVIINFO_DB14, buffer[3]);
> +
> +       /* Enable */
> +       it61620_hdmi_enable_avi_infoframe(it61620);
> +}
> +
> +static void it61620_hdmi_config_output(struct it61620 *it61620)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       it61620_hdmi_reset(it61620);
> +       it61620_hdmi_poweron(it61620);
> +       it61620_hdmi_reg_set(it61620, TX_REG_HDMI_CTRL2, 0x70, 0x00);
> +       if (it61620->is_hdmi) {
> +               drm_dbg(drm, "HDMI\n");
> +               it61620_hdmi_enable_hdmi_mode(it61620);
> +               it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT2,
> +                                    (B_EN_GEN | B_GEN_RP),
> +                                    (B_EN_GEN | B_GEN_RP));
> +       } else {
> +               drm_dbg(drm, "DVI\n");
> +               it61620_hdmi_enable_DVI_mode(it61620);
> +               it61620_hdmi_reg_write(it61620, TX_REG_EN_PKT2, 0x00);
> +               it61620_hdmi_reg_write(it61620, TX_REG_EN_PKT1, 0x00);
> +       }
> +
> +       it61620_hdmi_enable_avmute(it61620, false);
> +       it61620_hdmi_setup_afe(it61620, it61620->vm.pixelclock / 1000);
> +       it61620_hdmi_fire_afe(it61620);
> +       it61620->video_state =3D it61620_VIDEO_ON;
> +}
> +
> +static int it61620_hdmi_audio_infoframe_set(struct it61620 *it61620,
> +                                           const u8 *buffer, size_t len)
> +{
> +       u8 i;
> +       const u8 *ptr;
> +
> +       it61620_hdmi_disable_audio_infoframe(it61620);
> +
> +       /* fill PB */
> +       ptr =3D buffer + HDMI_INFOFRAME_HEADER_SIZE;
> +       for (i =3D 0; i < len - HDMI_INFOFRAME_HEADER_SIZE; i++)
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB01 + i, =
ptr[i]);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB06, buffer[3]);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB07, 0x00);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB08, 0x00);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB09, 0x00);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB10, 0x00);
> +
> +       /* Enable */
> +       it61620_hdmi_enable_audio_infoframe(it61620);
> +       return 0;
> +}
> +
> +static void it61620_start_hdcp_work(struct it61620 *it61620)
> +{
> +       it61620->hdcp_state =3D CP_GOING;
> +       queue_delayed_work(system_wq, &it61620->hdcp_work,
> +                          msecs_to_jiffies(2400));
> +}
> +
> +static void it61620_stop_hdcp_work(struct it61620 *it61620)
> +{
> +       it61620->hdcp_state =3D CP_NONE;
> +       cancel_delayed_work_sync(&it61620->hdcp_work);
> +       it61620_hdmi_disable_hdcp(it61620);
> +}
> +
> +static void it61620_hw_reset(struct it61620 *it61620)
> +{
> +       struct it61620_platform_data *pdata =3D &it61620->pdata;
> +
> +       if (!pdata->gpiod_reset)
> +               return;
> +
> +       gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +
> +       usleep_range(10000, 20000);
> +       gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +       usleep_range(10000, 20000);
> +}
> +
> +static int it61620_enable_devices(struct it61620 *it61620)
> +{
> +       struct device *dev =3D &it61620->it61620_i2c->dev;
> +       unsigned int device_id[5];
> +       unsigned int i, vid, pid;
> +
> +       regmap_write(it61620->it61620_regmap, REG_CTRL_PW, 0x55);
> +       regmap_write(it61620->it61620_regmap, REG_CTRL_PW, 0xAA);
> +       regmap_write(it61620->it61620_regmap, REG_CTRL_PW, 0xC3);
> +       regmap_write(it61620->it61620_regmap, REG_CTRL_PW, 0xA5);
> +       usleep_range(1000, 2000);
> +
> +       for (i =3D 0; i < 5; i++)
> +               device_id[i] =3D it61620_mipi_reg_read(it61620,
> +                                                    REG_VENDER_ID_L + i)=
;
> +
> +       dev_dbg(dev, "IT61620 ver %02X", device_id[4]);
> +
> +       vid =3D (device_id[1] << 8) | device_id[0];
> +       pid =3D (device_id[3] << 8) | device_id[2];
> +
> +       if (vid !=3D it61620->chip_info->vid ||
> +           pid !=3D it61620->chip_info->pid) {
> +               dev_err(dev, "vid %X !=3D %X",
> +                       vid, it61620->chip_info->vid);
> +               dev_err(dev, "pid %X !=3D %X",
> +                       pid, it61620->chip_info->pid);
> +
> +               return -ENODEV;
> +       }
> +
> +       it61620->dev_ver =3D device_id[4];
> +       return 0;
> +}
> +
> +static void it61620_int_setup(struct it61620 *it61620)
> +{
> +       /* SET INT# to Active Low open-drain */
> +       it61620_mipi_reg_set(it61620, RX_REG_INT_POL, 0x08, 0x08);
> +       it61620_hdmi_reg_set(it61620, TX_REG_SYS_CONFIG, 0x0F, B_INT_MODE=
);
> +       it61620_hdmi_reg_set(it61620, REG_TX_INT_CTRL, B_DIS_INT_OUTPUT, =
0x00);
> +}
> +
> +static void it61620_int_enable(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_INT_MASK1, B_HPD_CHG, B_HPD_=
CHG);
> +}
> +
> +static int it61620_reset_init(struct it61620 *it61620)
> +{
> +       it61620_hw_reset(it61620);
> +
> +       if (it61620_enable_devices(it61620) < 0)
> +               return -ENODEV;
> +
> +       it61620_mipi_reset(it61620);
> +       it61620_hdmi_reset(it61620);
> +       it61620_int_setup(it61620);
> +       it61620_int_enable(it61620);
> +       it61620_hdmi_powerdown(it61620);
> +
> +       return 0;
> +}
> +
> +static int it61620_poweron(struct it61620 *it61620)
> +{
> +       struct it61620_platform_data *pdata =3D &it61620->pdata;
> +       struct drm_device *drm =3D it61620->drm;
> +       struct device *dev =3D it61620->dev;
> +       int err;
> +
> +       if (it61620->powered) {
> +               drm_dbg(drm, "Already powered on");
> +               return 0;
> +       }
> +
> +       err =3D regulator_enable(pdata->ivdd);
> +       if (err) {
> +               dev_err(dev, "Failed to enable IVDD: %d", err);
> +               goto poweron_exit;
> +       }
> +
> +       err =3D regulator_enable(pdata->ovdd1833);
> +       if (err) {
> +               dev_err(dev, "Failed to enable OVDD1833: %d", err);
> +               goto disable_ivdd;
> +       }
> +
> +       err =3D regulator_enable(pdata->ovdd33);
> +       if (err) {
> +               dev_err(dev, "Failed to enable OVDD33: %d", err);
> +               goto disable_ovdd1833;
> +       }
> +
> +       gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +       usleep_range(10000, 20000);
> +       gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +       usleep_range(10000, 20000);
> +
> +       err =3D it61620_reset_init(it61620);
> +       if (err < 0)
> +               goto disable_ovdd33;
> +
> +       it61620->powered =3D true;
> +       it61620->hpd =3D it61620_hdmi_get_hpd_status(it61620);
> +       if (it61620->it61620_i2c->irq) {
> +               enable_irq(it61620->it61620_i2c->irq);
> +               drm_dbg(drm, "enable irq %d\n",
> +                       it61620->it61620_i2c->irq);
> +       }
> +       drm_dbg(drm, "it61620 poweron end\n");
> +       return 0;
> +
> +disable_ovdd33:
> +       regulator_disable(pdata->ovdd33);
> +disable_ovdd1833:
> +       regulator_disable(pdata->ovdd1833);
> +disable_ivdd:
> +       regulator_disable(pdata->ivdd);
> +poweron_exit:
> +       return err;
> +}
> +
> +static int it61620_poweroff(struct it61620 *it61620)
> +{
> +       struct it61620_platform_data *pdata =3D &it61620->pdata;
> +       struct drm_device *drm =3D it61620->drm;
> +       struct device *dev =3D it61620->dev;
> +       int err;
> +
> +       if (!it61620->powered) {
> +               drm_dbg(drm, "Already powered off");
> +               return 0;
> +       }
> +
> +       if (it61620->it61620_i2c->irq) {
> +               disable_irq(it61620->it61620_i2c->irq);
> +               drm_dbg(drm, "disable irq %d\n",
> +                       it61620->it61620_i2c->irq);
> +       }
> +
> +       gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +
> +       err =3D regulator_disable(pdata->ovdd33);
> +       if (err)
> +               dev_err(dev, "Failed to disable ovdd33: %d", err);
> +
> +       err =3D regulator_disable(pdata->ivdd);
> +       if (err)
> +               dev_err(dev, "Failed to disable IVDD: %d", err);
> +
> +       usleep_range(2000, 3000);
> +
> +       err =3D regulator_disable(pdata->ovdd1833);
> +       if (err)
> +               dev_err(dev, "Failed to disable ovdd1833: %d", err);
> +
> +       it61620->powered =3D false;
> +       it61620->hpd =3D false;
> +       it61620->connector_status =3D connector_status_disconnected;
> +       it61620_remove_edid(it61620);
> +       drm_dbg(drm, "it61620 poweroff\n");
> +
> +       return 0;
> +}
> +
> +static void it61620_config_default(struct it61620 *it61620)
> +{
> +       struct it61620_mipirx *mipirx =3D &it61620->mipirx_config;
> +       struct it61620_audio *audio_config =3D &it61620->audio_config;
> +
> +       mipirx->lane_num =3D 4;
> +       mipirx->pn_swap =3D 0;
> +       mipirx->lane_swap =3D 0;
> +       it61620->connector_status =3D connector_status_disconnected;
> +
> +       audio_config->select =3D I2S;
> +       audio_config->sample_rate =3D SAMPLE_RATE_48K;
> +       audio_config->type =3D LPCM;
> +       audio_config->word_length =3D WORD_LENGTH_16BIT;
> +       audio_config->channel_count =3D 2;
> +       audio_config->audfmt =3D 0;
> +}
> +
> +static void it61620_show_drm_video_mode(struct it61620 *it61620,
> +                                       const struct videomode *vm)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       drm_dbg(drm, "HActive =3D %u\n", vm->hactive);
> +       drm_dbg(drm, "VActive =3D %u\n", vm->vactive);
> +       drm_dbg(drm, "HTotal =3D  %u\n",
> +               vm->hactive + vm->hfront_porch + vm->hsync_len +
> +               vm->hback_porch);
> +       drm_dbg(drm, "VTotal =3D  %u\n",
> +               vm->vactive + vm->vfront_porch + vm->vsync_len +
> +               vm->vback_porch);
> +       drm_dbg(drm, "PCLK =3D %lukhz\n", vm->pixelclock / 1000);
> +       drm_dbg(drm, "HFP =3D %u\n", vm->hfront_porch);
> +       drm_dbg(drm, "HSW =3D %u\n", vm->hsync_len);
> +       drm_dbg(drm, "HBP =3D %u\n", vm->hback_porch);
> +       drm_dbg(drm, "VFP =3D %u\n", vm->vfront_porch);
> +       drm_dbg(drm, "VSW =3D %u\n", vm->vsync_len);
> +       drm_dbg(drm, "VBP =3D %u\n", vm->vback_porch);
> +       if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +               drm_dbg(drm, "HPOL +\n");
> +       else
> +               drm_dbg(drm, "HPOL -\n");
> +
> +       if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +               drm_dbg(drm, "VPOL +\n");
> +       else
> +               drm_dbg(drm, "VPOL -\n");
> +
> +       if (vm->flags & DISPLAY_FLAGS_INTERLACED)
> +               drm_dbg(drm, "Intelaced\n");
> +       else
> +               drm_dbg(drm, "Progressive\n");
> +}
> +
> +static enum drm_mode_status it61620_mode_valid(struct it61620 *it61620,
> +                                              const struct drm_display_m=
ode *mode)
> +{
> +       if (mode->clock > 300000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static int it61620_get_edid_block(void *data, u8 *buf, unsigned int bloc=
k,
> +                                 size_t len)
> +{
> +       struct it61620 *it61620 =3D data;
> +       unsigned int edid_offset;
> +       unsigned int cnt;
> +       unsigned int i;
> +       int ret =3D 0;
> +
> +       if (len > EDID_LENGTH)
> +               return -EINVAL;
> +
> +       guard(mutex)(&it61620->ddc_lock);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_F=
IFO_CLR);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_ADDR, DDC_EDID_ADDR);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_SEGMENT, block / 2);
> +
> +       cnt =3D 0;
> +       edid_offset =3D block * 128;
> +
> +       for (i =3D 0; i < EDID_LENGTH; i +=3D EDID_R_BURST_NUM,
> +            edid_offset +=3D EDID_R_BURST_NUM,
> +            cnt +=3D EDID_R_BURST_NUM) {
> +               it61620_hdmi_reg_write(it61620, TX_REG_DDC_OFFSET, edid_o=
ffset);
> +               it61620_hdmi_reg_write(it61620, TX_REG_DDC_SEGMENT, block=
 >> 1);
> +               it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_L,
> +                                      EDID_R_BURST_NUM);
> +               it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_H,
> +                                      (EDID_R_BURST_NUM >> 8));
> +               it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND,
> +                                      DDC_COMMAND_EDID_RD);
> +
> +               if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +                       it61620_hdmi_ddc_abort(it61620);
> +                       ret =3D -EIO;
> +                       break;
> +               }
> +
> +               it61620_hdmi_get_ddc_fifo(it61620, &buf[cnt], EDID_R_BURS=
T_NUM);
> +       }
> +
> +       return ret;
> +}
> +
> +static void it61620_set_capability_from_edid_parse(struct it61620 *it616=
20,
> +                                                  const struct edid *edi=
d)
> +{
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       it61620->is_hdmi =3D drm_detect_hdmi_monitor(edid);
> +       it61620->en_audio =3D drm_detect_monitor_audio(edid);
> +
> +       drm_dbg(drm, "%s mode, monitor %ssupport audio",
> +               it61620->is_hdmi ? "HDMI" : "DVI",
> +               it61620->en_audio ? "" : "not ");
> +}
> +
> +static int it61620_ddc_xfer_write(struct it61620 *it61620,
> +                                 u8 *buf, unsigned int num)
> +{
> +       it61620_hdmi_set_ddc_fifo(it61620, buf, num);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_B=
URST_W);
> +       if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +               it61620_hdmi_ddc_abort(it61620);
> +               return -EIO;
> +       }
> +
> +       return num;
> +}
> +
> +static int it61620_ddc_xfer_read(struct it61620 *it61620, u8 *buf,
> +                                unsigned int num)
> +{
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_B=
URST_R);
> +       if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +               it61620_hdmi_ddc_abort(it61620);
> +               return -EIO;
> +       }
> +       it61620_hdmi_get_ddc_fifo(it61620, buf, num);
> +       return num;
> +}
> +
> +static int it61620_ddc_xfer(struct it61620 *it61620, struct i2c_msg *msg=
s)
> +{
> +       int ret;
> +
> +       if (msgs->len > DDC_FIFO_DEPTH)
> +               return -EINVAL;
> +
> +       guard(mutex)(&it61620->ddc_lock);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_F=
IFO_CLR);
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_ADDR, msgs->addr << 1)=
;
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_OFFSET, 0);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_L, msgs->len);
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_H, (msgs->len >> 8=
));
> +       it61620_hdmi_reg_write(it61620, TX_REG_DDC_SEGMENT, 0);
> +
> +       if ((msgs->flags & I2C_M_RD) =3D=3D 0)
> +               ret =3D it61620_ddc_xfer_write(it61620, msgs->buf, msgs->=
len);
> +       else
> +               ret =3D it61620_ddc_xfer_read(it61620, msgs->buf, msgs->l=
en);
> +
> +       return ret;
> +}
> +
> +static void it61620_enable_audio(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x01, 0x00);
> +}
> +
> +static void it61620_disable_audio(struct it61620 *it61620)
> +{
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x01, 0x01);
> +       it61620_hdmi_reg_set(it61620, TX_REG_LINK_CTRL0,
> +                            B_EN_AUDIO_MUTE, B_EN_AUDIO_MUTE);
> +}
> +
> +static void it61620_config_audio(struct it61620 *it61620)
> +{
> +       struct it61620_audio *config =3D &it61620->audio_config;
> +       struct drm_device *drm =3D it61620->drm;
> +       u8 audsrc;
> +
> +       drm_dbg(drm, "sample rate %d", config->sample_rate);
> +       drm_dbg(drm, "sample width %d", config->sample_width);
> +       drm_dbg(drm, "fmt %d", config->select);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_AUD_FMT, 0x7F,
> +                            (config->word_length << 5) | config->audfmt)=
;
> +       if (config->select =3D=3D SPDIF) {
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO1, 0x00);
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO2, 0x00);
> +               it61620_hdmi_reg_set(it61620, TX_REG_AUD_SPDIF, 0x0F, 0x0=
2);
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_CTRL, 0X01);
> +       } else {
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO1, 0x10);
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO2, 0x32);
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_CTRL, 0X00);
> +       }
> +
> +       if (config->type =3D=3D LPCM)
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS1, 0x00);
> +       else
> +               it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS1, B_EN_AUD=
_NLPCM);
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS2, (config->sample_=
rate));
> +       it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS3,
> +                              ((~(config->sample_rate << 4)) & 0xF0) + 0=
x0B);
> +
> +       switch (config->channel_count) {
> +       case 2:
> +               audsrc =3D 0x01;
> +               break;
> +       case 3:
> +               audsrc =3D 0x03;
> +               break;
> +       case 4:
> +               audsrc =3D 0x03;
> +               break;
> +       case 5:
> +               audsrc =3D 0x07;
> +               break;
> +       case 6:
> +               audsrc =3D 0x07;
> +               break;
> +       case 7:
> +               audsrc =3D 0x0f;
> +               break;
> +       case 8:
> +               audsrc =3D 0x0f;
> +               break;
> +       default:
> +               drm_dbg(drm,
> +                       "Error: Audio Channel Number Error !!!\n");
> +               audsrc =3D 0x01;
> +               break;
> +       }
> +
> +       it61620_hdmi_reg_write(it61620, TX_REG_EN_AUDIO, audsrc);
> +
> +       it61620_hdmi_reg_set(it61620, TX_REG_LINK_CTRL0, B_EN_AUDIO_MUTE,=
 0x00);
> +       it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x01, 0x00);
> +}
> +
> +static irqreturn_t it61620_int_threaded_handler(int unused, void *data)
> +{
> +       struct it61620 *it61620 =3D data;
> +       struct device *dev =3D it61620->dev;
> +
> +       pm_runtime_get_sync(dev);
> +
> +       it61620_mipi_irq_handler(it61620);
> +       it61620_hdmi_irq(it61620);
> +
> +       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_put_autosuspend(dev);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int it61620_audio_update_hw_params(struct it61620 *it61620,
> +                                         struct hdmi_codec_daifmt *fmt,
> +                                         struct hdmi_codec_params *hparm=
s)
> +{
> +       struct it61620_audio *config =3D &it61620->audio_config;
> +
> +       memcpy(config->channel_status, &hparms->iec.status[0],
> +              AES_IEC958_STATUS_SIZE);
> +
> +       config->channel_number =3D hparms->channels;
> +
> +       switch (hparms->sample_rate) {
> +       case 32000:
> +               config->sample_rate =3D SAMPLE_RATE_32K;
> +               break;
> +       case 44100:
> +               config->sample_rate =3D SAMPLE_RATE_44_1K;
> +               break;
> +       case 48000:
> +               config->sample_rate =3D SAMPLE_RATE_48K;
> +               break;
> +       case 88200:
> +               config->sample_rate =3D SAMPLE_RATE_88_2K;
> +               break;
> +       case 96000:
> +               config->sample_rate =3D SAMPLE_RATE_96K;
> +               break;
> +       case 176400:
> +               config->sample_rate =3D SAMPLE_RATE_176_4K;
> +               break;
> +       case 192000:
> +               config->sample_rate =3D SAMPLE_RATE_192K;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       switch (hparms->sample_width) {
> +       case 16:
> +               config->sample_width =3D WORD_LENGTH_16BIT;
> +               break;
> +       case 24:
> +               config->sample_width =3D WORD_LENGTH_18BIT;
> +               break;
> +       case 18:
> +               config->sample_width =3D WORD_LENGTH_20BIT;
> +               break;
> +       case 20:
> +               config->sample_width =3D WORD_LENGTH_24BIT;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       switch (fmt->fmt) {
> +       case HDMI_I2S:
> +               config->select =3D I2S;
> +               break;
> +       case HDMI_SPDIF:
> +               config->select =3D SPDIF;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       it61620_hdmi_audio_set_ncts(it61620, hparms->sample_rate);
> +       it61620_config_audio(it61620);
> +       return 0;
> +}
> +
> +static void it61620_hdcp_work(struct work_struct *work)
> +{
> +       struct it61620 *it61620 =3D container_of(work, struct it61620,
> +                                              hdcp_work.work);
> +       it61620_hdmi_reset_hdcp(it61620);
> +       if (!it61620_hdmi_start_hdcp(it61620) &&
> +           it61620->hdcp_state =3D=3D CP_GOING) {
> +               it61620_hdmi_disable_hdcp(it61620);
> +               it61620_start_hdcp_work(it61620);
> +       }
> +}
> +
> +static int it61620_hdmi_i2c_xfer(struct i2c_adapter *adap,
> +                                struct i2c_msg *msgs, int num)
> +{
> +       struct it61620 *it61620 =3D i2c_get_adapdata(adap);
> +       struct device *dev =3D it61620->dev;
> +       int i, j;
> +
> +       for (i =3D 0 ; i < num ; i++) {
> +               dev_dbg(dev,
> +                       " msg [%d] addr =3D %X, flag =3D %X, len =3D %d\n=
",
> +                       i, msgs[i].addr, msgs[i].flags, msgs[i].len);
> +
> +               if ((msgs[i].flags & I2C_M_RD) =3D=3D 0)
> +                       for (j =3D 0 ; j < msgs[i].len ; j++)
> +                               dev_dbg(dev,
> +                                       "buf[%d] =3D %x\n", j, msgs[i].bu=
f[j]);
> +
> +               num =3D it61620_ddc_xfer(it61620, &msgs[i]);
> +       }
> +
> +       return num;
> +}
> +
> +static u32 it61620_hdmi_i2c_func(struct i2c_adapter *adapter)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm hdmi_ddc_algorithm =3D {
> +       .master_xfer    =3D it61620_hdmi_i2c_xfer,
> +       .functionality  =3D it61620_hdmi_i2c_func,
> +};
> +
> +static struct i2c_adapter *it61620_add_ddc_i2c_adapter(struct it61620 *i=
t61620)
> +{
> +       struct i2c_adapter *adap =3D &it61620->ddc;
> +       struct device *dev =3D it61620->dev;
> +       int ret;
> +
> +       adap->owner =3D THIS_MODULE;
> +       adap->dev.parent =3D dev;
> +       adap->algo =3D &hdmi_ddc_algorithm;
> +       strscpy(adap->name, "ITE 61620 HDMI", sizeof(adap->name));
> +       i2c_set_adapdata(adap, it61620);
> +
> +       ret =3D i2c_add_adapter(adap);
> +       if (ret) {
> +               dev_err(dev,
> +                       "cannot add %s I2C adapter\n", adap->name);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return 0;
> +}
> +
> +static int it61620_i2c_and_regmap_init(struct i2c_client *client,
> +                                      struct it61620 *it61620)
> +{
> +       struct device *dev =3D it61620->dev;
> +
> +       it61620->it61620_i2c =3D client;
> +
> +       it61620->tx_i2c =3D devm_i2c_new_dummy_device(dev,
> +                                                   client->adapter,
> +                                                   TX_I2C_ADDRESS);
> +       if (IS_ERR(it61620->tx_i2c))
> +               return dev_err_probe(dev, PTR_ERR(it61620->tx_i2c),
> +                                    "failed to create TX dummy i2c devic=
e at 0x%02x\n",
> +                                    TX_I2C_ADDRESS);
> +
> +       it61620->mipirx_i2c =3D devm_i2c_new_dummy_device(dev,
> +                                                       client->adapter,
> +                                                       MIPIRX_I2C_ADDRES=
S);
> +       if (IS_ERR(it61620->mipirx_i2c))
> +               return dev_err_probe(dev, PTR_ERR(it61620->mipirx_i2c),
> +                                    "failed to create MIPI dummy i2c dev=
ice at 0x%02x\n",
> +                                    MIPIRX_I2C_ADDRESS);
> +
> +       it61620->it61620_regmap =3D devm_regmap_init_i2c(it61620->it61620=
_i2c,
> +                                                      &it61620_regmap_co=
nfig);
> +       if (IS_ERR(it61620->it61620_regmap))
> +               return dev_err_probe(dev, PTR_ERR(it61620->it61620_regmap=
),
> +                                    "failed to init I2C regmap for it616=
20\n");
> +
> +       it61620->tx_regmap =3D devm_regmap_init_i2c(it61620->tx_i2c,
> +                                                 &it61620_tx_regmap_conf=
ig);
> +       if (IS_ERR(it61620->tx_regmap))
> +               return dev_err_probe(dev, PTR_ERR(it61620->tx_regmap),
> +                                    "failed to init I2C regmap for TX\n"=
);
> +
> +       it61620->mipirx_regmap =3D devm_regmap_init_i2c(it61620->mipirx_i=
2c,
> +                                                     &it61620_mipi_regma=
p_config);
> +       if (IS_ERR(it61620->mipirx_regmap))
> +               return dev_err_probe(dev, PTR_ERR(it61620->mipirx_regmap)=
,
> +                                    "failed to init I2C regmap for MIPI\=
n");
> +       return 0;
> +}
> +
> +static int it61620_of_get_dsi_host(struct it61620 *it61620,
> +                                  struct mipi_dsi_host **host)
> +{
> +       struct device *dev =3D it61620->dev;
> +       struct device_node *dsi_node;
> +       struct device_node *host_node;
> +
> +       dsi_node =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +
> +       if (!dsi_node)
> +               return dev_err_probe(dev, -ENODEV, "DSI NO endpoint at DT=
\n");
> +
> +       host_node =3D of_graph_get_remote_port_parent(dsi_node);
> +       of_node_put(dsi_node);
> +
> +       if (!host_node)
> +               return dev_err_probe(dev, -ENODEV, "DSI NO host node at D=
T\n");
> +
> +       *host =3D of_find_mipi_dsi_host_by_node(host_node);
> +       of_node_put(host_node);
> +
> +       if (*host)
> +               return 0;
> +
> +       return dev_err_probe(dev, -EPROBE_DEFER, "failed to find dsi host=
\n");
> +}
> +
> +static int it61620_attach_dsi(struct it61620 *it61620,
> +                             struct mipi_dsi_host *host)
> +{
> +       struct device *dev =3D it61620->dev;
> +       struct mipi_dsi_device *dsi;
> +       const struct mipi_dsi_device_info info =3D {"it61620",
> +                                                 0,
> +                                                 dev->of_node};
> +
> +       dsi =3D devm_mipi_dsi_device_register_full(dev, host, &info);
> +       if (IS_ERR(dsi))
> +               return dev_err_probe(dev, PTR_ERR(dsi), "failed to create=
 dsi device\n");
> +
> +       it61620->dsi =3D dsi;
> +       dsi->lanes =3D 4;
> +       dsi->format =3D MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> +                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +       return devm_mipi_dsi_attach(dev, dsi);
> +}
> +
> +static void it61620_detach_dsi(struct it61620 *it61620)
> +{
> +       if (!it61620->dsi)
> +               return;
> +
> +       mipi_dsi_detach(it61620->dsi);
> +}
> +
> +static unsigned int it61620_parse_dt(struct it61620 *it61620)
> +{
> +       struct device *dev =3D it61620->dev;
> +       struct device_node *np =3D it61620->dev->of_node;
> +       u32 num_lanes =3D 0;
> +
> +       if (!dev->of_node)
> +               return -EINVAL;
> +
> +       if (of_property_read_u32(np, "dsi-lanes", &num_lanes))
> +               dev_dbg(dev,
> +                       "cannot read dsi-lanes reg property\n");
> +       else
> +               it61620->mipirx_config.lane_num =3D num_lanes;
> +
> +       dev_dbg(dev, "num_lanes =3D %x\n", num_lanes);
> +
> +       it61620->next_bridge =3D devm_drm_of_get_bridge(dev, np, 1, -1);
> +       if (IS_ERR(it61620->next_bridge))
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "failed to get next bridge\n");
> +
> +       return 0;
> +}
> +
> +static int it61620_init_pdata(struct it61620 *it61620)
> +{
> +       struct it61620_platform_data *pdata =3D &it61620->pdata;
> +       struct device *dev =3D it61620->dev;
> +
> +       pdata->gpiod_reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIG=
H);
> +       if (IS_ERR(pdata->gpiod_reset))
> +               return dev_err_probe(dev, PTR_ERR(pdata->gpiod_reset),
> +                                    "gpiod_reset not found\n");
> +
> +       pdata->ivdd =3D devm_regulator_get(dev, "ivdd");
> +       if (IS_ERR(pdata->ivdd))
> +               return dev_err_probe(dev, PTR_ERR(pdata->ivdd),
> +                                    "ivdd regulator not found\n");
> +
> +       pdata->ovdd1833 =3D devm_regulator_get(dev, "ovdd1833");
> +       if (IS_ERR(pdata->ovdd1833))
> +               return dev_err_probe(dev, PTR_ERR(pdata->ovdd1833),
> +                                    "ovdd1833 regulator not found\n");
> +
> +       pdata->ovdd33 =3D devm_regulator_get(dev, "ovdd");
> +       if (IS_ERR(pdata->ovdd33))
> +               return dev_err_probe(dev, PTR_ERR(pdata->ovdd33),
> +                                    "ovdd33 regulator not found\n");
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused it61620_pm_bridge_suspend(struct device *dev)
> +{
> +       struct it61620 *it61620 =3D dev_get_drvdata(dev);
> +
> +       it61620_poweroff(it61620);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused it61620_pm_bridge_resume(struct device *dev)
> +{
> +       struct it61620 *it61620 =3D dev_get_drvdata(dev);
> +
> +       return it61620_poweron(it61620);
> +}
> +
> +static const struct dev_pm_ops it61620_bridge_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +       SET_RUNTIME_PM_OPS(it61620_pm_bridge_suspend,
> +                          it61620_pm_bridge_resume, NULL)
> +};
> +
> +static int it61620_bridge_attach(struct drm_bridge *bridge,
> +                                struct drm_encoder *encoder,
> +                                enum drm_bridge_attach_flags flags)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct drm_device *drm =3D bridge->dev;
> +       int ret;
> +
> +       it61620->drm =3D drm;
> +
> +       if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> +               drm_err(drm,
> +                       "it61620 driver only copes with atomic updates\n"=
);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       ret =3D drm_bridge_attach(bridge->encoder, it61620->next_bridge,
> +                               bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               drm_dbg(drm,
> +                       "DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied"=
);
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static void it61620_bridge_detach(struct drm_bridge *bridge)
> +{
> +}
> +
> +static enum drm_mode_status it61620_bridge_mode_valid(struct drm_bridge =
*bridge,
> +                                                     const struct drm_di=
splay_info *info,
> +                                                     const struct drm_di=
splay_mode *mode)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       return it61620_mode_valid(it61620, mode);
> +}
> +
> +static void it61620_bridge_hpd_notify(struct drm_bridge *bridge,
> +                                     enum drm_connector_status status)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct drm_device *drm =3D it61620->drm;
> +       struct device *dev =3D it61620->dev;
> +       int hpd, ret;
> +
> +       hpd =3D (status =3D=3D connector_status_connected) ? 1 : 0;
> +
> +       if (it61620->connector_status !=3D status) {
> +               drm_dbg(drm, "GPIO hpd status change %d->%d",
> +                       !hpd, hpd);
> +
> +               it61620->connector_status =3D status;
> +               if (hpd) {
> +                       drm_dbg(drm, "HPD_GPIO get to wake up");
> +                       ret =3D pm_runtime_get_sync(dev);
> +                       if (ret < 0)
> +                               dev_err(dev,
> +                                       "pm_runtime_get_sync error %d", r=
et);
> +               } else {
> +                       drm_dbg(drm, "HPD_GPIO put to sleep");
> +                       pm_runtime_mark_last_busy(dev);
> +                       pm_runtime_put_autosuspend(dev);
> +               }
> +
> +       } else {
> +               drm_dbg(drm, "GPIO hpd status NO change %d", hpd);
> +       }
> +}
> +
> +static void it61620_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +                                            struct drm_atomic_state *sta=
te)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct device *dev =3D it61620->dev;
> +
> +       pm_runtime_get_sync(dev);
> +}
> +
> +static void it61620_bridge_atomic_enable(struct drm_bridge *bridge,
> +                                        struct drm_atomic_state *state)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_connector_state *conn_state;
> +       struct drm_display_mode *mode;
> +       struct drm_connector *connector;
> +
> +       connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +                                                            bridge->enco=
der);
> +
> +       if (!connector)
> +               return;
> +       it61620->connector =3D *connector;
> +
> +       conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> +       if (WARN_ON(!conn_state))
> +               return;
> +
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> +       if (WARN_ON(!crtc_state))
> +               return;
> +
> +       mode =3D &crtc_state->adjusted_mode;
> +       if (WARN_ON(!mode))
> +               return;
> +
> +       drm_atomic_helper_connector_hdmi_update_infoframes(connector, sta=
te);
> +       it61620_mipi_set_d2v_video_timing(it61620);
> +       it61620_hdmi_config_output(it61620);
> +}
> +
> +static void it61620_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                         struct drm_atomic_state *state)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       if (it61620->powered) {
> +               it61620_stop_hdcp_work(it61620);
> +               it61620_hdmi_disable_afe(it61620);
> +               it61620_hdmi_powerdown(it61620);
> +               it61620->video_state =3D it61620_VIDEO_OFF;
> +       }
> +}
> +
> +static void it61620_bridge_atomic_post_disable(struct drm_bridge *bridge=
,
> +                                              struct drm_atomic_state *s=
tate)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct device *dev =3D it61620->dev;
> +
> +       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_put_autosuspend(dev);
> +}
> +
> +static const struct drm_edid *it61620_bridge_edid_read(struct drm_bridge=
 *bridge,
> +                                                      struct drm_connect=
or *connector)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct device *dev =3D it61620->dev;
> +
> +       if (!it61620->cached_edid) {
> +               it61620->cached_edid =3D drm_edid_read_custom(connector,
> +                                                           it61620_get_e=
did_block,
> +                                                           it61620);
> +
> +               if (!it61620->cached_edid) {
> +                       dev_err(dev, "failed to get edid!");
> +                       return NULL;
> +               }
> +               it61620_set_capability_from_edid_parse(it61620,
> +                                                      drm_edid_raw(it616=
20->cached_edid));
> +       }
> +       return drm_edid_dup(it61620->cached_edid);
> +}
> +
> +static void it61620_bridge_mode_set(struct drm_bridge *bridge,
> +                                   const struct drm_display_mode *mode,
> +                                   const struct drm_display_mode *adj)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       drm_display_mode_to_videomode(adj, &it61620->vm);
> +}
> +
> +static int it61620_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge=
,
> +                                              enum hdmi_infoframe_type t=
ype)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       switch (type) {
> +       case HDMI_INFOFRAME_TYPE_AVI:
> +               it61620_hdmi_disable_avi_infoframe(it61620);
> +               break;
> +       case HDMI_INFOFRAME_TYPE_AUDIO:
> +               it61620_hdmi_disable_audio_infoframe(it61620);
> +               break;
> +       default:
> +               drm_err(drm, "Error: hdmi infoframe_type %x!!!\n", type);
> +       }
> +       return 0;
> +}
> +
> +static int it61620_bridge_hdmi_write_infoframe(struct drm_bridge *bridge=
,
> +                                              enum hdmi_infoframe_type t=
ype,
> +                                              const u8 *buffer, size_t l=
en)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +       struct drm_device *drm =3D it61620->drm;
> +
> +       switch (type) {
> +       case HDMI_INFOFRAME_TYPE_AVI:
> +               it61620_hdmi_avi_infoframe_set(it61620, buffer, len);
> +               break;
> +       case HDMI_INFOFRAME_TYPE_AUDIO:
> +               it61620_hdmi_audio_infoframe_set(it61620, buffer, len);
> +               break;
> +       default:
> +               drm_err(drm, "Error: hdmi infoframe_type %x!!!\n", type);
> +       }
> +       return 0;
> +}
> +
> +static int it61620_bridge_hdmi_audio_startup(struct drm_connector *conne=
ctor,
> +                                            struct drm_bridge *bridge)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       it61620_enable_audio(it61620);
> +       return 0;
> +}
> +
> +static int it61620_bridge_hdmi_audio_prepare(struct drm_connector *conne=
ctor,
> +                                            struct drm_bridge *bridge,
> +                                            struct hdmi_codec_daifmt *fm=
t,
> +                                            struct hdmi_codec_params *hp=
arms)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       switch (hparms->sample_rate) {
> +       case 32000:
> +       case 44100:
> +       case 48000:
> +       case 88200:
> +       case 96000:
> +       case 176400:
> +       case 192000:
> +       case 768000:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       switch (hparms->sample_width) {
> +       case 16:
> +       case 24:
> +       case 18:
> +       case 20:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       switch (fmt->fmt) {
> +       case HDMI_I2S:
> +       case HDMI_SPDIF:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       it61620_audio_update_hw_params(it61620, fmt, hparms);
> +
> +       return drm_atomic_helper_connector_hdmi_update_audio_infoframe(co=
nnector,
> +                                                                      &h=
parms->cea);
> +}
> +
> +static void it61620_bridge_hdmi_audio_shutdown(struct drm_connector *con=
nector,
> +                                              struct drm_bridge *bridge)
> +{
> +       struct it61620 *it61620 =3D bridge_to_it61620(bridge);
> +
> +       it61620_disable_audio(it61620);
> +}
> +
> +static const struct drm_bridge_funcs it61620_bridge_funcs =3D {
> +       .attach =3D it61620_bridge_attach,
> +       .detach =3D it61620_bridge_detach,
> +       .mode_valid =3D it61620_bridge_mode_valid,
> +       .hpd_notify =3D it61620_bridge_hpd_notify,
> +
> +       .atomic_pre_enable =3D it61620_bridge_atomic_pre_enable,
> +       .atomic_enable =3D it61620_bridge_atomic_enable,
> +       .atomic_disable =3D it61620_bridge_atomic_disable,
> +       .atomic_post_disable =3D it61620_bridge_atomic_post_disable,
> +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> +       .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> +
> +       .edid_read =3D it61620_bridge_edid_read,
> +       .mode_set =3D it61620_bridge_mode_set,
> +
> +       .hdmi_clear_infoframe =3D it61620_bridge_hdmi_clear_infoframe,
> +       .hdmi_write_infoframe =3D it61620_bridge_hdmi_write_infoframe,
> +       .hdmi_audio_startup =3D it61620_bridge_hdmi_audio_startup,
> +       .hdmi_audio_prepare =3D it61620_bridge_hdmi_audio_prepare,
> +       .hdmi_audio_shutdown =3D it61620_bridge_hdmi_audio_shutdown,
> +};
> +
> +static int it61620_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct mipi_dsi_host *host;
> +       struct it61620 *it61620;
> +       int ret =3D 0;
> +
> +       it61620 =3D devm_drm_bridge_alloc(dev, struct it61620, bridge,
> +                                       &it61620_bridge_funcs);
> +       if (IS_ERR(it61620))
> +               return PTR_ERR(it61620);
> +
> +       it61620->dev =3D dev;
> +       it61620->chip_info =3D of_device_get_match_data(dev);
> +
> +       ret =3D it61620_of_get_dsi_host(it61620, &host);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D it61620_i2c_and_regmap_init(client, it61620);
> +       if (ret < 0)
> +               return ret;
> +
> +       i2c_set_clientdata(client, it61620);
> +
> +       ret =3D it61620_init_pdata(it61620);
> +       if (ret < 0)
> +               return ret;
> +
> +       it61620_config_default(it61620);
> +       it61620_parse_dt(it61620);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!client->irq)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to get INTP IRQ\n");
> +
> +       ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL=
,
> +                                       it61620_int_threaded_handler,
> +                                       IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> +                                       IRQF_NO_AUTOEN,
> +                                       "it61620-intp", it61620);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to request INTP threaded IRQ=
\n");
> +
> +       INIT_DELAYED_WORK(&it61620->hdcp_work, it61620_hdcp_work);
> +       init_waitqueue_head(&it61620->wq);
> +
> +       mutex_init(&it61620->ddc_lock);
> +
> +       it61620_add_ddc_i2c_adapter(it61620);
> +
> +       pm_runtime_enable(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 1000);
> +       pm_runtime_use_autosuspend(dev);
> +
> +       it61620->bridge.funcs =3D &it61620_bridge_funcs;
> +       it61620->bridge.of_node =3D np;
> +       it61620->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_MODES =
|
> +                             DRM_BRIDGE_OP_HDMI |
> +                             DRM_BRIDGE_OP_HDMI_AUDIO;
> +       it61620->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> +       it61620->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
> +       it61620->bridge.hdmi_audio_spdif_playback =3D false;
> +       it61620->bridge.vendor =3D "ITE";
> +       it61620->bridge.product =3D "IT61620";
> +
> +       ret =3D devm_drm_bridge_add(dev, &it61620->bridge);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to add drm bridge\n");
> +
> +       ret =3D it61620_attach_dsi(it61620, host);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to attach to DSI host\n");
> +
> +       return 0;
> +}
> +
> +static void it61620_remove(struct i2c_client *client)
> +{
> +       struct it61620 *it61620 =3D i2c_get_clientdata(client);
> +       struct device *dev =3D it61620->dev;
> +
> +       disable_irq(client->irq);
> +       pm_runtime_disable(dev);
> +       it61620_remove_edid(it61620);
> +       it61620_detach_dsi(it61620);
> +
> +       mutex_destroy(&it61620->ddc_lock);
> +}
> +
> +static const struct it6162_chip_info it61620_chip_info =3D {
> +       .vid =3D 0x4954,
> +       .pid =3D 0x6152,
> +};
> +
> +static const struct of_device_id it61620_dt_ids[] =3D {
> +       { .compatible =3D "ite,it61620", .data =3D &it61620_chip_info},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, it61620_dt_ids);
> +
> +static const struct i2c_device_id it61620_i2c_ids[] =3D {
> +       { "it61620", 0 },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(i2c, it61620_i2c_ids);
> +
> +static struct i2c_driver it61620_driver =3D {
> +       .driver =3D {
> +               .name =3D "it61620",
> +               .of_match_table =3D it61620_dt_ids,
> +               .pm =3D &it61620_bridge_pm_ops,
> +       },
> +       .probe =3D it61620_probe,
> +       .remove =3D it61620_remove,
> +       .id_table =3D it61620_i2c_ids,
> +};
> +
> +module_i2c_driver(it61620_driver);
> +
> +MODULE_AUTHOR("Pet Weng <pet.weng@ite.com.tw>");
> +MODULE_AUTHOR("Hermes Wu <Hermes.Wu@ite.com.tw>");
> +MODULE_DESCRIPTION("it61620 mipi to hdmi driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

Regards,
Pin-yen
