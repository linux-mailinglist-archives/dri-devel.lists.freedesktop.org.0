Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A576A96C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 08:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993AD10E0D6;
	Tue,  1 Aug 2023 06:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAB410E0D6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 06:44:31 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso3985248a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690872270; x=1691477070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjcjOe+3KylO9pMc2ZyArss7NYIx0VmzNX+VO4a56sU=;
 b=w8vwOc/hOBXr2HSq6xwFW2pb8ouqiVVlzbKT5LvFvtU6utTLplLpCOXPmxbN9b0Mta
 bvBO7/dE06xC+Cm2uAkQHJAn5HliImtqN069PpCtY3AATeOKXpka/5xUJ5GXoKm5gpPo
 1lTkmH3f2pHzyuZYyiy+VL0klugDRmGvQyRMWe+slhdO2+wQsUFddYX/YEnyEu20Z9s8
 +cgFZ2q+UgmzBp6O1B56XnoPmBTpJPZeTUPPmohpiDq2uwiC/ZnAVvn2O1X2K0m3R8TO
 /agKY6AMWp1x6tVMnhI49VwWlDPFJEmQSuxzYM19Dv77/j1Lp7ZIvITlC5cljl+Rv0bl
 mVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690872270; x=1691477070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjcjOe+3KylO9pMc2ZyArss7NYIx0VmzNX+VO4a56sU=;
 b=ei34KHZrICKdrdQvhjYO45n6/ALPtecVDOz/BPP7+PI1vyTH4fNpQPFUvySJdGsiYO
 Ruurn6QEsFlfDpDHjOBtPkyylmRaZtJI231bFSgh88mOIkRf7eiXuYYq7503XBxaXaS4
 PmmIos+spV709WHmD4qz9T+8jyKSZ3zCVvdMdiPD1vRYsxYPrn2rTYFnId/w8BkjLtUh
 fuPw8pL1v429TkkEdWKhH5CEwwEn0oyFYU8mqCRsCEQ54Vvk/ZGOTZKvHgiX8wEkLgSi
 Nym1eCAYnGuNvfKqiZafBxe2QAnjFDX0om5U8+LQtJ4HiPGzS3rpW8PCiRoYdDlhlOz9
 DiPQ==
X-Gm-Message-State: ABy/qLYUZjHMBZn5hPFg7BfuNaIo0AYOL6lVJuzhS89iiwz4QGME/mpu
 smLslTXn0DYmQayuZ1L3M3GR+bTISYLcdCRc/ABQUw==
X-Google-Smtp-Source: APBJJlE0STmFY6uOWV8g4tVFisY1JJMcNLepFhzZMRex4mK6EZhqTfJ3EXhh1Wi40MHM4noSOCnrDkfmbxkZX0gppd0=
X-Received: by 2002:a17:90b:238f:b0:268:e31b:decd with SMTP id
 mr15-20020a17090b238f00b00268e31bdecdmr1912125pjb.11.1690872270443; Mon, 31
 Jul 2023 23:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <20230703-fix-boe-tv101wum-nl6-v3-3-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-3-bd6e9432c755@linaro.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 1 Aug 2023 14:44:18 +0800
