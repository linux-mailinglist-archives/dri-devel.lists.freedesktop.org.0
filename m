Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A419CA3D017
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2FC10E4A1;
	Thu, 20 Feb 2025 03:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XevVdhE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45C10E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:30:46 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-546202d633dso514038e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740022244; x=1740627044; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bUSrNsjDJYdyM6AKglcHDmHx5/AMY5Ly00Eugk395FQ=;
 b=XevVdhE8YdnELpSfOiQOkX5PLghJzeHLrXBd8eegpERvTkM9esFtFT0uZGaYyp0INu
 6Z8qIUoSSTQ2c9JJaZiR8gnVyJBBvdLlHEa1x21ykPzLBnW/Uo85Xjyo9+y/F46kMBxF
 6N4T5xU3Laug0fgdGX4y0fgNJt5fADY+xJIYcayM3qwdV6c0mVw34S0dqnffIks/L03d
 EYIec9hpSrKPv+R2Qgwl/Oo32zwI/nhqeXJOw44cjv3wM3kZB8Wb7heHzM/t3MARkI+s
 N58c3xYr01DpW4kshFgHk+aWQRkc9rw50PgAcINFz93apI+UNDU89AjbNC65fHY7CA4+
 gA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740022244; x=1740627044;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bUSrNsjDJYdyM6AKglcHDmHx5/AMY5Ly00Eugk395FQ=;
 b=r2YsylSIRBsTGhr1WQ5HplhPrYtqK2N+pjAC9gyB3blmix6M91bb+cIPH115AdaRNp
 yqtX7s+PyhYB3VoLs6yaH5q3hizsk/H1D6CAhKNjsXgf4vUzB22aX1i2VTGKmCgd0liV
 w7+A/qjUrYTr/K/8bZSelDziFQPuJq0n1syqINi9ogUmiRDvPoIlpNVP/S9+SouaE6B0
 pqZQRb7O4tw9KK/DOd83Zd27KXSVUQxf5TPLq6jtG1qhkSC4voDJKvTVtIaL6dAJAGfF
 b3Q6ek1C149XIV2K5K2rueYDTfLT1ubdmOVV1OxVLXJRsI9Z2qM6MVtwwt+AvIgJX9jp
 awwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVixZp/kgdlUixv2vXEqTJTlFocH3FFmf311sYePxYhPQMyrzSc5BZgvc/v9CAPJJRO8C/AS46O8Z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD+6ZW7CvYgmEK9FpvIApQUWVmbWqK4lYslnB720EKdHINlUVU
 2SsnyTCyxvJvUz5YE5L3pPb0YFYS2qtVj7ac3Kddzg75Dchhk0YQIG+cymonLCM=
X-Gm-Gg: ASbGncsZn0lT4MTa31/5mR42awAntkIzIEv8fGexggbXuRtU36Wws8xghsA3/2/ketB
 VW8Iu1OnXjSkLsZM1oLx6lW3d/oUol69XvR8zsfplux16HUH/pCSfdOIjjXb75yCRFl7TM0GUDC
 rmRV8K7unnNdRu28GT5fxs6sE4/+CkiMhRoLh05wvvY2FVu+veabYsBgFUEbTYKbUaxxSK2UtIT
 2rKp9FRTHRk/8Ckf34huPMlJfzbJnqdIuy/gxJ4E+FPPjAfRq7P79OKAoiPwpGuh5WXte05ztnL
 NFDwAvl6FPwh3h8hhygLlxUyO5770/HE8en+3OYqH3Z1ZptoYph/cah3QCyDYNpCOYNarDs=
X-Google-Smtp-Source: AGHT+IHBZoKtEBCw8TQIvqObhbSzZUHcdL0on5QXOIog629T+bopYKqI8qnCr9a1+S+u6SYHAURVew==
X-Received: by 2002:ac2:538a:0:b0:546:2f7a:38b6 with SMTP id
 2adb3069b0e04-5462f7a41bbmr2087106e87.17.1740022243894; 
 Wed, 19 Feb 2025 19:30:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452b496aafsm1910037e87.29.2025.02.19.19.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:30:43 -0800 (PST)
