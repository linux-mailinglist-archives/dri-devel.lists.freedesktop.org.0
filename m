Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029A94DB86
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E010E0A6;
	Sat, 10 Aug 2024 08:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="EWVz73eW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2102.outbound.protection.outlook.com [40.92.103.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF1210E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4f7B0hCb0OSmjpK/QtbfhexH1B5rXlbSarLbhnbLaNo3tPSYePo2SGV4wXWnSfb7o/W/uKE93tcfKroQk7s3yJfVbt/RXhyWID1R6lBpuyeA+7gMEYdU8xNu2hagbxINP9d/ZGhUrUi9uVYEWaEVDdUh++DW0OEQodfQtI/Cpu1MmXYL1iXG5wEmU9c4ysc0EXKU1AFy//Qpag0MWDJsq/mdau4MADJQyW4EeSn5dRz87C/iMPfX3Cu9o+0XIYAJov2jC+sF4UY+hy/CCorx/d/p4CyJ1bjevCuiMfZvCETv5icSY2yDNfuAtr1R/Mw/axTHGMeX9NEHpHzZd701w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKeO3KY0ZGF0LRzcPMg0swtCXBI9vvV2vcZkKL2g3EQ=;
 b=dK6bLnWwiUl04q7evzSLH/fVRF13ANhB90Hl43UwDfoqjzgwPh3GNBqGTaf/rXa/cvOxvUlI8yFQStXkWM2d5r65Pmxg2AQWm6JVFmrZtczZjvjYpERzfuD78jEw0K4bZBYRQ/vhwHJ2a8zMkXRGWeVthUEoFAawXrhKc30TrFDEatKl86S6maV6kEWn7oLLouHTWAPeplGFPKINNV7Z97vmJfQMtE+PUzJi5AySWq+Jmsaqkow6sru8/l5fjyqc7Q4CELQ4+ppc+v358D65MOvFQYPOTID6LUKQ5Of14I8PsTvXXUKdwgfLXioAs1Fjetd8soeQ368yX4kkFLHLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKeO3KY0ZGF0LRzcPMg0swtCXBI9vvV2vcZkKL2g3EQ=;
 b=EWVz73eWgCRcjfChXN3O1eMtZSYgS/VxXnZnjwm9oLSDKKobd9oWlO7M42nelfCTuKWdfzwMIZxCl0s4Pz0ZVUj2Gj6YEVVYU1tjzmIvu9o+QqsfCzSm/cDqLday2RckBytWQk2FxystCe2WnmVqL19nJsHxuyIsKSCl1e78GhaV+COp/sgpNS9QdciZpir4wSoO5Jy3EC8t5iVSTOVgIHxOP23ZZ3gHxAHeWBGcnIOUOPrsVJZeVDI4v7EzReTpRE6+z3Ces3BOUlKNnetHYl+7SUjaVVVzXM0AAAB8+sIixOdlGELtUOFNQPC0QMZDbP9VzYbXhqEfWoVQd1Js4w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB1153.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:141::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.18; Sat, 10 Aug 2024 08:45:09 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:45:09 +0000
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
Subject: [PATCH v4 0/10] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v4 0/10] Touch Bar support for T2 Macs
Thread-Index: AQHa6wGbVnv2F2HmGUyiZHmthnK98Q==
Date: Sat, 10 Aug 2024 08:45:09 +0000
Message-ID: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [DkgCAXVrzzN0X8+BsSlQ6X7UbaKvGvA4aOuCI9EsScqYw6ZhEEfw/Ll3nYBob4ifg4HAT5Fz5z0=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB1153:EE_
x-ms-office365-filtering-correlation-id: 5f15c4e8-1acb-4c84-1faa-08dcb918bd9c
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|15080799003|3412199025|440099028|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: FWmPVEIPKE6TzhBZPLzQwWlv5MlnM7mjpbCZs327YF27wjdbfORbDjmUt2DzRgpHOhHYj04M6DobRifSshhFBjGH+FeftS+NW9TWwawAKqISpRnhAcSlVvD3zPisleElAeptpd6sJUsF6C8deWJvxPmYLVlm70qc5GLRwr6GwXsnaLx1QbMBUoQZ1hKo83Y7+3YjY8sX05xyvedKdj3c+vdXD7xBZbyFregZuIuaDglZgfw96p4QEuIq41Nm/VLZeVUufjG3fKz0dLTXPMaP7H/5zEJeeVtls2yGx6jI/JWkmUBiV+kKMdrJTfiL+2Ek8krTGTtpCzJgT8vy8p4ic+qsMpPRnHb5yeGGmVyOqgjzeISdQFljjBxzbrDgWvUzONRKkEYHtfEUu2WvdT0ZtvKJFIi9JsbZwLwkicd3GETuklp7qjc5LDXrw5jS8ztOhfvlb64YIlUSKLLJLTOYvociwvr77j4lHyeyUkOJk6ULZynDefMV8NLRvlGtm0zTPZTfzJNA/n7WbKyRdLxPP6s3COXm9QYzHDrccmlgpFPE1CX5X19WXQcub9a0FNyBnhpre8uIijHJH0OyYohf6Wb1rRxlMSZsqdA7KdwSEpOJ7RBFqyNMTlQxbcF8Z9g4zUSGxsHhJwBTOXtX1PKo8y2EpBmhuOna63L2cgToE2s/7cUJ5osMe4mwmFlGBAYA8seugREXAhxbbugzT9oF9cS4/+NRAw7iTvh56gmRn9Fo4pordxgGBriNI4xo08HgcKbbvXspQY3FwwhOBCxgAJAOqWlLr90eQkHSwTvio7c=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LmNUda/FWCbH6NiNKQH3OUWxEGuLQbt39jEqsuhDWnBJRR92WJLSyC2EkhGp?=
 =?us-ascii?Q?vTCH4Y0aRYyCF8OXptJaFJPxuPYGRAoSec1OlTeplUP6JS0MdJ67z5aJp/cY?=
 =?us-ascii?Q?3M8TvRzlkcsSpokUfRu+nsEdUyEiu+UMUwEAtZFkRThDUYxgjWQwwFiuZo4m?=
 =?us-ascii?Q?Ez0W1CrN61fPvsB8NQ0EqgPAKuOql8Gmxq5ZuuC3Q9pFzyxhI2Kxw6xCdtts?=
 =?us-ascii?Q?KiiVw4PC5NkH+rDfgHTxOVOHxxf/kpKKe/2on8/hfHWiAws77pnqj46DowYQ?=
 =?us-ascii?Q?KiPwKoYq7Rdb3ZEDtEaSlRpEFmT45Dl1H4EoiuR1SM7drT5wN/SLv82SyY73?=
 =?us-ascii?Q?ytWoR7g3C7L0VYERTx59x0NJ3IrYgrsYxtZ3Vq8FmbOfvv7DRMhq4v5Zcy2h?=
 =?us-ascii?Q?nSx94koud2GLe+hibQiVeynEITzt5Xgw3aXsqreGxQds1MdkFyN8tgP2cqja?=
 =?us-ascii?Q?CewJNmnTxBDSwkf4DQ5n4ykLhL3tLSLzpFhQZGxyGOoIY5duyIss9cf9ItZV?=
 =?us-ascii?Q?YWNeP/t/2TrmW8Icj+RwHK48kl7tyhDWEQ7WV+kDtocB8UAuoJBUgmA9blHr?=
 =?us-ascii?Q?9uUM4i4CRsSmyt05MppAsmXkvyXX9OTKZjOR+/3gXdmc3f54pucHFxEGQln1?=
 =?us-ascii?Q?WCKK7NrMHRe7AXuGuarykseHLvhqtdxZyFIaz0DbtkiLOSqYwf1/EInZeqXS?=
 =?us-ascii?Q?lWRasElSnPz0nySyRECXjYrgoqvZyVW3hVI7Wa15yz1A6/xZWtZNexUoNHET?=
 =?us-ascii?Q?t9gV1KeANoZ0jkr1Olsabf+9voxOcFKuN8gVgp0Jt4///IZQi4OFN2c6TO5C?=
 =?us-ascii?Q?dCXogp3dphtyYUAzRtk4+L9s8SJV9PDjfHLmTZuyEP9360c9s64uu+AQOMPJ?=
 =?us-ascii?Q?DTOwl2O4iRPRNWh4/blAPz+WN+iRGu8dUkBZzrBvuvhgDe2z/m0CG3QnlAup?=
 =?us-ascii?Q?3JGx8b8UuB4h392rYlxy6D3SKfMyVrjl3pIwL6rbczsiNsGyIhKdosuj5dps?=
 =?us-ascii?Q?/ug4YbFC/OMhEiALJoGXT+V7FNw3B1m4vGD2zw79uc7ZQq6sP5lOs+FThVWd?=
 =?us-ascii?Q?OGkMcmrqXXiMEHX/yo/0dim6WBcvb/HFsXUfU1RCg3vk1s/QvwdgJgy7eDqc?=
 =?us-ascii?Q?PCli3MyRVspKTjeMx4xrsLtQNcswnY593wJ2j4H7r6lhes9IKtMRxuwB0GI5?=
 =?us-ascii?Q?xeg1XDX5X6iKJywu/kzh4C+ascNAh+Nu1gko0sxFjdezObRVI6ar9CLtHxEr?=
 =?us-ascii?Q?wCPAEPgHtFTFXTJjimHE005NOXee7iKRYttMYGfgkJ0ImXC842r8C8FYJndN?=
 =?us-ascii?Q?DoAiw2Aw477Ckv1N2m0HYPyB?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A5819DF9AB1EE249A347C6F8CA10856C@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f15c4e8-1acb-4c84-1faa-08dcb918bd9c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:45:09.1132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1153
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

v3:
  1. Fixed key mapping for Function keys in hid-appletb-kbd driver.

v4:
  1. Added support for fn key toggle in the hid-appletb-kbd driver.

Aditya Garg (1):
  HID: hid-appletb-kbd: add support for fn toggle between media and
    function mode

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
  drm/format-helper: Add conversion from XRGB8888 to BGR888 conversion
  drm/tiny: add driver for Apple Touch Bars in x86 Macs

 .../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/drm_format_helper.c           |  54 ++
 .../gpu/drm/tests/drm_format_helper_test.c    |  81 +++
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c             | 624 ++++++++++++++++++
 drivers/hid/Kconfig                           |  22 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/hid-appletb-bl.c                  | 206 ++++++
 drivers/hid/hid-appletb-kbd.c                 | 432 ++++++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1508 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0

