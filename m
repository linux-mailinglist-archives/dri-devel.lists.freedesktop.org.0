Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDMYKpAIcmmOagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:22:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D365ED2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545710E055;
	Thu, 22 Jan 2026 11:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AueUwJyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A4310E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:22:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 72609404CB;
 Thu, 22 Jan 2026 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD28FC116C6;
 Thu, 22 Jan 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769080972;
 bh=aIkk/tkoBjjaZGUol+Q8NYf9FUSE+hDzD2pFBqWcSYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AueUwJyz5uXNxV7P/dgqUn5oM1Bn2sqxdH+jdFwQ580pc7SgAJe+OLG/SvSY01YSH
 pI/YRzufwDfk5ScdnZgi+ZejhEK1TT/rloFXjj28c95KXjQ+agWKU2zE+A1TJ3PiuA
 78ns6Pyv0eu0+4C8sVzoBYtvy3HpQYb8PXhSiewxOGUHgxC0hMSxKmurya567Os+ja
 awZVQzH3OMdFt8I8kF3WRZPL5iWGJ9gqFOivWHeD1CS9vlfgdtyM1Euj2LHPQOdQZx
 qM5ZO4t0x+Iu04n/026RNVHrLT1trzQEvViL338CEwXAhVlKIh6NfF8cAfKFDKhE9w
 1AnBgf3gJj+YQ==
Date: Thu, 22 Jan 2026 11:22:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, dakr@kernel.org
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ylg+OgKEabxTjFCD"
Content-Disposition: inline
In-Reply-To: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
X-Cookie: Don't read everything you believe.
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 3B9D365ED2
X-Rspamd-Action: no action


--ylg+OgKEabxTjFCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:

> From what I understand, this is only reproducible with Rust 1.80.0
> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
> reproduce it elsewhere? I asked Mark where his toolchain comes to see
> what could be done there (e.g. in his distribution).
>=20
> If it is just in Rust 1.80.0, and if a distribution still uses that
> one, and for some reason they don't want to use/backport the fix in
> 1.80.1, then we could consider something more global, i.e. ignoring
> that lint altogether for that version, since it also fails for another
> trait in `bounded.rs` (that is why I knew about this).

As I said on the other thread I'm seeing this with what appears to be
1.85.0 in Debian stable.

--ylg+OgKEabxTjFCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyCIcACgkQJNaLcl1U
h9D7QQgAgokMVY8wkRK1eJb+Gmjrh5mrfN84W00WkkRYvnanOAof3yqDcOb/pKPg
h5C2Xc05b4nxoN+N8cSxewpo2sJTsvRhC78Sf8udNFsYPjxpkvEjTML6yjog+nIo
QkLVCUwnvjlx9QM2vBeIZDLomej2iG3RM7IABGV/E3fnokFCF8fJLBwRoq4KwKhg
0tQX1SFBHakC0XJrh1TGGo/A+u4NyvpKQSk3s7aeGd7nDFEDRfk5JULzuD2Ur0GI
r7j8mnb06N3viCTWhuZbWl2Bu8S//PrMubVFwufxUPHVowcZWN+uLV0u0Jh+h4+h
F/DCcMNedzoW6BDKs5KogIGeV/wbNQ==
=Va4T
-----END PGP SIGNATURE-----

--ylg+OgKEabxTjFCD--
