Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B29AD28DC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 23:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA010E1E0;
	Mon,  9 Jun 2025 21:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 611 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jun 2025 21:37:24 UTC
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413410E1A6;
 Mon,  9 Jun 2025 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9BB70298562;
 Mon,  9 Jun 2025 23:27:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ET2xpdSYUI12; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 32565298566;
 Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VSRsIT4TuOoV; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E3468298562;
 Mon,  9 Jun 2025 23:27:09 +0200 (CEST)
Date: Mon, 9 Jun 2025 23:27:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Karthik Poosa <karthik.poosa@intel.com>, 
 Reuven Abliyev <reuven.abliyev@intel.com>, 
 Oren Weil <oren.jer.weil@intel.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
In-Reply-To: <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139
 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: THmojBJHtC1GOaAOJStu5UV1FSAWmA==
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Guenter Roeck" <linux@roeck-us.net>
>>> I am trying to boot from "pnor". It looks like the partition data (from
>>> devicetree)
>>> is now ignored. mtdblock6 used to be the second flash.
>>>
>>> Guenter
>>=20
>> Is this with CONFIG_MTD_PARTITIONED_MASTER?
>>=20
>=20
> Yes
>=20
>> I think that mtd_is_partition is ambiguous now.
>> We always have master partition when CONFIG_MTD_PARTITIONED_MASTER
>> is enabled and parent check is useless.
>> We must check grandparent in this case.
>> Miquel, am I right?
>>=20
>> We can return to older patch version that have created partition
>> instead of the master device.
>> Or try to fix mtd_is_partition, like below.
>> Guenter, is below patch helps?
>>=20
> No, it does not make a difference. Partitions are still not created.

Looks like all partition parsing is broken when CONFIG_MTD_PARTITIONED_MAST=
ER=3Dy is set.
Alexander, I was able to reproduce with MTDRAM and the mtdparts=3D kernel p=
arameter.
Build with CONFIG_MTD_MTDRAM=3Dy and CONFIG_MTD_PARTITIONED_MASTER=3Dy,
pass mtdparts=3D\"mtdram test device:256k(foo)ro,-(bar)\" to the kernel com=
mand line.

Before your change:
$ cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"
mtd1: 00040000 00020000 "foo"
mtd2: 003c0000 00020000 "bar"

After:
$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"

Hope this helps!

Thanks,
//richard
