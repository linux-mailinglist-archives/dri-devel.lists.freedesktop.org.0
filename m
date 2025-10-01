Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4FBAF217
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7847410E1C1;
	Wed,  1 Oct 2025 05:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJ0kUfAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5310E1C1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 05:15:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so3797210f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759295751; x=1759900551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYsgMGflwmbj7t4N2OlDSoJg37AHCrPu/ZL6gyZYz7g=;
 b=mJ0kUfAlHAh8ARujHQ+X5kKqoprWofCNpAtT3fkkWHehvTgji8jgXn4FnMozVyUSfb
 opKJarbShCw5Tab/TZ8kLKVnLEHhcEb8oT0t8ymtyu49C8zVFwj8CFg2xTcQdcGHhzXm
 a2UmAu2RDnl/34RMmdAy2Fgp6i7KhGXfHMwah0EpSmCZRbVqhBpQ7u7mk+ZVoeUwN1S8
 le9oHIz0mfpUrJgMqbIkyhmSI9yo0uJGv0fiM5TOK2SIqh1GWE27lLLceUb7tlcmOZAX
 03vkCwOCHUqmpz70o7JZm+w6WOFXkfV3PiIZoGtwhhzicFYerNGitnBDE+I2Et5JZ5b6
 B6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759295751; x=1759900551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYsgMGflwmbj7t4N2OlDSoJg37AHCrPu/ZL6gyZYz7g=;
 b=gnO9eDcYq4ZCfu4di93mFRLlgtZDplimX0RBcgKG3mWF8o/SKU+ehEqMMiGQ546sJK
 fAEsTgZramYTPZuZBvXGIuYbeFkk8Oqe88WFeZkSYbxEYeY12xjOCOjnbNbQ6H5X2qDC
 bD+UWQxUMI3LCfwX9Vu1XosTWETstdsE9jUIc7+VTTApoQW9qIvGNPvtzIRgmw6HZrVj
 2A3RiJof9OpPDXVQ8ELSiMBpE5L7+iRUuLs4iopnl9X5H+IG2j1KWu2uhMGGNn46sJ7Y
 6SAAUSVRdTNBBb5cpQ8hiuewMfgehwR3Ttm5dIMk49ePHdi6Oj3FgnhEgKY4ariSROl2
 hVAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9LD6dSpiLJKRnkluZ1miGSQ9EdERGUVrfEv+U3ekctJf2Gg0MDk7McvBxUm2+LoDgvm6J/4Eb3YU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA/sVv5Hdn+I8uOHHh08bqRn4wDyJfubYmlHyy06TAJyiMDcBm
 zzILwX2NseMP07zkX7KbIa5OdHbd6dgZBOZ8WIA1efc6cOX3tS6qk/fw9ndktTnfdi+0D5oPCDB
 JovDqs2DLdwlNHKme4glj0JH75p4qgoo=
X-Gm-Gg: ASbGncuSVj6c6UWFgpp2rifsWAs7mNG4U7WPQexyQQ73Ose18c7G76A5X0Qb1nCzHoO
 gfRnmR3lkhcrFHFpMd05jhhdZhiH1QMqo/TWv5fRykoRDZ6WnSSbYHY86UhM5LgUXU6DNPRHlSW
 9q1909s8oDX+YJXeolKPrqUQwhtc9M2RRW5BHWWbU5An/xQqO1tiAtnYiArQXBi5YBvH83IEMA1
 TzBsZ6iOAT+wxBv4mJHSslfc0F+Dj8C
X-Google-Smtp-Source: AGHT+IG4qY6PbqXNoyD2wenHaeHbMZx/2OKVxtR9Fd8P0sw/M4jcAvIMXeOJlDLZqV+u8RHY+2sRV/HDuriB3RmQi4g=
X-Received: by 2002:a05:6000:40c9:b0:3ee:152e:676e with SMTP id
 ffacd0b85a97d-425577ed897mr1546190f8f.11.1759295750205; Tue, 30 Sep 2025
 22:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-23-clamor95@gmail.com>
 <7265577.tM3a2QDmDi@senjougahara>
In-Reply-To: <7265577.tM3a2QDmDi@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 1 Oct 2025 08:15:38 +0300
X-Gm-Features: AS18NWCe2S5pctj23udJ32RnN5QXJ8I_Q8pFfCBtCPaxB2fTSXtnwSfhMyDS74c
Message-ID: <CAPVz0n2rjDq06axWQHuS6KGQqT7ycFDtYBbZPqxbJW3S=Nstqw@mail.gmail.com>
Subject: Re: [PATCH v3 22/22] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

