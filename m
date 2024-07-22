Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692A93B1DF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6583C10E6C6;
	Wed, 24 Jul 2024 13:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2024 15:29:49 UTC
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5D810E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 15:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D89626196A4A;
 Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Qza8hDRPG0nx; Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3DB0E609184C;
 Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Q9HYSQTFU0cQ; Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 10D4E6196A4A;
 Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Date: Mon, 22 Jul 2024 17:21:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Knop Ryszard <ryszard.knop@intel.com>
Message-ID: <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
In-Reply-To: <20240719152542.1554440-1-jfalempe@redhat.com>
References: <20240719152542.1554440-1-jfalempe@redhat.com>
Subject: Re: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdoops: Fix kmsgdump parameter renaming.
Thread-Index: TphXISdImxx2iJrcLR4C9m8Leyhpgw==
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:47 +0000
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
> Betreff: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.

> When the kmsg_dumper callback parameter changed, the reason variable
> in mtdoops_do_dump() was not updated accordingly.
> This breaks the build with mtdoops.
>=20
> Fixes: e1a261ba599e ("printk: Add a short description string to kmsg_dump=
()")
> Reported-by: Knop Ryszard <ryszard.knop@intel.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>=20
> The offended commit is in the drm-misc tree, because it was needed
> by drm_panic. So I will push the fix there too.
>=20
> drivers/mtd/mtdoops.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 86d49db9196d..7bf3777e1f13 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -305,7 +305,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumpe=
r,
> =09struct kmsg_dump_iter iter;
>=20
> =09/* Only dump oopses if dump_oops is set */
> -=09if (reason =3D=3D KMSG_DUMP_OOPS && !dump_oops)
> +=09if (detail->reason =3D=3D KMSG_DUMP_OOPS && !dump_oops)
> =09=09return;
>=20
> =09kmsg_dump_rewind(&iter);
> @@ -317,7 +317,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumpe=
r,
> =09=09=09     record_size - sizeof(struct mtdoops_hdr), NULL);
> =09clear_bit(0, &cxt->oops_buf_busy);
>=20
> -=09if (reason !=3D KMSG_DUMP_OOPS) {
> +=09if (detail->reason !=3D KMSG_DUMP_OOPS) {

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
