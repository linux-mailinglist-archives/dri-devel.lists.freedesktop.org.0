Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFC31AD66
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 18:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CD488E53;
	Sat, 13 Feb 2021 17:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B77A88E53
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 17:40:05 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A53E41C0B77; Sat, 13 Feb 2021 18:40:00 +0100 (CET)
Date: Sat, 13 Feb 2021 18:40:00 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
Message-ID: <20210213174000.GA31409@duo.ucw.cz>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20210205163752.11932-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0187049777=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0187049777==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf) point to the same struct file. Since they depend on it for
> core functionality, lift SYS_kcmp out of the non-default
> CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.

Is it good idea to enable everything because Mesa uses it for file
descriptors?

This is really interesting syscall...

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYCgO8AAKCRAw5/Bqldv6
8viIAJ4mzr9pSE2O/4OwUYOLcFI483BApQCgniMQxMn6hxhFTRfMPW42oJKV/iU=
=X1NG
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============0187049777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0187049777==--
