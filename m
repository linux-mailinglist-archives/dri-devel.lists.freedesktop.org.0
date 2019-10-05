Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F89CCB0D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67576E391;
	Sat,  5 Oct 2019 16:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Sat, 05 Oct 2019 16:16:54 UTC
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBEC6E391
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 16:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 5A2D43F2953D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 09:09:16 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vcDQwGZBAa4V for <dri-devel@lists.freedesktop.org>;
 Sat,  5 Oct 2019 09:09:15 -0700 (PDT)
Received: from keithp.com (unknown [192.252.136.159])
 by elaine.keithp.com (Postfix) with ESMTPSA id 35D043F294C5
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 09:09:15 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
 id 85D0715822F0; Sat,  5 Oct 2019 12:09:12 -0400 (EDT)
From: keithp@keithp.com ("Keith Packard")
To: "dri-devel\@lists.freedesktop.org"  <dri-devel@lists.freedesktop.org>
Subject: liboutput: thoughts about shared library on top of DRM/KMS
Date: Sat, 05 Oct 2019 12:09:11 -0400
Message-ID: <87y2xzqimw.fsf@keithp.com>
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
Content-Type: multipart/mixed; boundary="===============1779860677=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1779860677==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


During XDC this year, we heard a few presentations and had a lot of
hallway talk about sharing code for driving DRM/KMS for display.

I think the general consensus is that there is enough shared
functionality between all of the various DRM/KMS clients that we can
start thinking about building a library that deals with the complexity
of DRM/KMS and can help take full advantage of the hardware.

I've started writing up some ideas, mostly just goals, but also some
random thoughts about how this might work. This is all in the
'liboutput' project on freedesktop.org:

        https://gitlab.freedesktop.org/xorg/liboutput

I picked a spot in the 'xorg' namespace, not to confine this to X
systems, but to reflect the goal that this be a library shared across
all x.org-related projects, including Wayland compositors, EGL and
Vulkan direct applications and the X server.

All there is at this point is a README.md file; I'd like to generate
some consensus on a direction for the project before we start writing
any actual design documents.

Please submit MRs to that repo, or respond to this email as you prefer.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2YwCgACgkQ2yIaaQAA
ABG+tg/+Iwwl2qt7/0DoOqecKAQmx8bMsPwBCBDXlm0C/4F2xi5ZSVScd6H+vCop
FHy2UBcJNV+lASlOF8c0M5R7x0q2jQqqniaclYtijsM1rC90NWwfUiAzZmP07GGh
u0XExqRZ6W7lLcVmOgZn7GnUcVnoKPBds3TF5XNR3t/HquosIEB+yBE2xXCxBjSt
3+hVAK/8ogK9+BnJzy6T5cGyUMB0AkJHldytPT6Xt3Da0YIaGp17pgnFAibVa/6J
jLoDfxdtZFlkAbHMnWe/MCC7ByzsDmEDitxxXAr6nhdh9OPyoLKDzOLY/oX/HucM
1f9f01qxDkWeJukgVl0dntXyE7cf/1OmPE6fUuPrx70Oyt8ZQzaz0y4aO8/1Wx4u
BoWURP22LH4B5T2DGQayfqZwx3+5Eenk44/6Jj5D1oy39pAK6EdDeiduxa74dUm+
tY+epPMAzEwxstQZUYCeL3PQADAgvrV4bomD23JAogpVrNlbakwBkJwDI4yb/CQe
kIR70GVb909pp5S+Lj1S5w6sa5jspBb4XNrHWZqVA8aFKyUHImyBX/v9KHXuYDlM
PbCEfcnjm0VVXeVjLQY2FzpJBBl7gjacdEzUynR6yRsd0eioX3eT7ww5K7r76S+9
qaUa8mm21ssKWgqH9Iq5peirLrWLu/Ct1Lgzo7hK85DDBg2YU5w=
=YzFh
-----END PGP SIGNATURE-----
--=-=-=--

--===============1779860677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1779860677==--
