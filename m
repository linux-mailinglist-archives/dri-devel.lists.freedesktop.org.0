Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FnhC7rEjWnT6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:16:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A799D12D5A1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9932310E24E;
	Thu, 12 Feb 2026 12:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="GeTsV1k2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net
 [178.154.239.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189D310E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:16:53 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:b106:0:640:7285:0])
 by forward500d.mail.yandex.net (Yandex) with ESMTPS id 308CA81B4B;
 Thu, 12 Feb 2026 15:16:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id jGTESQ8G3Gk0-NuQQV7gN; 
 Thu, 12 Feb 2026 15:16:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1770898609;
 bh=pcVQ/HWsQPlOx3AA8SIl++Ez9dHQYB3ABc7EeMn9rJU=;
 h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
 b=GeTsV1k2Rw8lXsKzzu5CQNm2uWybu2c5u7UK+5xYORoeVvmVx/IhG5jZjW5nAjtyO
 rv3OvcOvrKm1IcCOTzwLmAEss3wS7jsQL5MSfpd3AjWINT0oP9OvIbG3oTZue/scOY
 4z6IoRLlOo+EGrWJkB6ebZeo0Gn5EnzJgwH5aplI=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
Date: Thu, 12 Feb 2026 15:16:44 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Mark Brown <broonie@kernel.org>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212151644.4c179594@nimda>
In-Reply-To: <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A799D12D5A1
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 11:34:41 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =C3=96zkan wrote:
> > On rk3588s, `dmesg | grep 'tyr'` logs:
> >=20
> >   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
> >=20
> > This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> > which goes through the non-optional regulator_get() path. If the
> > device tree doesn't provide sram-supply, regulator core falls back
> > to a dummy regulator and writes that log.
>=20
> > Panthor handles SRAM as optional and tolerates missing sram-supply.
>=20
> Does the RAM really work without power?

If the platform has no separate sram-supply (meaning that rail is
coupled to mali), RAM should still be powered and work fine. Panthor
already relies on this model by treating sram-supply as optional and
as far as I can see there are no RAM issues on Panthor.

- Onur
