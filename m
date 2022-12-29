Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFED658A95
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 09:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22D410E242;
	Thu, 29 Dec 2022 08:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AE110E242
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 08:37:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D81D55C0251;
 Thu, 29 Dec 2022 03:37:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Dec 2022 03:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1672303050; x=1672389450; bh=Q8E4Fy7yHH
 vgN5tzWFkvVuulnEmhwNWYk9G7KBE3lnE=; b=t/bFeug3fi3ux0+ew7vg019TG1
 iIeIeZkeIxbet7wBrntOofkKwMuujEOeobXE4fKpcBIC3fITCQXoqJ9BnIUmRUWO
 tjZYppJFasSlSkNpdgPAe3C8SveHeQ/XdnRP4obHT3Vb3nzYf5bJFpyvhR/krBVO
 8CzgfmQJLMvv2ETAeAbnF2cRgkL2wtMR5UzdJjO0XkGBJPsXAu/OmEZ+IoUITQYM
 rqiZ3reMnj6RSLX+aO+Us6k9umBRXPpRdgVXu8/RZNIIt3b4awsK4Voy8D9iG7nJ
 CgS48KxX4bkAS3ZebbRm7/pAxzfMZCg861y4SNXCMfUIWVkmuQUkwG0jkktA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672303050; x=1672389450; bh=Q8E4Fy7yHHvgN5tzWFkvVuulnEmh
 wNWYk9G7KBE3lnE=; b=ZKQsRyx+awDN9HFCOh6/HaDrpXNDDgrBKQrkiRQkXPxy
 WfpI9MexzajHNMT6h0F2ZaFiq3BUskLDm+GZMaqqLKV+rn0muMMXTeMIbgFx/C4F
 J3xgtYKCCpuTRdnzjr4sbcrMONAcenbzluC93xoP6utZPkK9VDHddCcGaRQ+a219
 WI1rUjxP79xZCGU3qbN60PqK9t93TOvGUyl2Z2WJxBGWcQi2DeusydvDcTU3/tjm
 FDjLya+u3z3BN4m0tKQ6fnn6XQxfNRqBaF9MjNSlClQ3WBWZMWVhRFIzCBGTY9OC
 rZIccJ4bdqiURgqxE1vL0nsIdlxYJbW51ygLKLfQlA==
X-ME-Sender: <xms:ylGtY7eO4FvsgEHcYN_InNlanZogtIQ3Uq4rvYdZvt5pomJGxKJq1w>
 <xme:ylGtYxNKf2kcz0XzuEQp8CsOFL7SRtnT5QZ2A6WF2T_mI4uMFs8o3P4HKTKYQFUJe
 VVjRNLd06xam49KJp0>
X-ME-Received: <xmr:ylGtY0j0owIqQ3TOOHxd8nKiLIHkgWAteGg-Fkqzgb_lewVzf8DIQ9Wa5Nim>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieefgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ylGtY88ei1RZmWNGmSC1YHCy1PZtdForc0FujWuHe5ELCccGo7hT1A>
 <xmx:ylGtY3vcASISGcQgFvbm_-pY19ETayGQUOvSws0mTI5NmnGYmPf_sQ>
 <xmx:ylGtY7H-K5Nqm82jcbNmFUay3ye9nnxHAzU34mpMgf0ZH8eqGVD4Rw>
 <xmx:ylGtYxKxnr8evV8FZZfsFfs-ivqd9XvZsywGzyHW_AXYOxiNMQIATg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 03:37:29 -0500 (EST)
Date: Thu, 29 Dec 2022 09:37:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: WARNING: CPU: 2 PID: 42 at drivers/gpu/drm/drm_modeset_lock.c:276
Message-ID: <20221229083726.t4jvnejep3q3ehyk@penduick>
References: <47a25f27-a3a1-5ec3-0c63-e68d05dff94e@i2se.com>
 <6ebcc09f-47d1-6c08-53f8-0b87ba2d75f6@i2se.com>
 <4c036775-3989-b14a-8f3f-478ef488f108@igalia.com>
 <9bb7c19c-effb-51e8-0b10-61077529030d@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n5ld2u5regpfstof"
Content-Disposition: inline
In-Reply-To: <9bb7c19c-effb-51e8-0b10-61077529030d@i2se.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n5ld2u5regpfstof
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 11:16:11PM +0100, Stefan Wahren wrote:
> Hi Ma=EDra,
>=20
> Am 28.12.22 um 20:49 schrieb Ma=EDra Canal:
> > Hi Stefan,
> >=20
> > I was able to reproduce this error on drm-misc-next. I bisected,
> > and I got into commit 6bed2ea3cb38. I noticed that the crtc->mutex is
> > being locked twice, and this might be causing the problem. I wrote a
> > patch to try to fix this issue, and after applying the patch, I wasn't
> > able to reproduce the error anymore.
> >=20
> > Let me know if you were able to reproduce the warning after applying
> > this patch.
>=20
> the patch works as expected and avoid the warning. I tested it on top of
> v6.1 with RPi 3 B+ and RPi 4 B.
>=20
> In case you send the patch please add the Fixes tag so the patch get
> backported to stable.

This isn't a proper fix, we do need to take the crtc mutex: it protects
the crtc->state pointer we dereference next, and vc4_hdmi_reset_link can
be called outside of a modeset through the interrupt handler.

Maxime

--n5ld2u5regpfstof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY61RxgAKCRDj7w1vZxhR
xaguAP48VJOw7rgfCxNFrQ+fQoE6KqrCL+xUJ23i6ixdFL0CCwEAoLI6OHK+RW+D
JNradE3SzeRYdlK8RMeIk2h3RHsV4g0=
=sRo2
-----END PGP SIGNATURE-----

--n5ld2u5regpfstof--
