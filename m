Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Bp4gNQbSjWmJ7gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:13:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83212DBC8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203C410E734;
	Thu, 12 Feb 2026 13:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SYFcDVUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F0F10E734
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 13:13:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63B3942A01;
 Thu, 12 Feb 2026 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59AEC4CEF7;
 Thu, 12 Feb 2026 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770902017;
 bh=BCMcKXyibuY72ZlBsUpi4Tif7N5dBM6mOtsw8Eg567Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SYFcDVUk8+ORzvt5z7z4RyAoaXeEJ6lMScqhsm1HBC3vao6/oRZ+cqMZ86rCaTQuN
 go1yQ64Jbmptyj0WZtAZ9Sdu1YW6aAzgtFgUIJHIXd0esI3DYR80eGV+8nqfndCrvZ
 nEA6tPnJdVelUq1lz3FPhGjwVrz5UH00jlaE2fcDVqlZrRFhVaH0ekn+KXGN6PPRx8
 jS1JBpwo202JwW1L0qhcj3Vpoi9OAA4Ax2DcMURxp7MMYXJpUowl9WgUsQWJkaoh9S
 oEClVC+hY78RJd7qVKQqPrMmKKsNEy+8dr/HH+nR0fZEcbW1M+BoIWVIFvUIWungTy
 X5njY4oC7gJVg==
Date: Thu, 12 Feb 2026 13:13:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
 <20260212134601.7760f414@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eRjwlYwruHn/MzvF"
Content-Disposition: inline
In-Reply-To: <20260212134601.7760f414@fedora>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4E83212DBC8
X-Rspamd-Action: no action


--eRjwlYwruHn/MzvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The panthor driver is buggy here and should be fixed, the driver should
> > treat the supply as mandatory and let the system integration work out
> > how it's actually made available.

> > Trying to open code this just breaks the error handling.

> Maybe, but the thing is, the DT bindings have been accepted already,
> and it's not something we can easily change. What we can do is make this
> sram-supply mandatory for new compatibles, but we can't force it on
> older/existing SoCs without breaking backward-DT compat.

In practice you can because we do sub in a dummy regulator for missing
supplies, it produces a warning but works fine.  If we didn't do this
it'd be basically impossible to add regulator support to anything at any
point after the original merge which is clearly not reasonable.

--eRjwlYwruHn/MzvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN0fsACgkQJNaLcl1U
h9Cw+wf+P2+piOIgK1GSaH7ikNmVinqDjcyC98yMJbSjrTf10BDJ93IbC65gKLmN
/XZxE5xRB+p7RO+kxK7SgCGRWHDQU/LeSchhImc28Q3SXSmNULWSYBKiLE95XyQy
b0eT4ZuJIMulwPkGC/0ht4M1hFp5d065pSbksFh/1lTDWMZYbr+BQGdfzUCodaYK
d49bTbFgXaPJZtOXUu0Vav00k6L/f7l0xW5rslBKh5qFfCTvy7TEUlmxE1ZzNWcR
6oZFOnsYE6Lbq+LRMBguN9u8A/kK53oSgbO7AjlzAtdstKb3gSv9NjBq+S0Yz6R1
hRHTH+pKtJW6rQnlchJiebWis0//ZQ==
=e+eT
-----END PGP SIGNATURE-----

--eRjwlYwruHn/MzvF--
