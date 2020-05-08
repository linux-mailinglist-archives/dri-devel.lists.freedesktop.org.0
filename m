Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B81CBF94
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7F66E30F;
	Sat,  9 May 2020 09:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5466EAD4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:13:56 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id q10so931823ile.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKo0s8BIsSY+04mVBMEX3wR3ge6AvEseURJrEEnEtCQ=;
 b=Yxa2QA5TV5Utjt2uyA9Gg7WyvwTY5L4p9gxp9xi5Rh+fPZ57kyg3BCI8QO+NWt8mGx
 FRHWZvpFNViV4qX/pXdp0lv08IQhFcBxpY8LER27rgzf0fbgLR9HWo24LU8dFv0BxjVg
 FlhtPEoKsZFdm2vCblpuTGm3jFo6mW5QExvFmEKpBMN8laD8vLpsLS0WCE2ZXgN/MMHq
 ijtKdVfLzgD42swrrpPZxVI3nYdgG7XUNOGOtCpMrVejZMFox8HJ3jNJzdCy2pXv0XL+
 nP34vunjWqyM3bjpdynTiwzSmfGVV/Ugj02zEzTil1YD/+GiGsXdnKAvrc7jANz5nnwI
 lALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKo0s8BIsSY+04mVBMEX3wR3ge6AvEseURJrEEnEtCQ=;
 b=r5pjHJi0GDXfWMERlh7C/pZ2fQikDOhe2/b5xCLaF7rf2MB2/CeYjILNiyMJHGg2xz
 duIZ6N8TPAYAJWdGiOA5WioGvyi5x48cv4EiXhHLWg8MN4T1LRJnmW5X/JJF1t59erwO
 vlG2TyDXX9UcAz4thfsGvSIa37jAheYAlbhO2otNfF639Cu5qRLbX3Z1cqSozEHY6rfp
 EE8BW9SGA/8sGf2OTCU2yTbeVWRbkE6T2vAdQyI3o1PS4cDdH/OwDkmkUo4xKGziJKTP
 mvD8F9CqOrvTXloAmFn7L4PwsV7Qb1ErFCzc4Xr0l9szkE+ieVnWjLa19Q52QQvdXboI
 gppA==
X-Gm-Message-State: AGi0PuZiqXOZmkqhrPIN4w5Ta83o0SSnLWahqEHPYBzWoKoNfttoKiWG
 55KEqsYPwp/OLfnSiR9Pb8WizvnId5VsxEvlQ5c=
X-Google-Smtp-Source: APiQypKT7aaVCfUyIGm/Nl0sqn2zmS2OaSODcX7z1n7vHrQ6o/a2+Wmfep4IRoDhDVvg68E91t/xDrB8djauVTrPepw=
X-Received: by 2002:a92:607:: with SMTP id x7mr1802642ilg.218.1588932835358;
 Fri, 08 May 2020 03:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
 <1588911194-12433-6-git-send-email-dillon.minfei@gmail.com>
 <20200508090247.GA11575@ravnborg.org>
In-Reply-To: <20200508090247.GA11575@ravnborg.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 8 May 2020 18:13:43 +0800
Message-ID: <CAL9mu0LcT3pPiM6PdJRvAJRMbXY6KACF1wNg8yOS-6D8aq6AeA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/panel: add panel driver for Ilitek ili9341
 panels
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: mcoquelin.stm32@gmail.com, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, airlied@linux.ie,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, sboyd@kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0032480355=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0032480355==
Content-Type: multipart/alternative; boundary="000000000000393d9305a520412a"

--000000000000393d9305a520412a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

  Thanks for your comments, i will rework this panel driver after l3gd20
patch submission.

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2020=E5=B9=B45=E6=9C=888=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:02=E5=86=99=E9=81=93=EF=BC=9A

> Hi Dillon.
>
> Patch submissions starts to look fine.
>
> On Fri, May 08, 2020 at 12:13:14PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This is a driver for 320x240 TFT panels, accepting a rgb input
> > streams that get adapted and scaled to the panel.
> This driver is, I suppose, prepared to be a driver for ILI9341 based
> panles, and as such not for a fixed resolution.
> I expect (hope) we in the future will see more panels added.
>
> As i checked ili9341 datasheets, this panel just support 240x320
resolution only.  if i'm wrong , please correct me. thanks
https://cdn-shop.adafruit.com/datasheets/ILI9341.pdf

This panel can support 9 different kinds of interface , "3/4-line Serial
Interface" have been supported by tiny/ili9341.c. i was verified it
but the performance on stm32f4 is very low.

currently, i just have stm32f429-disco in hands, with 18-bit parallel rgb
bus connected on this board. reference to panel-ilitek-ili9322 and
panel-ilitek-ili9881 driver, i have some plan to rewrite this driver.

1 add your below comments in.
2 use dc-gpio, reset-gpio, rgb-interface-bits from dts to config panel
interface.
3 drop regmap, porting drm_mipi_dbi's mipi_dbi_command to config panel
paramter. like tiny/ili9341.c
4 support rgb-16, rgb-18 interface.
5 use optional regulator or power gpio to control panel's power, as panel
power is always on for my board, so i can't test this part. could i add the
code which can't be tested?
6 support rotation in panel config (currently , i rotate the screen by
kernel cmdline paramter)

if you have any other common panel configuration should be add , please
inform me.

thanks.

>
> Some things to fix, see comments in the follwoing.
>
>         Sam
>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                |   8 +
> >  drivers/gpu/drm/panel/Makefile               |   1 +
> >  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 561
> +++++++++++++++++++++++++++
> >  3 files changed, 570 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig
> b/drivers/gpu/drm/panel/Kconfig
> > index a1723c1..e42692c 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -95,6 +95,14 @@ config DRM_PANEL_ILITEK_IL9322
> >         Say Y here if you want to enable support for Ilitek IL9322
> >         QVGA (320x240) RGB, YUV and ITU-T BT.656 panels.
> >
> > +config DRM_PANEL_ILITEK_IL9341
> ILI9341 - so the config name matches the name of the driver IC.
>
> > +     tristate "Ilitek ILI9341 240x320 QVGA panels"
> > +     depends on OF && SPI
> > +     select REGMAP
> > +     help
> > +       Say Y here if you want to enable support for Ilitek IL9341
> > +       QVGA (240x320) RGB panels.
> See comment to the changelog, the driver is more generic - I assume.
> So the wording here can be improved to express this.
>
> Add support RGB 16bits and RGB 18bits bus only ?

> > +
> >  config DRM_PANEL_ILITEK_ILI9881C
> >       tristate "Ilitek ILI9881C-based panels"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile
> b/drivers/gpu/drm/panel/Makefile
> > index 96a883c..d123543 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) +=3D
> panel-elida-kd35t133.o
> >  obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) +=3D
> panel-feixin-k101-im2ba02.o
> >  obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) +=3D
> panel-feiyang-fy07024di26a30d.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) +=3D panel-ilitek-ili9322.o
> > +obj-$(CONFIG_DRM_PANEL_ILITEK_IL9341) +=3D panel-ilitek-ili9341.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) +=3D panel-ilitek-ili9881c.o
> >  obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) +=3D panel-innolux-p079zca.o
> >  obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me05000.o
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > new file mode 100644
> > index 0000000..ec22d80
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > @@ -0,0 +1,561 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Ilitek ILI9341 TFT LCD drm_panel driver.
> > + *
> > + * This panel can be configured to support:
> > + * - 16-bit parallel RGB interface
> The interface to ILI9341 is SPI, and the interface between the ILI9341
> and the panel is more of an itnernal thing. Or did I get this worng?
>
> SPI is for register configuration.  RGB parallel for data transfer

