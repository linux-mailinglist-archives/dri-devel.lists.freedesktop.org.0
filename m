Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B89A3D62F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA1C10E06D;
	Thu, 20 Feb 2025 10:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="NJTcaKaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010000.outbound.protection.outlook.com
 [52.103.68.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7A10E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2VRC9ExvMlWjvSxPsUPPZ8vyoNP2/MxCHd/ut9e/FGRGByZRdJlqfx+ZKR4FIWl5nD6qcuO/EUCyDRZAMVzHrVDj5tHe32LMErgY16IQ8Kt4cIrW3ZqCQscspaoFvCwYI4u3SHNWccfgfWA4bzfbGXSnCXOs5PJMx473N4jA4cYPP3dD+4ZbxaQZ8wIVwgZTwicM5QzgFcMIJYehvprOrI3nWjvUxTOB/GRlbnemPo8fBne2p+Wtm0HxRGSlXzPlNCW7Vl/FYvuzYlFiI1LnD2Dc9K9unzoyFjL5f1bjEckoAH15xUASSp8egUx765lMyy6MYpx0mLw1kt+ADh1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q68XQE22QP7v0Hg2FVSJr/XXSR66zBhyTOQVTWeMqn8=;
 b=J/t4Dj3QscuQMoJCrxcvqSTsO8yf1+Ye1bZvkIuVlebrvzDPlk0PbMILbZc0tyM5yf3vjAxrvTbLFwr7UJ/F8B3MM/+ozhjXcaDisCAiMmeTQ1ubYkrjNaYy9ezpUwTER1gdyvrD8/GjaCkKdI4wuSa3/5JeP6j93FjLjPm7RKa9X8K3oToi8+JIxz/zQHxchjwOQ12S903gO8+Sb5isD5GQNx1kUuy6o0M58Ne0L64qxHErkNQPquq0EZFHjHnpRbSnifAhGUAlxsLKD6OD/FN9cuTr5KZQGGydpQLXfNJaWuH+UC7uxO+4tV2SfWpKrQQyqmOZwilI1UKmjbYJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q68XQE22QP7v0Hg2FVSJr/XXSR66zBhyTOQVTWeMqn8=;
 b=NJTcaKaVcLGDxk2Uk5iQjtwmRv+qN3WElVSzxNE/nEet8LCm4ijErXwM5xlOyfb/8cFWOxsxqkOf+chtin1gRC/+QVQdj+mU045Z8ns1FTq/YTtDY5e+nwG0ALvntFBZiTWTCErN70eUd5H87ub8AiXvsuTMKCbnz8h5+xgyvaI/25qd8g3GaIq++rsuOsiN3Q03p1X1C80x+Q5KxEVIHdviFN+iUsMhjkz+l6tWpAUkTO8toZ18n33+gZZ4U1VxjfB8y1S/ZFZVigNzNyVlslxouZV1V42ZJ6ZbPUovJEB1PSBqrPnQWIU9OFhi33ggv2G8r7hjXQJVbFSwgWWM6Q==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN0PR01MB9040.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 10:11:58 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 10:11:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Index: AQHbgW0jg2AkJlVClEWW91xnm1SunLNM14qAgAMlSAA=
Date: Thu, 20 Feb 2025 10:11:58 +0000
Message-ID: <B9CB6BD4-A013-41AD-8094-C0B45A8201BF@live.com>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
In-Reply-To: <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN0PR01MB9040:EE_
x-ms-office365-filtering-correlation-id: 7b4b8bb3-b029-4f89-1857-08dd519702d8
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|7092599003|8060799006|8022599003|8062599003|19110799003|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?zwL0J2P9+hjv4bm5OsdSIcQn0SHXPI+joHAbp5CAr9yV3joLDkjbJ+v2SZJr?=
 =?us-ascii?Q?smbMh8J4nDCCBV5mAiUZF4QFL2K8oo6Ps12Kdmls12NbWHZb6Om0VhNLAisM?=
 =?us-ascii?Q?mEgBfWw2FNpxNVqRoWeCrJQQy/yim/YJjd4piqr90zaxD4AZ1JwhnKpQiikK?=
 =?us-ascii?Q?JeYGyVxfY29GEg7UdRhWvwgMAWj7ySdlJuseitxI34xGQMyvzo6Na99LizCD?=
 =?us-ascii?Q?0i3HvEBFwJbQhH+cpCBwrr+83Hq0L3Vuykt2dAG9cduK+sSsLNrSus3JgBeg?=
 =?us-ascii?Q?rZ5ySxrWZMdYM58hFBsvYI+8haOhhhqB68CxjCJL9Wle1qrb+JSE9kXia2fw?=
 =?us-ascii?Q?OSmgPrHsKvh4LnJTwLCaRvc1TiTVFquBPo9h59Oo+VWggjpo3j+TucFvlbz4?=
 =?us-ascii?Q?tX4oAl/WQ/HW8nT8jn2WaS0ntvrm3EZu6jEIbfTjC0MbzwLjAjp27Bn+26sO?=
 =?us-ascii?Q?2lz2rg3z5kPx+b9m+tXKv7oy+/He9wxODgRo15syN00PopMZIO0gsJ2liij2?=
 =?us-ascii?Q?jECVtG72oNp48i5Mm/jz0vIXWpGFva+RKwEiqpFf4SoYSfWRcQD41EW/bLaM?=
 =?us-ascii?Q?A8P9ulxHKbwUFlrlSa4OdErraJkf5S8jtpsgKM2ZqSziC5j97WK+zG0SM8Vc?=
 =?us-ascii?Q?srCitestth9RacOwiB4K5lJ05hplBy5vbUCR+eJti9S1fGjDNaExHl8C2fKJ?=
 =?us-ascii?Q?8Mah5eAKNLeCbpXNrYwWcAqG/yTG/6lWnjnhSSfNeokCNHgJYNKxOognPBuj?=
 =?us-ascii?Q?UWRmB85p6f5ngCvLsjvcQFlhuNEvAOlLYT5LzqLM6mfsFrd30SxaR+oNFZ9y?=
 =?us-ascii?Q?9YkkjpfCOsdRY8ryhBlNr18988p1WI8MdToYfRcAVCfcxl2iSjJx0V80wsuV?=
 =?us-ascii?Q?onBKr2DyBaMlyh1hsrEzYy5h2i+y7n5/pswrWu/uJnOJ6CmiDDBY52aCYqtm?=
 =?us-ascii?Q?C8d8G8tP6woP85KEZcqaC6fMjhyn6tw62r14MuVfUpTxRBPM+jHzY7VUbTKy?=
 =?us-ascii?Q?xI/CWhCWNa9AMkTGW0Q1/LScpjFM38ThejWiGGYX2vqxCGmDNzvk+WbVNR8K?=
 =?us-ascii?Q?68Mq9dk5rMP7PVYO4Ij/mmmTsTAtqfRmxSwmvEG9uNWWGsD7BsUGD2o96NkL?=
 =?us-ascii?Q?BgIbflvFYnJJ+27lLEYhp/2O890cUpTE4Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fC1AyNJMNhH8fKtKmPWJH7aYGzH9exQiQwd1HkFesdOaKTQPXm1ZOH7AJ5ud?=
 =?us-ascii?Q?SjY9KEYyiWjvD/pstWfqL++aZ7rrKuDhWlgNRGXjhI0eCJ3A0DFWVSy+zckE?=
 =?us-ascii?Q?gQvuR45BAPFeIG9eBAhI1AOpeNw3FltN7GS7hg7+tzp4oJIIAkQBP23MMra1?=
 =?us-ascii?Q?rbxnswGqRkZaohoxA36dG7kxHOEKU05V62yx2TYOfbB5rPAPTBTlLVeq0zPn?=
 =?us-ascii?Q?iJELD0Ukw74WFHPpv+mouLaXCDzQVv0bOcKz87/MkSz35FRJAJOclfvKSPaI?=
 =?us-ascii?Q?uzuF5z56pGSX9xj13XxZ21aMPlrJ20MAf/RK7520gt5UjWF5OEXXYFPLMQFZ?=
 =?us-ascii?Q?KxPuPzpRaTZy2ynu3D7IDNibnlcCkJqYAM8kah/sxzIzo5ZpNGADgOJtmsa0?=
 =?us-ascii?Q?2QQqNoVBIcy7csdBqdL4WWcSoHWwCk+6dL9vvKjJRcSsg2iCJTdBB3A7cxdo?=
 =?us-ascii?Q?W7jw/Hg1OEg8ReqfZhlqPn2AIB4Ourgc13jLsRTdAyKtmVwfBMTQXzPF94MR?=
 =?us-ascii?Q?aQGz4C4HkH1cMsWkAZCvtl/umeJfNbZO0TITkRkfN9gGpee3ETO6GdD2tRTJ?=
 =?us-ascii?Q?9ege2MctE/TszWvmgiaKqajJTvUZLwPydMrhDXZap2Hrr4j+81wVS0pmiJvU?=
 =?us-ascii?Q?4cg0CHQxN0jUe5uTITar7eHdZCDayq91mSPngyb6+cI7DiJ5/QeHXZVsbC2a?=
 =?us-ascii?Q?ETW/RnihTgUauY9eZ/5HXQ9ElUC3itxdftjhTFyOcrGVmbOAQBEKrFt0UECR?=
 =?us-ascii?Q?Qweb8Ll5ejli0z673vhV0VCvjoZmT5HJpvbvwUGQC3fhDTqXSiK5xjGfjl3E?=
 =?us-ascii?Q?wB1FVgkitgcXqK/OJe7MgJqOa7LfYjSP+dl9xmx8X7IEtv9slRhLd8DlKLYr?=
 =?us-ascii?Q?h/asVhimNbWT/YyieT5VYxOmfNXvCiKVopXUJdxCkLRHM29kfDzPBbBhyCZC?=
 =?us-ascii?Q?U4KiD9K/GCdu6K8soWE0aXVgOqtpl240c+YK8TLso5+dahZCGohiDrUI0BRC?=
 =?us-ascii?Q?sDZLIUSc340BvRwe6tZ6eft9n+3MRfGn0kFnEhcXU2a8HL5B/qvQJib/Fv7f?=
 =?us-ascii?Q?V371JoYQaFq0rw6pXH5avL+HbCxCxnnavVmV6kSUxdgVus4Rne5A36ZL4eO8?=
 =?us-ascii?Q?9nMQezPyebXSQVnIwRS3qPpaCjnaWwBAoLmCWuFS4ukcmQSfa6XSUxo8ZOFP?=
 =?us-ascii?Q?QoXlbYvvhigv50w5ArAE3XrS6ZJes1+EU29JqZLfCbLxrbzzb17WTjM/IPGL?=
 =?us-ascii?Q?TeSqOGUAEmt/uMIQIIfKoQQGmeuyVm+LtOgiAT+FvabO8KfNsmqatujlSmcr?=
 =?us-ascii?Q?jGMXLY0PSG+5Zb/qHcZQqk2q?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5E9CF2CCF607B4F8BA13BC30D9E24A9@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4b8bb3-b029-4f89-1857-08dd519702d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 10:11:58.5666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9040
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

Hi


>=20
>=20
>> + ret =3D drm_dev_register(drm, 0);
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Failed to register DRM device\n");
>=20
> This call does not belong to the mode-setting pipeline and belongs into a=
ppletbdrm_probe().
>=20
>> +
>> + return 0;
>> +}
>> +
>> +static int appletbdrm_probe(struct usb_interface *intf,
>> +     const struct usb_device_id *id)
>> +{
>> + struct usb_endpoint_descriptor *bulk_in, *bulk_out;
>> + struct device *dev =3D &intf->dev;
>> + struct appletbdrm_device *adev;
>> + int ret;
>> +
>> + ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bul=
k_out, NULL, NULL);
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Failed to find bulk endpoints\n");
>> +
>> + adev =3D devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct applet=
bdrm_device, drm);
>> + if (IS_ERR(adev))
>> + return PTR_ERR(adev);
>> +
>> + adev->dev =3D dev;
>> + adev->in_ep =3D bulk_in->bEndpointAddress;
>> + adev->out_ep =3D bulk_out->bEndpointAddress;
>> +
>> + usb_set_intfdata(intf, adev);
>=20
> Rather set the DRM device here and fetch it in the callbacks below. At so=
me point, we might be able to share some of those helpers among drivers.
>=20

