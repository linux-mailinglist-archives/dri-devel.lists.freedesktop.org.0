Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DB96823B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA310E25B;
	Mon,  2 Sep 2024 08:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="TMi5OkH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989EE10E25B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1725266581; x=1725871381; i=christian@heusel.eu;
 bh=A19maF2oWPHkqTGx94yzNxGSBOwDzbA2rJL3LldZ67w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TMi5OkH3BG2YG66njYhFQZNa6ULV2ALaSBjY1a2rx3LWw592TnvG5mPYnAjhCIJ0
 imtfJqDl9OSF8qG/X0XBKh0ysewf62LvmBg5YFCYuiJ9LnGPcLzXSvm53iSagWRE4
 GdIHlTa9K4KKvrg7Jye6j/GLF8r+u1G8eYYspPnmoJuH8tqoZnbLEURbrGZXvdpWy
 AVQdtcXI9KDslpSvSbGcuNWqmL/ATzjR6eeow8H4ow82nG9SQ5f3OEVtS/eaODLCv
 R1KocDTOSaI0m9ul/3bSrN9qNZpsb0j5Rfenzm+fyg5a0RnEJMnl6m/jCwWyoI/CO
 +iI2tvBR3NeDHm0/+g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([109.54.30.229]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MScox-1se3au09gP-00ROGr; Mon, 02 Sep 2024 10:43:01 +0200
Date: Mon, 2 Sep 2024 10:42:57 +0200
From: Christian Heusel <christian@heusel.eu>
To: Paul Rolland <rol@witbe.net>
Cc: Zack Rusin <zack.rusin@broadcom.com>, 
 Andreas Piesk <a.piesk@mailbox.org>, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maaz.mombasawala@broadcom.com, 
 martin.krastev@broadcom.com, rdkehn@gmail.com, regressions@lists.linux.dev, 
 spender@grsecurity.net
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
Message-ID: <948af4e4-6da4-4f49-82c8-ef061485e49f@heusel.eu>
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
 <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
 <20240902103436.5806f7ec@riri>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rupcgzgxmzcxpunk"
Content-Disposition: inline
In-Reply-To: <20240902103436.5806f7ec@riri>
X-Provags-ID: V03:K1:qccHn7M7lebkNgQVrXMfeacJegLBw7eCdvFx6uS4itYQrsMRryY
 wFNWF4NEIIrFLUTc8SPGytZtD7XIPMjGCR3A137aax3bllqdnjsJmFfX6hDe8etuhXfHM7H
 w+zn/MwnEG4w7Nd2OjQt5l2Cm+sUNIXYLsbYqP+iARI9BmSeRidp6jO0vPD6aCi2LphNYY8
 Ye7GHPc85cHBEMbZNbzPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zcdXIJfWhBg=;fADU+9RZaLwxtCnnVj+iGylqZKh
 eFEDO3ossSCMKN78pHZn0zCCbpS5N4jVucy+y9xPnhBveZKmcQtZboRqYlScXOsL1JWIgnyqP
 JDMU629mEvFDj2Uu4SnTpklpWzj/4E11qWAg3eo/W7ItTZjqzP0yVZ1PGatNU1tlDWa1rW+pM
 X4xivzeDZpZRDRLlycnX/OMwyhytmvbZN/Q3x1b88AxpLgT5NExLrG5eLf8uF+fPoeh2D6qaV
 WfvB3wub4U9TDZff+GitsAxKUMkBhOWT9i6Ks9w2q0YYQ/sxeC17e4vrl1cAK0SbH4JtxQNyY
 wlG6TnSzfTPPqT8IwrrYWYntoqFM87fjY05C6qsKTSICQyuu9jXI6Yl4n89E6AgsnfyjPzAH7
 lz8HgGAcFMOYeO1ifSWaz9dRBJU5jlADVnSDZyB86s6Nj5GB2k0hUMtKCYxlrAZ3EGXL6DOy8
 g2H5EyHVGjoxKoG0K5vjjgdnOg3lZpjofcxK4hsyLyYIvK4d1PgHU6wE+3n2ME/GTa2kNSs8g
 XjtGmuoZx03Uak6fyYfn7TquGDeUjT9h+sJTwGq3q/A9fSdsJ2etjATUUDnRHD+MdjKuxRDhu
 ph+4uFf3r3+855yUyLDv3Yms1WMnNg3gNbyk5tqAx5FwraXl6PINeIUzmSlfc2JU+r43CB/3r
 ErGXYD/mMKvJ4l3z/esVTXA8KEMix+w+Hmocoi68inZWCsqXTGreol6WG8D4oEqwglWTj+zJ/
 YiXVm3947Y6353+eqar4EVMmw330y8XTQ==
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


--rupcgzgxmzcxpunk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/09/02 10:34AM, Paul Rolland wrote:
> Hello,

Hey Paul,

> On Fri, 16 Aug 2024 14:56:19 -0400
> Zack Rusin <zack.rusin@broadcom.com> wrote:
>=20
> > Thanks! I see. I have a patch out that fixes it, but in general I
>=20
> Any chance to see that one pushed to stable 6.10.x kernels so that we can
> have a working console ?

this is on the way as the stable team has already queued the patch for
the (to be released) 6.10.8 stable kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.10/drm-vmwgfx-disable-coherent-dumb-buffers-without-3d.patch

> Regards,
> Paul

Cheers,
Chris

--rupcgzgxmzcxpunk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbVepEACgkQwEfU8yi1
JYW0HRAAwlqiPgELsPtSvfPFKg3xBzpLCOrYbDIPWZDJ4lj4QlUp0Ni++wN4q0h7
JKUZmXIuTyODIwIG+gDBZPYIVnlAPy1W7x0M8agJVu2tfdGvxPCQYAxuPTHg+h0Y
KV+HIGgnXoll7d78vdtGGSqDWp+aKyPDPXmggLcMDGibmsj/jSV2fY5XfuSIqLOw
DkVcC7Sd4duYORqP0fpLycJGyHyDIcwAB7Eb1UKA/njq1e1nVxQ1G1PyLvqSzvYD
EVaDAFNbqHj1GMdRlKyWoWvgjOahwIqwLyKByxQcji9LjHwsBzJVaed+RaVDyJJp
M139nd2fvzW99VICAYitDDnLBEa7p5KkCS94JnMEvL7GzYEdtz4eqkSTQP2UrsbM
k7TiNf94S/kAxf66AbO0vot7v2yspRcSZZWRA7+50VDm4Z3GyexED1Pr1HHdjZCx
Hl5LHHoGce/acRycNhZMZw4twPSww7TZb7hgQKPVCyhgAW+eCBNyLvJH5PsHLkfH
7VhERUCTN7EOP9KpQ7xI68g9WvvOZ0lk1Ps1rIZ8ZUkPEQ34MSi7c16jteMnqUq1
TPp1ssJRKepYV8nhv5w6x2zL9a9XJoo8dG6tuTK+rpYh7fj6HdNdn8KwuXrMjuz2
FvSbU+fGfpnLlgQYtAKP61FHQ3f6VGC47jlmrzb1iteXWKA/P+k=
=EDDy
-----END PGP SIGNATURE-----

--rupcgzgxmzcxpunk--