> + *
> > + * Copyright (C) 2020 Dillon Min <dillon.minfei@gmail.com>
> > + * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
> > +
> > +#include <video/mipi_display.h>
> > +#include <video/of_videomode.h>
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +
> > +#define DEFAULT_SPI_SPEED    10000000
> > +
>
> Please use same case for hex numbers in the driver.
> My personal preferences is lower-case.
>
> in next patch, spi speed will be configured by dts, not hardcode here.
below register address will change to lower-case hex numbers.


> > +#define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */
> > +#define ILI9341_GAMMA                0x26   /* Gamma register */
> > +#define ILI9341_DISPLAY_OFF          0x28   /* Display off register */
> > +#define ILI9341_DISPLAY_ON           0x29   /* Display on register */
> > +#define ILI9341_COLUMN_ADDR          0x2A   /* Colomn address register
> */
> > +#define ILI9341_PAGE_ADDR            0x2B   /* Page address register *=
/
> > +#define ILI9341_GRAM                 0x2C   /* GRAM register */
> > +#define ILI9341_MAC                  0x36   /* Memory Access Control
> register*/
> > +#define ILI9341_PIXEL_FORMAT         0x3A   /* Pixel Format register *=
/
> > +#define ILI9341_WDB                  0x51   /* Write Brightness Displa=
y
> > +                                          * register
> > +                                          */
> > +#define ILI9341_WCD                  0x53   /* Write Control Display
> > +                                          * register
> > +                                          */
> > +#define ILI9341_RGB_INTERFACE        0xB0   /* RGB Interface Signal
> Control */
> > +#define ILI9341_FRC                  0xB1   /* Frame Rate Control
> register */
> > +#define ILI9341_BPC                  0xB5   /* Blanking Porch Control
> > +                                          * register
> > +                                          */
> > +#define ILI9341_DFC                  0xB6   /* Display Function Contro=
l
> > +                                          * register
> > +                                          */
> > +#define ILI9341_POWER1               0xC0   /* Power Control 1 registe=
r
> */
> > +#define ILI9341_POWER2               0xC1   /* Power Control 2 registe=
r
> */
> > +#define ILI9341_VCOM1                0xC5   /* VCOM Control 1 register
> */
> > +#define ILI9341_VCOM2                0xC7   /* VCOM Control 2 register
> */
> > +#define ILI9341_POWERA               0xCB   /* Power control A registe=
r
> */
> > +#define ILI9341_POWERB               0xCF   /* Power control B registe=
r
> */
> > +#define ILI9341_PGAMMA               0xE0   /* Positive Gamma Correcti=
on
> > +                                          * register
> > +                                          */
> > +#define ILI9341_NGAMMA               0xE1   /* Negative Gamma Correcti=
on
> > +                                          * register
> > +                                          */
> > +#define ILI9341_DTCA                 0xE8   /* Driver timing control A
> */
> > +#define ILI9341_DTCB                 0xEA   /* Driver timing control B
> */
> > +#define ILI9341_POWER_SEQ            0xED   /* Power on sequence
> register */
> > +#define ILI9341_3GAMMA_EN            0xF2   /* 3 Gamma enable register
> */
> > +#define ILI9341_INTERFACE            0xF6   /* Interface control
> register */
> > +#define ILI9341_PRC                  0xF7   /* Pump ratio control
> register */
> > +
>
> All the following should be const.
>
ok


> Can any of the below be replaces by DEFINED constants?
> > +static u8 ili9341_cmd0[] =3D {0xc3, 0x08, 0x50};
> > +static u8 ili9341_powerb[] =3D {0x00, 0xc1, 0x30};
> > +static u8 ili9341_power_seq[] =3D {0x64, 0x03, 0x12, 0x81};
> > +static u8 ili9341_dtca[] =3D {0x85, 0x00, 0x78};
> > +static u8 ili9341_powera[] =3D {0x39, 0x2c, 0x00, 0x34, 0x02};
> > +static u8 ili9341_prc[] =3D {0x20};
> > +static u8 ili9341_dtcb[] =3D {0x00, 0x00};
> > +static u8 ili9341_frc[] =3D {0x00, 0x1b};
> > +static u8 ili9341_dfc1[] =3D {0x0a, 0xa2};
> > +static u8 ili9341_power1[] =3D {0x10};
> > +static u8 ili9341_power2[] =3D {0x10};
> > +static u8 ili9341_vcom1[] =3D {0x45, 0x15};
> > +static u8 ili9341_vcom2[] =3D {0x90};
> > +static u8 ili9341_mac[] =3D {0xc8};
> > +static u8 ili9341_gamma_en[] =3D {0x00};
> > +static u8 ili9341_rgb_intr[] =3D {0xc2};
> > +static u8 ili9341_dfc2[] =3D {0x0a, 0xa7, 0x27, 0x04};
> > +static u8 ili9341_column_addr[] =3D {0x00, 0x00, 0x00, 0xef};
> > +static u8 ili9341_page_addr[] =3D {0x00, 0x00, 0x01, 0x3f};
> > +static u8 ili9341_intr[] =3D {0x01, 0x00, 0x06};
> > +static u8 ili9341_gamma[] =3D {0x01};
> > +static u8 ili9341_pgamma[] =3D {0x0f, 0x29, 0x24, 0x0c, 0x0e, 0x09, 0x=
4e,
> 0x78,
> > +                             0x3c, 0x09, 0x13, 0x05, 0x17, 0x11, 0x00}=
;
> > +static u8 ili9341_ngamma[] =3D {0x00, 0x16, 0x1b, 0x04, 0x11, 0x07, 0x=
31,
> 0x33,
> > +                             0x42, 0x05, 0x0c, 0x0a, 0x28, 0x2f, 0x0f}=
;
> > +
> > +/**
> > + * enum ili9341_input - the format of the incoming signal to the panel
> > + *
> > + * The panel can be connected to various input streams and four of the=
m
> can
> > + * be selected by electronic straps on the display. However it is
> possible
> > + * to select another mode or override the electronic default with this
> > + * setting.
> > + */
> > +enum ili9341_input {
> > +     ILI9341_INPUT_PRGB_THROUGH =3D 0x0,
> > +     ILI9341_INPUT_PRGB_ALIGNED =3D 0x1,
> > +     ILI9341_INPUT_UNKNOWN =3D 0xf,
> > +};
> > +
> > +/**
> > + * struct ili9341_config - the system specific ILI9341 configuration
> > + * @width_mm: physical panel width [mm]
> > + * @height_mm: physical panel height [mm]
> > + * @input: the input/entry type used in this system, if this is set to
> > + * ILI9341_INPUT_UNKNOWN the driver will try to figure it out by probi=
ng
> > + * the hardware
> > + * @dclk_active_high: data/pixel clock active high, data will be clock=
ed
> > + * in on the rising edge of the DCLK (this is usually the case).
> > + * @de_active_high: DE (data entry) is active high
> > + * @hsync_active_high: HSYNC is active high
> > + * @vsync_active_high: VSYNC is active high
> > + */
> > +struct ili9341_config {
> > +     u32 width_mm;
> > +     u32 height_mm;
> > +     enum ili9341_input input;
> > +     bool dclk_active_high;
> > +     bool de_active_high;
> > +     bool hsync_active_high;
> > +     bool vsync_active_high;
> > +};
> > +
> > +struct ili9341 {
> > +     struct device *dev;
> > +     const struct ili9341_config *conf;
> > +     struct drm_panel panel;
> > +     struct regmap *regmap;
> > +     struct gpio_desc *reset_gpio;
> > +     struct gpio_desc *dc_gpio;
> > +     enum ili9341_input input;
>
> > +     struct videomode vm;
> videomode is not used. So drop this field and drop the include files
> that are no logner needed.
>
> ok

> > +};
> > +
> > +static inline struct ili9341 *panel_to_ili9341(struct drm_panel *panel=
)
> > +{
> > +     return container_of(panel, struct ili9341, panel);
> > +}
> > +
> > +int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,
> > +                       u8 bpw, const void *buf, size_t len)
> > +{
> > +     size_t max_chunk =3D spi_max_transfer_size(spi);
> > +     struct spi_transfer tr =3D {
> const?
>
> ok

> > +             .bits_per_word =3D bpw,
> > +             .speed_hz =3D speed_hz,
> > +             .len =3D len,
> > +     };
> > +     struct spi_message m;
> > +     size_t chunk;
> > +     int ret;
> > +
> > +     spi_message_init_with_transfers(&m, &tr, 1);
> > +
> > +     while (len) {
> > +             chunk =3D min(len, max_chunk);
> > +
> > +             tr.tx_buf =3D buf;
> > +             tr.len =3D chunk;
> > +             buf +=3D chunk;
> > +             len -=3D chunk;
> > +
> > +             ret =3D spi_sync(spi, &m);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     return 0;
> > +}
> > +static int ili9341_regmap_spi_write(void *context, const void *data,
> > +                                 size_t count)
> > +{
> > +     struct device *dev =3D context;
> > +     struct spi_device *spi =3D to_spi_device(dev);
> > +     struct ili9341 *ili =3D spi_get_drvdata(spi);
> > +     int ret =3D 0;
> > +
> > +     gpiod_set_value_cansleep(ili->dc_gpio, 0);
> > +
> > +     ret =3D ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+0, 1=
);
> > +     if (ret || count =3D=3D 1 ||
> > +                     ((u8 *)data)[0] =3D=3D ILI9341_GRAM ||
> > +                     ((u8 *)data)[0] =3D=3D ILI9341_DISPLAY_ON ||
> > +                     ((u8 *)data)[0] =3D=3D ILI9341_SLEEP_OUT ||
> > +                     ((u8 *)data)[0] =3D=3D ILI9341_DISPLAY_OFF)
> > +             return ret;
> > +
> > +     gpiod_set_value_cansleep(ili->dc_gpio, 1);
> > +
> > +     return ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+1,
> count-1);
> > +}
> > +
> > +static int ili9341_regmap_spi_read(void *context, const void *reg,
> > +                                size_t reg_size, void *val, size_t
> val_size)
> > +{
> > +     return 0;
> > +}
> Is this function really needed? If not delete it.
>
> regmap will be drop in next patch.

