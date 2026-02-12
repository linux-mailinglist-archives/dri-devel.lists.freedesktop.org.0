Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIk3HU7GjWnT6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:23:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04EC12D6B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921B910E28B;
	Thu, 12 Feb 2026 12:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fdJ9OmYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450810E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770899017;
 bh=3nk+50fd7HlNWHaDdsGj1623qHGABv7bsMKtZYB0Qro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fdJ9OmYbui5EdEhkPHlyiUTMobzX/RqGMxCzijigSl3ToGUY5IJE2iy7d0RXXekY/
 ONyeP8Jqy7GqXnBGXGJxfpL6kuELXYUCuZoZsfM2iN9YF4j4Xc4ssstBMoAw1lyJ2p
 dRjf0qoG6fTg8iJne2wqE/6cMSlf5NUAk7/cWF87iUQBLAM0NT7ZbrTZdkq6Ab1zQf
 pjLDZkpcxh3Qrp9qfaE5kuyACcPDTYWOQ8If9He4d1U6YfqSaja23u9iRRWKjmoK9w
 ezdFwjTvLKS/GV9OpYo7eYUzofA8qKWYIbQgHo8HR0EIlARGZYFC48N0r6hdzKkiWy
 cSF9+L2fHUnBw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B403717E0E90;
 Thu, 12 Feb 2026 13:23:36 +0100 (CET)
Date: Thu, 12 Feb 2026 13:22:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Mark Brown <broonie@kernel.org>, daniel.almeida@collabora.com,
 aliceryhl@google.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212132222.0708d190@fedora>
In-Reply-To: <20260212151644.4c179594@nimda>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:broonie@kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:email,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: F04EC12D6B1
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 15:16:44 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> On Thu, 12 Feb 2026 11:34:41 +0000
> Mark Brown <broonie@kernel.org> wrote:
>=20
> > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote: =20
> > > On rk3588s, `dmesg | grep 'tyr'` logs:
> > >=20
> > >   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
> > >=20
> > > This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> > > which goes through the non-optional regulator_get() path. If the
> > > device tree doesn't provide sram-supply, regulator core falls back
> > > to a dummy regulator and writes that log. =20
> >  =20
> > > Panthor handles SRAM as optional and tolerates missing sram-supply. =
=20
> >=20
> > Does the RAM really work without power? =20
>=20
> If the platform has no separate sram-supply (meaning that rail is
> coupled to mali), RAM should still be powered and work fine. Panthor
> already relies on this model by treating sram-supply as optional and
> as far as I can see there are no RAM issues on Panthor.

Yep, some SoC integration have just one power-rail for everything in
the GPU, others have two. The sram-supply is documented as optional in
the DT bindings, so I think that's the right thing to do.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> - Onur

