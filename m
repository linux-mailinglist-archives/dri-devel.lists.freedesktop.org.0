Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A305DA3C05E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49210E315;
	Wed, 19 Feb 2025 13:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ayXOd46d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182310E315
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:46:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38f378498b0so3463588f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739972809; x=1740577609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdNOes2bQhCqQ3KAtXJy8Exu3WnhwGqmFOtXtxdvoQA=;
 b=ayXOd46d/KHKn4QMKZSNBOFW034PGTYQ+P/9UqsS6Tj0b8YhOpi1q3tg6Qwy/LmT2c
 xGkYE+CYzcPQs+Iz0e00/d0o+gG5zDajd6q0EotONMyBl6fLjXn0vnUgFwSifkbbelSa
 jMKYEmBXuL5UaMmJ2z/6U2hlhko4AJM6qr3VQFQ+MThNOKXmAiFCBpCHl5bqWZQsunyr
 2boYZVyc/VJwbm67kUBZnP8OQWaoy8CF0cUjKUYqhLI1eyLfFVG6hHY88XadWYpaP6sC
 2dThSyv/5g/vT3XcLHPDjrn/RyZ9nC77BSzT6oAXvuUmxIQuS8XKsUqBKlN+fVaU6Lik
 rTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972809; x=1740577609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdNOes2bQhCqQ3KAtXJy8Exu3WnhwGqmFOtXtxdvoQA=;
 b=mpWiHjrLFkkki59s7vqaN2PzDNyvODdeHhAEw8GWlBiEjm6tFGLvob+/DszJpkH/sS
 H+Sq1PKAZV3CiVNn0l2GV90ffUSX54ycZP00+lLO4wRR8BMIpAAFmE0p7aT0qxRoP+N1
 Ibo4JYzXPzxPfkeN9LFXch03/opaMQ5RoIVqF/sA6bTManFt6OvVuKXxoDT8tBTi2bc1
 zqmhEtp04nnP2Mz0/EHhKo4iGKrBU8R/3MPQUjoHW7jx4bvKfKt/qoe9V1yKFM6Soi5Y
 kOZNNKMte+MaSXXzt6TVdNYNGjQW8lSS/R78KJDBTQktDmEhtoQZ/ImQdHbZl0dOnuyT
 W7nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEs1hzkdq0/IFn21sJi42K9sc888PcP7MT5iEhjYMlb+59SJYlpCOBegfPAf+aFlLSa2sDyhYGZjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+HCs1pXTAyLbOY11x/IjC6tkVmkSL4jbGL6U0/oCNFJZ2P3yt
 4DiqIIFIWotSk3u0IhLfVYqbCPO0Af7/0/0VtJOtdfBJFLPyvP3/ZbAugUFCAGv1qrfm8HrrqYB
 Ayv8KJ3VyEZ5Y7+m/g4Bxf9dhLGY=
X-Gm-Gg: ASbGncut286HUw4pyxzsJ+uEt2odD3XMlNlPzqWa+Oz2onYAj5dYSs70VcZpj5vYnH1
 P1WWa+jK77aIivA65SGDTXBcEH90W4s4gYB2NgUTp1sGEorq3becEso+q4zPhopna6VnFahE4GQ
 ==
X-Google-Smtp-Source: AGHT+IFiho8MA3WALTPI5tYdWi28ESvZ+jlhAkLJr3Gq1s84AeCWDrwN6Dwb95oLXh1hoFqgvO6eMo+MVMwCmOslK7w=
X-Received: by 2002:a05:6000:1565:b0:38f:3e39:20a1 with SMTP id
 ffacd0b85a97d-38f58782cb8mr2853844f8f.11.1739972808866; Wed, 19 Feb 2025
 05:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20250217140910.108175-1-clamor95@gmail.com>
 <20250217140910.108175-3-clamor95@gmail.com>
 <zmwn3dnnmwhms2qxqwb6ksshx27fcq2i4wujz5utuldaiqs6oz@idvy3dirrmuo>
 <CAPVz0n3bqLhuC0gxXD-=L0ETMmhOv1Ku0PrWUb_Yn09v3UNuOA@mail.gmail.com>
 <hemnpzzz3ddibdbqwkazwuoalmvuc2mekebqxfrnxiod6futni@sgdjgtrbcwza>
 <CAPVz0n24o5yar-0oO5dPb3vLzuK=Ln8+JKuaooSRwPfiaLQ9vA@mail.gmail.com>
 <jo7nnxrzwi43qqii7wtekdbc6vluakkvg4ndw266ajgkpe3y52@whd5nly34nju>
In-Reply-To: <jo7nnxrzwi43qqii7wtekdbc6vluakkvg4ndw266ajgkpe3y52@whd5nly34nju>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Feb 2025 15:46:37 +0200
X-Gm-Features: AWEUYZns1Luu_tGH2Hto8dP3McqXzEyxG204nugCBlnU8TiASNzF9fF0rwnuVeE
Message-ID: <CAPVz0n1QMvjYSsX0nU7A77U7TQ4NDa0W9Ozz5nK1tA_dWDRabA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 linux-kernel@vger.kernel.org
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

=D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 15:34 Dmit=
ry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 18, 2025 at 04:36:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:20 =
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, Feb 18, 2025 at 02:45:19PM +0200, Svyatoslav Ryhel wrote:
> > > > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 14=
:31 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > > >
> > > > > On Mon, Feb 17, 2025 at 04:09:10PM +0200, Svyatoslav Ryhel wrote:
> > > > > > SSD2825 is a cost-effective MIPI Bridge Chip solution targeting=
 mainly
