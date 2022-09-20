Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C25BEEE6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 23:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0085010E793;
	Tue, 20 Sep 2022 21:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2053.outbound.protection.outlook.com [40.92.21.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0CD10E294
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 21:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyGQDWdkgE4aMqyHMV6Gc6sN1+2ijpCBegOHvkG0VFRhgdSr+/zb0ofwLbhZ/4d3NRVWvXavlUvPuyWXaonVB+35c08JSEGp+c6ZqDSWgneyhm7iCXO2JaeFBrX3/mXyPaEERzlLo+TV/ON5rH0gaMUHhjUsIhSaX9hNBCo1b7A/tNDI6hj2upXmKRJG/R+R702bTOtGCdZHfbMBy3ybDXUhvCstXxRAJKw2wTJVxuEj5FmNTniEaXfOCpHjXwnSS0HktR0oAL4iVLBMJ1I4g/OICyiLWXD5r9Ud+Hp4ZE5QR8BhJRKWedihOeet6og/PnodstECIY5xr9p4twZhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUgdk+wFKZPR8QVwSxULdhsWNM/iaZ0DLImueIPzY70=;
 b=ftAN38WlMNEyjKVu1CILO7fsvK0VBFUzlomY6bXvLAKR9rarOCF144B5zFqg5/An3EWd8UcscAe68h1hqDblNfQRcpnuYMwRmWKMwqyJf17U85DTzVvN2HbBOFQUe2PLJtTM2XTatmo3ADOOhKlOCYbTae477YGagr/O/+lMIvQAFSGKNJerqnbtE9MT9sK0lAa2HIgtpdtNLNi6Fos8HH1SeNb+Kj/diGHjNZaVdmsuHjkXEAtijclydgvV2lcQMa8tpTo7MXg+iYuVS8X864j0TZ8aahYZlgHZIgps270DFLOBPD8QD01k9RmKE9XlajK+Qz8x1U4TJB6t7xTL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUgdk+wFKZPR8QVwSxULdhsWNM/iaZ0DLImueIPzY70=;
 b=tj/ToGXKTLACwZaDN7wgN9LfTKw4pcAPOY9HcULw8WjZGg1Reb2OhjxHZpvWElRpuKY5Ccbi2l/XiufWk83C/giX6W8Ag5oYGoioWscZpDKpS7oCw8ZESyFdVfk3i3mqf/vc1QNL5V5museJz7tlsGf+GaL54HGUNHzmZSXrCl9qWwmm1bSVLd0CRUs6L3urRo9wWYiuoUVylaFCKwenunyRduNzFLr/HOA50wrNMi1LplY6Z4JZC29JkAZSlacnIdxArgnaB00rV4xYjvMdcVRaWjphmaq/Umi3yc9DrsFNMwQGS7fdAak7NaXhpVadyEj4A+elo8Xi2yMBf71+TQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB5097.namprd06.prod.outlook.com (2603:10b6:5:a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14; Tue, 20 Sep 2022 21:03:17 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 21:03:17 +0000
Date: Tue, 20 Sep 2022 16:03:14 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH V2 2/2] drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD
 panel
Message-ID: <SN6PR06MB5342070297F42AE2CE2BE371A54C9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220920170937.14486-1-macroalpha82@gmail.com>
 <20220920170937.14486-3-macroalpha82@gmail.com>
 <CAO_MupJ9qX7KcJBHdrh36-ZH6j3vroWbmtED0O=uMkYrGNXwUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_MupJ9qX7KcJBHdrh36-ZH6j3vroWbmtED0O=uMkYrGNXwUA@mail.gmail.com>
X-TMN: [MH+yqmPRovq12ngAPiewx70kSu3oI0q0]
X-ClientProxiedBy: SA9P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::32) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220920210314.GA16536@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DM6PR06MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd94295-e113-4e8e-761f-08da9b4b899b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHjuGU6noyIXDMRRkbkxRuC60BqMuTUmQ7k2toViDnb/hjbolSqXUEpcXSCItlszA7ajJ6rTKpJFlKy2HlC7FIdmSuua9x1uzLdPZCRo6/dSEDPkbiyTqRkOco/hIbZFvZxXrE2ilaR1HcoZqSDLMT6hX+MxNXbDWoSGK1QOlvv1jCm5j3XuSSisIGw+w3FHmKiWXqGzYslXsrNQUujltuFfBRXHeI9zUpfzlDDzKw0iKQHtIqrQBkWamNuWrAjmuxON9TKef8ZDSJ0xiVyQW7K3Ge8wzblge1fF61e1ivFvkXrvfqNTQbCZtLOSSZimf5baA2er4DCCcyUnkg/jm8ymOfsegKt2i50T0Zx0zYVLvj/3Kv+SPa8fQOwg2CDUfJxqwGDvsjmuji5At5gE0C+ImZ9zTc5y8NSuW6mvKb0iisNIUyW5YCdvWmpV35/E/x2dPSyPlihgxp79jxl65MhHVXXIwNtVP87iiO8bZwe2O/JiBPNcq9KvLnDHvShxFaa/dHiteYdv3tcjY1sMbgfyeUNONfiLQdZSZ76bgZaLGpQQLQm8L8dePtfdaf3QX5ltkaaYkCHNcMgD3ZnZ098QhiM5WGdYjuAAuWw5Awe18/Jk96ZPyNT6b1oPrG55GRIcEoKDW2zT4Url2JKaWokNslQwLUHq327ZyJxFq/cNH1C1KIRFT0IdOKXqmw+J
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmI5S1pGY0VUSWRWME1Oc2twK1NjSG84QWlCOFg4anNiK1ZGalo1UU1kaENR?=
 =?utf-8?B?UVBHYzcrV2V5STFqZytJQUcxM2lQa3c0VE5idzZFaExJMTNrWGh2Q1BTUWp2?=
 =?utf-8?B?eUxvYVBIWjhEb3AwcXZCMlE1YzlwVDlWTHV4R3E2UUpkbzVqSUIyN2VWYThD?=
 =?utf-8?B?Nk4yU3NMNlc3SU1rakpqZzlUUHgrUlVnbEg2RXRHTFM4S2RJQVhyZUc1RGZL?=
 =?utf-8?B?czJTaHhWcVFiK2JqZkhtLzhISFpGSnk3SnBxZTU5dmsyei9qa2ltdmFteGNi?=
 =?utf-8?B?OVRqb2MvRWJLeStyTUZCajM2OXNxMWV1RzhMc0poellyRG1ZcU8zVkVDQm1Y?=
 =?utf-8?B?eU5lMVNEYWgvbGphUVVMYkg2M29NR0JPTDF6SmpoRmxqUzR4Um1Kdm14QlFs?=
 =?utf-8?B?L0JpT0p6VWFuRUFQZVdHZmlpS1BlTi9hNUxXZ0VyZDRHTzRkaG8wWEsrenFq?=
 =?utf-8?B?VzlJdzdlVHVuVnhraTUrTnROeXUyWWtPY0U4MDRFWWgwQW1UU1p1OVQwZURi?=
 =?utf-8?B?L1gyb1doSkh3WlE4ajBJelRUNmwyT2dMZUxRQUg0UXVOT0xRVTU4b1hCa0l4?=
 =?utf-8?B?cmNuTlJpenlIaXFIR2hnbkpOTXUyOVhHYkx2T1kxOFZKVzhSWUxhcm05RENj?=
 =?utf-8?B?TGNZUU5lZzIyR1hPNklWYk80eS9MTEFRaFh2aWMyUFV1SzRnNTUwN0J5TWk3?=
 =?utf-8?B?VnUrZStpRUJ6SEdncGhKeHhnWDJpSytHUXh6dEpkVHd0a0hxeTdvbzBmL3FP?=
 =?utf-8?B?cW5rOWlISk9CSkNndEk5V0hSY3RKYmxzRnlyWmQ0dGxTd0xtZEZUMGxTYVdL?=
 =?utf-8?B?R2N3VTNSQTR4c0RqTFFzM1BsT1lVdFpHZ0lPRHhrWlpYd0RRMHZVKzN2Y3hj?=
 =?utf-8?B?RVdtbEFncm9qaXJzNHhJUGQ2WEkyWEErcTluZXNBbjRHTG5zL0ZSRVBjZWVH?=
 =?utf-8?B?UnRvb3pDcGVhZXlQajNLTWgrSXlRWFo2bC9keXRYWWdBclNVVXpCbjF1Z3FU?=
 =?utf-8?B?bi9adlB4QTFMWXdhd1lSUXpjdk5PNExZWFczYy9BMU5SUXJYWHVvYUNpSEE5?=
 =?utf-8?B?L2NsVThoZ3ZjSFdrRHkxcndlbHhSMTFWUWNRS01ETWdKNVNtR3UwWGZLdFY4?=
 =?utf-8?B?RDhxS1REZ3Eyblh1ckR4eHczbEV4d1pGYWN2RDRiTXBCRUtVSXM5Y2VZdFZt?=
 =?utf-8?B?U1R3ZWoyRDAxZTIrZDFPNm80TWsrSWxoVTY4YUwrdU1oQytaTWZFam94M2Rj?=
 =?utf-8?B?WWs5d01VVHFsdDBCeXMwbzV6VTZYMStNcHhZRmpqeVBWSDZHZXhHS283UU9F?=
 =?utf-8?B?ZjVxbjArNmVkbkVXalhmQzNlZ2hrb2YyamQxVk5WcTVWQkd0UENBa2hSL2l3?=
 =?utf-8?B?TWU0TWZSb3hadXZ0VkQ3OHhXRGtIcUdIaHc1alVEemc5ZjBIUm9ObXQ5dCtK?=
 =?utf-8?B?eTk2ak1PU2gzSTNOZkpzNVFLQWgrOGpSZ3lpMWcyR2Z6NGx3NEZDMzdwRUkx?=
 =?utf-8?B?V3J0S2M5T2JNcGdpZHYxemxaVWR3T2hKSlVoYWtEdUFhTG51R3A3bkExNTgz?=
 =?utf-8?B?Z2RESmpFSVJZU2RDOC9tSi9ZUTIxUUVQc2xuM05vSzEydFJzTDhRcDJ4Z2Fx?=
 =?utf-8?B?dzMxakluL2FnOWpXSWFCdWpHUGNBU1IxNjVaZ2tjcmV1dVNqL2xVN3cwK3hT?=
 =?utf-8?B?bHMzZDJhY29LL2ZLajU3SGhBbDRoYWxad2ZNbzdnWDhTb1I5bTVRM2JBPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd94295-e113-4e8e-761f-08da9b4b899b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 21:03:17.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB5097
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 07:33:00PM +0200, Maya Matuszczyk wrote:
> Hi Chris,
> Thanks for this patch,
> 
> wt., 20 wrz 2022 o 19:10 Chris Morgan <macroalpha82@gmail.com> napisał(a):
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Support Samsung AMS495QA01 panel as found on the Anbernic RG503. Note
> > This panel receives video signals via DSI, however it receives
> > commands via 3-wire SPI.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 505 ++++++++++++++++++
> >  3 files changed, 516 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index a9043eacce97..954b66a2adee 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -444,6 +444,16 @@ config DRM_PANEL_RONBO_RB070D30
> >           Say Y here if you want to enable support for Ronbo Electronics
> >           RB070D30 1024x600 DSI panel.
> >
> > +config DRM_PANEL_SAMSUNG_AMS495QA01
> > +       tristate "Samsung AMS495QA01 DSI panel"
> > +       depends on OF && SPI
> > +       depends on DRM_MIPI_DSI
> > +       select DRM_MIPI_DBI
> > +       help
> > +         DRM panel driver for the Samsung AMS495QA01 panel. This panel
> > +         receives video data via DSI but commands via 3-Wire 9-bit
> > +         SPI.
> > +
> >  config DRM_PANEL_SAMSUNG_ATNA33XC20
> >         tristate "Samsung ATNA33XC20 eDP panel"
> >         depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index 34e717382dbb..de0b57baf851 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen
> >  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
> >  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
> >  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> > +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS495QA01) += panel-samsung-ams495qa01.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c b/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c
> > new file mode 100644
> > index 000000000000..d693ba5f20c9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-samsung-ams495qa01.c
> > @@ -0,0 +1,505 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung ams495qa01 MIPI-DSI panel driver
> > + * Copyright (C) 2022 Chris Morgan
> > + */
> > +
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/spi/spi.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +struct ams495qa01 {
> > +       /** @dev: the container device */
> > +       struct device *dev;
> > +       /** @dbi: the DBI bus abstraction handle */
> > +       struct mipi_dbi dbi;
> > +       /** @panel: the DRM panel instance for this device */
> > +       struct drm_panel panel;
> > +       /** @reset: reset GPIO line */
> > +       struct gpio_desc *reset;
> > +       /** @enable: enable GPIO line */
> > +       struct gpio_desc *enable;
> > +       /** @reg_vdd: VDD supply regulator for panel logic */
> > +       struct regulator *reg_vdd;
> > +       /** @reg_elvdd: ELVDD supply regulator for panel display */
> > +       struct regulator *reg_elvdd;
> > +       /** @dsi_dev: DSI child device (panel) */
> > +       struct mipi_dsi_device *dsi_dev;
> > +       /** @bl_dev: pseudo-backlight device for oled panel */
> > +       struct backlight_device *bl_dev;
> > +       /** @prepared: value tracking panel prepare status */
> > +       bool prepared;
> > +};
> > +
> > +static const struct drm_display_mode ams495qa01_mode = {
> > +       .clock = 33500,
> > +       .hdisplay = 960,
> > +       .hsync_start = 960 + 10,
> > +       .hsync_end = 960 + 10 + 2,
> > +       .htotal = 960 + 10 + 2 + 10,
> > +       .vdisplay = 544,
> > +       .vsync_start = 544 + 10,
> > +       .vsync_end = 544 + 10 + 2,
> > +       .vtotal = 544 + 10 + 2 + 10,
> > +       .width_mm = 117,
> > +       .height_mm = 74,
> > +       .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +};
> > +
> > +#define NUM_GAMMA_LEVELS       16
> > +#define GAMMA_TABLE_COUNT      23
> > +#define MAX_BRIGHTNESS         (NUM_GAMMA_LEVELS - 1)
> > +
> > +/* Table of gamma values provided in datasheet */
> > +static u8 ams495qa01_gamma[NUM_GAMMA_LEVELS][GAMMA_TABLE_COUNT] = {
> > +       {0x01, 0x79, 0x78, 0x8d, 0xd9, 0xdf, 0xd5, 0xcb, 0xcf, 0xc5,
> > +        0xe5, 0xe0, 0xe4, 0xdc, 0xb8, 0xd4, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x7d, 0x7c, 0x92, 0xd7, 0xdd, 0xd2, 0xcb, 0xd0, 0xc6,
> > +        0xe5, 0xe1, 0xe3, 0xda, 0xbd, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x7f, 0x7e, 0x95, 0xd7, 0xde, 0xd2, 0xcb, 0xcf, 0xc5,
> > +        0xe5, 0xe3, 0xe3, 0xda, 0xbf, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x82, 0x81, 0x99, 0xd6, 0xdd, 0xd1, 0xca, 0xcf, 0xc3,
> > +        0xe4, 0xe3, 0xe3, 0xda, 0xc2, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x84, 0x83, 0x9b, 0xd7, 0xde, 0xd2, 0xc8, 0xce, 0xc2,
> > +        0xe4, 0xe3, 0xe2, 0xd9, 0xc3, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x87, 0x86, 0x9f, 0xd6, 0xdd, 0xd1, 0xc7, 0xce, 0xc1,
> > +        0xe4, 0xe3, 0xe2, 0xd9, 0xc6, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x89, 0x89, 0xa2, 0xd5, 0xdb, 0xcf, 0xc8, 0xcf, 0xc2,
> > +        0xe3, 0xe3, 0xe1, 0xd9, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x8b, 0x8b, 0xa5, 0xd5, 0xdb, 0xcf, 0xc7, 0xce, 0xc0,
> > +        0xe3, 0xe3, 0xe1, 0xd8, 0xc7, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x8d, 0x8d, 0xa7, 0xd5, 0xdb, 0xcf, 0xc6, 0xce, 0xc0,
> > +        0xe4, 0xe4, 0xe1, 0xd7, 0xc8, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x8f, 0x8f, 0xaa, 0xd4, 0xdb, 0xce, 0xc6, 0xcd, 0xbf,
> > +        0xe3, 0xe3, 0xe1, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x91, 0x91, 0xac, 0xd3, 0xda, 0xce, 0xc5, 0xcd, 0xbe,
> > +        0xe3, 0xe3, 0xe0, 0xd7, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x93, 0x93, 0xaf, 0xd3, 0xda, 0xcd, 0xc5, 0xcd, 0xbe,
> > +        0xe2, 0xe3, 0xdf, 0xd6, 0xca, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x95, 0x95, 0xb1, 0xd2, 0xd9, 0xcc, 0xc4, 0xcd, 0xbe,
> > +        0xe2, 0xe3, 0xdf, 0xd7, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x99, 0x99, 0xb6, 0xd1, 0xd9, 0xcc, 0xc3, 0xcb, 0xbc,
> > +        0xe2, 0xe4, 0xdf, 0xd6, 0xcc, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x9c, 0x9c, 0xba, 0xd0, 0xd8, 0xcb, 0xc3, 0xcb, 0xbb,
> > +        0xe2, 0xe4, 0xdf, 0xd6, 0xce, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> > +       {0x01, 0x9f, 0x9f, 0xbe, 0xcf, 0xd7, 0xc9, 0xc2, 0xcb, 0xbb,
> > +        0xe1, 0xe3, 0xde, 0xd6, 0xd0, 0xd3, 0xfa, 0xed, 0xe6, 0x2f,
> > +        0x00, 0x2f},
> There might be some use in adding unofficial gamma values,
> for higher and lower brightness values than officially supported,
> For example, vitabright repository of devnoname120 contains
> gamma lookup tables that should be compatible with this
> display.
> Perhaps it's worth checking out, for low-light and outdoors
> use case, as the display is meant to be used in handheld
> gaming devices:
> https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevnoname120%2Fvitabright&amp;data=05%7C01%7C%7Cb6531a6abc1940709ccd08da9b2e3fbc%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637992920188081853%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=KColbBBN2hg6c3L%2F7XuXkIBWQxoxoaHE9WxcEXP%2BoKw%3D&amp;reserved=0

Personally I'm against adding additional gamma values, since the values
listed in here come directly from the panel's datasheet. I'll let the
drm folks chime in though. Maybe worst case we could have a module
parameter for additional gamma values.

> 
> > +};
> > +
> > +/*
> > + * Table of elvss values provided in datasheet and corresponds to
> > + * gamma values.
> > + */
> > +static u8 ams495qa01_elvss[NUM_GAMMA_LEVELS] = {
> > +       0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
> > +       0x15, 0x15, 0x14, 0x14, 0x13, 0x12,
> > +};
> > +
> > +static inline struct ams495qa01 *to_ams495qa01(struct drm_panel *panel)
> > +{
> > +       return container_of(panel, struct ams495qa01, panel);
> > +}
> > +
> > +static int ams495qa01_update_gamma(struct mipi_dbi *dbi, u32 brightness)
> > +{
> > +       u32 tmp = brightness;
> > +
> > +       if (brightness > MAX_BRIGHTNESS)
> > +               tmp = MAX_BRIGHTNESS;
> Shouldn't we return -EINVAL in this case?
> 

I looked at a few example drivers that had built-in backlights
(this being an oled panel it has a "backlight") but actually
didn't find any examples on how it handled values larger than
it can support. I'm open to either dropping it to the max
or returning -EINVAL, I guess it just depends on what DRM
maintainers prefer.

> > +
> > +       /* Set gamma values */
> > +       mipi_dbi_command_buf(dbi, 0xf9, ams495qa01_gamma[tmp],
> > +                            ARRAY_SIZE(ams495qa01_gamma[tmp]));
> > +       /* Set gamma change */
> > +       mipi_dbi_command(dbi, 0xf9, 0x00);
> > +       /* Undocumented command */
> > +       mipi_dbi_command(dbi, 0x26, 0x00);
> > +       /* Set ELVSS value */
> > +       mipi_dbi_command(dbi, 0xb2, ams495qa01_elvss[tmp]);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ams495qa01_prepare(struct drm_panel *panel)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       struct mipi_dbi *dbi = &db->dbi;
> > +       int ret;
> > +
> > +       if (db->prepared)
> > +               return 0;
> > +
> > +       /* Power up */
> > +       ret = regulator_enable(db->reg_vdd);
> > +       if (ret) {
> > +               dev_err(db->dev, "failed to enable vdd regulator: %d\n", ret);
> > +               return ret;
> > +       }
> > +       if (db->reg_elvdd) {
> > +               ret = regulator_enable(db->reg_elvdd);
> > +               if (ret) {
> > +                       dev_err(db->dev,
> > +                               "failed to enable elvdd regulator: %d\n", ret);
> > +                       regulator_disable(db->reg_vdd);
> > +                       return ret;
> > +               }
> > +       }
> Maybe ret could be initialized with 0 value, and couple gotos like
> with some other drivers?
> 

Since this is the only point where we return after one or more
regulators are enabled a goto isn't necessary here... yet. If
more error checking is required than one might be necessary.

> > +
> > +       /* Enable */
> > +       if (db->enable)
> > +               gpiod_set_value_cansleep(db->enable, 1);
> > +
> > +       msleep(50);
> > +
> > +       /* Reset */
> > +       gpiod_set_value_cansleep(db->reset, 1);
> > +       usleep_range(1000, 5000);
> > +       gpiod_set_value_cansleep(db->reset, 0);
> > +       msleep(20);
> > +
> > +       /* Panel Init Sequence */
> > +
> > +       /* Password to start command sequence */
> > +       mipi_dbi_command(dbi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dbi_command(dbi, 0xf1, 0x5a, 0x5a);
> > +
> > +       /* Undocumented commands */
> > +       mipi_dbi_command(dbi, 0xb0, 0x02);
> > +       mipi_dbi_command(dbi, 0xf3, 0x3b);
> > +
> > +       /* Analog Power condition set */
> > +       mipi_dbi_command(dbi, 0xf4, 0x33, 0x42, 0x00, 0x08);
> > +       mipi_dbi_command(dbi, 0xf5, 0x00, 0x06, 0x26, 0x35, 0x03);
> > +
> > +       /* Undocumented commands */
> > +       mipi_dbi_command(dbi, 0xf6, 0x02);
> > +       mipi_dbi_command(dbi, 0xc6, 0x0b, 0x00, 0x00, 0x3c, 0x00, 0x22,
> > +                        0x00, 0x00, 0x00, 0x00);
> > +
> > +       /* GTCON set */
> > +       mipi_dbi_command(dbi, 0xf7, 0x20);
> > +
> > +       /* TEMP_SWIRE set */
> > +       mipi_dbi_command(dbi, 0xb2, 0x06, 0x06, 0x06, 0x06);
> > +
> > +       /* ELVSS_CON set */
> > +       mipi_dbi_command(dbi, 0xb1, 0x07, 0x00, 0x10);
> > +
> > +       /* Gateless signal set */
> > +       mipi_dbi_command(dbi, 0xf8, 0x7f, 0x7a, 0x89, 0x67, 0x26, 0x38,
> > +                        0x00, 0x00, 0x09, 0x67, 0x70, 0x88, 0x7a,
> > +                        0x76, 0x05, 0x09, 0x23, 0x23, 0x23);
> > +
> > +       /* Undocumented commands */
> > +       mipi_dbi_command(dbi, 0xb5, 0xff, 0xef, 0x35, 0x42, 0x0d, 0xd7,
> > +                        0xff, 0x07, 0xff, 0xff, 0xfd, 0x00, 0x01,
> > +                        0xff, 0x05, 0x12, 0x0f, 0xff, 0xff, 0xff,
> > +                        0xff);
> > +       mipi_dbi_command(dbi, 0xb4, 0x15);
> > +       mipi_dbi_command(dbi, 0xb3, 0x00);
> > +
> > +       ams495qa01_update_gamma(dbi, MAX_BRIGHTNESS);
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> > +       msleep(200);
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> > +       usleep_range(10000, 15000);
> > +
> > +       db->prepared = true;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ams495qa01_unprepare(struct drm_panel *panel)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       struct mipi_dbi *dbi = &db->dbi;
> > +
> > +       if (!db->prepared)
> > +               return 0;
> > +
> > +       /* Panel Exit Sequence */
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
> > +       msleep(20);
> > +       mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
> > +       usleep_range(10000, 15000);
> > +
> > +       if (db->enable)
> > +               gpiod_set_value_cansleep(db->enable, 0);
> > +       if (db->reg_elvdd)
> > +               regulator_disable(db->reg_elvdd);
> > +       regulator_disable(db->reg_vdd);
> > +       msleep(20);
> > +
> > +       db->prepared = false;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ams495qa01_get_modes(struct drm_panel *panel,
> > +                               struct drm_connector *connector)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       struct drm_display_mode *mode;
> > +       static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +
> > +       mode = drm_mode_duplicate(connector->dev, &ams495qa01_mode);
> > +       if (!mode) {
> > +               dev_err(db->dev, "failed to add mode\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       connector->display_info.bpc = 8;
> > +       connector->display_info.width_mm = mode->width_mm;
> > +       connector->display_info.height_mm = mode->height_mm;
> > +       connector->display_info.bus_flags =
> > +               DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE |
> > +               DRM_BUS_FLAG_DE_LOW;
> > +       drm_display_info_set_bus_formats(&connector->display_info,
> > +                                        &bus_format, 1);
> > +
> > +       drm_mode_set_name(mode);
> > +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +
> > +       drm_mode_probed_add(connector, mode);
> > +
> > +       return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs ams495qa01_drm_funcs = {
> > +       .unprepare = ams495qa01_unprepare,
> > +       .prepare = ams495qa01_prepare,
> > +       .get_modes = ams495qa01_get_modes,
> > +};
> > +
> > +static int ams495qa01_set_brightness(struct backlight_device *bd)
> > +{
> > +       struct ams495qa01 *db = bl_get_data(bd);
> > +       struct mipi_dbi *dbi = &db->dbi;
> > +       int brightness = bd->props.brightness;
> > +
> > +       ams495qa01_update_gamma(dbi, brightness);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct backlight_ops ams495qa01_backlight_ops = {
> > +       .update_status  = ams495qa01_set_brightness,
> > +};
> > +
> > +static int ams495qa01_backlight_register(struct ams495qa01 *db)
> > +{
> > +       struct backlight_properties props = {
> > +               .type           = BACKLIGHT_RAW,
> > +               .brightness     = MAX_BRIGHTNESS,
> > +               .max_brightness = MAX_BRIGHTNESS,
> > +       };
> > +       struct device *dev = db->dev;
> > +       int ret = 0;
> > +
> > +       db->bl_dev = devm_backlight_device_register(dev, "panel", dev, db,
> > +                                                    &ams495qa01_backlight_ops,
> > +                                                    &props);
> > +       if (IS_ERR(db->bl_dev)) {
> > +               ret = PTR_ERR(db->bl_dev);
> > +               dev_err(dev, "error registering backlight device (%d)\n", ret);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static int ams495qa01_probe(struct spi_device *spi)
> > +{
> > +       struct device *dev = &spi->dev;
> > +       struct device_node *endpoint, *dsi_host_node;
> > +       struct mipi_dsi_host *dsi_host;
> > +       struct ams495qa01 *db;
> > +       int ret;
> > +       struct mipi_dsi_device_info info = {
> > +               .type = "dupa",
> You might want to change this to something more appropiate for Linux.
> 
> I see this was left from a prototype driver that I wrote, which you might
> have based this one on.

Yep, guilty as charged. As said on Discord this driver is about 20%
you, 25% me, and 55% copied and pasted from other drivers. I'll change
this so it's not a swear word in Polish. My swearing ability is
limited to English and Spanish which is why I didn't catch it. :-p

I'll make sure to include you on the signed-off for v3 since this is
somewhat of a joint project.

> 
> > +               .channel = 0,
> > +               .node = NULL,
> > +       };
> > +
> > +       db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
> > +       if (!db)
> > +               return -ENOMEM;
> > +
> > +       spi_set_drvdata(spi, db);
> > +
> > +       db->dev = dev;
> > +
> > +       db->reg_vdd = devm_regulator_get(dev, "vdd");
> > +       if (IS_ERR(db->reg_vdd))
> > +               return dev_err_probe(dev, PTR_ERR(db->reg_vdd),
> > +                                    "Failed to get vdd supply\n");
> > +
> > +       db->reg_elvdd = devm_regulator_get_optional(dev, "elvdd");
> > +       if (IS_ERR(db->reg_elvdd))
> > +               db->reg_elvdd = NULL;
> > +
> > +       db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +       if (IS_ERR(db->reset)) {
> > +               ret = PTR_ERR(db->reset);
> > +               return dev_err_probe(dev, ret, "no RESET GPIO\n");
> I think this can be shortened into:
> return dev_err_probe(dev, PTR_ERR(db->reset), "cannot get reset gpio\n");
> 

It can, but I think it boils down to preference. To me it's easier to
read as it's written, but I'll let the subsystem maintainers chime in.

> > +       }
> > +
> > +       db->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +       if (IS_ERR(db->enable)) {
> > +               ret = PTR_ERR(db->enable);
> > +               return dev_err_probe(dev, ret, "cannot get ENABLE GPIO\n");
> > +       }
> > +
> > +       ret = mipi_dbi_spi_init(spi, &db->dbi, NULL);
> It's not always controlled via SPI, sometimes(based on a strap pin)
> it's controlled via MIPI-DSI commands.
> 
> Maybe let's either have another DT compatible for that?
> I'm really not sure

The panel-samsung-s6e63m0 driver is probably a good example here on how
to handle an SPI/DSI display maybe? I'm not aware of any other devices
with this panel used in pure DSI mode though and have no such device on
which to test. For my device the strap is hard-wired to force SPI only
command mode. What differs here is that the s6e63m0 driver is either
SPI 3-Wire + DPI or DSI, this one is either SPI 3-Wire + DSI or DSI.
I don't know if that means we can simplify into a single driver or have
to split it like the s6e63m0. Either way, I'm not comfortable commiting
code I have no way to test.

> 
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> > +
> > +       /*
> > +        * Get the DSI controller that is supplying data for this display
> > +        * which is controlled via SPI 3-wire.
> Same as above
> 
> > +        */
> > +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> > +       if (!endpoint) {
> > +               dev_err(dev, "failed to get endpoint\n");
> > +               return -ENODEV;
> > +       }
> > +       dsi_host_node = of_graph_get_remote_port_parent(endpoint);
> > +       if (!dsi_host_node) {
> > +               dev_err(dev, "failed to get remote port parent\n");
> > +               goto put_endpoint;
> > +       }
> > +       dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> > +       if (!dsi_host) {
> > +               dev_err(dev, "failed to find dsi host\n");
> > +               goto put_host;
> > +       }
> > +       info.node = of_graph_get_remote_port(endpoint);
> > +       if (!info.node) {
> > +               dev_err(dev, "failed to get remote port node\n");
> > +               ret = -ENODEV;
> > +               goto put_host;
> > +       }
> > +
> > +       db->dsi_dev = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);
> > +       if (IS_ERR(db->dsi_dev)) {
> > +               dev_err(dev, "failed to register dsi device: %ld\n",
> > +                       PTR_ERR(db->dsi_dev));
> > +               ret = PTR_ERR(db->dsi_dev);
> > +               goto put_host;
> > +       }
> > +
> > +       db->dsi_dev->lanes = 2;
> > +       db->dsi_dev->format = MIPI_DSI_FMT_RGB888;
> > +       db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> > +
> > +       drm_panel_init(&db->panel, dev, &ams495qa01_drm_funcs,
> > +                      DRM_MODE_CONNECTOR_DSI);
> > +
> > +       ret = ams495qa01_backlight_register(db);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       drm_panel_add(&db->panel);
> > +
> > +       ret = devm_mipi_dsi_attach(dev, db->dsi_dev);
> > +       if (ret < 0) {
> > +               dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
> > +               drm_panel_remove(&db->panel);
> > +               return ret;
> > +       }
> > +
> > +       of_node_put(dsi_host_node);
> > +       of_node_put(endpoint);
> > +
> > +       return 0;
> > +
> > +put_host:
> > +       of_node_put(dsi_host_node);
> > +
> > +put_endpoint:
> > +       of_node_put(endpoint);
> > +       return -ENODEV;
> > +}
> > +
> > +static void ams495qa01_shutdown(struct spi_device *spi)
> > +{
> > +       struct ams495qa01 *db = spi_get_drvdata(spi);
> > +       int ret;
> > +
> > +       ret = drm_panel_unprepare(&db->panel);
> > +       if (ret < 0)
> > +               dev_err(&spi->dev, "Failed to unprepare panel: %d\n", ret);
> > +
> > +       ret = drm_panel_disable(&db->panel);
> > +       if (ret < 0)
> > +               dev_err(&spi->dev, "Failed to disable panel: %d\n", ret);
> > +}
> > +
> > +static void ams495qa01_remove(struct spi_device *spi)
> > +{
> > +       struct ams495qa01 *db = spi_get_drvdata(spi);
> > +
> > +       ams495qa01_shutdown(spi);
> > +
> > +       drm_panel_remove(&db->panel);
> > +}
> > +
> > +static const struct of_device_id ams495qa01_match[] = {
> > +       { .compatible = "samsung,ams495qa01", },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, ams495qa01_match);
> > +
> > +static const struct spi_device_id ams495qa01_ids[] = {
> > +       { "ams495qa01", 0 },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(spi, ams495qa01_ids);
> > +
> > +static struct spi_driver ams495qa01_driver = {
> > +       .driver         = {
> > +               .name   = "ams495qa01-panel",
> > +               .of_match_table = ams495qa01_match,
> > +       },
> > +       .id_table       = ams495qa01_ids,
> > +       .probe          = ams495qa01_probe,
> > +       .remove         = ams495qa01_remove,
> > +       .shutdown       = ams495qa01_shutdown,
> > +};
> > +module_spi_driver(ams495qa01_driver);
> > +
> > +MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
> > +MODULE_DESCRIPTION("Samsung ams495qa01 panel driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.25.1
> >
> 
> Best Regards,
> Maya Matuszczyk

As always appreciate the feedback and enjoy working with you.
