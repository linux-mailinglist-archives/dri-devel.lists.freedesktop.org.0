Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCF21803F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8D6E865;
	Wed,  8 Jul 2020 07:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A7789F97
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:25:54 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id a12so42278321ion.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rm4esQH4gGgBnHSmLz7HpP+dohtuPuXI8uHawGZShE0=;
 b=NXshOtBzUR0F4+q5y7EFQv5a/sDjE7PijWDL3wHmyTLOLa2PPl1s5owjj3nhoLl9/8
 Wa0+8bgcRHbMmqOPAgKei5CNFWSS04B7BtpwMBX45yghuP/ukczQIfssjWK7rUgnrz8O
 p2EQbsuTySZFRYWnsRc1fZ2CqqB7HJqQ3yxQDIRW/sqUYliZmTmDXV68cADtcRTRcREH
 xDFFeXv9I3c8pw/w7xZAl4XggWOpK/aAhrK70DBJpl6U+eChyQbJFbpGJBSkS0p7u6vu
 2PdNCv/yX6X7juLguD8svTb7Tv+VxcbJRqBm+sEQPLRyGsVvmdO34uFt0d/Gcm3FiYPH
 e1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rm4esQH4gGgBnHSmLz7HpP+dohtuPuXI8uHawGZShE0=;
 b=bO590lmDyxilqmTyfcM/Kr2V51vP0jYCDiwtLt/TnginEV4FVhu9Xp5fUcrnMsMdk4
 eUkXsLNJ9zfNW0te10CSXPWaIC/oMdAtuk5/x309DxIkIYLVtPfSiHelXOUpz7H3bZi0
 /5Aay3+nEfs5Trir8iYohSwabjRAHuMQoAa8ZRJqO175wjdnLCIUB6hJsXdqp0fYFb6b
 YVEQZZFTnohTNxfTe4C/inu3FQAvrdvbPyBqLItQNwOAi276Q94GjLe1+ROq7O5Dimu3
 ywtwP67COB5jmETLjVDahlay8dVCY4/qzb21mlhYnUHAYUYHsLymMxN6Z+w+u52Iv6Uf
 nNNA==
X-Gm-Message-State: AOAM531cq4vFIiwiKTlLD9D2f2il8fn0uHtXwt7dNop0cp5D8p6R/Klh
 KvRGNAyfb4na3oJH6QZQ0KGwjkht3tFz6aicwQM=
X-Google-Smtp-Source: ABdhPJzcfG1EM2J3soHVZA7YGyrPCeDQnKJZ5w1XVj/QW83WIxEpVU6pZaXlZlu/jtDuNRiZc2R989Bov4gQiyaQHZg=
X-Received: by 2002:a02:6c4c:: with SMTP id w73mr59524760jab.26.1594110353537; 
 Tue, 07 Jul 2020 01:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200704092511.20856-1-simhavcs@gmail.com>
 <CGME20200706072016eucas1p1db7edc4b5aef0809d624c41bc9311f1f@eucas1p1.samsung.com>
 <20200704092511.20856-2-simhavcs@gmail.com>
 <c488bf6c-d8bf-58be-43c8-c88aa94a9965@samsung.com>
In-Reply-To: <c488bf6c-d8bf-58be-43c8-c88aa94a9965@samsung.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 7 Jul 2020 13:55:42 +0530
Message-ID: <CAGWqDJ7DSf9RSBTr4vmy0zmUa8gZVuOZy_TGt9Vd=cF5Mdc9KA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0949314542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0949314542==
Content-Type: multipart/alternative; boundary="0000000000005b00a805a9d5bd43"

--0000000000005b00a805a9d5bd43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrzej,

Please suggest.

In general it should be in the reverse-order RESX then STBY, But
As per the spec Datasheet Power off sequence is this Page 149, Section
Power Supply On and Off Sequence

regulators
STBY
RESX

https://www.google.com/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&cd=3D&=
ved=3D2ahUKEwiBmeWb2brqAhXO7HMBHZgaCTUQFjACegQIBxAB&url=3Dhttps%3A%2F%2Fdow=
nload.t-firefly.com%2Fproduct%2FRK3399%2FDocs%2FChip%2520Specifications%2FT=
C358774XBG_75XBG_V1%25204nm.pdf&usg=3DAOvVaw2kBuPv8FaZBNynGWCQHEfc

Regarding data-lanes
-data-lanes value does appear later from the mdp->dsi0 tree
-We need to pick dynamically data-lanes of the dsi set, based on this we
need to set in the bridge.
Otherwise we are already setting in dsi0 ports as <0 1 2 3> , again we need
to set it in the bridge tree.
- There is no helper function to get the data-lanes of the DSI

On Tue, Jul 7, 2020 at 12:15 PM Andrzej Hajda <a.hajda@samsung.com> wrote:

