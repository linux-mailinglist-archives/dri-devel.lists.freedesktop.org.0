Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED532B8208
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765D6FAF8;
	Thu, 19 Sep 2019 19:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFE5C6FAF8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 19:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 643D710A3845;
 Thu, 19 Sep 2019 12:58:19 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id u3o5gnnbgz0O; Thu, 19 Sep 2019 12:58:17 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 208DD10A3685;
 Thu, 19 Sep 2019 12:58:17 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 6383A2FE2E28; Thu, 19 Sep 2019 12:58:17 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/v3d: clean caches at the end of render jobs on
 request from user space
In-Reply-To: <20190919071016.4578-1-itoral@igalia.com>
References: <20190919071016.4578-1-itoral@igalia.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 19 Sep 2019 12:58:16 -0700
Message-ID: <871rwc9hyf.fsf@anholt.net>
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
Content-Type: multipart/mixed; boundary="===============2040500757=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2040500757==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Iago Toral Quiroga <itoral@igalia.com> writes:

> Extends the user space ioctl for CL submissions so it can include a request
> to flush the cache once the CL execution has completed. Fixes memory
> write violation messages reported by the kernel in workloads involving
> shader memory writes (SSBOs, shader images, scratch, etc) which sometimes
> also lead to GPU resets during Piglit and CTS workloads.
>
> v2: if v3d_job_init() fails we need to kfree() the job instead of
>     v3d_job_put() it (Eric Anholt).
>
> v3 (Eric Anholt):
>   - Drop _FLAG suffix from the new flag name.
>   - Add a new param so userspace can tell whether cache flushing is
>     implemented in the kernel.

Appled to drm-misc-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl2D3dgACgkQtdYpNtH8
nugvrg//dqHlxcnk5AR9LNtOQpDYp4XFgrp3/A3M/iY5laGdZy0RSgf8Y4omjjkO
hBgUu5uiya8JOqiwfTZbFXTsYDc9M3KdyjM6DC3YodhftmNRx7oP1cTP9Bg/2b8J
oPajDczWyt1d+JtvzepYMR2A36zhAFIJRj9rwYtVVw//XUvx8nHU+ijvF10FfD7+
sJDD7ZCYl0dauVOnY+CflBjEgSmED94qE9qNUVXQp3rU0Q18MIzjrznEOVYQLuSr
97xbrKrRjqLkUJT7Xf8fNriX6RaRBk7fN2eW1Gc9lrazaXS18+whTF2xZa2fcETt
pCC/dIxTpmpa1bzJTKejMLOH6ESvMp7tuPjiGLYu2czUhM8kdPmXHZjH4+zh0yrW
iJDit4Ar12FO6Xsh+SNJ0utGKjjoKUu456HIXmx/mwgdSUUugJcHKeiBmkgDS663
/vZCZn5zjFWCYkdT2NB7H3/eFUDbH3TcpGtQQHYZC2154SyOTLolt64gVUr3a0Sm
j28zMUoEv9ZEufeMYmU7pFOmDSinlUy7ibStwgHkP+xDyQuASLspvoKc9OlM91cA
Kpp3y5dFZyAymN6qF2/yI+hvBX0Kg/GEYsmoZnrhlxJaEBSyIdJgAbnFuGPmeaQF
CozEqx+hUUuwKFDKRR5ua9t6ApEaY05D7W9A1EYuhEdO2E65wwA=
=Y4oR
-----END PGP SIGNATURE-----
--=-=-=--

--===============2040500757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2040500757==--
