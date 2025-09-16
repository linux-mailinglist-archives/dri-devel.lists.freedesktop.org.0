Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72579B59B2C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215F10E809;
	Tue, 16 Sep 2025 15:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="MaOtSYmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azolkn19010025.outbound.protection.outlook.com [52.103.23.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A3E10E80F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI3m3384h+0AdR8WqF1qsYWTaWOi6ZQ99ZIWw5DX5ohV8xuTEaIfYAKU6FFdUKZUZn3pknTKwt56N3eGLhrK+8ROzMKGDSAQnmh+X3tAbLZ/ON+/ASvPjSltwBWRV37mkpOJu0rdqGH7/RDUxAXspJ3MlYBjran9oOdidzqLkpypQQpLoNBrSd8QegyYkLQG/rNIdpwO8WDq9NTIu54T0XiWf/PBq7+Y25c0Rc7ElnjIwrk4BaCxwPHFYz20916EInu/bA9Ne5L4jVoqwchc2lJLdcr7Y3awJReXbtE8eZvBj3lkPFwPpTpKpYuI9kKyxd6TI29iQM6oxQzqJjv8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9BL40cnI0Pl4dSADrfbka7gfbtS+uYwBzlulEgDnpY=;
 b=LEBAPI1obE9RVOmcALvqCc2h0KJwlbD+gOgH7QRU283zNE2HgHTEBjjigZ03f76yifEFfi0WnEdIZtUmOXw2qHn59ypcsk++NB4pP8gQB8NE1IbuMQYN+iNf9EO7kw/JRbPEQ4jCPNu5kosQcJdUMztiFoJzN90mWoW5T4zeK0ULngyqXsjBeW/g9+giY+v4m/F93P53hhc+drjg+O4NMHr/c+3jb1IHKbyaLhzYhavOv+UIPsX5ccrVGL7V3u8LjN+lM9NFFbcb2thbtoIUvwxjyfkAqLTZOt/IXMTg2UhnP4IZyO7pOm5e6zpGX/KuT9GGO0Ru2dD2eAxmmhGVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9BL40cnI0Pl4dSADrfbka7gfbtS+uYwBzlulEgDnpY=;
 b=MaOtSYmVm/63hugewuZg6aATNO6eeyE1N4Xx2l/rGrDJA7RVMqlwyTiI4S9opRCS4jTg+Ydww/hyxT9mmjcWOD0JPxH2vgXv6EHyHp4h54sLsQtrdVQGglCjv35LIsHgY6XoYH21dfauxOjVkFv4l2ICL0MDcf0VI7oTQPa7NSqE5oml+PZ2m5hAu2EPoMMmncZlzSYiJNZrp2eio7oAaKAYfIOK2lqz/Ns657rGk1glQvV/HOrGUkT+7g2i6UVzj0lLvh6PPbFYBKba8vn5xXUJ1w0Zuuh6I4FtedKgsJlx3WEO52qwpEMdtvpOWTdTRF00bNQnsJujNYtxaf4lNA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA6PR02MB10598.namprd02.prod.outlook.com (2603:10b6:806:406::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 15:00:59 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 15:00:59 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "javierm@redhat.com"
 <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Topic: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Index: AQHcHay/1LhJS9Qt20a/N81nkOUA8bSED7IAgAYnyGCAC1WNAIAAa1tQ
Date: Tue, 16 Sep 2025 15:00:58 +0000
Message-ID: <SN6PR02MB41575149CA466B89283B920DD414A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250904145806.430568-1-tzimmermann@suse.de>
 <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
 <c6ef1912-84b8-4f01-85cc-2fb18f1ad1ed@suse.de>
In-Reply-To: <c6ef1912-84b8-4f01-85cc-2fb18f1ad1ed@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA6PR02MB10598:EE_
x-ms-office365-filtering-correlation-id: fc4ee5ed-06c4-4160-64cf-08ddf531d86e
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799015|15080799012|8062599012|461199028|31061999003|19110799012|13091999003|56899033|40105399003|39105399003|440099028|3412199025|102099032|12091999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?R8MNS9G36VT3enVaPzA2I3x3f3596Ef3YLrMiVgpUO3aIliEycRRcTWkAyPc?=
 =?us-ascii?Q?tlDHDsNZIFEszmsIOqWVSHeYECCk9HiaY+7TWLH3FjlaO0hXTtVHunUqQoc4?=
 =?us-ascii?Q?vfbzHraZ8so9DA5BkcAEP5xsGq7ObHgY9ihB3IGsb0BPry1lSw5/h4YECVDp?=
 =?us-ascii?Q?6i/LJy1TBzY9WidIlEMp+qyn8nJytf4Sh1TXNinOYMrW/jP/fnGLt2/6ty0w?=
 =?us-ascii?Q?h3+dvyi5MtB74FqMyhvW9fsSXv7EvjkAdO6xRDY10tz3wFZDHBhOlCdtDWI4?=
 =?us-ascii?Q?wJGl4oomi0weI40bqL6zWl0VCoiH83hs2rTZd/uWkrUSv4R0mAS6Zrn39pVo?=
 =?us-ascii?Q?vxuTqi9DdGtuu7WUdChT/23Ceel8SyM9vl0VRPDQSDFz7J5iAdk6fc566J33?=
 =?us-ascii?Q?Si1mgKh/2Vw/kq0uIwWlTvcz69pZIUqjIFZCNy+YuMo7YRmUOAJCoXXue2OY?=
 =?us-ascii?Q?SQWaysuhHAKvHDvP1NJLth2HmIjPyZewOpCSzRAmDzA4aGrd+4ahEgwEzSN4?=
 =?us-ascii?Q?qB5mCtwl90vL6DMoLQQF+FN2AocL0hkA5OVbDQ8yfuRFi7kGFgMr96YdG3vo?=
 =?us-ascii?Q?T6a5S+aBo6JSYEg65/o0oG4MHysLkIiFEUDn9/EkTrqNm2jWVfmHdnQOiVvr?=
 =?us-ascii?Q?vT3O5NeItFj0gky3y1h1ISJyLkOGwBnHk8aeS8Gp/6Kv/Yf4XQ7gNM8iQZUo?=
 =?us-ascii?Q?F59acmg7PWf32ZEFFfH1b0dL87Zo6l8cVmhqWPy2em3T9de/qH/DRVN4x2nn?=
 =?us-ascii?Q?SqXfYOzwNtMfpDHPpOL08+A+xFN3zpTzCCxpAHPTIfD77NCKIc6BEsTdlo9C?=
 =?us-ascii?Q?khuioHXSTZSv+XH0WmQB0FtSyRAGIcCXILjtPqgukiENsuLq9ZxpHGtMaYVb?=
 =?us-ascii?Q?04QFrLnFGdtpt8juHytk7RFA9l/XirDjSsrayhFRD0xp7zEEoZHE8q4evdyv?=
 =?us-ascii?Q?nfhUU7SdviOnQYMaNiMDfEIU7IOy102I095PlRKpD79GsbN6MlG6WplTQ3u9?=
 =?us-ascii?Q?a0jA9KFIbbGg0Q0B77L0KWKRdUkbZwKNvx7yVps/gydsNh8gJPzRN7rgo9rk?=
 =?us-ascii?Q?91RuaewKn6P0XCYvOejGi/HrUqe4GV2v/WZkIYbg7h29tkq+xm4gYbWjSrOv?=
 =?us-ascii?Q?kyHttD+q/m/TzUckgwPgVGWQQnFDawKuOvrmUuxKZF/wCZ/3h8LTBbn71m2T?=
 =?us-ascii?Q?WKfJd/sYU/tVimJBHiWUJYjAkpSAREp1qmfiavcWlMD7xf+9NYi+N8C7qAk?=
 =?us-ascii?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sxNG8/Lhx//yNk/eqJqs79jsErugTgulWawYb+osmsLE17ga8Jp4r9Pm4nI1?=
 =?us-ascii?Q?QAlkoncF1ywdvAEeX9vsSHlzp53PTfT//1DtNtiaXV2U/nzqjTIIbfhz0lrv?=
 =?us-ascii?Q?GixwRAqr+Y5bCspTLv8lk70t7ErQVVz9vH7cCORVwwiWz2aDAqhJaZqz6ZIj?=
 =?us-ascii?Q?Au+JxBpcwl0GRnhuvyAB7LKVve30cUDDelZDeLY7BNq+S+T248Ul1hDuBVeA?=
 =?us-ascii?Q?1GhJ6WpOHN0LDLH12NwamN+pOMBWPh7CtdOdSeuNtushq60COle6cSpACXYr?=
 =?us-ascii?Q?0/WgVheVBbJCNDh0og9rxbbQ+P0W7FJw6rAib2TfjQ56wuH85jiK+oqqFOos?=
 =?us-ascii?Q?Xa3/y20glKeLMG/m3Gj58q517b92TyTVgjHG83+fyCwDklV8jUkSlFRVmKjP?=
 =?us-ascii?Q?aHDMioifz/XnvQNIg5kOTI9EKtIHrB8Bu7LnTbMvis2nSJCaNl2g9gptof4i?=
 =?us-ascii?Q?7VvMhBFfHatpuTevU5VNQl9cZlSkjAf2mgR02TOmERJv0K2Kr50IbY3kCQ20?=
 =?us-ascii?Q?iycz1ugFAlwZLHDgpWytb+kj928wncWi6rtC268sgv766J2D1fVqjcIKiSkn?=
 =?us-ascii?Q?6JAWP6jRhtaNhqMgJh3Ii4FnRV7d4fumhhTOVViAB5E5o/c122sRZI4dNeIC?=
 =?us-ascii?Q?pvD4bi+vUUvirF1zE3dXa7N1Yh5z7aGnL2yNdFgNoVr2fU0s+KEAmZJMRpdh?=
 =?us-ascii?Q?djgrZc9csVBez3j2e31L9KUfe+qZpl77Tg6aNZXaTu5EjG2u94RV1sl1cELp?=
 =?us-ascii?Q?Bfw+hQLQYodKdp5FB+uprHFgLxgqmDZYGL6x1yc8e0wFSp6+eqTYMQZD6GeM?=
 =?us-ascii?Q?aU9uGB7uRUa2+TIRqCvrAEsLoDyKAf5EMZFiyzQ6O4kXPdfDsn7SjxlzECkC?=
 =?us-ascii?Q?Oic4ez1cH1bTivQlc0wb60imXRnMgxOQh13RhulRS3vC4odi34iZ82kIZ0Sh?=
 =?us-ascii?Q?SmzqxtDhvwYhthros4nmYdaCfZj9Scl7Cqmg8CZcMDeT+lj/FuVe9EI3eD58?=
 =?us-ascii?Q?WCLO2s5nCmxk7zG4U6Iktp2486yHovRRkN5iYhsED2DIBW46QIHy3fHr//Ti?=
 =?us-ascii?Q?FOdUFeOO/WrjP4z3GgYWTvHiolaN67ue8z1YXieFh8hajTnJgIuIeh8aMpDI?=
 =?us-ascii?Q?BvPOTp3POrkCZ9goy+NKYKd3s9Hktc5Yu8SFMD5g/u0UHKYv4PD7XxP94EKS?=
 =?us-ascii?Q?THd1vBF+PNOpbzajox4TPMWVg0x7mEIpv9uWSgBoiRXfDk/o9mWgWpPc5g4?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4ee5ed-06c4-4160-64cf-08ddf531d86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 15:00:58.9293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR02MB10598
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

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Tuesday, September 16, =
2025 1:31 AM
>=20
> Hi
>=20
> Am 09.09.25 um 05:29 schrieb Michael Kelley:
> > From: Michael Kelley Sent: Thursday, September 4, 2025 10:36 PM
> >> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, Septembe=
r 4, 2025 7:56 AM
> >>> Compositors often depend on vblanks to limit their display-update
> >>> rate. Without, they see vblank events ASAP, which breaks the rate-
> >>> limit feature. This creates high CPU overhead. It is especially a
> >>> problem with virtual devices with fast framebuffer access.
> >>>
> >>> The series moves vkms' vblank timer to DRM and converts the hyperv
> >>> DRM driver. An earlier version of this series contains examples of
> >>> other updated drivers. In principle, any DRM driver without vblank
> >>> hardware can use the timer.
> >> I've tested this patch set in a Hyper-V guest against the linux-next20=
250829
> >> kernel. All looks good. Results and perf are the same as reported here=
 [4].
> >> So far I haven't seen the "vblank timer overrun" error, which is consi=
stent
> >> with the changes you made since my earlier testing. I'll keep running =
this
> >> test kernel for a while to see if anything anomalous occurs.
> > As I continued to run with this patch set, I got a single occurrence of=
 this
> > WARN_ON. I can't associate it with any particular action as I didn't no=
tice
> > it until well after it occurred.
>=20
> I've investigated. The stack trace comes from the kernel console's
> display update. It runs concurrently to the vblank timeout. What likely
> happens here is that the update code reads two values and in between,
> the vblank timeout updates them. So the update then compares an old and
> a new value; leading to an incorrect result with triggers the warning.
>=20
> I'll include a fix in the series' next iteration. But I also think that
> it's not critical. DRM's vblank helpers can usually deal with such proble=
ms.

Thanks! I'm giving your v4 series a try now. Good that the underlying
problem is not critical. But I was seeing the WARN_ON() output in
dmesg every few days (a total of 4 times now), and that's not really
acceptable even if everything continues to work correctly.

Michael
