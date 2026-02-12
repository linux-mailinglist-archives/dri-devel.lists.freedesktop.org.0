Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 51XFAJfLjWn87AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:46:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA412D811
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECC910E72E;
	Thu, 12 Feb 2026 12:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L9sxyDAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3912710E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770900367;
 bh=O/gsN/oNoD6OdxyEWVVk3ToCx9BOXvmAMQBNhd4XEug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L9sxyDAtxLSrw1ojxnBV84pgcZcAlV38Yr6wYYBlVthlnF8jXTCIW5Ame0buJu7cy
 l9jrbhOJPq2Q+zU0nq61EwN1pAtPzEnqHyVYOoxjAxerBE2AF/qrdArqfVSYYyTqq4
 TS4u+xpeN5zcHAKzeK+ZvhgQ44A4uRNVASua/wWSApZ6ou3FhtBE+oRbX4gtOV4rEg
 z8FHCRRqLx+4ajb5lCFQN371EaAjRr8UiaG95odx9vKSkm6oVxeTjbT+llq2jRsYjg
 F08A+WAJ2Kmeph42N/BGo1IO6/bn09E5sN8wQz7JADGAv/YhN0xv5j467AFv+1+rRm
 Y4dBYvivmK8ag==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D333A17E0C21;
 Thu, 12 Feb 2026 13:46:06 +0100 (CET)
Date: Thu, 12 Feb 2026 13:46:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212134601.7760f414@fedora>
In-Reply-To: <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
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
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[onurozkan.dev,collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 6FDA412D811
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 12:21:07 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 12, 2026 at 03:16:44PM +0300, Onur =C3=96zkan wrote:
> > Mark Brown <broonie@kernel.org> wrote: =20
> > > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote: =20
>=20
> > > > Panthor handles SRAM as optional and tolerates missing sram-supply.=
 =20
>=20
> > > Does the RAM really work without power? =20
>=20
> > If the platform has no separate sram-supply (meaning that rail is
> > coupled to mali), RAM should still be powered and work fine. Panthor
> > already relies on this model by treating sram-supply as optional and
> > as far as I can see there are no RAM issues on Panthor. =20
>=20
> The panthor driver is buggy here and should be fixed, the driver should
> treat the supply as mandatory and let the system integration work out
> how it's actually made available.
>=20
> Trying to open code this just breaks the error handling.

Maybe, but the thing is, the DT bindings have been accepted already,
and it's not something we can easily change. What we can do is make this
sram-supply mandatory for new compatibles, but we can't force it on
older/existing SoCs without breaking backward-DT compat.
