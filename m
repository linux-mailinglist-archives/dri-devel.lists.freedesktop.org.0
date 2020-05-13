Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378E1D463D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35F46EBD7;
	Fri, 15 May 2020 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400100.outbound.protection.outlook.com [40.107.140.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2285C6E162
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:47:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ/NR769RUfPEr7JKpUSA2bg5UWFZ7VKuCFJPqDCzYxGXtZIMs+KZgEOPg9VwOLrGXQqc9jH7+qdSnocVnr1CpzmzzzmKVrJSll+rtq+KORVQSGvusMwgxtqj9LckQ5PrqLBtSkPcOCDAJBnm+7uM3MtAcH6fOuAJks7/uKmkrdPNswmbccQqTrvupV7Hkc0Qw0rHqxqDQWfzb64rfzaozQoRq4PrOQOdoPyugZ30nMIQBSjxQt1x7BRMyOZinRRJmE6lgK/T7WN6WAmZTHnxwJ4n/+r71C1lTBin0dGGghm9IxvFWevMLqYEJcZZ1xTXOLmBZ7f1J3azz+ytwL4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jecCoVCmHsJmr8yYD5kGGIVyaDXx4yMOEzcI8M+1e2M=;
 b=Gyj0P6WV27ywRnFRnltlsOCUiyT3FlqyImB1pNXPqD48hmSbY4Ndbr5MW5mY3DFlcI9B0SYgy1gZJnGDB5vy10kpcve12AWSSfXiTi1D3ChWGWPEvEH/gwU6olXoEtI7vDW68x3TVXnWuDgcBv9BQ9nJGgRtXTnbe6zYDn2r0rI5AvYygmQ1XpNEMNhTZ9wqa9Cqm+f1Ry1/5I4zfZV7OwN8VbqTBKTdsOqa9aAY73on1Q02m+UzJmpeTTykSxXV5HcqS1vetaxMVf45bb+Rod7olHCEkuj0P2o8MVQhB4P5N52FDmztljhiTRHDqjli5RD1Gwm4ukncC1c9GtuD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jecCoVCmHsJmr8yYD5kGGIVyaDXx4yMOEzcI8M+1e2M=;
 b=IPvwRhlVguj/sidRhOrUBl3fC18MC/wZ8ofXjEeGk34//xNB27MplZkLzJD0tN5lwe6XtYWp+3oplAoD7Qxidt5qBBkNkGVYvlfQwxJKvkcJc//Rbdc08dA3xyE6mlzvdWMixSf8bG6rluUbwqdz8ARED0QiY4Ncq+QYWlDSP7o=
Received: from OSAPR01MB2914.jpnprd01.prod.outlook.com (52.134.247.13) by
 OSAPR01MB3700.jpnprd01.prod.outlook.com (20.178.101.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Wed, 13 May 2020 10:47:36 +0000
Received: from OSAPR01MB2914.jpnprd01.prod.outlook.com
 ([fe80::c4a6:b6af:b928:e31f]) by OSAPR01MB2914.jpnprd01.prod.outlook.com
 ([fe80::c4a6:b6af:b928:e31f%3]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 10:47:36 +0000
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 1/3] drm/db9000: Add Digital Blocks DB9000 LCD Controller
Thread-Topic: [PATCH 1/3] drm/db9000: Add Digital Blocks DB9000 LCD Controller
Thread-Index: AQHWHGz7z+82HiGUfk6EsDwG4gHLEqiO2g6AgAABbgCAASxjAA==
Date: Wed, 13 May 2020 10:47:36 +0000
Message-ID: <OSAPR01MB2914F12D86987A92B4FBDDA2DFBF0@OSAPR01MB2914.jpnprd01.prod.outlook.com>
References: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
 <1587975709-2092-2-git-send-email-gareth.williams.jx@renesas.com>
 <20200428181845.GD27234@ravnborg.org>
 <CAKMK7uHGJ5dM2k5jmfq5fJDe1x2E_F+xeKuY8Gd6eNC+V1X9OQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHGJ5dM2k5jmfq5fJDe1x2E_F+xeKuY8Gd6eNC+V1X9OQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 36f3a12c-69f5-45c7-16b9-08d7f72b0c94
x-ms-traffictypediagnostic: OSAPR01MB3700:|OSAPR01MB3700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3700153A09201D5AC354173CDFBF0@OSAPR01MB3700.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z6XAdrxeTjoP5P9k6h+fiR11D1VBR0ZV0ZWtRuqnbfVNHy7RWM7Ky0ZAkBo94z7yfA92itZROnYQM95Czw3TEtjAnsShtF2cPtmFhA54780Ce7buvn9DWCxXC2ue+YjhAcFRQwmVHcK2dXzWlQWjNa45mZvqnDWhsgvKbUXWeZ6figTlDXARndYWYAxmWKegUjxdeunSQpfoU9C85O8kgc2rIoinuNh3OiIAwI/o+I1XkFbhTO5lASKP/8djsnJ6B0JMwhP76Iwyx0CA/2fe/RemtSIzsv54jhW7Ym3mIUNs1XL6bs6SL6lUdqh5FhxW4oHmNxHsB/EKDQNxueBO2AGJDkSt0rkjRUkrWgCT7r7KOymCOxQjU4IXH7K/6UvEBPnq5qIyt7FENoCZtdTFfos/YyO0ou3HLDWp32Gva82d0oUAwlcySD3bz9m1o53yuPNBQbZ2fU0PdEv6TAPxKv3X5v6iNLY0zPSUwL1NXMDqPO4fpHbkOpcQjPYJg2+kT7WHLYhIx69UQhAunFraYKlGEPvXRDSB2ZbWyPzy473GH8L+WbBU3iSKxzEsU5t+cgIec+tI3sE71VXb1CEiZdsAskGvn9wjLEz0E6j6QTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(33430700001)(33440700001)(110136005)(54906003)(8676002)(9686003)(316002)(66946007)(83080400001)(66446008)(64756008)(6506007)(53546011)(7696005)(33656002)(86362001)(66556008)(8936002)(66476007)(76116006)(26005)(52536014)(4326008)(55016002)(478600001)(2906002)(30864003)(966005)(186003)(71200400001)(5660300002)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yTncEUJLlnGAf8iaKUgMep1Bmo7/JB7v7GimODoQIFxLyrcvh3OO8y89YZ0qTcKvHI9Rpf5X69JLtiwbYsm7v7wsv174D2vRVzpS89mGU7SndtGUXmJMGO46nTydliMcSUGoy7kNgo4pP1wnIgSGANETPxYYfehVUddK9AjRmzcH9zJr/zmmeVqZCoNXBC5k4/OtjoBipkqc1Lr2Q/ybE7RFVY8KtmHyQcalxole5c9S0Nxfad74nR4StXi/a+yVrXX9m5cV0wNXjX4vgN6+xRCtQTlx1qT60ruTCHmJCkouERSd9dHv2Ku1Wk3YeEHPxds9shuEk9lwhpa1ax8wWBCedRmDEqWSZ2yCM9xX/9bXoteCZlcuwOZKOX5iiuNCrmjGaky9XpdmMDiemxoB3dafLUelnuAoBjnimX8l4Us1Qt5RPzpOUYoo3/VzYhnvKGeNKozeDuL3RCaNiWuaqsjTCXIRi2Z0feEM43zj43OxNrVvKIwJUQq8k0p+ytHp
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f3a12c-69f5-45c7-16b9-08d7f72b0c94
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 10:47:36.1441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3IaDJPRLpKf3AsUypWI9IyFRLJ6wVQBdSqhQ8gLyDLv44TWTb1bxh9ytzHE9yNkGcAwtk4VfMjMWtI2ez06/AY9HR7/UGlPRY/eucHckKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3700
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam/Daniel,

This is all very useful feedback, thank you. 

On Tue, Apr 28, 2020 at 19:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> On Tue, Apr 28, 2020 at 8:18 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Gareth.
> >
> > On Mon, Apr 27, 2020 at 09:21:47AM +0100, Gareth Williams wrote:
> > > Add DRM support for the Digital Blocks DB9000 LCD Controller with
> > > the Renesas RZ/N1 specific changes.
> > >
> > > Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> > > ---
> > >  drivers/gpu/drm/Kconfig                    |   2 +
> > >  drivers/gpu/drm/Makefile                   |   1 +
> > >  drivers/gpu/drm/digital-blocks/Kconfig     |  13 +
> > >  drivers/gpu/drm/digital-blocks/Makefile    |   3 +
> > >  drivers/gpu/drm/digital-blocks/db9000-du.c | 953
> > > +++++++++++++++++++++++++++++
> > > drivers/gpu/drm/digital-blocks/db9000-du.h | 192 ++++++
> > >  6 files changed, 1164 insertions(+)  create mode 100644
> > > drivers/gpu/drm/digital-blocks/Kconfig
> > >  create mode 100644 drivers/gpu/drm/digital-blocks/Makefile
> > >  create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.c
> > >  create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.h
> >
> > The general impression is a well written driver.
> > It looks like it was wrtten some tiem ago and thus fail to take full
> > benefit from the improvements impemented the last year or so.
> >
> > The driver has a size so it is a candidate to belong in the tiny/
> > directory.
> > If you do not see any other DRM drivers for digital-blocks or that
> > this driver should be extended, then please consider a move to tiny/
> >
> > If you do so embed the header file in the .c file so it is a single
> > file driver.
That's okay with me, I'll merge the two files and move it to tinydrm.

> >
> > Other general comments:
> > The driver looks like a one plane - one crtc - one encoder driver.
> > Please use drm_simple - or explain why you cannot use drm_simple.
I'll take a look at this in more detail. I've tested with drm_simple and
it is feasible. Thanks for the direction.

> >
> > For the encoder use drm_simple_encoder_init
> >
> > A small intro to the driver would be good.
> > For example that is includes a pwm etc.
I'll add an introduction to the commit message and cover letter.

> 
> One more since I just landed my series: Please use devm_drm_dev_alloc.
> There's a ton of examples now in-tree.
> -Daniel
Thanks Daniel, I might have missed that otherwise.

> 
> >
> > I provided a mix of diverse comments in the following.
> >
> > Looks forward for the next revision!
> >
> >         Sam
> > >
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig index
> > > 3c88420..159832d 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -280,6 +280,8 @@ source "drivers/gpu/drm/mgag200/Kconfig"
> > >
> > >  source "drivers/gpu/drm/cirrus/Kconfig"
> > >
> > > +source "drivers/gpu/drm/digital-blocks/Kconfig"
> > > +
> > >  source "drivers/gpu/drm/armada/Kconfig"
> > >
> > >  source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 9f0d2ee..f525807 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -72,6 +72,7 @@ obj-$(CONFIG_DRM_MGAG200) += mgag200/
> > >  obj-$(CONFIG_DRM_V3D)  += v3d/
> > >  obj-$(CONFIG_DRM_VC4)  += vc4/
> > >  obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus/
> > > +obj-$(CONFIG_DRM_DB9000) += digital-blocks/
> > >  obj-$(CONFIG_DRM_SIS)   += sis/
> > >  obj-$(CONFIG_DRM_SAVAGE)+= savage/
> > >  obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
> > > diff --git a/drivers/gpu/drm/digital-blocks/Kconfig
> > > b/drivers/gpu/drm/digital-blocks/Kconfig
> > > new file mode 100644
> > > index 0000000..436a7c0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/digital-blocks/Kconfig
> > > @@ -0,0 +1,13 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +config DRM_DB9000
> > > +     bool "DRM Support for DB9000 LCD Controller"
> > > +     depends on DRM && (ARCH_MULTIPLATFORM || COMPILE_TEST)
> > > +     select DRM_KMS_HELPER
> > > +     select DRM_GEM_CMA_HELPER
> > > +     select DRM_KMS_CMA_HELPER
> > > +     select DRM_PANEL_BRIDGE
> > > +     select VIDEOMODE_HELPERS
> > > +     select FB_PROVIDE_GET_FB_UNMAPPED_AREA if FB
> > > +
> > > +     help
> > > +       Enable DRM support for the DB9000 LCD controller.
> > > diff --git a/drivers/gpu/drm/digital-blocks/Makefile
> > > b/drivers/gpu/drm/digital-blocks/Makefile
> > > new file mode 100644
> > > index 0000000..9f78492
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/digital-blocks/Makefile
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +obj-$(CONFIG_DRM_DB9000) += db9000-du.o
> > > diff --git a/drivers/gpu/drm/digital-blocks/db9000-du.c
> > > b/drivers/gpu/drm/digital-blocks/db9000-du.c
> > > new file mode 100644
> > > index 0000000..d84d446
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/digital-blocks/db9000-du.c
> > > @@ -0,0 +1,953 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/* Copyright (C) 2019 Renesas Electronics Europe Ltd.
> > 2020?
I'll correct this in the next version, thanks.

> >
> > > + *
> > > + * Author: Gareth Williams <gareth.williams.jx@renesas.com>
> > > + *
> > > + * Based on ltdc.c
> > > + * Copyright (C) STMicroelectronics SA 2017
> > > + *
> > > + * Authors: Philippe Cornu <philippe.cornu@st.com>
> > > + *          Yannick Fertre <yannick.fertre@st.com>
> > > + *          Fabien Dessenne <fabien.dessenne@st.com>
> > > + *          Mickael Reulier <mickael.reulier@st.com>
> > > + */
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h> #include <drm/drm_of.h>
> > > +#include <drm/drm_panel.h> #include <drm/drm_plane_helper.h>
> > > +#include <drm/drm_probe_helper.h> #include <drm/drm_vblank.h>
> > > +#include <drm/drm_drv.h>
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pwm.h>
> > > +#include <linux/reset.h>
> > > +
> > > +#include <video/display_timing.h>
> > > +#include <video/videomode.h>
> > > +
> > > +#include "db9000-du.h"
> > > +
> > > +#define NR_CRTC              1
> > > +#define DB9000_FB_MAX_WIDTH  4095
> > > +#define DB9000_FB_MAX_HEIGHT 4095
> > > +#define RZN1_REGS            ((void *) 1)
> > > +
> > > +static const u32 db9000_fmts[] = {
> > > +     DRM_FORMAT_RGB888,
> > > +     DRM_FORMAT_RGB565,
> > > +     DRM_FORMAT_XRGB1555,
> > > +     DRM_FORMAT_XRGB8888,
> > > +     DRM_FORMAT_BGR888,
> > > +     DRM_FORMAT_BGR565,
> > > +     DRM_FORMAT_XBGR1555,
> > > +     DRM_FORMAT_XBGR8888
> > > +};
> > > +
> > > +static u32 reg_read(void __iomem *base, u32 reg) {
> > > +     return readl(base + reg);
> > > +}
> > > +
> > > +static void reg_write(void __iomem *base, u32 reg, u32 val) {
> > > +     writel(val, base + reg);
> > > +}
> > Thiese helpers do not really add any value.
> > Consider using db9000_device* as first argument, so you do not need to
> > do a "->regs" for every use.
> > Or drop them.
I'll change the first argument as that might help readability as well.

> >
> > db9000_device is so much more than a device.
> > Why not just name it struct db9000, and then use db9000 as the
> > preferred variable name?
> > Just a personal preference, feel free to ignore.
I think this is a good observation. The struct expanded in purpose
over time, I will adjust the name. 

> >
> >
> > > +
> > > +static struct db9000_device *crtc_to_db9000(struct drm_crtc *crtc)
> > > +{
> > > +     return container_of(crtc->dev, struct db9000_device, drm); }
> > > +
> > > +static struct db9000_device *plane_to_db9000(struct drm_plane
> > > +*plane) {
> > > +     return container_of(plane->dev, struct db9000_device, drm); }
> > > +
> > > +static struct db9000_device *pwm_chip_to_db9000(struct pwm_chip
> > > +*chip) {
> > > +     return container_of(chip, struct db9000_device, pwm); }
> > > +
> > > +void db9000_bpp_setup(struct db9000_device *db9000_dev, int bpp,
> int bus_width,
> > > +                   bool pixelSelect)
> >
> > The linux kernel style is small caps and underscore like this:
> > pixel_select
I'll correct this in the next version, thanks.

> >
> > > +{
> > > +     u32 format;
> > > +     u32 reg_cr1 = reg_read(db9000_dev->regs, DB9000_CR1);
> > > +
> > > +     /* reset the BPP bits */
> > > +     reg_cr1 &= ~DB9000_CR1_BPP(7);
> > > +     reg_cr1 &= ~DB9000_CR1_OPS(5);
> > > +     reg_cr1 &= ~DB9000_CR1_OPS(1);
> > > +     db9000_dev->bpp = bpp;
> > > +
> > > +     switch (bpp) {
> > > +     case 16:
> > > +             if (pixelSelect) {
> > > +                     reg_cr1 |= DB9000_CR1_OPS(5);
> > > +                     reg_cr1 |= DB9000_CR1_OPS(1);
> > > +             }
> > > +
> > > +             format = DB9000_CR1_BPP(DB9000_CR1_BPP_16bpp);
> > > +             break;
> > > +     case 24:
> > > +     case 32:
> > > +     default:
> > > +             format = DB9000_CR1_BPP(DB9000_CR1_BPP_24bpp);
> > > +     }
> > > +
> > > +     if (bpp <= 16 && bus_width == 24)
> > > +             reg_cr1 |= DB9000_CR1_OPS(2);
> > > +     else
> > > +             reg_cr1 &= ~DB9000_CR1_OPS(2);
> > > +
> > > +     if (bpp == 24)
> > > +             reg_cr1 |= DB9000_CR1_FBP;
> > > +     else
> > > +             reg_cr1 &= ~DB9000_CR1_FBP;
> > > +
> > > +     reg_cr1 |= format;
> > > +     reg_write(db9000_dev->regs, DB9000_CR1, reg_cr1); }
> > > +
> > > +void db9000_toggle_controller(struct db9000_device *db9000_dev,
> > > +bool on)
> >
> > USe two helpers here:
> > db9000_controller_on()
> > db9000_controller_off()
> >
> > More descriptive than the bool flag.
I'll implement this as two helpers.

> >
> > > +{
> > > +     u32 isr;
> > > +     u32 reg_cr1 = reg_read(db9000_dev->regs, DB9000_CR1);
> > > +     unsigned long flags;
> > > +
> > > +     if (on) {
> > > +             /* Enable controller */
> > > +             reg_cr1 |= DB9000_CR1_LCE;
> > > +             reg_cr1 |= DB9000_CR1_LPE;
> > > +
> > > +             /* DMA Burst Size */
> > > +             reg_cr1 |= DB9000_CR1_FDW(2);
> > > +
> > > +             /* Release pixel clock domain reset */
> > > +             reg_write(db9000_dev->regs, DB9000_PCTR,
> > > + DB9000_PCTR_PCR);
> > > +
> > > +             /* Enable BAU event for IRQ */
> > > +             spin_lock_irqsave(&db9000_dev->lock, flags);
> > > +             isr = reg_read(db9000_dev->regs, DB9000_ISR);
> > > +             reg_write(db9000_dev->regs, DB9000_ISR, isr |
> DB9000_ISR_BAU);
> > > +             reg_write(db9000_dev->regs, DB9000_IMR,
> DB9000_IMR_BAUM);
> > > +             spin_unlock_irqrestore(&db9000_dev->lock, flags);
> > > +
> > > +     } else {
> > > +             /* Disable controller */
> > > +             reg_cr1 &= ~DB9000_CR1_LCE;
> > > +             reg_cr1 &= ~DB9000_CR1_LPE;
> > > +     }
> > > +
> > > +     reg_write(db9000_dev->regs, DB9000_CR1, reg_cr1); }
> > > +
> > > +/* CRTC Functions */
> > > +static void db9000_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +                                   struct drm_crtc_state
> > > +*old_state) {
> > > +     struct db9000_device *db9000_dev = crtc_to_db9000(crtc);
> > > +     u32 imr;
> > > +
> > > +     /* Enable IRQ */
> > > +     imr = reg_read(db9000_dev->regs, DB9000_IMR);
> > > +     reg_write(db9000_dev->regs, DB9000_IMR, imr |
> > > +DB9000_IMR_BAUM); }
> > > +
> > > +static void db9000_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +                                    struct drm_crtc_state
> > > +*old_state) {
> > > +     struct db9000_device *db9000_dev = crtc_to_db9000(crtc);
> > > +     u32 imr;
> > > +
> > > +     /* disable IRQ */
> > > +     imr = reg_read(db9000_dev->regs, DB9000_IMR);
> > > +     reg_write(db9000_dev->regs, DB9000_IMR, imr &
> > > +~DB9000_IMR_BAUM); }
> > > +
> > > +static void db9000_crtc_mode_set_nofb(struct drm_crtc *crtc) {
> > > +     struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> > > +     struct db9000_device *db9000_dev = crtc_to_db9000(crtc);
> > > +     struct videomode vm;
> > > +     int bus_flags = db9000_dev->connector->display_info.bus_flags;
> > > +     u32 vtr1, vtr2, hvter, htr, hpplor, dear_offset;
> > > +     u32 reg_cr1 = reg_read(db9000_dev->regs, DB9000_CR1);
> > > +
> > > +     drm_display_mode_to_videomode(mode, &vm);
> > There is no need for this conversion, the timing can be fetched from
> > display_mode.
> > And this is the only use of videomode, so you can drop the select in
> > Kconfig too, and the include.
I have it working from the display mode, so I can include it in the next
patch version.

> >
> > > +
> > > +     if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> > > +             reg_cr1 |= DB9000_CR1_HSP;
> > > +     else
> > > +             reg_cr1 &= ~DB9000_CR1_HSP;
> > > +
> > > +     if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> > > +             reg_cr1 |= DB9000_CR1_VSP;
> > > +     else
> > > +             reg_cr1 &= ~DB9000_CR1_VSP;
> > > +
> > > +     if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> > > +             reg_cr1 |= DB9000_CR1_DEP;
> > > +     else
> > > +             reg_cr1 &= ~DB9000_CR1_DEP;
> > > +
> > > +     /* Horizontal Timing Register */
> > > +     htr =   DB9000_HTR_HSW(vm.hsync_len) |
> > > +             DB9000_HTR_HBP(vm.hback_porch) |
> > > +             /* Pixels per line */
> > > +             DB9000_HTR_HFP(vm.hfront_porch);
> > > +
> > > +     /* Horizontal Pixels-Per-Line Override */
> > > +     hpplor = vm.hactive | DB9000_HPOE;
> > > +
> > > +     /* Vertical timing registers setup */
> > > +     vtr1 =  DB9000_VTR1_VBP(vm.vback_porch) |
> > > +             DB9000_VTR1_VFP(vm.vfront_porch) |
> > > +             DB9000_VTR1_VSW(vm.vsync_len);
> > > +
> > > +     vtr2 = DB9000_VTR2_LPP(vm.vactive);
> > > +
> > > +     /* Vertical and Horizontal Timing Extension write */
> > > +     hvter = DB9000_HVTER_HFPE(vm.hfront_porch) |
> > > +             DB9000_HVTER_HBPE(vm.hback_porch) |
> > > +             DB9000_HVTER_VFPE(vm.vback_porch) |
> > > +             DB9000_HVTER_VBPE(vm.vfront_porch);
> > > +
> > > +     db9000_dev->frame_size = vm.hactive * vm.vactive;
> > > +
> > > +     /* DEAR register must be configured to the block end + 8 */
> > > +     dear_offset =
> > > +             (db9000_dev->frame_size * db9000_dev->bpp) / 8 + 8;
> > > +
> > > +     reg_write(db9000_dev->regs, DB9000_CR1, reg_cr1);
> > > +     reg_write(db9000_dev->regs, DB9000_HTR, htr);
> > > +     reg_write(db9000_dev->regs, DB9000_VTR1, vtr1);
> > > +     reg_write(db9000_dev->regs, DB9000_VTR2, vtr2);
> > > +     reg_write(db9000_dev->regs, DB9000_HPPLOR, hpplor);
> > > +     reg_write(db9000_dev->regs, DB9000_HVTER, hvter);
> > > +
> > > +     DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode-
> >name);
> > > +     DRM_DEBUG_DRIVER("Video mode: %dx%d", vm.hactive,
> vm.vactive);
> > > +     DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl
> %d\n",
> > > +                      vm.hfront_porch, vm.hback_porch, vm.hsync_len,
> > > +                      vm.vfront_porch, vm.vback_porch,
> > > + vm.vsync_len);
> > As a general comment:
> > use drm_dbg(db9000->drm, "foo") and not the deprecated
> DRM_DEBUG_DRIVER.
Okay, I will correct this.