Message-ID: <CAHwB_NJ7vjb7UGKkwvAGtVgzpAFVPozLXRn=-Rp5sYjwCxDh8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/panel: ili9882t: Break out as separate driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 9:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The Starry ILI9882t-based panel should never have been part of the boe
> tv101wum driver, it is clearly based on the Ilitek ILI9882t display
> controller and if you look at the custom command sequences for the
> panel these clearly contain the signature Ilitek page switch (0xff)
> commands. The hardware has nothing in common with the other panels
> supported by this driver.
>
> Break this out into a separate driver and config symbol instead.
>
> If the placement here is out of convenience for using similar code,
> we should consider creating a helper library instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                  |   9 +
>  drivers/gpu/drm/panel/Makefile                 |   1 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 386 -------------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  | 739 +++++++++++++++++++=
++++++
>  4 files changed, 749 insertions(+), 386 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index 1a0fd0754692..c39e949a26eb 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -203,6 +203,15 @@ config DRM_PANEL_ILITEK_ILI9881C
>           Say Y if you want to enable support for panels based on the
>           Ilitek ILI9881c controller.
>
> +config DRM_PANEL_ILITEK_ILI9882T
> +       tristate "Ilitek ILI9882t-based panels"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         Say Y if you want to enable support for panels based on the
> +         Ilitek ILI9882t controller.
> +
>  config DRM_PANEL_INNOLUX_EJ030NA
>          tristate "Innolux EJ030NA 320x480 LCD panel"
>          depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index 499e38244253..75c2533d337e 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) +=3D panel-himax-h=
x8394.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) +=3D panel-ilitek-ili9322.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) +=3D panel-ilitek-ili9341.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) +=3D panel-ilitek-ili9881c.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) +=3D panel-ilitek-ili9882t.o
>  obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) +=3D panel-innolux-ej030na.o
>  obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) +=3D panel-innolux-p079zca.o
>  obj-$(CONFIG_DRM_PANEL_JADARD_JD9365DA_H3) +=3D panel-jadard-jd9365da-h3=
.o
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu=
/drm/panel/panel-boe-tv101wum-nl6.c
> index 358918e0f03f..14a0ee95a803 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1348,361 +1348,6 @@ static int starry_himax83102_j02_init(struct mipi=
_dsi_device *dsi)
>         return 0;
>  };
>
> -
> -static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
> -{
> -       int ret;
> -
> -       msleep(5);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x42);
> -       mipi_dsi_dcs_write_seq(dsi, 0x01, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x05, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x81);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x71);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x1A);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x26, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x2C, 0xD4);
> -       mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x40);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x11);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x32);
> -       mipi_dsi_dcs_write_seq(dsi, 0xD1, 0x30);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x93);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE4, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x80);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x32, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x34, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x36, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x37, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x28);
> -       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x29);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x13);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x15);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x17);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x0D);
> -       mipi_dsi_dcs_write_seq(dsi, 0x40, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x41, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x42, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x43, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x44, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x45, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x46, 0x02);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x47, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x48, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x49, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4A, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4B, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4C, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4D, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4E, 0x28);
> -       mipi_dsi_dcs_write_seq(dsi, 0x4F, 0x29);
> -       mipi_dsi_dcs_write_seq(dsi, 0x50, 0x10);
> -       mipi_dsi_dcs_write_seq(dsi, 0x51, 0x12);
> -       mipi_dsi_dcs_write_seq(dsi, 0x52, 0x14);
> -       mipi_dsi_dcs_write_seq(dsi, 0x53, 0x16);
> -       mipi_dsi_dcs_write_seq(dsi, 0x54, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x55, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x56, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x57, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x58, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x59, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x02);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x61, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x62, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x63, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x64, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x65, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x66, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x67, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x68, 0x28);
> -       mipi_dsi_dcs_write_seq(dsi, 0x69, 0x29);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x16);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6B, 0x14);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6C, 0x12);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x10);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6E, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6F, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x70, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x71, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x72, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x73, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x74, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x75, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x76, 0x02);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x77, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x78, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x79, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7A, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7B, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7C, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7D, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x28);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x29);
> -       mipi_dsi_dcs_write_seq(dsi, 0x80, 0x17);
> -       mipi_dsi_dcs_write_seq(dsi, 0x81, 0x15);
> -       mipi_dsi_dcs_write_seq(dsi, 0x82, 0x13);
> -       mipi_dsi_dcs_write_seq(dsi, 0x83, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x0D);
> -       mipi_dsi_dcs_write_seq(dsi, 0x85, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x87, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x88, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x89, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x8A, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x8B, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x8C, 0x07);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x3A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x3B);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x44);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x44);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0x53, 0x1F);
> -       mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x40);
> -       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x21, 0x3C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x22, 0xFA);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE2, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x91);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x3C);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE8, 0xFA);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x12);
> -       mipi_dsi_dcs_write_seq(dsi, 0x87, 0x2C);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x73, 0xE5);
> -       mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x6B);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0xA4);
> -       mipi_dsi_dcs_write_seq(dsi, 0x79, 0x54);
> -       mipi_dsi_dcs_write_seq(dsi, 0x69, 0x97);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x97);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA5, 0x3F);
> -       mipi_dsi_dcs_write_seq(dsi, 0x61, 0xDA);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xF1);
> -       mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x62, 0x3F);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x90);
> -       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x80);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x58);
> -       mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0xCE, 0x58);
> -       mipi_dsi_dcs_write_seq(dsi, 0xCF, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x67, 0x60);
> -       mipi_dsi_dcs_write_seq(dsi, 0x10, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
> -       mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
> -       mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x38);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0=
x56, 0x6A, 0x6E, 0x79,
> -                              0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
> -                              0xD5, 0xE2, 0xE8);
> -       mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0=
x56, 0x6A, 0x6E, 0x79,
> -                              0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
> -                              0xD5, 0xE2, 0xE8);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x81);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0x05, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x10, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x12, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x13, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x14, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x15, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x16, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x17, 0x0B);
> -       mipi_dsi_dcs_write_seq(dsi, 0x18, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x0D);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1C, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x0E);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x0F);
> -       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x21, 0x10);
> -       mipi_dsi_dcs_write_seq(dsi, 0x22, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x23, 0x11);
> -       mipi_dsi_dcs_write_seq(dsi, 0x24, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x12);
> -       mipi_dsi_dcs_write_seq(dsi, 0x26, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x13);
> -       mipi_dsi_dcs_write_seq(dsi, 0x28, 0x07);
> -       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x14);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x15);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2C, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x16);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2E, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x17);
> -       mipi_dsi_dcs_write_seq(dsi, 0x30, 0x08);
> -       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x18);
> -       mipi_dsi_dcs_write_seq(dsi, 0x32, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x19);
> -       mipi_dsi_dcs_write_seq(dsi, 0x34, 0x09);
> -       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x1A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x36, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x37, 0x1B);
> -       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x1C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x1D);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x1E);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x0A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x1F);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x01);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0E);
> -       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x0C);
> -       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x10);
> -       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x16);
> -       mipi_dsi_dcs_write_seq(dsi, 0x26, 0xE0);
> -       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x71);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x46);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x1F);
> -       mipi_dsi_dcs_write_seq(dsi, 0x2D, 0xC7);
> -       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x32, 0xDF);
> -       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x5A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x34, 0xC0);
> -       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x5A);
> -       mipi_dsi_dcs_write_seq(dsi, 0x36, 0xC0);
> -       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x65);
> -       mipi_dsi_dcs_write_seq(dsi, 0x80, 0x3E);
> -       mipi_dsi_dcs_write_seq(dsi, 0x81, 0xA0);
> -       mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x01);
> -       mipi_dsi_dcs_write_seq(dsi, 0xB1, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x12);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0xC9, 0xCC);
> -       mipi_dsi_dcs_write_seq(dsi, 0x30, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x81);
> -       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x02);
> -       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x21);
> -       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x10);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x1E);
> -       mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x64, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x00);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0B);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA6, 0x44);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xB6);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x03);
> -       mipi_dsi_dcs_write_seq(dsi, 0xAA, 0x51);
> -       mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x51);
> -       mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x04);
> -       mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x92);
> -       mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA1);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> -       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> -       mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
> -
> -       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x00);
> -
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret)
> -               return ret;
> -       msleep(120);
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret)
> -               return ret;
> -       msleep(20);
> -
> -       return 0;
> -};
> -
>  static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>  {
>         return container_of(panel, struct boe_panel, base);
> @@ -2081,34 +1726,6 @@ static const struct panel_desc starry_himax83102_j=
02_desc =3D {
>         .lp11_before_reset =3D true,
>  };
>
> -static const struct drm_display_mode starry_ili9882t_default_mode =3D {
> -       .clock =3D 165280,
> -       .hdisplay =3D 1200,
> -       .hsync_start =3D 1200 + 32,
> -       .hsync_end =3D 1200 + 32 + 30,
> -       .htotal =3D 1200 + 32 + 30 + 32,
> -       .vdisplay =3D 1920,
> -       .vsync_start =3D 1920 + 68,
> -       .vsync_end =3D 1920 + 68 + 2,
> -       .vtotal =3D 1920 + 68 + 2 + 10,
> -       .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> -};
> -
> -static const struct panel_desc starry_ili9882t_desc =3D {
> -       .modes =3D &starry_ili9882t_default_mode,
> -       .bpc =3D 8,
> -       .size =3D {
> -               .width_mm =3D 141,
> -               .height_mm =3D 226,
> -       },
> -       .lanes =3D 4,
> -       .format =3D MIPI_DSI_FMT_RGB888,
> -       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> -                     MIPI_DSI_MODE_LPM,
> -       .init =3D starry_ili9882t_init,
> -       .lp11_before_reset =3D true,
> -};
> -
>  static int boe_panel_get_modes(struct drm_panel *panel,
>                                struct drm_connector *connector)
>  {
> @@ -2285,9 +1902,6 @@ static const struct of_device_id boe_of_match[] =3D=
 {
>         { .compatible =3D "starry,himax83102-j02",
>           .data =3D &starry_himax83102_j02_desc
>         },
> -       { .compatible =3D "starry,ili9882t",
> -         .data =3D &starry_ili9882t_desc
> -       },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> new file mode 100644
> index 000000000000..20f3cc37fa83
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -0,0 +1,739 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panels based on the Ilitek ILI9882T display controller.
> + */
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +/*
> + * Use this descriptor struct to describe different panels using the
> + * Ilitek ILI9882T display controller.
> + */
> +struct panel_desc {
> +       const struct drm_display_mode *modes;
> +       unsigned int bpc;
> +
> +       /**
> +        * @width_mm: width of the panel's active display area
> +        * @height_mm: height of the panel's active display area
> +        */
> +       struct {
> +               unsigned int width_mm;
> +               unsigned int height_mm;
> +       } size;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       int (*init)(struct mipi_dsi_device *dsi);
> +       unsigned int lanes;
> +       bool discharge_on_disable;
> +       bool lp11_before_reset;
> +};
> +
> +struct ili9882t {
> +       struct drm_panel base;
> +       struct mipi_dsi_device *dsi;
> +
> +       const struct panel_desc *desc;
> +
> +       enum drm_panel_orientation orientation;
> +       struct regulator *pp3300;
> +       struct regulator *pp1800;
> +       struct regulator *avee;
> +       struct regulator *avdd;
> +       struct gpio_desc *enable_gpio;
> +};
> +
> +static int starry_ili9882t_init(struct mipi_dsi_device *dsi)
> +{
> +       int ret;
> +
> +       msleep(5);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x42);
> +       mipi_dsi_dcs_write_seq(dsi, 0x01, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x05, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x80);
> +       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x81);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x71);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x1A);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x26, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x2C, 0xD4);
> +       mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x40);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x11);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x32);
> +       mipi_dsi_dcs_write_seq(dsi, 0xD1, 0x30);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x93);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE4, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x80);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x32, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x34, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x36, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x37, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x28);
> +       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x29);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x13);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x15);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x17);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x0D);
> +       mipi_dsi_dcs_write_seq(dsi, 0x40, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x41, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x42, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x43, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x44, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x45, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x46, 0x02);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x47, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x48, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x49, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4A, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4B, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4C, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4D, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4E, 0x28);
> +       mipi_dsi_dcs_write_seq(dsi, 0x4F, 0x29);
> +       mipi_dsi_dcs_write_seq(dsi, 0x50, 0x10);
> +       mipi_dsi_dcs_write_seq(dsi, 0x51, 0x12);
> +       mipi_dsi_dcs_write_seq(dsi, 0x52, 0x14);
> +       mipi_dsi_dcs_write_seq(dsi, 0x53, 0x16);
> +       mipi_dsi_dcs_write_seq(dsi, 0x54, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x55, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x56, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x57, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x58, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x59, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x02);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x61, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x62, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x63, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x64, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x65, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x66, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x67, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x68, 0x28);
> +       mipi_dsi_dcs_write_seq(dsi, 0x69, 0x29);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x16);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6B, 0x14);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6C, 0x12);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x10);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6E, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6F, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x70, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x71, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x72, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x73, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x74, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x75, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x76, 0x02);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x77, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x78, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x79, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7A, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7B, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7C, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7D, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x28);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x29);
> +       mipi_dsi_dcs_write_seq(dsi, 0x80, 0x17);
> +       mipi_dsi_dcs_write_seq(dsi, 0x81, 0x15);
> +       mipi_dsi_dcs_write_seq(dsi, 0x82, 0x13);
> +       mipi_dsi_dcs_write_seq(dsi, 0x83, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x0D);
> +       mipi_dsi_dcs_write_seq(dsi, 0x85, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x87, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x88, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x89, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x8A, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x8B, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x8C, 0x07);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x3A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x3B);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x44);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x44);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0x53, 0x1F);
> +       mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x40);
> +       mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x21, 0x3C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x22, 0xFA);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE2, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x91);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x3C);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE8, 0xFA);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x12);
> +       mipi_dsi_dcs_write_seq(dsi, 0x87, 0x2C);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x73, 0xE5);
> +       mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x6B);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0xA4);
> +       mipi_dsi_dcs_write_seq(dsi, 0x79, 0x54);
> +       mipi_dsi_dcs_write_seq(dsi, 0x69, 0x97);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x97);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA5, 0x3F);
> +       mipi_dsi_dcs_write_seq(dsi, 0x61, 0xDA);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xF1);
> +       mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x62, 0x3F);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x90);
> +       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x80);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x58);
> +       mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xCE, 0x58);
> +       mipi_dsi_dcs_write_seq(dsi, 0xCF, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x67, 0x60);
> +       mipi_dsi_dcs_write_seq(dsi, 0x10, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
> +       mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x55);
> +       mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x38);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0=
x56, 0x6A, 0x6E, 0x79,
> +                              0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
> +                              0xD5, 0xE2, 0xE8);
> +       mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0=
x56, 0x6A, 0x6E, 0x79,
> +                              0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, =
0xBB, 0xCE, 0xC6, 0xBD,
> +                              0xD5, 0xE2, 0xE8);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x81);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0x05, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x10, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x12, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x13, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x14, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x15, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x16, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x17, 0x0B);
> +       mipi_dsi_dcs_write_seq(dsi, 0x18, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x0D);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1C, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x0E);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x0F);
> +       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x21, 0x10);
> +       mipi_dsi_dcs_write_seq(dsi, 0x22, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x23, 0x11);
> +       mipi_dsi_dcs_write_seq(dsi, 0x24, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x12);
> +       mipi_dsi_dcs_write_seq(dsi, 0x26, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x13);
> +       mipi_dsi_dcs_write_seq(dsi, 0x28, 0x07);
> +       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x14);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x15);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2C, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x16);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2E, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x17);
> +       mipi_dsi_dcs_write_seq(dsi, 0x30, 0x08);
> +       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x18);
> +       mipi_dsi_dcs_write_seq(dsi, 0x32, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x19);
> +       mipi_dsi_dcs_write_seq(dsi, 0x34, 0x09);
> +       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x1A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x36, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x37, 0x1B);
> +       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x39, 0x1C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x1D);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3C, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x1E);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3E, 0x0A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x1F);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x01);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0E);
> +       mipi_dsi_dcs_write_seq(dsi, 0x02, 0x0C);
> +       mipi_dsi_dcs_write_seq(dsi, 0x20, 0x10);
> +       mipi_dsi_dcs_write_seq(dsi, 0x25, 0x16);
> +       mipi_dsi_dcs_write_seq(dsi, 0x26, 0xE0);
> +       mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x29, 0x71);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x46);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x1F);
> +       mipi_dsi_dcs_write_seq(dsi, 0x2D, 0xC7);
> +       mipi_dsi_dcs_write_seq(dsi, 0x31, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x32, 0xDF);
> +       mipi_dsi_dcs_write_seq(dsi, 0x33, 0x5A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x34, 0xC0);
> +       mipi_dsi_dcs_write_seq(dsi, 0x35, 0x5A);
> +       mipi_dsi_dcs_write_seq(dsi, 0x36, 0xC0);
> +       mipi_dsi_dcs_write_seq(dsi, 0x38, 0x65);
> +       mipi_dsi_dcs_write_seq(dsi, 0x80, 0x3E);
> +       mipi_dsi_dcs_write_seq(dsi, 0x81, 0xA0);
> +       mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x01);
> +       mipi_dsi_dcs_write_seq(dsi, 0xB1, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x12);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0xC9, 0xCC);
> +       mipi_dsi_dcs_write_seq(dsi, 0x30, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x00, 0x81);
> +       mipi_dsi_dcs_write_seq(dsi, 0x08, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0x09, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x07, 0x21);
> +       mipi_dsi_dcs_write_seq(dsi, 0x04, 0x10);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x1E);
> +       mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x64, 0x00);
> +       mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x00);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x0B);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA6, 0x44);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA7, 0xB6);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA8, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x03);
> +       mipi_dsi_dcs_write_seq(dsi, 0xAA, 0x51);
> +       mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x51);
> +       mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x04);
> +       mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x92);
> +       mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA1);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x05);
> +       mipi_dsi_dcs_write_seq(dsi, 0x86, 0x87);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x06);
> +       mipi_dsi_dcs_write_seq(dsi, 0x92, 0x22);
> +
> +       mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x98, 0x82, 0x00);
> +
> +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret)
> +               return ret;
> +       msleep(120);
> +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +       if (ret)
> +               return ret;
> +       msleep(20);
> +
> +       return 0;
> +};
> +
> +static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct ili9882t, base);
> +}
> +
> +static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
> +{
> +       struct mipi_dsi_device *dsi =3D ili->dsi;
> +       int ret;
> +
> +       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int ili9882t_disable(struct drm_panel *panel)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +       int ret;
> +

Hi,Linus=EF=BC=9A

Ilitek vendor  suggestion switching to page0
before sending sleep command.

Can you help me add  this before enter sleep?

struct mipi_dsi_device *dsi =3D ili->dsi;
ili9882t_switch_page(dsi, 0x00);

Can you share your merge plan about this series? Thank you.

> +       ret =3D ili9882t_enter_sleep_mode(ili);
> +       if (ret < 0) {
> +               dev_err(panel->dev, "failed to set panel off: %d\n", ret)=
;
> +               return ret;
> +       }
> +
> +       msleep(150);
> +
> +       return 0;
> +}
> +
> +static int ili9882t_unprepare(struct drm_panel *panel)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +
> +       if (ili->desc->discharge_on_disable) {
> +               regulator_disable(ili->avee);
> +               regulator_disable(ili->avdd);
> +               usleep_range(5000, 7000);
> +               gpiod_set_value(ili->enable_gpio, 0);
> +               usleep_range(5000, 7000);
> +               regulator_disable(ili->pp1800);
> +               regulator_disable(ili->pp3300);
> +       } else {
> +               gpiod_set_value(ili->enable_gpio, 0);
> +               usleep_range(1000, 2000);
> +               regulator_disable(ili->avee);
> +               regulator_disable(ili->avdd);
> +               usleep_range(5000, 7000);
> +               regulator_disable(ili->pp1800);
> +               regulator_disable(ili->pp3300);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ili9882t_prepare(struct drm_panel *panel)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +       int ret;
> +
> +       gpiod_set_value(ili->enable_gpio, 0);
> +       usleep_range(1000, 1500);
> +
> +       ret =3D regulator_enable(ili->pp3300);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D regulator_enable(ili->pp1800);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(3000, 5000);
> +
> +       ret =3D regulator_enable(ili->avdd);
> +       if (ret < 0)
> +               goto poweroff1v8;
> +       ret =3D regulator_enable(ili->avee);
> +       if (ret < 0)
> +               goto poweroffavdd;
> +
> +       usleep_range(10000, 11000);
> +
> +       if (ili->desc->lp11_before_reset) {
> +               mipi_dsi_dcs_nop(ili->dsi);
> +               usleep_range(1000, 2000);
> +       }
> +       gpiod_set_value(ili->enable_gpio, 1);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ili->enable_gpio, 0);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ili->enable_gpio, 1);
> +       usleep_range(6000, 10000);
> +
> +       if (ili->desc->init) {
> +               ret =3D ili->desc->init(ili->dsi);
> +               if (ret < 0) {
> +                       dev_err(panel->dev, "failed to init panel: %d\n",=
 ret);
> +                       goto poweroff;
> +               }
> +       }
> +
> +       return 0;
> +
> +poweroff:
> +       regulator_disable(ili->avee);
> +poweroffavdd:
> +       regulator_disable(ili->avdd);
> +poweroff1v8:
> +       usleep_range(5000, 7000);
> +       regulator_disable(ili->pp1800);
> +       gpiod_set_value(ili->enable_gpio, 0);
> +
> +       return ret;
> +}
> +
> +static int ili9882t_enable(struct drm_panel *panel)
> +{
> +       msleep(130);
> +       return 0;
> +}
> +
> +static const struct drm_display_mode starry_ili9882t_default_mode =3D {
> +       .clock =3D 165280,
> +       .hdisplay =3D 1200,
> +       .hsync_start =3D 1200 + 32,
> +       .hsync_end =3D 1200 + 32 + 30,
> +       .htotal =3D 1200 + 32 + 30 + 32,
> +       .vdisplay =3D 1920,
> +       .vsync_start =3D 1920 + 68,
> +       .vsync_end =3D 1920 + 68 + 2,
> +       .vtotal =3D 1920 + 68 + 2 + 10,
> +       .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_ili9882t_desc =3D {
> +       .modes =3D &starry_ili9882t_default_mode,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width_mm =3D 141,
> +               .height_mm =3D 226,
> +       },
> +       .lanes =3D 4,
> +       .format =3D MIPI_DSI_FMT_RGB888,
> +       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> +                     MIPI_DSI_MODE_LPM,
> +       .init =3D starry_ili9882t_init,
> +       .lp11_before_reset =3D true,
> +};
> +
> +static int ili9882t_get_modes(struct drm_panel *panel,
> +                              struct drm_connector *connector)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +       const struct drm_display_mode *m =3D ili->desc->modes;
> +       struct drm_display_mode *mode;
> +
> +       mode =3D drm_mode_duplicate(connector->dev, m);
> +       if (!mode) {
> +               dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +                       m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +               return -ENOMEM;
> +       }
> +
> +       mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_set_name(mode);
> +       drm_mode_probed_add(connector, mode);
> +
> +       connector->display_info.width_mm =3D ili->desc->size.width_mm;
> +       connector->display_info.height_mm =3D ili->desc->size.height_mm;
> +       connector->display_info.bpc =3D ili->desc->bpc;
> +       /*
> +        * TODO: Remove once all drm drivers call
> +        * drm_connector_set_orientation_from_panel()
> +        */
> +       drm_connector_set_panel_orientation(connector, ili->orientation);
> +
> +       return 1;
> +}
> +
> +static enum drm_panel_orientation ili9882t_get_orientation(struct drm_pa=
nel *panel)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +
> +       return ili->orientation;
> +}
> +
> +static const struct drm_panel_funcs ili9882t_funcs =3D {
> +       .disable =3D ili9882t_disable,
> +       .unprepare =3D ili9882t_unprepare,
> +       .prepare =3D ili9882t_prepare,
> +       .enable =3D ili9882t_enable,
> +       .get_modes =3D ili9882t_get_modes,
> +       .get_orientation =3D ili9882t_get_orientation,
> +};
> +
> +static int ili9882t_add(struct ili9882t *ili)
> +{
> +       struct device *dev =3D &ili->dsi->dev;
> +       int err;
> +
> +       ili->avdd =3D devm_regulator_get(dev, "avdd");
> +       if (IS_ERR(ili->avdd))
> +               return PTR_ERR(ili->avdd);
> +
> +       ili->avee =3D devm_regulator_get(dev, "avee");
> +       if (IS_ERR(ili->avee))
> +               return PTR_ERR(ili->avee);
> +
> +       ili->pp3300 =3D devm_regulator_get(dev, "pp3300");
> +       if (IS_ERR(ili->pp3300))
> +               return PTR_ERR(ili->pp3300);
> +
> +       ili->pp1800 =3D devm_regulator_get(dev, "pp1800");
> +       if (IS_ERR(ili->pp1800))
> +               return PTR_ERR(ili->pp1800);
> +
> +       ili->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW)=
;
> +       if (IS_ERR(ili->enable_gpio)) {
> +               dev_err(dev, "cannot get reset-gpios %ld\n",
> +                       PTR_ERR(ili->enable_gpio));
> +               return PTR_ERR(ili->enable_gpio);
> +       }
> +
> +       gpiod_set_value(ili->enable_gpio, 0);
> +
> +       drm_panel_init(&ili->base, dev, &ili9882t_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);
> +       err =3D of_drm_get_panel_orientation(dev->of_node, &ili->orientat=
ion);
> +       if (err < 0) {
> +               dev_err(dev, "%pOF: failed to get orientation %d\n", dev-=
>of_node, err);
> +               return err;
> +       }
> +
> +       err =3D drm_panel_of_backlight(&ili->base);
> +       if (err)
> +               return err;
> +
> +       ili->base.funcs =3D &ili9882t_funcs;
> +       ili->base.dev =3D &ili->dsi->dev;
> +
> +       drm_panel_add(&ili->base);
> +
> +       return 0;
> +}
> +
> +static int ili9882t_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili;
> +       int ret;
> +       const struct panel_desc *desc;
> +
> +       ili =3D devm_kzalloc(&dsi->dev, sizeof(*ili), GFP_KERNEL);
> +       if (!ili)
> +               return -ENOMEM;
> +
> +       desc =3D of_device_get_match_data(&dsi->dev);
> +       dsi->lanes =3D desc->lanes;
> +       dsi->format =3D desc->format;
> +       dsi->mode_flags =3D desc->mode_flags;
> +       ili->desc =3D desc;
> +       ili->dsi =3D dsi;
> +       ret =3D ili9882t_add(ili);
> +       if (ret < 0)
> +               return ret;
> +
> +       mipi_dsi_set_drvdata(dsi, ili);
> +
> +       ret =3D mipi_dsi_attach(dsi);
> +       if (ret)
> +               drm_panel_remove(&ili->base);
> +
> +       return ret;
> +}
> +
> +static void ili9882t_shutdown(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> +
> +       drm_panel_disable(&ili->base);
> +       drm_panel_unprepare(&ili->base);
> +}
> +
> +static void ili9882t_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> +       int ret;
> +
> +       ili9882t_shutdown(dsi);
> +
> +       ret =3D mipi_dsi_detach(dsi);
> +       if (ret < 0)
> +               dev_err(&dsi->dev, "failed to detach from DSI host: %d\n"=
, ret);
> +
> +       if (ili->base.dev)
> +               drm_panel_remove(&ili->base);
> +}
> +
> +static const struct of_device_id ili9882t_of_match[] =3D {
> +       { .compatible =3D "starry,ili9882t",
> +         .data =3D &starry_ili9882t_desc
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9882t_of_match);
> +
> +static struct mipi_dsi_driver ili9882t_driver =3D {
> +       .driver =3D {
> +               .name =3D "panel-ili9882t",
> +               .of_match_table =3D ili9882t_of_match,
> +       },
> +       .probe =3D ili9882t_probe,
> +       .remove =3D ili9882t_remove,
> +       .shutdown =3D ili9882t_shutdown,
> +};
> +module_mipi_dsi_driver(ili9882t_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Ilitek ILI9882T-based panels driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