> > > > > > smartphones. It can convert 24bit RGB interface into 4-lane MIP=
I-DSI
> > > > > > interface to drive display modules of up to 800 x 1366, while s=
upporting
> > > > > > AMOLED, a-si LCD or LTPS panel technologies for smartphone appl=
ications.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/Kconfig   |  14 +
> > > > > >  drivers/gpu/drm/bridge/Makefile  |   1 +
> > > > > >  drivers/gpu/drm/bridge/ssd2825.c | 824 +++++++++++++++++++++++=
++++++++
> > > > > >  3 files changed, 839 insertions(+)
> > > > > >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/b=
ridge/Kconfig
> > > > > > index 6b4664d91faa..a6eca3aef258 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > > @@ -306,6 +306,20 @@ config DRM_SIMPLE_BRIDGE
> > > > > >         Support for non-programmable DRM bridges, such as ADI A=
DV7123, TI
> > > > > >         THS8134 and THS8135 or passive resistor ladder DACs.
> > > > > >
> > > > > > +config DRM_SOLOMON_SSD2825
> > > > > > +     tristate "SSD2825 RGB/DSI bridge"
> > > > > > +     depends on SPI_MASTER && OF
> > > > > > +     select DRM_MIPI_DSI
> > > > > > +     select DRM_KMS_HELPER
> > > > > > +     select DRM_PANEL
> > > > > > +     select VIDEOMODE_HELPERS
> > > > > > +     help
> > > > > > +       Say Y here if you want support for the Solomon SSD2825 =
RGB/DSI
> > > > > > +       SPI bridge driver.
> > > > > > +
> > > > > > +       Say M here if you want to support this hardware as a mo=
dule.
> > > > > > +       The module will be named "solomon-ssd2825".
> > > > > > +
> > > > > >  config DRM_THINE_THC63LVD1024
> > > > > >       tristate "Thine THC63LVD1024 LVDS decoder bridge"
> > > > > >       depends on OF
> > > > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/=
bridge/Makefile
> > > > > > index 97304b429a53..c621ab3fa3a9 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > > > @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-sii862=
0.o
> > > > > >  obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
> > > > > >  obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> > > > > >  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) +=3D simple-bridge.o
> > > > > > +obj-$(CONFIG_DRM_SOLOMON_SSD2825) +=3D ssd2825.o
> > > > > >  obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd1024.o
> > > > > >  obj-$(CONFIG_DRM_TOSHIBA_TC358762) +=3D tc358762.o
> > > > > >  obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o
> > > > > > diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm=
/bridge/ssd2825.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..cc6f5d480812
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/bridge/ssd2825.c
> > > > > > @@ -0,0 +1,824 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +#include <linux/clk.h>
> > > > > > +#include <linux/delay.h>
> > > > > > +#include <linux/device.h>
> > > > > > +#include <linux/err.h>
> > > > > > +#include <linux/kernel.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/mod_devicetable.h>
> > > > > > +#include <linux/mutex.h>
> > > > > > +#include <linux/of.h>
> > > > > > +#include <linux/regulator/consumer.h>
> > > > > > +#include <linux/spi/spi.h>
> > > > > > +
> > > > > > +#include <drm/drm_atomic_helper.h>
> > > > > > +#include <drm/drm_bridge.h>
> > > > > > +#include <drm/drm_drv.h>
> > > > > > +#include <drm/drm_mipi_dsi.h>
> > > > > > +#include <drm/drm_of.h>
> > > > > > +#include <drm/drm_panel.h>
> > > > > > +#include <video/mipi_display.h>
> > > > > > +#include <video/videomode.h>
> > > > > > +
> > > > > > +#define SSD2825_DEVICE_ID_REG                        0xb0
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_1     0xb1
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_2     0xb2
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_3     0xb3
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_4     0xb4
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_5     0xb5
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_6     0xb6
> > > > > > +#define   SSD2825_NON_BURST_EV                       BIT(2)
> > > > > > +#define   SSD2825_BURST                              BIT(3)
> > > > > > +#define   SSD2825_PCKL_HIGH                  BIT(13)
> > > > > > +#define   SSD2825_HSYNC_HIGH                 BIT(14)
> > > > > > +#define   SSD2825_VSYNC_HIGH                 BIT(15)
> > > > > > +#define SSD2825_CONFIGURATION_REG            0xb7
> > > > > > +#define   SSD2825_CONF_REG_HS                        BIT(0)
> > > > > > +#define   SSD2825_CONF_REG_CKE                       BIT(1)
> > > > > > +#define   SSD2825_CONF_REG_SLP                       BIT(2)
> > > > > > +#define   SSD2825_CONF_REG_VEN                       BIT(3)
> > > > > > +#define   SSD2825_CONF_REG_HCLK                      BIT(4)
> > > > > > +#define   SSD2825_CONF_REG_CSS                       BIT(5)
> > > > > > +#define   SSD2825_CONF_REG_DCS                       BIT(6)
> > > > > > +#define   SSD2825_CONF_REG_REN                       BIT(7)
> > > > > > +#define   SSD2825_CONF_REG_ECD                       BIT(8)
> > > > > > +#define   SSD2825_CONF_REG_EOT                       BIT(9)
> > > > > > +#define   SSD2825_CONF_REG_LPE                       BIT(10)
> > > > > > +#define SSD2825_VC_CTRL_REG                  0xb8
> > > > > > +#define SSD2825_PLL_CTRL_REG                 0xb9
> > > > > > +#define SSD2825_PLL_CONFIGURATION_REG                0xba
> > > > > > +#define SSD2825_CLOCK_CTRL_REG                       0xbb
> > > > > > +#define SSD2825_PACKET_SIZE_CTRL_REG_1               0xbc
> > > > > > +#define SSD2825_PACKET_SIZE_CTRL_REG_2               0xbd
> > > > > > +#define SSD2825_PACKET_SIZE_CTRL_REG_3               0xbe
> > > > > > +#define SSD2825_PACKET_DROP_REG                      0xbf
> > > > > > +#define SSD2825_OPERATION_CTRL_REG           0xc0
> > > > > > +#define SSD2825_MAX_RETURN_SIZE_REG          0xc1
> > > > > > +#define SSD2825_RETURN_DATA_COUNT_REG                0xc2
> > > > > > +#define SSD2825_ACK_RESPONSE_REG             0xc3
> > > > > > +#define SSD2825_LINE_CTRL_REG                        0xc4
> > > > > > +#define SSD2825_INTERRUPT_CTRL_REG           0xc5
> > > > > > +#define SSD2825_INTERRUPT_STATUS_REG         0xc6
> > > > > > +#define SSD2825_ERROR_STATUS_REG             0xc7
> > > > > > +#define SSD2825_DATA_FORMAT_REG                      0xc8
> > > > > > +#define SSD2825_DELAY_ADJ_REG_1                      0xc9
> > > > > > +#define SSD2825_DELAY_ADJ_REG_2                      0xca
> > > > > > +#define SSD2825_DELAY_ADJ_REG_3                      0xcb
> > > > > > +#define SSD2825_DELAY_ADJ_REG_4                      0xcc
> > > > > > +#define SSD2825_DELAY_ADJ_REG_5                      0xcd
> > > > > > +#define SSD2825_DELAY_ADJ_REG_6                      0xce
> > > > > > +#define SSD2825_HS_TX_TIMER_REG_1            0xcf
> > > > > > +#define SSD2825_HS_TX_TIMER_REG_2            0xd0
> > > > > > +#define SSD2825_LP_RX_TIMER_REG_1            0xd1
> > > > > > +#define SSD2825_LP_RX_TIMER_REG_2            0xd2
> > > > > > +#define SSD2825_TE_STATUS_REG                        0xd3
> > > > > > +#define SSD2825_SPI_READ_REG                 0xd4
> > > > > > +#define   SSD2825_SPI_READ_REG_RESET         0xfa
> > > > > > +#define SSD2825_PLL_LOCK_REG                 0xd5
> > > > > > +#define SSD2825_TEST_REG                     0xd6
> > > > > > +#define SSD2825_TE_COUNT_REG                 0xd7
> > > > > > +#define SSD2825_ANALOG_CTRL_REG_1            0xd8
> > > > > > +#define SSD2825_ANALOG_CTRL_REG_2            0xd9
> > > > > > +#define SSD2825_ANALOG_CTRL_REG_3            0xda
> > > > > > +#define SSD2825_ANALOG_CTRL_REG_4            0xdb
> > > > > > +#define SSD2825_INTERRUPT_OUT_CTRL_REG               0xdc
> > > > > > +#define SSD2825_RGB_INTERFACE_CTRL_REG_7     0xdd
> > > > > > +#define SSD2825_LANE_CONFIGURATION_REG               0xde
> > > > > > +#define SSD2825_DELAY_ADJ_REG_7                      0xdf
> > > > > > +#define SSD2825_INPUT_PIN_CTRL_REG_1         0xe0
> > > > > > +#define SSD2825_INPUT_PIN_CTRL_REG_2         0xe1
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_1         0xe2
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_2         0xe3
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_3         0xe4
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_4         0xe5
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_5         0xe6
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_6         0xe7
> > > > > > +#define SSD2825_BIDIR_PIN_CTRL_REG_7         0xe8
> > > > > > +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_1   0xe9
> > > > > > +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_2   0xea
> > > > > > +#define SSD2825_CABC_BRIGHTNESS_STATUS_REG   0xeb
> > > > > > +#define SSD2825_READ_REG                     0xff
> > > > > > +
> > > > > > +#define SSD2825_COM_BYTE                     0x00
> > > > > > +#define SSD2825_DAT_BYTE                     0x01
> > > > > > +
> > > > > > +#define      SSD2828_LP_CLOCK_DIVIDER(n)             (((n) - 1=
) & 0x3f)
> > > > > > +#define SSD2825_LP_MIN_CLK                   5000 /* KHz */
> > > > > > +#define SSD2825_REF_MIN_CLK                  2000 /* KHz */
> > > > > > +
> > > > > > +static const struct regulator_bulk_data ssd2825_supplies[] =3D=
 {
> > > > > > +     { .supply =3D "dvdd" },
> > > > > > +     { .supply =3D "avdd" },
> > > > > > +     { .supply =3D "vddio" },
> > > > > > +};
> > > > > > +
> > > > > > +struct ssd2825_dsi_output {
> > > > > > +     struct mipi_dsi_device *dev;
> > > > > > +     struct drm_panel *panel;
> > > > > > +     struct drm_bridge *bridge;
> > > > > > +};
> > > > > > +
> > > > > > +struct ssd2825_priv {
> > > > > > +     struct spi_device *spi;
> > > > > > +     struct device *dev;
> > > > > > +
> > > > > > +     struct gpio_desc *reset_gpio;
> > > > > > +     struct regulator_bulk_data *supplies;
> > > > > > +
> > > > > > +     struct clk *tx_clk;
> > > > > > +
> > > > > > +     int enabled;
> > > > > > +
> > > > > > +     struct mipi_dsi_host dsi_host;
> > > > > > +     struct drm_bridge bridge;
> > > > > > +     struct ssd2825_dsi_output output;
> > > > > > +
> > > > > > +     struct mutex mlock;     /* for host transfer operations *=
/
> > > > > > +
> > > > > > +     u32 pd_lines;           /* number of Parallel Port Input =
Data Lines */
> > > > > > +     u32 dsi_lanes;          /* number of DSI Lanes */
> > > > > > +
> > > > > > +     /* Parameters for PLL programming */
> > > > > > +     u32 pll_freq_kbps;      /* PLL in kbps */
> > > > > > +     u32 nibble_freq_khz;    /* PLL div by 4 */
> > > > > > +
> > > > > > +     u32 hzd;                /* HS Zero Delay in ns*/
> > > > > > +     u32 hpd;                /* HS Prepare Delay is ns */
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct ssd2825_priv *dsi_host_to_ssd2825(struct =
mipi_dsi_host
> > > > > > +                                                      *host)
> > > > > > +{
> > > > > > +     return container_of(host, struct ssd2825_priv, dsi_host);
> > > > > > +}
> > > > > > +
> > > > > > +static inline struct ssd2825_priv *bridge_to_ssd2825(struct dr=
m_bridge
> > > > > > +                                                  *bridge)
> > > > > > +{
> > > > > > +     return container_of(bridge, struct ssd2825_priv, bridge);
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_write_raw(struct ssd2825_priv *priv, u8 hig=
h_byte, u8 low_byte)
> > > > > > +{
> > > > > > +     struct spi_device *spi =3D priv->spi;
> > > > > > +     u8 tx_buf[2];
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Low byte is the value, high byte defines type of
> > > > > > +      * write cycle, 0 for command and 1 for data.
> > > > > > +      */
> > > > > > +     tx_buf[0] =3D low_byte;
> > > > > > +     tx_buf[1] =3D high_byte;
> > > > > > +
> > > > > > +     return spi_write(spi, tx_buf, 2);
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_write_reg(struct ssd2825_priv *priv, u8 reg=
, u16 command)
> > > > > > +{
> > > > > > +     u8 datal =3D (command & 0x00FF);
> > > > > > +     u8 datah =3D (command & 0xFF00) >> 8;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     /* Command write cycle */
> > > > > > +     ret =3D ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     /* Data write cycle bits 7-0 */
> > > > > > +     ret =3D ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datal);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     /* Data write cycle bits 15-8 */
> > > > > > +     ret =3D ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datah);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_write_dsi(struct ssd2825_priv *priv, const =
u8 *command, int len)
> > > > > > +{
> > > > > > +     int ret, i;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_PACKET_SIZE_CTRL_=
REG_1, len);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_raw(priv, SSD2825_COM_BYTE, SSD2825=
_PACKET_DROP_REG);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     for (i =3D 0; i < len; i++) {
> > > > > > +             ret =3D ssd2825_write_raw(priv, SSD2825_DAT_BYTE,=
 command[i]);
> > > > > > +             if (ret)
> > > > > > +                     return ret;
> > > > > > +     }
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd,=
 u16 *data)
> > > > > > +{
> > > > > > +     struct spi_device *spi =3D priv->spi;
> > > > > > +     struct spi_message msg;
> > > > > > +     struct spi_transfer xfer[2];
> > > > > > +     u8 tx_buf[2];
> > > > > > +     u8 rx_buf[2];
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     memset(&xfer, 0, sizeof(xfer));
> > > > > > +
> > > > > > +     tx_buf[1] =3D (cmd & 0xFF00) >> 8;
> > > > > > +     tx_buf[0] =3D (cmd & 0x00FF);
> > > > > > +
> > > > > > +     xfer[0].tx_buf =3D tx_buf;
> > > > > > +     xfer[0].bits_per_word =3D 9;
> > > > > > +     xfer[0].len =3D 2;
> > > > > > +
> > > > > > +     xfer[1].rx_buf =3D rx_buf;
> > > > > > +     xfer[1].bits_per_word =3D 16;
> > > > > > +     xfer[1].len =3D 2;
> > > > > > +
> > > > > > +     spi_message_init(&msg);
> > > > > > +     spi_message_add_tail(&xfer[0], &msg);
> > > > > > +     spi_message_add_tail(&xfer[1], &msg);
> > > > > > +
> > > > > > +     ret =3D spi_sync(spi, &msg);
> > > > > > +     if (ret)
> > > > > > +             dev_err(&spi->dev, "spi_sync_read failed %d\n", r=
et);
> > > > > > +
> > > > > > +     *data =3D rx_buf[1] | (rx_buf[0] << 8);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_read_reg(struct ssd2825_priv *priv, u8 reg,=
 u16 *data)
> > > > > > +{
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     /* Reset the read register */
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_SPI_READ_REG, SSD=
2825_SPI_READ_REG_RESET);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     /* Push the address to read */
> > > > > > +     ret =3D ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     /* Perform a reading cycle */
> > > > > > +     ret =3D ssd2825_read_raw(priv, SSD2825_SPI_READ_REG_RESET=
, data);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host,
> > > > > > +                                struct mipi_dsi_device *dev)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > > > +     struct drm_bridge *bridge;
> > > > > > +     struct drm_panel *panel;
> > > > > > +     struct device_node *ep;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (dev->lanes > 4) {
> > > > > > +             dev_err(priv->dev, "unsupported number of data la=
nes(%u)\n",
> > > > > > +                     dev->lanes);
> > > > > > +             return -EINVAL;
> > > > > > +     }
> > > > > > +
> > > > > > +     /*
> > > > > > +      * ssd2825 supports both Video and Pulse mode, but the dr=
iver only
> > > > > > +      * implements Video (event) mode currently
> > > > > > +      */
> > > > > > +     if (!(dev->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> > > > > > +             dev_err(priv->dev, "Only MIPI_DSI_MODE_VIDEO is s=
upported\n");
> > > > > > +             return -EOPNOTSUPP;
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D drm_of_find_panel_or_bridge(host->dev->of_node, 1=
, 0, &panel,
> > > > > > +                                       &bridge);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     if (panel) {
> > > > > > +             bridge =3D drm_panel_bridge_add_typed(panel,
> > > > > > +                                                 DRM_MODE_CONN=
ECTOR_DSI);
> > > > > > +             if (IS_ERR(bridge))
> > > > > > +                     return PTR_ERR(bridge);
> > > > > > +     }
> > > > > > +
> > > > > > +     priv->output.dev =3D dev;
> > > > > > +     priv->output.bridge =3D bridge;
> > > > > > +     priv->output.panel =3D panel;
> > > > > > +
> > > > > > +     priv->dsi_lanes =3D dev->lanes;
> > > > > > +
> > > > > > +     /* get input ep (port0/endpoint0) */
> > > > > > +     ret =3D -EINVAL;
> > > > > > +     ep =3D of_graph_get_endpoint_by_regs(host->dev->of_node, =
0, 0);
> > > > > > +     if (ep) {
> > > > > > +             ret =3D of_property_read_u32(ep, "bus-width", &pr=
iv->pd_lines);
> > > > > > +
> > > > > > +             of_node_put(ep);
> > > > > > +     }
> > > > > > +
> > > > > > +     if (ret)
> > > > > > +             priv->pd_lines =3D mipi_dsi_pixel_format_to_bpp(d=
ev->format);
> > > > > > +
> > > > > > +     drm_bridge_add(&priv->bridge);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host,
> > > > > > +                                struct mipi_dsi_device *dev)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > > > +
> > > > > > +     drm_bridge_remove(&priv->bridge);
> > > > > > +     if (priv->output.panel)
> > > > > > +             drm_panel_bridge_remove(priv->output.bridge);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host =
*host,
> > > > > > +                                      const struct mipi_dsi_ms=
g *msg)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > > > > +     u16 config;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (!priv->enabled) {
> > > > > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > > > > +             return -ENODEV;
> > > > > > +     }
> > > > >
> > > > > Same comment as v1:
> > > > >
> > > > > No. See include/drm/drm_mipi_dsi.h:
> > > > >
> > > > >  * Also note that those callbacks can be called no matter the sta=
te the
> > > > >  * host is in. Drivers that need the underlying device to be powe=
red to
> > > > >  * perform these operations will first need to make sure it's bee=
n
> > > > >  * properly enabled.
> > > > >
> > > >
> > > > Yes, I am checking if bridge id enabled. How to check it more? Plea=
se
> > > > explain in detail, I do not quite understand this place. Thank you.
> > >
> > > It is "make sure", not "check". So you have to wake up the DSI host,
> > > make a transfer, then shut it down. As far as I remember, that was th=
e
> > > agreed implementation.
> > >
> >
> > Can you please provide some examples, at least one, so that I know
> > what exactly should I do. Thanks.
>
> I think cdns_dsi_transfer() is the best example, it calls
> pm_runtime_resume_and_get(). At the same time I see that other drivers
> don't actually implement this requirement, so I'd better remove this
> comment.
>

Now you see, why I did not understand your comment initially. Thanks
for clarifying.

> >
> > > >
> > > > > > +
> > > > > > +     if (msg->rx_len) {
> > > > > > +             dev_warn(priv->dev, "MIPI rx is not supported\n")=
;
> > > > > > +             return -EOPNOTSUPP;
> > > > > > +     }
> > > > > > +
> > > > > > +     mutex_lock(&priv->mlock);
> > > > >
> > > > > guard(mutex)(&priv->mlock); would simplify the code here.
> > > > >
> > > >
> > > > Fair
> > > >
> > > > > > +
> > > > > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG,=
 &config);
> > > > > > +     if (ret)
> > > > > > +             goto out_unlock;
> > > > > > +
> > > > > > +     switch (msg->type) {
> > > > > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > > > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > > > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > > > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > > > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_DCS_READ:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > > > > +     default:
> > > > > > +             goto out_unlock;
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG=
, config);
> > > > > > +     if (ret)
> > > > > > +             goto out_unlock;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x00=
00);
> > > > > > +     if (ret)
> > > > > > +             goto out_unlock;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len)=
;
> > > > > > +     if (ret)
> > > > > > +             goto out_unlock;
> > > > > > +
> > > > > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > > > > +             ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG=
,
> > > > > > +                               SSD2825_CONF_REG_HS | SSD2825_C=
ONF_REG_VEN |
> > > > > > +                               SSD2825_CONF_REG_DCS | SSD2825_=
CONF_REG_ECD |
> > > > > > +                               SSD2825_CONF_REG_EOT);
> > > > >
> > > > > From v1:
> > > > >
> > > > > Most of these flags should be set depending on the
> > > > > mipi_dsi_device.mode_flags.
> > > > >
> > > > > > +             ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0=
001);
> > > > > > +             ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x00=
00);
> > > > >
> > > > > Why? Why do you need this special handling for the
> > > > > MIPI_DCS_SET_DISPLAY_ON? Why can't it just go to .atomic_enable()=
?
> > > > >
> > > >
> > > > This has to be called after panel init dsi sequence completes, is
> > > > atomic_enable called after panel init dsi seq is completed? Maybe y=
ou
> > > > can suggest where to place it.
> > >
> > > That depends on a panel. Significant number of panel drivers call all
> > > DSI programming in .prepare because some DSI hosts can not transfer
> > > commands after starting DSI video stream.
> > >
> > > So these commands should go to your .enable().
> > >
> >
> > This is weird and counter intuitive to send dsi commands in prepare,
> > there should be smth like enable_post. Oh well, fine, I will try to
> > fit this somehow.
> >
> > > But what is the case for these calls? Are you manually implementing t=
he
> > > MIPI_DSI_MODE_LPM flag? What exactly do they do? What happens if the
> > > panel driver asks for the MIPI_DCS_SET_DISPLAY_ON command after you'v=
e
> > > programmed those registers? What happens if the panel asks for the
> > > backlight control?
> > >
> >
> > Backlight is externally controlled, at least on my device, so I cannot
> > test other cases. If I configure those registers before dsi sequence
> > is completed panel stays black. If I simply remove those
> > configuration, panel stays black.
> >
> > > >
> > > > > > +     }
> > > > > > +
> > > > > > +out_unlock:
> > > > > > +     mutex_unlock(&priv->mlock);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct mipi_dsi_host_ops ssd2825_dsi_host_ops =3D=
 {
> > > > > > +     .attach =3D ssd2825_dsi_host_attach,
> > > > > > +     .detach =3D ssd2825_dsi_host_detach,
> > > > > > +     .transfer =3D ssd2825_dsi_host_transfer,
> > > > > > +};
> > > > > > +
> > > > > > +static void ssd2825_hw_reset(struct ssd2825_priv *priv)
> > > > > > +{
> > > > > > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > > > > +     usleep_range(5000, 6000);
> > > > > > +     gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > > > > > +     usleep_range(5000, 6000);
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * PLL configuration register settings.
> > > > > > + *
> > > > > > + * See the "PLL Configuration Register Description" in the SSD=
2825 datasheet.
> > > > > > + */
> > > > > > +static u16 construct_pll_config(struct ssd2825_priv *priv,
> > > > > > +                             u32 desired_pll_freq_kbps, u32 re=
ference_freq_khz)
> > > > > > +{
> > > > > > +     u32 div_factor =3D 1, mul_factor, fr =3D 0;
> > > > > > +
> > > > > > +     while (reference_freq_khz / (div_factor + 1) >=3D SSD2825=
_REF_MIN_CLK)
> > > > > > +             div_factor++;
> > > > > > +     if (div_factor > 31)
> > > > > > +             div_factor =3D 31;
> > > > > > +
> > > > > > +     mul_factor =3D DIV_ROUND_UP(desired_pll_freq_kbps * div_f=
actor,
> > > > > > +                               reference_freq_khz);
> > > > > > +
> > > > > > +     priv->pll_freq_kbps =3D reference_freq_khz * mul_factor /=
 div_factor;
> > > > > > +     priv->nibble_freq_khz =3D priv->pll_freq_kbps / 4;
> > > > > > +
> > > > > > +     if (priv->pll_freq_kbps >=3D 501000)
> > > > > > +             fr =3D 3;
> > > > > > +     else if (priv->pll_freq_kbps >=3D 251000)
> > > > > > +             fr =3D 2;
> > > > > > +     else if (priv->pll_freq_kbps >=3D 126000)
> > > > > > +             fr =3D 1;
> > > > > > +
> > > > > > +     return (fr << 14) | (div_factor << 8) | mul_factor;
> > > > > > +}
> > > > > > +
> > > > > > +static u32 ssd2825_to_ns(u32 khz)
> > > > > > +{
> > > > > > +     return (1000 * 1000 / khz);
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_setup_pll(struct ssd2825_priv *priv,
> > > > > > +                          const struct drm_display_mode *mode)
> > > > > > +{
> > > > > > +     u16 pll_config, lp_div;
> > > > > > +     u32 nibble_delay, pclk_mult, tx_freq_khz;
> > > > > > +     u8 hzd, hpd;
> > > > > > +
> > > > > > +     tx_freq_khz =3D clk_get_rate(priv->tx_clk) / 1000;
> > > > > > +     if (!tx_freq_khz)
> > > > > > +             tx_freq_khz =3D SSD2825_REF_MIN_CLK;
> > > > > > +
> > > > > > +     pclk_mult =3D priv->pd_lines / priv->dsi_lanes + 1;
> > > > > > +     pll_config =3D construct_pll_config(priv, pclk_mult * mod=
e->clock,
> > > > > > +                                       tx_freq_khz);
> > > > > > +
> > > > > > +     lp_div =3D priv->pll_freq_kbps / (SSD2825_LP_MIN_CLK * 8)=
;
> > > > > > +
> > > > > > +     nibble_delay =3D ssd2825_to_ns(priv->nibble_freq_khz);
> > > > > > +
> > > > > > +     hzd =3D priv->hzd / nibble_delay;
> > > > > > +     hpd =3D (priv->hpd - 4 * nibble_delay) / nibble_delay;
> > > > > > +
> > > > > > +     /* Disable PLL */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0000);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_LINE_CTRL_REG, 0x0001);
> > > > > > +
> > > > > > +     /* Set delays */
> > > > > > +     dev_dbg(priv->dev, "SSD2825_DELAY_ADJ_REG_1 0x%x\n", (hzd=
 << 8) | hpd);
> > > > >
> > > > > From v1:
> > > > >
> > > > > drm_dbg_driver() ?
> > > > >
> > > >
> > > > Not sure if drm_dbg_driver is needed, dev_dbg is not enough?
> > >
> > > It's a DRM driver, so it's better to use drm-specific debug prints.
> > >
> >
> > Acknowledged, though I used those debugs only to check if
> > configuration is done correctly, they may be removed.
> >
> > > >
> > > > >
> > > > > > +     ssd2825_write_reg(priv, SSD2825_DELAY_ADJ_REG_1, (hzd << =
8) | hpd);
> > > > > > +
> > > > > > +     /* Set PLL coeficients */
> > > > > > +     dev_dbg(priv->dev, "SSD2825_PLL_CONFIGURATION_REG 0x%x\n"=
, pll_config);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_PLL_CONFIGURATION_REG, pl=
l_config);
> > > > > > +
> > > > > > +     /* Clock Control Register */
> > > > > > +     dev_dbg(priv->dev, "SSD2825_CLOCK_CTRL_REG 0x%x\n",
> > > > > > +             SSD2828_LP_CLOCK_DIVIDER(lp_div));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_CLOCK_CTRL_REG,
> > > > > > +                       SSD2828_LP_CLOCK_DIVIDER(lp_div));
> > > > > > +
> > > > > > +     /* Enable PLL */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge=
 *bridge,
