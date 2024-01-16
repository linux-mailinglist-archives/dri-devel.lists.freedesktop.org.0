Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D982ED28
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 11:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125B710E05E;
	Tue, 16 Jan 2024 10:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 10:53:18 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD98F10E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 10:53:18 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B91A11C0071; Tue, 16 Jan 2024 11:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1705402005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJ6VNVEe3MQa3aVTkgyy1bVeVbAM3wMV1HKk86y3sEw=;
 b=a1SnG66iualXG5lAh86nGw5Eqoy1w1F657wNFWVxKHDjdTwolm7tmUO0PBNukU0k9dyY9N
 NAHwZjmRJAOlOkl67WpNPzvgCGdbx9hMoDwYyI5le9r1+0nGoLxDOxxYBVG8h7lFB34IF3
 5dHoQPkrDmzRWj+EeeKY9Mh9ipnXyYs=
Date: Tue, 16 Jan 2024 11:46:45 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Subject: End of 4.14 autosel? Re: [PATCH AUTOSEL 4.14 3/6] drm/crtc: Fix
 uninit-value bug in drm_mode_setcrtc
Message-ID: <ZaZelbUWUsmYxLPB@duo.ucw.cz>
References: <20231218124725.1382738-1-sashal@kernel.org>
 <20231218124725.1382738-3-sashal@kernel.org>
 <87bkamvay5.fsf@intel.com> <ZaSlgTAz7vdk97JJ@sashalap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="o+sd9barL1BWDrsW"
Content-Disposition: inline
In-Reply-To: <ZaSlgTAz7vdk97JJ@sashalap>
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
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Ziqi Zhao <astrajoan@yahoo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 stable@vger.kernel.org, tzimmermann@suse.de,
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o+sd9barL1BWDrsW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > From: Ziqi Zhao <astrajoan@yahoo.com>
> > >=20
> > > [ Upstream commit 3823119b9c2b5f9e9b760336f75bc989b805cde6 ]
> > >=20
> > > The connector_set contains uninitialized values when allocated with
> > > kmalloc_array. However, in the "out" branch, the logic assumes that a=
ny
> > > element in connector_set would be equal to NULL if failed to
> > > initialize, which causes the bug reported by Syzbot. The fix is to use
> > > an extra variable to keep track of how many connectors are initialized
> > > indeed, and use that variable to decrease any refcounts in the "out"
> > > branch.
> > >=20
> > > Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
> > > Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
> > > Reported-and-tested-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspot=
mail.com
> > > Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > > Link: https://lore.kernel.org/r/20230721161446.8602-1-astrajoan@yahoo=
=2Ecom
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> >=20
> > This commit fixes an uninitialized value, but introduces a new
> > one. Please backport 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable
> > use") from v6.7-rc6 to go with it.
>=20
> I'll take 6e455f5dcdd1 too, thanks!

So, what is the status of 4.14-stable? Last one was
marked. .. well. .. as last one, so perhaps AUTOSEL should start
ignoring it, too?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--o+sd9barL1BWDrsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZaZelQAKCRAw5/Bqldv6
8sdcAJ9rTyq5VQW4BNAizG86yFj6oniPRACgi8ro35eyUnFqN72aI2RVAxI1qYg=
=SCC6
-----END PGP SIGNATURE-----

--o+sd9barL1BWDrsW--
