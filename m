Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A169FA95930
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 00:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773F710E008;
	Mon, 21 Apr 2025 22:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Lij8pNxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azolkn19010012.outbound.protection.outlook.com [52.103.10.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6B210E008
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 22:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ8SXm29Q+31yU5v+7v+vLJYmbZ3nxWMuqDLrVi9+l/p48TVsf/h7GrTtX8e/dhnCqiq6T+/Z6r6Yzsmyq+saj5G42xXktaNjqgwMURvsAhYObyIDurnJaDHejViFdnO3fNXdFotvKDOsVl0JW2wz0gVBs20LXpCGzvEUZn5WtDpzRHZv/baiBYCA+kJnuE+1pj7ERvByvTjc3JqPkXBtZZtQ2gv71+o2jzfczcMncf2VsF7FQR7+uNjINUv61Lw6z/Gdgu71MI/JPlCBI3QpL6Cq5JZkavtswBNoLwG8Y7J/DtOcM8ozxcfJgaYf3dJOPeXuuxMqAq4irqyF8AjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dov7L8coyiOq9YXV0cKbGbXjpDd31qWZzXqClFNm+U8=;
 b=Lc6MOTTkhGRJWxtzm/fMxcDf/9lSeUfPh1OnGGvXanhFx/U50eAosbcKnjmcNMwMGH/lV1N8HSdOAm09i/d44VPzTZj4NWeaW6FCbctLnSAIhMdHlziGS0A1ZULgr/g9LiYkyqYmtsA5LDvCjuxIC6RJoLrVEUOwSsp7MYcFFYys/9zJ61ES0ItvKbDjlUz3NH7UMbVrEKEc/cqoVYqsm0XwJ3dlrSkNkebOJZ/oozi8pjJ03slk2zkcBjNl2NY3CZciMlLzWTwCQzz4x6h7a83k84kvyU6FB7W/KNxN6ck2TIj7wLPilHYcywPwSuccBM57yLV8FOScl0SjVcw7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dov7L8coyiOq9YXV0cKbGbXjpDd31qWZzXqClFNm+U8=;
 b=Lij8pNxz2NJ6HJz5LQh47ncAgHT7wxs25ironhFhWJuwNW7aeBd8FrUJer4xLg21jHsMG9V42zzQHXrfDLT5JqtANH34SvwoFoJGKQmRDWj4airy1S6kwC5OYrTl55yIbLxk6YCh7jlN00uUWmEBMmpjrHwgwos9y2zzNQ/3znSy87T974D+ZkFvYfSLHiCGdOHOhr9TCjX8L4lRweF/eWuUBJvOJT8RutDmh16mmiICxR+8F8qHugJBzkXS9K0aHqMQ+9xO5TlHV2Kj+PIO9A5tX81imhV95eriMbKmD20CTSa8vPdAHM4D3Zi7fqGHZ80Up7HH69O64nTCAGToHg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by MN2PR02MB6654.namprd02.prod.outlook.com (2603:10b6:208:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Mon, 21 Apr
 2025 22:23:13 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.8678.015; Mon, 21 Apr 2025
 22:23:13 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: "arnd@arndb.de" <arnd@arndb.de>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Regarding commit a07b50d80ab62 ("hyperv: avoid dependency on
 screen_info")
Thread-Topic: Regarding commit a07b50d80ab62 ("hyperv: avoid dependency on
 screen_info")
Thread-Index: AduzBoEuwPRBjIwYTS+qO2GGKK8Jzw==
Date: Mon, 21 Apr 2025 22:23:13 +0000
Message-ID: <SN6PR02MB4157149AAF2DBDFD271C21C3D4B82@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|MN2PR02MB6654:EE_
x-ms-office365-filtering-correlation-id: 2588ebaf-9c80-452e-1bd9-08dd81231af8
x-ms-exchange-slblob-mailprops: obhAqMD0nT+Low/KBlUSJz3r0Ahd/UBo33XhNQ1s2nBk1degmJPn37nxYx3wn3GeubYsyf4iYwpGW8NP2+krzRm2jR3F3jolMSTX7NKLlXvpMPDrJGGefwaHiKzJKtxnGZXBcApRJPMNkJMbAS8yWAKQs3cjUclXeZ3z93DX6fu3WffhThIwzCfk5z6aKJCnwtRHXdAe+FYdp7sT8aiqc6XUMp/nBHlcJCKNWeIErl21/kfrBkEMzcBQyEq0T5qr3i4WHLUM6QhH/3MrvR37lnAOlyUiZDZgqdbCNHiNLg5aSEylorKv6bwhIYYWJFxNkLHAuGL3wdsZ7vyEirBhbsFSPAdCcyjiX5gVF8Hy7YRy0fdm8J0mPRzjntUUKco5wGMcBYQbFbgpgsHqXfntDcA+rGvHLAZvyHv1BvhCsIUVzcT5Ft6Om7XOO7Sve4iFK/xK7SkoGp8JNGqJEtn96Eh61rcKJgWczOq5yqvBvrKGUzKlBlUy7IhhY/Cn1dljWmWmZMHwgJV7ekX1LpzsFIOBP2cypihov+Rbu1kcy2dXRQtEzaUIIia8dkpWmXLoabW30y0MLUES+BLZ4e530oAOEK0uJLWPaM1uGErWokzeFvjlhOTKLdH3hw6kjKlSik/vqr9vuWcuU8tTQaSvZ0u3Y7o40qYEa4Y4lzzqC+AiEIG4KmP87lhzTpT5/Qb0YCjqSHoj7db8B1jeq1bHUy9q2z4fZHY0rRKIZALUWPYmAerCJ5Odjkop/g2D276EUi30KN+R62zOu+AlZVzglgYzs8LSJPaWxwgUpDNoS2y8YpXBlSW/zilfycGwM45Q
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|12121999004|8060799006|19110799003|15080799006|5062599005|8062599003|102099032|1602099012|10035399004|3412199025|440099028|4302099013;
x-microsoft-antispam-message-info: =?us-ascii?Q?HWcE2lPSoD4pVEF1aBqvxRCdqBWLP0zdyvVAjdgS+q6MwwjpBJdUZ6KjnQ6R?=
 =?us-ascii?Q?9Rd2cOcDXgmzqKTkmXWiUKCFsC2br30j2mdUIComNjg4W9Jtcr4bywgGcgfw?=
 =?us-ascii?Q?8Z9nU3O01RXmpTmxRnM6H/ddyhCFCZ0LIuyzEDyeIVckX+j5EYyFeei5Khb8?=
 =?us-ascii?Q?q6hvgo48yXQMxBZIoMobtfzoMggLAI3Iqm5X49wVSzxCX+0yMSW61DiRpipL?=
 =?us-ascii?Q?qLXc21xeAiIvJw8GMmyjMifD610c84KMFXLI9py2f19a1Bu6AksHkPopbCBH?=
 =?us-ascii?Q?qS2vGAPgQColGS/PbTeTUjFpifjBTT5IaFge2q6qzY2rQReaBXyBrk+YizM2?=
 =?us-ascii?Q?HzmvwJWVABXngX3PsGcg8dIoBXvA3kWcF9ZUhuC8W61/KgrFCe9/CEhYTVCS?=
 =?us-ascii?Q?GXSy275dn9XKJeALEtkHEP9xYbQ+4ZwDJ0P4eMcTeymU5w7zsXBvSeQyYzVd?=
 =?us-ascii?Q?DUlltL0bmQJnoaFsOERYm/Jrjtjs2ZBJoz4/wPcvVVUeU+14mKZ7A0c+pq45?=
 =?us-ascii?Q?RQJq7R+7dDGu3slIze7vBQwHLU4MVUEkiw6V/Mk+JlyhL1uvrhH/QOazKwPV?=
 =?us-ascii?Q?XZJjxKZOI+wVINxCnM3Vp8woz6g8GLfKNbUxKvTcRxzqIGcoytUxpz6cwTit?=
 =?us-ascii?Q?7fReEPClXCrbuTBDSB2YptHMvY9QSWyNdK62l7bwjcKksr/k0E2qfa8dv3nZ?=
 =?us-ascii?Q?ySP61j8jMGbetXnzhT41JZIOwSAcJIo2ZOjbeJR7JnCL1Kzi99jT/V1LOSOc?=
 =?us-ascii?Q?TqTDSACUJMlewa6vpjouEIhpv/4JYGmkRGFMRHEJfYimpVXca0bearsPN08w?=
 =?us-ascii?Q?1uz6iD+G79wIfxHGR2I/D16byanC+tIqqC3XVN8s1/QRMa9cA/naaq9g41Ki?=
 =?us-ascii?Q?rJjxZh7kqRmO/bHReE35RJgWh3JKoiJoCXQ3riq1Z9GI2XJ7H/cRWUR2Fxa+?=
 =?us-ascii?Q?jMkNt3gX0ciDQtkqdFzY2e/MH0RLvSjyf/eGqJvOMMEjRS9dTOVNEqtgUsOs?=
 =?us-ascii?Q?cffku7sk00+597J7v3WZ3tbmsyq0+ZCW3KMTT4sgwDCi9LMseeFWJhkIITqv?=
 =?us-ascii?Q?OEZiEWYpatKINaNRU9bMb/05VyUYMf8EHC07XouQp/NbJ9tcQn/IGGfIAhDc?=
 =?us-ascii?Q?KXbckl8R1L/GxzzfzvX6lUzg7OFNZCClpSYLJOHliVJ6hLmkWvU/SqbOWArh?=
 =?us-ascii?Q?cWLPJ69LScHK4BtwjFi3GIIW4GQfOWh7qdazn1oweXw7LrFaMGr6/Qq58DxT?=
 =?us-ascii?Q?5sV13wfvHQ41B0cAmhUYJcwaXnmeD+qLnC6empilumxKx9FortBg3m0krn1O?=
 =?us-ascii?Q?c3x9Shjs06CWq7bHlIaY00eW?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iHjf8tXKjruwiw3WTkD+Wlg0Wwc2MYb2CvVCP+r7Q9rdXq1QVXDITlFgRiwJ?=
 =?us-ascii?Q?Ofek48sLYZn1q95Y83kPJa6GGA2HA8Sw5djYevm4sWWzUJJxKAzLUlyJJzmb?=
 =?us-ascii?Q?MHUTL6p0KR6rYRc47s2rg4A2B3TfiU0yc0Wz7T9yUVvYYntxHyDELnG73wzE?=
 =?us-ascii?Q?3U/cNmnCqQr70hoeOhoChFAF3Qr9XhX8d5cXggHT3t9/YjE2g5n8SYJFDpq6?=
 =?us-ascii?Q?+7VdWDHfVbxT1s+0oNdi2mgnOs0Mc1REx6k20kgC0MVqR0FTvovZwey0tSjz?=
 =?us-ascii?Q?gTCEauDrz8/8MKUL/wL5TCo/JuTXiFE7sqriFCXWEXV1bAt8WJbtBgxkJPBB?=
 =?us-ascii?Q?B6PKChx4cAVSJVupbRDuse0/jUzY1cAs9lm7/691PTjuBNX/Xer4vpbXzUnY?=
 =?us-ascii?Q?S/56A0eWNAirlSvhfcU1DyAAQnr5aV+zmgXkf8DiKuCwvfUVCvtRdr/14+5a?=
 =?us-ascii?Q?OwKvvmsZlVmUbqeyfqdACeUHm9EdtVWeR/JViUO9Bb1Kfm7hrr492v7ZQJNf?=
 =?us-ascii?Q?LPyem4PrAZd5YhkIgKH3XvpXRG/JTN/vYAS7KPltW7p4f7LJ5McUMrAwp3lE?=
 =?us-ascii?Q?p35YdH4/wPAdPluaJxmYLAF+h956QaO+PWIL+2+ntIgnsXL19glkAbVvhawn?=
 =?us-ascii?Q?21ajuYZAOz+N67NpHAMAXel5M/dOz7CG3kMG13+xRUgFptrvuzUTyBo7ygQK?=
 =?us-ascii?Q?SKuYtkQrKdCcB5f83Rdnll+xXAtBHlYaGzv0zLJfHsjOuWUn6gxo0QBRHQNV?=
 =?us-ascii?Q?j1mnTPIy4bna7H0CUNwe4aRXOEcD1XS94qXD4sEqny38wctwleRtV+/tFRRK?=
 =?us-ascii?Q?IJ0EBi+sbLmqT16jMe0d7519z23qxx/pYEwjkEkZQNmjRGnMxUlD/ZtYxn4k?=
 =?us-ascii?Q?1gKfJIxj5N//ZVugOPmLN/c8VPRjSKm9uE3pVRrK5UWVnzIDhD3K/isibh9c?=
 =?us-ascii?Q?QDt3IP5pnIhfLO1wlwivKKXHcsxkj/gKlKaB7vugtHLY340rDEzjt/ReDKKb?=
 =?us-ascii?Q?Gdx8ElPaeTowMSdRTc6XAwLM8Y9iIX1IWOLRIj5FNvZx8mrTO2qXML1m4saT?=
 =?us-ascii?Q?PjUGatgZjToQtYPwtJ3DQ7rTCabUFarQIypUd8EbcvMh2E1BsW30AxZQWPav?=
 =?us-ascii?Q?v+qhBOkFGSAmCayDXBCwRp6lREgHP3bFz8tSdTGS6x3WLELvaVH5huzuA48p?=
 =?us-ascii?Q?9PWwfHcYgo1CAR0LTDugcM5t6E7Wd1iHkWJBFZY7EzuehAxL2bGPGHkzLsk?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2588ebaf-9c80-452e-1bd9-08dd81231af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 22:23:13.2283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6654
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

Arnd --

Your commit a07b50d80ab62 ("hyperv: avoid dependency on screen_info") [1]
introduced a subtle bug. The commit message says, in part:

   Similarly, the vmbus_drv code marks the original EFI framebuffer as
   reserved, but this is not required if there is no sysfb.

This statement turns out to be false. In a Generation 2 VM, if it is not
reserved, a PCI-passthru NVMe device that contains the OS partition can
try to use the framebuffer's MMIO space. Doing so causes Hyper-V to
report an error to Linux when Linux is probing the NVMe device. The
OS disk fails to get setup, and Linux then fails to boot in the VM.

Hyper-V VM configurations with a PCI-passthru NVMe device as the
OS disk are relatively rare at the moment, and the Linux images
for the Azure cloud usually have CONFIG_FB_EFI=3Dy, so that
CONFIG_SYSFB is "y". So the problem hasn't typically shown up.
But PCI pass-thru NVMe OS disks will become increasingly common,
with the potential for boot failure if CONFIG_SYSFB is "n". I
recently stumbled across this problem, and it took a while to
figure out why my kernel wouldn't boot.

The Hyper-V host provides the guest with ACPI tables describing
the overall MMIO space available to the guest. But the location of
the Hyper-V synthetic framebuffer is only communicated to the guest
via screen_info. It's not in the ACPI tables. Maybe that's the real
underlying problem, but it is what it is.

I don't have a full perspective on your goals and status in making
screen_info more local to the sysfb helper code. So I'm soliciting
your input on how to solve this problem. I have two ideas to run
by you:

1) In Kconfig, have CONFIG_HYPERV select SYSFB. This way
Hyper-V guests will always have CONFIG_SYSFB=3Dy, even if none
of FB_VESA, FB_EFI, or SYSFB_SIMPLEFB is selected. The VMBus
driver will always properly reserve the MMIO space for the
synthetic framebuffer.

2) If #1 is objectionable, the next best thing is for the VMBus
driver to "guess" where the synthetic framebuffer is, and reserve
that MMIO space. The "guess" would be that the synthetic
framebuffer is always at the beginning of the MMIO space reported
in the ACPI tables, with a size of 8 MiB. That's what Hyper-V seems
to always do today, though it's not a guaranteed contract. But
that would prevent an NVMe device from trying to use that
MMIO space and failing. It's a hack but probably better than
leaving things as they currently are.

The problem can currently happen only on x86/x64 VMs,
but will probably be possible on arm64 VMs as well at some
point in the future.

Any input is appreciated.  Thanks.

Michael

[1] https://lore.kernel.org/linux-hyperv/20231009211845.3136536-9-arnd@kern=
el.org/
