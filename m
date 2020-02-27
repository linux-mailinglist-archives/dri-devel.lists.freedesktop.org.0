Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB8170D41
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA436EBE7;
	Thu, 27 Feb 2020 00:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870316EBE7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:32:50 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37ECB21D7E;
 Thu, 27 Feb 2020 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582763570;
 bh=gjBNMw0ElGinHGCVIC+12uXdEC+sBxNW+DkVVuuX3a0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuuLyys1DD/aSig1WcAB4nuClQ3otdL8XDPqNkUMIC7dypMOzFd1jMaBSwOjQSEDb
 eyoV0krK0lc+bRvGE5oHPEI0vGSiZRY4tFxWAN8duBPxBLK4HFziEYA/Aix/QJk6pq
 XtxKCeyNmeKp+6M218E1qBqUQJcmY0GlK0p2tSEw=
Received: by earth.universe (Postfix, from userid 1000)
 id B2F223C0C83; Thu, 27 Feb 2020 01:32:47 +0100 (CET)
Date: Thu, 27 Feb 2020 01:32:47 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 43/56] drm/omap: bind components with drm_device argument
Message-ID: <20200227003247.jvajq4yhc4qrbjmn@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-44-sebastian.reichel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-44-sebastian.reichel@collabora.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1812139795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1812139795==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcb5kmhyk6vx75tm"
Content-Disposition: inline


--hcb5kmhyk6vx75tm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2020 at 12:21:13AM +0100, Sebastian Reichel wrote:
> This fixes the omapdrm driver to call component_bind_all()
> with drm_device as data argument as recommended in the
> DRM component helper usage text.
>=20
> After this patch DRM functionality can be implemented directly
> in the components resulting in a simpler driver stack by removing
> one layer of abstraction.

Please ignore this faulty patch, its fortunately not required for
the remaining series. For details see my reply to Tomi:

https://lore.kernel.org/dri-devel/20200227002843.7ea73mewcr4rmzli@earth.uni=
verse/T/#m2b76dd570804845e997da19214647634f5fc7dd0

-- Sebastian

--hcb5kmhyk6vx75tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5XDi8ACgkQ2O7X88g7
+poZ/Q/+MeLHWR2ypaut7d9ZNakwgIzqj8c9YXDntK6gLElUuv9j0myU4roCOu+E
6e+UjX/JL6fkHRuIVv44lHaI5rosHLqEEyIkwKC/6QyP5ZK2kyqdE3cvamCuHsR5
GYBjXmOAQNVbNXjVsX+Px3ge0ZFortBtoVxx4lMWuMg2xbyjyen9qXkauJY4z09s
ebRFcgACx0fBlc7wj1QHI5eCTfOl57nlIiqkK4y1JPhLQ2LJcmEAOqMq8fH9Hnwe
0l3JoemfFvt3i/nq1hA39gcCugOQhgc69GBzBdJb/CJ2XJEatlsOSDaaPvpIRhJ0
raBqG4GwEW0AWn4ugAStZnmnVZP3ghgMUt0JznimDFydrHwTpoKj0TFC0inwkrrg
oXBsnVhJodEaBOWfx2NsL6hOPCurXOhLLno191byXQB4Al0CS81DpUmG31H2eMkt
ZHr/0jruAdLNFdm3/dJwdftSeo9Yys1l1nF4a6GuGLEIPZV7raofxYVDa7nB6Ia8
l8U7JxoIqT+KPb6rUDoW/MwmQe23uZ1uPtEMo6D7sxO1KvlChlk1AINXTbi2Bsex
wAOc4gFy/jvbEeJbmK9IloLGb7APyTimINnOfr6rfktz6zeyAtDWALwHx4myGm9+
UwLtpa7bjUFXf+JXJZoNO8VKDlccnM9GePO8mX7AA6zxDOnejjo=
=5L02
-----END PGP SIGNATURE-----

--hcb5kmhyk6vx75tm--

--===============1812139795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1812139795==--