FWIW

Moving register drm device here results in these errors in journalctl:

Feb 20 15:02:46 MacBook kernel: appletbdrm: loading out-of-tree module tain=
ts kernel.
Feb 20 15:02:46 MacBook kernel: appletbdrm: module verification failed: sig=
nature and/or required key missing - tainting kernel
Feb 20 15:02:46 MacBook kernel: BUG: kernel NULL pointer dereference, addre=
ss: 0000000000000030
Feb 20 15:02:46 MacBook kernel: #PF: supervisor read access in kernel mode
Feb 20 15:02:46 MacBook kernel: #PF: error_code(0x0000) - not-present page
Feb 20 15:02:46 MacBook kernel: PGD 0 P4D 0=20
Feb 20 15:02:46 MacBook kernel: Oops: Oops: 0000 [#1] PREEMPT SMP PTI
Feb 20 15:02:46 MacBook kernel: CPU: 10 UID: 0 PID: 3530 Comm: modprobe Tai=
nted: G         C OE      6.13.3-1-t2-noble #1
Feb 20 15:02:46 MacBook kernel: Tainted: [C]=3DCRAP, [O]=3DOOT_MODULE, [E]=
=3DUNSIGNED_MODULE
Feb 20 15:02:46 MacBook kernel: Hardware name: Apple Inc. MacBookPro16,1/Ma=
c-E1008331FDC96864, BIOS 2069.80.3.0.0 (iBridge: 22.16.13051.0.0,0) 01/07/2=
025
Feb 20 15:02:46 MacBook kernel: RIP: 0010:drm_dev_register+0x1c/0x290
Feb 20 15:02:46 MacBook kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 49 89 f5 41 54 53 48 89 f=
b 48 83 ec 08 <4c> 8b 77 30 49 83 3e 00 0f 84 09 02 00 00 48 83 7b 20 00 0f=
 84 0e
Feb 20 15:02:46 MacBook kernel: RSP: 0018:ffffbf4344cbb670 EFLAGS: 00010282
Feb 20 15:02:46 MacBook kernel: RAX: 0000000000000000 RBX: 0000000000000000=
 RCX: 0000000000000000
Feb 20 15:02:46 MacBook kernel: RDX: 0000000000000000 RSI: 0000000000000000=
 RDI: 0000000000000000
Feb 20 15:02:46 MacBook kernel: RBP: ffffbf4344cbb6a0 R08: 0000000000000000=
 R09: 0000000000000000
Feb 20 15:02:46 MacBook kernel: R10: 0000000000000000 R11: 0000000000000000=
 R12: ffff992a8f114020
Feb 20 15:02:46 MacBook kernel: R13: 0000000000000000 R14: ffff992a8f115ad8=
 R15: ffff992a8f114000
Feb 20 15:02:46 MacBook kernel: FS:  000073572877c080(0000) GS:ffff992deed0=
0000(0000) knlGS:0000000000000000
Feb 20 15:02:46 MacBook kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Feb 20 15:02:46 MacBook kernel: CR2: 0000000000000030 CR3: 000000011dd12003=
 CR4: 00000000003726f0
Feb 20 15:02:46 MacBook kernel: Call Trace:
Feb 20 15:02:46 MacBook kernel:  <TASK>
Feb 20 15:02:46 MacBook kernel:  ? show_regs+0x6c/0x80
Feb 20 15:02:46 MacBook kernel:  ? __die+0x24/0x80
Feb 20 15:02:46 MacBook kernel:  ? page_fault_oops+0x175/0x5d0
Feb 20 15:02:46 MacBook kernel:  ? do_user_addr_fault+0x4b2/0x870
Feb 20 15:02:46 MacBook kernel:  ? exc_page_fault+0x85/0x1c0
Feb 20 15:02:46 MacBook kernel:  ? asm_exc_page_fault+0x27/0x30
Feb 20 15:02:46 MacBook kernel:  ? drm_dev_register+0x1c/0x290
Feb 20 15:02:46 MacBook kernel:  appletbdrm_probe+0x4eb/0x5f0 [appletbdrm]
Feb 20 15:02:46 MacBook kernel:  usb_probe_interface+0x168/0x3d0
Feb 20 15:02:46 MacBook kernel:  really_probe+0xee/0x3c0
Feb 20 15:02:46 MacBook kernel:  __driver_probe_device+0x8c/0x180
Feb 20 15:02:46 MacBook kernel:  driver_probe_device+0x24/0xd0
Feb 20 15:02:46 MacBook kernel:  __driver_attach+0x10b/0x210
Feb 20 15:02:46 MacBook kernel:  ? __pfx___driver_attach+0x10/0x10
Feb 20 15:02:46 MacBook kernel:  bus_for_each_dev+0x8a/0xf0
Feb 20 15:02:46 MacBook kernel:  driver_attach+0x1e/0x30
Feb 20 15:02:46 MacBook kernel:  bus_add_driver+0x14e/0x290
Feb 20 15:02:46 MacBook kernel:  driver_register+0x5e/0x130
Feb 20 15:02:46 MacBook kernel:  usb_register_driver+0x87/0x170
Feb 20 15:02:46 MacBook kernel:  ? __pfx_appletbdrm_usb_driver_init+0x10/0x=
10 [appletbdrm]
Feb 20 15:02:46 MacBook kernel:  appletbdrm_usb_driver_init+0x23/0xff0 [app=
letbdrm]
Feb 20 15:02:46 MacBook kernel:  do_one_initcall+0x5b/0x340
Feb 20 15:02:46 MacBook kernel:  do_init_module+0x97/0x2a0
Feb 20 15:02:46 MacBook kernel:  load_module+0x2293/0x25c0
Feb 20 15:02:46 MacBook kernel:  init_module_from_file+0x97/0xe0
Feb 20 15:02:46 MacBook kernel:  ? init_module_from_file+0x97/0xe0
Feb 20 15:02:46 MacBook kernel:  idempotent_init_module+0x110/0x300
Feb 20 15:02:46 MacBook kernel:  __x64_sys_finit_module+0x77/0x100
Feb 20 15:02:46 MacBook kernel:  x64_sys_call+0x1f37/0x2650
Feb 20 15:02:46 MacBook kernel:  do_syscall_64+0x7e/0x170
Feb 20 15:02:46 MacBook kernel:  ? ksys_read+0x72/0xf0
Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x=
22/0xd0
Feb 20 15:02:46 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
Feb 20 15:02:46 MacBook kernel:  ? __do_sys_newfstatat+0x44/0x90
Feb 20 15:02:46 MacBook kernel:  ? ext4_llseek+0xc0/0x120
Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x=
22/0xd0
Feb 20 15:02:46 MacBook kernel:  ? syscall_exit_to_user_mode+0x38/0x1d0
Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
Feb 20 15:02:46 MacBook kernel:  ? do_syscall_64+0x8a/0x170
Feb 20 15:02:46 MacBook kernel:  ? count_memcg_events.constprop.0+0x2a/0x50
Feb 20 15:02:46 MacBook kernel:  ? handle_mm_fault+0xaf/0x2e0
Feb 20 15:02:46 MacBook kernel:  ? do_user_addr_fault+0x5d5/0x870
Feb 20 15:02:46 MacBook kernel:  ? arch_exit_to_user_mode_prepare.isra.0+0x=
22/0xd0
Feb 20 15:02:46 MacBook kernel:  ? irqentry_exit_to_user_mode+0x2d/0x1d0
Feb 20 15:02:46 MacBook kernel:  ? irqentry_exit+0x43/0x50
Feb 20 15:02:46 MacBook kernel:  ? exc_page_fault+0x96/0x1c0
Feb 20 15:02:46 MacBook kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Feb 20 15:02:46 MacBook kernel: RIP: 0033:0x735727f2725d
Feb 20 15:02:46 MacBook kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 9=
0 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8b bb 0d 00 f7 d8 64 89=
 01 48
Feb 20 15:02:46 MacBook kernel: RSP: 002b:00007fffd9f88d18 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000139
Feb 20 15:02:46 MacBook kernel: RAX: ffffffffffffffda RBX: 000062610c6eb8e0=
 RCX: 0000735727f2725d
Feb 20 15:02:46 MacBook kernel: RDX: 0000000000000000 RSI: 00006260e7b3be52=
 RDI: 0000000000000003
Feb 20 15:02:46 MacBook kernel: RBP: 00007fffd9f88dd0 R08: 0000000000000040=
 R09: 00007fffd9f88e50
Feb 20 15:02:46 MacBook kernel: R10: 0000735728003b20 R11: 0000000000000246=
 R12: 00006260e7b3be52
Feb 20 15:02:46 MacBook kernel: R13: 0000000000040000 R14: 000062610c6e4920=
 R15: 0000000000000000
Feb 20 15:02:46 MacBook kernel:  </TASK>

The following change was done:

@@ -13,6 +13,7 @@
=20
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -596,7 +597,6 @@ static int appletbdrm_setup_mode_config(struct appletbd=
rm_device *adev)
 	 * as the height is actually the width of the framebuffer and vice
 	 * versa
 	 */
-
 	drm->mode_config.min_width =3D 0;
 	drm->mode_config.min_height =3D 0;
 	drm->mode_config.max_width =3D max(adev->height, DRM_SHADOW_PLANE_MAX_WID=
TH);
@@ -635,10 +635,6 @@ static int appletbdrm_setup_mode_config(struct appletb=
drm_device *adev)
=20
 	drm_mode_config_reset(drm);
=20
-	ret =3D drm_dev_register(drm, 0);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
-
 	return 0;
 }