> > +
> > +static struct regmap_bus ili9341_regmap_bus =3D {
> > +     .write =3D ili9341_regmap_spi_write,
> > +     .read =3D ili9341_regmap_spi_read,
> > +     .reg_format_endian_default =3D REGMAP_ENDIAN_BIG,
> > +     .val_format_endian_default =3D REGMAP_ENDIAN_BIG,
> > +};
> > +
> > +static bool ili9341_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +     return false;
> > +}
> Is this function really nedded? If not delete it.
>
> > +
> > +static bool ili9341_writeable_reg(struct device *dev, unsigned int reg=
)
> > +{
> > +     /* Just register 0 is read-only */
> > +     if (reg =3D=3D 0x00)
> > +             return false;
> > +     return true;
> > +}
> > +
> > +static const struct regmap_config ili9341_regmap_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +     .max_register =3D 0xff,
> > +     .cache_type =3D REGCACHE_RBTREE,
> > +     .volatile_reg =3D ili9341_volatile_reg,
> > +     .writeable_reg =3D ili9341_writeable_reg,
> > +};
> > +
>
> No error checks - consider something like:
>
> static int bulk_write(struct ili9341 *ili, u8 reg, const u8[] data, int
> len)
> {
>         int err =3D ili->err;
>
>         if (!err) {
>                 err =3D regmap_bulk_write(ili->regmap, reg, data, len);
>                 if (err) {
>                         dev_err(...);
>                         ili->err =3D err;
>                 }
>         }
>
>         return err;
> }
>
> Then you can use this in the following, and make this more readable.
>
> ok, thanks for detail guide.


