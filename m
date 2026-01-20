Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO1eID7Eb2lsMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:06:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E04918C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 19:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D92F10E640;
	Tue, 20 Jan 2026 18:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQkpfi0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB67210E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 18:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2C9C60007;
 Tue, 20 Jan 2026 18:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCE7C19422;
 Tue, 20 Jan 2026 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768932409;
 bh=7noY7dwvdtPUFXP+TRLnQO+n09UhiDtPbUSAVkbiet0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQkpfi0OPLvOKJ/yAeKm3nJgUQ97DjOmFq8hBGZfHVEDqjoh2Y7LKSeJ8L5vYZwUh
 LVQiGBzhtrAKLEgbAElUxLL+yoYqJiRfXhUoHUrzhYtj1gZjuaszjkIvRSVOibMm8/
 YT4Z8io5nER4X5UmCndJDBlMOAnRm8hn4D3C2tNjWjDnkRqw2u1B8Iq+6ckaUAghnh
 kwxdLES+JeupHTokklIlIybAvj/r8WyNGJNVESdEQxi2vToWdxATkTd4KgRYzPVuMh
 Ulqe2QOUmzSnar9l+ks+aypt5NCYlhSy+vnxcLKvQUHKavOzDci4jiF5SD+vM+1y+d
 U4DZqG6iNMZWw==
Date: Tue, 20 Jan 2026 19:06:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: linux-pwm@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] pwm: Update MAINTAINER entry
Message-ID: <vxft2haumyobyfq2kmvtisplvdw6bwuriw7ngghbrtbczewknl@bnc2ou553xm2>
References: <20260115165055.1739004-2-ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ij2vdvowd2uioibd"
Content-Disposition: inline
In-Reply-To: <20260115165055.1739004-2-ukleinek@kernel.org>
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-pwm@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 113E04918C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ij2vdvowd2uioibd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: Update MAINTAINER entry
MIME-Version: 1.0

Hello,

On Thu, Jan 15, 2026 at 05:50:54PM +0100, Uwe Kleine-K=F6nig wrote:
> There is little sense in having gpio-mvebu and pwm-backlight explicitly
> listed in the PWM entry. Drop these and add the keywords that actually
> identify a driver as PWM related.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Applied to
	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next
with Bartosz's Ack for the next merge window.

Best regards
Uwe

--ij2vdvowd2uioibd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvxDQACgkQj4D7WH0S
/k7OUAgAhsA97vWW9OMqru4+/CWnSRIx0z7mYpFmCjbyGSnc9v1j9A7ADXB3qjh5
jwf15dvx7kHwzOaoeJ4qPexFFHpliT6lBMUZwHizPXwBnSOT5a/QPNp8TDbcee1U
oZZMhRtv0edJ/wFm9YQU44sK2guyYiBurH+CbniL1qDTyEkWJna0hjEjV1M8l215
2kkTw5nqa1SVJvNHhlEGgwgNQKDTKeuTuT9Y8r+2qNsTjle7EJ3oZLAPSAA55OhP
kHHAEH4IsHVQWSBQyXZKllsamvCD4vdQdq8HFLaUAMkNPSMFlprevLZRwWNrixnI
HAsQ0zHOaLM7hfKnyHcK6C33BgR9Zw==
=YD/i
-----END PGP SIGNATURE-----

--ij2vdvowd2uioibd--
