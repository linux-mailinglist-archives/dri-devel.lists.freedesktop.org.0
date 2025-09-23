Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BEFB93FD0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BB610E531;
	Tue, 23 Sep 2025 02:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dva4qX74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5A410E531
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:22:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N2KlkB000755
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KYZdiDOC5bv4MOoPW35JMcR2jYyqaiNntVfeN1yqhgg=; b=Dva4qX74c4VcO2Z1
 MwUph+vRGW8LYXbbTJHY/ay2/UDlewSudstSxvlrbo2R0ODnnANAAR9krUH0LjMJ
 qrRf7LxQFpOUGx4B5t7019JTOI2bNwrPL8V0RSH68W+2CZVcB1tPC2COxSybdhmy
 LQzxHEHqE5/v9Tn8BvDH8o0ITdd7DEYc3FuNQjXT/gx4GzVpk0eJaIX9iVVMMmis
 Z4jw7XdWU28r73v1eyrukNOJGhR3XXTXAWrIAkyN9bfU+CF8gLcwJ8VCgqIPn3Fc
 EGPJWKXFmBEzXQr8Me7Hjb2dicbpjfy0yNEKWdMyu+sx1828FMnxYJ5QNsYiVppZ
 zQ/b4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdr056-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:22:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-78e831e5a42so126024976d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 19:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758594162; x=1759198962;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYZdiDOC5bv4MOoPW35JMcR2jYyqaiNntVfeN1yqhgg=;
 b=vmR7ZuxtbFLr4eRd0E8A+bgnFRkBIEq693bU5TiEnbnSiO1m7ntrqtV4UMNITu9NeM
 WaJH7Ok1p7ckxD5SCkv27NjwRKfaBAgQouTCIVBHx8HyQcgoW3uAcEShQUp6znypUmB2
 tFn9UwdCQ2ioxQG5Qz/nj4Fb0ZDZhU/KG+8ypuCvHV6i0okBv9VHN9eq+pucp40RLGo2
 3YOOVYDSSTn6cxJNGo5C1GSnKS0szhqMNlkNl2Tasg5jcDR+A9JoAQ76XCupNA9+t771
 EpQR/vHHEkL5lHTuY9RlJqVAr+5kcMqeL4thvI9IIwhcqCDOb+wbhkUDQc0NTNQBIao6
 q+Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKXgJn6EXPCk8+dVSAFZCoFxoK4AhGGjPvB6ZAXBXD77irF4mMkSJw75/T/84lUbHCQkCSXn2xjPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz65iOlXBjb4SeWjfGLJ2UQTjHDBjk0Nwp30a7heZcPgv16H1X6
 pBDaa4ecj0qzCjOEkXyy38APY5OaDegEABq3LbtmrF5SkRG8r6FAcIMLDfnV7xJxPbChmVKADcl
 UGFEN1YY+dDhdqiRIuyP+Njo0Odh8JWSzn8pSV01Qs5kxbu0JVEKQu+XPwUC5pKkYuV01dIE=
X-Gm-Gg: ASbGncuZ41yDYMP8f80UBHWoQEIKqlp1l6mc5VDFNK/liHWgkGfnA8iWlVOSKxYOD2w
 Ne0CjmH0lWYl5io5TSbG1TH2N5AM0D2+lSc44iustADyuf62qzRtd7BQKw6yV8QPmNr9R45LQoj
 F+Pu0+oOqYFOBUB50naBorI6BHIPV/VhewcDICRiDhWCHjNI6uxIFDSeMa6y8A6gC/51KNN+hHl
 39H1I2/+QmmlTlaBR2MuC0TBd2Su6j9ZRa3v/VRNx1Vz6SfMmleJ5ND3cd963LVVdjKxR17xr11
 HOGjLGGtVdz3Ik4HbKoBmcTbD49hmRAzMtnrCxczD4VY9IJbwGlipmX6Ale8SA0LhnHLSwaxx92
 swBfzuA3hI0k75XunDExE5iUmzUPxerDatqigD9f4b8T26dQLHsU4
X-Received: by 2002:a05:6214:b6e:b0:781:a369:ef8c with SMTP id
 6a1803df08f44-7e7037282f6mr11557216d6.16.1758594162166; 
 Mon, 22 Sep 2025 19:22:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGMFcPFMs9tf/BLVuoml4neszEVGYIRwTOalLcM6zhPAy5PO9HwGdTChfgqLduK9x1pWRJPw==
