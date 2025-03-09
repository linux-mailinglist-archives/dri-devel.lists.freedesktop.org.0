Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE3A58087
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 05:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FE210E19B;
	Sun,  9 Mar 2025 04:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Cu/sfAYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19011025.outbound.protection.outlook.com
 [52.103.14.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4FA10E19B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 04:10:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YplO7cmho4mM2uwNuodAXkdh/tDKQatWOQXAG9OSzfM/XaRiqxNO7r+zwgFFpQy38eX6Cpf1nZ5l1s3GghkmXMq+S6JQTRfJSSlo9sLCmI94FpqDeXgQkId6QID5PbUxPiScOO0ohaDamabyxfpjjAoW84aF+oFZfr69rUWc58HjkoibXgbqKebLCoX25eypAtMEDja81GsnzQ+YyGknmEkUHH4z1j9NpxjKb2Q2kVwCiuBGA7oLfxmOwX5T5iOFP/D0mh2/Mbc9NiOjUnNvO9MgHdlZRTDKETA6dPaYe1e+uXpXSsn+vzGst7r6jUJz1Ep+m9cC/L4ffIMyA4XdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VaEYOSlms7XtoMycNkbTHuJffg4otCOuf2besCSdTM=;
 b=Fk5V7oMDUcwWkeWCSko6jLAQVKozKmhHKfN5ABuvfv0pURKzEA/FGyMPYOROaXKkkWLcUpuS+qeO6GkxQJAXcslnP57GDDDRL9ZBlw32Ayggos8dxQLxovCwcH+ai5Rt+Pt85nlE8fVY9gV6m4EpWsZG8QP07JwfiluAcx6kOvdjBkVscJVQjlf/HE9Ghrrfkpy680TUhKrT4WUxwk1sDSaXBG/1xuxiYLwCOp/IHVNcsx2NiN71ONfrrDhUD58F0hkUsQ87ZGV1x+5KEmVsGwbPhgimG44wEqwJkVT4gUnqy9x+9ZIMznK6JcMud5mdjqLhjheTESj8/mVSpKu6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VaEYOSlms7XtoMycNkbTHuJffg4otCOuf2besCSdTM=;
 b=Cu/sfAYldMlbUC904Kqe43fUXwLSG75xInOt66+befiY/gLHLphuU4q9TLAplMMvNBNOn/9fbdq3LTFg4GIAk5Ia3LeCrYwvez4L5u2WP1Z8ckPiRsMNmjSZ90oGrycVXx05aNT9pkgFkK1oftteanJpoiEEogzQr0leT3JhwJ4iyY2yzAt+BLSU6+d7gwkgkRQqi7C72+NIbM8ihaKoFLjYOnpklhlVNJNLSVmY+1fTXD8Tb/fWuAxjrOZUWIUQDrMAVY2YTwR17YRpaKxkSNHA8dwm/OX1LrlGuytz+cG+KyYE5TfDlUbVuQAWJVowQkhFxHOO7I/TvEjCbQluuw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB7000.namprd02.prod.outlook.com (2603:10b6:610:85::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 04:10:20 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.020; Sun, 9 Mar 2025
 04:10:20 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Helge Deller <deller@gmx.de>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "javierm@redhat.com"
 <javierm@redhat.com>, "thomas.tai@oracle.com" <thomas.tai@oracle.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "kasong@redhat.com"
 <kasong@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
Thread-Topic: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
Thread-Index: AQHbglkhrw+MpFO4dkG2MqfhkIrBEbNqOZ0AgAASIhA=
Date: Sun, 9 Mar 2025 04:10:20 +0000
Message-ID: <SN6PR02MB4157594508B80319444C6C24D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250218230130.3207-1-mhklinux@outlook.com>
 <24668c7d-6333-423e-bd48-28af1431b263@gmx.de>
In-Reply-To: <24668c7d-6333-423e-bd48-28af1431b263@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB7000:EE_
x-ms-office365-filtering-correlation-id: 95cb8266-2d7e-4f44-3c4d-08dd5ec04ea3
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|15080799006|8062599003|8060799006|10035399004|102099032|3412199025|4302099013|440099028|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?F1ktvX29GHpC6UGZzMpt8Q1rxnnAvwaNC6+i5dN37TydaWCEJ6Oy1PFsvEBo?=
 =?us-ascii?Q?uGLkwlGG6PFZ5HGdZV3liJ0WZ1QD1UWGSQPL9CW5z0HZ4ZgdkV55WNUtEKk/?=
 =?us-ascii?Q?VD9WDwNZ1UyHm39t4ASjpKxawy/nh4Q1I++cieh9Mxtj991FYdH3hUf6+v5m?=
 =?us-ascii?Q?Qwlsigl3gCyin5E3qepJBAzvtEUDIP4iMhsrnS4nrSoLKHyNNhz/F6kN1cJi?=
 =?us-ascii?Q?Ir0hG9ouNaEyzmp2d8el4CFUGWpsZisyxw8X+Y6G7xjt4qF/u4UrzBZ/cNIo?=
 =?us-ascii?Q?JUyI5NmduuC8kLUzODP7jB12bjkDax27wZyKY0+KOdPRqkhpY/vLJHiZ4VXB?=
 =?us-ascii?Q?dnAcc7lMj6sgBmBLk+XqBSwQYCDC0FEDZaHUiYm+5MVaG7FM1JapJVPAcke6?=
 =?us-ascii?Q?096z2r+m4NmDujiiZf2/XLv4hGdh75ddZR2wHVnxCqen84QYV5qdgwNtSU7U?=
 =?us-ascii?Q?b5l/LZNNe5tORobeZC6vpTSNRdjLHG2ySDco+PARQrWQMZeAwyDdcyuY/0Ez?=
 =?us-ascii?Q?sfjdVZnBIXg3kV8sU8b6QfYrJI6bZEhtu2diQBSJIoNLCIYQVelHOxfJm5vq?=
 =?us-ascii?Q?/J6xqy4wh44+MDrtYZPYLUCaqsDA0fOAwH4ydVbfK0wDZwEAl5S0hbgrwhUm?=
 =?us-ascii?Q?UhfNHqas9PUAX3zWDd5q97Syw+a8Ng0xeycPsbSYCKBYE4JSuiYqiRP2CP7e?=
 =?us-ascii?Q?tOaVxcD5UoMy5gZcOAiWFjhSD9Io1Y9Ot0cl2mbZ9ixqFbxmmqSPJ9uWhYax?=
 =?us-ascii?Q?QFaFmfVmLeqfI4otYEvUkFQzExPvqg1YmdulxbMUHKW80huf2IplzyR2ME3K?=
 =?us-ascii?Q?aA0Uwf8DwadJ3+fvwIaUEvQGRb5PHmezk/xDUmsZVFE+E7vTskXmFkLcN+7r?=
 =?us-ascii?Q?GYhj8Ha35zhMgv/LpJYv7uAjGg7tzhu625RPTNBUBRARkd6xyMBVT9SOrE/6?=
 =?us-ascii?Q?WZikAcoS+DTuwsFH4j9BAb/kDhsIO93DpVFMLJXhf1YVYse5FkxkCYOUNEOn?=
 =?us-ascii?Q?LRbN2GHC+/d1J3rsPQY/k4CdUH+eFHIeAGeVMF7aGuxuRdpH7a0tFn0SeVCp?=
 =?us-ascii?Q?DQ1fMAZg4T1xrlFsXmh1Z2iG6xqv0JeBUqyUvDE2sOZeuW3nCAfjw1ZgfPS5?=
 =?us-ascii?Q?QD2audQuHolWjtlEJRjP+xUotchxuHxMsmEpbMZn/bj3zvewC2xuDZ4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X4XSX8tfvzTJtYynuRtvEe+qGZ1m8ufiXijEhI6LIpLP0vo9aXw48mMvHoiF?=
 =?us-ascii?Q?ktjc6KQPdYL0tfamNExgT+h+T0Op/otnBmx/ZNiXIbEmpzVtsgdm91c1+VzN?=
 =?us-ascii?Q?ATXtf2hq0ugXgRtdGb1W0rSFaT9+QiFXMAQJ/63mCULRGFCojr1TGhysPBB0?=
 =?us-ascii?Q?iIkyZnRZ6L89aNgt+gH6YYIPleu8yh75phiXAyZHvg/7KLVoJZH84sqFtUiS?=
 =?us-ascii?Q?niiR8iw9bL7FEon+7NwB7jSQ0BUVJ8aEe+IrOCqkUR5IvqKQ8zUi9ztzX4H4?=
 =?us-ascii?Q?rQ0tORATNRvdlKeb4B2CvKWLQIy4KphqQxK7XuO4aMGYwPjPM8ND4x2XLkWA?=
 =?us-ascii?Q?MliTnQ4XgZQIcYvgyUghzdfHuMjp3cvIgNF0CsHHAnE1sj8uGjNd9rtT70lx?=
 =?us-ascii?Q?U6uAdhn1wkGQNYw7L6c5QXaeFo3W5M8+iZVPyUPM5QGgGYSGDVTnaE4mt2tP?=
 =?us-ascii?Q?WT+XsXJgyn2YEhOSsPsM0MwTpOqopp+JKmzqTikp8A3D2qXyW6r7n6Ong7qK?=
 =?us-ascii?Q?+QUYwJ9JOB+LZ9r95vqXiiCCjM5eGmhneZteyhk+d8K0si18tyEsU/M8yeDt?=
 =?us-ascii?Q?KO1Bb4qJ/wLMcInUDuvqa139WP5/pKNtuiKDito4GkaiNCm5oE0i8ewRQ2L3?=
 =?us-ascii?Q?5BfiO2X2Wx0+8SpJNehA7aZte6lpm2RF544xeKz5by44HwTVvz1jcdsop9fi?=
 =?us-ascii?Q?vIqemGzG0QDSN7f0vpvBcn0+xYm4vW0DZ82JEwIumxhvQC0f8dZZZ3d4Q5Je?=
 =?us-ascii?Q?rjH9D98nTwjpNYEQXb+HX+a+pgnUgA87rXWuXbRKBTEtcZjuijitXxIJo0lh?=
 =?us-ascii?Q?3NIg3f0tMXUfinDs37W4443rNGQmzcOh0QoqMqKg8BL03NLeAFHSxItVQQpG?=
 =?us-ascii?Q?DDGU3TJkDCDoQ2Rmszodv2/hejQRaPbKHu7wz9OrvqeodfxrhyO/2PszZ3jt?=
 =?us-ascii?Q?4BSEL0AvWPe01p29w4HZTsrIubTsk2pifviI7qgGS8D0nN3tuxDyrl1jauMO?=
 =?us-ascii?Q?MZHBISd+OBegJuWqB9qBHUMuos3Ldl0+nooaGLopmLx0xr1o3aFuNF+N4AiI?=
 =?us-ascii?Q?zfn8PHHOxW6NBHxxlvyJEvrdkuFx0ClFwgH8t7+D6Q0CV71cyvDXSKyJWSTH?=
 =?us-ascii?Q?I/1rKKClL6QknrF+Qxmi1piy7eNQ7+OxXq5csBnmrmyn3rJqXJ6ejxQfh/sY?=
 =?us-ascii?Q?yY6aOPj+un9hk5XohCPSv5OeG847mdaJwCeO4S0gg3/9Yhc/TfDHwGIpMlg?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cb8266-2d7e-4f44-3c4d-08dd5ec04ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2025 04:10:20.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7000
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

From: Helge Deller <deller@gmx.de> Sent: Saturday, March 8, 2025 6:59 PM
>=20
> On 2/19/25 00:01, mhkelley58@gmail.com wrote:
> > From: Michael Kelley <mhklinux@outlook.com>
> >
[snip]

> >
> > Reported-by: Thomas Tai <thomas.tai@oracle.com>
> > Fixes: c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info"=
)
> > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > ---
> > The "Fixes" tag uses commit c25a19afb81c because that's where the probl=
em
> > was re-exposed, and how far back a stable backport is needed. But I've
> > taken a completely different, and hopefully better, approach in the
> > solution that isn't related to the code changes in c25a19afb81c.
> >
> >   drivers/video/fbdev/hyperv_fb.c | 20 +++++++++++++-------
> >   1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> applied to fbdev tree.
>=20

Thank you!

Related, I noticed the patch "fbdev: hyperv_fb: iounmap() the correct
memory when removing a device" is also in the fbdev for-next branch.
Wei Liu previously applied this patch to the hyperv-fixes tree (see [1])
and it's already in linux-next. Won't having it also in fbdev produce a
merge conflict?

Michael

[1] https://lore.kernel.org/linux-hyperv/Z6wHDw8BssJyQHiM@liuwe-devbox-debi=
an-v2/