=D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:04=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> > Add support for MIPI CSI device and calibration logic found in Tegra20 =
and
> > Tegra30 SoC.
> >
> > To get CSI operational, an additional syncpoint was allocated to serve =
as
> > the CSI frame counter. Both VIP and CSI use an existing syncpoint for V=
I
> > frame start events. That said, the frame capture function was refactore=
d
> > to reflect the addition of the CSI syncpoint, and the CSI-specific
> > configuration is guarded by the presence of a passed CSI channel struct=
ure
> > pointer.
> >
> > The camera capture setup's configuration was reconsidered: the first tw=
o
> > writes must be done before tegra_channel_set_stream for MIPI calibratio=
n
> > to work properly; the third write was moved to VIP/CSI-specific functio=
ns
> > since it must be source-specific; the function was placed after
> > tegra_channel_set_stream so the initial sequence is preserved and expan=
ded.
> >
> > CSI configuration sequences were added based on downstream 3.1 kernel
> > sources and adjusted to the existing video-tegra framework. Although
> > Tegra20 and Tegra30 have the same set of configurations, they differ by
> > the number of clocks used by CSI.
> >
> > Dropped the software syncpoint counters in favor of reading syncpoints
> > directly and passing the incremented value to the polling function. If =
the
> > syncpoint increase fails, the PP is reset. This change should prevent
> > possible race conditions.
> >
> > MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> > have no dedicated hardware block for these operations and use CSI. Thes=
e
> > calls are used for both CSI and DSI to work properly, which is why MIPI
> > calibration cannot be contained within CSI. The pads passed to the
> > calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) an=
d
> > DSI-B (4).
> >
> > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c     |  19 +
> >  drivers/staging/media/tegra-video/csi.h     |   4 +
> >  drivers/staging/media/tegra-video/tegra20.c | 608 ++++++++++++++++++--
> >  drivers/staging/media/tegra-video/vi.h      |   2 -
> >  drivers/staging/media/tegra-video/video.c   |   6 +
> >  5 files changed, 592 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/=
media/tegra-video/csi.c
> > index 7d70478a07aa..92ee4c84a988 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -827,6 +827,13 @@ static int tegra_csi_probe(struct platform_device =
*pdev)
> >
> >       csi->dev =3D &pdev->dev;
> >       csi->ops =3D csi->soc->ops;
> > +
> > +     if (csi->soc->mipi_ops)
> > +             tegra_mipi_add_provider(pdev->dev.of_node,
> > +                                     csi->soc->mipi_ops);
>
> Error handling should be added. Also, I realize that we should have a teg=
ra_mipi_remove_provider to call if the probe fails after this or at CSI dev=
ice removal. Since tegra_mipi_request refcounts the platform device, AIUI t=
he CSI device cannot be unbound while it has users, so we don't need to wor=
ry about the CSI device being removed while there are active users.
>

Your words tegra_mipi_remove_provider are unclear, should I add it and
where should I use it exactly? I can make devm version of
tegra_mipi_remove_provider by adding action there.