X-Received: by 2002:a05:6214:b6e:b0:781:a369:ef8c with SMTP id
 6a1803df08f44-7e7037282f6mr11557046d6.16.1758594161644; 
 Mon, 22 Sep 2025 19:22:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a957396esm3767822e87.107.2025.09.22.19.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 19:22:40 -0700 (PDT)
Date: Tue, 23 Sep 2025 05:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <gqsj4ikfwqpt26axmz2omvi36xavyxjvslhepsr2czvnjse7in@5yqzg6o7r3mh>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-6-uwu@icenowy.me>
 <yy57lh5rmbubtqscpquoy3np65tm465cqbtmjw5pqiwxjnecsh@d4qbxe3d4sc5>
 <d8240b212b9557878a12ee835a1c8b4840236580.camel@icenowy.me>
 <201a9bb7732d51f4807b3b3644e91333f1b746d6.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201a9bb7732d51f4807b3b3644e91333f1b746d6.camel@icenowy.me>
X-Proofpoint-ORIG-GUID: 4oGRlknBwSYQOHDelNyA9N31yia2in4-
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d20473 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=YJUo16DlFZw7r3sCiXcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4oGRlknBwSYQOHDelNyA9N31yia2in4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX1pkN/UphCZw+
 jrVncaysmQgDhJwntXxf2A46ckdVennszSBqKgZpGimk/dtOv6D/FgNUWF/8UowNHV/J5tE8xXy
 mqCeLY3uQ8LfvWR1CRfNBfY056+1EFovv19pJZ8rXiwTbm+ujBzkrO6toyeU0LWJjqyCIQxIOoy
 1ZYhxarfe3pb5OJx8GAe9N7ofnLAItdYsg0xJx8Xf/b0tEdkni6q9c/zipVlvHINR+wZBfo7ttY
 urk1veDjjGYJioLBsAEchMG98WLpHo7ozp6gujcq2pSU7jqPFd4kCjXDf4Rl3yw4BWphTgLQ3ZA
 e44X6vcppzUBuzkrLuMSdk4D11S4z/dhs8doIgrWHjStnAngn6OqS+oma85fYYsBGxf5CHPBIGa
 Dvc/cz/W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
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

