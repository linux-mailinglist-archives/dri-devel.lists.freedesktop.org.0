Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE9955782
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448A810E068;
	Sat, 17 Aug 2024 11:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="mpFlwg5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2015.outbound.protection.outlook.com [40.92.103.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5687510E068
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue3i+cUYgb1Cu/4ZNRQ/Kwqt0YKlR86JFjL2F6YCxMl/WJyO7ds2zKKh0ClIDfQPFvV8CPh0Fmda8M8wgwcDXQHppjyGpcf+jBMr2NeiybgLDavr9O4SjtJDu+O1GwM3eecJIRtvLy9dMbBhMs46uTDRBegcqwaRXyRwptCLvBaj5Xfr/hPLahl1IuK8MyD+v+oH0s6uwfFHeFXH8yS5ZlXXteCldW2KFoouw6NttVONTfj4XRYDz2+twH5bIP7pHf1Nh8pTQDalgQZ8JtEEl3UxWzxRkHV58pmu5eTVDTHHPFXD/IiwJUpZqL1bSN0s0hv0hKwXCqZdmKCYWh9jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZZavzphr3shhraXMTActElLkw7ZbEzpEF4Qxu1ZaD8=;
 b=O9OQIxKc2vO+fTcrZd6miGMbqze2ORyymjEqpMezrfHGwZGjizwNImyIg1IuFY9d/H9uf+vW7zuqecWqf4CS+zl/nz+MryCWeEQbsNsIt1nG2mEE1QwgYESSxIcTXORNqHRDiYaPA9A5HpI1TM84m5apLCl4kXwe6yRRXOifCjCKNRI7zbOmBeWjnDrf8WJhADNW+RgcBS1KAjKoonGm7vEA1PkDzW0FRwE1q085ECpw2EmNsScIymL28OB1iubTgHOjzFZUfWm/iHjwQjyJKH61pyyyFWPL25qf56aK7PSUObPuyLMpOPWj3Rvz3ktsFbST7mJ/WM0nK2qVHROk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZZavzphr3shhraXMTActElLkw7ZbEzpEF4Qxu1ZaD8=;
 b=mpFlwg5Vz0PSmTLWrCFn8iXvhGvjsS+m1aZ5nTEIbedY4/cGkuxs8kj3k3KIyfm/fT8ftnd3Y9Rlnna7iBcivvjyCEwbSp2XU18SNiyyI6/niYp1DrGMousJknQwzHj0sRCPtCtb6EcZJq7YvurS1alG1Ed+S8i0CyjLb8rRlhZi331+gezY0DBP9gC204zRuIWDhiaHU7rftPzRQUc2WU3zBQzIQUTk4OqUAD79i76z4WGwh22f4FExHRPy6btq5SaZz2WKRl8zgbnef0/F5sw4Owz1goWV0lu+NS9IeV1o5WGY8hriHEKiFERfiaFiXCQF4tbPr0tFRIYV51uT9A==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0673.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:42:34 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:42:34 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Index: AQHa8JqMhaHTVqCfcEyEHqSqQiXxJg==
