Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE85CADF80
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 19:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BF610E182;
	Mon,  8 Dec 2025 18:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EDE10E182
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 18:14:13 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 073581F80041
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 18:13:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 5B936B121C9; Mon,  8 Dec 2025 18:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 74EE8B121BB;
 Mon,  8 Dec 2025 18:13:53 +0000 (UTC)
Date: Mon, 8 Dec 2025 19:13:50 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 linux-sh@vger.kernel.org, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <aTcVXrUXVsyjaT22@shepard>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z9eEZ2V8rb9VqsSG"
Content-Disposition: inline
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
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


--z9eEZ2V8rb9VqsSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that we=
re noise).

[...]

> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

For these two, the symbol was removed in commit
09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
missed by the batch rename or were introduced a bit later.

Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
drivers), it should be replaced with DRM_GEM_CMA_HELPER.

Are you expecting to craft a patch for fixing this or should I do it myself?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--z9eEZ2V8rb9VqsSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk3FV4ACgkQhP3B6o/u
lQxHMA/9EINPzAC/mNsqKqe+ejzVAFDvbkqgtj46jdHchIRyg5QqUNEoQvUKACwR
bZftHenlJS3ho4n0eejvmJG9LkV6HYA4X0vXrPKGJTBCMgy1CUl7j7v8ZFn7qhcc
KmyK3klG9hxRNAFrMTlxaE3uzNZWaZ56eEINuq5RkJWv5ieiadTkXR03L4x2l++z
B1RqTh3yh5d57Ckfs7lLGfmiDUQAkhdAm1CASv6bO1jKRiyhuSN95aOZFZ94DV+m
oV44vbSx4aXyh1lb07PxtPMa+WITGI6/mW0+TKhRNd0eAoO19K0zkSNA18KjgiOw
3m/4Vs1pdWSKCTDIgtcymufTpdjqWt5LEpxEuzLprgUXrpoQbS7paAfhB4Ex6yIR
CcQfarVp0SM0/OI5kZc40xoz6UEHrCjw7+loxHuUV+2KHAhfRlQhLcScrQXUO/X3
L2vzAFURuGyVpPbZnq2ftkMT4h6o+W93ZtKP8vIHJjDijdwM3NAt90FT9byKXAYP
AvVBPERmf9+savPI0eDYuO825wAcF3D2rvF4ZElPj4+OD6sq93Z52bDN3CUFHsMD
tKp3GKwBxZ0ENUxQZvrIINzLx40EXOq/MDI1JZd4Nl89W5BBk6QGIRE4hj0FNctf
+4gCjq9z339Ik0u6aVtzq/jdewPuTo2wZ5DVPxsH1RyPX2cBWAg=
=azY3
-----END PGP SIGNATURE-----

--z9eEZ2V8rb9VqsSG--