> > +
> > +     mutex_init(&csi->mipi_lock);
> > +
> >       platform_set_drvdata(pdev, csi);
> >       pm_runtime_enable(&pdev->dev);
> >
> > @@ -858,11 +865,23 @@ static void tegra_csi_remove(struct platform_devi=
ce *pdev)
> >       pm_runtime_disable(&pdev->dev);
> >  }
> >
> > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > +extern const struct tegra_csi_soc tegra20_csi_soc;
> > +#endif
> > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > +extern const struct tegra_csi_soc tegra30_csi_soc;
> > +#endif
> >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >  extern const struct tegra_csi_soc tegra210_csi_soc;
> >  #endif
> >
> >  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > +     { .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_so=
c },
> > +#endif
> > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > +     { .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_so=
c },
> > +#endif
> >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >       { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_=
soc },
> >  #endif
> > diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/=
media/tegra-video/csi.h
> > index 1550defb115a..422f30655945 100644
> > --- a/drivers/staging/media/tegra-video/csi.h
> > +++ b/drivers/staging/media/tegra-video/csi.h
> > @@ -115,6 +115,7 @@ struct tegra_csi_ops {
> >   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
> >   *
> >   * @ops: csi hardware operations
> > + * @mipi_ops: MIPI calibration operations
> >   * @csi_max_channels: supported max streaming channels
> >   * @clk_names: csi and cil clock names
> >   * @num_clks: total clocks count
> > @@ -123,6 +124,7 @@ struct tegra_csi_ops {
> >   */
> >  struct tegra_csi_soc {
> >       const struct tegra_csi_ops *ops;
> > +     const struct tegra_mipi_ops *mipi_ops;
> >       unsigned int csi_max_channels;
> >       const char * const *clk_names;
> >       unsigned int num_clks;
> > @@ -140,6 +142,7 @@ struct tegra_csi_soc {
> >   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
> >   * @soc: pointer to SoC data structure
> >   * @ops: csi operations
> > + * @mipi_lock: for MIPI calibration operations
> >   * @csi_chans: list head for CSI channels
> >   */
> >  struct tegra_csi {
> > @@ -150,6 +153,7 @@ struct tegra_csi {
> >       struct regulator *vdd;
> >       const struct tegra_csi_soc *soc;
> >       const struct tegra_csi_ops *ops;
> > +     struct mutex mipi_lock;
> >       struct list_head csi_chans;
> >  };
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index 8c9655ffa886..d99a04fa25af 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -4,6 +4,9 @@
> >   *
> >   * Copyright (C) 2023 SKIDATA GmbH
> >   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > + *
> > + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> > + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> >   */
> >
> >  /*
> > @@ -12,10 +15,15 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk/tegra.h>
> >  #include <linux/delay.h>
> >  #include <linux/host1x.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/kthread.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/tegra-mipi-cal.h>
> >  #include <linux/v4l2-mediabus.h>
> >
> >  #include "vip.h"
> > @@ -42,6 +50,9 @@ enum tegra_vi_out {
> >  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT   BIT(8)
> >  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT              0
> >
> > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)   (0x0070 + (n) * 8=
)
> > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)     (0x0074 + (n) * 8=
)
> > +
> >  #define TEGRA_VI_VI_INPUT_CONTROL                    0x0088
> >  #define       VI_INPUT_FIELD_DETECT                  BIT(27)
> >  #define       VI_INPUT_BT656                         BIT(25)
> > @@ -88,6 +99,8 @@ enum tegra_vi_out {
> >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST     (3 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR   (6 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> >  /* TEGRA_VI_OUT_2 supported formats */
> > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER  (7 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER  (8 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> >  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT       (9 << VI_=
OUTPUT_OUTPUT_FORMAT_SFT)
> >
> >  #define TEGRA_VI_VIP_H_ACTIVE                                0x00a4
> > @@ -152,8 +165,106 @@ enum tegra_vi_out {
> >  #define TEGRA_VI_VI_RAISE                            0x01ac
> >  #define       VI_VI_RAISE_ON_EDGE                    BIT(0)
> >
> > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)         (0x01d8 + (n) * 8=
)
> > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)           (0x01dc + (n) * 8=
)
> > +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)                  (0x01e8 + (n) * 8=
)
> > +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)                  (0x01ec + (n) * 8=
)
> > +
> > +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> > +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL            0x0000
> > +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL          0x0008
> > +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)            (0x0010 + (n) * 0=
x2c)
> > +#define       CSI_SKIP_PACKET_THRESHOLD(n)           (((n) & 0xff) << =
16)
> > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)           (0x0018 + (n) * 0=
x2c)
> > +#define       CSI_PP_PAD_FRAME_PAD0S                 (0 << 28)
> > +#define       CSI_PP_PAD_FRAME_PAD1S                 (1 << 28)
> > +#define       CSI_PP_PAD_FRAME_NOPAD                 (2 << 28)
> > +#define       CSI_PP_HEADER_EC_ENABLE                        BIT(27)
> > +#define       CSI_PP_PAD_SHORT_LINE_PAD0S            (0 << 24)
> > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S            (1 << 24)
> > +#define       CSI_PP_PAD_SHORT_LINE_NOPAD            (2 << 24)
> > +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED          BIT(20)
> > +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY         (0 << 16)
> > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL             (1 << 16)
> > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP         (2 << 16)
> > +#define       CSI_PP_OUTPUT_FORMAT_STORE             (3 << 16)
> > +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)           (((n) - 1) << 14)
> > +#define       CSI_PP_DATA_TYPE(n)                    ((n) << 8)
> > +#define       CSI_PP_CRC_CHECK_ENABLE                        BIT(7)
> > +#define       CSI_PP_WORD_COUNT_HEADER                       BIT(6)
> > +#define       CSI_PP_DATA_IDENTIFIER_ENABLE          BIT(5)
> > +#define       CSI_PP_PACKET_HEADER_SENT                      BIT(4)
> > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)           (0x001c + (n) * 0=
x2c)
> > +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)         (0x0020 + (n) * 0=
x2c)
> > +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)                        (0x0024 +=
 (n) * 0x2c)