Date: Sat, 17 Aug 2024 11:42:34 +0000
Message-ID: <D84FFA4A-3651-4036-8230-41EECDC8FD31@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [MPxLKLaE3J+hVU9RBjxnc51qrzwSgkHRzWCUvNXzpXZ6ABnKMbmbiJWp1aB5nrK5TKEgiOBbaJ0=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0673:EE_
x-ms-office365-filtering-correlation-id: c1c5ccb0-7f79-4ffa-70cf-08dcbeb1af69
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: 4tPquo5zlsnDpwQx6WO0qeogagxJmF5lRToryHjPr9BiwT86nXrE/DS5jEXtgyyQIYKNSr/23f5KFQlPOpFKf7X5tLISwmfC/HOGsx9o1LBeTePwEATl3aj40u+DxjEDZSsAug4yQ693Lhpw4/B2a5xOY7ewYsWZh37EKurhU+rQtRIPaRBoRA4JNX3Gk9AqLyKBR5cqyt5v4NPwEZVbjF71Kbrx/VMXN/eaNK0lokX9fOhTyevv5LKB5HKrWEa+NcWY7y97l9rHFmvmguwXZSek2+w9F/+LMEGqKbrcXp2IvsuAQgm9wGHIOCTQaDwZtAQks+mnrHHSEOGyVlTyKSpJGsN5SYWv5osPK430LrSf1ZBj/it5PsZty0E/cfKF5zvGR2nEREDje/XAmGxEjbhaIzGp0KKpEKdYakkPF59ynEoy3qjOVAbQ9UC+ReaRhmuvA2+ySsCCFuD4sPW5Ed3oj2FHxEgm9V/HVMtr6CXTBWXXyYAjArvtMctfKKdLN0J03pm41ZzDv004byslVTdV850fWuP+ni76ai18UMMNI/VbXJnuSH92HdO8CkRfwukysoYMzIX+HdYWH4sbFWW5yxV/jVIATXBsvLRppxUHJoqzI6Gc1s/lIzYo1mypVKUryNupZza/UzRktDdXCnFde3baBx02aaGE0WwZ6/c3b1bGpcGNQWYyQKURlmmPsDG8gfztslfHGgYbOJsLypyEpaNR5dg8JQ9Bv4PigXsy5YlIG1Gc6v019XSXf0RB7wEOxhl13EdhvQiMi8psL3CVkq34dTycCqpZ2szPexI=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LxSjtwyLO8N80rVNCGxBJJ6V5zlre3nGEVCe/knsv4iZnxM+fJqUJOHSqz?=
 =?iso-8859-1?Q?Rln7iWk3G+k6aF1M78DjDzu+modkaawuRjsSEasncnu7OfjQI+CZpxN/lI?=
 =?iso-8859-1?Q?yk2dyBcnQxnHiqa047CpybFbhLT9lKJPLUdcu1w0eIz6Y/1fCsIrxyTysq?=
 =?iso-8859-1?Q?E5iTyxoMiI9YqC+Bj2dHkVGTVdsl2E1xnR4oTpIgWbYIVTAEo8Ti8q4oqG?=
 =?iso-8859-1?Q?PQTmE3PG11Habvf6UzjB7PQLkozohh2zzT0tIIJDKKb+zxcgm4ja+5ffk5?=
 =?iso-8859-1?Q?01SawkH+dLBo2Xo5JyMsk7AaYCoeK1m/sOe4m1+SIbokGxkwO/KlbOM4AI?=
 =?iso-8859-1?Q?P0XZRHF7gfhWNOrWWDzLLit8q5Pw9HQ2+hY1ih4+rLDaY79fNw9Txjy3J2?=
 =?iso-8859-1?Q?swbexn2y2cqsFtgTBUEKn0/d/ooBDsizQeWtqPFwRUOC4joSUufvUdj4zW?=
 =?iso-8859-1?Q?ttpoga+JynQlFV3QvmlvjlOpEzbGfNjT5BYLU2Z6rXxjSl5j3H8nldzcbw?=
 =?iso-8859-1?Q?Y4dIVAiJa16D/MxrJajJ5+xk0t5Mqu9MUYAZEZrqecJe0SThx5fOPJZVFn?=
 =?iso-8859-1?Q?kgGPur4eYpKdEmpUfzX4jYeigkh85SyFxxkWF53pDr0a5AA69ID2Gc1xqh?=
 =?iso-8859-1?Q?3AElK9jXw/LmkSyn5brELgGZhfeTkMhNzz9yGiU3fRMVIgXKIy0SEna0FK?=
 =?iso-8859-1?Q?nWirl+/P6E58/w/IBlS20+UX+YYULm9YgMxPip2emhTKtlEmskScGD7WzM?=
 =?iso-8859-1?Q?OHCCGl97IV6BzlizB5CRywrHh7nHdGE4OUXObdsh1dFeXNxqiG6yPT9LPw?=
 =?iso-8859-1?Q?3QdIVgDVS2r7Qt3APEJEpeUVSrCdFk58SvsxCeNKIvaYfw6TUL4EIfFj6o?=
 =?iso-8859-1?Q?VyrQVpfnDS2kuUBI56WuXDcw1oymqbv7LxMjge15wnmmgTfh+VDu9LgNI6?=
 =?iso-8859-1?Q?TCq5CRawvJCA6mMIwd0Rno/aNYYCAOtfN/OWA9PX6N4SV3AhqnWIv3garU?=
 =?iso-8859-1?Q?4kdnJJOMnESFmpyvjfSLFP6CcFj+bCEfOQ1crs0aiXt8OwVpWpjVegcSXV?=
 =?iso-8859-1?Q?pSyqrREa676eIH6cXw5aGhkf3fRh1m2nyp+8L+V7qjp/iKfo+L+saeQrbk?=
 =?iso-8859-1?Q?3RbsTUTobwiLdEFmyRixU+8V2F5GpithsZNJQ9Rz9ThnqPX+E7OoVLiAnC?=
 =?iso-8859-1?Q?Y6oA66QNDr/1aCtXOp5KbqNBA/i92a2FrBATr7qfmZ4SkawyhhiuGQkkjo?=
 =?iso-8859-1?Q?adKyFaHfrjdhbSvAm8GWyCNRJbWbyc8u0ou3wlLgPSrk0wytNEA8d4cwJ2?=
 =?iso-8859-1?Q?JTXz4PDMGPWlZzej8t+S4sYKVVgfadrezBtBX9/yQ6Gxl0AdWU/8ysDtTn?=
 =?iso-8859-1?Q?GSY4j2TMpN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <17539F3FE808BC418F3FB14817F81A75@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c5ccb0-7f79-4ffa-70cf-08dcbeb1af69
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:42:34.0720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0673
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

v5:
  1. Do required changes to hid-appletb-bl as requested by upstream.

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
 drivers/hid/hid-appletb-bl.c                  | 207 ++++++
 drivers/hid/hid-appletb-kbd.c                 | 432 ++++++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1509 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0

