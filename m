Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A03B69C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FF66F41C;
	Wed, 18 Sep 2019 17:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 644966F41C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 17:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 2989C10A3783;
 Wed, 18 Sep 2019 10:41:57 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id txZJ2yIxTW_3; Wed, 18 Sep 2019 10:41:55 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 8CCD010A37A1;
 Wed, 18 Sep 2019 10:41:55 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id B002D2FE2E29; Wed, 18 Sep 2019 10:41:56 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/v3d: don't leak bin job if v3d_job_init fails.
In-Reply-To: <20190916071125.5255-1-itoral@igalia.com>
References: <20190916071125.5255-1-itoral@igalia.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Wed, 18 Sep 2019 10:41:53 -0700
Message-ID: <87tv99ec2m.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Iago Toral Quiroga <itoral@igalia.com>
Content-Type: multipart/mixed; boundary="===============0520173029=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0520173029==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Iago Toral Quiroga <itoral@igalia.com> writes:

> If the initialization of the job fails we need to kfree() it
> before returning.
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>

Applied to drm-misc-next with a fixes tag for the commit that introduced
the bug.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl2CbGEACgkQtdYpNtH8
nujetQ//fqWxTwM81T9xCuIlJ9ZEc4JxJJQBp8DHSzLrdg68kZBAbf2CwR7a+Oez
QYCucqCBeuRwrniTHSYyC/0tplQwXkJmOA/F3UpNL90/mAx6+qX/glBdBGoICM+k
qymbG+FZrGGYRbPLJjKvMSFIIAF3AHeGR6J0cVKcIxAdqK8JyGGwCkmACRZqlR7x
M1IdbMJvtYC/ILDpVwxmIP9QI6V9xZpBDoQCyiiBdaGDhNBTo9fwgH5Pe5f4hX9m
uAT4SjbhCB+kMOjV8F0osxFGkfVfxDbrXOFvUcA8JgKzAFaoQE2MFS1yXiYkZTwF
Sawo99p+WIu04hfenhUfySmwiFVuV9nAoVpTQUGr/4qFsSD3//FBXNC5ug+45VLg
F013EhiMaCSVuZe/e+6hT+2cLy4wC4t2/5+OBDQojB8jgip3qjt7pliQBU4/aQRV
9YfZjGD55CCC8yA5wZeiATi2V9OLjU6d6v04n+BJO49wRKtQRESE8ae/U6StyxAh
3qbGhNOoTq2++sk0lxaSmofJ33Wp41+9bn1yBPcu8KO5R6UIfkuVGA3aWZn2+W4Q
T1FyahqFkZN/FW4Xn2Pw7l6UBC6UFiMZFUPn8QKjgG5i7b/mUiljs18ArfNtizKQ
Heg7fKfOCwyVkVcRHFMSDmZdlYjCcdt+rx/G5ZJOKbweo7kADRE=
=RvY1
-----END PGP SIGNATURE-----
--=-=-=--

--===============0520173029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0520173029==--
