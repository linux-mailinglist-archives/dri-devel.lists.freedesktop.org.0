Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBwUMwABlmlHYAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:12:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64156158959
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7E110E615;
	Wed, 18 Feb 2026 18:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qewEg8Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0410E615
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 18:12:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3BD3D6132F;
 Wed, 18 Feb 2026 18:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73949C116D0;
 Wed, 18 Feb 2026 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771438330;
 bh=dPrOwsESVofZYLh0PyNZE+DF+vp34upCcdpBDuawO9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qewEg8UoS5SctdkCAnSNSRmqxfPueSQ5YYWDYOyUGNCDgi35xCQ3T9OO0z7pQzH0E
 pZ3IFg81+fcplt9NRr4IuGiklLraceImha5UKU4yJpB1+fKRB1iD9M/P5uEypPKyPQ
 d8f//lX6I+9KkHao//de6c7wWJwCkbL+2MdDVGAtNHhozCY8wzN+dszJYjz3KM8lZm
 RniTJBLyPNWbOveBGP9V/I9sZ9WMpf58rfEijHRdBlicZepQQNWLcM4+s5iI52cOBu
 4dJVQaZSE1CiC0JF60eomizmjO6ZHTr/Y9pbkyIv9cw0VH0dXFZmdvsq6LMboY5bzk
 Mu7V3FeKdNLLg==
Date: Wed, 18 Feb 2026 18:12:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, mani@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor: add taiguanck
Message-ID: <20260218-humorous-cubicle-d92673d8f910@spud>
References: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
 <20260214085409.3489057-2-yelangyan@huaqin.corp-partner.google.com>
 <20260216-appendix-recipient-1836ea619cf6@spud>
 <d8873481-8028-4ff4-8152-b01c420a2c0f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wOml6nMJNdJsKlra"
Content-Disposition: inline
In-Reply-To: <d8873481-8028-4ff4-8152-b01c420a2c0f@kernel.org>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:yelangyan@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 64156158959
X-Rspamd-Action: no action


--wOml6nMJNdJsKlra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 08:59:31AM +0100, Krzysztof Kozlowski wrote:
> On 16/02/2026 18:49, Conor Dooley wrote:
> > On Sat, Feb 14, 2026 at 04:54:07PM +0800, Langyan Ye wrote:
> >> Add the "taiguanck" vendor prefix for Shenzhen Top Group Technology Co=
=2E, Ltd.
> >>
> >> The prefix is derived from the vendor's website domain:
> >> www.taiguanck.com/en/, which uses "taiguanck" as the primary
> >=20
> > This website doesn't exist it seems. I get an ERR_EMPTY_RESPONSE.
>=20
> I commented on this already v2, which was ignored by author, waited one
> week to get it fixed and still not fixed. Website seems real, though,
> according to Google.

tbf, the author of the patch may have no ability to fix it if that's the
case, I assumed it was a typo or something. It's probably fair enough to
just ack it then even if the website is not working for us.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

--wOml6nMJNdJsKlra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZYA7AAKCRB4tDGHoIJi
0oYUAP9lXMNmbzT4lOlUJaGz8OQP18eYgKVwBkgcZWSRhUkyRgEAqnz2/9ClPYEZ
y1nuL7CZlGk36RNDZhmwrDerApwB8ws=
=dvDv
-----END PGP SIGNATURE-----

--wOml6nMJNdJsKlra--