> > > > > > +                                          struct drm_bridge_st=
ate *old_bridge_state)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (priv->enabled)
> > > > > > +             return;
> > > > > > +
> > > > > > +     /* Power Sequence */
> > > > > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > > > > +     if (ret < 0)
> > > > > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n"=
, ret);
> > > > > > +
> > > > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies=
), priv->supplies);
> > > > > > +     if (ret < 0)
> > > > > > +             dev_err(priv->dev, "error enabling regulators (%d=
)\n", ret);
> > > > > > +
> > > > > > +     usleep_range(1000, 2000);
> > > > > > +
> > > > > > +     ssd2825_hw_reset(priv);
> > > > > > +
> > > > > > +     priv->enabled =3D true;
> > > > > > +}
> > > > > > +
> > > > > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *br=
idge,
> > > > > > +                                      struct drm_bridge_state =
*old_bridge_state)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > > +     struct device *dev =3D priv->dev;
> > > > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > > > +     struct drm_atomic_state *state =3D old_bridge_state->base=
.state;
> > > > > > +     const struct drm_crtc_state *crtc_state;
> > > > > > +     const struct drm_display_mode *mode;
> > > > > > +     struct drm_connector *connector;
> > > > > > +     struct drm_crtc *crtc;
> > > > > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > > > > +     u16 flags =3D 0;
> > > > > > +     u8 pixel_format;
> > > > > > +
> > > > > > +     /* Filter unimplemeted modes before RGB control registers=
 configuration */
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) =
{
> > > > > > +             dev_warn_once(dev,
> > > > > > +                           "Non-continuous mode unimplemented,=
 falling back to continuous\n");
> > > > > > +             dsi_dev->mode_flags &=3D ~MIPI_DSI_CLOCK_NON_CONT=
INUOUS;
> > > > > > +     }
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> > > > > > +             dev_warn_once(dev,
> > > > > > +                           "Burst mode unimplemented, falling =
back to simple\n");
> > > > > > +             dsi_dev->mode_flags &=3D ~MIPI_DSI_MODE_VIDEO_BUR=
ST;
> > > > > > +     }
> > > > >
> > > > >
> > > > > But you have implemented it already, several lines below.
> > > > >
> > > >
> > > > Fair
> > > >
> > > > > Also such checks should really go to .atomic_check() or
> > > > > ssd2825_dsi_host_attach().
> > > > >
> > > >
> > > > Fair, but RGB control registers configuration is done in this funct=
ion
> > > > and there is a need to know DSI video mode for correct configuratio=
n.
> > >
> > > It's necessary to know it, it's true. However you should reject inval=
id
> > > configurations instead of manually patching those.
> > >
> >
> > Bridge supports more modes then there are implemented, I cannot
> > implement more just because I do not have enough test base. This
> > patching is more like fallback into currently supported mode.
> >
> > > >
> > > > > > +
> > > > > > +     /* Perform SW reset */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x010=
0);
> > > > > > +
> > > > > > +     /* Set pixel format */
> > > > > > +     switch (dsi_dev->format) {
> > > > > > +     case MIPI_DSI_FMT_RGB565:
> > > > > > +             pixel_format =3D 0x00;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > > > > +             pixel_format =3D 0x01;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB666:
> > > > > > +             pixel_format =3D 0x02;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB888:
> > > > > > +     default:
> > > > > > +             pixel_format =3D 0x03;
> > > > > > +             break;
> > > > > > +     }
> > > > > > +
> > > > > > +     connector =3D drm_atomic_get_new_connector_for_encoder(st=
ate,
> > > > > > +                                                          brid=
ge->encoder);
> > > > > > +     crtc =3D drm_atomic_get_new_connector_state(state, connec=
tor)->crtc;
> > > > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc)=
;
> > > > > > +     mode =3D &crtc_state->adjusted_mode;
> > > > > > +
> > > > > > +     /* Set panel timings */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > > > > +                       ((mode->vtotal - mode->vsync_end) << 8)=
 |
