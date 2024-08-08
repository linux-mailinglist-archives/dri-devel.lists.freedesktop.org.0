Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A317194BC8F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B310E6E3;
	Thu,  8 Aug 2024 11:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="sqWnBlK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2032.outbound.protection.outlook.com [40.92.103.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DB610E6E3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGLWCezbyoWvll4X5yAZO6Hli4Y4R+Ja7galbyjlf9ewTMwMweq6N1b+4RYGB+A7jURqATtsHyAj2nDEpet+0HL4oSIjcrl0g23/h9qVv/fBX+5OtKW1KP7mbwVJaEYCPVnPdz7EahqR+WmUolq/C1OuExueWTmyD6O3BTzRI+r94/YKm53LMvdYR9gbHTNJxwqIxDdyCjUZfSoLbar0t74CRb+kWlOJ87bPuxmZFb9JKtXW8OHn4M78VgyMViWMd+xB714m5ILrJG9lDckUi4JycwtNOSJtTZrgXeXsC4rN2k4NheyFYu368sYfL842aZtMMAUwwfClBf5B1W89tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOUbGrF+b2BonyYuam42yF6r12JT1Gq3gTCmyY1qiE0=;
 b=nsNerIN2xlxanNe2Liziig3iHVzvbEafCgeu+TsJ+HSN8X1aD3wZqQfe86K5ijoZbYiPwGqSds8dX3vXNKribRICELehogmzWvlNhBTD/EwFGmEHobKocR0rrhHwPxnrJrZPiBeipuiZa9cJSd7kPqNhf2vm/pMAYMNtb5/1jT1wAcbSzYlpLn6wehzLJugs1L5SQ9QUAinJM3biKlx2BPrbURmAtKZHeH3psesw+BFYdYuniVxeSWpT1DESqABAl+sJ/e3R/TjxWEPjUwVde/iAIqfV2hJ99ltaVs1AOGrV3jTALL+MCd/afJTMG2yOAFTatAyHwV8KL2nY4w0E4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOUbGrF+b2BonyYuam42yF6r12JT1Gq3gTCmyY1qiE0=;
 b=sqWnBlK6GI7hjOMr94SrvzP7TRPSYcuJhaQbkKhkGpsv7v01rXmdC99BHJ+IkO+jC9BX3g0vT/B2AhoswwYlfqD6s+sYALcVhcfeBlU3TYCxcaybDVKh6VxI8QFx9RiRTeldLGbIOrhJ4Gc+mtPJpeVe+a6C46pl8WtksJwRkW89HJ5alqMUGPDTDH0p+Z3Gj7sHgTN4OYLn0yo9369OWSJzT0u3u1CqWF2OL3lD3LRGK+42rF0EYvtEt872PNsVafZ6J5X5O2YqDXnz0Opp2exWT+hiL2OMjNgxPIwryoZj+fKCgt0/HIQbBo7RLUnLF0vtc8eIti/O7aWUHA18Eg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB0680.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 11:53:35 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 11:53:35 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH v2 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v2 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6YmZuOYCRPgde0qoHgv/QhoGCA==