> > +static int ili9341_init(struct drm_panel *panel, struct ili9341 *ili)
> > +{
> > +     regmap_bulk_write(ili->regmap, 0xca,
> > +                                     ili9341_cmd0,
> sizeof(ili9341_cmd0));
> > +     regmap_bulk_write(ili->regmap, ILI9341_POWERB,
> > +                             ili9341_powerb, sizeof(ili9341_powerb));
> > +     regmap_bulk_write(ili->regmap, ILI9341_POWER_SEQ,
> > +                             ili9341_power_seq,
> sizeof(ili9341_power_seq));
> > +     regmap_bulk_write(ili->regmap, ILI9341_DTCA,
> > +                             ili9341_dtca, sizeof(ili9341_dtca));
> > +     regmap_bulk_write(ili->regmap, ILI9341_POWERA,
> > +                             ili9341_powera, sizeof(ili9341_powera));
> > +     regmap_write(ili->regmap, ILI9341_PRC, ili9341_prc[0]);
> > +     regmap_bulk_write(ili->regmap, ILI9341_DTCB,
> > +                             ili9341_dtcb, sizeof(ili9341_dtcb));
> > +     regmap_bulk_write(ili->regmap, ILI9341_FRC,
> > +                             ili9341_frc, sizeof(ili9341_frc));
> > +     regmap_bulk_write(ili->regmap, ILI9341_DFC,
> > +                             ili9341_dfc1, sizeof(ili9341_dfc1));
> > +     regmap_write(ili->regmap, ILI9341_POWER1, ili9341_power1[0]);
> > +     regmap_write(ili->regmap, ILI9341_POWER2, ili9341_power2[0]);
> > +     regmap_bulk_write(ili->regmap, ILI9341_VCOM1,
> > +                             ili9341_vcom1, sizeof(ili9341_vcom1));
> > +     regmap_write(ili->regmap, ILI9341_VCOM2, ili9341_vcom2[0]);
> > +     regmap_write(ili->regmap, ILI9341_MAC, ili9341_mac[0]);
> > +     regmap_write(ili->regmap, ILI9341_3GAMMA_EN, ili9341_gamma_en[0])=
;
> > +     regmap_write(ili->regmap, ILI9341_RGB_INTERFACE,
> ili9341_rgb_intr[0]);
> > +     regmap_bulk_write(ili->regmap, ILI9341_DFC,
> > +                             ili9341_dfc2, sizeof(ili9341_dfc2));
> > +
> > +     /* colomn address set */
> > +     regmap_bulk_write(ili->regmap, ILI9341_COLUMN_ADDR,
> > +                     ili9341_column_addr, sizeof(ili9341_column_addr))=
;
> > +
> > +     /* Page Address Set */
> > +     regmap_bulk_write(ili->regmap, ILI9341_PAGE_ADDR,
> > +                             ili9341_page_addr,
> sizeof(ili9341_page_addr));
> > +     regmap_bulk_write(ili->regmap, ILI9341_INTERFACE,
> > +                             ili9341_intr, sizeof(ili9341_intr));
> > +     regmap_write(ili->regmap, ILI9341_GRAM, 0);
> > +     msleep(200);
> > +
> > +     regmap_write(ili->regmap, ILI9341_GAMMA, ili9341_gamma[0]);
> > +     regmap_bulk_write(ili->regmap, ILI9341_PGAMMA,
> > +                             ili9341_pgamma, sizeof(ili9341_pgamma));
> > +     regmap_bulk_write(ili->regmap, ILI9341_NGAMMA,
> > +                             ili9341_ngamma, sizeof(ili9341_ngamma));
> > +     regmap_write(ili->regmap, ILI9341_SLEEP_OUT, 0);
> > +     msleep(200);
> > +
> > +     regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> > +
> > +     /* GRAM start writing */
> > +     regmap_write(ili->regmap, ILI9341_GRAM, 0);
> > +
> > +     dev_info(ili->dev, "initialized display\n");
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * This power-on sequence if from the datasheet, page 57.
> > + */
> > +static int ili9341_power_on(struct ili9341 *ili)
> > +{
> > +     /* Assert RESET */
> > +     gpiod_set_value(ili->reset_gpio, 1);
> > +
> > +     msleep(20);
> > +
> > +     /* De-assert RESET */
> > +     gpiod_set_value(ili->reset_gpio, 0);
> > +
> > +     msleep(10);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ili9341_power_off(struct ili9341 *ili)
> > +{
>
>         Assert reset?
> will add reset-pin control here.
>


> > +     return 0;
> > +}
> > +
> > +static int ili9341_disable(struct drm_panel *panel)
> > +{
> > +     struct ili9341 *ili =3D panel_to_ili9341(panel);
> > +     int ret;
> > +
> > +     ret =3D regmap_write(ili->regmap, ILI9341_DISPLAY_OFF, 0);
> > +     if (ret) {
> > +             dev_err(ili->dev, "unable to go to standby mode\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ili9341_unprepare(struct drm_panel *panel)
> > +{
> > +     struct ili9341 *ili =3D panel_to_ili9341(panel);
> > +
> > +     return ili9341_power_off(ili);
> > +}
> > +
> > +static int ili9341_prepare(struct drm_panel *panel)
> > +{
> > +     struct ili9341 *ili =3D panel_to_ili9341(panel);
> > +     int ret;
> > +
> > +     ret =3D ili9341_power_on(ili);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D ili9341_init(panel, ili);
> > +     if (ret < 0)
> > +             ili9341_unprepare(panel);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ili9341_enable(struct drm_panel *panel)
> > +{
> > +     struct ili9341 *ili =3D panel_to_ili9341(panel);
> > +     int ret;
> > +
> > +     ret =3D regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> > +     if (ret) {
> > +             dev_err(ili->dev, "unable to enable panel\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/* This is the only mode listed for parallel RGB in the datasheet */
> > +static const struct drm_display_mode prgb_320x240_mode =3D {
> > +     .clock =3D 6100,
> > +     .hdisplay =3D 240,
> > +     .hsync_start =3D 240 + 10,
> > +     .hsync_end =3D 240 + 10 + 10,
> > +     .htotal =3D 280,
> > +     .vdisplay =3D 320,
> > +     .vsync_start =3D 320 + 4,
> > +     .vsync_end =3D 320 + 4 + 2,
> > +     .vtotal =3D 328,
> > +     .vrefresh =3D 60,
> > +     .flags =3D 0,
> > +};
> > +
> > +static int ili9341_get_modes(struct drm_panel *panel,
> > +                             struct drm_connector *connector)
> > +{
> > +     struct ili9341 *ili =3D panel_to_ili9341(panel);
> > +     struct drm_device *drm =3D connector->dev;
> > +     struct drm_display_mode *mode;
> > +     struct drm_display_info *info;
> > +
> > +     info =3D &connector->display_info;
> > +     info->width_mm =3D ili->conf->width_mm;
> > +     info->height_mm =3D ili->conf->height_mm;
> > +     if (ili->conf->dclk_active_high)
> > +             info->bus_flags |=3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> > +     else
> > +             info->bus_flags |=3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> > +
> > +     if (ili->conf->de_active_high)
> > +             info->bus_flags |=3D DRM_BUS_FLAG_DE_HIGH;
> > +     else
> > +             info->bus_flags |=3D DRM_BUS_FLAG_DE_LOW;
> > +
> > +     switch (ili->input) {
> > +     case ILI9341_INPUT_PRGB_THROUGH:
> > +     case ILI9341_INPUT_PRGB_ALIGNED:
> > +             mode =3D drm_mode_duplicate(drm, &prgb_320x240_mode);
> > +             break;
> > +     default:
> > +             mode =3D NULL;
> > +             break;
> > +     }
> > +     if (!mode) {
> > +             DRM_ERROR("bad mode or failed to add mode\n");
> > +             return -EINVAL;
> > +     }
> > +     drm_mode_set_name(mode);
> > +     /*
> > +      * This is the preferred mode because most people are going
> > +      * to want to use the display with VGA type graphics.
> > +      */
> > +     mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +
> > +     /* Set up the polarity */
> > +     if (ili->conf->hsync_active_high)
> > +             mode->flags |=3D DRM_MODE_FLAG_PHSYNC;
> > +     else
> > +             mode->flags |=3D DRM_MODE_FLAG_NHSYNC;
> > +     if (ili->conf->vsync_active_high)
> > +             mode->flags |=3D DRM_MODE_FLAG_PVSYNC;
> > +     else
> > +             mode->flags |=3D DRM_MODE_FLAG_NVSYNC;
> > +
> > +     mode->width_mm =3D ili->conf->width_mm;
> > +     mode->height_mm =3D ili->conf->height_mm;
> > +     drm_mode_probed_add(connector, mode);
> > +
> > +     return 1; /* Number of modes */
> > +}
> > +
> > +static const struct drm_panel_funcs ili9341_drm_funcs =3D {
> > +     .disable =3D ili9341_disable,
> > +     .unprepare =3D ili9341_unprepare,
> > +     .prepare =3D ili9341_prepare,
> > +     .enable =3D ili9341_enable,
> > +     .get_modes =3D ili9341_get_modes,
> > +};
> > +
> > +static int ili9341_probe(struct spi_device *spi)
> > +{
> > +     struct device *dev =3D &spi->dev;
> > +     struct ili9341 *ili;
> > +     const struct regmap_config *regmap_config;
> > +     int ret;
> > +
> > +     ili =3D devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> > +     if (!ili)
> > +             return -ENOMEM;
> > +
> > +     spi_set_drvdata(spi, ili);
> > +
> > +     ili->dev =3D dev;
> > +     /*
> > +      * Every new incarnation of this display must have a unique
> > +      * data entry for the system in this driver.
> > +      */
> > +     ili->conf =3D of_device_get_match_data(dev);
> > +     if (!ili->conf) {
> > +             dev_err(dev, "missing device configuration\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     ili->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> GPIOD_OUT_HIGH);
> > +     if (IS_ERR(ili->reset_gpio)) {
> > +             dev_err(dev, "failed to get RESET GPIO\n");
> > +             return PTR_ERR(ili->reset_gpio);
> > +     }
> > +
> > +     ili->dc_gpio =3D devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW=
);
> > +     if (IS_ERR(ili->dc_gpio)) {
> > +             dev_err(dev, "failed to get DC GPIO\n");
> > +             return PTR_ERR(ili->dc_gpio);
> > +     }
> > +
> > +     spi->bits_per_word =3D 8;
> > +     ret =3D spi_setup(spi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "spi setup failed.\n");
> > +             return ret;
> > +     }
> > +
> > +     regmap_config =3D &ili9341_regmap_config;
> > +
> > +     ili->regmap =3D devm_regmap_init(dev, &ili9341_regmap_bus, dev,
> > +                                    regmap_config);
> > +     if (IS_ERR(ili->regmap)) {
> > +             dev_err(dev, "failed to allocate register map\n");
> > +             return PTR_ERR(ili->regmap);
> > +     }
> > +
> > +     ili->input =3D ili->conf->input;
> > +
> > +     drm_panel_init(&ili->panel, dev, &ili9341_drm_funcs,
> > +                    DRM_MODE_CONNECTOR_DPI);
> > +
> > +     return drm_panel_add(&ili->panel);
> > +}
> > +
> > +static int ili9341_remove(struct spi_device *spi)
> > +{
> > +     struct ili9341 *ili =3D spi_get_drvdata(spi);
> > +
> > +     ili9341_power_off(ili);
> > +     drm_panel_remove(&ili->panel);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * The Stm32f429-disco board has a panel ili9341 connected to ltdc
> controller
> > + */
> > +static const struct ili9341_config ili9341_data =3D {
> This should be named "disco" something as this is m32f429-disco
> specific.
>
> ok

> > +     .width_mm =3D 65,
> > +     .height_mm =3D 50,
> > +     .input =3D ILI9341_INPUT_PRGB_THROUGH,
> > +     .dclk_active_high =3D true,
> > +     .de_active_high =3D false,
> > +     .hsync_active_high =3D false,
> > +     .vsync_active_high =3D false,
> > +};
> > +
> > +static const struct of_device_id ili9341_of_match[] =3D {
> > +     {
> > +             .compatible =3D "stm32f429,ltdc-panel",
> > +             .data =3D &ili9341_data,
> > +     },
>
>
> > +     {
> > +             .compatible =3D "ilitek,ili9341",
> > +             .data =3D NULL,
> This part is wrong, as ilitek,ili9341 is just the generic part.
> Only the first entry is relevant.
>
>
> ok

> > +     },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ili9341_of_match);
> > +
> > +static struct spi_driver ili9341_driver =3D {
> > +     .probe =3D ili9341_probe,
> > +     .remove =3D ili9341_remove,
> > +     .driver =3D {
> > +             .name =3D "panel-ilitek-ili9341",
> > +             .of_match_table =3D ili9341_of_match,
> > +     },
> > +};
> > +module_spi_driver(ili9341_driver);
> > +
> > +MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
> > +MODULE_DESCRIPTION("ILI9341 LCD panel driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.7.4
>

--000000000000393d9305a520412a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sam,</div><div><br></div><div>=C2=A0 Thanks for yo=
ur comments, i will rework this panel driver after l3gd20 patch submission.=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&g=
t; =E4=BA=8E2020=E5=B9=B45=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=
=E5=8D=885:02=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Dillon.<br>
<br>
Patch submissions starts to look fine.<br>
<br>
On Fri, May 08, 2020 at 12:13:14PM +0800, <a href=3D"mailto:dillon.minfei@g=
mail.com" target=3D"_blank">dillon.minfei@gmail.com</a> wrote:<br>
&gt; From: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This is a driver for 320x240 TFT panels, accepting a rgb input<br>
&gt; streams that get adapted and scaled to the panel.<br>
This driver is, I suppose, prepared to be a driver for ILI9341 based<br>
panles, and as such not for a fixed resolution.<br>
I expect (hope) we in the future will see more panels added.<br>
<br></blockquote><div>As i checked ili9341 datasheets, this panel just supp=
ort 240x320 resolution only.=C2=A0 if i&#39;m wrong , please correct me. th=
anks</div><div><a href=3D"https://cdn-shop.adafruit.com/datasheets/ILI9341.=
pdf">https://cdn-shop.adafruit.com/datasheets/ILI9341.pdf</a><br></div><div=
><br></div><div>This panel can support 9 different kinds of interface , &qu=
ot;3/4-line Serial Interface&quot; have been supported by tiny/ili9341.c. i=
 was verified it</div><div>but the performance=C2=A0on stm32f4 is very low.=
=C2=A0</div><div><br></div><div>currently, i just have stm32f429-disco in h=
ands, with 18-bit parallel rgb bus connected on this board. reference to pa=
nel-ilitek-ili9322 and panel-ilitek-ili9881 driver, i have some plan to rew=
rite this driver.=C2=A0</div><div><br></div><div>1 add your below comments =
in.</div><div>2 use dc-gpio, reset-gpio, rgb-interface-bits from dts to con=
fig panel interface.</div><div>3 drop regmap, porting drm_mipi_dbi&#39;s=C2=
=A0mipi_dbi_command to config panel paramter. like tiny/ili9341.c</div><div=
>4 support rgb-16, rgb-18 interface.</div><div>5 use optional regulator or =
power gpio to control panel&#39;s power, as panel power is always on for my=
 board, so i can&#39;t test this part. could i add the code which can&#39;t=
 be tested?</div><div>6 support rotation in panel config (currently , i rot=
ate the screen by kernel cmdline paramter)</div><div><br></div><div>if you =
have any other common panel configuration should be add , please inform me.=
</div><div><br></div><div>thanks.</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Some things to fix, see comments in the follwoing.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
&gt; <br>
&gt; Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.co=
m" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 561 +++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 3 files changed, 570 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c<=
br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kco=
nfig<br>
&gt; index a1723c1..e42692c 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/panel/Kconfig<br>
&gt; @@ -95,6 +95,14 @@ config DRM_PANEL_ILITEK_IL9322<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable supp=
ort for Ilitek IL9322<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QVGA (320x240) RGB, YUV and ITU-T BT.=
656 panels.<br>
&gt;=C2=A0 <br>
&gt; +config DRM_PANEL_ILITEK_IL9341<br>
ILI9341 - so the config name matches the name of the driver IC.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Ilitek ILI9341 240x320 QVGA panels=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on OF &amp;&amp; SPI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select REGMAP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable support f=
or Ilitek IL9341<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0QVGA (240x320) RGB panels.<br>
See comment to the changelog, the driver is more generic - I assume.<br>
So the wording here can be improved to express this.<br>
<br></blockquote><div>Add support RGB 16bits and RGB 18bits bus only ?=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 config DRM_PANEL_ILITEK_ILI9881C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Ilitek ILI9881C-based panels&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt; diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Ma=
kefile<br>
&gt; index 96a883c..d123543 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Makefile<br>
&gt; +++ b/drivers/gpu/drm/panel/Makefile<br>
&gt; @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) +=3D panel-elid=
a-kd35t133.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) +=3D panel-feixin-k1=
01-im2ba02.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) +=3D panel-feiya=
ng-fy07024di26a30d.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) +=3D panel-ilitek-ili9322.=
o<br>
&gt; +obj-$(CONFIG_DRM_PANEL_ILITEK_IL9341) +=3D panel-ilitek-ili9341.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) +=3D panel-ilitek-ili988=
1c.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) +=3D panel-innolux-p079z=
ca.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me0=
5000.o<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9341.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ec22d80<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c<br>
&gt; @@ -0,0 +1,561 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-only<br>
&gt; +/*<br>
&gt; + * Ilitek ILI9341 TFT LCD drm_panel driver.<br>
&gt; + *<br>
&gt; + * This panel can be configured to support:<br>
&gt; + * - 16-bit parallel RGB interface<br>
The interface to ILI9341 is SPI, and the interface between the ILI9341<br>
and the panel is more of an itnernal thing. Or did I get this worng?<br>
<br></blockquote><div>SPI is for register configuration.=C2=A0 RGB parallel=
 for data transfer</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; + *<br>
&gt; + * Copyright (C) 2020 Dillon Min &lt;<a href=3D"mailto:dillon.minfei@=
gmail.com" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; + * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/bitops.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/regulator/consumer.h&gt;<br>
&gt; +#include &lt;linux/spi/spi.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;video/mipi_display.h&gt;<br>
&gt; +#include &lt;video/of_videomode.h&gt;<br>
&gt; +#include &lt;video/videomode.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_modes.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +<br>
&gt; +#define DEFAULT_SPI_SPEED=C2=A0 =C2=A0 10000000<br>
&gt; +<br>
<br>
Please use same case for hex numbers in the driver.<br>
My personal preferences is lower-case.<br>
<br></blockquote><div>in next patch, spi speed will be configured by dts, n=
ot hardcode here.</div><div>below register address will change to lower-cas=
e hex numbers.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; +#define ILI9341_SLEEP_OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
11=C2=A0 =C2=A0/* Sleep out register */<br>
&gt; +#define ILI9341_GAMMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x26=C2=A0 =C2=A0/* Gamma register */<br>
&gt; +#define ILI9341_DISPLAY_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x28=C2=
=A0 =C2=A0/* Display off register */<br>
&gt; +#define ILI9341_DISPLAY_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
29=C2=A0 =C2=A0/* Display on register */<br>
&gt; +#define ILI9341_COLUMN_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2A=C2=
=A0 =C2=A0/* Colomn address register */<br>
&gt; +#define ILI9341_PAGE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
2B=C2=A0 =C2=A0/* Page address register */<br>
&gt; +#define ILI9341_GRAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x2C=C2=A0 =C2=A0/* GRAM register */<br>
&gt; +#define ILI9341_MAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x36=C2=A0 =C2=A0/* Memory Access Control register*/<br>
&gt; +#define ILI9341_PIXEL_FORMAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3A=C2=
=A0 =C2=A0/* Pixel Format register */<br>
&gt; +#define ILI9341_WDB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x51=C2=A0 =C2=A0/* Write Brightness Display<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_WCD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x53=C2=A0 =C2=A0/* Write Control Display<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_RGB_INTERFACE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xB0=C2=A0 =
=C2=A0/* RGB Interface Signal Control */<br>
&gt; +#define ILI9341_FRC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0xB1=C2=A0 =C2=A0/* Frame Rate Control register */<br>
&gt; +#define ILI9341_BPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0xB5=C2=A0 =C2=A0/* Blanking Porch Control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_DFC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0xB6=C2=A0 =C2=A0/* Display Function Control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_POWER1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xC0=C2=A0 =C2=A0/* Power Control 1 register */<br>
&gt; +#define ILI9341_POWER2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xC1=C2=A0 =C2=A0/* Power Control 2 register */<br>
&gt; +#define ILI9341_VCOM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0xC5=C2=A0 =C2=A0/* VCOM Control 1 register */<br>
&gt; +#define ILI9341_VCOM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0xC7=C2=A0 =C2=A0/* VCOM Control 2 register */<br>
&gt; +#define ILI9341_POWERA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xCB=C2=A0 =C2=A0/* Power control A register */<br>
&gt; +#define ILI9341_POWERB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xCF=C2=A0 =C2=A0/* Power control B register */<br>
&gt; +#define ILI9341_PGAMMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xE0=C2=A0 =C2=A0/* Positive Gamma Correction<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_NGAMMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xE1=C2=A0 =C2=A0/* Negative Gamma Correction<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 * register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
&gt; +#define ILI9341_DTCA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00xE8=C2=A0 =C2=A0/* Driver timing control A */<br>
&gt; +#define ILI9341_DTCB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00xEA=C2=A0 =C2=A0/* Driver timing control B */<br>
&gt; +#define ILI9341_POWER_SEQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
ED=C2=A0 =C2=A0/* Power on sequence register */<br>
&gt; +#define ILI9341_3GAMMA_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
F2=C2=A0 =C2=A0/* 3 Gamma enable register */<br>
&gt; +#define ILI9341_INTERFACE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
F6=C2=A0 =C2=A0/* Interface control register */<br>
&gt; +#define ILI9341_PRC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0xF7=C2=A0 =C2=A0/* Pump ratio control register */<br>
&gt; +<br>
<br>
All the following should be const.<br></blockquote><div>ok</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Can any of the below be replaces by DEFINED constants?<br>
&gt; +static u8 ili9341_cmd0[] =3D {0xc3, 0x08, 0x50};<br>
&gt; +static u8 ili9341_powerb[] =3D {0x00, 0xc1, 0x30};<br>
&gt; +static u8 ili9341_power_seq[] =3D {0x64, 0x03, 0x12, 0x81};<br>
&gt; +static u8 ili9341_dtca[] =3D {0x85, 0x00, 0x78};<br>
&gt; +static u8 ili9341_powera[] =3D {0x39, 0x2c, 0x00, 0x34, 0x02};<br>
&gt; +static u8 ili9341_prc[] =3D {0x20};<br>
&gt; +static u8 ili9341_dtcb[] =3D {0x00, 0x00};<br>
&gt; +static u8 ili9341_frc[] =3D {0x00, 0x1b};<br>
&gt; +static u8 ili9341_dfc1[] =3D {0x0a, 0xa2};<br>
&gt; +static u8 ili9341_power1[] =3D {0x10};<br>
&gt; +static u8 ili9341_power2[] =3D {0x10};<br>
&gt; +static u8 ili9341_vcom1[] =3D {0x45, 0x15};<br>
&gt; +static u8 ili9341_vcom2[] =3D {0x90};<br>
&gt; +static u8 ili9341_mac[] =3D {0xc8};<br>
&gt; +static u8 ili9341_gamma_en[] =3D {0x00};<br>
&gt; +static u8 ili9341_rgb_intr[] =3D {0xc2};<br>
&gt; +static u8 ili9341_dfc2[] =3D {0x0a, 0xa7, 0x27, 0x04};<br>
&gt; +static u8 ili9341_column_addr[] =3D {0x00, 0x00, 0x00, 0xef};<br>
&gt; +static u8 ili9341_page_addr[] =3D {0x00, 0x00, 0x01, 0x3f};<br>
&gt; +static u8 ili9341_intr[] =3D {0x01, 0x00, 0x06};<br>
&gt; +static u8 ili9341_gamma[] =3D {0x01};<br>
&gt; +static u8 ili9341_pgamma[] =3D {0x0f, 0x29, 0x24, 0x0c, 0x0e, 0x09, 0=
x4e, 0x78,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3c, 0x09, 0x13, 0x05, 0x17, 0x11, 0x00=
};<br>
&gt; +static u8 ili9341_ngamma[] =3D {0x00, 0x16, 0x1b, 0x04, 0x11, 0x07, 0=
x31, 0x33,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x42, 0x05, 0x0c, 0x0a, 0x28, 0x2f, 0x0f=
};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * enum ili9341_input - the format of the incoming signal to the pane=
l<br>
&gt; + *<br>
&gt; + * The panel can be connected to various input streams and four of th=
em can<br>
&gt; + * be selected by electronic straps on the display. However it is pos=
sible<br>
&gt; + * to select another mode or override the electronic default with thi=
s<br>
&gt; + * setting.<br>
&gt; + */<br>
&gt; +enum ili9341_input {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ILI9341_INPUT_PRGB_THROUGH =3D 0x0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ILI9341_INPUT_PRGB_ALIGNED =3D 0x1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ILI9341_INPUT_UNKNOWN =3D 0xf,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * struct ili9341_config - the system specific ILI9341 configuration<=
br>
&gt; + * @width_mm: physical panel width [mm]<br>
&gt; + * @height_mm: physical panel height [mm]<br>
&gt; + * @input: the input/entry type used in this system, if this is set t=
o<br>
&gt; + * ILI9341_INPUT_UNKNOWN the driver will try to figure it out by prob=
ing<br>
&gt; + * the hardware<br>
&gt; + * @dclk_active_high: data/pixel clock active high, data will be cloc=
ked<br>
&gt; + * in on the rising edge of the DCLK (this is usually the case).<br>
&gt; + * @de_active_high: DE (data entry) is active high<br>
&gt; + * @hsync_active_high: HSYNC is active high<br>
&gt; + * @vsync_active_high: VSYNC is active high<br>
&gt; + */<br>
&gt; +struct ili9341_config {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 width_mm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 height_mm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum ili9341_input input;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool dclk_active_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool de_active_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool hsync_active_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool vsync_active_high;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ili9341 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct ili9341_config *conf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *reset_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *dc_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum ili9341_input input;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
videomode is not used. So drop this field and drop the include files<br>
that are no logner needed.<br>
<br></blockquote><div>ok=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct ili9341 *panel_to_ili9341(struct drm_panel *pane=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(panel, struct ili9341, panel)=
;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0u8 bpw, const void *buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t max_chunk =3D spi_max_transfer_size(spi);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_transfer tr =3D {<br>
const?<br>
<br></blockquote><div>ok=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bits_per_word =3D bp=
w,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.speed_hz =3D speed_h=
z,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.len =3D len,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_message m;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t chunk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi_message_init_with_transfers(&amp;m, &amp;tr, =
1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk =3D min(len, ma=
x_chunk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr.tx_buf =3D buf;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr.len =3D chunk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf +=3D chunk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len -=3D chunk;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D spi_sync(spi,=
 &amp;m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +static int ili9341_regmap_spi_write(void *context, const void *data,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_device *spi =3D to_spi_device(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D spi_get_drvdata(spi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ili-&gt;dc_gpio, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ili9341_spi_transfer(spi, DEFAULT_SPI_SPE=
ED, 8, data+0, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret || count =3D=3D 1 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0((u8 *)data)[0] =3D=3D ILI9341_GRAM ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0((u8 *)data)[0] =3D=3D ILI9341_DISPLAY_ON ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0((u8 *)data)[0] =3D=3D ILI9341_SLEEP_OUT ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0((u8 *)data)[0] =3D=3D ILI9341_DISPLAY_OFF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ili-&gt;dc_gpio, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ili9341_spi_transfer(spi, DEFAULT_SPI_SPEE=
D, 8, data+1, count-1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_regmap_spi_read(void *context, const void *reg,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t reg_size, void *val, size=
_t val_size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
Is this function really needed? If not delete it.<br>
<br></blockquote><div>regmap will be drop in next patch.=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +static struct regmap_bus ili9341_regmap_bus =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.write =3D ili9341_regmap_spi_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read =3D ili9341_regmap_spi_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_format_endian_default =3D REGMAP_ENDIAN_BIG,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_format_endian_default =3D REGMAP_ENDIAN_BIG,=
<br>
&gt; +};<br>
&gt; +<br>
&gt; +static bool ili9341_volatile_reg(struct device *dev, unsigned int reg=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +}<br>
Is this function really nedded? If not delete it.<br>
<br>
&gt; +<br>
&gt; +static bool ili9341_writeable_reg(struct device *dev, unsigned int re=
g)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Just register 0 is read-only */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg =3D=3D 0x00)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct regmap_config ili9341_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_register =3D 0xff,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cache_type =3D REGCACHE_RBTREE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.volatile_reg =3D ili9341_volatile_reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.writeable_reg =3D ili9341_writeable_reg,<br>
&gt; +};<br>
&gt; +<br>
<br>
No error checks - consider something like:<br>
<br>
static int bulk_write(struct ili9341 *ili, u8 reg, const u8[] data, int len=
)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err =3D ili-&gt;err;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D regmap_bulk=
_write(ili-&gt;regmap, reg, data, len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(...);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ili-&gt;err =3D err;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
}<br>
<br>
Then you can use this in the following, and make this more readable.<br>
<br></blockquote><div>ok, thanks for detail guide.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +static int ili9341_init(struct drm_panel *panel, struct ili9341 *ili)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, 0xca,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_cmd0=
, sizeof(ili9341_cmd0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_POWERB,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_powerb, sizeof(ili9341_powerb));=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_POWER_S=
EQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_power_seq, sizeof(ili9341_power_=
seq));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_DTCA,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_dtca, sizeof(ili9341_dtca));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_POWERA,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_powera, sizeof(ili9341_powera));=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_PRC, ili9341=
_prc[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_DTCB,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_dtcb, sizeof(ili9341_dtcb));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_FRC,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_frc, sizeof(ili9341_frc));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_DFC,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_dfc1, sizeof(ili9341_dfc1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_POWER1, ili9=
341_power1[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_POWER2, ili9=
341_power2[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_VCOM1,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_vcom1, sizeof(ili9341_vcom1));<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_VCOM2, ili93=
41_vcom2[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_MAC, ili9341=
_mac[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_3GAMMA_EN, i=
li9341_gamma_en[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_RGB_INTERFAC=
E, ili9341_rgb_intr[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_DFC,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_dfc2, sizeof(ili9341_dfc2));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* colomn address set */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_COLUMN_=
ADDR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ili9341_column_addr, sizeof(ili9341_column_addr));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Page Address Set */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_PAGE_AD=
DR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_page_addr, sizeof(ili9341_page_a=
ddr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_INTERFA=
CE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_intr, sizeof(ili9341_intr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_GRAM, 0);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(200);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_GAMMA, ili93=
41_gamma[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_PGAMMA,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_pgamma, sizeof(ili9341_pgamma));=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_bulk_write(ili-&gt;regmap, ILI9341_NGAMMA,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_ngamma, sizeof(ili9341_ngamma));=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_SLEEP_OUT, 0=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(200);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_DISPLAY_ON, =
0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* GRAM start writing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(ili-&gt;regmap, ILI9341_GRAM, 0);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(ili-&gt;dev, &quot;initialized display\n=
&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This power-on sequence if from the datasheet, page 57.<br>
&gt; + */<br>
&gt; +static int ili9341_power_on(struct ili9341 *ili)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Assert RESET */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(ili-&gt;reset_gpio, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(20);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* De-assert RESET */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value(ili-&gt;reset_gpio, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(10);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_power_off(struct ili9341 *ili)<br>
&gt; +{<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert reset?<br>
will add reset-pin control here.<br></blockquote><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_disable(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D panel_to_ili9341(panel);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(ili-&gt;regmap, ILI9341_DISP=
LAY_OFF, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(ili-&gt;dev, =
&quot;unable to go to standby mode\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_unprepare(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D panel_to_ili9341(panel);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ili9341_power_off(ili);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_prepare(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D panel_to_ili9341(panel);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ili9341_power_on(ili);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ili9341_init(panel, ili);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ili9341_unprepare(pan=
el);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_enable(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D panel_to_ili9341(panel);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(ili-&gt;regmap, ILI9341_DISP=
LAY_ON, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(ili-&gt;dev, =
&quot;unable to enable panel\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* This is the only mode listed for parallel RGB in the datasheet */<=
br>
&gt; +static const struct drm_display_mode prgb_320x240_mode =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.clock =3D 6100,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hdisplay =3D 240,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_start =3D 240 + 10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_end =3D 240 + 10 + 10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.htotal =3D 280,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vdisplay =3D 320,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_start =3D 320 + 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_end =3D 320 + 4 + 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vtotal =3D 328,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vrefresh =3D 60,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.flags =3D 0,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int ili9341_get_modes(struct drm_panel *panel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D panel_to_ili9341(panel);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D connector-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_info *info;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info =3D &amp;connector-&gt;display_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;width_mm =3D ili-&gt;conf-&gt;width_mm;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;height_mm =3D ili-&gt;conf-&gt;height_mm=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ili-&gt;conf-&gt;dclk_active_high)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;bus_flags |=
=3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;bus_flags |=
=3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ili-&gt;conf-&gt;de_active_high)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;bus_flags |=
=3D DRM_BUS_FLAG_DE_HIGH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;bus_flags |=
=3D DRM_BUS_FLAG_DE_LOW;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (ili-&gt;input) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case ILI9341_INPUT_PRGB_THROUGH:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case ILI9341_INPUT_PRGB_ALIGNED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D drm_mode_dup=
licate(drm, &amp;prgb_320x240_mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!mode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;bad m=
ode or failed to add mode\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_set_name(mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This is the preferred mode because most people=
 are going<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * to want to use the display with VGA type graph=
ics.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode-&gt;type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE=
_TYPE_PREFERRED;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set up the polarity */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ili-&gt;conf-&gt;hsync_active_high)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;flags |=3D D=
RM_MODE_FLAG_PHSYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;flags |=3D D=
RM_MODE_FLAG_NHSYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ili-&gt;conf-&gt;vsync_active_high)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;flags |=3D D=
RM_MODE_FLAG_PVSYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;flags |=3D D=
RM_MODE_FLAG_NVSYNC;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode-&gt;width_mm =3D ili-&gt;conf-&gt;width_mm;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode-&gt;height_mm =3D ili-&gt;conf-&gt;height_mm=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_probed_add(connector, mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 1; /* Number of modes */<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_panel_funcs ili9341_drm_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable =3D ili9341_disable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unprepare =3D ili9341_unprepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.prepare =3D ili9341_prepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable =3D ili9341_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_modes =3D ili9341_get_modes,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int ili9341_probe(struct spi_device *spi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;spi-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct regmap_config *regmap_config;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili =3D devm_kzalloc(dev, sizeof(struct ili9341),=
 GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ili)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi_set_drvdata(spi, ili);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;dev =3D dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Every new incarnation of this display must hav=
e a unique<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * data entry for the system in this driver.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;conf =3D of_device_get_match_data(dev);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ili-&gt;conf) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;mi=
ssing device configuration\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;reset_gpio =3D devm_gpiod_get_optional(de=
v, &quot;reset&quot;, GPIOD_OUT_HIGH);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ili-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to get RESET GPIO\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ili-&g=
t;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;dc_gpio =3D devm_gpiod_get_optional(dev, =
&quot;dc&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ili-&gt;dc_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to get DC GPIO\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ili-&g=
t;dc_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi-&gt;bits_per_word =3D 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D spi_setup(spi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;sp=
i setup failed.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_config =3D &amp;ili9341_regmap_config;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;regmap =3D devm_regmap_init(dev, &amp;ili=
9341_regmap_bus, dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_config);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ili-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to allocate register map\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ili-&g=
t;regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili-&gt;input =3D ili-&gt;conf-&gt;input;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_init(&amp;ili-&gt;panel, dev, &amp;ili9=
341_drm_funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_MODE_CONNECTOR_DPI);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return drm_panel_add(&amp;ili-&gt;panel);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ili9341_remove(struct spi_device *spi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ili9341 *ili =3D spi_get_drvdata(spi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili9341_power_off(ili);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_remove(&amp;ili-&gt;panel);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The Stm32f429-disco board has a panel ili9341 connected to ltdc co=
ntroller<br>
&gt; + */<br>
&gt; +static const struct ili9341_config ili9341_data =3D {<br>
This should be named &quot;disco&quot; something as this is m32f429-disco<b=
r>
specific.<br>
<br></blockquote><div>ok=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0.width_mm =3D 65,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.height_mm =3D 50,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.input =3D ILI9341_INPUT_PRGB_THROUGH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dclk_active_high =3D true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.de_active_high =3D false,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_active_high =3D false,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_active_high =3D false,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id ili9341_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;stm32f429,ltdc-panel&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;ili934=
1_data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;ilitek,ili9341&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D NULL,<br>
This part is wrong, as ilitek,ili9341 is just the generic part.<br>
Only the first entry is relevant.<br>
<br>
<br></blockquote><div>ok=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, ili9341_of_match);<br>
&gt; +<br>
&gt; +static struct spi_driver ili9341_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D ili9341_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D ili9341_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;panel=
-ilitek-ili9341&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D i=
li9341_of_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_spi_driver(ili9341_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Dillon Min &lt;<a href=3D"mailto:dillon.minfei@gm=
ail.com" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;ILI9341 LCD panel driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; -- <br>
&gt; 2.7.4<br>
</blockquote></div></div>

--000000000000393d9305a520412a--

--===============0032480355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0032480355==--
