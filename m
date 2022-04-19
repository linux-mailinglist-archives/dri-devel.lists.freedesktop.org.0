Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE0506820
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 11:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481B910E818;
	Tue, 19 Apr 2022 09:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EB410E818
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:56:54 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5EC0F240004;
 Tue, 19 Apr 2022 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650362212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mq8173Yhb7PWseSDb2n4pQrTc0Fh+GdWcB9T/uTdM2M=;
 b=HpO7PHrughSJxpPdJhGONJgxyf/vZiM5hnkdHg2WbBKu/FgmsuQ4mxb7LXxMz7f3DhyuEN
 OTiDujbFsmL3Cu2rxisww3BxUdCbsTiOIs6J31m4sw3Uz5F0Y40B/XzOW/yP0QWwNNH9Ok
 uZqVLxS9/yCfLkhWUCUqiGC+QZp7pbAGqELsIbrnQ7DOd7NvBBs/eBKjwF/JS1Q9VsfscM
 eAtqgharoXWYaS+2+HR907QYRSIbXGf2gx99+xWVsGxpA1V24Wv6kqpJfagspDObipq29r
 GuKPPZFaXyCSYJ1gz9N1KRGml+dxDafact1+n36DXtCK4cGP5YNKpH1AzcERTg==
Date: Tue, 19 Apr 2022 11:56:50 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <Yl6HYke4dJsrq9jj@aptenodytes>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
 <20220416222141.72321-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XgDB20WdwLjkKw76"
Content-Disposition: inline
In-Reply-To: <20220416222141.72321-1-paul@crapouillou.net>
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
Cc: thomas.petazzoni@bootlin.com, airlied@linux.ie, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XgDB20WdwLjkKw76
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sat 16 Apr 22, 23:21, Paul Cercueil wrote:
> Hi Paul,
>=20
> This patch breaks the ingenic-drm driver.
>=20
> It calls drm_of_find_panel_or_bridge(np, 0, i, ...) starting for i=3D0, u=
ntil
> -ENODEV is returned, which does not happen anymore.
>=20
> The idea is to probe all the connected panels/bridges, should it be done
> differently now?

I've sent out a different patch which restores -ENODEV at:
https://patchwork.freedesktop.org/patch/481135/

Feel free to try it and reply with tested-by/reviewed-by there.
I've also made a proposal in the thread to skip the "child node" mechanism
as soon as an of graph is present, which would allow covering more legit
cases with -ENODEV (the patch linked above doesn't cover all cases that
need -ENODEV).

Ideally we'd like to remove the child node mechanism entirely, but it may
already be part of a device-tree binding spec.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--XgDB20WdwLjkKw76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJeh2IACgkQ3cLmz3+f
v9GBKAf8DA/g/QCGdK6HmqooGT+X0CNX9NbaVBgCVkWL/wnG+MEsNTNY0g54m8h/
yQexs7+ZudJ19RzZAtJFgj3zcc9u/VXYxipI5Q+zFp9Q7UEuNDfZLS1yxSN+hfr9
fEK1YarFnb/uo/mCWiP2SAJiDtipJe+flEzyutHK6Jf1p2jyAbED4DlZTED8fN1X
uBkMw63pnPdzJcdx0+sm8xLnbY/bkaMjJasIjmfiimQsI09g+TCu5bBlEJIuMDG9
2XrTsUWWN7kex6f+cMakL4nhwL8EM1Hmysga6S4cODnhzJqEODXjMiKtCI+yB+hP
UEUj0lqOrQcgo/RpuKQiFQZxCSkhFA==
=RY5S
-----END PGP SIGNATURE-----

--XgDB20WdwLjkKw76--
