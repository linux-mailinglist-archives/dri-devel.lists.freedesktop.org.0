Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C25F398
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF3E6E28E;
	Thu,  4 Jul 2019 07:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88406E16B;
 Wed,  3 Jul 2019 16:07:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 61EE928AA43
Date: Wed, 3 Jul 2019 09:07:29 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH] mesa: Export BOs in RW mode
Message-ID: <20190703160729.GA3948@kevin>
References: <20190703133357.10217-1-boris.brezillon@collabora.com>
 <CAL_JsqLb3qjzp8+9mj3SA=E_avsF7VnC=vji9YvePHvoiqgNgg@mail.gmail.com>
 <20190703154724.GJ15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190703154724.GJ15868@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: multipart/mixed; boundary="===============0201650510=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0201650510==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Since the same discussion is happening with etnaviv: Why exactly does mesa
> need to mmap imported buffers?

The golden question!

Seemingly, (one of the) reasons is that the state tracker does
colourspace conversion in software if the winsys wants a format that the
driver doesn't advertise. Unrelated to this, that's almost certainly a
performance issue and might explain quite a bit...

In this case, the winsys seems to want RGB10_A2 but we settle for RGBA8.
I thought that was just changing EGL negotiation stuff.. I had no idea
it was covering up in software... not good...

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl0c0r0ACgkQ/v5QWgr1
WA2fsw/+LV7p93DLlmx6+6ig36o1UC48PlMjbAFz7QME/DPssOP9A9LFGDu2Lrrb
yR9Km6uugCINzLRlB58WKu5gy2IvJejnbgaf5ZJLwB4ROHe3j4INrCO6vGLlg1bz
R3jMAPdeUPKpY5GJApgFyKDnJNwZ7oVMAueV8sXXWJgoVseZJIF/t9yjX26ZFks1
wmLyVqD6CoxaoXz6QgSpwjdpGBsRlpFv011Mbd23a4OR1xyZOe+6zX73tua3LH8k
vdEroVmm5cAku34kDXKnne5UXgL4FRni/AYElIZfs2x7NGAaX1CdBMnI9SSLdKC9
g2V47Pql4RXVVfBivVj9XkwQugrHCnrscPfL8GDdRYUEgcf62Ea2PtQWAVot6smF
PQIS+iVQ+XzI1/X2WG/1eY1SWvxsYcaXXlEOu31hCSQfiLlGVDfcQGjUOnk3GfE6
m6GTHmQvQK91QFmsgUumJeZ8d8uUiGD2senpWh4Uji3vVHu1H1MsrfTmv6amFE6i
GWeZkw/KQtESq/6ZvVkWwP1F31Ef93dv1nurR9gxTJg5FdgKe/Q0oOx1LnSxaJqB
fqY4z9rUgV82emVDqy0vg68dyC9ho7wgvh5tEBq7Jnmc2F/hgJfIWMkJGdyIwYa6
fCP6F8P2CEahrSv/AkLByB33tRODGuhtx89wHVmqbrMxOQk26Vg=
=szXi
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============0201650510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0201650510==--