> > > > > > +                       (mode->htotal - mode->hsync_end));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > > > > +                       ((mode->vtotal - mode->vsync_start) << =
8) |
> > > > > > +                       (mode->htotal - mode->hsync_start));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > > > > +                       ((mode->vsync_start - mode->vdisplay) <=
< 8) |
> > > > > > +                       (mode->hsync_start - mode->hdisplay));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4,=
 mode->hdisplay);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5,=
 mode->vdisplay);
> > > > > > +
> > > > > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > > > > +
> > > > > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > > > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > > > > > +             flags |=3D SSD2825_BURST;
> > > > > > +
> > > > > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE=
)
> > > > > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > > > > +
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6,=
 flags | pixel_format);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, d=
si_dev->lanes - 1);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > > > > +
> > > > > > +     /* Call PLL configuration */
> > > > > > +     ssd2825_setup_pll(priv, mode);
> > > > > > +
> > > > > > +     usleep_range(10000, 11000);
> > > > > > +
> > > > > > +     /* Initial DSI configuration register set */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> > > > > > +                       SSD2825_CONF_REG_CKE | SSD2825_CONF_REG=
_DCS |
> > > > > > +                       SSD2825_CONF_REG_ECD | SSD2825_CONF_REG=
_EOT);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > > > +}
> > > > > > +
> > > > > > +static void ssd2825_bridge_atomic_disable(struct drm_bridge *b=
ridge,
> > > > > > +                                       struct drm_bridge_state=
 *old_bridge_state)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (!priv->enabled)
