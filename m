Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F01EE14D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724436E2D7;
	Thu,  4 Jun 2020 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31F289BB3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N18egnZRnCZO7CPkkC65O4vbyHVD+Hs6Xx6/KjiRYIRo+97GY3x97VbIJXU9SWuo+QSs+eTBwCjQKdOOu18NwN0IX46gG4MzZ7DQ3Rk5ZPJYskRxfAQKSCz/HfUSslZyxDjHPQGqqIe4qJWOGwOb5wTi0cNjoJI+ixoFY7q/9+qXILZjcUY2Y1sebvsArmMRxkCK4tfsJnZYPPOZeWq0YGKVR+sDu5tIWiR4j5eKy+c8wKb5Zit4qzNUEXURrd24EYfa/EP1Kt1h06RQwENyDfX8Clq76Nn+hpyQ6wozzBnHcHq5ir50CqS/Rb5MOsw1i+fArAMl6UHw7X2W9O5nFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tq4R39k7zQ+5lTPy0limFAhplpS84szVpxvUtgWuas=;
 b=FYNBFye6qOBHbFN8ul7d4NoYwEn1416EQmoFqob/N8gZh8h3tT1KmbVX/m1pnjIfihAg2De2gwCn5i3qohbuDAK/7erg3GX0gxmMKs59NB8jlYkRh6y2idZ56OCzXTrJcAz287N9L1KKOM5OWd8aLx3KuRv8BFwhbKN5apl2mz5zja8GydOSWrOeBZd9NuvU3ZDZR5MeySLQejzrRgpor04dP6VdUgUHdppCvcu+OS5SKsp7/n1Ld9fYnIOfechc70dsijMSS4s/FDKyk4bUZXQyGjWRyaaW6WGOy/6XlM3Xz8d5MGjzJTfaJixZoTs0DjRMFHM3xx52i26ubK5PLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tq4R39k7zQ+5lTPy0limFAhplpS84szVpxvUtgWuas=;
 b=L44pAtr5fpMpFXUpUmkxsq57P5JwY6KxKyjfZS6w23/f1L0F5mgxcaptuyLqbuLFHmLi2Wt5DeQdIzg252NQLh3z8Oz7wPMrdgttvOsGTzHcFkxmTJ32y4imew96cT4MQygyqsWrFhXYhPFZex3ljH306KtcWHGgkEV+dRV05Og=
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 by DB8PR04MB5609.eurprd04.prod.outlook.com (2603:10a6:10:b1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 09:29:24 +0000
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d]) by DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d%9]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 09:29:24 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH 3/7] drm: bridge: cadence: initial support for
 MHDP DP bridge driver
Thread-Topic: [EXT] Re: [PATCH 3/7] drm: bridge: cadence: initial support for
 MHDP DP bridge driver
Thread-Index: AQHWN8j4u7WI46r4Oky1ETuRdyEEkajF/WcAgAI4AnA=
Date: Thu, 4 Jun 2020 09:29:24 +0000
Message-ID: <DB8PR04MB6828E259FE54A79F4E0567C6F4890@DB8PR04MB6828.eurprd04.prod.outlook.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
 <cebdfdaffa40e208f925661522fa9ee1fb0f8721.1590982881.git.Sandor.yu@nxp.com>
 <20200602233524.GQ6547@pendragon.ideasonboard.com>