=20
@@ -648,6 +644,7 @@ static int appletbdrm_probe(struct usb_interface *intf,
 	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
 	struct device *dev =3D &intf->dev;
 	struct appletbdrm_device *adev;
+	struct drm_device *drm;
 	int ret;
=20
 	ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_o=
ut, NULL, NULL);
@@ -676,7 +673,17 @@ static int appletbdrm_probe(struct usb_interface *intf=
,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to clear display\n");
=20
-	return appletbdrm_setup_mode_config(adev);
+	ret =3D appletbdrm_setup_mode_config(adev);
+	if (ret)
+		return ret;
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
+
+	drm_client_setup(drm, NULL);
+
+	return 0;
 }
=20
 static void appletbdrm_disconnect(struct usb_interface *intf)

>> +
>> + ret =3D appletbdrm_get_information(adev);
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Failed to get display information\n");
>> +
>> + ret =3D appletbdrm_signal_readiness(adev);
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Failed to signal readiness\n");
>> +
>=20
>> + ret =3D appletbdrm_clear_display(adev);
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Failed to clear display\n");
>=20
> Clearing the display is not something usually done in probe. But I guess =
there's no better place. I'd do this as the final call in probe; after regi=
stering the device.  That way, it acts a bit like an in-kernel DRM client.
>=20
> Best regards
> Thomas
>=20
>> +
>> + return appletbdrm_setup_mode_config(adev);
>> +}
>> +
>> +static void appletbdrm_disconnect(struct usb_interface *intf)
>> +{
>> + struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
>> + struct drm_device *drm =3D &adev->drm;
>> +
>> + drm_dev_unplug(drm);
>> + drm_atomic_helper_shutdown(drm);
>> +}
>> +
>> +static void appletbdrm_shutdown(struct usb_interface *intf)
>> +{
>> + struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
>> +
>> + /*
>> +  * The framebuffer needs to be cleared on shutdown since its content
>> +  * persists across boots
>> +  */
>> + drm_atomic_helper_shutdown(&adev->drm);
>> +}
>> +
>> +static const struct usb_device_id appletbdrm_usb_id_table[] =3D {
>> + { USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
>> + {}
>> +};
>> +MODULE_DEVICE_TABLE(usb, appletbdrm_usb_id_table);
>> +
>> +static struct usb_driver appletbdrm_usb_driver =3D {
>> + .name =3D "appletbdrm",
>> + .probe =3D appletbdrm_probe,
>> + .disconnect =3D appletbdrm_disconnect,
>> + .shutdown =3D appletbdrm_shutdown,
>> + .id_table =3D appletbdrm_usb_id_table,
>> +};
>> +module_usb_driver(appletbdrm_usb_driver);
>> +
>> +MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
>> +MODULE_DESCRIPTION("Apple Touch Bar DRM Driver");
>> +MODULE_LICENSE("GPL");

Regards
Aditya

