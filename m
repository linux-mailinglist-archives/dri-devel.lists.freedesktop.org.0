Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MGqDzxJj2moPQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 16:54:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72710137B9B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 16:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6A10E81E;
	Fri, 13 Feb 2026 15:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k2UORqzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A8A10E81E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 15:54:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54862439FE;
 Fri, 13 Feb 2026 15:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABBFC116C6;
 Fri, 13 Feb 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770998071;
 bh=LSegEQrSOwuVPwnSlWUvlsuB3DrPeTxqGE1znf4tkxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2UORqzUWWsGbuacUdgB5VuK4KR/W/mMun7zc+tiJAW1dnSaSZJ0fWM5A/RVnpeBo
 U7FM822Vj6d/pmQDJ108ykmSj/5X+yTW/5rTDMLCLwjq9Mrd5lME9NAIuF5ndP2owl
 RC07VSGKn0aYrni6eoo0Z8mFoCmIh1WdZCTKTjHI44xDt0iNtCVe7p1HtLp81TaMki
 ofMGEFc2wW4NBtTCwS3yE4WybV9mn79N0C6RANf6FEPaiVP8MqvXTb9BPz8rjwo++X
 pg5OHrXrvfZ18SVbxWAbJ9yRXeMj6i1K/Na1tvXaLeRxiMZotb48n9h32Srp2gW7H1
 Zo1HeA8qJDEGg==
Date: Fri, 13 Feb 2026 15:54:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <fa0f761d-45f8-4d94-b077-945b228858a8@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
 <aY8DrSjWm5w6Lfs-@e142607>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OBu0sbjdvL7VcMH0"
Content-Disposition: inline
In-Reply-To: <aY8DrSjWm5w6Lfs-@e142607>
X-Cookie: I have become me without my consent.
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
	FORGED_RECIPIENTS(0.00)[m:Liviu.Dudau@arm.com,m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid]
X-Rspamd-Queue-Id: 72710137B9B
X-Rspamd-Action: no action


--OBu0sbjdvL7VcMH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2026 at 10:57:49AM +0000, Liviu Dudau wrote:

> Please note that the sram supply is mandatory in all compatibles except
> for the "mt8196-mali". This was to work around the fact that MTK has decided
> to control some supplies via another method and not give Panthor control over
> those.

> We should fix Panthor to check that we only treat the sram supply as
> optional for "mt8196-mali", but that doesn't alleviate Tyr's need to support
> optional regulators.

If you know that the supply will never be present for that compatible
then the driver shouldn't really be requesting it in the first place.

--OBu0sbjdvL7VcMH0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPSTEACgkQJNaLcl1U
h9BH2Af/frL1CweswfxYTiomuQSnfzKCXtEbAxxX9OsnTb2VD/9A3iEMrwQkpGm0
AnMCBxq1ijav/NXN326PFqMDQ6n3QzcS7v+ma92ZIHXTgyvS9viTOGbJMMk7BnFW
6RbDc9CrcBcfJqPlJMV33uQ1Tdch53y/XPKZR9dsMckYS6YXuXivMJ+pEU5dr8cS
HQ+MA5Y55VfvJifiImaZv9YmQNib7o/tVMpjH8dE6wgGKmr0sz37gBCrdr0IyEg7
FCORJor2aGmKG5aehRDqCYKJ2BZcvJGeEASZkALUfbI78U1XxR2QMrKVYz0HAvAV
9t5xafl28wVPbEB9VVdOXle6h8b6Nw==
=zF/0
-----END PGP SIGNATURE-----

--OBu0sbjdvL7VcMH0--
