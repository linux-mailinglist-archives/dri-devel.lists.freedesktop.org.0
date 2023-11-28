Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B937FC47B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8910E305;
	Tue, 28 Nov 2023 19:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Tue, 28 Nov 2023 19:54:44 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA42C10E305
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ir7sZ9RoYrqpmvYPkkKjk4dLt0+Xm+Yd04w0ZEuhUHE=; b=XF0b9YPIdKfouaIsqtCARLsnHU
 gwVZyL3oZRz2zyzNuSDfJS19tgWjhuP3CDKVDE0kcg457gxkU618v/KNkzCgHpZSzA6+d22z3AFUo
 ZtHHm1p4yYhVyOENVai1G7vqjTOHPKQY8YxtVjd/urbnUuRE3GLPvC0gpb3MYpMzPirc2qdYWRSqM
 y2bb0c+wfRgUvYbAvyfSyDzrWwAR0uJnqg7p7TeYT9cnt9W0qQpo/A2okvBXbL/KN/DcIsLf1xuaf
 5sGhJfVKFGdNPgDa9Y74r53tqVIBkjCgL1bQif5TQ/J77N/xBoOR137STPm5UgaMIa4QUVnQ9pRqn
 dIaGatPw==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sarha@kapsi.fi>) id 1r84AB-005vtp-2D;
 Tue, 28 Nov 2023 21:54:32 +0200
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 19:54:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <7829c53bd17db3a1142e9b84a900e60d2855a7fa@kapsi.fi>
To: "=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?="
 <u.kleine-koenig@pengutronix.de>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
References: undefined
 <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-34-u.kleine-koenig@pengutronix.de>
 <788e0918-02d8-47c4-83c1-9e23d623f2b3@ideasonboard.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH v3 16/16] drm/tilcdc: Convert to platform remove
 callback returning void
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

November 28, 2023 at 6:49 PM, "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pe=
ngutronix.de mailto:u.kleine-koenig@pengutronix.de?to=3D%22Uwe%20Kleine-K=
%C3%B6nig%22%20%3Cu.kleine-koenig%40pengutronix.de%3E > wrote:

>=20
>=20On Fri, Nov 03, 2023 at 09:58:07AM +0200, Tomi Valkeinen wrote:
>=20
>=20>=20
>=20> On 02/11/2023 18:56, Uwe Kleine-K=C3=B6nig wrote:
> > The .remove() callback for a platform driver returns an int which mak=
es
> > many driver authors wrongly assume it's possible to do error handling=
 by
> > returning an error code. However the value returned is (mostly) ignor=
ed
> > and this typically results in resource leaks. To improve here there i=
s a
> > quest to make the remove callback return void. In the first step of t=
his
> > quest all drivers are converted to .remove_new() which already return=
s
> > void.
> > [...]
> >=20
>=20> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >=20
>=20
> This patch didn't make it into next yet. Who is responsible to pick thi=
s
> up?
>=20

I=20expected the whole series had been applied at once. But yes, I can ap=
ply this patch.

Best regards,
Jyri

> Best regards
> Uwe
>=20
>=20--=20
>=20Pengutronix e.K. | Uwe Kleine-K=C3=B6nig |
> Industrial Linux Solutions | https://www.pengutronix.de/|
>