On Tue, Sep 23, 2025 at 09:30:05AM +0800, Icenowy Zheng wrote:
> 在 2025-09-23星期二的 09:11 +0800，Icenowy Zheng写道：
> > 在 2025-09-23星期二的 04:00 +0300，Dmitry Baryshkov写道：
> > > On Sun, Sep 21, 2025 at 04:34:43PM +0800, Icenowy Zheng wrote:
> > > > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller
> > > > (paired
> > > > with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from
> > > > the
> > > > display controller.
> > > > 
> > > > Add a driver for this controller utilizing the common DesignWare
> > > > HDMI
> > > > code in the kernel.
> > > > 
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > > Changes in v2:
> > > > - Created a new function to set PHY parameters and refactored the
> > > >   control flow of the configure_phy callback.
> > > > 
> > > >  MAINTAINERS                             |   1 +
> > > >  drivers/gpu/drm/bridge/Kconfig          |  10 ++
> > > >  drivers/gpu/drm/bridge/Makefile         |   1 +
> > > >  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173
> > > > ++++++++++++++++++++++++
> > > >  4 files changed, 185 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > 
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index f6206963efbf0..98af9dd3664f5 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -21759,6 +21759,7 @@
> > > > F:      Documentation/devicetree/bindings/reset/thead,th1520-
> > > > reset.yaml
> > > >  F:     arch/riscv/boot/dts/thead/
> > > >  F:     drivers/clk/thead/clk-th1520-ap.c
> > > >  F:     drivers/firmware/thead,th1520-aon.c
> > > > +F:     drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > >  F:     drivers/mailbox/mailbox-th1520.c
> > > >  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > >  F:     drivers/pinctrl/pinctrl-th1520.c
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > > > b/drivers/gpu/drm/bridge/Kconfig
> > > > index b9e0ca85226a6..f75e6ad04179f 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -322,6 +322,16 @@ config DRM_THINE_THC63LVD1024
> > > >         help
> > > >           Thine THC63LVD1024 LVDS/parallel converter driver.
> > > >  
> > > > +config DRM_THEAD_TH1520_DW_HDMI
> > > > +       tristate "T-Head TH1520 DesignWare HDMI bridge"
> > > > +       depends on OF
> > > > +       depends on COMMON_CLK
> > > > +       depends on ARCH_THEAD || COMPILE_TEST
> > > > +       select DRM_DW_HDMI
> > > > +       help
> > > > +         Choose this to enable support for the internal HDMI
> > > > bridge found
> > > > +         on the T-Head TH1520 SoC.
> > > > +
> > > >  config DRM_TOSHIBA_TC358762
> > > >         tristate "TC358762 DSI/DPI bridge"
> > > >         depends on OF
> > > > diff --git a/drivers/gpu/drm/bridge/Makefile
> > > > b/drivers/gpu/drm/bridge/Makefile
> > > > index 245e8a27e3fc5..421e445ff1cd9 100644
> > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
> > > >  obj-$(CONFIG_DRM_SII902X) += sii902x.o
> > > >  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> > > >  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> > > > +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
> > > >  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
> > > >  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
> > > >  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> > > > diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > new file mode 100644
> > > > index 0000000000000..efb27d37ff652
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > > @@ -0,0 +1,173 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > > + *
> > > > + * Based on rcar_dw_hdmi.c, which is:
> > > > + *   Copyright (C) 2016 Renesas Electronics Corporation
> > > > + * Based on imx8mp-hdmi-tx.c, which is:
> > > > + *   Copyright (C) 2022 Pengutronix, Lucas Stach
> > > > <kernel@pengutronix.de>
> > > > + */
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/mod_devicetable.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/reset.h>
> > > > +
> > > > +#include <drm/bridge/dw_hdmi.h>
> > > > +#include <drm/drm_modes.h>
> > > > +
> > > > +#define TH1520_HDMI_PHY_OPMODE_PLLCFG  0x06    /* Mode of
> > > > operation and PLL dividers */
> > > > +#define TH1520_HDMI_PHY_CKSYMTXCTRL    0x09    /* Clock Symbol
> > > > and
> > > > Transmitter Control Register */
> > > > +#define TH1520_HDMI_PHY_VLEVCTRL       0x0e    /* Voltage Level
> > > > Control Register */
> > > > +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL 0x10    /* PLL current
> > > > and
> > > > Gmp (conductance) */
> > > > +#define TH1520_HDMI_PHY_PLLDIVCTRL     0x11    /* PLL dividers
> > > > */
> > > > +#define TH1520_HDMI_PHY_TXTERM         0x19    /* Transmission
> > > > Termination Register */
> > > > +
> > > > +struct th1520_hdmi_phy_params {
> > > > +       unsigned long mpixelclock;
> > > > +       u16 opmode_pllcfg;
> > > > +       u16 pllcurrgmpctrl;
> > > > +       u16 plldivctrl;
> > > > +       u16 cksymtxctrl;
> > > > +       u16 vlevctrl;
> > > > +       u16 txterm;
> > > > +};
> > > > +
> > > > +static const struct th1520_hdmi_phy_params
> > > > th1520_hdmi_phy_params[] = {
> > > > +       { 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0,
> > > > 0x0007
> > > > },
> > > > +       { 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120,
> > > > 0x0004
> > > > },
> > > > +       { 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200,
> > > > 0x0005
> > > > },
> > > > +       { 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140,
> > > > 0x0000
> > > > },
> > > > +       { 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140,
> > > > 0x0000
> > > > },
> > > > +       { 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0,
> > > > 0x0004
> > > > },
> > > > +};
> > > > +
> > > > +struct th1520_hdmi {
> > > > +       struct dw_hdmi_plat_data plat_data;
> > > > +       struct dw_hdmi *dw_hdmi;
> > > > +       struct clk *pixclk;
> > > > +       struct reset_control *mainrst, *prst;
> > > > +};
> > > > +
> > > > +static enum drm_mode_status
> > > > +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> > > > +                      const struct drm_display_info *info,
> > > > +                      const struct drm_display_mode *mode)
> > > > +{
> > > > +       /*
> > > > +        * The maximum supported clock frequency is 594 MHz, as
> > > > shown in the PHY
> > > > +        * parameters table.
> > > > +        */
> > > > +       if (mode->clock > 594000)
> > > > +               return MODE_CLOCK_HIGH;
> > > 
> > > Is it the limitation for the pixel clock or for the TMDS char clock
> > > (the
> > > difference makes sense for non-8-bpc modes.
> > 
> > I have no idea, the BSP driver didn't consider non-8bpc modes, and I
> > have no non-8bpc devices to test.
> 
> Should I reject non-8bpc modes here because of lack of information?

No need to, they won't be used anyway.

> 
> > 
> > > 
> > > > +
> > > > +       return MODE_OK;
> > > > +}
> > > > +
> > > 
> > 
> 

-- 
With best wishes
Dmitry
