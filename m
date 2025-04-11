Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE29A8521C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 05:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C3A10EAAA;
	Fri, 11 Apr 2025 03:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="mqX7EutZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19012066.outbound.protection.outlook.com
 [52.103.14.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0010EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 03:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnE4pdJb9Xev4Fs+O+x2oKVLliGjAcSs2Df1UTmhXLN/bPeo2AtaMmOATZdjHwOFRJfi/E4ZB42QfLJPzlPXG1tafNdkJ5VCTN8iMvXRP7BGCr/6OgMbZJgrLNLvoNK5lJqu0BkepoRqAza0Kq5wgu2rvWCSiIV4xJLoDUSLsPmjIelTjr7FGudhNv2tdUVpDdNbGr2ppFlZJJzcJfi0x4fg5Mxxpm4VeA39GHwUEtBRG5JBt/lm9vgaJQ/3JHSwXYlXcDSBzjTFCrPNN/U+pHpjTTBqMNqZ/WoM0ARoZWio+EfU0Xl/tHnE033PrlzyEfIqv8LZFvVgbRx3jIrjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt/5zcr6eFBurcL4qIjfjkOaoO/zG8lmS5Ba9TVKDas=;
 b=EVrQLpSASPIOMpnBBp4xHVaQzAgeB0PxV9On8vXIgYZt1GPNq2zs9FSB/rLevTeZ8Z14duvR5ocTa9g29dwW1xsYhlly1KQ+PQPEw14NodGypDyEsDYwBj7fGpkePDC88aehmYrMHbpFWcnptHeDkBa7/3KMb2IiI+MaZIzLWqrEluNczpDk2pt3HllAy0/y3pyanTFQuz8uCir4C28XPjbYrTWQXnyFupEwET+U+N3a0rdZlNuPzE6nYGyPjLpsbK92Avso38LI1YrJ+ZfsAktenMZ30YpAn2nOq8BL2eqdzzFyKpYC3ia0IkHxJ3NrFwGO48R/3SDEKQwkDkr1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt/5zcr6eFBurcL4qIjfjkOaoO/zG8lmS5Ba9TVKDas=;
 b=mqX7EutZ9uJE7GyrYso5Q3DLzfWHeKws/Zi6YlPFw5LnMPGiK3rQGBcWCIHZgdOUsgVxTOFeKRfpHctvf0Xq+brnkW0YjtJZdIqDzvUosa7kpxZTPaz/f6zsW+kE4WcTbswV0DkGmEt4bp5BORH9WSwn+MlaKzwuvlbNTfyqpKJvYz3heTy3uEh/ut3NkVdxkOU8QmvM/ptnOFIKUbEnIapQO4Gj7sn1NE1FdT1iOqviJU+4y9nTiowki+WJnMVp3VOUcQEPM6s0+bSyB8VN/dsN94nnPzYwmagqneVrMR9wsSL6uUcoPvRmhqRj9rDA9XN9YsI6uJFdm9wli2WcJQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BN0PR02MB8079.namprd02.prod.outlook.com (2603:10b6:408:16d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 03:40:26 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 03:40:25 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Christoph Hellwig <hch@lst.de>
CC: "jayalk@intworks.biz" <jayalk@intworks.biz>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "deller@gmx.de" <deller@gmx.de>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "weh@microsoft.com" <weh@microsoft.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [PATCH 1/3] mm: Export vmf_insert_mixed_mkwrite()
Thread-Topic: [PATCH 1/3] mm: Export vmf_insert_mixed_mkwrite()
Thread-Index: AQHbqLVG4gQYXeGx+0WuiyyYTOsIQrObKMgAgAAqdVCAATOPAIAA4O6Q
Date: Fri, 11 Apr 2025 03:40:25 +0000
Message-ID: <SN6PR02MB4157209BE242E68F85908126D4B62@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250408183646.1410-1-mhklinux@outlook.com>
 <20250408183646.1410-2-mhklinux@outlook.com> <20250409104942.GA5572@lst.de>
 <BN7PR02MB4148597D0495C631F6E3F8C0D4B42@BN7PR02MB4148.namprd02.prod.outlook.com>
 <20250410074228.GA680@lst.de>
In-Reply-To: <20250410074228.GA680@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BN0PR02MB8079:EE_
x-ms-office365-filtering-correlation-id: 70de240b-8495-4145-4b05-08dd78aa98a0
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|8062599003|19110799003|8060799006|461199028|440099028|3412199025|102099032|41001999003|30101999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?piMvZp3x3efauoofOwy1gquUfUpqqK6A6ziF8deoj/w/UKGSCZVRTNYKpvn6?=
 =?us-ascii?Q?6ix3GDahi9WdX9TzwCKXwPHHHxwBraEvuE1Iro8+qgixIYs/4lGXyKmjUouN?=
 =?us-ascii?Q?CzUQwbE1pBp9H1gTGjdV2hveevzrcAOOFDctcnNtt1aFDp50KWKM1Ikr/O3q?=
 =?us-ascii?Q?H/EWvsATMdAlQIgw2RFqyw5nhDfwT1ncNKEI30L78bqwFfIGv6X/mVfcBDBY?=
 =?us-ascii?Q?n0enHruBACcKnFLmT0sYMj4gfxI32+lKcW8MS4L2Hc/lQSxwtqNYB7IPkyzf?=
 =?us-ascii?Q?JrmAs/g+R39Vt2N172A6ExvOHaWtF4oISTEQXt9XuyyMwWsOCByFw9JWmEav?=
 =?us-ascii?Q?rzWlJfUATakfnZg+NGAX62ftMEQFyUvTvtIe1hDWBgD/KF7Z8cysdLyK5kal?=
 =?us-ascii?Q?xi84pjzw5977e/T4M7/7ifK13+ojAK8MQefZbNIDzMHI/32jJp/F5mf3PLts?=
 =?us-ascii?Q?eh5HfR5IErM83T/EokyLTtY8qTv/0Suky1a2gMuc2kFqP0fQHhAQewmypkQo?=
 =?us-ascii?Q?VPbA4dWIsdowBvvjg7eskw5SkgESS95hz85xmarsOkIojyTL0KYgq7n6WKLV?=
 =?us-ascii?Q?qKqshhgQApzu96KpLfBwk08G8HZGhkdPVCUXuugQbD0vwq0xNTpP2DBi4eZc?=
 =?us-ascii?Q?IrqknXwm8kFD0SGrhuWr6+EFzzj1c2vSoCiOnh6nuoD7LV7t2Hy/H0bZZMdg?=
 =?us-ascii?Q?TxKlO/GjUB26FqVHPjVwELdrqTaKhb6jR0E9PcWbN+XCVdH9DGt4xgFYx8Om?=
 =?us-ascii?Q?N7nAftAKHjycpmew4zjyZYApqeT5n8DWF52gztzrODt+YOQpkPZEW+CVLOy3?=
 =?us-ascii?Q?O08W2bCYgGCS+HykVgNPw4XLhNMNsv4wM/Csy7VxWf5FyFpuLvtoznOdI8mI?=
 =?us-ascii?Q?18rUiZMxhSdQ73AtF+i2I4YcqSuhnzdy74WwkNZC1uN+j8eSKdHLiA85BRg8?=
 =?us-ascii?Q?xPwglqCfWG/pFoG+QjarXFjpaIzCx9vV5Ov32NvMUJQhset5/42/jnYmXK5H?=
 =?us-ascii?Q?Nz6pHIejs9IdfbeUWTKyRXVMNjANWLTnXIbQUnaVPqfIbufp0QiDTjf/WK4+?=
 =?us-ascii?Q?TkbNDFefjmo71AeRI5Ma+Bbb1M1Wy1qqomFsF5K/ngtVYD42ga/tjuDdehgz?=
 =?us-ascii?Q?4S0mdgWoby44zeaI5HHhUvFChzYdB+pcqg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQYojQIz0Q0tsFZdI7kc7+aZoNbDEJ0ZClWbZ5VZf+FX5q7yz20va6rxt4vh?=
 =?us-ascii?Q?J8g+w711MQXVmiaV+P6Hqkh2pI5fQRiGr5p8Lu+TXGmVwkPlsypo6gFpWmuE?=
 =?us-ascii?Q?ZZ+VGWHmrcD5AG++VcypmrxLR+oMIvfmrzpQZv0K1J8BltXNm8uRVGYsrTqR?=
 =?us-ascii?Q?fCqrfBc0zReaMLTrxBFuUX9MKLdAlkO6ODk8IMBq+kGAofEb48xf3ru7VPM5?=
 =?us-ascii?Q?NfkJ9QMkyZzwIIewkS4R5LvfBk81NF09Nz1VGMsBnzhHXyF7rClZwsACQAqm?=
 =?us-ascii?Q?qGiIPuoeV+8cMdk8RtVucJ10R9EyVhTe94QiZjE33LMUyd1kRzQRCVDgib7A?=
 =?us-ascii?Q?PBOi405Z7z4NxPgeKLpNEQhOvQNqCU6aiSz1otQQLQBkKQHuYi+08n/jnXX4?=
 =?us-ascii?Q?Zsb37zGZex3g3Tf/yqB+3UBOhdmZrG+U+2vCb3FEKGowxw57aXkC/9Vppt6d?=
 =?us-ascii?Q?DdJb+f4IFm4Y581h0xgWNXRVBcTKl6QQrROb/LGVZRduB+ZSvzrm2ZsGA7aR?=
 =?us-ascii?Q?ISSCg9tWU2wis1hzoHbNhpilsV83ljr+/fWVDTjVlJf7ZdmPJyOZS9GM+m1B?=
 =?us-ascii?Q?EAbNtAFGnq2nFRhijfnmK1n4k/zW4b81iIuxPTxMIaSo1ODWE9j792xDemT4?=
 =?us-ascii?Q?XvRlgKcIouaxyfYalVtXDRWPb14YJTw4hEilhqXF9MvaQYrXmF+c+ke6FDc/?=
 =?us-ascii?Q?tqdhJdeE1SpKYBRN/6E0teOUxfJKjCA58nboLZ8kVsQtEgFR2ETAR/rifVqP?=
 =?us-ascii?Q?xW80wSt/BYWU0GnI6dRLYRav6i5jxFIXRNTBTfPVo/os2saGlNet772CXRmL?=
 =?us-ascii?Q?EaZZ816Uesnkkeyzs2VidFSRKC5/NXYHOALN3N+fStOexc0ET5YYGdkrzmiE?=
 =?us-ascii?Q?G0Zo+ESefUJMAh4luoDu3SPz2te6EdNQ/0VCEue3MI7mouOAGy4SbLOibLig?=
 =?us-ascii?Q?MfqVlVa/ZF9YeShdR+tvUyBw8D7vsWyIvTQpSILycsEPiu102pcJWudsEoZt?=
 =?us-ascii?Q?LtLF4uTgcOF0WGZPMOEvYlFRnjTR9khdU/CFf+fTH24O+s3dFtIfFV054ubx?=
 =?us-ascii?Q?yCchZSwjt7t20Rkk0rdXbDG25hiIgoZVNJFvIk3STmB+bak4eJPg/NM54Ykh?=
 =?us-ascii?Q?UiGTHgEo7DCtaNPB4fffs7Wu+TNfdRLXERK99onVnigLdJSn8YcE6q37lBGE?=
 =?us-ascii?Q?4RSBByUwg/IT8sGT+2GsSyfOjqn+WGLCCXPSH1ASsZjqBiiwZekJW2QOVBo?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70de240b-8495-4145-4b05-08dd78aa98a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 03:40:25.6298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8079
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

From: Christoph Hellwig <hch@lst.de> Sent: Thursday, April 10, 2025 12:42 A=
M
>=20
> On Wed, Apr 09, 2025 at 02:10:26PM +0000, Michael Kelley wrote:
> > Hmmm. What's the reference to "as told last time"? I don't think I've h=
ad
> > this conversation before.
>=20
> Hmm, there was a conversation about deferred I/O, and I remember the
> drm folks even defending their abuse of vmalloc_to_page on dma coherent
> memory against the documentation in the most silly way.  Maybe that was
> a different discussion of the same thing.

Yes, must have been a different discussion.

Turns out the hyperv_fb driver in a different configuration *is* using
dma_alloc_coherent() to get framebuffer memory, which is then managed
by deferred I/O. dma_alloc_coherent() is used as a wrapper around
cma_alloc() but only when the framebuffer size is > 4 MiB. The deferred
I/O code doesn't do vmalloc_to_page() since the CPU address from
dma_alloc_coherent() isn't a vmalloc addr.

That combo works OK, so wasn't something to be fixed in this patch set.
I'll see about a separate patch to just use cma_alloc() directly for that
case, though cma_alloc() and cma_release() would need to be EXPORTed.

>=20
> >
> > For the hyperv_fb driver, the memory in question is allocated with a di=
rect call
> > to alloc_pages(), not via dma_alloc_coherent(). There's no DMA in this =
scenario.
> > The memory is shared with the Hyper-V host and designated as the memory
> > for the virtual framebuffer device. It is then mapped into user space u=
sing the
> > mmap() system call against /dev/fb0. User space writes to the memory ar=
e
> > eventually (and I omit the details) picked up by the Hyper-V host and d=
isplayed.
>=20
> Oh, great.
>=20
> > Is your point that memory dma_alloc_coherent() memory must be treated a=
s
> > a black box, and can't be deconstructed into individual pages? If so, t=
hat makes
> > sense to me.
>=20
> Yes.

I'll add some comments to the fbdev deferred I/O code saying not to use it
with a framebuffer allocated with dma_alloc_coherent().

Thanks,

Michael

>=20
> > But must the same treatment be applied to memory from
> > alloc_pages()? This is where I need some education.
>=20
> No, that's just fine.