In-Reply-To: <20200602233524.GQ6547@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0eecd61a-e0e7-4b15-59c3-08d80869c55f
x-ms-traffictypediagnostic: DB8PR04MB5609:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB56091BD819C2831A79DBCC31F4890@DB8PR04MB5609.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kTdSv/Lrk8vGB18MrVarSXRkbZaiRbvGYh6HiPi6Fh8+DrqbkKHVHGNuo6/SKH8x6F57yOqiUU+I2tt915M+6BqL7rQhWK84+xkc1ZWDbxKznu2rqVarMpx+Xl7FUdVVD+VB5jFLLdMP+lGHWl2pvuZyHUBLXCSNCW1OwMoCrpgsZnUycbIAtVZy6hkhL04JQb5M66cSNqM4ycIl8vjVMKWfUggzqLw+pLouiY3yVU+Zqy3mhLpoJFXIb4AO/WKo9hXw+yMVDnRI2NsM5F8G6dgfXfK6zOKpBUVvW/jqeMna5mUim0eQqoSiG/yq922L9tKkZm29nCPdh22VpmljlWgn/BLkZ/VTwGZi2aocEoQx8YUHLyzrERCp4ZQwVN2BW4tkc6eXVX/UfqwUF3+r5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6828.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(316002)(86362001)(44832011)(6916009)(71200400001)(2906002)(5660300002)(9686003)(66556008)(7416002)(55016002)(83080400001)(66446008)(64756008)(26005)(66476007)(4326008)(54906003)(8936002)(966005)(76116006)(66946007)(45080400002)(7696005)(186003)(30864003)(52536014)(83380400001)(6506007)(33656002)(8676002)(478600001)(53546011)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Oue9Wu3VsbZYMAzDgVGTUdbhW1TzGhzyF6AtAqD3zVFxVPhjaTvtqcmA1IcQMZjM2FQzssoTN5d80pr0O/waEVRT3RmSDYstzbkHBVNmysMGVOTlMdn60YzG7RlebAJ5GwG1bc3CsMLYv2mPh9yUd38Uqc2J5aj1hn+o42wbRkuWpu+6/5xwEsB2ll0t/EfT05aBNLQB/VjVyCWJXR3ZinyX1OGFmekXSGWe9qGjVTET+KAm0DC1wahI8wXDYXx1/zofpeysrpYY6gIO8z+qWaMYwQup+j1emrbqrpIERmluN2wLar//mrN5Gd5XIm8hDKtAWBgZ5kJ99OLuoEo+WdC0po7CwrR5cRtYHmH9RsBUueOqe1WmdoZ9ApSysIc8Evj5vXQX0oZZCCgilFQ3jd0X57qCZiUD7+i86gjkhY/c2++DyHDaNXK90yyEjmOj8BPJrPeIPfRy6b6rf+c1B9X13mTDK8Dezgg0PWpY4gY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eecd61a-e0e7-4b15-59c3-08d80869c55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 09:29:24.7738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ziyYHeufqDxOAmWjNS+6HrOsZ2ysn+3XFk6XxHDCwMvkEUDFofmB6NlMG9NNV7/pFmNudxx+4ItIFwgM6nQhvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5609
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dkos@cadence.com" <dkos@cadence.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Wednesday, June 3, 2020 7:35 AM
> To: Sandor Yu <sandor.yu@nxp.com>
> Cc: a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
> jernej.skrabec@siol.net; heiko@sntech.de; hjc@rock-chips.com;
> dkos@cadence.com; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-rockchip@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH 3/7] drm: bridge: cadence: initial support for MHDP
> DP bridge driver
> 
> Caution: EXT Email
> 
> Hi Sandor,
> 
> Thank you for the patch.
> 
> On Mon, Jun 01, 2020 at 02:17:33PM +0800, sandor.yu@nxp.com wrote:
> > From: Sandor Yu <Sandor.yu@nxp.com>
> >
> > This adds initial support for MHDP DP bridge driver.
> > Basic DP functions are supported, that include:
> >  -Video mode set on-the-fly
> >  -Cable hotplug detect
> >  -MAX support resolution to 3096x2160@60fps  -Support DP audio
> -EDID
> > read via AUX
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> >  drivers/gpu/drm/bridge/cadence/cdns-dp-core.c | 530
> > ++++++++++++++++++  .../gpu/drm/bridge/cadence/cdns-mhdp-audio.c
> |
> > 100 ++++  .../gpu/drm/bridge/cadence/cdns-mhdp-common.c |  42 +-
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |   3 +
> >  drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c |  34 +-
> >  drivers/gpu/drm/rockchip/cdn-dp-core.c        |   7 +-
> >  include/drm/bridge/cdns-mhdp.h                |  52 +-
> >  9 files changed, 740 insertions(+), 33 deletions(-)  create mode
> > 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig
> > index 48c1b0f77dc6..b7b8d30b18b6 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -5,3 +5,7 @@ config DRM_CDNS_MHDP
> >       depends on OF
> >       help
> >         Support Cadence MHDP API library.
> > +
> > +config DRM_CDNS_DP
> > +     tristate "Cadence DP DRM driver"
> > +     depends on DRM_CDNS_MHDP
> > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > b/drivers/gpu/drm/bridge/cadence/Makefile
> > index ddb2ba4fb852..cb3c88311a64 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only  cdns_mhdp_drmcore-y :=
> > cdns-mhdp-common.o cdns-mhdp-audio.o cdns-mhdp-dp.o
> > +cdns_mhdp_drmcore-$(CONFIG_DRM_CDNS_DP) += cdns-dp-core.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP)          += cdns_mhdp_drmcore.o
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
> > new file mode 100644
> > index 000000000000..b2fe8fdc64ed
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
> > @@ -0,0 +1,530 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence Display Port Interface (DP) driver
> > + *
> > + * Copyright (C) 2019-2020 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/bridge/cdns-mhdp.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_encoder_slave.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/irq.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
> > +
> > +#include "cdns-mhdp-common.h"
> > +
> > +/*
> > + * This function only implements native DPDC reads and writes  */
> > +static ssize_t dp_aux_transfer(struct drm_dp_aux *aux,
> > +             struct drm_dp_aux_msg *msg) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(aux->dev);
> > +     bool native = msg->request & (DP_AUX_NATIVE_WRITE &
> DP_AUX_NATIVE_READ);
> > +     int ret;
> > +
> > +     /* Ignore address only message */
> > +     if ((msg->size == 0) || (msg->buffer == NULL)) {
> > +             msg->reply = native ?
> > +                     DP_AUX_NATIVE_REPLY_ACK :
> DP_AUX_I2C_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +
> > +     if (!native) {
> > +             dev_err(mhdp->dev, "%s: only native messages
> supported\n", __func__);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* msg sanity check */
> > +     if (msg->size > DP_AUX_MAX_PAYLOAD_BYTES) {
> > +             dev_err(mhdp->dev, "%s: invalid msg: size(%zu),
> request(%x)\n",
> > +                                             __func__, msg->size,
> (unsigned int)msg->request);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (msg->request == DP_AUX_NATIVE_WRITE) {
> > +             const u8 *buf = msg->buffer;
> > +             int i;
> > +             for (i = 0; i < msg->size; ++i) {
> > +                     ret = cdns_mhdp_dpcd_write(mhdp,
> > +                                                msg->address + i,
> buf[i]);
> > +                     if (!ret)
> > +                             continue;
> > +
> > +                     DRM_DEV_ERROR(mhdp->dev, "Failed to write
> > + DPCD\n");
> > +
> > +                     return ret;
> > +             }
> > +             msg->reply = DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +
> > +     if (msg->request == DP_AUX_NATIVE_READ) {
> > +             ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
> msg->buffer, msg->size);
> > +             if (ret < 0)
> > +                     return -EIO;
> > +             msg->reply = DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int dp_aux_init(struct cdns_mhdp_device *mhdp,
> > +               struct device *dev)
> > +{
> > +     int ret;
> > +
> > +     mhdp->dp.aux.name = "imx_dp_aux";
> > +     mhdp->dp.aux.dev = dev;
> > +     mhdp->dp.aux.transfer = dp_aux_transfer;
> > +
> > +     ret = drm_dp_aux_register(&mhdp->dp.aux);
> > +
> > +     return ret;
> > +}
> > +
> > +static int dp_aux_destroy(struct cdns_mhdp_device *mhdp) {
> > +     drm_dp_aux_unregister(&mhdp->dp.aux);
> > +     return 0;
> > +}
> > +
> > +static void dp_pixel_clk_reset(struct cdns_mhdp_device *mhdp) {
> > +     u32 val;
> > +
> > +     /* reset pixel clk */
> > +     val = cdns_mhdp_reg_read(mhdp, SOURCE_HDTX_CAR);
> > +     cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, val & 0xFD);
> > +     cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, val); }
> > +
> > +static void cdns_dp_mode_set(struct cdns_mhdp_device *mhdp) {
> > +     int ret;
> > +
> > +     cdns_mhdp_plat_call(mhdp, pclk_rate);
> > +
> > +     /* delay for DP FW stable after pixel clock relock */
> > +     msleep(50);
> > +
> > +     dp_pixel_clk_reset(mhdp);
> > +
> > +     /* Get DP Caps  */
> > +     ret = drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV,
> mhdp->dp.dpcd,
> > +                            DP_RECEIVER_CAP_SIZE);
> > +     if (ret < 0) {
> > +             DRM_ERROR("Failed to get caps %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     mhdp->dp.rate = drm_dp_max_link_rate(mhdp->dp.dpcd);
> > +     mhdp->dp.num_lanes = drm_dp_max_lane_count(mhdp->dp.dpcd);
> > +
> > +     /* check the max link rate */
> > +     if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> > +             mhdp->dp.rate = CDNS_DP_MAX_LINK_RATE;
> > +
> > +     /* Initialize link rate/num_lanes as panel max link
> rate/max_num_lanes */
> > +     cdns_mhdp_plat_call(mhdp, phy_set);
> > +
> > +     /* Video off */
> > +     ret = cdns_mhdp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to valid video %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     /* Line swaping */
> > +     mhdp->lane_mapping = mhdp->plat_data->lane_mapping;
> > +     cdns_mhdp_reg_write(mhdp, LANES_CONFIG, 0x00400000 |
> > + mhdp->lane_mapping);
> > +
> > +     /* Set DP host capability */
> > +     ret = cdns_mhdp_set_host_cap(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to set host cap %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     ret = cdns_mhdp_config_video(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to config video %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     return;
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * DP TX Setup
> > + */
> > +static enum drm_connector_status
> > +cdns_dp_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +     struct cdns_mhdp_device *mhdp = container_of(connector,
> > +                                     struct cdns_mhdp_device,
> connector.base);
> > +     u8 hpd = 0xf;
> > +
> > +     hpd = cdns_mhdp_read_hpd(mhdp);
> > +     if (hpd == 1)
> > +             /* Cable Connected */
> > +             return connector_status_connected;
> > +     else if (hpd == 0)
> > +             /* Cable Disconnedted */
> > +             return connector_status_disconnected;
> > +     else {
> > +             /* Cable status unknown */
> > +             DRM_INFO("Unknow cable status, hdp=%u\n", hpd);
> > +             return connector_status_unknown;
> > +     }
> > +}
> > +
> > +static int cdns_dp_connector_get_modes(struct drm_connector
> > +*connector) {
> > +     struct cdns_mhdp_device *mhdp = container_of(connector,
> > +                                     struct cdns_mhdp_device,
> connector.base);
> > +     int num_modes = 0;
> > +     struct edid *edid;
> > +
> > +     edid = drm_do_get_edid(&mhdp->connector.base,
> > +                                cdns_mhdp_get_edid_block, mhdp);
> > +     if (edid) {
> > +             dev_info(mhdp->dev, "%x,%x,%x,%x,%x,%x,%x,%x\n",
> > +                      edid->header[0], edid->header[1],
> > +                      edid->header[2], edid->header[3],
> > +                      edid->header[4], edid->header[5],
> > +                      edid->header[6], edid->header[7]);
> > +             drm_connector_update_edid_property(connector, edid);
> > +             num_modes = drm_add_edid_modes(connector, edid);
> > +             kfree(edid);
> > +     }
> > +
> > +     if (num_modes == 0)
> > +             DRM_ERROR("Invalid edid\n");
> > +     return num_modes;
> > +}
> > +
> > +static const struct drm_connector_funcs cdns_dp_connector_funcs = {
> > +     .fill_modes = drm_helper_probe_single_connector_modes,
> > +     .detect = cdns_dp_connector_detect,
> > +     .destroy = drm_connector_cleanup,
> > +     .reset = drm_atomic_helper_connector_reset,
> > +     .atomic_duplicate_state =
> drm_atomic_helper_connector_duplicate_state,
> > +     .atomic_destroy_state =
> > +drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static const struct drm_connector_helper_funcs
> cdns_dp_connector_helper_funcs = {
> > +     .get_modes = cdns_dp_connector_get_modes, };
> > +
> > +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> > +                              enum drm_bridge_attach_flags flags) {
> > +     struct cdns_mhdp_device *mhdp = bridge->driver_private;
> > +     struct drm_encoder *encoder = bridge->encoder;
> > +     struct drm_connector *connector = &mhdp->connector.base;
> 
> New bridge drivers need to support operation without creating a connector
> when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set in the flags
> argument. For an example of how this is done, please see
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.ke
> rnel.org%2Fdri-devel%2F20200526011505.31884-23-laurent.pinchart%2Bren
> esas%40ideasonboard.com%2F&amp;data=02%7C01%7Csandor.yu%40nxp.co
> m%7C3bcd86069c2f4203291408d8074da940%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C637267377438245998&amp;sdata=BYg3bd0%2F
> KZYHqTTaHGHxkRMDpqwzNCjxFYpo3%2BTa2r4%3D&amp;reserved=0
> 
I will followed the new bridge drivers later, thanks.
> > +
> > +     connector->interlace_allowed = 1;
> > +
> > +     connector->polled = DRM_CONNECTOR_POLL_HPD;
> > +
> > +     drm_connector_helper_add(connector,
> > + &cdns_dp_connector_helper_funcs);
> > +
> > +     drm_connector_init(bridge->dev, connector,
> &cdns_dp_connector_funcs,
> > +                        DRM_MODE_CONNECTOR_DisplayPort);
> > +
> > +     drm_connector_attach_encoder(connector, encoder);
> > +
> > +     return 0;
> > +}
> > +
> > +static enum drm_mode_status
> > +cdns_dp_bridge_mode_valid(struct drm_bridge *bridge,
> > +                       const struct drm_display_mode *mode) {
> > +     enum drm_mode_status mode_status = MODE_OK;
> > +
> > +     /* We don't support double-clocked modes */
> > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > +                     mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +             return MODE_BAD;
> > +
> > +     /* MAX support pixel clock rate 594MHz */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     /* 4096x2160 is not supported */
> > +     if (mode->hdisplay > 3840)
> > +             return MODE_BAD_HVALUE;
> > +
> > +     if (mode->vdisplay > 2160)
> > +             return MODE_BAD_VVALUE;
> > +
> > +     return mode_status;
> > +}
> > +
> > +static void cdns_dp_bridge_mode_set(struct drm_bridge *bridge,
> > +                                 const struct drm_display_mode
> *orig_mode,
> > +                                 const struct drm_display_mode
> *mode)
> > +{
> > +     struct cdns_mhdp_device *mhdp = bridge->driver_private;
> > +     struct drm_display_info *display_info =
> &mhdp->connector.base.display_info;
> > +     struct video_info *video = &mhdp->video_info;
> > +
> > +     switch (display_info->bpc) {
> > +     case 10:
> > +             video->color_depth = 10;
> > +             break;
> > +     case 6:
> > +             video->color_depth = 6;
> > +             break;
> > +     default:
> > +             video->color_depth = 8;
> > +             break;
> > +     }
> > +
> > +     video->color_fmt = PXL_RGB;
> > +     video->v_sync_polarity = !!(mode->flags &
> DRM_MODE_FLAG_NVSYNC);
> > +     video->h_sync_polarity = !!(mode->flags &
> DRM_MODE_FLAG_NHSYNC);
> > +
> > +     DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay,
> mode->clock);
> > +     memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
> > +
> > +     mutex_lock(&mhdp->lock);
> > +     cdns_dp_mode_set(mhdp);
> > +     mutex_unlock(&mhdp->lock);
> > +}
> > +
> > +static void cdn_dp_bridge_enable(struct drm_bridge *bridge) {
> > +     struct cdns_mhdp_device *mhdp = bridge->driver_private;
> > +     int ret;
> > +
> > +     /* Link trainning */
> > +     ret = cdns_mhdp_train_link(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed link train %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     ret = cdns_mhdp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to valid video %d\n",
> ret);
> > +             return;
> > +     }
> > +}
> > +
> > +static void cdn_dp_bridge_disable(struct drm_bridge *bridge) {
> > +     struct cdns_mhdp_device *mhdp = bridge->driver_private;
> > +
> > +     cdns_mhdp_set_video_status(mhdp, CONTROL_VIDEO_IDLE); }
> > +
> > +static const struct drm_bridge_funcs cdns_dp_bridge_funcs = {
> > +     .attach = cdns_dp_bridge_attach,
> > +     .enable = cdn_dp_bridge_enable,
> > +     .disable = cdn_dp_bridge_disable,
> > +     .mode_set = cdns_dp_bridge_mode_set,
> > +     .mode_valid = cdns_dp_bridge_mode_valid, };
> > +
> > +static void hotplug_work_func(struct work_struct *work) {
> > +     struct cdns_mhdp_device *mhdp = container_of(work,
> > +                                        struct cdns_mhdp_device,
> hotplug_work.work);
> > +     struct drm_connector *connector = &mhdp->connector.base;
> > +
> > +     drm_helper_hpd_irq_event(connector->dev);
> > +
> > +     if (connector->status == connector_status_connected) {
> > +             /* Cable connedted  */
> > +             DRM_INFO("HDMI/DP Cable Plug In\n");
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +     } else if (connector->status == connector_status_disconnected) {
> > +             /* Cable Disconnedted  */
> > +             DRM_INFO("HDMI/DP Cable Plug Out\n");
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +     }
> > +}
> > +
> > +static irqreturn_t cdns_dp_irq_thread(int irq, void *data) {
> > +     struct cdns_mhdp_device *mhdp = data;
> > +
> > +     disable_irq_nosync(irq);
> > +
> > +     mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > +                     msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int __cdns_dp_probe(struct platform_device *pdev,
> > +             struct cdns_mhdp_device *mhdp) {
> > +     struct device *dev = &pdev->dev;
> > +     struct resource *iores = NULL;
> > +     int ret;
> > +
> > +     mutex_init(&mhdp->lock);
> > +
> > +     INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> > +
> > +     iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (iores) {
> > +             mhdp->regs_base = devm_ioremap(dev, iores->start,
> > +                                            resource_size(iores));
> > +             if (IS_ERR(mhdp->regs_base))
> > +                     return -ENOMEM;
> > +     }
> > +
> > +     mhdp->irq[IRQ_IN] = platform_get_irq_byname(pdev, "plug_in");
> > +     if (mhdp->irq[IRQ_IN] < 0) {
> > +             dev_info(dev, "No plug_in irq number\n");
> > +     }
> > +
> > +     mhdp->irq[IRQ_OUT] = platform_get_irq_byname(pdev, "plug_out");
> > +     if (mhdp->irq[IRQ_OUT] < 0) {
> > +             dev_info(dev, "No plug_out irq number\n");
> > +     }
> > +
> > +     cdns_mhdp_plat_call(mhdp, power_on);
> > +
> > +     cdns_mhdp_plat_call(mhdp, firmware_init);
> > +
> > +     /* DP FW alive check */
> > +     ret = cdns_mhdp_check_alive(mhdp);
> > +     if (ret == false) {
> > +             DRM_ERROR("NO dp FW running\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     /* DP PHY init before AUX init */
> > +     cdns_mhdp_plat_call(mhdp, phy_set);
> > +
> > +     /* Enable Hotplug Detect IRQ thread */
> > +     irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
> > +     ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> > +                                     NULL, cdns_dp_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev),
> > +                                     mhdp);
> > +
> > +     if (ret) {
> > +             dev_err(dev, "can't claim irq %d\n",
> > +                             mhdp->irq[IRQ_IN]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
> > +     ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> > +                                     NULL, cdns_dp_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev),
> > +                                     mhdp);
> > +
> > +     if (ret) {
> > +             dev_err(dev, "can't claim irq %d\n",
> > +                             mhdp->irq[IRQ_OUT]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (cdns_mhdp_read_hpd(mhdp))
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +     else
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +
> > +     mhdp->bridge.base.driver_private = mhdp;
> > +     mhdp->bridge.base.funcs = &cdns_dp_bridge_funcs; #ifdef
> > +CONFIG_OF
> > +     mhdp->bridge.base.of_node = dev->of_node; #endif
> > +
> > +     dev_set_drvdata(dev, mhdp);
> > +
> > +     /* register audio driver */
> > +     cdns_mhdp_register_audio_driver(dev);
> > +
> > +     dp_aux_init(mhdp, dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static void __cdns_dp_remove(struct cdns_mhdp_device *mhdp) {
> > +     dp_aux_destroy(mhdp);
> > +     cdns_mhdp_unregister_audio_driver(mhdp->dev);
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Probe/remove API, used from platforms based on the DRM bridge API.
> > + */
> > +int cdns_dp_probe(struct platform_device *pdev,
> > +               struct cdns_mhdp_device *mhdp) {
> > +     int ret;
> > +
> > +     ret = __cdns_dp_probe(pdev, mhdp);
> > +     if (ret)
> > +             return ret;
> > +
> > +     drm_bridge_add(&mhdp->bridge.base);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_dp_probe);
> > +
> > +void cdns_dp_remove(struct platform_device *pdev) {
> > +     struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
> > +
> > +     drm_bridge_remove(&mhdp->bridge.base);
> > +
> > +     __cdns_dp_remove(mhdp);
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_dp_remove);
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bind/unbind API, used from platforms based on the component
> framework.
> > + */
> > +int cdns_dp_bind(struct platform_device *pdev, struct drm_encoder
> *encoder,
> > +             struct cdns_mhdp_device *mhdp) {
> > +     int ret;
> > +
> > +     ret = __cdns_dp_probe(pdev, mhdp);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = drm_bridge_attach(encoder, &mhdp->bridge.base, NULL, 0);
> > +     if (ret) {
> > +             cdns_dp_remove(pdev);
> > +             DRM_ERROR("Failed to initialize bridge with drm\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_dp_bind);
> > +
> > +void cdns_dp_unbind(struct device *dev) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +
> > +     __cdns_dp_remove(mhdp);
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_dp_unbind);
> 
> Do we really need to support the component framework, can't we just support
> the DRM bridge API ?
> 
> > +
> > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > +MODULE_DESCRIPTION("Cadence Display Port transmitter driver");
> > +MODULE_LICENSE("GPL"); MODULE_ALIAS("platform:cdns-dp");
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
> > index 8f51de0672ab..fdd4bcd0d33c 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
> > @@ -2,6 +2,9 @@
> >  /*
> >   * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> >   * Author: Chris Zhong <zyw@rock-chips.com>
> > + *
> > + * Cadence MHDP Audio driver
> > + *
> >   */
> >  #include <linux/clk.h>
> >  #include <linux/reset.h>
> > @@ -196,3 +199,100 @@ int cdns_mhdp_audio_config(struct
> cdns_mhdp_device *mhdp,
> >       return ret;
> >  }
> >  EXPORT_SYMBOL(cdns_mhdp_audio_config);
> > +
> > +static int audio_hw_params(struct device *dev,  void *data,
> > +                               struct hdmi_codec_daifmt *daifmt,
> > +                               struct hdmi_codec_params *params) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +     struct audio_info audio = {
> > +             .sample_width = params->sample_width,
> > +             .sample_rate = params->sample_rate,
> > +             .channels = params->channels,
> > +             .connector_type = mhdp->connector.base.connector_type,
> > +     };
> > +     int ret;
> > +
> > +     switch (daifmt->fmt) {
> > +     case HDMI_I2S:
> > +             audio.format = AFMT_I2S;
> > +             break;
> > +     case HDMI_SPDIF:
> > +             audio.format = AFMT_SPDIF_EXT;
> > +             break;
> > +     default:
> > +             DRM_DEV_ERROR(dev, "Invalid format %d\n", daifmt->fmt);
> > +             ret = -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     ret = cdns_mhdp_audio_config(mhdp, &audio);
> > +     if (!ret)
> > +             mhdp->audio_info = audio;
> > +
> > +out:
> > +     return ret;
> > +}
> > +
> > +static void audio_shutdown(struct device *dev, void *data) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret = cdns_mhdp_audio_stop(mhdp, &mhdp->audio_info);
> > +     if (!ret)
> > +             mhdp->audio_info.format = AFMT_UNUSED; }
> > +
> > +static int audio_digital_mute(struct device *dev, void *data,
> > +                                  bool enable) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret = cdns_mhdp_audio_mute(mhdp, enable);
> > +
> > +     return ret;
> > +}
> > +
> > +static int audio_get_eld(struct device *dev, void *data,
> > +                             u8 *buf, size_t len) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +
> > +     memcpy(buf, mhdp->connector.base.eld,
> > +            min(sizeof(mhdp->connector.base.eld), len));
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct hdmi_codec_ops audio_codec_ops = {
> > +     .hw_params = audio_hw_params,
> > +     .audio_shutdown = audio_shutdown,
> > +     .digital_mute = audio_digital_mute,
> > +     .get_eld = audio_get_eld,
> > +};
> > +
> > +int cdns_mhdp_register_audio_driver(struct device *dev) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +     struct hdmi_codec_pdata codec_data = {
> > +             .i2s = 1,
> > +             .spdif = 1,
> > +             .ops = &audio_codec_ops,
> > +             .max_i2s_channels = 8,
> > +     };
> > +
> > +     mhdp->audio_pdev = platform_device_register_data(
> > +                           dev, HDMI_CODEC_DRV_NAME, 1,
> > +                           &codec_data, sizeof(codec_data));
> > +
> > +     return PTR_ERR_OR_ZERO(mhdp->audio_pdev);
> > +}
> > +
> > +void cdns_mhdp_unregister_audio_driver(struct device *dev) {
> > +     struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
> > +
> > +     platform_device_unregister(mhdp->audio_pdev);
> > +}
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
> > index efb39cf5f48b..9fd4546c6914 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
> > @@ -357,36 +357,6 @@ int cdns_mhdp_set_firmware_active(struct
> > cdns_mhdp_device *mhdp, bool enable)  }
> > EXPORT_SYMBOL(cdns_mhdp_set_firmware_active);
> >
> > -int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp, bool flip)
> > -{
> > -     u8 msg[8];
> > -     int ret;
> > -
> > -     msg[0] = drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
> > -     msg[1] = mhdp->dp.num_lanes | SCRAMBLER_EN;
> > -     msg[2] = VOLTAGE_LEVEL_2;
> > -     msg[3] = PRE_EMPHASIS_LEVEL_3;
> > -     msg[4] = PTS1 | PTS2 | PTS3 | PTS4;
> > -     msg[5] = FAST_LT_NOT_SUPPORT;
> > -     msg[6] = flip ? LANE_MAPPING_FLIPPED : LANE_MAPPING_NORMAL;
> > -     msg[7] = ENHANCED;
> > -
> > -     ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > -                                  DPTX_SET_HOST_CAPABILITIES,
> > -                                  sizeof(msg), msg);
> > -     if (ret)
> > -             goto err_set_host_cap;
> > -
> > -     ret = cdns_mhdp_reg_write(mhdp,
> DP_AUX_SWAP_INVERSION_CONTROL,
> > -                                     AUX_HOST_INVERT);
> > -
> > -err_set_host_cap:
> > -     if (ret)
> > -             DRM_DEV_ERROR(mhdp->dev, "set host cap failed: %d\n",
> ret);
> > -     return ret;
> > -}
> > -EXPORT_SYMBOL(cdns_mhdp_set_host_cap);
> > -
> >  int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp)  {
> >       u8 msg[5];
> > @@ -698,3 +668,15 @@ int cdns_mhdp_config_video(struct
> cdns_mhdp_device *mhdp)
> >       return ret;
> >  }
> >  EXPORT_SYMBOL(cdns_mhdp_config_video);
> > +
> > +int cdns_phy_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32
> > +val) {
> > +     return cdns_mhdp_reg_write(mhdp, ADDR_PHY_AFE + (addr << 2),
> > +val); } EXPORT_SYMBOL(cdns_phy_reg_write);
> > +
> > +u32 cdns_phy_reg_read(struct cdns_mhdp_device *mhdp, u32 addr) {
> > +     return cdns_mhdp_reg_read(mhdp, ADDR_PHY_AFE + (addr << 2)); }
> > +EXPORT_SYMBOL(cdns_phy_reg_read);
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
> > index 1f093a2deaa7..b122bf5f0bdf 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
> > @@ -20,4 +20,7 @@ int cdns_mhdp_reg_write(struct cdns_mhdp_device
> > *mhdp, u32 addr, u32 val);  int cdns_mhdp_reg_write_bit(struct
> cdns_mhdp_device *mhdp, u16 addr,
> >                                  u8 start_bit, u8 bits_no, u32 val);
> >
> > +/* Audio */
> > +int cdns_mhdp_register_audio_driver(struct device *dev); void
> > +cdns_mhdp_unregister_audio_driver(struct device *dev);
> >  #endif
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
> > index c8160f321aca..8fea072a5568 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
> > @@ -108,7 +108,9 @@ static int cdns_mhdp_training_start(struct
> cdns_mhdp_device *mhdp)
> >               if (ret)
> >                       goto err_training_start;
> >
> > -             if (event[1] & EQ_PHASE_FINISHED)
> > +             if (event[1] & CLK_RECOVERY_FAILED)
> > +                     DRM_DEV_ERROR(mhdp->dev, "clock recovery
> failed\n");
> > +             else if (event[1] & EQ_PHASE_FINISHED)
> >                       return 0;
> >       }
> >
> > @@ -172,3 +174,33 @@ int cdns_mhdp_train_link(struct
> cdns_mhdp_device *mhdp)
> >       return ret;
> >  }
> >  EXPORT_SYMBOL(cdns_mhdp_train_link);
> > +
> > +int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp) {
> > +     u8 msg[8];
> > +     int ret;
> > +
> > +     msg[0] = drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
> > +     msg[1] = mhdp->dp.num_lanes | SCRAMBLER_EN;
> > +     msg[2] = VOLTAGE_LEVEL_2;
> > +     msg[3] = PRE_EMPHASIS_LEVEL_3;
> > +     msg[4] = PTS1 | PTS2 | PTS3 | PTS4;
> > +     msg[5] = FAST_LT_NOT_SUPPORT;
> > +     msg[6] = mhdp->lane_mapping;
> > +     msg[7] = ENHANCED;
> > +
> > +     ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > +                                  DPTX_SET_HOST_CAPABILITIES,
> > +                                  sizeof(msg), msg);
> > +     if (ret)
> > +             goto err_set_host_cap;
> > +
> > +     ret = cdns_mhdp_reg_write(mhdp,
> DP_AUX_SWAP_INVERSION_CONTROL,
> > +                                     AUX_HOST_INVERT);
> > +
> > +err_set_host_cap:
> > +     if (ret)
> > +             DRM_DEV_ERROR(mhdp->dev, "set host cap failed: %d\n",
> ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(cdns_mhdp_set_host_cap);
> > diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > index 06fd82b217b6..d94d22650899 100644
> > --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > @@ -423,7 +423,12 @@ static int cdn_dp_enable_phy(struct
> cdn_dp_device *dp, struct cdn_dp_port *port)
> >       }
> >
> >       port->lanes = cdn_dp_get_port_lanes(port);
> > -     ret = cdns_mhdp_set_host_cap(&dp->mhdp, property.intval);
> > +
> > +     if (property.intval)
> > +             dp->mhdp.lane_mapping = LANE_MAPPING_FLIPPED;
> > +     else
> > +             dp->mhdp.lane_mapping = LANE_MAPPING_NORMAL;
> > +     ret = cdns_mhdp_set_host_cap(&dp->mhdp);
> >       if (ret) {
> >               DRM_DEV_ERROR(dev, "set host capabilities failed: %d\n",
> >                             ret);
> > diff --git a/include/drm/bridge/cdns-mhdp.h
> > b/include/drm/bridge/cdns-mhdp.h index c8170e6048f7..6ffb97e17fae
> > 100644
> > --- a/include/drm/bridge/cdns-mhdp.h
> > +++ b/include/drm/bridge/cdns-mhdp.h
> > @@ -14,6 +14,7 @@
> >
> >  #define ADDR_IMEM            0x10000
> >  #define ADDR_DMEM            0x20000
> > +#define ADDR_PHY_AFE 0x80000
> >
> >  /* APB CFG addr */
> >  #define APB_CTRL                     0
> > @@ -81,6 +82,10 @@
> >  #define SOURCE_PIF_SW_RESET          0x30834
> >
> >  /* bellow registers need access by mailbox */
> > +
> > +/* source phy comp */
> > +#define LANES_CONFIG                 0x0814
> > +
> >  /* source car addr */
> >  #define SOURCE_HDTX_CAR                      0x0900
> >  #define SOURCE_DPTX_CAR                      0x0904
> > @@ -424,6 +429,16 @@
> >  /* Reference cycles when using lane clock as reference */
> >  #define LANE_REF_CYC                         0x8000
> >
> > +#define HOTPLUG_DEBOUNCE_MS          200
> > +
> > +#define IRQ_IN    0
> > +#define IRQ_OUT   1
> > +#define IRQ_NUM   2
> > +
> > +#define cdns_mhdp_plat_call(mhdp, operation)                 \
> > +     (!(mhdp) ? -ENODEV : (((mhdp)->plat_data &&
> (mhdp)->plat_data->operation) ?     \
> > +      (mhdp)->plat_data->operation(mhdp) : ENOIOCTLCMD))
> > +
> >  enum voltage_swing_level {
> >       VOLTAGE_LEVEL_0,
> >       VOLTAGE_LEVEL_1,
> > @@ -504,9 +519,29 @@ struct cdns_mhdp_connector {
> >       struct cdns_mhdp_bridge *bridge;  };
> >
> > +struct cdns_plat_data {
> > +     /* Vendor PHY support */
> > +     int (*bind)(struct platform_device *pdev,
> > +                     struct drm_encoder *encoder,
> > +                     struct cdns_mhdp_device *mhdp);
> > +     void (*unbind)(struct device *dev);
> > +
> > +     int (*phy_set)(struct cdns_mhdp_device *mhdp);
> > +     bool (*phy_video_valid)(struct cdns_mhdp_device *mhdp);
> > +     int (*firmware_init)(struct cdns_mhdp_device *mhdp);
> > +     void (*pclk_rate)(struct cdns_mhdp_device *mhdp);
> > +
> > +     int (*power_on)(struct cdns_mhdp_device *mhdp);
> > +     int (*power_off)(struct cdns_mhdp_device *mhdp);
> > +
> > +     char *plat_name;
> > +     int lane_mapping;
> > +};
> > +
> >  struct cdns_mhdp_device {
> >       struct device *dev;
> >       struct cdns_mhdp_connector connector;
> > +     struct cdns_mhdp_bridge bridge;
> >
> >       void __iomem *regs_base;
> >       struct reset_control *spdif_rst; @@ -520,6 +555,11 @@ struct
> > cdns_mhdp_device {
> >
> >       unsigned int fw_version;
> >
> > +     struct delayed_work hotplug_work;
> > +     u32 lane_mapping;
> > +     bool power_up;
> > +     struct mutex lock;
> > +     int irq[IRQ_NUM];
> >       union {
> >               struct _dp_data {
> >                       u32 rate;
> > @@ -528,6 +568,8 @@ struct cdns_mhdp_device {
> >                       u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >               } dp;
> >       };
> > +     const struct cdns_plat_data *plat_data;
> > +
> >  };
> >
> >  void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp); @@
> -535,7
> > +577,7 @@ void cdns_mhdp_set_fw_clk(struct cdns_mhdp_device *mhdp,
> > unsigned long clk);  int cdns_mhdp_load_firmware(struct
> cdns_mhdp_device *mhdp, const u32 *i_mem,
> >                           u32 i_size, const u32 *d_mem, u32 d_size);
> > int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool
> > enable); -int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp,
> > bool flip);
> > +int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp);
> >  int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp);
> >  u32 cdns_mhdp_get_event(struct cdns_mhdp_device *mhdp);  int
> > cdns_mhdp_read_hpd(struct cdns_mhdp_device *mhdp); @@ -547,10
> +589,18
> > @@ int cdns_mhdp_get_edid_block(void *mhdp, u8 *edid,  int
> > cdns_mhdp_train_link(struct cdns_mhdp_device *mhdp);  int
> > cdns_mhdp_set_video_status(struct cdns_mhdp_device *mhdp, int active);
> > int cdns_mhdp_config_video(struct cdns_mhdp_device *mhdp);
> > +bool cdns_mhdp_check_alive(struct cdns_mhdp_device *mhdp);
> >  int cdns_mhdp_audio_stop(struct cdns_mhdp_device *mhdp,
> >                        struct audio_info *audio);  int
> > cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable);
> int
> > cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
> >                          struct audio_info *audio);
> >
> > +int cdns_phy_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32
> > +val);
> > +u32 cdns_phy_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
> > +
> > +/* DP  */
> > +int cdns_dp_bind(struct platform_device *pdev, struct drm_encoder
> *encoder,
> > +             struct cdns_mhdp_device *mhdp); void
> > +cdns_dp_unbind(struct device *dev);
> >  #endif /* CDNS_MHDP_H_ */
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
