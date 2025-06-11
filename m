Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B4AD51C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3C10E60A;
	Wed, 11 Jun 2025 10:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EC310E60A;
 Wed, 11 Jun 2025 10:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0BADA298569;
 Wed, 11 Jun 2025 12:26:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5-8g9srQQ1ss; Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4754329856B;
 Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Er3YZUgwoz17; Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1062B298569;
 Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Date: Wed, 11 Jun 2025 12:26:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
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
Message-ID: <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
In-Reply-To: <877c1ivcym.fsf@bootlin.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
 <877c1ivcym.fsf@bootlin.com>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139
 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: 1HQqhqcLtEdhoRxzAvXExqJX+VZLOg==
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
> Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
>> On 6/10/25 05:54, Richard Weinberger wrote:
>>> ----- Urspr=C3=BCngliche Mail -----
>>>> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
>>>> Richard, I've reproduced your setup (modulo that I must load mtdram ma=
nually)
>>>> and patch provided in this thread helps to fix the issue.
>>>> Can you apply and confirm?
>>> Yes, it fixes the issue here! :-)
>>>=20
>>
>> It doesn't seem to fix the issue if the partition data is in
>> devicetree.
>=20
> I had a look at the patch again. The whole mtd core makes assumptions on
> parenting, which is totally changed with this patch. There are so many
> creative ways this can break, I don't believe we are going to continue
> this route. I propose to revert the patch entirely for now. We need to
> find another approach, I'm sorry.

I think reverting is a valid option to consider if the issue turns out to b=
e
a "back to the drawing board" problem.
=20
> Alexander, can you please remind me what was your initial problem? I
> believe you needed to anchor runtime PM on the master device. Can you
> please elaborate again? Why taking the controller as source (the
> default, before your change) did not work? Also why was selecting
> MTD_PARTITIONED_MASTER not an option for you? I'm trying to get to the
> root of this change again, so we can find a solution fixing "the world"
> (fast) and in a second time a way to address your problem.

IIRC the problem is that depending on CONFIG_MTD_PARTITIONED_MASTER
won't fly as PM needs to work with any configuration.
And enforcing CONFIG_MTD_PARTITIONED_MASTER will break existing
setups because mtd id's will change.

On the other hand, how about placing the master device at the end
of the available mtd id space if CONFIG_MTD_PARTITIONED_MASTER=3Dn?
A bit hacky but IMHO worth a thought.

Thanks,
//richard