> > > > > > +             return;
> > > > > > +
> > > > > > +     msleep(100);
> > > > > > +
> > > > > > +     /* Exit DSI configuration register set */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> > > > > > +                       SSD2825_CONF_REG_ECD | SSD2825_CONF_REG=
_EOT);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > > > +
> > > > > > +     /* HW disable */
> > > > > > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > > > > +     usleep_range(5000, 6000);
> > > > > > +
> > > > > > +     ret =3D regulator_bulk_disable(ARRAY_SIZE(ssd2825_supplie=
s),
> > > > > > +                                  priv->supplies);
> > > > > > +     if (ret < 0)
> > > > > > +             dev_err(priv->dev, "error disabling regulators (%=
d)\n", ret);
> > > > > > +
> > > > > > +     clk_disable_unprepare(priv->tx_clk);
> > > > > > +
> > > > > > +     priv->enabled =3D false;
> > > > > > +}
> > > > > > +
> > > > > > +static int ssd2825_bridge_attach(struct drm_bridge *bridge,
> > > > > > +                              enum drm_bridge_attach_flags fla=
gs)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > > +
> > > > > > +     return drm_bridge_attach(bridge->encoder, priv->output.br=
idge, bridge,
> > > > > > +                              flags);
> > > > > > +}
> > > > > > +
> > > > > > +static enum drm_mode_status
> > > > > > +ssd2825_bridge_mode_valid(struct drm_bridge *bridge,
> > > > > > +                       const struct drm_display_info *info,
> > > > > > +                       const struct drm_display_mode *mode)
> > > > > > +{
> > > > > > +     struct videomode vm;
> > > > > > +
> > > > > > +     drm_display_mode_to_videomode(mode, &vm);
> > > > > > +
> > > > > > +     /* maximum bit field size is 0xff apart active area which=
 is 0xffff */
> > > > > > +     if (vm.hsync_len > 0xff || vm.hback_porch > 0xff ||
> > > > > > +         vm.hfront_porch > 0xff || vm.hactive > 0xffff)
> > > > >
> > > > > Some of these limitations are artificial or don't match the specs=
:
> > > > >
> > > > > Maximum pixels per display row  1366    2560
> > > > >
> > > > > etc.
> > > > >
> > > >
> > > > 1366 and 2560 still fit into u16 which is maximum size of v/hactive=
. I
> > > > took those bit field  sizes from datasheet.
> > >
> > > Yes. It's other way around: according to the web site modes above 136=
6x
> > > (or 2560x for ssd2828) should be rejected, while the driver doesn't d=
o
> > > it.
> > >
> >
> > Oh, datasheet did not mention supported modes, lemmy verify this info.
> > Thank you.
> >
> > > >
> > > > > > +             return MODE_H_ILLEGAL;
> > > > > > +
> > > > > > +     if (vm.vsync_len > 0xff || vm.vback_porch > 0xff ||
> > > > > > +         vm.vfront_porch > 0xff || vm.vactive > 0xffff)
> > > > > > +             return MODE_V_ILLEGAL;
> > > > > > +
> > > > > > +     return MODE_OK;
> > > > > > +}
> > > > > > +
> > > > > > +static bool ssd2825_mode_fixup(struct drm_bridge *bridge,
> > > > > > +                            const struct drm_display_mode *mod=
e,
> > > > > > +                            struct drm_display_mode *adjusted_=
mode)
> > > > > > +{
> > > > > > +     /* Default to positive sync */
> > > > > > +
> > > > > > +     if (!(adjusted_mode->flags &
> > > > > > +           (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
> > > > > > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PHSYNC;
> > > > > > +
> > > > > > +     if (!(adjusted_mode->flags &
> > > > > > +           (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
> > > > > > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PVSYNC;
> > > > >
> > > > > Why? I think that it is an error for the mode not to have one of =
those
> > > > > flags. Do you have an actual usecase?
> > > > >
> > > >
> > > > Yes, LG Optimus 4G P880 and Optimus Vu P895 both use this bridge an=
d
> > > > require positive v/hsync to work. I am not sure if it is a good ide=
a
> > > > to add those flags to panel driver.
> > >
> > > Okay, so you are setting the flags for the DPI host. I'd suggest you =
to
> > > drop the conditionals (as the DSI sync flags are of no concern to you=
r
> > > host-bridge link) and set the PVSYNC / PHSYNC unconditionally. Add a
> > > comment, describing the reason.
> > >
> >
> > May I keep the conditionals? They work for me and, in case someone
> > else would use this bridge, forcing PVSYNC / PHSYNC may cause
> > troubles.
> >
> > > > > > +
> > > > > > +     return true;
> > > > > > +}
> > > > > > +
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
