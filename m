Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75991A1616D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 12:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5877110E05A;
	Sun, 19 Jan 2025 11:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198810E081;
 Fri, 17 Jan 2025 22:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0DFA02BA969;
 Fri, 17 Jan 2025 23:27:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PKRyMU3k07_p; Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9F2942BA97A;
 Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id w4ahg7LEgjAo; Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 67B8E2BA969;
 Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Date: Fri, 17 Jan 2025 23:27:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Alexander Usyskin <alexander.usyskin@intel.com>
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
Message-ID: <677101004.241399779.1737152836282.JavaMail.zimbra@nod.at>
In-Reply-To: <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
 <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133
 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMYgWoAgACDNgDMz5OtTg==
X-Mailman-Approved-At: Sun, 19 Jan 2025 11:46:42 +0000
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
>> > This streamlines device tree and allows to anchor
>> > runtime power management on master device in all cases.
>>=20
>> Please explain in more detail why this is needed.
>> If this change makes the overall situation better and breaks
>> no userspace, I'm happy. :-)
>>=20
>=20
> The rest of the series is a driver that need runtime power management.
> Absence of the master device breaks power management logic,
> as kernel automatically propagates state from children to parent.
> I initially hooked runtime_pm on chip auxiliary device, but this is a hac=
k,
> not a solution.

So, the problem is that mtd partitions don't have a common parent/master li=
ke
we have for generic disks?
Please give more details.
We have already a non-optimal situation in mtd and I want to fully understa=
nd
the requirements to get it this time right.

Thanks,
//richard