Date: Thu, 20 Feb 2025 05:30:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <yoqxkguscgt2xh2suum7nq6c45x24xbxlja2dgzu5pch3v2hdv@mw2wa2xajdox>
References: <20250217140910.108175-1-clamor95@gmail.com>
 <20250217140910.108175-3-clamor95@gmail.com>
 <zmwn3dnnmwhms2qxqwb6ksshx27fcq2i4wujz5utuldaiqs6oz@idvy3dirrmuo>
 <CAPVz0n0dZqbLknNqf3g0T0Wc2HiQMR2zwius=XWe-wL+znwKbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0dZqbLknNqf3g0T0Wc2HiQMR2zwius=XWe-wL+znwKbA@mail.gmail.com>
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

On Wed, Feb 19, 2025 at 09:06:53PM +0200, Svyatoslav Ryhel wrote:
> вт, 18 лют. 2025 р. о 14:31 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> пише:
> >
> > On Mon, Feb 17, 2025 at 04:09:10PM +0200, Svyatoslav Ryhel wrote:
> > > SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> > > smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> > > interface to drive display modules of up to 800 x 1366, while supporting
> > > AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig   |  14 +
> > >  drivers/gpu/drm/bridge/Makefile  |   1 +
> > >  drivers/gpu/drm/bridge/ssd2825.c | 824 +++++++++++++++++++++++++++++++
> > >  3 files changed, 839 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index 6b4664d91faa..a6eca3aef258 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -306,6 +306,20 @@ config DRM_SIMPLE_BRIDGE
> > >         Support for non-programmable DRM bridges, such as ADI ADV7123, TI
> > >         THS8134 and THS8135 or passive resistor ladder DACs.
> > >
> > > +config DRM_SOLOMON_SSD2825
> > > +     tristate "SSD2825 RGB/DSI bridge"
> > > +     depends on SPI_MASTER && OF
> > > +     select DRM_MIPI_DSI
> > > +     select DRM_KMS_HELPER
> > > +     select DRM_PANEL
> > > +     select VIDEOMODE_HELPERS
> > > +     help
> > > +       Say Y here if you want support for the Solomon SSD2825 RGB/DSI
> > > +       SPI bridge driver.
> > > +
> > > +       Say M here if you want to support this hardware as a module.
> > > +       The module will be named "solomon-ssd2825".
> > > +
> > >  config DRM_THINE_THC63LVD1024
> > >       tristate "Thine THC63LVD1024 LVDS decoder bridge"
> > >       depends on OF
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index 97304b429a53..c621ab3fa3a9 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
> > >  obj-$(CONFIG_DRM_SII902X) += sii902x.o
> > >  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> > >  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> > > +obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
> > >  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
> > >  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
> > >  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> > > diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
> > > new file mode 100644
> > > index 000000000000..cc6f5d480812
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/ssd2825.c
> > > @@ -0,0 +1,824 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/spi/spi.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_panel.h>
> > > +#include <video/mipi_display.h>
> > > +#include <video/videomode.h>
> > > +
> > > +#define SSD2825_DEVICE_ID_REG                        0xb0
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_1     0xb1
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_2     0xb2
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_3     0xb3
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_4     0xb4
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_5     0xb5
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_6     0xb6
> > > +#define   SSD2825_NON_BURST_EV                       BIT(2)
> > > +#define   SSD2825_BURST                              BIT(3)
> > > +#define   SSD2825_PCKL_HIGH                  BIT(13)
> > > +#define   SSD2825_HSYNC_HIGH                 BIT(14)
> > > +#define   SSD2825_VSYNC_HIGH                 BIT(15)
> > > +#define SSD2825_CONFIGURATION_REG            0xb7
> > > +#define   SSD2825_CONF_REG_HS                        BIT(0)
> > > +#define   SSD2825_CONF_REG_CKE                       BIT(1)
> > > +#define   SSD2825_CONF_REG_SLP                       BIT(2)
> > > +#define   SSD2825_CONF_REG_VEN                       BIT(3)
> > > +#define   SSD2825_CONF_REG_HCLK                      BIT(4)
> > > +#define   SSD2825_CONF_REG_CSS                       BIT(5)
> > > +#define   SSD2825_CONF_REG_DCS                       BIT(6)
> > > +#define   SSD2825_CONF_REG_REN                       BIT(7)
> > > +#define   SSD2825_CONF_REG_ECD                       BIT(8)
> > > +#define   SSD2825_CONF_REG_EOT                       BIT(9)
> > > +#define   SSD2825_CONF_REG_LPE                       BIT(10)
> > > +#define SSD2825_VC_CTRL_REG                  0xb8
> > > +#define SSD2825_PLL_CTRL_REG                 0xb9
> > > +#define SSD2825_PLL_CONFIGURATION_REG                0xba
> > > +#define SSD2825_CLOCK_CTRL_REG                       0xbb
> > > +#define SSD2825_PACKET_SIZE_CTRL_REG_1               0xbc
> > > +#define SSD2825_PACKET_SIZE_CTRL_REG_2               0xbd
> > > +#define SSD2825_PACKET_SIZE_CTRL_REG_3               0xbe
> > > +#define SSD2825_PACKET_DROP_REG                      0xbf
> > > +#define SSD2825_OPERATION_CTRL_REG           0xc0
> > > +#define SSD2825_MAX_RETURN_SIZE_REG          0xc1
> > > +#define SSD2825_RETURN_DATA_COUNT_REG                0xc2
> > > +#define SSD2825_ACK_RESPONSE_REG             0xc3
> > > +#define SSD2825_LINE_CTRL_REG                        0xc4
> > > +#define SSD2825_INTERRUPT_CTRL_REG           0xc5
> > > +#define SSD2825_INTERRUPT_STATUS_REG         0xc6
> > > +#define SSD2825_ERROR_STATUS_REG             0xc7
> > > +#define SSD2825_DATA_FORMAT_REG                      0xc8
> > > +#define SSD2825_DELAY_ADJ_REG_1                      0xc9
> > > +#define SSD2825_DELAY_ADJ_REG_2                      0xca
> > > +#define SSD2825_DELAY_ADJ_REG_3                      0xcb
> > > +#define SSD2825_DELAY_ADJ_REG_4                      0xcc
> > > +#define SSD2825_DELAY_ADJ_REG_5                      0xcd
> > > +#define SSD2825_DELAY_ADJ_REG_6                      0xce
> > > +#define SSD2825_HS_TX_TIMER_REG_1            0xcf
> > > +#define SSD2825_HS_TX_TIMER_REG_2            0xd0
> > > +#define SSD2825_LP_RX_TIMER_REG_1            0xd1
> > > +#define SSD2825_LP_RX_TIMER_REG_2            0xd2
> > > +#define SSD2825_TE_STATUS_REG                        0xd3
> > > +#define SSD2825_SPI_READ_REG                 0xd4
> > > +#define   SSD2825_SPI_READ_REG_RESET         0xfa
> > > +#define SSD2825_PLL_LOCK_REG                 0xd5
> > > +#define SSD2825_TEST_REG                     0xd6
> > > +#define SSD2825_TE_COUNT_REG                 0xd7
> > > +#define SSD2825_ANALOG_CTRL_REG_1            0xd8
> > > +#define SSD2825_ANALOG_CTRL_REG_2            0xd9
> > > +#define SSD2825_ANALOG_CTRL_REG_3            0xda
> > > +#define SSD2825_ANALOG_CTRL_REG_4            0xdb
> > > +#define SSD2825_INTERRUPT_OUT_CTRL_REG               0xdc
> > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_7     0xdd
> > > +#define SSD2825_LANE_CONFIGURATION_REG               0xde
> > > +#define SSD2825_DELAY_ADJ_REG_7                      0xdf
> > > +#define SSD2825_INPUT_PIN_CTRL_REG_1         0xe0
> > > +#define SSD2825_INPUT_PIN_CTRL_REG_2         0xe1
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_1         0xe2
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_2         0xe3
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_3         0xe4
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_4         0xe5
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_5         0xe6
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_6         0xe7
> > > +#define SSD2825_BIDIR_PIN_CTRL_REG_7         0xe8
> > > +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_1   0xe9
> > > +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_2   0xea
> > > +#define SSD2825_CABC_BRIGHTNESS_STATUS_REG   0xeb
> > > +#define SSD2825_READ_REG                     0xff
> > > +
> > > +#define SSD2825_COM_BYTE                     0x00
> > > +#define SSD2825_DAT_BYTE                     0x01
> > > +
> > > +#define      SSD2828_LP_CLOCK_DIVIDER(n)             (((n) - 1) & 0x3f)
> > > +#define SSD2825_LP_MIN_CLK                   5000 /* KHz */
> > > +#define SSD2825_REF_MIN_CLK                  2000 /* KHz */
> > > +
> > > +static const struct regulator_bulk_data ssd2825_supplies[] = {
> > > +     { .supply = "dvdd" },
> > > +     { .supply = "avdd" },
> > > +     { .supply = "vddio" },
> > > +};
> > > +
> > > +struct ssd2825_dsi_output {
> > > +     struct mipi_dsi_device *dev;
> > > +     struct drm_panel *panel;
> > > +     struct drm_bridge *bridge;
> > > +};
> > > +
> > > +struct ssd2825_priv {
> > > +     struct spi_device *spi;
> > > +     struct device *dev;
> > > +
> > > +     struct gpio_desc *reset_gpio;
> > > +     struct regulator_bulk_data *supplies;
> > > +
> > > +     struct clk *tx_clk;
> > > +
> > > +     int enabled;
> > > +
> > > +     struct mipi_dsi_host dsi_host;
> > > +     struct drm_bridge bridge;
> > > +     struct ssd2825_dsi_output output;
> > > +
> > > +     struct mutex mlock;     /* for host transfer operations */
> > > +
> > > +     u32 pd_lines;           /* number of Parallel Port Input Data Lines */
> > > +     u32 dsi_lanes;          /* number of DSI Lanes */
> > > +
> > > +     /* Parameters for PLL programming */
> > > +     u32 pll_freq_kbps;      /* PLL in kbps */
> > > +     u32 nibble_freq_khz;    /* PLL div by 4 */
> > > +
> > > +     u32 hzd;                /* HS Zero Delay in ns*/
> > > +     u32 hpd;                /* HS Prepare Delay is ns */
> > > +};
> > > +
> > > +static inline struct ssd2825_priv *dsi_host_to_ssd2825(struct mipi_dsi_host
> > > +                                                      *host)
> > > +{
> > > +     return container_of(host, struct ssd2825_priv, dsi_host);
> > > +}
> > > +
> > > +static inline struct ssd2825_priv *bridge_to_ssd2825(struct drm_bridge
> > > +                                                  *bridge)
> > > +{
> > > +     return container_of(bridge, struct ssd2825_priv, bridge);
> > > +}
> > > +
> > > +static int ssd2825_write_raw(struct ssd2825_priv *priv, u8 high_byte, u8 low_byte)
> > > +{
> > > +     struct spi_device *spi = priv->spi;
> > > +     u8 tx_buf[2];
> > > +
> > > +     /*
> > > +      * Low byte is the value, high byte defines type of
> > > +      * write cycle, 0 for command and 1 for data.
> > > +      */
> > > +     tx_buf[0] = low_byte;
> > > +     tx_buf[1] = high_byte;
> > > +
> > > +     return spi_write(spi, tx_buf, 2);
> > > +}
> > > +
> > > +static int ssd2825_write_reg(struct ssd2825_priv *priv, u8 reg, u16 command)
> > > +{
> > > +     u8 datal = (command & 0x00FF);
> > > +     u8 datah = (command & 0xFF00) >> 8;
> > > +     int ret;
> > > +
> > > +     /* Command write cycle */
> > > +     ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* Data write cycle bits 7-0 */
> > > +     ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datal);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* Data write cycle bits 15-8 */
> > > +     ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datah);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ssd2825_write_dsi(struct ssd2825_priv *priv, const u8 *command, int len)
> > > +{
> > > +     int ret, i;
> > > +
> > > +     ret = ssd2825_write_reg(priv, SSD2825_PACKET_SIZE_CTRL_REG_1, len);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, SSD2825_PACKET_DROP_REG);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     for (i = 0; i < len; i++) {
> > > +             ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, command[i]);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd, u16 *data)
> > > +{
> > > +     struct spi_device *spi = priv->spi;
> > > +     struct spi_message msg;
> > > +     struct spi_transfer xfer[2];
> > > +     u8 tx_buf[2];
> > > +     u8 rx_buf[2];
> > > +     int ret;
> > > +
> > > +     memset(&xfer, 0, sizeof(xfer));
> > > +
> > > +     tx_buf[1] = (cmd & 0xFF00) >> 8;
> > > +     tx_buf[0] = (cmd & 0x00FF);
> > > +
> > > +     xfer[0].tx_buf = tx_buf;
> > > +     xfer[0].bits_per_word = 9;
> > > +     xfer[0].len = 2;
> > > +
> > > +     xfer[1].rx_buf = rx_buf;
> > > +     xfer[1].bits_per_word = 16;
> > > +     xfer[1].len = 2;
> > > +
> > > +     spi_message_init(&msg);
> > > +     spi_message_add_tail(&xfer[0], &msg);
> > > +     spi_message_add_tail(&xfer[1], &msg);
> > > +
> > > +     ret = spi_sync(spi, &msg);
> > > +     if (ret)
> > > +             dev_err(&spi->dev, "spi_sync_read failed %d\n", ret);
> > > +
> > > +     *data = rx_buf[1] | (rx_buf[0] << 8);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ssd2825_read_reg(struct ssd2825_priv *priv, u8 reg, u16 *data)
> > > +{
> > > +     int ret;
> > > +
> > > +     /* Reset the read register */
> > > +     ret = ssd2825_write_reg(priv, SSD2825_SPI_READ_REG, SSD2825_SPI_READ_REG_RESET);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* Push the address to read */
> > > +     ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* Perform a reading cycle */
> > > +     ret = ssd2825_read_raw(priv, SSD2825_SPI_READ_REG_RESET, data);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host,
> > > +                                struct mipi_dsi_device *dev)
> > > +{
> > > +     struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> > > +     struct drm_bridge *bridge;
> > > +     struct drm_panel *panel;
> > > +     struct device_node *ep;
> > > +     int ret;
> > > +
> > > +     if (dev->lanes > 4) {
> > > +             dev_err(priv->dev, "unsupported number of data lanes(%u)\n",
> > > +                     dev->lanes);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     /*
> > > +      * ssd2825 supports both Video and Pulse mode, but the driver only
> > > +      * implements Video (event) mode currently
> > > +      */
> > > +     if (!(dev->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> > > +             dev_err(priv->dev, "Only MIPI_DSI_MODE_VIDEO is supported\n");
> > > +             return -EOPNOTSUPP;
> > > +     }
> > > +
> > > +     ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
> > > +                                       &bridge);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (panel) {
> > > +             bridge = drm_panel_bridge_add_typed(panel,
> > > +                                                 DRM_MODE_CONNECTOR_DSI);
> > > +             if (IS_ERR(bridge))
> > > +                     return PTR_ERR(bridge);
> > > +     }
> > > +
> > > +     priv->output.dev = dev;
> > > +     priv->output.bridge = bridge;
> > > +     priv->output.panel = panel;
> > > +
> > > +     priv->dsi_lanes = dev->lanes;
> > > +
> > > +     /* get input ep (port0/endpoint0) */
> > > +     ret = -EINVAL;
> > > +     ep = of_graph_get_endpoint_by_regs(host->dev->of_node, 0, 0);
> > > +     if (ep) {
> > > +             ret = of_property_read_u32(ep, "bus-width", &priv->pd_lines);
> > > +
> > > +             of_node_put(ep);
> > > +     }
> > > +
> > > +     if (ret)
> > > +             priv->pd_lines = mipi_dsi_pixel_format_to_bpp(dev->format);
> > > +
> > > +     drm_bridge_add(&priv->bridge);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host,
> > > +                                struct mipi_dsi_device *dev)
> > > +{
> > > +     struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> > > +
> > > +     drm_bridge_remove(&priv->bridge);
> > > +     if (priv->output.panel)
> > > +             drm_panel_bridge_remove(priv->output.bridge);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> > > +                                      const struct mipi_dsi_msg *msg)
> > > +{
> > > +     struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> > > +     u8 buf = *(u8 *)msg->tx_buf;
> > > +     u16 config;
> > > +     int ret;
> > > +
> > > +     if (!priv->enabled) {
> > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > +             return -ENODEV;
> > > +     }
> >
> > Same comment as v1:
> >
> > No. See include/drm/drm_mipi_dsi.h:
> >
> >  * Also note that those callbacks can be called no matter the state the
> >  * host is in. Drivers that need the underlying device to be powered to
> >  * perform these operations will first need to make sure it's been
> >  * properly enabled.
> >
> > > +
> > > +     if (msg->rx_len) {
> > > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > > +             return -EOPNOTSUPP;
> > > +     }
> > > +
> > > +     mutex_lock(&priv->mlock);
> >
> > guard(mutex)(&priv->mlock); would simplify the code here.
> >
> > > +
> > > +     ret = ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &config);
> > > +     if (ret)
> > > +             goto out_unlock;
> > > +
> > > +     switch (msg->type) {
> > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > +             config |= SSD2825_CONF_REG_DCS;
> > > +             break;
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > +             config &= ~SSD2825_CONF_REG_DCS;
> > > +             break;
> > > +     case MIPI_DSI_DCS_READ:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > +     default:
> > > +             goto out_unlock;
> > > +     }
> > > +
> > > +     ret = ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > > +     if (ret)
> > > +             goto out_unlock;
> > > +
> > > +     ret = ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > > +     if (ret)
> > > +             goto out_unlock;
> > > +
> > > +     ret = ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > > +     if (ret)
> > > +             goto out_unlock;
> > > +
> > > +     if (buf == MIPI_DCS_SET_DISPLAY_ON) {
> > > +             ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> > > +                               SSD2825_CONF_REG_HS | SSD2825_CONF_REG_VEN |
> > > +                               SSD2825_CONF_REG_DCS | SSD2825_CONF_REG_ECD |
> > > +                               SSD2825_CONF_REG_EOT);
> >
> > From v1:
> >
> > Most of these flags should be set depending on the
> > mipi_dsi_device.mode_flags.
> >
> > > +             ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> > > +             ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> >
> > Why? Why do you need this special handling for the
> > MIPI_DCS_SET_DISPLAY_ON? Why can't it just go to .atomic_enable()?
> >
> > > +     }
> > > +
> > > +out_unlock:
> > > +     mutex_unlock(&priv->mlock);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct mipi_dsi_host_ops ssd2825_dsi_host_ops = {
> > > +     .attach = ssd2825_dsi_host_attach,
> > > +     .detach = ssd2825_dsi_host_detach,
> > > +     .transfer = ssd2825_dsi_host_transfer,
> > > +};
> > > +
> > > +static void ssd2825_hw_reset(struct ssd2825_priv *priv)
> > > +{
> > > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > +     usleep_range(5000, 6000);
> > > +     gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > > +     usleep_range(5000, 6000);
> > > +}
> > > +
> > > +/*
> > > + * PLL configuration register settings.
> > > + *
> > > + * See the "PLL Configuration Register Description" in the SSD2825 datasheet.
> > > + */
> > > +static u16 construct_pll_config(struct ssd2825_priv *priv,
> > > +                             u32 desired_pll_freq_kbps, u32 reference_freq_khz)
> > > +{
> > > +     u32 div_factor = 1, mul_factor, fr = 0;
> > > +
> > > +     while (reference_freq_khz / (div_factor + 1) >= SSD2825_REF_MIN_CLK)
> > > +             div_factor++;
> > > +     if (div_factor > 31)
> > > +             div_factor = 31;
> > > +
> > > +     mul_factor = DIV_ROUND_UP(desired_pll_freq_kbps * div_factor,
> > > +                               reference_freq_khz);
> > > +
> > > +     priv->pll_freq_kbps = reference_freq_khz * mul_factor / div_factor;
> > > +     priv->nibble_freq_khz = priv->pll_freq_kbps / 4;
> > > +
> > > +     if (priv->pll_freq_kbps >= 501000)
> > > +             fr = 3;
> > > +     else if (priv->pll_freq_kbps >= 251000)
> > > +             fr = 2;
> > > +     else if (priv->pll_freq_kbps >= 126000)
> > > +             fr = 1;
> > > +
> > > +     return (fr << 14) | (div_factor << 8) | mul_factor;
> > > +}
> > > +
> > > +static u32 ssd2825_to_ns(u32 khz)
> > > +{
> > > +     return (1000 * 1000 / khz);
> > > +}
> > > +
> > > +static int ssd2825_setup_pll(struct ssd2825_priv *priv,
> > > +                          const struct drm_display_mode *mode)
> > > +{
> > > +     u16 pll_config, lp_div;
> > > +     u32 nibble_delay, pclk_mult, tx_freq_khz;
> > > +     u8 hzd, hpd;
> > > +
> > > +     tx_freq_khz = clk_get_rate(priv->tx_clk) / 1000;
> > > +     if (!tx_freq_khz)
> > > +             tx_freq_khz = SSD2825_REF_MIN_CLK;
> > > +
> > > +     pclk_mult = priv->pd_lines / priv->dsi_lanes + 1;
> > > +     pll_config = construct_pll_config(priv, pclk_mult * mode->clock,
> > > +                                       tx_freq_khz);
> > > +
> > > +     lp_div = priv->pll_freq_kbps / (SSD2825_LP_MIN_CLK * 8);
> > > +
> > > +     nibble_delay = ssd2825_to_ns(priv->nibble_freq_khz);
> > > +
> > > +     hzd = priv->hzd / nibble_delay;
> > > +     hpd = (priv->hpd - 4 * nibble_delay) / nibble_delay;
> > > +
> > > +     /* Disable PLL */
> > > +     ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0000);
> > > +     ssd2825_write_reg(priv, SSD2825_LINE_CTRL_REG, 0x0001);
> > > +
> > > +     /* Set delays */
> > > +     dev_dbg(priv->dev, "SSD2825_DELAY_ADJ_REG_1 0x%x\n", (hzd << 8) | hpd);
> >
> > From v1:
> >
> > drm_dbg_driver() ?
> >
> >
> > > +     ssd2825_write_reg(priv, SSD2825_DELAY_ADJ_REG_1, (hzd << 8) | hpd);
> > > +
> > > +     /* Set PLL coeficients */
> > > +     dev_dbg(priv->dev, "SSD2825_PLL_CONFIGURATION_REG 0x%x\n", pll_config);
> > > +     ssd2825_write_reg(priv, SSD2825_PLL_CONFIGURATION_REG, pll_config);
> > > +
> > > +     /* Clock Control Register */
> > > +     dev_dbg(priv->dev, "SSD2825_CLOCK_CTRL_REG 0x%x\n",
> > > +             SSD2828_LP_CLOCK_DIVIDER(lp_div));
> > > +     ssd2825_write_reg(priv, SSD2825_CLOCK_CTRL_REG,
> > > +                       SSD2828_LP_CLOCK_DIVIDER(lp_div));
> > > +
> > > +     /* Enable PLL */
> > > +     ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > +                                          struct drm_bridge_state *old_bridge_state)
> > > +{
> > > +     struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> > > +     int ret;
> > > +
> > > +     if (priv->enabled)
> > > +             return;
> > > +
> > > +     /* Power Sequence */
> > > +     ret = clk_prepare_enable(priv->tx_clk);
> > > +     if (ret < 0)
> > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> > > +
> > > +     ret = regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv->supplies);
> > > +     if (ret < 0)
> > > +             dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
> > > +
> > > +     usleep_range(1000, 2000);
> > > +
> > > +     ssd2825_hw_reset(priv);
> > > +
> > > +     priv->enabled = true;
> > > +}
> > > +
> > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                      struct drm_bridge_state *old_bridge_state)
> > > +{
> > > +     struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> > > +     struct device *dev = priv->dev;
> > > +     struct mipi_dsi_device *dsi_dev = priv->output.dev;
> > > +     struct drm_atomic_state *state = old_bridge_state->base.state;
> > > +     const struct drm_crtc_state *crtc_state;
> > > +     const struct drm_display_mode *mode;
> > > +     struct drm_connector *connector;
> > > +     struct drm_crtc *crtc;
> > > +     u32 input_bus_flags = bridge->timings->input_bus_flags;
> > > +     u16 flags = 0;
> > > +     u8 pixel_format;
> > > +
> > > +     /* Filter unimplemeted modes before RGB control registers configuration */
> > > +     if (dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> > > +             dev_warn_once(dev,
> > > +                           "Non-continuous mode unimplemented, falling back to continuous\n");
> > > +             dsi_dev->mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > > +     }
> > > +
> > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> > > +             dev_warn_once(dev,
> > > +                           "Burst mode unimplemented, falling back to simple\n");
> > > +             dsi_dev->mode_flags &= ~MIPI_DSI_MODE_VIDEO_BURST;
> > > +     }
> >
> >
> > But you have implemented it already, several lines below.
> >
> > Also such checks should really go to .atomic_check() or
> > ssd2825_dsi_host_attach().
> >
> 
> All those checks do have sense, here me out:
> 
> 1. atomic_check cannot be used together with mode_fixup, and they both
> should contain checks and fixups related to bridge work, not the panel
> it drives.