> > +#define       CSI_PP_FRAME_MIN_GAP(n)                        (((n) & 0=
xffff) << 16)
> > +#define       CSI_PP_LINE_MIN_GAP(n)                 (((n) & 0xffff))
> > +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)         (0x0028 + (n) * 0=
x2c)
> > +#define       CSI_PP_START_MARKER_FRAME_MAX(n)               (((n) & 0=
xf) << 12)
> > +#define       CSI_PP_START_MARKER_FRAME_MIN(n)               (((n) & 0=
xf) << 8)
> > +#define       CSI_PP_VSYNC_START_MARKER                      BIT(4)
> > +#define       CSI_PP_SINGLE_SHOT                     BIT(2)
> > +#define       CSI_PP_NOP                             0
> > +#define       CSI_PP_ENABLE                          1
> > +#define       CSI_PP_DISABLE                         2
> > +#define       CSI_PP_RESET                           3
> > +#define TEGRA_CSI_PHY_CIL_COMMAND                    0x0068
> > +#define       CSI_A_PHY_CIL_NOP                              0x0
> > +#define       CSI_A_PHY_CIL_ENABLE                   0x1
> > +#define       CSI_A_PHY_CIL_DISABLE                  0x2
> > +#define       CSI_A_PHY_CIL_ENABLE_MASK                      0x3
> > +#define       CSI_B_PHY_CIL_NOP                              (0x0 << 1=
6)
> > +#define       CSI_B_PHY_CIL_ENABLE                   (0x1 << 16)
> > +#define       CSI_B_PHY_CIL_DISABLE                  (0x2 << 16)
> > +#define       CSI_B_PHY_CIL_ENABLE_MASK                      (0x3 << 1=
6)
> > +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)                        (0x006c +=
 (n) * 4)
> > +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE               BIT(5)
> > +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS            0x0078
> > +#define TEGRA_CSI_CSI_CIL_STATUS                     0x007c
> > +#define       CSI_MIPI_AUTO_CAL_DONE                 BIT(15)
> > +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK    0x0080
> > +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK             0x0084
> > +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x0088
> > +#define TEGRA_CSI_ESCAPE_MODE_COMMAND                        0x008c
> > +#define TEGRA_CSI_ESCAPE_MODE_DATA                   0x0090
> > +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)                 (0x0094 + (n) * 8=
)
> > +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)                 (0x0098 + (n) * 8=
)
> > +#define TEGRA_CSI_CIL_PAD_CONFIG                     0x00a4
> > +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG                       0x00a8
> > +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG                       0x00ac
> > +#define       CSI_CIL_MIPI_CAL_STARTCAL                      BIT(31)
> > +#define       CSI_CIL_MIPI_CAL_OVERIDE_A             BIT(30)
> > +#define       CSI_CIL_MIPI_CAL_OVERIDE_B             BIT(30)
> > +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)          (((n) & 0xf) << 2=
6)
> > +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)           (((n) & 0x3) << 2=
4)
> > +#define       CSI_CIL_MIPI_CAL_SEL_A                 BIT(21)
> > +#define       CSI_CIL_MIPI_CAL_SEL_B                 BIT(21)
> > +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)             (((n) & 0x1f) << =
16)
> > +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)             (((n) & 0x1f) << =
8)
> > +#define       CSI_CIL_MIPI_CAL_TERMOS(n)             (((n) & 0x1f))
> > +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS                        0x00b0
> > +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x00b4
> > +#define TEGRA_CSI_DEBUG_CONTROL                              0x00b8
> > +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED     BIT(0)
> > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0                BIT(4)
> > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1                BIT(5)
> > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2                BIT(6)
> > +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)    ((v) << (8 + 8 * =
(n)))
> > +#define TEGRA_CSI_DEBUG_COUNTER(n)                   (0x00bc + (n) * 4=
)
> > +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)     (0x00c8 + (n) * 4=
)
> > +#define       CSI_PP_EXP_FRAME_HEIGHT(n)             (((n) & 0x1fff) <=
< 16)
> > +#define       CSI_PP_MAX_CLOCKS(n)                   (((n) & 0xfff) <<=
 4)
