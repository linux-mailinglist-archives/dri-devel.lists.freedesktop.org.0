Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433BACCC76
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 19:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C08010E148;
	Tue,  3 Jun 2025 17:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="oi5lZ6fC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn19012052.outbound.protection.outlook.com
 [52.103.7.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8955610E148
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 17:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBGe8/NGg1w/bU2pOjDop4PKP2rFudP0fCd3RqjSpKjZPalLJJxbgh/Vx05cU8nSFgd1fWtALhoyzSrZt6LyZKJ8UpbH+7qcDzRJ37rqbDXBu1iyPehb2cZhf+atcBtbPFgryGP5oQJvvf2pnrHVf9xiU32vtPaH/CcuYyGaiO230uBDl9j1CZ0eCWAmoZQOWBAtn9xvdXYE96Fs+V78ToYjXY1M8SEWK9CSnwfYJ1naDpm2TAkwyJCOgKV7KIjX2zTx1HvX5K3FuM/uSd9inseOtSJkCUGJr8lqtFVkk/hGu3KKVoI+rRHNU4qDd9QF8op5hjX1dgUHHPkEs5k7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IO0m7QEak9ONuG7/CGdnpq0Gopa6IhWmmg9VWBqzN4=;
 b=CEEssvg++ZOpfCPhjan8hgTM12G/et9+GINvU+em61dZBny5ncXhVc9zRobcyIOkRaz9+dO5IMcXdj5jES2aAMZ2gafkA79tvy+UWqHVcKZbwR+TfOHXJXhE5yJCatM1k0arwtyNezAtmcYWk7Mq7uJ0/ge9+0Z1PpMZIgCetF3Fu8DGmorY1/PrVnevsKDsJ7h9e5nJUmJXN9ZWThR9O+ZBsZbLawNKTfkWy+XBhAt8WequI+n95Af4IlptQLaHbWNTuhzy/Ob/JUVHUpaWIykfpmIEkJi9KFZtdRfRBGoSFmsGFUxOv+vrgjiB587/Bbhux5gIpHkZYjmR92uEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IO0m7QEak9ONuG7/CGdnpq0Gopa6IhWmmg9VWBqzN4=;
 b=oi5lZ6fCFE0ZQfbeVf6h79OgSe8xZYjqIZ+ylDsPuAM7a2l6DQMJVtlhwX/OXEeNO/KXvChWPyFhAQuEupY3EANzYovZRliZGznzOxAf8aMWZ/F3plPZkSSLT1d7r7oi6Qh/vG+vUZJahijq38mMbjAZQxAdfbt9KdqauwsPCC9PqW0J41xuJE4gg3FOGrFQj2oqkZojZs75BMGqi6Guhogwn/ZGMlJOt5EgtWXodx9E5HSoeaeYfZ4hRaxi1UoEUSepzFwpWBkgT+qeI2jBJ4S1/FNDNt+eZn7nvNc3vvfK2VF0st6ommgMCVsju/X9L3CdAxkamRe4RW3k8RAVMA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA0PR02MB7353.namprd02.prod.outlook.com (2603:10b6:806:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Tue, 3 Jun
 2025 17:50:25 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Tue, 3 Jun 2025
 17:50:25 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Hildenbrand
 <david@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "deller@gmx.de"
 <deller@gmx.de>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Thread-Topic: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Thread-Index: AQHby/4dA8oNLnhKakm3U+ZOuvHFDrPvrtEAgAEJQeCAAFCFAIAAuDlw
Date: Tue, 3 Jun 2025 17:50:24 +0000
Message-ID: <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
In-Reply-To: <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA0PR02MB7353:EE_
x-ms-office365-filtering-correlation-id: c3527edc-b362-4a95-5f14-08dda2c71e7f
x-ms-exchange-slblob-mailprops: WaIXnCbdHrP4axiWuDsnATq01dsaK8T8MaYqj19nSr6koO2CLECqhMAv9lX5wjF6pwLKnPZb/1MwHHXctsAe04J3D4HhYBOwaLhRIVcB4q3zr+oSVHSB0fsqVkV/UNGzaLGX2mcd8T7L3n+UbSqWiLZHMGrpiaZ7GelvNgPT5c645ez59aiyct8SRIrS6DjxM4EMvFohgv3m74+E9ikDc+7zOx41nqQlD7Wz6Pa2HMXQUYljk6rgzbyVo9WWLTz6BeSZsGZM8hd9slH/lwZbdL4R+xYaR+5PrwKLihezzFjtd7lY9EcFjrs0fJZvQrzfm7fo7v8gOgooj1rEuHul2kuXWojJE78fIqe4ZdLBKT+khmN/Opql/V8/OiFyA7o3xqYlJcYICe9fwbd3vZtmkSmZSO4GmtxBRfcR1lzMJiUqmiTYdkQmS99CllOTsTv/R/Nz25paEHHZI/u7KoEa6MKMujqyfmCKYa+kOVlQG7s53b4KhCdd7COpaof3ks7/FUwNiNg7Dc+rsoKuubiqKr1YWyL9fAGZ1RiWbgZ5qrR5LZuL0WZOxabPg4M380RTMFKn+/J1lBA3iEgJeQNjI/2zGePouFpEgvgQzf7jgRPGkovPshxB8oI66mPV8CpxiqXU479U76ZpXEpyRakQ6BTkYeZPbMVZQX1TgA8FX6La+0jvd3/ihVMyUFGiM1+Z4Pte9NQota98gp9HQrmCFP9DESUkDvw2EbWrfrqJaQQlBvuH/N+VysywbOKChZsgSQjpnnNmWuA=
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799009|8060799009|8062599006|19110799006|461199028|3412199025|440099028|12091999003|102099032|56899033;
x-microsoft-antispam-message-info: =?us-ascii?Q?s8z+GHrYp/9/C5xXHpIpBepNhO6MimhpQicWbVR1Gs2ArPGQzqjr1NjAFMTR?=
 =?us-ascii?Q?WpzpbLesq9mAJKQfwQiv5p4ngGbCmEqy/0wJu7fwUgoEYzSJZLJMAyyfrCXw?=
 =?us-ascii?Q?tS2y0ovgQU5cgnrlsjlhDQzgrKHWZ5rh8x+F6HpmgwW33WhC0EaCOREg8Y15?=
 =?us-ascii?Q?d1hEzPmPR2fr5VUJPDpVLaoJJUwluNDMD5vIW8npi/F1sQOQuLFt20Mc28yp?=
 =?us-ascii?Q?DxHsJHfL2NScSdUTes6G2fR34oGCEWPWHZMZSoImOAt/m85UhA3qodvEdchh?=
 =?us-ascii?Q?zPntGnIESuHy1zch7GMTBAx6tMKXyXXzrof/X8rbtUhSmlrafR/95DHUEJl2?=
 =?us-ascii?Q?0BytA/gSCspGlZZhjlM7u1ttYqECuo0YXPK87VzDcW5hzHyxbduZ1LSdrdzW?=
 =?us-ascii?Q?P6C6TfhBc7A8F3xEanzdpLlNwzb/hIJaYwfLnTWiSDimUZseFxPsMVQEFZR3?=
 =?us-ascii?Q?vcN0rNM6q78sipPnFCbF07vuTKpI9fozkop9YKH7KcT0PSTKAwzU0KWTpj3X?=
 =?us-ascii?Q?3bLVOnWG3KlTVNozY1KGXIfmtQcA4cOsZhJ2ArglreMuIU3gN05CIiI4hh/T?=
 =?us-ascii?Q?IuWj8OBkHueNOdsZDvLISbZrX51iRgnkioDw8oQDVckOFQB+8iPn2MpfMTxF?=
 =?us-ascii?Q?GPL2Y3YAW9VX4AuKTHDbCqf7pWXmXu0PTUwqJTno8RKHx2/gN+D004GdR6bf?=
 =?us-ascii?Q?IT+ebGxMDYdo929YLvHEYAd80cUn9sHKerfUHRlI6yahWXnsuh5i3nmWOuiz?=
 =?us-ascii?Q?xJX9HKoDRWy/3TCYjZcFs5lHdgxkBVjEdBGoUTMHBUPjRAd/hITsg7CBjkJR?=
 =?us-ascii?Q?JAVwksaWtJLQWhgG+BG9ITXGB08kw6KkQaw0sqwCXxvOA1+8c2hx5QLucPrj?=
 =?us-ascii?Q?QgVwKy6FNa1ZaeA1vB8XJvbm9kkDHDJYFqoVnBYqIRlEJ2af5xE/aCSxmzWb?=
 =?us-ascii?Q?MfmjuhCw0dX1RqUXXKbfzVvL2Oe6Xe9DYljcBcNYYQHWZZ9dE4DdafXIhpUs?=
 =?us-ascii?Q?a4wXpq+A4o1A6FlOlfeoRrnpXO8QogklV5rFE2NFXwDnNFuUWORc9QIMI5tI?=
 =?us-ascii?Q?HpVH9rrlfJPJQ5OQfdKhEGTDFUxRd+U+9CSDfABjBuARtzRitcU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MkVNfRupmLiTUJpz7sylAV0G1tYQvspgJpdtaQZGYkCD+C2Qvi9siGLWAoR1?=
 =?us-ascii?Q?yDSwY1/0T81whsVi9SzUUo9PswdCppM57Pjq/nmKadXBAhLXblCxD6yiHiG1?=
 =?us-ascii?Q?bt2T2IJqZmYyIVKcOZ6QyjsY8UiGSL46DmVV/9ISmsxl01DLdeQXw24meqU/?=
 =?us-ascii?Q?c18s6tUzdWW6/fsPnFm1Ar0ooTK2sm/NyEjm49ruI0Q0nI1sClMn19uGHgQ8?=
 =?us-ascii?Q?CkfraT73WF0Fts/xByfVTHkLJcXfDQ4GtWDF+nB7uz2tc3RPeNtLzs3vP06H?=
 =?us-ascii?Q?rADBeS40Z/p964dcawxIWdnF/mbd+YNWNtpZpF5M9hPHYAqcGkIAr6J009y8?=
 =?us-ascii?Q?Y6XAKR9NBB1ZndD0dsGJ27bOCGYJ96cmlAmz6AeknVq2U8ulCNi7xuek7z5y?=
 =?us-ascii?Q?orwnjYoUT7kxhfqqVwy98L1CI9Ucd1pl81iqKKw/I+/dX61wJQKuxYVBv8cQ?=
 =?us-ascii?Q?t0QYfvTPdtQS5VeZhAEAnfmnsBt93BULVxs8CT56O/qlBW4GSPxRhLA+IZTG?=
 =?us-ascii?Q?nLVp8j9wJhhG4QyME/aLpa/g/NwNaaIYMiUQkfvu4n+Og1Rdi/BF0RAuHwqr?=
 =?us-ascii?Q?Oz2O8QURC+lQiBrxX/v0Lo66FMztZRhZEfA5ZhCsDVh6PZoUqsYLP7IHqyFL?=
 =?us-ascii?Q?Q61qnfS+jjCuUBjMTW13Xx49TlQHbVkjqyk1kvPF729F/Lagp0/T2Cy+rWOg?=
 =?us-ascii?Q?zH4szjInDXn2Adxsp5/KKA5rBHYtA990xqVJ93L+ffhOyBsmU3/vKfH6PyMJ?=
 =?us-ascii?Q?y1xPd34A7gZj38jZWnIFN7IRWPaMBBq4sIxE8FiO7GZjkJTNwVIn5G5WFaOA?=
 =?us-ascii?Q?TAt3+3T3s0rl0KsfLpChmoXJdzyPvg1h3D6m3T/WNDhNJeqKs+WMmSPgyLBO?=
 =?us-ascii?Q?SbYmkVtaYbKz9uCJKoGFvezISnFGoXL698ICCMpLgeCIGbY8+oWg7oeczxj9?=
 =?us-ascii?Q?koKMLI8zZFLWUdade6eKv2uhH1ah6GbtE0OkTCASVNSMo3muZgCb8VQQox+p?=
 =?us-ascii?Q?EoLiWW5tJYpeaZ9Ri1efXQH/lwrhNKpANlDb6Z335LpT83Ssk70/UsMmcDbS?=
 =?us-ascii?Q?0qhBZhFIwl+o/DrG0eLUnIfBoeL7srqt77pOen+qrEJ6UtG3RpUUfThfLn5Y?=
 =?us-ascii?Q?ZZllRH1FuicVzthPP2+RQ+B1ySc02/BSkCaGA2tUMg0luzvPealS+fIQyJ4B?=
 =?us-ascii?Q?cii5ehZhsY/TIj93nOI2V1zFbw7qSAlvV/1ZlQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c3527edc-b362-4a95-5f14-08dda2c71e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 17:50:24.9884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7353
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

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, June 2, 2025 11=
:25 PM
>=20
> Hi
>=20
> Am 03.06.25 um 03:49 schrieb Michael Kelley:
> [...]
> >> Will the VMA have VM_PFNMAP or VM_MIXEDMAP set? PFN_SPECIAL is a
> >> horrible hack.
> >>
> >> In another thread, you mention that you use PFN_SPECIAL to bypass the
> >> check in vm_mixed_ok(), so VM_MIXEDMAP is likely not set?
> > The VMA has VM_PFNMAP set, not VM_MIXEDMAP.  It seemed like
> > VM_MIXEDMAP is somewhat of a superset of VM_PFNMAP, but maybe that's
> > a wrong impression. vm_mixed_ok() does a thorough job of validating the
> > use of __vm_insert_mixed(), and since what I did was allowed, I thought
> > perhaps it was OK. Your feedback has set me straight, and that's what I
> > needed. :-)
> >
> > But the whole approach is moot with Alistair Popple's patch set that
> > eliminates pfn_t. Is there an existing mm API that will do mkwrite on a
> > special PTE in a VM_PFNMAP VMA? I didn't see one, but maybe I missed
> > it. If there's not one, I'll take a crack at adding it in the next vers=
ion of my
> > patch set.
>=20
> What is the motivation behind this work? The driver or fbdev as a whole
> does not have much of a future anyway.
>=20
> I'd like to suggest removing hyperv_fb entirely in favor of hypervdrm?
>=20

Yes, I think that's the longer term direction. A couple months ago I had an
email conversation with Saurabh Sengar from the Microsoft Linux team where
he raised this idea. I think the Microsoft folks will need to drive the dep=
recation
process, as they need to coordinate with the distro vendors who publish
images for running on local Hyper-V and in the Azure cloud. And my
understanding is that the Linux kernel process would want the driver to
be available but marked "deprecated" for a year or so before it actually
goes away.

I do have some concerns about the maturity of the hyperv_drm driver
"around the edges". For example, somebody just recently submitted a
patch to flush output on panic. I have less familiarity hyperv_drm vs.
hyperv_fb, so some of my concern is probably due to that. We might
need to do review of hyperv_drm and see if there's anything else to
deal with before hyperv_fb goes away.

This all got started when I was looking at a problem with hyperv_fb,
and I found several other related problems, some of which also existed
in hyperv_drm. You've seen several small'ish fixes from me and Saurabh
as a result, and this issue with mmap()'ing /dev/fb0 is the last one of tha=
t
set. This fix is definitely a bit bigger, but it's the right fix. On the fl=
ip side,=20
if we really get on a path to deprecate hyperv_fb, there are hack fixes for
the mmap problem that are smaller and contained to hyperv_fb. I would
be OK with a hack fix in that case.

Michael