Yes, atomic_check() replaces mode_fixup(). It can update adjusted_mode
in the same way, following the bridge's requirements.

> 2. ssd2825_bridge_atomic_enable checks knock out modes which are
> supported by the device but are not implemented in the driver yet.
> They are there since register configuration requites those checks
> early

sounds good

> 3. ssd2825_dsi_host_attach checks for MIPI_DSI_MODE_VIDEO cause there
> might be panels which do not support this mode and each mode is set by
> its own bit, hence knocking out unsupported mode does not mean that
> supported mode is added.

I don't understand this comment. You can still reject
MIPI_DSI_MODE_VIDEO_BURST and MIPI_DSI_CLOCK_NON_CONTINUOUS in either of
those functions. I'd suggest the ssd2825_dsi_host_attach().

> 
> > > +
> > > +     /* Perform SW reset */
> > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > > +
> > > +     /* Set pixel format */
> > > +     switch (dsi_dev->format) {
> > > +     case MIPI_DSI_FMT_RGB565:
> > > +             pixel_format = 0x00;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > +             pixel_format = 0x01;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB666:
> > > +             pixel_format = 0x02;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB888:
> > > +     default:
> > > +             pixel_format = 0x03;
> > > +             break;
> > > +     }
> > > +

-- 
With best wishes
Dmitry
