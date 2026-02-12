Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKwuBt26jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:34:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33412D0B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4759E10E723;
	Thu, 12 Feb 2026 11:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NVzwS6M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006610E723
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:34:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1865A60053;
 Thu, 12 Feb 2026 11:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77759C4CEF7;
 Thu, 12 Feb 2026 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770896086;
 bh=cdzDHmhAqk8/Nk4W5hBG5sQdMJ67tOeq4Ny+gim3Iyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVzwS6M5BL5a3U9CM0XI/9eNret7pVEykI7tewrdL/aQ63lfMAK4OiE7JQBM0gdci
 IpwH5r9ylLJfG/JK/xZrxatMVQd56EN5mRIAHFeR8vC6ZzBjbsv/yHahDuvpPIOkST
 ez9pusCRACJ383jaOUm8BCFpg4WX29lPSzSD2HacZ6lRoczAz3c4XmYBntlu8KdAn/
 C/w6NOF0K8hDdu2bBlMo3MKZFqCU9kzSbLNYhoS9VTx2c347LHA+l4iNzoxEPsmRAy
 JBuwtcgLpj+hrNOz163pM8NqEq0vrxxSUFZgLABmlxSfGV7pwRzbRu44xlqSP2fSTs
 tWg0rl7Vs0Dcw==
Date: Thu, 12 Feb 2026 11:34:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bFbv3jIqiwfaKw4C"
Content-Disposition: inline
In-Reply-To: <20260212100538.170445-2-work@onurozkan.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7D33412D0B4
X-Rspamd-Action: no action


--bFbv3jIqiwfaKw4C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =D6zkan wrote:
> On rk3588s, `dmesg | grep 'tyr'` logs:
>=20
>   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
>=20
> This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> which goes through the non-optional regulator_get() path. If the
> device tree doesn't provide sram-supply, regulator core falls back
> to a dummy regulator and writes that log.

> Panthor handles SRAM as optional and tolerates missing sram-supply.

Does the RAM really work without power?

--bFbv3jIqiwfaKw4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmNutAACgkQJNaLcl1U
h9Dz5Af/a5nGg0PyZZkNCLYWsu8Yp65N5DBsShu+i4JNiPXQM0JRu1w55Fw5rciV
qUInXjGWeP0IO2jA86UxCl0j2knqIf4xkPcxowPi3eGU176bpnamvR4fJBpLPHjk
m+HC5Rg4UC7rveN50yPY/LtJPKakw5ED3EBBGA1stCKK2HWtL+1MzJeK2fYDVauC
fth9GO58lnZJdh/3FnTwYc37fgNwNtv5PHjK9Ms3GsRATVyy0LFUIx8h66R22hxa
ho+Y0/ZE16zuWH3ZbLrBFFeqeyAmCQhnUmtt46K0OROK0x4ae/JGwxZUyxtg9Ew3
zqQsvzLnYq6WUgBG/NKBz5f61HHktw==
=8+Wg
-----END PGP SIGNATURE-----

--bFbv3jIqiwfaKw4C--