> >
> > > +}
> > > +
> > > +static void db9000_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +                                  struct drm_crtc_state
> > > +*old_crtc_state) {
> > > +     struct drm_pending_vblank_event *event = crtc->state->event;
> > > +
> > > +     if (event) {
> > > +             crtc->state->event = NULL;
> > > +
> > > +             spin_lock_irq(&crtc->dev->event_lock);
> > > +             drm_crtc_send_vblank_event(crtc, event);
> > > +             spin_unlock_irq(&crtc->dev->event_lock);
> > > +     }
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs db9000_crtc_helper_funcs = {
> > > +     .mode_set_nofb = db9000_crtc_mode_set_nofb,
> > > +     .atomic_flush = db9000_crtc_atomic_flush,
> > > +     .atomic_enable = db9000_crtc_atomic_enable,
> > > +     .atomic_disable = db9000_crtc_atomic_disable, };
> > > +
> > > +static const struct drm_crtc_funcs db9000_crtc_funcs = {
> > > +     .destroy = drm_crtc_cleanup,
> > > +     .set_config = drm_atomic_helper_set_config,
> > > +     .page_flip = drm_atomic_helper_page_flip,
> > > +     .reset = drm_atomic_helper_crtc_reset,
> > > +     .atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> > > +     .atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> > > +     .gamma_set = drm_atomic_helper_legacy_gamma_set,
> > > +};
> > > + 
> > > +/*
> > > + * DRM_PLANE
> > > + */
> > > +static void db9000_plane_atomic_update(struct drm_plane *plane,
> > > +                                    struct drm_plane_state
> > > +*oldstate) {
> > > +     struct db9000_device *db9000_dev = plane_to_db9000(plane);
> > > +     struct drm_plane_state *state = plane->state;
> > > +     struct drm_framebuffer *fb = state->fb;
> > > +     unsigned long flags;
> > > +     u32 isr, paddr, dear_offset;
> > > +     u32 format;
> > > +
> > > +     if (!state->crtc || !fb) {
> > > +             DRM_DEBUG_DRIVER("fb or crtc NULL\n");
> > > +             return;
> > > +     }
> > > +
> > > +     format = fb->format->format;
> > > +
> > > +     /* The single plane is turning visible, so turn on the display */
> > > +     if (!oldstate->visible && state->visible)
> > > +             db9000_toggle_controller(db9000_dev, false);
> > > +
> > > +     /* The plane is no longer visible */
> > > +     if (oldstate->visible && !state->visible)
> > > +             db9000_toggle_controller(db9000_dev, true);
> > > +
> > > +     /* Check for format changes */
> > > +     if (format == DRM_FORMAT_RGB565 || format ==
> DRM_FORMAT_BGR565)
> > > +             db9000_bpp_setup(db9000_dev, 16, db9000_dev->bus_width,
> false);
> > > +     else if (format == DRM_FORMAT_XRGB1555 || format ==
> DRM_FORMAT_XBGR1555)
> > > +             db9000_bpp_setup(db9000_dev, 16, db9000_dev->bus_width,
> true);
> > > +     else if (format == DRM_FORMAT_RGB888 || format ==
> DRM_FORMAT_BGR888)
> > > +             db9000_bpp_setup(db9000_dev, 24, db9000_dev->bus_width,
> false);
> > > +     else if (format == DRM_FORMAT_XRGB8888 || format ==
> DRM_FORMAT_XBGR8888)
> > > +             db9000_bpp_setup(db9000_dev, 32,
> > > + db9000_dev->bus_width, false);
> > > +
> > > +     dear_offset = (db9000_dev->frame_size * db9000_dev->bpp) / 8 +
> > > + 8;
> > > +
> > > +     /* The frame buffer has changed, so get the new FB address */
> > > +     if (oldstate->fb != state->fb || state->crtc->state->mode_changed) {
> > > +             paddr = (u32)drm_fb_cma_get_gem_addr(fb, state, 0);
> > > +
> > > +             DRM_DEBUG_DRIVER("fb: phys 0x%08x\n", paddr);
> > > +             reg_write(db9000_dev->regs, DB9000_DBAR, paddr);
> > > +             reg_write(db9000_dev->regs, DB9000_DEAR,
> > > +                       paddr + dear_offset);
> > > +     }
> > > +
> > > +     /* Enable BAU event */
> > > +     spin_lock_irqsave(&db9000_dev->lock, flags);
> > > +     isr = reg_read(db9000_dev->regs, DB9000_ISR);
> > > +     reg_write(db9000_dev->regs, DB9000_ISR, isr | DB9000_ISR_BAU);
> > > +     reg_write(db9000_dev->regs, DB9000_IMR, DB9000_IMR_BAUM);
> > > +     spin_unlock_irqrestore(&db9000_dev->lock, flags);
> > > +
> > > +     db9000_dev->plane_fpsi->counter++;
> > > +
> > > +     if (isr & DB9000_ISR_MBE) {
> > > +             if (isr & DB9000_ISR_OFU)
> > > +                     DRM_ERROR("Output FIFO Underrun\n");
> > > +
> > > +             if (isr & DB9000_ISR_OFO)
> > > +                     DRM_ERROR("Output FIFO Overrun\n");
> > > +
> > > +             if (isr & DB9000_ISR_IFU)
> > > +                     DRM_ERROR("Input FIFO Underrun\n");
> > > +
> > > +             if (isr & DB9000_ISR_IFO)
> > > +                     DRM_ERROR("Input FIFO Overrun\n");
> > > +     }
> > > +}
> > > +
> > > +static void db9000_plane_atomic_print_state(struct drm_printer *p,
> > > +                                         const struct
> > > +drm_plane_state *state) {
> > > +     struct drm_plane *plane = state->plane;
> > > +     struct db9000_device *db9000_dev = plane_to_db9000(plane);
> > > +     struct fps_info *fpsi = db9000_dev->plane_fpsi;
> > > +     int ms_since_last;
> > > +     ktime_t now;
> > > +
> > > +     now = ktime_get();
> > > +     ms_since_last = ktime_to_ms(ktime_sub(now,
> > > + fpsi->last_timestamp));
> > > +
> > > +     drm_printf(p, "\tuser_updates=%dfps\n",
> > > +                DIV_ROUND_CLOSEST(fpsi->counter * 1000,
> > > + ms_since_last));
> > > +
> > > +     fpsi->last_timestamp = now;
> > > +     fpsi->counter = 0;
> > > +}
> > > +
> > > +static const struct drm_plane_funcs db9000_plane_funcs = {
> > > +     .update_plane = drm_atomic_helper_update_plane,
> > > +     .disable_plane = drm_atomic_helper_disable_plane,
> > > +     .destroy = drm_plane_cleanup,
> > > +     .reset = drm_atomic_helper_plane_reset,
> > > +     .atomic_duplicate_state =
> drm_atomic_helper_plane_duplicate_state,
> > > +     .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > +     .atomic_print_state = db9000_plane_atomic_print_state, };
> > > +
> > > +static const struct drm_plane_helper_funcs
> db9000_plane_helper_funcs = {
> > > +     .atomic_update = db9000_plane_atomic_update, };
> > > +
> > > +static struct drm_plane *db9000_plane_create(struct drm_device
> *ddev,
> > > +                                          enum drm_plane_type type)
> > > +{
> > > +     struct device *dev = ddev->dev;
> > > +     struct drm_plane *plane;
> > > +     int ret;
> > > +
> > > +     plane = devm_kzalloc(dev, sizeof(*plane), GFP_KERNEL);
> > > +     if (!plane)
> > > +             return NULL;
> > > +
> > > +     ret = drm_universal_plane_init(ddev, plane, NR_CRTC,
> > > +                                    &db9000_plane_funcs,
> > > +                                    db9000_fmts,
> > > +                                    ARRAY_SIZE(db9000_fmts), NULL,
> > > +                                    type, "rzn1_primary_rgb");
> > > +     if (ret < 0)
> > > +             return NULL;
> > > +
> > > +     drm_plane_helper_add(plane, &db9000_plane_helper_funcs);
> > > +
> > > +     DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
> > > +
> > > +     return plane;
> > > +}
> > > +
> > > +static void db9000_plane_destroy_all(struct drm_device *ddev) {
> > > +     struct drm_plane *plane, *plane_temp;
> > > +
> > > +     list_for_each_entry_safe(plane, plane_temp,
> > > +                              &ddev->mode_config.plane_list, head)
> > > +                              drm_plane_cleanup(plane); }
> > > +
> > > +static int db9000_crtc_init(struct drm_device *ddev, struct
> > > +drm_crtc *crtc) {
> > > +     struct drm_plane *primary;
> > > +     int ret;
> > > +
> > > +     primary = db9000_plane_create(ddev,
> DRM_PLANE_TYPE_PRIMARY);
> > > +     if (!primary) {
> > > +             DRM_ERROR("Can not create primary plane\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> > > +                                     &db9000_crtc_funcs, NULL);
> > > +     if (ret) {
> > > +             DRM_ERROR("Can not initialize CRTC\n");
> > > +             goto cleanup;
> > > +     }
> > > +
> > > +     drm_crtc_helper_add(crtc, &db9000_crtc_helper_funcs);
> > > +     DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
> > > +     return 0;
> > > +
> > > +cleanup:
> > > +     db9000_plane_destroy_all(ddev);
> > > +     return ret;
> > > +}
> > > +
> > > +/*
> > > + * DRM_ENCODER
> > > + */
> > > +static const struct drm_encoder_funcs db9000_encoder_funcs = {
> > > +     .destroy = drm_encoder_cleanup, };
> > > +
> > > +static int db9000_encoder_init(struct drm_device *ddev,
> > > +                            struct drm_bridge *bridge) {
> > > +     struct drm_encoder *encoder;
> > > +     int ret;
> > > +
> > > +     encoder = devm_kzalloc(ddev->dev, sizeof(*encoder),
> GFP_KERNEL);
> > > +     if (!encoder)
> > > +             return -ENOMEM;
> > > +
> > > +     encoder->possible_crtcs = NR_CRTC;
> > > +     encoder->possible_clones = 0; /* No cloning support */
> > > +
> > > +     drm_encoder_init(ddev, encoder, &db9000_encoder_funcs,
> > > +                      DRM_MODE_ENCODER_NONE, NULL);
> > > +
> > > +     ret = drm_bridge_attach(encoder, bridge, NULL);
> > > +     if (ret) {
> > > +             drm_encoder_cleanup(encoder);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     DRM_DEBUG_DRIVER("Bridge encoder:%d created\n",
> > > + encoder->base.id);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +void __maybe_unused db9000_suspend(struct drm_device *ddev) {
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                 struct
> > > +db9000_device, drm);
> > > +
> > > +     clk_disable_unprepare(db9000_dev->lcd_eclk);
> > > +}
> > > +
> > > +int __maybe_unused db9000_resume(struct drm_device *ddev) {
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                 struct db9000_device, drm);
> > > +     int ret;
> > > +
> > > +     ret = clk_prepare_enable(db9000_dev->lcd_eclk);
> > > +     if (ret) {
> > > +             DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int db9000_pwm_request(struct pwm_chip *chip, struct
> > > +pwm_device *pwm) {
> > > +     return pm_runtime_get_sync(chip->dev); }
> > > +
> > > +static void db9000_pwm_free(struct pwm_chip *chip, struct
> > > +pwm_device *pwm) {
> > > +     pm_runtime_put(chip->dev);
> > > +}
> > > +
> > > +static int db9000_pwm_enable(struct db9000_device *db9000_dev) {
> > > +     u32 reg_pwmfr = reg_read(db9000_dev->regs,
> > > +db9000_dev->addr_pwmfr);
> > > +
> > > +     reg_pwmfr |= DB9000_PWMFR_PWMFCE;
> > > +     reg_write(db9000_dev->regs, db9000_dev->addr_pwmfr,
> > > + reg_pwmfr);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void db9000_pwm_disable(struct db9000_device *db9000_dev) {
> > > +     u32 reg_pwmfr = reg_read(db9000_dev->regs,
> > > +db9000_dev->addr_pwmfr);
> > > +
> > > +     reg_pwmfr &= ~DB9000_PWMFR_PWMFCE;
> > > +     reg_write(db9000_dev->regs, db9000_dev->addr_pwmfr,
> > > +reg_pwmfr); }
> > > +
> > > +static int db9000_pwm_apply(struct pwm_chip *chip, struct
> pwm_device *pwm,
> > > +                         struct pwm_state *state) {
> > > +     struct pwm_state cur_state;
> > > +     struct db9000_device *db9000_dev = pwm_chip_to_db9000(chip);
> > > +     int ret;
> > > +
> > > +     pwm_get_state(pwm, &cur_state);
> > > +
> > > +     if (state->enabled)
> > > +             ret = db9000_pwm_enable(db9000_dev);
> > > +     else
> > > +             db9000_pwm_disable(db9000_dev);
> > > +
> > > +     if (state->period != cur_state.period) {
> > > +             u32 pwmfcd;
> > > +
> > > +             pwmfcd = clk_get_rate(db9000_dev->lcd_eclk) / 256;
> > > +             pwmfcd *= state->period;
> > > +             pwmfcd = DB9000_PWMFR_PWMFCD(pwmfcd - 1);
> > > +             reg_write(db9000_dev->regs, db9000_dev->addr_pwmfr,
> pwmfcd);
> > > +     }
> > > +
> > > +     if (state->duty_cycle == 0) {
> > > +             db9000_pwm_disable(db9000_dev);
> > > +     } else if (state->period != cur_state.period ||
> > > +         state->duty_cycle != cur_state.duty_cycle) {
> > > +             u32 dcr = div_u64((state->duty_cycle * ULL(256)),
> > > +                                state->period) - 1;
> > > +
> > > +             reg_write(db9000_dev->regs, db9000_dev->addr_pwmdcr, dcr);
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static const struct pwm_ops db9000_pwm_ops = {
> > > +     .request = db9000_pwm_request,
> > > +     .free = db9000_pwm_free,
> > > +     .apply = db9000_pwm_apply,
> > > +     .owner = THIS_MODULE,
> > > +};
> > > +
> > > +static int db9000_pwm_setup(struct device *dev,
> > > +                         struct db9000_device *db9000_dev) {
> > > +     struct pwm_chip *db9000_pwm;
> > > +     int ret;
> > > +
> > > +     db9000_pwm = devm_kzalloc(dev, sizeof(*db9000_pwm),
> GFP_KERNEL);
> > > +     if (db9000_pwm == NULL)
> > > +             return -ENOMEM;
> > > +
> > > +     db9000_pwm = &db9000_dev->pwm;
> > > +
> > > +     db9000_pwm->dev = dev;
> > > +     db9000_pwm->ops = &db9000_pwm_ops;
> > > +     db9000_pwm->base = -1;
> > > +     db9000_pwm->npwm = 1;
> > > +
> > > +     ret = pwmchip_add(db9000_pwm);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "failed to register PWM chip: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     pm_runtime_enable(dev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +int db9000_load(struct drm_device *ddev, int rzn1_pwm) {
> > > +     struct platform_device *pdev = to_platform_device(ddev->dev);
> > > +     struct device *dev = ddev->dev;
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                 struct db9000_device, drm);
> > > +     struct device_node *np = dev->of_node;
> > > +     struct drm_bridge *bridge;
> > > +     struct drm_panel *panel;
> > > +     struct drm_crtc *crtc;
> > > +     struct reset_control *rstc;
> > > +     struct resource *res;
> > > +     int ret;
> > > +
> > > +     spin_lock_init(&db9000_dev->lock);
> > > +
> > > +     if (rzn1_pwm) {
> > > +             db9000_dev->addr_pwmfr = DB9000_PWMFR_RZN1;
> > > +             db9000_dev->addr_pwmdcr = DB9000_PWMDCR_RZN1;
> > > +     } else {
> > > +             db9000_dev->addr_pwmfr = DB9000_PWMFR_0;
> > > +             db9000_dev->addr_pwmdcr = DB9000_PWMDCR_0;
> > > +     }
> > > +
> > > +     /* Panel Setup */
> > > +     ret = drm_of_find_panel_or_bridge(np, 0, 0, &panel, &bridge);
> > > +     if (ret != 0) {
> > > +             DRM_ERROR("Could not get Panel or bridge");
> > > +             return ret;
> > > +     }
> > > +
> > > +     rstc = devm_reset_control_get_exclusive(dev, NULL);
> > > +
> > > +     /* Clock setup */
> > > +     db9000_dev->lcd_eclk = devm_clk_get(dev, "lcd_eclk");
> > > +
> > > +     if (IS_ERR(db9000_dev->lcd_eclk)) {
> > > +             DRM_ERROR("Unable to get pixel clock\n");
> > > +             return -ENODEV;
> > > +     }
> > > +
> > > +     if (clk_prepare_enable(db9000_dev->lcd_eclk)) {
> > > +             DRM_ERROR("Unable to prepare pixel clock\n");
> > > +             return -ENODEV;
> > > +     }
> > > +
> > > +     /* Memory setup */
> > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +     if (!res) {
> > > +             DRM_ERROR("Could not retrieve platform resources\n");
> > > +             ret = -EINVAL;
> > > +             goto err;
> > > +     }
> > > +
> > > +     db9000_dev->regs = devm_ioremap_resource(dev, res);
> > > +     if (IS_ERR(db9000_dev->regs)) {
> > > +             DRM_ERROR("Unable to get memory resource\n");
> > > +             ret = PTR_ERR(db9000_dev->regs);
> > > +             goto err;
> > > +     }
> > > +
> > > +     db9000_bpp_setup(db9000_dev, db9000_dev->bpp, db9000_dev-
> >bus_width,
> > > +                      false);
> > > +
> > > +     db9000_toggle_controller(db9000_dev, true);
> > > +
> > > +     /* Add endpoints panels or bridges if any */
> > > +     if (panel) {
> > > +             bridge = drm_panel_bridge_add(panel,
> > > +                                           DRM_MODE_CONNECTOR_Unknown);
> > > +             if (IS_ERR(bridge)) {
> > > +                     DRM_ERROR("panel-bridge endpoint\n");
> > > +                     ret = PTR_ERR(bridge);
> > > +                     goto err;
> > > +             }
> > > +     }
> > > +
> > > +     if (bridge) {
> > > +             ret = db9000_encoder_init(ddev, bridge);
> > > +             if (ret) {
> > > +                     DRM_ERROR("init encoder endpoint\n");
> > > +                     goto err;
> > > +             }
> > > +     }
> > > +
> > > +     db9000_dev->connector = panel->connector;
> > > +
> > > +     /* CRTC setup  */
> > > +     crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> > > +     if (!crtc) {
> > > +             DRM_ERROR("Failed to allocate crtc\n");
> > > +             ret = -ENOMEM;
> > > +             goto err;
> > > +     }
> > > +
> > > +     ret = db9000_crtc_init(&db9000_dev->drm, crtc);
> > > +     if (ret) {
> > > +             DRM_ERROR("Failed to init crtc\n");
> > > +             goto err;
> > > +     }
> > > +
> > > +     if (!IS_ERR(rstc)) {
> > > +             reset_control_assert(rstc);
> > > +             usleep_range(10, 20);
> > > +             reset_control_deassert(rstc);
> > > +     }
> > > +
> > > +     return db9000_pwm_setup(dev, db9000_dev);
> > > +
> > > +err:
> > > +     drm_panel_bridge_remove(bridge);
> > > +
> > > +     clk_disable_unprepare(db9000_dev->lcd_eclk);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +void db9000_unload(struct drm_device *ddev) {
> > > +     struct db9000_device *db9000_dev;
> > > +
> > > +     db9000_dev = container_of(ddev, struct db9000_device, drm);
> > > +
> > > +     drm_of_panel_bridge_remove(ddev->dev->of_node, 0, 0);
> > > +     clk_disable_unprepare(db9000_dev->lcd_eclk);
> > > +}
> > > +
> > > +static const struct drm_mode_config_funcs drv_mode_config_funcs = {
> > > +     .fb_create = drm_gem_fb_create,
> > > +     .atomic_check = drm_atomic_helper_check,
> > > +     .atomic_commit = drm_atomic_helper_commit, };
> > > +
> > > +static int db9000_gem_cma_dumb_create(struct drm_file *file,
> > > +                                   struct drm_device *dev,
> > > +                                   struct drm_mode_create_dumb
> > > +*args) {
> > > +     return drm_gem_cma_dumb_create_internal(file, dev, args); }
> > This wrapper seems like it can be dropped.
I agree, I will remove this.

> >
> > > +
> > > +DEFINE_DRM_GEM_CMA_FOPS(drv_driver_fops);
> > > +
> > > +static struct drm_driver drv_driver = {
> > > +     .driver_features = DRIVER_MODESET | DRIVER_GEM |
> DRIVER_PRIME |
> > > +                        DRIVER_ATOMIC,
> > > +     .name = "drm-db9000",
> > > +     .desc = "Digital Blocks DB9000 DRM Driver",
> > > +     .date = "20190825",
> > > +     .major = 1,
> > > +     .minor = 0,
> > > +     .patchlevel = 0,
> > > +     .fops = &drv_driver_fops,
> > > +     .dumb_create = db9000_gem_cma_dumb_create,
> > > +     .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > > +     .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > > +     .gem_free_object_unlocked = drm_gem_cma_free_object,
> > > +     .gem_vm_ops = &drm_gem_cma_vm_ops,
> > > +     .gem_prime_export = drm_gem_prime_export,
> > > +     .gem_prime_import = drm_gem_prime_import,
> > > +     .gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> > > +     .gem_prime_import_sg_table =
> drm_gem_cma_prime_import_sg_table,
> > > +     .gem_prime_vmap = drm_gem_cma_prime_vmap,
> > > +     .gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> > > +     .gem_prime_mmap = drm_gem_cma_prime_mmap, };
> > I think if you look up these operations, then you have assinged the
> > default operations in mayny cases.
> > Please see if you can trim the list.
> >
> > Also double check that no legacy operatiosn are used.
I'll simplify this as much as possible.

> >
> > > +
> > > +static int drv_load(struct drm_device *ddev, u32 bpp,
> > > +                 u32 bus_width, int rzn1_pwm) {
> > > +     struct platform_device *pdev = to_platform_device(ddev->dev);
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                 struct db9000_device, drm);
> > > +     int ret;
> > > +
> > > +     drm_mode_config_init(ddev);
> > > +
> > > +     /*
> > > +      * set max width and height as default value.
> > > +      * this value would be used to check framebuffer size limitation
> > > +      * at drm_mode_addfb().
> > > +      */
> > > +     ddev->mode_config.min_width = 0;
> > > +     ddev->mode_config.min_height = 0;
> > > +     ddev->mode_config.max_width = DB9000_FB_MAX_WIDTH;
> > > +     ddev->mode_config.max_height = DB9000_FB_MAX_WIDTH;
> > > +     ddev->mode_config.funcs = &drv_mode_config_funcs;
> > > +
> > > +     db9000_dev->bus_width = bus_width;
> > > +
> > > +     ret = db9000_load(ddev, rzn1_pwm);
> > > +
> > > +     if (ret)
> > > +             goto err;
> > > +
> > > +     drm_mode_config_reset(ddev);
> > > +
> > > +     drm_kms_helper_poll_init(ddev);
> > > +
> > > +     platform_set_drvdata(pdev, ddev);
> > > +
> > > +     return 0;
> > > +
> > > +err:
> > > +     drm_mode_config_cleanup(ddev);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void drv_unload(struct drm_device *ddev) {
> > > +     drm_kms_helper_poll_fini(ddev);
> > > +     db9000_unload(ddev);
> > > +     drm_mode_config_cleanup(ddev); }
> > > +
> > > +static __maybe_unused int db9000_drv_suspend(struct device *dev) {
> > > +     struct drm_device *ddev = dev_get_drvdata(dev);
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                     struct db9000_device,
> > > +                                                     drm);
> > > +     struct drm_atomic_state *state;
> > > +
> > > +     db9000_toggle_controller(db9000_dev, false);
> > > +
> > > +     drm_kms_helper_poll_disable(ddev);
> > > +     state = drm_atomic_helper_suspend(ddev);
> > > +     if (IS_ERR(state)) {
> > > +             drm_kms_helper_poll_enable(ddev);
> > > +             return PTR_ERR(state);
> > > +     }
> > > +     db9000_dev->suspend_state = state;
> > > +     db9000_suspend(ddev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static __maybe_unused int db9000_drv_resume(struct device *dev) {
> > > +     struct drm_device *ddev = dev_get_drvdata(dev);
> > > +     struct db9000_device *db9000_dev = container_of(ddev,
> > > +                                                     struct db9000_device,
> > > +                                                     drm);
> > > +
> > > +     db9000_resume(ddev);
> > > +     drm_atomic_helper_resume(ddev, db9000_dev->suspend_state);
> > > +     drm_kms_helper_poll_enable(ddev);
> > > +     db9000_toggle_controller(db9000_dev, true);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct dev_pm_ops drv_pm_ops = {
> > > +     SET_SYSTEM_SLEEP_PM_OPS(db9000_drv_suspend,
> db9000_drv_resume)
> > > +};
> > > +
> > > +static int db9000_drm_platform_probe(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct drm_device *ddev;
> > > +     struct db9000_device *db9000_dev;
> > > +     struct device_node *np = dev->of_node;
> > > +     u32 bpp;
> > > +     u32 bus_width;
> > > +     int rzn1_pwm = 0;
> > > +     int ret;
> > > +
> > > +     dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > > +
> > > +     db9000_dev = kzalloc(sizeof(*db9000_dev), GFP_KERNEL);
> > > +     if (!db9000_dev)
> > > +             return -ENOMEM;
> > > +
> > > +     drm_dev_init(&db9000_dev->drm, &drv_driver, dev);
> > > +     ddev = &db9000_dev->drm;
> > Use the newly merged drmm stuff here.
> >
> > > +
> > > +     /* Parse the DTB */
> > > +     ret = of_property_read_u32(np, "bits-per-pixel", &bpp);
> > > +     if (ret)
> > > +             bpp = 16;
> > > +
> > > +     if (bpp != 16 && bpp != 24 && bpp != 32) {
> > > +             DRM_WARN("bits-per-pixel value invalid, default is 16 bpp");
> > > +             bpp = 16;
> > > +     }
> > > +
> > > +     ret = of_property_read_u32(np, "bus-width", &bus_width);
> > > +     if (ret)
> > > +             bus_width = 24;
> > > +
> > > +     rzn1_pwm = (int) of_device_get_match_data(dev);
> > > +
> > > +     ret = drv_load(ddev, bpp, bus_width, rzn1_pwm);
> > > +     if (ret)
> > > +             goto err_put;
> > > +
> > > +     ret = drm_dev_register(ddev, 0);
> > > +     if (ret)
> > > +             goto err_put;
> > > +
> > > +     ret = drm_fbdev_generic_setup(ddev, bpp);
> > > +     if (ret)
> > > +             goto err_put;
> > > +
> > > +     dev_info(dev, "DB9000 LCD Controller Ready");
> > > +
> > > +     return 0;
> > > +
> > > +err_put:
> > > +     drm_dev_put(ddev);
> > With drmm_ support this put goes aways.
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int db9000_drm_platform_remove(struct platform_device *pdev)
> > > +{
> > > +     struct drm_device *ddev = platform_get_drvdata(pdev);
> > > +
> > > +     drv_unload(ddev);
> > > +     drm_dev_put(ddev);
> > With drmm_ support this put goes aways.
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct of_device_id drv_dt_ids[] = {
> > > +     { .compatible = "digital-blocks,drm-db9000"},
> > > +     { .compatible = "digital-blocks,drm-rzn1", .data = RZN1_REGS },
> > > +     { /* end node */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, drv_dt_ids);
> > > +
> > > +static struct platform_driver db9000_drm_platform_driver = {
> > > +     .probe = db9000_drm_platform_probe,
> > > +     .remove = db9000_drm_platform_remove,
> > > +     .driver = {
> > > +             .name = "drm-db9000",
> > > +             .of_match_table = drv_dt_ids,
> > > +             .pm = &drv_pm_ops,
> > > +     },
> > > +};
> > > +
> > > +module_platform_driver(db9000_drm_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Gareth Williams
> <gareth.williams.jx@renesas.com>");
> > > +MODULE_DESCRIPTION("Digital Blocks DB9000 LCD Controller Driver");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/gpu/drm/digital-blocks/db9000-du.h
> > > b/drivers/gpu/drm/digital-blocks/db9000-du.h
> > > new file mode 100644
> > > index 0000000..325c9f0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/digital-blocks/db9000-du.h
> > > @@ -0,0 +1,192 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/* Copyright (C) 2019 Renesas Electronics Europe Ltd.
> > > + *
> > > + * Author: Gareth Williams <gareth.williams.jx@renesas.com>
> > > + *
> > > + * Based on ltdc.h
> > > + * Copyright (C) STMicroelectronics SA 2017
> > > + *
> > > + * Authors: Philippe Cornu <philippe.cornu@st.com>
> > > + *          Yannick Fertre <yannick.fertre@st.com>
> > > + *          Fabien Dessenne <fabien.dessenne@st.com>
> > > + *          Mickael Reulier <mickael.reulier@st.com>
> > > + */
> > > +#ifndef __DB9000_DU_H__
> > > +#define __DB9000_DU_H__
> > > +
> > > +#include <linux/backlight.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/pwm.h>
> > > +
> > > +#define DB9000_MAX_LAYER             1
> > > +
> > > +/* LCD Controller Control Register 1 */
> > > +#define DB9000_CR1                   0x000
> > > +/* Horizontal Timing Register */
> > > +#define DB9000_HTR                   0x008
> > > +/* Vertical Timing Register 1 */
> > > +#define DB9000_VTR1                  0x00C
> > > +/* Vertical Timing Register 2 */
> > > +#define DB9000_VTR2                  0x010
> > > +/* Pixel Clock Timing Register */
> > > +#define DB9000_PCTR                  0x014
> > > +/* Interrupt Status Register */
> > > +#define DB9000_ISR                   0x018
> > > +/* Interrupt Mask Register */
> > > +#define DB9000_IMR                   0x01C
> > > +/* Interrupt Vector Register */
> > > +#define DB9000_IVR                   0x020
> > > +/* Interrupt Scan Compare Register */
> > > +#define DB9000_ISCR                  0x024
> > > +/* DMA Base Address Register */
> > > +#define DB9000_DBAR                  0x028
> > > +/* DMA Current Address Register */
> > > +#define DB9000_DCAR                  0x02C
> > > +/* DMA End Address Register */
> > > +#define DB9000_DEAR                  0x030
> > > +/* DMA Horizontal and Vertical Timing Extension Register */
> > > +#define DB9000_HVTER                 0x044
> > > +/* Horizontal Pixels-Per-Line Override Control */
> > > +#define DB9000_HPPLOR                        0x048
> > > +/* Horizontal Pixels-Per-Line Override Enable */
> > > +#define DB9000_HPOE                  BIT(31)
> > > +/* GPIO Register */
> > > +#define DB9000_GPIOR                 0x1F8
> > > +/* Core Identification Register */
> > > +#define DB9000_CIR                   0x1FC
> > > +/* Palette Data Words */
> > > +#define DB9000_PALT                  0x200
> > > +
> > > +/* Control Register 1, Offset 0x000 */
> > > +/* LCD Controller Enable */
> > > +#define DB9000_CR1_LCE                       BIT(0)
> > > +/* LCD Power Enable */
> > > +#define DB9000_CR1_LPE                       BIT(1)
> > > +/* LCD Bits per Pixel */
> > > +#define DB9000_CR1_BPP(x)            (((x) & 0x7) << 2)
> > > +/* RGB or BGR Format */
> > > +#define DB9000_CR1_RGB                       BIT(5)
> > > +/* Data Enable Polarity */
> > > +#define DB9000_CR1_DEP                       BIT(8)
> > > +/* Pixel Clock Polarity */
> > > +#define DB9000_CR1_PCP                       BIT(9)
> > > +/* Horizontal Sync Polarity */
> > > +#define DB9000_CR1_HSP                       BIT(10)
> > > +/* Vertical Sync Polarity */
> > > +#define DB9000_CR1_VSP                       BIT(11)
> > > +/* Output Pixel Select */
> > > +#define DB9000_CR1_OPS(x)            (((x) & 0x7) << 12)
> > > +/* FIFO DMA Request Words */
> > > +#define DB9000_CR1_FDW(x)            (((x) & 0x3) << 16)
> > > +/* LCD 1 or Port Select */
> > > +#define DB9000_CR1_LPS                       BIT(18)
> > > +/* Frame Buffer 24bpp Packed Word */
> > > +#define DB9000_CR1_FBP                       BIT(19)
> > > +
> > > +enum DB9000_CR1_BPP {
> > > +     /* 1 bit per pixel */
> > > +     DB9000_CR1_BPP_1bpp,
> > > +     /* 2 bits per pixel */
> > > +     DB9000_CR1_BPP_2bpp,
> > > +     /* 4 bits per pixel */
> > > +     DB9000_CR1_BPP_4bpp,
> > > +     /* 8 bits per pixel */
> > > +     DB9000_CR1_BPP_8bpp,
> > > +     /* 16 bits per pixel */
> > > +     DB9000_CR1_BPP_16bpp,
> > > +     /* 18 bits per pixel */
> > > +     DB9000_CR1_BPP_18bpp,
> > > +     /* 24 bits per pixel */
> > > +     DB9000_CR1_BPP_24bpp
> > > +} DB9000_CR1_BPP_VAL;
> > > +
> > > +/* Horizontal Timing Register, Offset 0x008 */
> > > +/* Horizontal Front Porch */
> > > +#define DB9000_HTR_HFP(x)            (((x) & 0xff) << 0)
> > > +/* Pixels per Line */
> > > +#define DB9000_HTR_PPL(x)            (((x) & 0xff) << 8)
> > > +/* Horizontal Back Porch */
> > > +#define DB9000_HTR_HBP(x)            (((x) & 0xff) << 16)
> > > +/* Horizontal Sync Width */
> > > +#define DB9000_HTR_HSW(x)            (((x) & 0xff) << 24)
> > > +
> > > +/* Vertical Timing Register 1, Offset 0x00C */
> > > +/* Vertical Sync Width */
> > > +#define DB9000_VTR1_VSW(x)           (((x) & 0xff) << 0)
> > > +/* Vertical Front Porch */
> > > +#define DB9000_VTR1_VFP(x)           (((x) & 0xff) << 8)
> > > +/* Vertical Back Porch */
> > > +#define DB9000_VTR1_VBP(x)           (((x) & 0xff) << 16)
> > > +
> > > +/* Vertical Timing Register 2, Offset 0x010 */
> > > +/* Lines Per Panel */
> > > +#define DB9000_VTR2_LPP(x)           (((x) & 0xfff) << 0)
> > > +
> > > +/* Vertical and Horizontal Timing Extension Register, Offset 0x044
> > > +*/
> > > +/* Horizontal Front Porch Extension */
> > > +#define DB9000_HVTER_HFPE(x)         ((((x) >> 8) & 0x3) << 0)
> > > +/* Horizontal Back Porch Extension */
> > > +#define DB9000_HVTER_HBPE(x)         ((((x) >> 8) & 0x3) << 4)
> > > +/* Vertical Front Porch Extension */
> > > +#define DB9000_HVTER_VFPE(x)         ((((x) >> 8) & 0x3) << 8)
> > > +/* Vertical Back Porch Extension */
> > > +#define DB9000_HVTER_VBPE(x)         ((((x) >> 8) & 0x3) << 12)
> > > +
> > > +/* clock reset select */
> > > +#define DB9000_PCTR_PCR                      BIT(10)
> > > +
> > > +/* Interrupt Status Register, Offset 0x018 */
> > > +#define DB9000_ISR_OFU                       BIT(0) /* Output FIFO Underrun */
> > > +#define DB9000_ISR_OFO                       BIT(1) /* Output FIFO Overrun */
> > > +#define DB9000_ISR_IFU                       BIT(2) /* Input FIFO Underrun */
> > > +#define DB9000_ISR_IFO                       BIT(3) /* Input FIFO Overrun */
> > > +#define DB9000_ISR_FER                       BIT(4) /* OR of OFU, OFO, IFU, IFO
> */
> > > +#define DB9000_ISR_MBE                       BIT(5) /* Master Bus Error */
> > > +#define DB9000_ISR_VCT                       BIT(6) /* Vertical Compare
> Triggered */
> > > +#define DB9000_ISR_BAU                       BIT(7) /* DMA Base Address
> Register Update to CAR */
> > > +#define DB9000_ISR_LDD                       BIT(8) /* LCD Controller Disable
> Done */
> > > +
> > > +/* Interrupt Mask Register, Offset 0x01C */
> > > +#define DB9000_IMR_OFUM                      BIT(0) /* Output FIFO Underrun
> - Mask */
> > > +#define DB9000_IMR_OFOM                      BIT(1) /* Output FIFO Overrun -
> Mask */
> > > +#define DB9000_IMR_IFUM                      BIT(2) /* Input FIFO Underrun -
> Mask */
> > > +#define DB9000_IMR_IFOM                      BIT(3) /* Input FIFO Overrun -
> Mask */
> > > +#define DB9000_IMR_FERM                      BIT(4) /* OR of OFU, OFO, IFU,
> IFO - Mask */
> > > +#define DB9000_IMR_MBEM                      BIT(5) /* Master Bus Error -
> Mask */
> > > +#define DB9000_IMR_VCTM                      BIT(6) /* Vertical Compare
> Triggered - Mask */
> > > +/* DMA Base Address Register Update to CAR - Mask */
> > > +#define DB9000_IMR_BAUM                      BIT(7)
> > > +#define DB9000_IMR_LDDM                      BIT(8) /* LCD Controller Disable
> Done - Mask */
> > > +
> > > +/* PWM Frequency Register */
> > > +#define DB9000_PWMFR_0                       0x034
> > > +#define DB9000_PWMFR_RZN1            0x04C
> > > +/* PWM Duty Cycle Register */
> > > +#define DB9000_PWMDCR_0                      0x038
> > > +#define DB9000_PWMDCR_RZN1           0x050
> > > +/* PWM Frequency Registers, Offset 0x034 and 0x04c */
> > > +#define DB9000_PWMFR_PWMFCD(x)               (((x) & 0x3fffff) << 0)
> > > +#define DB9000_PWMFR_PWMFCE          BIT(22)
> > > +
> > > +struct fps_info {
> > > +     unsigned int counter;
> > > +     ktime_t last_timestamp;
> > > +};
> > > +
> > > +struct db9000_device {
> > > +     struct drm_device drm;
> > > +     struct pwm_chip pwm;
> > > +     struct drm_connector *connector;
> > > +     void __iomem *regs;
> > > +     spinlock_t lock;
> > > +     struct clk *lcd_eclk;
> > > +     struct fps_info plane_fpsi[DB9000_MAX_LAYER];
> > > +     struct drm_atomic_state *suspend_state;
> > > +     u8 bpp;
> > > +     int bus_width;
> > > +     size_t frame_size;
> > > +     u32 addr_pwmfr;
> > > +     u32 addr_pwmdcr;
> > > +};
> > > +
> > > +#endif /* __DB9000_DU_H__ */
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

Gareth Williams
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