Date: Thu, 8 Aug 2024 11:53:34 +0000
Message-ID: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [4LmLyMJE2utlNXPODHR4wESMg47r1GDc5m8jSgx3HZWKZprDYULfwU5fHC9alg6feNFRl0eoJLI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB0680:EE_
x-ms-office365-filtering-correlation-id: 43b747ca-43a5-4e70-5e15-08dcb7a0bb94
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|19110799003|8060799006|461199028|1602099012|440099028|3412199025|4302099013|102099032;
x-microsoft-antispam-message-info: /kHZ83a8q7L1gao5i0qdL/wVzpt85IXZwb5JAEzscdDBePei+3suWI8G+QwJ5dG0l76ok1UlsxOWP5yJy2sbE481MhlAyE1f9zcPUS359CURk9vqoPJh0N0KxtscZNqv+t3ZKDzX87uBHfEJaT1dl3YGY1Xf9JyzIGi2KVsBtKhBPCthGmiHpjuRgz1EIkdWHKfYhQMsRSFzoPWtclahY4ZonIy4XUJkDeqa8msC9cOpND6OO/aVex3ncWv4oxD8F1qnford7skozgobV5HKaLbZwzzISjxmkpDvybkMOIIUn0zuTFfNZyiEeGajgzHOn8Er4tFCDOGRMkfJYkflSFN3aJ0VGXgV9Oy/WEuJ0+nW5j3UpRekrVK9AR3WNWZbxE3WzZbAih6Y6wgtTize2Snz5tQ8ddJK046+3U2qdWyeD6sIVmmR2/L8QI7RsOHRQfsmbPjc1RZiBQJI13kFj6UeiRTyKHBzvD3cDLPaizlgYyTTAojEIh5emP7RsqP/w/LFOTg0fYwAgc3MUEUhb/D5PKFLfJzHWqblQY5sa1tJmCyFLHGAwFx62rn0jSyhzy61o2zlVXy/lLe772DXuKtDXNfRqgB2m4j1z2m1IX0RlLEUnyJoYZl+tCncAuSmGngPJ09KMabri2U1qkpA+Q4W/gksPX1vo7aRUPARJVKgtStOtyiEfHp83Xm5qHRasgQnWdoZlYOUmBcoHt1CtjvgMvPlfSiT2tiTaOZTQN9uWA94njyabMj0YBfPYMXlYdvi+j9aUiIa3A+n9ZPuCvoh1Jdk5R6w4KSBdFVQIuk=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P1EBYnHYHIyZo0BL4/EYtV9y0dsBXXlZP1gnmiFhh4QsilY1Wlhir7S8jRgV?=
 =?us-ascii?Q?InA/JmSno1JaEUaG0SSMzaicKJimiFnPWXyL4l0iNK1406Dx05Yq48tprv3Y?=
 =?us-ascii?Q?XMae2L9BqdJ/U8tjM0q0xTgKi2IlqK8CSVWBoWisl4fdc7OFKpuI5kCc742W?=
 =?us-ascii?Q?0mXMhtofsjfe0X3+PvUhb+2tFKv0OfyDoosVStDWV74nOT/dPWYD+e78W5QJ?=
 =?us-ascii?Q?Inlnhg/+0/0g7/e5wQ3AGnML1aCwzMxxdkIK3AcbHi0m+4LY+WLTr2OtNoHV?=
 =?us-ascii?Q?X4/aodXIFONlOXt8TDzHO8oUqGZjCA+KIO8Eyg/QVUd1sNCQxuFfc/9+o1Dq?=
 =?us-ascii?Q?gAWnTR4jsZBv3AKNicd2bT3w92SksGIBZVNSUoRe6cl8cwXrEaFZskSy+qfT?=
 =?us-ascii?Q?ifyaXptrbefPkyeAgBsPDrDWl1Njl2F5UqcWkL1so6AMCWqxXBEGS7G6ZwuX?=
 =?us-ascii?Q?gWhKttRFgIaAAG0IBKUfJ3vri4ToD8KoU341PuSjt45jOSVj0B08Qry4xQYU?=
 =?us-ascii?Q?zUGGNViCjXkTitOpYRMxd9p5YjJqLJf7sOs7DMqHZ9O1tky7xzc6zDcNrI/O?=
 =?us-ascii?Q?y3H1s8RRkFYzOy26SKNOuG5VDxmtqVcDImTCfBwSf4/3LlmSLCHXhoDYT8cw?=
 =?us-ascii?Q?gjV0YnOB+oY1JcZlegYFsd9kGqw/SbXh+a3B6UzOHjSbc2OXnR/G9VbtogNb?=
 =?us-ascii?Q?0OMj7cnkQWNJY+8GOrii9dILGiAHDxPZHXWdIm6FqkfmcGUeZmw/PJxXicNf?=
 =?us-ascii?Q?d3HK0ZllahpxsbH+/fnglx7E00TLcrpdRmxHcd9e6quZ3x1UJk8g9M5qbG7E?=
 =?us-ascii?Q?RjNxEXDmJi72vB3vU4oZlngdUZyQBAAPy9MY6f6yzDUxKva+FbQ7kCAtbuGh?=
 =?us-ascii?Q?BpooDbjm36z/Tmc/5NrpVJVb4pM7ZVWEcYLdy0cd7lqalVFwvOKX6SJN2Q2h?=
 =?us-ascii?Q?rTWnDvR8MOXTZfV+vOlfKzCsxnFOa3X5uPAH4Fv8ku3T92D4it1tMyE6xyfV?=
 =?us-ascii?Q?Xj6DZL9zH/fO6X+Izi8ThmbshQBiwpiu3n12FFNL0IlQKqi1lkKvc27366bj?=
 =?us-ascii?Q?h3s6THKAvTQPih1DNNGIno89GOQCGbOWaw6UhdHcydZCHkM3tHssQct1ReIu?=
 =?us-ascii?Q?rZO1dV6tuKsdUwN3PZwzWqDbrftXZwI3bdt1hMPuaULjmOQMTd44t1b4iyum?=
 =?us-ascii?Q?fIYYUNCYr5Fp/W9XdA8rTL3X/KhSGkGfoX2tx/3Y9SqEaztH3dVLSrWfvFqp?=
 =?us-ascii?Q?L38q+ZvuLg5UK++/AzsMkG8Zll75+v3ygwcPz9wgpjWlfSIgmgqZKvH0ECBw?=
 =?us-ascii?Q?6nZlv//zX6VdyzId2kIm4bn1?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7747DA70498114FAB273C69809F953F@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b747ca-43a5-4e70-5e15-08dcb7a0bb94
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 11:53:34.9416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0680
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

Hi Maintainers

The Touch Bars found on x86 Macs support two USB configurations: one
where the device presents itself as a HID keyboard and can display
predefined sets of keys, and one where the operating system has full
control over what is displayed.

This patch series adds support for both the configurations.

The hid-appletb-bl driver adds support for the backlight of the Touch Bar.
This enables the user to control the brightness of the Touch Bar from
userspace. The Touch Bar supports 3 modes here: Max brightness, Dim and Off=
.
So, daemons, used to manage Touch Bar can easily manage these modes by writ=
ing
to /sys/class/backlight/appletb_backlight/brightness. It is needed by both =
the
configurations of the Touch Bar.

The hid-appletb-kbd adds support for the first (predefined keys) configurat=
ion.
There are 4 modes here: Esc key only, Fn mode, Media keys and No keys.
Mode can be changed by writing to /sys/bus/hid/drivers/hid-appletb-kbd/<dev=
>/mode
This configuration is what Windows uses with the official Apple Bootcamp dr=
ivers.

Rest patches support the second configuration, where the OS has full contro=
l
on what's displayed on the Touch Bar. It is achieved by the patching the
hid-multitouch driver to add support for touch feedback from the Touch Bar
and the appletbdrm driver, that displays what we want to on the Touch Bar.
This configuration is what macOS uses.

The appletbdrm driver is based on the similar driver made for Windows by
imbushuo [1].

Currently, a daemon named tiny-dfr [2] is being used to display function ke=
ys
and media controls using the second configuration for both Apple Silicon an=
d
T2 Macs.

A daemon for the first configuration is being developed, but that's a users=
pace
thing.

[1]: https://github.com/imbushuo/DFRDisplayKm
[2]: https://github.com/WhatAmISupposedToPutHere/tiny-dfr

v2:
  1. Cleaned up some code in the hid-appletb-kbd driver.
  2. Fixed wrong subject in drm/format-helper patch.
  3. Fixed Co-developed-by wrongly added to hid-multitouch patch.

Kerem Karabay (9):
  HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars
  HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch
    Bars
  HID: multitouch: support getting the contact ID from
    HID_DG_TRANSDUCER_INDEX fields
  HID: multitouch: support getting the tip state from HID_DG_TOUCH
    fields
  HID: multitouch: take cls->maxcontacts into account for devices
    without a HID_DG_CONTACTMAX field too
  HID: multitouch: allow specifying if a device is direct in a class
  HID: multitouch: add device ID for Apple Touch Bars
  drm/format-helper: Add conversion from XRGB8888 to BGR888
  drm/tiny: add driver for Apple Touch Bars in x86 Macs

 .../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/drm_format_helper.c           |  54 ++
 .../gpu/drm/tests/drm_format_helper_test.c    |  81 +++
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c             | 624 ++++++++++++++++++
 drivers/hid/Kconfig                           |  22 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/hid-appletb-bl.c                  | 206 ++++++
 drivers/hid/hid-appletb-kbd.c                 | 303 +++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1385 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.39.3 (Apple Git-146)

