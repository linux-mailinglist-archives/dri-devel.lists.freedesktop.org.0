Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHzVKposk2mZ2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:41:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB0144C30
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D23410E0C8;
	Mon, 16 Feb 2026 14:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="NyvCOl3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net
 [178.154.239.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454410E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 14:41:25 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:1311:0:640:df31:0])
 by forward501a.mail.yandex.net (Yandex) with ESMTPS id 0B3A68095D;
 Mon, 16 Feb 2026 17:41:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 9fZpnRiGtW20-b1bTBWDR; 
 Mon, 16 Feb 2026 17:41:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1771252882;
 bh=F2UA0yW+NVCi0Rj+zD3YngWiaGKgRpmAvZ4q7nxAizA=;
 h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
 b=NyvCOl3o32x+iw1Q465tLwUlGI6/pT7B+o8ykON6zPRVCpP9TWHQVo66Dl0dXUpYO
 XEjlGZ5m3fQsjtEv8rMvU1yImXWRtRnxzzZotGxdsv9PNj1r0BsVLrp8K4LdU+VB1L
 ZfkUfT5iG17ey+b/r53LyB2iWI72kZkpO+NQZFKc=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
Date: Mon, 16 Feb 2026 17:41:07 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <20260216174107.1b9c03a4@nimda>
In-Reply-To: <20260216103743.626c71e3@fedora>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev>
 <20260216103743.626c71e3@fedora>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11BB0144C30
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 10:37:43 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Sun, 15 Feb 2026 13:02:51 +0300
> Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> > If sram-supply is missing, Panthor falls back to a
> > dummy regulator with a warning. This implicit behavior
> > hides missing DT wiring behind regulator core fallback.
> >=20
> > Make SRAM handling explicit: require sram-supply for all
> > Panthor compatibles except mt8196-mali where GPU supplies
> > are intentionally managed outside Panthor and DT does not
> > model sram-supply for that compatible.
> >=20
> > This keeps DT power modeling explicit and avoids relying on
> > dummy-regulator fallback.
> >=20
> > Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > b/drivers/gpu/drm/panthor/panthor_devfreq.c index
> > 2249b41ca4af..5f6075f18fe3 100644 ---
> > a/drivers/gpu/drm/panthor/panthor_devfreq.c +++
> > b/drivers/gpu/drm/panthor/panthor_devfreq.c @@ -206,12 +206,17 @@
> > int panthor_devfreq_init(struct panthor_device *ptdev)
> >  	 * But without knowing if it's beneficial or not (in term
> > of power
> >  	 * consumption), or how much it slows down the
> > suspend/resume steps,
> >  	 * let's just keep regulators enabled for the device
> > lifetime.
> > +	 *
> > +	 * Treat sram-supply as mandatory except for mt8196-mali.
> > It manages
> > +	 * SRAM outside Panthor so this driver must not require
> > direct control
> > +	 * over it.
> >  	 */
> > -	ret =3D devm_regulator_get_enable_optional(dev, "sram");
> > -	if (ret && ret !=3D -ENODEV) {
> > -		if (ret !=3D -EPROBE_DEFER)
> > +	if (!of_device_is_compatible(dev->of_node,
> > "mediatek,mt8196-mali")) {
>=20
> Rather than checking for specific compats here, let's go for
> a dont_need_sram_supply bool in panthor_soc_data.
>=20

Makes sense.

> > +		ret =3D devm_regulator_get_enable_optional(dev,
> > "sram");
>=20
> If we assume SRAM supply is mandatory, should this be
> devm_regulator_get_enable() instead?
>

That was the first thing I did but when I tested it, it didn't work as
expected because devm_regulator_get_enable() fell back to the dummy
regulator without returning an error.

Regards,
Onur
=20
> > +		if (ret) {
> >  			DRM_DEV_ERROR(dev, "Couldn't
> > retrieve/enable sram supply\n");
> > -		return ret;
> > +			return ret;
> > +		}
> >  	}
> > =20
> >  	opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
>=20

