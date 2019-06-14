Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A446CFE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 01:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19A1890D3;
	Fri, 14 Jun 2019 23:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4F4D890D3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 23:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 44DFD10A2E3A;
 Fri, 14 Jun 2019 16:46:01 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JbNKQOdbyxDP; Fri, 14 Jun 2019 16:46:00 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 1929110A2E39;
 Fri, 14 Jun 2019 16:46:00 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 427962FE21C7; Fri, 14 Jun 2019 16:45:58 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] vc4: no need to check return value of debugfs_create
 functions
In-Reply-To: <20190613114548.GC13119@kroah.com>
References: <20190613114548.GC13119@kroah.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Fri, 14 Jun 2019 16:45:56 -0700
Message-ID: <87imt7hgsr.fsf@anholt.net>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0409037927=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0409037927==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Applied to drm-misc-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0EMbQACgkQtdYpNtH8
nuhqbw/+MpnwSuNagv1O7lVADj9cFlbGrIIg4UF498j5u0Ota12ez2d+LhuG5VQ9
QGhyGDXQeY8ffTMDKCYxXUUkvNI1VqDcqRR00HznYp8S0XHLjJ4h9oS7gX5EZilQ
ELFBoJpZZiNC+SvFUg18Nl+vP8K9+ZL4hbcplj7wnlg/bS1M+RGz26xPdwMykR/r
Rsl0u4Ct8LDy3xknPIuuxUiI5yns3r0lPZH4cM8MJV8vptqcDJi8ef4iWCbz8zEg
+phm5+F6UPd48oZhXmF/6z6TfqgeQwZdRzYwRSUPkcumedEd08VprQY0NmP1VPwW
XWzTHz0xET64Nd+0bmN1BdTOHF7SHzqHW2EqwV7xhh6M2uX6XDvKGDrGvZaPbu6C
7ix03mrXJ823j3DcJ7k+4mwgcxGj6t2FAKtItLCc+e5KWba3rF5+QICiN1LUBgVE
A/mkQSlsIDE107kBcrLijGaQs5CAneJU0NrOIreX9fjY629Lm52zxzQLAU1xYLt8
7R8DROp+8gs6dGvD9tXhOKeuHW8TOpJc07rNTGJmWs3xO6gg2LbEU5f8uIiYjeDw
PG81Hv6BHB5hpGhmBszMs93x0l7PgX1hxoOwmEtfAykLLndmyzyFsk9877QsJQp8
ccVh7TV6ymLQtHOzwpqyMF7KxN4ik8m4GgGDXZBYjcyII3dqvRE=
=1gM7
-----END PGP SIGNATURE-----
--=-=-=--

--===============0409037927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0409037927==--
