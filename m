Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fl1mNTjRjWkO7gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:10:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531F12DBB6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA210E74F;
	Thu, 12 Feb 2026 13:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eYoMtjTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F22B10E74F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 13:10:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B88860010;
 Thu, 12 Feb 2026 13:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D73C4CEF7;
 Thu, 12 Feb 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770901809;
 bh=4OGIymvtICOLenGdbfRwIuE8+QmaHpFUy3M6cMFFxAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYoMtjTdUbc0iEbqzlUIDRCXkuq/9C5H+pf7mCPoF4ngTw+2xYNDIx28mXK3SwJbb
 5QR5mapIXdNcVstci04N/UOhf+qk9rNNNjMcdfm7WinF4QD63tDmKh43gxYIxjFjBR
 VNgkLiL/fkmIPQHrBvQoAaEdU9MBYuTiQ4uR+Nkr7bcvnYLq4QnetsZ8gARjdkt1ko
 jwRL2tMZS5TS6AgDgvFnlFIHTxDDAqztNw21dA5SF1KryXqp4yLJNZx6ySVeE7K5jh
 pW1VTnBaX7UCfVak8zOtHoIlAzt2ynpKslCjg7qslXBJ4xutTfbU0kZNsbLpw3GBc9
 7QeO4mbxkpnww==
Date: Thu, 12 Feb 2026 13:10:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <3507d7d0-a612-4a2f-baf8-c1f19b388e20@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda> <20260212132222.0708d190@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cvo5ftwoWWXOz+Ms"
Content-Disposition: inline
In-Reply-To: <20260212132222.0708d190@fedora>
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[onurozkan.dev,collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 1531F12DBB6
X-Rspamd-Action: no action


--cvo5ftwoWWXOz+Ms
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:22:22PM +0100, Boris Brezillon wrote:
> Onur =D6zkan <work@onurozkan.dev> wrote:

> > If the platform has no separate sram-supply (meaning that rail is
> > coupled to mali), RAM should still be powered and work fine. Panthor
> > already relies on this model by treating sram-supply as optional and
> > as far as I can see there are no RAM issues on Panthor.

> Yep, some SoC integration have just one power-rail for everything in
> the GPU, others have two. The sram-supply is documented as optional in
> the DT bindings, so I think that's the right thing to do.

This is expected to be handled through platform integration of the
device, not through bodges like this.

--cvo5ftwoWWXOz+Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN0SsACgkQJNaLcl1U
h9CERQf/WPhdYMMN7QryNfnqGHWlAqwjwFuIVKusX9xlNevK6AN0uZKCa9LBUQIN
1rUOW/F+QqkYLLoAgx2SirPyNNp+iSF73gMR4djkdjDuUGPBOb6pbSR9CB9SL4Ld
az6CQgA6CJy4FJrHPHUx3DX3r2SBZoxEYHaj62MBrK01NKvnif21vrJhhMi0wdkp
WBt77vlxguYuftP6Z1Zja9uRiO/uOyTHluEDIG+K4qbTO9RPicF5AtYgG8VzymXK
vAwLOJ9/COn+HkxMapymldP8m26LZzTrU+gi6zifUXMdPMvE5RMrHT8OofhPG5Yi
9oEiixP/fVABAEZumt+bZThSqKJ+cg==
=QE/u
-----END PGP SIGNATURE-----

--cvo5ftwoWWXOz+Ms--
