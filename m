Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399226B88E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 04:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DFC89137;
	Tue, 14 Mar 2023 03:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CBD10E171;
 Tue, 14 Mar 2023 03:15:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbJZ82sWZz4x5R;
 Tue, 14 Mar 2023 14:15:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1678763747;
 bh=KSADoenAgzSnKy+RQdKV2zwna3rfSqngrSgB0T9tHy0=;
 h=Date:From:To:Cc:Subject:From;
 b=Zs7Fx88P/NsPEEjDBF1mGnAiw6Ikk9b9CbZtE4Ckj5enUKexO1WYvbXaMJwgtMHP3
 8Ok78Sjt+I6e98rHALWABF2wOVHfq1vEQ14oRihItSrq0J/TzMmnWMEngzWHu88AZa
 3HSWDz2aoGBPOBaPBVncBGK0un8kPs6IQTjMTRTn89P2hVt2BjrDoL5oRqgWXCS/nO
 GKZVGwc/ke/bl2rrp4zCK5F7h/vmw2CvIb5z+RULvWqA2vSNwjRD8NiBf6xAHDF2gm
 Qm4j0UVr9rigWoA1hA0b7Y7GBCSA+dzVGb9eE2nUr3lk5b6wop8mpbDvv9AT91uzVu
 wUdS7blE359mw==
Date: Tue, 14 Mar 2023 14:15:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20230314141542.27f58cd3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//wq1XB9b/y4Fw8hI2rDVLIN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//wq1XB9b/y4Fw8hI2rDVLIN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/scheduler/sched_main.c:738: warning: Excess function parame=
ter 'file_private' description in 'drm_sched_job_add_syncobj_dependency'
drivers/gpu/drm/scheduler/sched_main.c:738: warning: Function parameter or =
member 'file' not described in 'drm_sched_job_add_syncobj_dependency'
drivers/gpu/drm/scheduler/sched_main.c:738: warning: Excess function parame=
ter 'file_private' description in 'drm_sched_job_add_syncobj_dependency'

Introduced by commit

  c087bbb6d84e ("drm/sched: Create wrapper to add a syncobj dependency to j=
ob")

--=20
Cheers,
Stephen Rothwell

--Sig_//wq1XB9b/y4Fw8hI2rDVLIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQP5t4ACgkQAVBC80lX
0GxMPwf/VkBlWHZG+siS4gQwpFK71dS16SNjfqYDuspoMA9Zjci0t+NJUBrwjDsm
U+F00xYHzSI6aVBwrKFctDn071RpzJhcSgEunGGss7wkNK5hjxcaKncKpthDPk0n
uoMQcfoSxyvW1lRGipZ2ozLLfz3S3JlORjvk7V0zQXe5D/GfG6v2yDV7vmT7PLk+
DLBeVXfqgUwEUaUfaG351Gt/pJYsr699f6ZQ0GW0aNVmRdcO1fwJI2XTtV70YnpK
0Z/4DSPg3HOBkPCwSz4H7L/WVoZ1vVGJiAyxSwDcDAFbQZmZEGeFSDvZFc9Mr9/o
Abm5OLeXp74XrBZwMtdsgOf7JCO6Bw==
=TetA
-----END PGP SIGNATURE-----

--Sig_//wq1XB9b/y4Fw8hI2rDVLIN--