> > +#define       CSI_PP_LINE_TIMEOUT_ENABLE             BIT(0)
> > +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG                        0x00d0
> > +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG                        0x00d4
> > +#define       CSI_PAD_DRIV_DN_REF(n)                 (((n) & 0x7) << 1=
6)
> > +#define       CSI_PAD_DRIV_UP_REF(n)                 (((n) & 0x7) << 8=
)
> > +#define       CSI_PAD_TERM_REF(n)                    (((n) & 0x7) << 0=
)
> > +#define TEGRA_CSI_CSI_CILA_STATUS                    0x00d8
> > +#define TEGRA_CSI_CSI_CILB_STATUS                    0x00dc
> > +
> >  /* -------------------------------------------------------------------=
-------
> > - * VI
> > + * Read and Write helpers
> >   */
> >
> >  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned i=
nt addr, u32 val)
> > @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_chann=
el *chan, unsigned int addr, u
> >       writel(val, chan->vi->iomem + addr);
> >  }
> >
> > +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *cha=
n, unsigned int addr)
> > +{
> > +     return readl(chan->vi->iomem + addr);
> > +}
> > +
> > +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsi=
gned int addr, u32 val)
> > +{
> > +     writel(val, csi_chan->csi->iomem + addr);
> > +}
> > +
> > +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *c=
si_chan, unsigned int addr)
> > +{
> > +     return readl(csi_chan->csi->iomem + addr);
> > +}
> > +
> > +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned int add=
r, u32 val)
> > +{
> > +     writel(val, csi->iomem + addr);
> > +}
> > +
> > +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *csi, uns=
igned int addr)
> > +{
> > +     return readl(csi->iomem + addr);
> > +}
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * VI
> > + */
> > +
> >  /*
> >   * Get the main input format (YUV/RGB...) and the YUV variant as value=
s to
> >   * be written into registers for the current VI input mbus code.
> > @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi,=
 bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel =
*chan)
> >  {
> >       struct tegra_vi *vi =3D chan->vi;
> > -     struct host1x_syncpt *out_sp;
> > +     struct host1x_syncpt *out_sp, *fs_sp;
> >
> >       out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIEN=
T_MANAGED);
> >       if (!out_sp)
> > -             return dev_err_probe(vi->dev, -ENOMEM, "failed to request=
 syncpoint\n");
> > +             return dev_err_probe(vi->dev, -EBUSY, "failed to request =
mw ack syncpoint\n");
> >
> >       chan->mw_ack_sp[0] =3D out_sp;
> >
> > +     fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT=
_MANAGED);
> > +     if (!fs_sp)
> > +             return dev_err_probe(vi->dev, -EBUSY, "failed to request =
frame start syncpoint\n");
> > +
> > +     chan->frame_start_sp[0] =3D fs_sp;
> > +
> >       return 0;
> >  }
> >
> >  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel=
 *chan)
> >  {
> >       host1x_syncpt_put(chan->mw_ack_sp[0]);
> > +     host1x_syncpt_put(chan->frame_start_sp[0]);
> >  }
> >
> >  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned in=
t bpp)
> > @@ -418,41 +565,79 @@ static void tegra20_channel_vi_buffer_setup(struc=
t tegra_vi_channel *chan,
> >  }
> >
> >  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan=
,
> > -                                      struct tegra_channel_buffer *buf=
)
> > +                                      struct tegra_channel_buffer *buf=
,
> > +                                      struct tegra_csi_channel *csi_ch=
an)
> >  {
> > +     u32 val;
> >       int err;
> >
> > -     chan->next_out_sp_idx++;
> > -
> >       tegra20_channel_vi_buffer_setup(chan, buf);
> >
> > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL=
_VIP_ENABLE);
> > +     if (csi_chan) {
> > +             u32 port =3D csi_chan->csi_port_nums[0] & 1;
> > +
> > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COM=
MAND(port),
> > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > +                               CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> > +
> > +             val =3D host1x_syncpt_read(chan->frame_start_sp[0]);
> > +             do {
> > +                     err =3D host1x_syncpt_wait(chan->frame_start_sp[0=
],
> > +                                              val + 1, TEGRA_VI_SYNCPT=
_WAIT_TIMEOUT, NULL);
> > +             } while (err =3D=3D -ERESTARTSYS);
>
> This function is called only from a kthread, so I don't think it's possib=
le for any functions to return -ERESTARTSYS. Have you seen otherwise? (Anyw=
ay, it it were possible, we should add a parameter to host1x_syncpt_wait to=
 specify whether the wait should be interruptible or not, instead of workin=
g around it)
>

This is caused by dma_fence_wait_timeout being unconditionally
interruptible. I do not want to touch host1x stuff, this patchset
already takes too much resources.

> > +
> > +             if (err) {
> > +                     if (err !=3D -ERESTARTSYS)
> > +                             dev_err_ratelimited(&chan->video.dev,
> > +                                                 "frame start syncpt t=
imeout: %d\n", err);
> > +
> > +                     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREA=
M_PP_COMMAND(port),
> > +                                       CSI_PP_START_MARKER_FRAME_MAX(0=
xf) | CSI_PP_RESET);
> > +                     goto exit;
> > +             }
> > +
> > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COM=
MAND(port),
> > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > +                               CSI_PP_DISABLE);
> > +     } else {
> > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA=
_CONTROL_VIP_ENABLE);
> > +     }
> > +
> > +     val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> > +     do {
> > +             err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
> > +                                      TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NU=
LL);
> > +     } while (err =3D=3D -ERESTARTSYS);
> >
> > -     /* Wait for syncpt counter to reach frame start event threshold *=
/
> > -     err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_=
idx,
> > -                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> >       if (err) {
> > -             host1x_syncpt_incr(chan->mw_ack_sp[0]);
> > -             dev_err_ratelimited(&chan->video.dev, "frame start syncpt=
 timeout: %d\n", err);
> > -             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> > -             return err;
> > +             if (err !=3D -ERESTARTSYS)
> > +                     dev_err_ratelimited(&chan->video.dev, "mw ack syn=
cpt timeout: %d\n", err);
> > +             goto exit;
> >       }
> >
> > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > -                      VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTR=
OL_VIP_ENABLE);
> > +     if (!csi_chan)
> > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > +                              VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAME=
RA_CONTROL_VIP_ENABLE);
> >
> > +exit:
> >       release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> >
> > -     return 0;
> > +     return err;
> >  }
> >
> >  static int tegra20_chan_capture_kthread_start(void *data)
> >  {
> >       struct tegra_vi_channel *chan =3D data;
> >       struct tegra_channel_buffer *buf;
> > +     struct v4l2_subdev *csi_subdev =3D NULL;
> > +     struct tegra_csi_channel *csi_chan =3D NULL;
> >       unsigned int retries =3D 0;
> >       int err =3D 0;
> >
> > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > +     if (csi_subdev)
> > +             csi_chan =3D to_csi_chan(csi_subdev);
> > +
> >       while (1) {
> >               /*
> >                * Source is not streaming if error is non-zero.
> > @@ -477,7 +662,7 @@ static int tegra20_chan_capture_kthread_start(void =
*data)
> >               list_del_init(&buf->queue);
> >               spin_unlock(&chan->start_lock);
> >
> > -             err =3D tegra20_channel_capture_frame(chan, buf);
> > +             err =3D tegra20_channel_capture_frame(chan, buf, csi_chan=
);
> >               if (!err) {
> >                       retries =3D 0;
> >                       continue;
> > @@ -504,28 +689,6 @@ static void tegra20_camera_capture_setup(struct te=
gra_vi_channel *chan)
> >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAG=
E_DT_RAW8 ||
> >                                           data_type =3D=3D TEGRA_IMAGE_=
DT_RAW10) ?
> >                                           TEGRA_VI_OUT_2 : TEGRA_VI_OUT=
_1;
> > -     int main_output_format;
> > -     int yuv_output_format;
> > -
> > -     tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_out=
put_format);
> > -
> > -     /*
> > -      * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> > -      * for luminance, which is the default and means not to touch
> > -      * anything.
> > -      */
> > -     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > -                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > -                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > -
> > -     /* Set up raise-on-edge, so we get an interrupt on end of frame. =
*/
> > -     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > -
> > -     tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel)=
,
> > -                      (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > -                      (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > -                      yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT=
_SFT |
> > -                      main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SF=
T);
> >
> >       /* Set up frame size */
> >       tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel)=
,
> > @@ -556,18 +719,28 @@ static int tegra20_vi_start_streaming(struct vb2_=
queue *vq, u32 count)
> >       struct media_pipeline *pipe =3D &chan->video.pipe;
> >       int err;
> >
> > -     chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> > -
> >       err =3D video_device_pipeline_start(&chan->video, pipe);
> >       if (err)
> >               goto error_pipeline_start;
> >
> > -     tegra20_camera_capture_setup(chan);
> > +     /*
> > +      * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> > +      * for luminance, which is the default and means not to touch
> > +      * anything.
> > +      */
> > +     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > +                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > +                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > +
> > +     /* Set up raise-on-edge, so we get an interrupt on end of frame. =
*/
> > +     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> >
> >       err =3D tegra_channel_set_stream(chan, true);
> >       if (err)
> >               goto error_set_stream;
> >
> > +     tegra20_camera_capture_setup(chan);
> > +
> >       chan->sequence =3D 0;
> >
> >       chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_=
kthread_start,
> > @@ -662,6 +835,345 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >       .has_h_v_flip =3D true,
> >  };
> >
> > +/* -------------------------------------------------------------------=
-------
> > + * MIPI Calibration
> > + */
> > +static int tegra20_start_pad_calibration(struct tegra_mipi_device *mip=
i)
> > +{
> > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > +     unsigned int port =3D mipi->pads;
> > +     u32 value;
> > +     int ret;
> > +
> > +     guard(mutex)(&csi->mipi_lock);
> > +
> > +     ret =3D pm_runtime_resume_and_get(csi->dev);
> > +     if (ret < 0) {
> > +             dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> > +                        CSI_CIL_MIPI_CAL_HSPDOS(4) |
> > +                        CSI_CIL_MIPI_CAL_HSPUOS(3) |
> > +                        CSI_CIL_MIPI_CAL_TERMOS(0));
> > +     tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> > +                        CSI_PAD_DRIV_DN_REF(5) |
> > +                        CSI_PAD_DRIV_UP_REF(7) |
> > +                        CSI_PAD_TERM_REF(0));
> > +
> > +     /* CSI B */
> > +     value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > +
> > +     if (port =3D=3D PORT_B)
> > +             value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> > +
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> > +
> > +     /* CSI A */
> > +     value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> > +             CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > +             CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > +             CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > +
> > +     if (port =3D=3D PORT_A)
> > +             value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> > +
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> > +
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mi=
pi)
> > +{
> > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > +     void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL_S=
TATUS;
> > +     unsigned int port =3D mipi->pads;
> > +     u32 value, pp =3D 0, cil =3D 0;
> > +     int ret;
> > +
> > +     /* This part is only for CSI */
> > +     if (port > PORT_B) {
> > +             pm_runtime_put(csi->dev);
> > +
> > +             return 0;
> > +     }
> > +
> > +     guard(mutex)(&csi->mipi_lock);
> > +
> > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > +                                      value & CSI_MIPI_AUTO_CAL_DONE, =
50, 250000);
> > +     if (ret < 0) {
> > +             dev_warn(csi->dev, "MIPI calibration timeout!\n");
> > +             goto exit;
> > +     }
> > +
> > +     /* clear status */
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > +                                      !(value & CSI_MIPI_AUTO_CAL_DONE=
), 50, 250000);
> > +     if (ret < 0) {
> > +             dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> > +             goto exit;
> > +     }
> > +
> > +     pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> > +     cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> > +     if (pp | cil) {
> > +             dev_warn(csi->dev, "Calibration status not been cleared!\=
n");
> > +             ret =3D -EINVAL;
> > +             goto exit;
> > +     }
> > +
> > +exit:
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> > +
> > +     /* un-select to avoid interference with DSI */
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > +
> > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> > +                        CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > +                        CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > +
> > +     pm_runtime_put(csi->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> > +     .start_calibration =3D tegra20_start_pad_calibration,
> > +     .finish_calibration =3D tegra20_finish_pad_calibration,
> > +};
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * CSI
> > + */
> > +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_ch=
an)
> > +{
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0)=
;
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, =
0);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0)=
;
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_=
MASK, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> > +}
> > +
> > +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *=
csi_chan,
> > +                                         u8 portno)
> > +{
> > +     struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&cs=
i_chan->subdev);
> > +     int width  =3D vi_chan->format.width;
> > +     int height =3D vi_chan->format.height;
> > +     u32 data_type =3D vi_chan->fmtinfo->img_dt;
> > +     u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> > +     enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> > +
> > +     unsigned int main_output_format, yuv_output_format;
> > +     unsigned int port =3D portno & 1;
> > +     u32 value;
> > +
> > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_=
output_format);
> > +
> > +     switch (data_type) {
> > +     case TEGRA_IMAGE_DT_RAW8:
> > +     case TEGRA_IMAGE_DT_RAW10:
> > +             output_channel =3D TEGRA_VI_OUT_2;
> > +             if (port =3D=3D PORT_A)
> > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CS=
I_PPA_BAYER;
> > +             else
> > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CS=
I_PPB_BAYER;
> > +             break;
> > +     }
> > +
> > +     tegra20_csi_capture_clean(csi_chan);
> > +
> > +     /* CSI port cleanup */
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),=
 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port)=
, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port)=
, 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(por=
t), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(por=
t), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME=
(port), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port=
)); /* CSI_PP_YUV422 */
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + p=
ort)); /* CSI_PP */
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + p=
ort)); /* CSI_PP */
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width <=
< 16);
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height =
<< 16);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port)=
, 0x1);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(por=
t), word_count);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> > +                       CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks betw=
een frames */
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME=
(port),
> > +                       CSI_PP_EXP_FRAME_HEIGHT(height) |
> > +                       CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clk=
s for timeout */
> > +                       CSI_PP_LINE_TIMEOUT_ENABLE);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port)=
,
> > +                       CSI_PP_OUTPUT_FORMAT_PIXEL |
> > +                       CSI_PP_DATA_TYPE(data_type) |
> > +                       CSI_PP_CRC_CHECK_ENABLE |
> > +                       CSI_PP_WORD_COUNT_HEADER |
> > +                       CSI_PP_DATA_IDENTIFIER_ENABLE |
> > +                       CSI_PP_PACKET_HEADER_SENT |
> > +                       port);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> > +                       CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> > +                       (csi_chan->numlanes - 1));
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> > +                       CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> > +                       0x5); /* Clock settle time */
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START=
(port),
> > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > +                      host1x_syncpt_id(vi_chan->frame_start_sp[0])
> > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel=
),
> > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > +                      host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > +
> > +     value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY=
_CIL_DISABLE :
> > +             CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(por=
t),
> > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > +                       CSI_PP_DISABLE);
> > +
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_chann=
el),
> > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > +                      yuv_output_format | main_output_format);
> > +
> > +     return 0;
> > +};
> > +
> > +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *=
csi_chan, u8 portno)
> > +{
> > +     struct tegra_csi *csi =3D csi_chan->csi;
> > +     unsigned int port =3D portno & 1;
> > +     u32 value;
> > +
> > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_S=
TATUS);
> > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", v=
alue);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, va=
lue);
> > +
> > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> > +
> > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(por=
t),
> > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > +                       CSI_PP_DISABLE);
> > +
> > +     if (csi_chan->numlanes =3D=3D 4) {
> > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> > +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_D=
ISABLE);
> > +     } else {
> > +             value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | =
CSI_B_PHY_CIL_NOP :
> > +                     CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, va=
lue);
> > +     }
> > +}
> > +
> > +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_c=
han)
> > +{
> > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < csi_chan->numgangports; i++) {
> > +             ret =3D tegra20_csi_port_start_streaming(csi_chan, portno=
s[i]);
> > +             if (ret)
> > +                     goto stream_start_fail;
> > +     }
> > +
> > +     return 0;
> > +
> > +stream_start_fail:
> > +     for (i =3D i - 1; i >=3D 0; i--)
> > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > +
> > +     return ret;
> > +}
> > +
> > +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_c=
han)
> > +{
> > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > +     int i;
> > +
> > +     for (i =3D 0; i < csi_chan->numgangports; i++)
> > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > +}
> > +
> > +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> > +     .csi_start_streaming =3D tegra20_csi_start_streaming,
> > +     .csi_stop_streaming =3D tegra20_csi_stop_streaming,
> > +};
> > +
> > +static const char * const tegra20_csi_clks[] =3D {
> > +     NULL,
> > +};
> > +
> > +const struct tegra_csi_soc tegra20_csi_soc =3D {
> > +     .ops =3D &tegra20_csi_ops,
> > +     .mipi_ops =3D &tegra20_mipi_ops,
> > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > +     .clk_names =3D tegra20_csi_clks,
> > +     .num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> > +};
> > +
> > +static const char * const tegra30_csi_clks[] =3D {
> > +     "csi",
> > +     "csia-pad",
> > +     "csib-pad",
> > +};
> > +
> > +const struct tegra_csi_soc tegra30_csi_soc =3D {
> > +     .ops =3D &tegra20_csi_ops,
> > +     .mipi_ops =3D &tegra20_mipi_ops,
> > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > +     .clk_names =3D tegra30_csi_clks,
> > +     .num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> > +};
> > +
> >  /* -------------------------------------------------------------------=
-------
> >   * VIP
> >   */
> > @@ -681,10 +1193,11 @@ static int tegra20_vip_start_streaming(struct te=
gra_vip_channel *vip_chan)
> >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAG=
E_DT_RAW8 ||
> >                                           data_type =3D=3D TEGRA_IMAGE_=
DT_RAW10) ?
> >                                           TEGRA_VI_OUT_2 : TEGRA_VI_OUT=
_1;
> > -     unsigned int main_input_format;
> > -     unsigned int yuv_input_format;
> > +     unsigned int main_input_format, yuv_input_format;
> > +     unsigned int main_output_format, yuv_output_format;
> >
> >       tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_in=
put_format);
> > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_=
output_format);
> >
> >       tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> >
> > @@ -717,6 +1230,11 @@ static int tegra20_vip_start_streaming(struct teg=
ra_vip_channel *vip_chan)
> >
> >       tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONT=
ROL_STOP_CAPTURE);
> >
> > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_chann=
el),
> > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > +                       yuv_output_format | main_output_format);
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/m=
edia/tegra-video/vi.h
> > index 5cbc0606ed6c..bad55e0bd313 100644
> > --- a/drivers/staging/media/tegra-video/vi.h
> > +++ b/drivers/staging/media/tegra-video/vi.h
> > @@ -125,7 +125,6 @@ struct tegra_vi {
> >   *           frame through host1x syncpoint counters (On Tegra20 used =
for the
> >   *              OUT_1 syncpt)
> >   * @sp_incr_lock: protects cpu syncpoint increment.
> > - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 =
(Tegra20)
> >   *
> >   * @kthread_start_capture: kthread to start capture of single frame wh=
en
> >   *           vb buffer is available. This thread programs VI CSI hardw=
are
> > @@ -188,7 +187,6 @@ struct tegra_vi_channel {
> >       struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
> >       /* protects the cpu syncpoint increment */
> >       spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> > -     u32 next_out_sp_idx;
> >
> >       struct task_struct *kthread_start_capture;
> >       wait_queue_head_t start_wait;
> > diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/stagin=
g/media/tegra-video/video.c
> > index 6fe8d5301b9c..9f2bddc460bf 100644
> > --- a/drivers/staging/media/tegra-video/video.c
> > +++ b/drivers/staging/media/tegra-video/video.c
> > @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_subd=
evs[] =3D {
> >       { .compatible =3D "nvidia,tegra20-vip", },
> >       { .compatible =3D "nvidia,tegra20-vi", },
> >  #endif
> > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > +     { .compatible =3D "nvidia,tegra20-csi", },
> > +#endif
> > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > +     { .compatible =3D "nvidia,tegra30-csi", },
> > +#endif
> >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> >       { .compatible =3D "nvidia,tegra210-csi", },
> >       { .compatible =3D "nvidia,tegra210-vi", },
> >
>
>
>
>