>
> On 04.07.2020 11:24, Vinay Simha BN wrote:
> > This driver is tested with two panels individually with Apq8016-IFC6309
> board
> >
> https://protect2.fireeye.com/url?k=3Dfe87a8ec-a3e0ecca-fe8623a3-0cc47a313=
84a-ffbc547df1141490&q=3D1&u=3Dhttps%3A%2F%2Fwww.inforcecomputing.com%2Fpro=
ducts%2Fsingle-board-computers-sbc%2Fqualcomm-snapdragon-410-inforce-6309-m=
icro-sbc
> >
> > 1. 1366x768@60 auo,b101xtn01 data-mapping =3D "jeida-24"
> > 2. 800x480@60 innolux,at070tn92 data-mapping =3D "vesa-24"
> >
> > - added SPDX identifier license
> > - updated alphabetic order of headers
> > - replaced u32 instead of uint32_t
> > - magic number to macros for CLRSI and mux registers
> > - mdelay to usleep_range
> > - added bus_formats
> > - removed drm_connector_status
> > - regulator enable and disable with proper orders and delays
> >    as per the spec
> > - devm_drm_panel_bridge_add method used instead of panel
> >    description modified
> > - dual port implemented
> > - panel->connector_type removed
> > - ~vsdelay dynamic value set based on the
> >    calculation of dsi speed, output speed, blanking
> > - help modified
> > - display_timings naming local variables
> > - check for bus_formats unsupported
> > - error handling enpoint data-lanes
> > - Kconfig proper indentation
> > - GENMASK and FIELD_PREP used
> > - bus_formats handeld in mode_valid
> > - MODE_CLOCK_HIGH handled properly
> > - len initialized
> > - static function for mode_valid
> >
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > ---
> > v1:
> >   Initial version
> >
> > v2:
> > * Andrzej Hajda review comments incorporated
> >    SPDX identifier
> >    development debug removed
> >    alphabetic order headers
> >    u32 instead of unit32_t
> >    magic numbers to macros for CLRSI and mux registers
> >    ignored return value
> >
> > * Laurent Pinchart review comments incorporated
> >    mdelay to usleep_range
> >    bus_formats added
> >
> > v3:
> > * Andrzej Hajda review comments incorporated
> >    drm_connector_status removed
> >    u32 rev removed and local variabl is used
> >    regulator enable disable with proper orders and delays
> >    as per the spec
> >    devm_drm_panel_bridge_add method used instead of panel
> >    description modified
> >    dual port implemented
> >
> > v4:
> > * Sam Ravnborg review comments incorporated
> >    panel->connector_type removed
> >
> > * Reported-by: kernel test robot <lkp@intel.com>
> >    parse_dt to static function
> >    removed the if (endpoint), since data-lanes has to be
> >    present for dsi dts ports
> >
> > v5:
> >    ~vsdelay dynamic value set based on the
> >    calculation of dsi speed, output speed, blanking
> >
> > v6:
> > * Sam Ravnborg review comments incorporated
> >    help modified
> >    display_timings naming local variables
> >    check for bus_formats unsupported
> >    error handling enpoint data-lanes
> >
> > v7:
> > * Sam Ravnborg review comments incorporated
> >    Kconfig proper indentation
> >    GENMASK and FIELD_PREP used
> >    bus_formats handeld in mode_valid
> >    MODE_CLOCK_HIGH handled properly
> >
> > * Reported-by: kernel test robot <lkp@intel.com>
> >    len initialized
> >    static function for mode_valid
> > ---
> >   drivers/gpu/drm/bridge/Kconfig    |  10 +
> >   drivers/gpu/drm/bridge/Makefile   |   1 +
> >   drivers/gpu/drm/bridge/tc358775.c | 757 +++++++++++++++++++++++++++++=
+
> >   3 files changed, 768 insertions(+)
> >   create mode 100644 drivers/gpu/drm/bridge/tc358775.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> > index 43271c21d3fc..25c3097c4003 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -181,6 +181,16 @@ config DRM_TOSHIBA_TC358768
> >       help
> >         Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
> >
> > +config DRM_TOSHIBA_TC358775
> > +     tristate "Toshiba TC358775 DSI/LVDS bridge"
> > +     depends on OF
> > +     select DRM_KMS_HELPER
> > +     select REGMAP_I2C
> > +     select DRM_PANEL
> > +     select DRM_MIPI_DSI
> > +     help
> > +       Toshiba TC358775 DSI/LVDS bridge chip driver.
> > +
> >   config DRM_TI_TFP410
> >       tristate "TI TFP410 DVI/HDMI bridge"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile
> b/drivers/gpu/drm/bridge/Makefile
> > index d63d4b7e4347..23c770b3bfe4 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd102=
4.o
> >   obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o
> >   obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o
> >   obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=3D tc358768.o
> > +obj-$(CONFIG_DRM_TOSHIBA_TC358775) +=3D tc358775.o
> >   obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
> >   obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
> >   obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> > new file mode 100644
> > index 000000000000..6494179369a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > @@ -0,0 +1,757 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * tc358775 DSI to LVDS bridge driver
> > + *
> > + * Copyright (C) 2020 SMART Wireless Computing
> > + * Author: Vinay Simha BN <simhavcs@gmail.com>
> > + *
> > + */
> > +/* #define DEBUG */
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_dp_helper.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)
> > +
> > +/* Registers */
> > +
> > +/* DSI D-PHY Layer Registers */
> > +#define D0W_DPHYCONTTX  0x0004  /* Data Lane 0 DPHY Tx Control */
> > +#define CLW_DPHYCONTRX  0x0020  /* Clock Lane DPHY Rx Control */
> > +#define D0W_DPHYCONTRX  0x0024  /* Data Lane 0 DPHY Rx Control */
> > +#define D1W_DPHYCONTRX  0x0028  /* Data Lane 1 DPHY Rx Control */
> > +#define D2W_DPHYCONTRX  0x002C  /* Data Lane 2 DPHY Rx Control */
> > +#define D3W_DPHYCONTRX  0x0030  /* Data Lane 3 DPHY Rx Control */
> > +#define COM_DPHYCONTRX  0x0038  /* DPHY Rx Common Control */
> > +#define CLW_CNTRL       0x0040  /* Clock Lane Control */
> > +#define D0W_CNTRL       0x0044  /* Data Lane 0 Control */
> > +#define D1W_CNTRL       0x0048  /* Data Lane 1 Control */
> > +#define D2W_CNTRL       0x004C  /* Data Lane 2 Control */
> > +#define D3W_CNTRL       0x0050  /* Data Lane 3 Control */
> > +#define DFTMODE_CNTRL   0x0054  /* DFT Mode Control */
> > +
> > +/* DSI PPI Layer Registers */
> > +#define PPI_STARTPPI    0x0104  /* START control bit of PPI-TX
> function. */
> > +#define PPI_START_FUNCTION      1
> > +
> > +#define PPI_BUSYPPI     0x0108
> > +#define PPI_LINEINITCNT 0x0110  /* Line Initialization Wait Counter  *=
/
> > +#define PPI_LPTXTIMECNT 0x0114
> > +#define PPI_LANEENABLE  0x0134  /* Enables each lane at the PPI layer.
> */
> > +#define PPI_TX_RX_TA    0x013C  /* DSI Bus Turn Around timing
> parameters */
> > +
> > +/* Analog timer function enable */
> > +#define PPI_CLS_ATMR    0x0140  /* Delay for Clock Lane in LPRX  */
> > +#define PPI_D0S_ATMR    0x0144  /* Delay for Data Lane 0 in LPRX */
> > +#define PPI_D1S_ATMR    0x0148  /* Delay for Data Lane 1 in LPRX */
> > +#define PPI_D2S_ATMR    0x014C  /* Delay for Data Lane 2 in LPRX */
> > +#define PPI_D3S_ATMR    0x0150  /* Delay for Data Lane 3 in LPRX */
> > +
> > +#define PPI_D0S_CLRSIPOCOUNT    0x0164  /* For lane 0 */
> > +#define PPI_D1S_CLRSIPOCOUNT    0x0168  /* For lane 1 */
> > +#define PPI_D2S_CLRSIPOCOUNT    0x016C  /* For lane 2 */
> > +#define PPI_D3S_CLRSIPOCOUNT    0x0170  /* For lane 3 */
> > +
> > +#define CLS_PRE         0x0180  /* Digital Counter inside of PHY IO */
> > +#define D0S_PRE         0x0184  /* Digital Counter inside of PHY IO */
> > +#define D1S_PRE         0x0188  /* Digital Counter inside of PHY IO */
> > +#define D2S_PRE         0x018C  /* Digital Counter inside of PHY IO */
> > +#define D3S_PRE         0x0190  /* Digital Counter inside of PHY IO */
> > +#define CLS_PREP        0x01A0  /* Digital Counter inside of PHY IO */
> > +#define D0S_PREP        0x01A4  /* Digital Counter inside of PHY IO */
> > +#define D1S_PREP        0x01A8  /* Digital Counter inside of PHY IO */
> > +#define D2S_PREP        0x01AC  /* Digital Counter inside of PHY IO */
> > +#define D3S_PREP        0x01B0  /* Digital Counter inside of PHY IO */
> > +#define CLS_ZERO        0x01C0  /* Digital Counter inside of PHY IO */
> > +#define D0S_ZERO        0x01C4  /* Digital Counter inside of PHY IO */
> > +#define D1S_ZERO        0x01C8  /* Digital Counter inside of PHY IO */
> > +#define D2S_ZERO        0x01CC  /* Digital Counter inside of PHY IO */
> > +#define D3S_ZERO        0x01D0  /* Digital Counter inside of PHY IO */
> > +
> > +#define PPI_CLRFLG      0x01E0  /* PRE Counters has reached set values
> */
> > +#define PPI_CLRSIPO     0x01E4  /* Clear SIPO values, Slave mode use
> only. */
> > +#define HSTIMEOUT       0x01F0  /* HS Rx Time Out Counter */
> > +#define HSTIMEOUTENABLE 0x01F4  /* Enable HS Rx Time Out Counter */
> > +#define DSI_STARTDSI    0x0204  /* START control bit of DSI-TX functio=
n
> */
> > +#define DSI_RX_START 1
> > +
> > +#define DSI_BUSYDSI     0x0208
> > +#define DSI_LANEENABLE  0x0210  /* Enables each lane at the Protocol
> layer. */
> > +#define DSI_LANESTATUS0 0x0214  /* Displays lane is in HS RX mode. */
> > +#define DSI_LANESTATUS1 0x0218  /* Displays lane is in ULPS or STOP
> state */
> > +
> > +#define DSI_INTSTATUS   0x0220  /* Interrupt Status */
> > +#define DSI_INTMASK     0x0224  /* Interrupt Mask */
> > +#define DSI_INTCLR      0x0228  /* Interrupt Clear */
> > +#define DSI_LPTXTO      0x0230  /* Low Power Tx Time Out Counter */
> > +
> > +#define DSIERRCNT       0x0300  /* DSI Error Count */
> > +#define APLCTRL         0x0400  /* Application Layer Control */
> > +#define RDPKTLN         0x0404  /* Command Read Packet Length */
> > +
> > +#define VPCTRL          0x0450  /* Video Path Control */
> > +#define HTIM1           0x0454  /* Horizontal Timing Control 1 */
> > +#define HTIM2           0x0458  /* Horizontal Timing Control 2 */
> > +#define VTIM1           0x045C  /* Vertical Timing Control 1 */
> > +#define VTIM2           0x0460  /* Vertical Timing Control 2 */
> > +#define VFUEN           0x0464  /* Video Frame Timing Update Enable */
> > +#define VFUEN_EN     BIT(0)  /* Upload Enable */
> > +
> > +/* Mux Input Select for LVDS LINK Input */
> > +#define LV_MX0003        0x0480  /* Bit 0 to 3 */
> > +#define LV_MX0407        0x0484  /* Bit 4 to 7 */
> > +#define LV_MX0811        0x0488  /* Bit 8 to 11 */
> > +#define LV_MX1215        0x048C  /* Bit 12 to 15 */
> > +#define LV_MX1619        0x0490  /* Bit 16 to 19 */
> > +#define LV_MX2023        0x0494  /* Bit 20 to 23 */
> > +#define LV_MX2427        0x0498  /* Bit 24 to 27 */
> > +#define LV_MX(b0, b1, b2, b3)        (FLD_VAL(b0, 4, 0) | FLD_VAL(b1,
> 12, 8) | \
> > +                             FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24)=
)
> > +
> > +/* Input bit numbers used in mux registers */
> > +enum {
> > +     LVI_R0,
> > +     LVI_R1,
> > +     LVI_R2,
> > +     LVI_R3,
> > +     LVI_R4,
> > +     LVI_R5,
> > +     LVI_R6,
> > +     LVI_R7,
> > +     LVI_G0,
> > +     LVI_G1,
> > +     LVI_G2,
> > +     LVI_G3,
> > +     LVI_G4,
> > +     LVI_G5,
> > +     LVI_G6,
> > +     LVI_G7,
> > +     LVI_B0,
> > +     LVI_B1,
> > +     LVI_B2,
> > +     LVI_B3,
> > +     LVI_B4,
> > +     LVI_B5,
> > +     LVI_B6,
> > +     LVI_B7,
> > +     LVI_HS,
> > +     LVI_VS,
> > +     LVI_DE,
> > +     LVI_L0
> > +};
> > +
> > +#define LVCFG           0x049C  /* LVDS Configuration  */
> > +#define LVPHY0          0x04A0  /* LVDS PHY 0 */
> > +#define LV_PHY0_RST(v)          FLD_VAL(v, 22, 22) /* PHY reset */
> > +#define LV_PHY0_IS(v)           FLD_VAL(v, 15, 14)
> > +#define LV_PHY0_ND(v)           FLD_VAL(v, 4, 0) /* Frequency range
> select */
> > +#define LV_PHY0_PRBS_ON(v)      FLD_VAL(v, 20, 16) /* Clock/Data Flag
> pins */
> > +
> > +#define LVPHY1          0x04A4  /* LVDS PHY 1 */
> > +#define SYSSTAT         0x0500  /* System Status  */
> > +#define SYSRST          0x0504  /* System Reset  */
> > +
> > +#define SYS_RST_I2CS BIT(0) /* Reset I2C-Slave controller */
> > +#define SYS_RST_I2CM BIT(1) /* Reset I2C-Master controller */
> > +#define SYS_RST_LCD  BIT(2) /* Reset LCD controller */
> > +#define SYS_RST_BM   BIT(3) /* Reset Bus Management controller */
> > +#define SYS_RST_DSIRX        BIT(4) /* Reset DSI-RX and App controller
> */
> > +#define SYS_RST_REG  BIT(5) /* Reset Register module */
> > +
> > +/* GPIO Registers */
> > +#define GPIOC           0x0520  /* GPIO Control  */
> > +#define GPIOO           0x0524  /* GPIO Output  */
> > +#define GPIOI           0x0528  /* GPIO Input  */
> > +
> > +/* I2C Registers */
> > +#define I2CTIMCTRL      0x0540  /* I2C IF Timing and Enable Control */
> > +#define I2CMADDR        0x0544  /* I2C Master Addressing */
> > +#define WDATAQ          0x0548  /* Write Data Queue */
> > +#define RDATAQ          0x054C  /* Read Data Queue */
> > +
> > +/* Chip ID and Revision ID Register */
> > +#define IDREG           0x0580
> > +
> > +#define LPX_PERIOD           4
> > +#define TTA_GET                      0x40000
> > +#define TTA_SURE             6
> > +#define SINGLE_LINK          1
> > +#define DUAL_LINK            2
> > +
> > +#define TC358775XBG_ID  0x00007500
> > +
> > +/* Debug Registers */
> > +#define DEBUG00         0x05A0  /* Debug */
> > +#define DEBUG01         0x05A4  /* LVDS Data */
> > +
> > +#define DSI_CLEN_BIT         BIT(0)
> > +#define DIVIDE_BY_3          3 /* PCLK=3DDCLK/3 */
> > +#define DIVIDE_BY_6          6 /* PCLK=3DDCLK/6 */
> > +#define LVCFG_LVEN_BIT               BIT(0)
> > +
> > +#define L0EN BIT(1)
> > +
> > +#define TC358775_VPCTRL_VSDELAY__MASK        0x3FF00000
> > +#define TC358775_VPCTRL_VSDELAY__SHIFT       20
> > +static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
> > +{
> > +     return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
> > +                     TC358775_VPCTRL_VSDELAY__MASK;
> > +}
> > +
> > +#define TC358775_VPCTRL_OPXLFMT__MASK        0x00000100
> > +#define TC358775_VPCTRL_OPXLFMT__SHIFT       8
> > +static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
> > +{
> > +     return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
> > +                     TC358775_VPCTRL_OPXLFMT__MASK;
> > +}
> > +
> > +#define TC358775_VPCTRL_MSF__MASK    0x00000001
> > +#define TC358775_VPCTRL_MSF__SHIFT   0
> > +static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
> > +{
> > +     return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
> > +                     TC358775_VPCTRL_MSF__MASK;
> > +}
> > +
> > +#define TC358775_LVCFG_PCLKDIV__MASK 0x000000f0
> > +#define TC358775_LVCFG_PCLKDIV__SHIFT        4
> > +static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> > +{
> > +     return ((val) << TC358775_LVCFG_PCLKDIV__SHIFT) &
> > +                     TC358775_LVCFG_PCLKDIV__MASK;
> > +}
> > +
> > +#define TC358775_LVCFG_LVDLINK__MASK                         0x0000000=
2
> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> > +static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> > +{
> > +     return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> > +                     TC358775_LVCFG_LVDLINK__MASK;
> > +}
> > +
> > +enum tc358775_ports {
> > +     TC358775_DSI_IN,
> > +     TC358775_LVDS_OUT0,
> > +     TC358775_LVDS_OUT1,
> > +};
> > +
> > +struct tc_data {
> > +     struct i2c_client       *i2c;
> > +     struct device           *dev;
> > +
> > +     struct drm_bridge       bridge;
> > +     struct drm_bridge       *panel_bridge;
> > +
> > +     struct device_node *host_node;
> > +     struct mipi_dsi_device *dsi;
> > +     u8 num_dsi_lanes;
> > +
> > +     struct regulator        *vdd;
> > +     struct regulator        *vddio;
> > +     struct gpio_desc        *reset_gpio;
> > +     struct gpio_desc        *stby_gpio;
> > +     u8                      lvds_link; /* single-link or dual-link */
> > +     u8                      bpc;
> > +};
> > +
> > +static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> > +{
> > +     return container_of(b, struct tc_data, bridge);
> > +}
> > +
> > +static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +     struct tc_data *tc =3D bridge_to_tc(bridge);
> > +     struct device *dev =3D &tc->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D regulator_enable(tc->vddio);
> > +     if (ret < 0)
> > +             dev_err(dev, "regulator vddio enable failed, %d\n", ret);
> > +     usleep_range(10000, 11000);
> > +
> > +     ret =3D regulator_enable(tc->vdd);
> > +     if (ret < 0)
> > +             dev_err(dev, "regulator vdd enable failed, %d\n", ret);
> > +     usleep_range(10000, 11000);
> > +
> > +     gpiod_set_value(tc->stby_gpio, 0);
> > +     usleep_range(10000, 11000);
> > +
> > +     gpiod_set_value(tc->reset_gpio, 0);
> > +     usleep_range(10, 20);
> > +}
> > +
> > +static void tc_bridge_post_disable(struct drm_bridge *bridge)
> > +{
> > +     struct tc_data *tc =3D bridge_to_tc(bridge);
> > +     struct device *dev =3D &tc->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D regulator_disable(tc->vddio);
> > +     if (ret < 0)
> > +             dev_err(dev, "regulator vddio disable failed, %d\n", ret)=
;
> > +     usleep_range(10000, 11000);
> > +
> > +     ret =3D regulator_disable(tc->vdd);
> > +     if (ret < 0)
> > +             dev_err(dev, "regulator vdd disable failed, %d\n", ret);
> > +     usleep_range(10000, 11000);
> > +
> > +     gpiod_set_value(tc->stby_gpio, 1);
> > +     usleep_range(10000, 11000);
> > +
> > +     gpiod_set_value(tc->reset_gpio, 1);
> > +     usleep_range(10, 20);
>
>
> Power off order is incorrect (I have already commented it at least once).
>
>
> > +}
> > +
> > +static u32 d2l_read(struct i2c_client *i2c, u16 reg)
> > +{
> > +     int ret;
> > +     u8 val[4];
> > +     u8 addr[] =3D {(reg >> 8) & 0xff, reg & 0xff};
> > +     u32 value;
> > +
> > +     ret =3D i2c_master_send(i2c, addr, sizeof(reg));
> > +     if (ret < 0)
> > +             goto fail;
> > +
> > +     ret =3D i2c_master_recv(i2c, val, sizeof(value));
> > +     if (ret < 0)
> > +             goto fail;
> > +
> > +     value =3D val[3] << 24 | val[2] << 16 | val[1] << 8 | val[0];
>
>
> Please use le32_to_cpu or similar macro.
>
>
> > +
> > +     pr_debug("d2l: I2C : reg:%04x value:%08x\n", reg, value);
> > +
> > +     return value;
> > +
> > +fail:
> > +     dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
> > +             ret, reg);
> > +     return 0;
> > +}
> > +
> > +static void d2l_write(struct i2c_client *i2c, u16 reg, u32 val)
> > +{
> > +     u8 buf[6];
> > +     int ret;
> > +
> > +     buf[0] =3D reg >> 8;
> > +     buf[1] =3D reg & 0xFF;
> > +     buf[2] =3D (val >> 0) & 0xFF;
> > +     buf[3] =3D (val >> 8) & 0xFF;
> > +     buf[4] =3D (val >> 16) & 0xFF;
> > +     buf[5] =3D (val >> 24) & 0xFF;
>
>
> put_unaligned_le16(reg, buf);
>
> put_unaligned_le32(reg, buf+2);
>
>
> > +
> > +     ret =3D i2c_master_send(i2c, buf, ARRAY_SIZE(buf));
> > +     if (ret < 0)
> > +             dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n=
",
> > +                     ret, reg);
> > +}
> > +
> > +/* helper function to access bus_formats */
> > +static struct drm_connector *get_connector(struct drm_encoder *encoder=
)
> > +{
> > +     struct drm_device *dev =3D encoder->dev;
> > +     struct drm_connector *connector;
> > +
> > +     list_for_each_entry(connector, &dev->mode_config.connector_list,
> head)
> > +             if (connector->encoder =3D=3D encoder)
> > +                     return connector;
> > +
> > +     return NULL;
> > +}
> > +
> > +static void tc_bridge_enable(struct drm_bridge *bridge)
> > +{
> > +     struct tc_data *tc =3D bridge_to_tc(bridge);
> > +     u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2=
;
> > +     u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2=
;
> > +     u32 val =3D 0;
> > +     u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> > +     struct drm_display_mode *mode;
> > +     struct drm_connector *connector =3D get_connector(bridge->encoder=
);
> > +
> > +     mode =3D &bridge->encoder->crtc->state->adjusted_mode;
> > +
> > +     hback_porch =3D mode->htotal - mode->hsync_end;
> > +     hsync_len  =3D mode->hsync_end - mode->hsync_start;
> > +     vback_porch =3D mode->vtotal - mode->vsync_end;
> > +     vsync_len  =3D mode->vsync_end - mode->vsync_start;
> > +
> > +     htime1 =3D (hback_porch << 16) + hsync_len;
> > +     vtime1 =3D (vback_porch << 16) + vsync_len;
> > +
> > +     hfront_porch =3D mode->hsync_start - mode->hdisplay;
> > +     hactive =3D mode->hdisplay;
> > +     vfront_porch =3D mode->vsync_start - mode->vdisplay;
> > +     vactive =3D mode->vdisplay;
> > +
> > +     htime2 =3D (hfront_porch << 16) + hactive;
> > +     vtime2 =3D (vfront_porch << 16) + vactive;
> > +
> > +     val =3D d2l_read(tc->i2c, IDREG);
> > +
> > +     dev_info(tc->dev, "DSI2LVDS Chip ID.%02x Revision ID. %02x **\n",
> > +              (val >> 8) & 0xFF, val & 0xFF);
> > +
> > +     d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX |
> SYS_RST_BM |
> > +               SYS_RST_LCD | SYS_RST_I2CM | SYS_RST_I2CS);
> > +     usleep_range(30000, 40000);
> > +
> > +     d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> > +     d2l_write(tc->i2c, PPI_LPTXTIMECNT, LPX_PERIOD);
> > +     d2l_write(tc->i2c, PPI_D0S_CLRSIPOCOUNT, 3);
> > +     d2l_write(tc->i2c, PPI_D1S_CLRSIPOCOUNT, 3);
> > +     d2l_write(tc->i2c, PPI_D2S_CLRSIPOCOUNT, 3);
> > +     d2l_write(tc->i2c, PPI_D3S_CLRSIPOCOUNT, 3);
> > +
> > +     val =3D ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
> > +     d2l_write(tc->i2c, PPI_LANEENABLE, val);
> > +     d2l_write(tc->i2c, DSI_LANEENABLE, val);
> > +
> > +     d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
> > +     d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
> > +
> > +     if (tc->bpc =3D=3D 8)
> > +             val =3D TC358775_VPCTRL_OPXLFMT(1);
> > +     else /* bpc =3D 6; */
> > +             val =3D TC358775_VPCTRL_MSF(1);
> > +
> > +     dsiclk =3D mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1=
000;
> > +     clkdiv =3D dsiclk / DIVIDE_BY_3 * tc->lvds_link;
> > +     byteclk =3D dsiclk / 4;
> > +     t1 =3D hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
> > +     t2 =3D ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len +
> hfront_porch) / 1000;
> > +     t3 =3D ((t2 * byteclk) / 100) - (hactive * (tc->bpc * 3 / 8) /
> > +             tc->num_dsi_lanes);
> > +
> > +     vsdelay =3D (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_=
len
> - hactive;
> > +
> > +     val |=3D TC358775_VPCTRL_VSDELAY(vsdelay);
> > +     d2l_write(tc->i2c, VPCTRL, val);
> > +
> > +     d2l_write(tc->i2c, HTIM1, htime1);
> > +     d2l_write(tc->i2c, VTIM1, vtime1);
> > +     d2l_write(tc->i2c, HTIM2, htime2);
> > +     d2l_write(tc->i2c, VTIM2, vtime2);
> > +
> > +     d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> > +     d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
> > +     d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> > +
> > +     dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > +             connector->display_info.bus_formats[0],
> > +             tc->bpc);
> > +     /*
> > +      * Default hardware register settings of tc358775 configured
> > +      * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> > +      */
> > +     if (connector->display_info.bus_formats[0] =3D=3D
> > +             MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> > +             /* VESA-24 */
> > +             d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
> LVI_R2, LVI_R3));
> > +             d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7,
> LVI_R5, LVI_G0));
> > +             d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2,
> LVI_G6, LVI_G7));
> > +             d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4,
> LVI_G5, LVI_B0));
> > +             d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_B6, LVI_B7,
> LVI_B1, LVI_B2));
> > +             d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4,
> LVI_B5, LVI_L0));
> > +             d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS,
> LVI_DE, LVI_R6));
> > +     } else { /*  MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - JEIDA-18 */
> > +             d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
> LVI_R2, LVI_R3));
> > +             d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_L0,
> LVI_R5, LVI_G0));
> > +             d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2,
> LVI_L0, LVI_L0));
> > +             d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4,
> LVI_G5, LVI_B0));
> > +             d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_L0, LVI_L0,
> LVI_B1, LVI_B2));
> > +             d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4,
> LVI_B5, LVI_L0));
> > +             d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS,
> LVI_DE, LVI_L0));
> > +     }
> > +
> > +     d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> > +
> > +     val =3D LVCFG_LVEN_BIT;
> > +     if (tc->lvds_link =3D=3D DUAL_LINK) {
> > +             val |=3D TC358775_LVCFG_LVDLINK(1);
> > +             val |=3D TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
> > +     } else {
> > +             val |=3D TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
> > +     };
> > +     d2l_write(tc->i2c, LVCFG, val);
> > +}
> > +
> > +static enum drm_mode_status
> > +tc_mode_valid(struct drm_bridge *bridge,
> > +           const struct drm_display_info *info,
> > +           const struct drm_display_mode *mode)
> > +{
> > +     struct tc_data *tc =3D bridge_to_tc(bridge);
> > +
> > +     /*
> > +      * Maximum pixel clock speed 135MHz for single-link
> > +      * 270MHz for dual-link
> > +      */
> > +     if ((mode->clock > 135000 && tc->lvds_link =3D=3D SINGLE_LINK) ||
> > +         (mode->clock > 270000 && tc->lvds_link =3D=3D DUAL_LINK))
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     switch (info->bus_formats[0]) {
> > +     case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +     case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +             /* RGB888 */
> > +             tc->bpc =3D 8;
> > +             break;
> > +     case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > +             /* RGB666 */
> > +             tc->bpc =3D 6;
> > +             break;
> > +     default:
> > +             dev_warn(tc->dev,
> > +                      "unsupported LVDS bus format 0x%04x\n",
> > +                      info->bus_formats[0]);
> > +             return MODE_NOMODE;
> > +     }
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static int tc358775_parse_dt(struct device_node *np, struct tc_data *t=
c)
> > +{
> > +     struct device_node *endpoint;
> > +     struct device_node *parent;
> > +     struct device_node *remote;
> > +     struct property *prop;
> > +     int len =3D 0;
> > +
> > +     /*
> > +      * To get the data-lanes of dsi, we need to access the dsi0_out o=
f
> port1
> > +      *  of dsi0 endpoint from bridge port0 of d2l_in
> > +      */
> > +     endpoint =3D of_graph_get_endpoint_by_regs(tc->dev->of_node,
> > +                                              TC358775_DSI_IN, -1);
> > +     if (endpoint) {
> > +             /* dsi0_out node */
> > +             parent =3D of_graph_get_remote_port_parent(endpoint);
> > +             of_node_put(endpoint);
> > +             if (parent) {
> > +                     /* dsi0 port 1 */
> > +                     endpoint =3D of_graph_get_endpoint_by_regs(parent=
,
> 1, -1);
> > +                     of_node_put(parent);
> > +                     if (endpoint) {
> > +                             prop =3D of_find_property(endpoint,
> "data-lanes",
> > +                                                     &len);
> > +                             of_node_put(endpoint);
> > +                             if (!prop) {
> > +                                     dev_err(tc->dev,
> > +                                             "failed to find data
> lane\n");
> > +                                     return -EPROBE_DEFER;
>
>
> probe defer here looks crazy :) do you expect "data-lanes" property will
> appear later? Theoretically it is possible.
>
> Other thing that bothers me is "data-lanes" property - lots of tree
> walking code, error prone, lurking into other's device nodes - all that
> to get one number.
>
> Either there should be helpers for it (maybe there are some already),
> either it should be done differently. Laurent, Neil, Jonas, Jernej any
> thoughts?
>
>
> Regards
>
> Andrzej
>
>
> > +                             }
> > +                     }
> > +             }
> > +     }
> > +
> > +     tc->num_dsi_lanes =3D len / sizeof(u32);
> > +
> > +     if (tc->num_dsi_lanes < 1 || tc->num_dsi_lanes > 4)
> > +             return -EINVAL;
> > +
> > +     tc->host_node =3D of_graph_get_remote_node(np, 0, 0);
> > +     if (!tc->host_node)
> > +             return -ENODEV;
> > +
> > +     of_node_put(tc->host_node);
> > +
> > +     tc->lvds_link =3D SINGLE_LINK;
> > +     endpoint =3D of_graph_get_endpoint_by_regs(tc->dev->of_node,
> > +                                              TC358775_LVDS_OUT1, -1);
> > +     if (endpoint) {
> > +             remote =3D of_graph_get_remote_port_parent(endpoint);
> > +             of_node_put(endpoint);
> > +
> > +             if (remote) {
> > +                     if (of_device_is_available(remote))
> > +                             tc->lvds_link =3D DUAL_LINK;
> > +                     of_node_put(remote);
> > +             }
> > +     }
> > +
> > +     dev_dbg(tc->dev, "no.of dsi lanes: %d\n", tc->num_dsi_lanes);
> > +     dev_dbg(tc->dev, "operating in %d-link mode\n", tc->lvds_link);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tc_bridge_attach(struct drm_bridge *bridge,
> > +                         enum drm_bridge_attach_flags flags)
> > +{
> > +     struct tc_data *tc =3D bridge_to_tc(bridge);
> > +     struct device *dev =3D &tc->i2c->dev;
> > +     struct mipi_dsi_host *host;
> > +     struct mipi_dsi_device *dsi;
> > +     int ret;
> > +
> > +     const struct mipi_dsi_device_info info =3D { .type =3D "tc358775"=
,
> > +                                                     .channel =3D 0,
> > +                                                     .node =3D NULL,
> > +                                             };
> > +
> > +     host =3D of_find_mipi_dsi_host_by_node(tc->host_node);
> > +     if (!host) {
> > +             dev_err(dev, "failed to find dsi host\n");
> > +             return -EPROBE_DEFER;
> > +     }
> > +
> > +     dsi =3D mipi_dsi_device_register_full(host, &info);
> > +     if (IS_ERR(dsi)) {
> > +             dev_err(dev, "failed to create dsi device\n");
> > +             ret =3D PTR_ERR(dsi);
> > +             goto err_dsi_device;
> > +     }
> > +
> > +     tc->dsi =3D dsi;
> > +
> > +     dsi->lanes =3D tc->num_dsi_lanes;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO;
> > +
> > +     ret =3D mipi_dsi_attach(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to attach dsi to host\n");
> > +             goto err_dsi_attach;
> > +     }
> > +
> > +     /* Attach the panel-bridge to the dsi bridge */
> > +     return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
> > +                              &tc->bridge, flags);
> > +err_dsi_attach:
> > +     mipi_dsi_device_unregister(dsi);
> > +err_dsi_device:
> > +     return ret;
> > +}
> > +
> > +static const struct drm_bridge_funcs tc_bridge_funcs =3D {
> > +     .attach =3D tc_bridge_attach,
> > +     .pre_enable =3D tc_bridge_pre_enable,
> > +     .enable =3D tc_bridge_enable,
> > +     .mode_valid =3D tc_mode_valid,
> > +     .post_disable =3D tc_bridge_post_disable,
> > +};
> > +
> > +static int tc_probe(struct i2c_client *client, const struct
> i2c_device_id *id)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct drm_panel *panel;
> > +     struct tc_data *tc;
> > +     int ret;
> > +
> > +     tc =3D devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> > +     if (!tc)
> > +             return -ENOMEM;
> > +
> > +     tc->dev =3D dev;
> > +     tc->i2c =3D client;
> > +
> > +     ret =3D drm_of_find_panel_or_bridge(dev->of_node, TC358775_LVDS_O=
UT0,
> > +                                       0, &panel, NULL);
> > +     if (ret < 0)
> > +             return ret;
> > +     if (!panel)
> > +             return -ENODEV;
> > +
> > +     tc->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > +     if (IS_ERR(tc->panel_bridge))
> > +             return PTR_ERR(tc->panel_bridge);
> > +
> > +     ret =3D tc358775_parse_dt(dev->of_node, tc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     tc->vddio =3D devm_regulator_get(dev, "vddio-supply");
> > +     if (IS_ERR(tc->vddio)) {
> > +             ret =3D PTR_ERR(tc->vddio);
> > +             dev_err(dev, "vddio-supply not found\n");
> > +             return ret;
> > +     }
> > +
> > +     tc->vdd =3D devm_regulator_get(dev, "vdd-supply");
> > +     if (IS_ERR(tc->vdd)) {
> > +             ret =3D PTR_ERR(tc->vddio);
> > +             dev_err(dev, "vdd-supply not found\n");
> > +             return ret;
> > +     }
> > +
> > +     tc->stby_gpio =3D devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(tc->stby_gpio)) {
> > +             ret =3D PTR_ERR(tc->stby_gpio);
> > +             dev_err(dev, "cannot get stby-gpio %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     tc->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(tc->reset_gpio)) {
> > +             ret =3D PTR_ERR(tc->reset_gpio);
> > +             dev_err(dev, "cannot get reset-gpios %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     tc->bridge.funcs =3D &tc_bridge_funcs;
> > +     tc->bridge.of_node =3D dev->of_node;
> > +     drm_bridge_add(&tc->bridge);
> > +
> > +     i2c_set_clientdata(client, tc);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tc_remove(struct i2c_client *client)
> > +{
> > +     struct tc_data *tc =3D i2c_get_clientdata(client);
> > +
> > +     drm_bridge_remove(&tc->bridge);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id tc358775_i2c_ids[] =3D {
> > +     { "tc358775", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
> > +
> > +static const struct of_device_id tc358775_of_ids[] =3D {
> > +     { .compatible =3D "toshiba,tc358775", },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, tc358775_of_ids);
> > +
> > +static struct i2c_driver tc358775_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tc358775",
> > +             .of_match_table =3D tc358775_of_ids,
> > +     },
> > +     .id_table =3D tc358775_i2c_ids,
> > +     .probe =3D tc_probe,
> > +     .remove =3D tc_remove,
> > +};
> > +module_i2c_driver(tc358775_driver);
> > +
> > +MODULE_AUTHOR("Vinay Simha BN <simhavcs@gmail.com>");
> > +MODULE_DESCRIPTION("TC358775 DSI/LVDS bridge driver");
> > +MODULE_LICENSE("GPL v2");
>


--=20
regards,
vinaysimha

--0000000000005b00a805a9d5bd43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Andrzej,</div><div><br></div><div>Please suggest. <br=
></div><div><br></div><div>In general it should be in the reverse-order RES=
X then STBY, But<br></div><div>As per the spec Datasheet Power off sequence=
 is this Page 149, Section Power Supply On and Off Sequence <br></div><div>=
<br></div><div>regulators</div><div>STBY</div><div>RESX<br></div><div><br><=
/div><div><a href=3D"https://www.google.com/url?sa=3Dt&amp;rct=3Dj&amp;q=3D=
&amp;esrc=3Ds&amp;source=3Dweb&amp;cd=3D&amp;ved=3D2ahUKEwiBmeWb2brqAhXO7HM=
BHZgaCTUQFjACegQIBxAB&amp;url=3Dhttps%3A%2F%2Fdownload.t-firefly.com%2Fprod=
uct%2FRK3399%2FDocs%2FChip%2520Specifications%2FTC358774XBG_75XBG_V1%25204n=
m.pdf&amp;usg=3DAOvVaw2kBuPv8FaZBNynGWCQHEfc">https://www.google.com/url?sa=
=3Dt&amp;rct=3Dj&amp;q=3D&amp;esrc=3Ds&amp;source=3Dweb&amp;cd=3D&amp;ved=
=3D2ahUKEwiBmeWb2brqAhXO7HMBHZgaCTUQFjACegQIBxAB&amp;url=3Dhttps%3A%2F%2Fdo=
wnload.t-firefly.com%2Fproduct%2FRK3399%2FDocs%2FChip%2520Specifications%2F=
TC358774XBG_75XBG_V1%25204nm.pdf&amp;usg=3DAOvVaw2kBuPv8FaZBNynGWCQHEfc</a>=
</div><div><br></div><div>Regarding data-lanes</div><div>-data-lanes value =
does appear later from the mdp-&gt;dsi0 tree<br></div><div>-We need to pick=
 dynamically data-lanes of the dsi set, based on this we need to set in the=
 bridge.</div><div>Otherwise we are already setting in dsi0 ports as &lt;0 =
1 2 3&gt; , again we need to set it in the bridge tree. <br></div><div>- Th=
ere is no helper function to get the data-lanes of the DSI<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Jul 7, 2020 at 12:15 PM Andrzej Hajda &lt;<a href=3D"mailto:a.hajda@samsun=
g.com">a.hajda@samsung.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
On 04.07.2020 11:24, Vinay Simha BN wrote:<br>
&gt; This driver is tested with two panels individually with Apq8016-IFC630=
9 board<br>
&gt; <a href=3D"https://protect2.fireeye.com/url?k=3Dfe87a8ec-a3e0ecca-fe86=
23a3-0cc47a31384a-ffbc547df1141490&amp;q=3D1&amp;u=3Dhttps%3A%2F%2Fwww.info=
rcecomputing.com%2Fproducts%2Fsingle-board-computers-sbc%2Fqualcomm-snapdra=
gon-410-inforce-6309-micro-sbc" rel=3D"noreferrer" target=3D"_blank">https:=
//protect2.fireeye.com/url?k=3Dfe87a8ec-a3e0ecca-fe8623a3-0cc47a31384a-ffbc=
547df1141490&amp;q=3D1&amp;u=3Dhttps%3A%2F%2Fwww.inforcecomputing.com%2Fpro=
ducts%2Fsingle-board-computers-sbc%2Fqualcomm-snapdragon-410-inforce-6309-m=
icro-sbc</a><br>
&gt;<br>
&gt; 1. 1366x768@60 auo,b101xtn01 data-mapping =3D &quot;jeida-24&quot;<br>
&gt; 2. 800x480@60 innolux,at070tn92 data-mapping =3D &quot;vesa-24&quot;<b=
r>
&gt;<br>
&gt; - added SPDX identifier license<br>
&gt; - updated alphabetic order of headers<br>
&gt; - replaced u32 instead of uint32_t<br>
&gt; - magic number to macros for CLRSI and mux registers<br>
&gt; - mdelay to usleep_range<br>
&gt; - added bus_formats<br>
&gt; - removed drm_connector_status<br>
&gt; - regulator enable and disable with proper orders and delays<br>
&gt;=C2=A0 =C2=A0 as per the spec<br>
&gt; - devm_drm_panel_bridge_add method used instead of panel<br>
&gt;=C2=A0 =C2=A0 description modified<br>
&gt; - dual port implemented<br>
&gt; - panel-&gt;connector_type removed<br>
&gt; - ~vsdelay dynamic value set based on the<br>
&gt;=C2=A0 =C2=A0 calculation of dsi speed, output speed, blanking<br>
&gt; - help modified<br>
&gt; - display_timings naming local variables<br>
&gt; - check for bus_formats unsupported<br>
&gt; - error handling enpoint data-lanes<br>
&gt; - Kconfig proper indentation<br>
&gt; - GENMASK and FIELD_PREP used<br>
&gt; - bus_formats handeld in mode_valid<br>
&gt; - MODE_CLOCK_HIGH handled properly<br>
&gt; - len initialized<br>
&gt; - static function for mode_valid<br>
&gt;<br>
&gt; Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com=
" target=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v1:<br>
&gt;=C2=A0 =C2=A0Initial version<br>
&gt;<br>
&gt; v2:<br>
&gt; * Andrzej Hajda review comments incorporated<br>
&gt;=C2=A0 =C2=A0 SPDX identifier<br>
&gt;=C2=A0 =C2=A0 development debug removed<br>
&gt;=C2=A0 =C2=A0 alphabetic order headers<br>
&gt;=C2=A0 =C2=A0 u32 instead of unit32_t<br>
&gt;=C2=A0 =C2=A0 magic numbers to macros for CLRSI and mux registers<br>
&gt;=C2=A0 =C2=A0 ignored return value<br>
&gt;<br>
&gt; * Laurent Pinchart review comments incorporated<br>
&gt;=C2=A0 =C2=A0 mdelay to usleep_range<br>
&gt;=C2=A0 =C2=A0 bus_formats added<br>
&gt;<br>
&gt; v3:<br>
&gt; * Andrzej Hajda review comments incorporated<br>
&gt;=C2=A0 =C2=A0 drm_connector_status removed<br>
&gt;=C2=A0 =C2=A0 u32 rev removed and local variabl is used<br>
&gt;=C2=A0 =C2=A0 regulator enable disable with proper orders and delays<br=
>
&gt;=C2=A0 =C2=A0 as per the spec<br>
&gt;=C2=A0 =C2=A0 devm_drm_panel_bridge_add method used instead of panel<br=
>
&gt;=C2=A0 =C2=A0 description modified<br>
&gt;=C2=A0 =C2=A0 dual port implemented<br>
&gt;<br>
&gt; v4:<br>
&gt; * Sam Ravnborg review comments incorporated<br>
&gt;=C2=A0 =C2=A0 panel-&gt;connector_type removed<br>
&gt;<br>
&gt; * Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" =
target=3D"_blank">lkp@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 parse_dt to static function<br>
&gt;=C2=A0 =C2=A0 removed the if (endpoint), since data-lanes has to be<br>
&gt;=C2=A0 =C2=A0 present for dsi dts ports<br>
&gt;<br>
&gt; v5:<br>
&gt;=C2=A0 =C2=A0 ~vsdelay dynamic value set based on the<br>
&gt;=C2=A0 =C2=A0 calculation of dsi speed, output speed, blanking<br>
&gt;<br>
&gt; v6:<br>
&gt; * Sam Ravnborg review comments incorporated<br>
&gt;=C2=A0 =C2=A0 help modified<br>
&gt;=C2=A0 =C2=A0 display_timings naming local variables<br>
&gt;=C2=A0 =C2=A0 check for bus_formats unsupported<br>
&gt;=C2=A0 =C2=A0 error handling enpoint data-lanes<br>
&gt;<br>
&gt; v7:<br>
&gt; * Sam Ravnborg review comments incorporated<br>
&gt;=C2=A0 =C2=A0 Kconfig proper indentation<br>
&gt;=C2=A0 =C2=A0 GENMASK and FIELD_PREP used<br>
&gt;=C2=A0 =C2=A0 bus_formats handeld in mode_valid<br>
&gt;=C2=A0 =C2=A0 MODE_CLOCK_HIGH handled properly<br>
&gt;<br>
&gt; * Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" =
target=3D"_blank">lkp@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 len initialized<br>
&gt;=C2=A0 =C2=A0 static function for mode_valid<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/bridge/Kconfig=C2=A0 =C2=A0 |=C2=A0 10 +<b=
r>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/bridge/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/bridge/tc358775.c | 757 ++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 768 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/bridge/tc358775.c<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/K=
config<br>
&gt; index 43271c21d3fc..25c3097c4003 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/bridge/Kconfig<br>
&gt; @@ -181,6 +181,16 @@ config DRM_TOSHIBA_TC358768<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Toshiba TC358768AXBG/TC358778XBG DSI =
bridge chip driver.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +config DRM_TOSHIBA_TC358775<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Toshiba TC358775 DSI/LVDS bridge&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select REGMAP_I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_PANEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Toshiba TC358775 DSI/LVDS bridge chip driv=
er.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0config DRM_TI_TFP410<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI TFP410 DVI/HDMI bridge&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt; diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/=
Makefile<br>
&gt; index d63d4b7e4347..23c770b3bfe4 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/Makefile<br>
&gt; +++ b/drivers/gpu/drm/bridge/Makefile<br>
&gt; @@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd10=
24.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=3D tc358768.o<br>
&gt; +obj-$(CONFIG_DRM_TOSHIBA_TC358775) +=3D tc358775.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o<br>
&gt; diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridg=
e/tc358775.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..6494179369a6<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; @@ -0,0 +1,757 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * tc358775 DSI to LVDS bridge driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2020 SMART Wireless Computing<br>
&gt; + * Author: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" t=
arget=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + */<br>
&gt; +/* #define DEBUG */<br>
&gt; +#include &lt;linux/bitfield.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/regulator/consumer.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_bridge.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_dp_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_mipi_dsi.h&gt;<br>
&gt; +#include &lt;drm/drm_of.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +<br>
&gt; +#define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)=
<br>
&gt; +<br>
&gt; +/* Registers */<br>
&gt; +<br>
&gt; +/* DSI D-PHY Layer Registers */<br>
&gt; +#define D0W_DPHYCONTTX=C2=A0 0x0004=C2=A0 /* Data Lane 0 DPHY Tx Cont=
rol */<br>
&gt; +#define CLW_DPHYCONTRX=C2=A0 0x0020=C2=A0 /* Clock Lane DPHY Rx Contr=
ol */<br>
&gt; +#define D0W_DPHYCONTRX=C2=A0 0x0024=C2=A0 /* Data Lane 0 DPHY Rx Cont=
rol */<br>
&gt; +#define D1W_DPHYCONTRX=C2=A0 0x0028=C2=A0 /* Data Lane 1 DPHY Rx Cont=
rol */<br>
&gt; +#define D2W_DPHYCONTRX=C2=A0 0x002C=C2=A0 /* Data Lane 2 DPHY Rx Cont=
rol */<br>
&gt; +#define D3W_DPHYCONTRX=C2=A0 0x0030=C2=A0 /* Data Lane 3 DPHY Rx Cont=
rol */<br>
&gt; +#define COM_DPHYCONTRX=C2=A0 0x0038=C2=A0 /* DPHY Rx Common Control *=
/<br>
&gt; +#define CLW_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0040=C2=A0 /* Clock Lan=
e Control */<br>
&gt; +#define D0W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0044=C2=A0 /* Data Lane=
 0 Control */<br>
&gt; +#define D1W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0048=C2=A0 /* Data Lane=
 1 Control */<br>
&gt; +#define D2W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x004C=C2=A0 /* Data Lane=
 2 Control */<br>
&gt; +#define D3W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0050=C2=A0 /* Data Lane=
 3 Control */<br>
&gt; +#define DFTMODE_CNTRL=C2=A0 =C2=A00x0054=C2=A0 /* DFT Mode Control */=
<br>
&gt; +<br>
&gt; +/* DSI PPI Layer Registers */<br>
&gt; +#define PPI_STARTPPI=C2=A0 =C2=A0 0x0104=C2=A0 /* START control bit o=
f PPI-TX function. */<br>
&gt; +#define PPI_START_FUNCTION=C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +<br>
&gt; +#define PPI_BUSYPPI=C2=A0 =C2=A0 =C2=A00x0108<br>
&gt; +#define PPI_LINEINITCNT 0x0110=C2=A0 /* Line Initialization Wait Coun=
ter=C2=A0 */<br>
&gt; +#define PPI_LPTXTIMECNT 0x0114<br>
&gt; +#define PPI_LANEENABLE=C2=A0 0x0134=C2=A0 /* Enables each lane at the=
 PPI layer. */<br>
&gt; +#define PPI_TX_RX_TA=C2=A0 =C2=A0 0x013C=C2=A0 /* DSI Bus Turn Around=
 timing parameters */<br>
&gt; +<br>
&gt; +/* Analog timer function enable */<br>
&gt; +#define PPI_CLS_ATMR=C2=A0 =C2=A0 0x0140=C2=A0 /* Delay for Clock Lan=
e in LPRX=C2=A0 */<br>
&gt; +#define PPI_D0S_ATMR=C2=A0 =C2=A0 0x0144=C2=A0 /* Delay for Data Lane=
 0 in LPRX */<br>
&gt; +#define PPI_D1S_ATMR=C2=A0 =C2=A0 0x0148=C2=A0 /* Delay for Data Lane=
 1 in LPRX */<br>
&gt; +#define PPI_D2S_ATMR=C2=A0 =C2=A0 0x014C=C2=A0 /* Delay for Data Lane=
 2 in LPRX */<br>
&gt; +#define PPI_D3S_ATMR=C2=A0 =C2=A0 0x0150=C2=A0 /* Delay for Data Lane=
 3 in LPRX */<br>
&gt; +<br>
&gt; +#define PPI_D0S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0164=C2=A0 /* For lane 0 =
*/<br>
&gt; +#define PPI_D1S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0168=C2=A0 /* For lane 1 =
*/<br>
&gt; +#define PPI_D2S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x016C=C2=A0 /* For lane 2 =
*/<br>
&gt; +#define PPI_D3S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0170=C2=A0 /* For lane 3 =
*/<br>
&gt; +<br>
&gt; +#define CLS_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0180=C2=A0 /* Digi=
tal Counter inside of PHY IO */<br>
&gt; +#define D0S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0184=C2=A0 /* Digi=
tal Counter inside of PHY IO */<br>
&gt; +#define D1S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0188=C2=A0 /* Digi=
tal Counter inside of PHY IO */<br>
&gt; +#define D2S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x018C=C2=A0 /* Digi=
tal Counter inside of PHY IO */<br>
&gt; +#define D3S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0190=C2=A0 /* Digi=
tal Counter inside of PHY IO */<br>
&gt; +#define CLS_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A0=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D0S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A4=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D1S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A8=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D2S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01AC=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D3S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01B0=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define CLS_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C0=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D0S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C4=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D1S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C8=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D2S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01CC=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +#define D3S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01D0=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
&gt; +<br>
&gt; +#define PPI_CLRFLG=C2=A0 =C2=A0 =C2=A0 0x01E0=C2=A0 /* PRE Counters h=
as reached set values */<br>
&gt; +#define PPI_CLRSIPO=C2=A0 =C2=A0 =C2=A00x01E4=C2=A0 /* Clear SIPO val=
ues, Slave mode use only. */<br>
&gt; +#define HSTIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A00x01F0=C2=A0 /* HS Rx Tim=
e Out Counter */<br>
&gt; +#define HSTIMEOUTENABLE 0x01F4=C2=A0 /* Enable HS Rx Time Out Counter=
 */<br>
&gt; +#define DSI_STARTDSI=C2=A0 =C2=A0 0x0204=C2=A0 /* START control bit o=
f DSI-TX function */<br>
&gt; +#define DSI_RX_START 1<br>
&gt; +<br>
&gt; +#define DSI_BUSYDSI=C2=A0 =C2=A0 =C2=A00x0208<br>
&gt; +#define DSI_LANEENABLE=C2=A0 0x0210=C2=A0 /* Enables each lane at the=
 Protocol layer. */<br>
&gt; +#define DSI_LANESTATUS0 0x0214=C2=A0 /* Displays lane is in HS RX mod=
e. */<br>
&gt; +#define DSI_LANESTATUS1 0x0218=C2=A0 /* Displays lane is in ULPS or S=
TOP state */<br>
&gt; +<br>
&gt; +#define DSI_INTSTATUS=C2=A0 =C2=A00x0220=C2=A0 /* Interrupt Status */=
<br>
&gt; +#define DSI_INTMASK=C2=A0 =C2=A0 =C2=A00x0224=C2=A0 /* Interrupt Mask=
 */<br>
&gt; +#define DSI_INTCLR=C2=A0 =C2=A0 =C2=A0 0x0228=C2=A0 /* Interrupt Clea=
r */<br>
&gt; +#define DSI_LPTXTO=C2=A0 =C2=A0 =C2=A0 0x0230=C2=A0 /* Low Power Tx T=
ime Out Counter */<br>
&gt; +<br>
&gt; +#define DSIERRCNT=C2=A0 =C2=A0 =C2=A0 =C2=A00x0300=C2=A0 /* DSI Error=
 Count */<br>
&gt; +#define APLCTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0400=C2=A0 /* Appl=
ication Layer Control */<br>
&gt; +#define RDPKTLN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0404=C2=A0 /* Comm=
and Read Packet Length */<br>
&gt; +<br>
&gt; +#define VPCTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0450=C2=A0 /* Vide=
o Path Control */<br>
&gt; +#define HTIM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0454=C2=A0 /*=
 Horizontal Timing Control 1 */<br>
&gt; +#define HTIM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0458=C2=A0 /*=
 Horizontal Timing Control 2 */<br>
&gt; +#define VTIM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x045C=C2=A0 /*=
 Vertical Timing Control 1 */<br>
&gt; +#define VTIM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0460=C2=A0 /*=
 Vertical Timing Control 2 */<br>
&gt; +#define VFUEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0464=C2=A0 /*=
 Video Frame Timing Update Enable */<br>
&gt; +#define VFUEN_EN=C2=A0 =C2=A0 =C2=A0BIT(0)=C2=A0 /* Upload Enable */<=
br>
&gt; +<br>
&gt; +/* Mux Input Select for LVDS LINK Input */<br>
&gt; +#define LV_MX0003=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0480=C2=A0 /* Bit 0 to=
 3 */<br>
&gt; +#define LV_MX0407=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0484=C2=A0 /* Bit 4 to=
 7 */<br>
&gt; +#define LV_MX0811=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0488=C2=A0 /* Bit 8 to=
 11 */<br>
&gt; +#define LV_MX1215=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x048C=C2=A0 /* Bit 12 t=
o 15 */<br>
&gt; +#define LV_MX1619=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0490=C2=A0 /* Bit 16 t=
o 19 */<br>
&gt; +#define LV_MX2023=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0494=C2=A0 /* Bit 20 t=
o 23 */<br>
&gt; +#define LV_MX2427=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0498=C2=A0 /* Bit 24 t=
o 27 */<br>
&gt; +#define LV_MX(b0, b1, b2, b3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (FLD_VAL(b0,=
 4, 0) | FLD_VAL(b1, 12, 8) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24=
))<br>
&gt; +<br>
&gt; +/* Input bit numbers used in mux registers */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_R7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_G7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_B7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_HS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_VS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_DE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LVI_L0<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define LVCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x049C=C2=A0 /*=
 LVDS Configuration=C2=A0 */<br>
&gt; +#define LVPHY0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04A0=C2=A0 /* LVDS=
 PHY 0 */<br>
&gt; +#define LV_PHY0_RST(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FLD_VAL(v, 2=
2, 22) /* PHY reset */<br>
&gt; +#define LV_PHY0_IS(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL=
(v, 15, 14)<br>
&gt; +#define LV_PHY0_ND(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL=
(v, 4, 0) /* Frequency range select */<br>
&gt; +#define LV_PHY0_PRBS_ON(v)=C2=A0 =C2=A0 =C2=A0 FLD_VAL(v, 20, 16) /* =
Clock/Data Flag pins */<br>
&gt; +<br>
&gt; +#define LVPHY1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04A4=C2=A0 /* LVDS=
 PHY 1 */<br>
&gt; +#define SYSSTAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0500=C2=A0 /* Syst=
em Status=C2=A0 */<br>
&gt; +#define SYSRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0504=C2=A0 /* Syst=
em Reset=C2=A0 */<br>
&gt; +<br>
&gt; +#define SYS_RST_I2CS BIT(0) /* Reset I2C-Slave controller */<br>
&gt; +#define SYS_RST_I2CM BIT(1) /* Reset I2C-Master controller */<br>
&gt; +#define SYS_RST_LCD=C2=A0 BIT(2) /* Reset LCD controller */<br>
&gt; +#define SYS_RST_BM=C2=A0 =C2=A0BIT(3) /* Reset Bus Management control=
ler */<br>
&gt; +#define SYS_RST_DSIRX=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4) /* Reset DSI-=
RX and App controller */<br>
&gt; +#define SYS_RST_REG=C2=A0 BIT(5) /* Reset Register module */<br>
&gt; +<br>
&gt; +/* GPIO Registers */<br>
&gt; +#define GPIOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0520=C2=A0 /*=
 GPIO Control=C2=A0 */<br>
&gt; +#define GPIOO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0524=C2=A0 /*=
 GPIO Output=C2=A0 */<br>
&gt; +#define GPIOI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0528=C2=A0 /*=
 GPIO Input=C2=A0 */<br>
&gt; +<br>
&gt; +/* I2C Registers */<br>
&gt; +#define I2CTIMCTRL=C2=A0 =C2=A0 =C2=A0 0x0540=C2=A0 /* I2C IF Timing =
and Enable Control */<br>
&gt; +#define I2CMADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0544=C2=A0 /* I2C Maste=
r Addressing */<br>
&gt; +#define WDATAQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0548=C2=A0 /* Writ=
e Data Queue */<br>
&gt; +#define RDATAQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x054C=C2=A0 /* Read=
 Data Queue */<br>
&gt; +<br>
&gt; +/* Chip ID and Revision ID Register */<br>
&gt; +#define IDREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0580<br>
&gt; +<br>
&gt; +#define LPX_PERIOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
&gt; +#define TTA_GET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x40000<br>
&gt; +#define TTA_SURE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
&gt; +#define SINGLE_LINK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define DUAL_LINK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +<br>
&gt; +#define TC358775XBG_ID=C2=A0 0x00007500<br>
&gt; +<br>
&gt; +/* Debug Registers */<br>
&gt; +#define DEBUG00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05A0=C2=A0 /* Debu=
g */<br>
&gt; +#define DEBUG01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05A4=C2=A0 /* LVDS=
 Data */<br>
&gt; +<br>
&gt; +#define DSI_CLEN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +#define DIVIDE_BY_3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 /* PCLK=3DDCL=
K/3 */<br>
&gt; +#define DIVIDE_BY_6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 /* PCLK=3DDCL=
K/6 */<br>
&gt; +#define LVCFG_LVEN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(0)<br>
&gt; +<br>
&gt; +#define L0EN BIT(1)<br>
&gt; +<br>
&gt; +#define TC358775_VPCTRL_VSDELAY__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3F=
F00000<br>
&gt; +#define TC358775_VPCTRL_VSDELAY__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A020<b=
r>
&gt; +static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_VSDELAY__S=
HIFT) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TC358775_VPCTRL_VSDELAY__MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define TC358775_VPCTRL_OPXLFMT__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00=
000100<br>
&gt; +#define TC358775_VPCTRL_OPXLFMT__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A08<br=
>
&gt; +static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_OPXLFMT__S=
HIFT) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TC358775_VPCTRL_OPXLFMT__MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define TC358775_VPCTRL_MSF__MASK=C2=A0 =C2=A0 0x00000001<br>
&gt; +#define TC358775_VPCTRL_MSF__SHIFT=C2=A0 =C2=A00<br>
&gt; +static inline u32 TC358775_VPCTRL_MSF(uint32_t val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_MSF__SHIFT=
) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TC358775_VPCTRL_MSF__MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define TC358775_LVCFG_PCLKDIV__MASK 0x000000f0<br>
&gt; +#define TC358775_LVCFG_PCLKDIV__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br=
>
&gt; +static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_LVCFG_PCLKDIV__SH=
IFT) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TC358775_LVCFG_PCLKDIV__MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br>
&gt; +#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_LVCFG_LVDLINK__SH=
IFT) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TC358775_LVCFG_LVDLINK__MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +enum tc358775_ports {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TC358775_DSI_IN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TC358775_LVDS_OUT0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TC358775_LVDS_OUT1,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct tc_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client=C2=A0 =C2=A0 =C2=A0 =C2=A0*i2c;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_bridge=C2=A0 =C2=A0 =C2=A0 =C2=A0bridg=
e;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_bridge=C2=A0 =C2=A0 =C2=A0 =C2=A0*pane=
l_bridge;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *host_node;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 num_dsi_lanes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator=C2=A0 =C2=A0 =C2=A0 =C2=A0 *vdd;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator=C2=A0 =C2=A0 =C2=A0 =C2=A0 *vddi=
o;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 *rese=
t_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 *stby=
_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds_link; /* single-link or dual-link */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpc;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(b, struct tc_data, bridge);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static void tc_bridge_pre_enable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;dsi-&gt;dev;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regulator_enable(tc-&gt;vddio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;re=
gulator vddio enable failed, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regulator_enable(tc-&gt;vdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;re=
gulator vdd enable failed, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;stby_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;reset_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10, 20);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void tc_bridge_post_disable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;dsi-&gt;dev;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regulator_disable(tc-&gt;vddio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;re=
gulator vddio disable failed, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regulator_disable(tc-&gt;vdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;re=
gulator vdd disable failed, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;stby_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;reset_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(10, 20);<br>
<br>
<br>
Power off order is incorrect (I have already commented it at least once).<b=
r>
<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 d2l_read(struct i2c_client *i2c, u16 reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 val[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 addr[] =3D {(reg &gt;&gt; 8) &amp; 0xff, reg &=
amp; 0xff};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_send(i2c, addr, sizeof(reg));<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_recv(i2c, val, sizeof(value));=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0value =3D val[3] &lt;&lt; 24 | val[2] &lt;&lt; 16=
 | val[1] &lt;&lt; 8 | val[0];<br>
<br>
<br>
Please use le32_to_cpu or similar macro.<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_debug(&quot;d2l: I2C : reg:%04x value:%08x\n&q=
uot;, reg, value);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return value;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;i2c-&gt;dev, &quot;Error %d reading =
from subaddress 0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void d2l_write(struct i2c_client *i2c, u16 reg, u32 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[6];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[0] =3D reg &gt;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[1] =3D reg &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[2] =3D (val &gt;&gt; 0) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[3] =3D (val &gt;&gt; 8) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[4] =3D (val &gt;&gt; 16) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[5] =3D (val &gt;&gt; 24) &amp; 0xFF;<br>
<br>
<br>
put_unaligned_le16(reg, buf);<br>
<br>
put_unaligned_le32(reg, buf+2);<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_send(i2c, buf, ARRAY_SIZE(buf)=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;i2c-&gt;=
dev, &quot;Error %d writing to subaddress 0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret, reg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* helper function to access bus_formats */<br>
&gt; +static struct drm_connector *get_connector(struct drm_encoder *encode=
r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D encoder-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(connector, &amp;dev-&gt;mode_=
config.connector_list, head)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;enc=
oder =3D=3D encoder)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return connector;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void tc_bridge_enable(struct drm_bridge *bridge)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 hback_porch, hsync_len, hfront_porch, hactive=
, htime1, htime2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 vback_porch, vsync_len, vfront_porch, vactive=
, vtime1, vtime2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D get_connector=
(bridge-&gt;encoder);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode =3D &amp;bridge-&gt;encoder-&gt;crtc-&gt;sta=
te-&gt;adjusted_mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hback_porch =3D mode-&gt;htotal - mode-&gt;hsync_=
end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hsync_len=C2=A0 =3D mode-&gt;hsync_end - mode-&gt=
;hsync_start;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vback_porch =3D mode-&gt;vtotal - mode-&gt;vsync_=
end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vsync_len=C2=A0 =3D mode-&gt;vsync_end - mode-&gt=
;vsync_start;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0htime1 =3D (hback_porch &lt;&lt; 16) + hsync_len;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vtime1 =3D (vback_porch &lt;&lt; 16) + vsync_len;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hfront_porch =3D mode-&gt;hsync_start - mode-&gt;=
hdisplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hactive =3D mode-&gt;hdisplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vfront_porch =3D mode-&gt;vsync_start - mode-&gt;=
vdisplay;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vactive =3D mode-&gt;vdisplay;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0htime2 =3D (hfront_porch &lt;&lt; 16) + hactive;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0vtime2 =3D (vfront_porch &lt;&lt; 16) + vactive;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D d2l_read(tc-&gt;i2c, IDREG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(tc-&gt;dev, &quot;DSI2LVDS Chip ID.%02x =
Revision ID. %02x **\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (val &gt;&gt; 8) &am=
p; 0xFF, val &amp; 0xFF);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, SYSRST, SYS_RST_REG | SYS_R=
ST_DSIRX | SYS_RST_BM |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYS_RST_LCD | =
SYS_RST_I2CM | SYS_RST_I2CS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(30000, 40000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_TX_RX_TA, TTA_GET | TTA=
_SURE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_LPTXTIMECNT, LPX_PERIOD=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D0S_CLRSIPOCOUNT, 3);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D1S_CLRSIPOCOUNT, 3);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D2S_CLRSIPOCOUNT, 3);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D3S_CLRSIPOCOUNT, 3);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D ((L0EN &lt;&lt; tc-&gt;num_dsi_lanes) - L=
0EN) | DSI_CLEN_BIT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_LANEENABLE, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, DSI_LANEENABLE, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_STARTPPI, PPI_START_FUN=
CTION);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, DSI_STARTDSI, DSI_RX_START)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;bpc =3D=3D 8)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D TC358775_VPCT=
RL_OPXLFMT(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else /* bpc =3D 6; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D TC358775_VPCT=
RL_MSF(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsiclk =3D mode-&gt;crtc_clock * 3 * tc-&gt;bpc /=
 tc-&gt;num_dsi_lanes / 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clkdiv =3D dsiclk / DIVIDE_BY_3 * tc-&gt;lvds_lin=
k;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0byteclk =3D dsiclk / 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t1 =3D hactive * (tc-&gt;bpc * 3 / 8) / tc-&gt;nu=
m_dsi_lanes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t2 =3D ((100000 / clkdiv)) * (hactive + hback_por=
ch + hsync_len + hfront_porch) / 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t3 =3D ((t2 * byteclk) / 100) - (hactive * (tc-&g=
t;bpc * 3 / 8) /<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;num_dsi_lanes)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vsdelay =3D (clkdiv * (t1 + t3) / byteclk) - hbac=
k_porch - hsync_len - hactive;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val |=3D TC358775_VPCTRL_VSDELAY(vsdelay);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VPCTRL, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, HTIM1, htime1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VTIM1, vtime1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, HTIM2, htime2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VTIM2, vtime2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VFUEN, VFUEN_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, SYSRST, SYS_RST_LCD);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LVPHY0, LV_PHY0_PRBS_ON(4) =
| LV_PHY0_ND(6));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;bus_formats %04x bpc %d=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;display=
_info.bus_formats[0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Default hardware register settings of tc358775=
 configured<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24=
 format<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (connector-&gt;display_info.bus_formats[0] =3D=
=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB888_=
1X7X4_SPWG) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* VESA-24 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else { /*=C2=A0 MEDIA_BUS_FMT_RGB666_1X7X3_SPWG=
 - JEIDA-18 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0407, LV_MX(LVI_R4, LVI_L0, LVI_R5, LVI_G0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_L0, LVI_L0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX1619, LV_MX(LVI_L0, LVI_L0, LVI_B1, LVI_B2));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c,=
 LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_L0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VFUEN, VFUEN_EN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D LVCFG_LVEN_BIT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;lvds_link =3D=3D DUAL_LINK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_LVC=
FG_LVDLINK(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_LVC=
FG_PCLKDIV(DIVIDE_BY_6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_LVC=
FG_PCLKDIV(DIVIDE_BY_3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LVCFG, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status<br>
&gt; +tc_mode_valid(struct drm_bridge *bridge,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_inf=
o *info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_mod=
e *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Maximum pixel clock speed 135MHz for single-li=
nk<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * 270MHz for dual-link<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((mode-&gt;clock &gt; 135000 &amp;&amp; tc-&gt=
;lvds_link =3D=3D SINGLE_LINK) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mode-&gt;clock &gt; 270000 &amp;&a=
mp; tc-&gt;lvds_link =3D=3D DUAL_LINK))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_CLOCK_HIG=
H;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (info-&gt;bus_formats[0]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGB888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc =3D 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGB666 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(tc-&gt;dev,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;unsupported LVDS bus format 0x%04x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 info-&gt;bus_formats[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_NOMODE;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tc358775_parse_dt(struct device_node *np, struct tc_data *=
tc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *endpoint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *parent;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *remote;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct property *prop;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int len =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * To get the data-lanes of dsi, we need to acces=
s the dsi0_out of port1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *=C2=A0 of dsi0 endpoint from bridge port0 of d2=
l_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(tc-&gt=
;dev-&gt;of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TC358775_DSI_IN, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (endpoint) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* dsi0_out node */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent =3D of_graph_g=
et_remote_port_parent(endpoint);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoint)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* dsi0 port 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(parent, 1, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (endpoint) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D of_find_property(endpoint, &quo=
t;data-lanes&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoint);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(tc-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;failed to find data lane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPRO=
BE_DEFER;<br>
<br>
<br>
probe defer here looks crazy :) do you expect &quot;data-lanes&quot; proper=
ty will <br>
appear later? Theoretically it is possible.<br>
<br>
Other thing that bothers me is &quot;data-lanes&quot; property - lots of tr=
ee <br>
walking code, error prone, lurking into other&#39;s device nodes - all that=
 <br>
to get one number.<br>
<br>
Either there should be helpers for it (maybe there are some already), <br>
either it should be done differently. Laurent, Neil, Jonas, Jernej any <br>
thoughts?<br>
<br>
<br>
Regards<br>
<br>
Andrzej<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;num_dsi_lanes =3D len / sizeof(u32);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;num_dsi_lanes &lt; 1 || tc-&gt;num_dsi=
_lanes &gt; 4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;host_node =3D of_graph_get_remote_node(np,=
 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!tc-&gt;host_node)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_node_put(tc-&gt;host_node);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;lvds_link =3D SINGLE_LINK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(tc-&gt=
;dev-&gt;of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TC358775_LVDS_OUT1, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (endpoint) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote =3D of_graph_g=
et_remote_port_parent(endpoint);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoint)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (remote) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (of_device_is_available(remote))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;lvds_link =3D DUAL_LINK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;no.of dsi lanes: %d\n&q=
uot;, tc-&gt;num_dsi_lanes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;operating in %d-link mo=
de\n&quot;, tc-&gt;lvds_link);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tc_bridge_attach(struct drm_bridge *bridge,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0enum drm_bridge_attach_flags flags)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;i2c-&gt;dev;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_host *host;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct mipi_dsi_device_info info =3D { .typ=
e =3D &quot;tc358775&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channel =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.node =3D NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host =3D of_find_mipi_dsi_host_by_node(tc-&gt;hos=
t_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!host) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to find dsi host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPROBE_DEFER;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi =3D mipi_dsi_device_register_full(host, &amp;=
info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to create dsi device\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(dsi);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dsi_device;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;dsi =3D dsi;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;lanes =3D tc-&gt;num_dsi_lanes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;format =3D MIPI_DSI_FMT_RGB888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags =3D MIPI_DSI_MODE_VIDEO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_attach(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to attach dsi to host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dsi_attach;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Attach the panel-bridge to the dsi bridge */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0return drm_bridge_attach(bridge-&gt;encoder, tc-&=
gt;panel_bridge,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;tc-&gt;bridge, flags);<br>
&gt; +err_dsi_attach:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_device_unregister(dsi);<br>
&gt; +err_dsi_device:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_bridge_funcs tc_bridge_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.attach =3D tc_bridge_attach,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.pre_enable =3D tc_bridge_pre_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable =3D tc_bridge_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_valid =3D tc_mode_valid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.post_disable =3D tc_bridge_post_disable,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int tc_probe(struct i2c_client *client, const struct i2c_devic=
e_id *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;client-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc =3D devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!tc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;dev =3D dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;i2c =3D client;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_of_find_panel_or_bridge(dev-&gt;of_no=
de, TC358775_LVDS_OUT0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, &a=
mp;panel, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!panel)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;panel_bridge =3D devm_drm_panel_bridge_add=
(dev, panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;panel_bridge))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(tc-&gt=
;panel_bridge);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D tc358775_parse_dt(dev-&gt;of_node, tc);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;vddio =3D devm_regulator_get(dev, &quot;vd=
dio-supply&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;vddio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-&g=
t;vddio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;vd=
dio-supply not found\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;vdd =3D devm_regulator_get(dev, &quot;vdd-=
supply&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;vdd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-&g=
t;vddio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;vd=
d-supply not found\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;stby_gpio =3D devm_gpiod_get(dev, &quot;st=
by&quot;, GPIOD_OUT_HIGH);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;stby_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-&g=
t;stby_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get stby-gpio %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;reset_gpio =3D devm_gpiod_get(dev, &quot;r=
eset&quot;, GPIOD_OUT_HIGH);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-&g=
t;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get reset-gpios %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;bridge.funcs =3D &amp;tc_bridge_funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;bridge.of_node =3D dev-&gt;of_node;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_bridge_add(&amp;tc-&gt;bridge);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(client, tc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tc_remove(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D i2c_get_clientdata(client)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_bridge_remove(&amp;tc-&gt;bridge);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct i2c_device_id tc358775_i2c_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;tc358775&quot;, 0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);<br>
&gt; +<br>
&gt; +static const struct of_device_id tc358775_of_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;toshiba,tc358775&quot;, }=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, tc358775_of_ids);<br>
&gt; +<br>
&gt; +static struct i2c_driver tc358775_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;tc358=
775&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D t=
c358775_of_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.id_table =3D tc358775_i2c_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D tc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D tc_remove,<br>
&gt; +};<br>
&gt; +module_i2c_driver(tc358775_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gma=
il.com" target=3D"_blank">simhavcs@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;TC358775 DSI/LVDS bridge driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--0000000000005b00a805a9d5bd43--

--===============0949314542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0949314542==--
