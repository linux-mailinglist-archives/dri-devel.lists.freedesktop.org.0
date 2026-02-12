Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F6nJr7FjWnT6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:21:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082DC12D641
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1775A10E25C;
	Thu, 12 Feb 2026 12:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jlq1C/A9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE410E25C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:21:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51A8160018;
 Thu, 12 Feb 2026 12:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3699C4CEF7;
 Thu, 12 Feb 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770898873;
 bh=QEkV3oob5sDVWk9eUL7QetXC3bEgf6Q/cnB6/3i3eEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jlq1C/A9Vr9pzMfZHblI+jCIQ8XDhLMzHXbWD7qP6C79mkVzXZf5DwhucEHkQJUXB
 zEaI+Nd36reT2MapYI1TXypSR32lD7QypvqMoh+niwlVyO3y4PkvCN/9wkfLLArZ0t
 +7WAbTUbfe3flnz4kJx9a9UxD3sPvEzI9e4h1r/+SzoKT7KK8Lt1ki/GELFck9xEF1
 76l+qFmKXubY406Qw6XE8hWxs/H6JBScECEWnwqCV0dFw1etq6FykcY7M2uhuMtyEW
 4LM0850Qez+GfKKeekQruNpFAbRLxxN7Rz0Y3eNLaXNsLx3iPNn/tDCgZUbOLbDQbE
 dUjUs33SNRCgA==
Date: Thu, 12 Feb 2026 12:21:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BRO4QnJAtMBrNyRi"
Content-Disposition: inline
In-Reply-To: <20260212151644.4c179594@nimda>
X-Cookie: Save energy: be apathetic.
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
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 082DC12D641
X-Rspamd-Action: no action


--BRO4QnJAtMBrNyRi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 03:16:44PM +0300, Onur =D6zkan wrote:
> Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =D6zkan wrote:

> > > Panthor handles SRAM as optional and tolerates missing sram-supply.

> > Does the RAM really work without power?

> If the platform has no separate sram-supply (meaning that rail is
> coupled to mali), RAM should still be powered and work fine. Panthor
> already relies on this model by treating sram-supply as optional and
> as far as I can see there are no RAM issues on Panthor.

The panthor driver is buggy here and should be fixed, the driver should
treat the supply as mandatory and let the system integration work out
how it's actually made available.

Trying to open code this just breaks the error handling.

--BRO4QnJAtMBrNyRi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmNxbMACgkQJNaLcl1U
h9Cnvwf/TCuOUm6GYAgjd4gutI6awBtaXVBn0V+7G8ydJyYzWkF9ZTFMGkegkGZK
FcAYz7fSYOjRGXF6uRG+H6P/22b+yneS6Lrxz0wU65HmeKx4BkDmrEX8L95RQUST
hkTu6Pqo04er7xH+MQKslDAzzySHu2W3bj1bdNK788u+HAACKYxnfiRrHuX1z8HK
KzHKko3xvfuCi7Epfs4Xl2ZttC/mq2uZUKzP+oaVWVw7NPsOyItHKVgGH2xnsrxE
nK/wdLNjI+yqUVZeGlQbiBcBN3aLZLmo/phZe2XERa1NbmP2QW+rNMc+UhZuJncJ
WzjsEeca5fxwsadCMuwfOLce2lrd5A==
=dqR6
-----END PGP SIGNATURE-----

--BRO4QnJAtMBrNyRi--
