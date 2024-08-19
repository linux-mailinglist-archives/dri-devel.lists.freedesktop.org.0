Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B931A9572A2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46EA10E344;
	Mon, 19 Aug 2024 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="gxkMUBLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6616710E344
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1724090705; x=1724695505; i=christian@heusel.eu;
 bh=4Pm+E0/loXkoQyjwWE7IGgEIAhB5sOcCKAleBPDQgSU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gxkMUBLh2W1HaXvSnMBiTfRGm/grLr8hRUD/lqUzXA9ExJoo6s6ysijrwXDwGzvI
 sxWt5EsjRhd8KvfGdqXsVF7XABH7To/aZ9oKWJ2YaXiNe3jSJaR1QGveDYrdEUb2N
 z//AVLatdfPE8QAv4wTW8FrslvoUyJWATy813OGMZQPZXksvBmoEt6tyrfecZD55y
 f5JaITYagn7JOKkC8B4CCrPdCyKb6EcN8qom0FlQMNRQTB34xqG5FJl50GFEaOR0Y
 frp8+gjGHatN256iIrSeyN2d3Sa2OuKQcR5fyZLb+d0SwdpHWwa7Frpi3c2TiQAoC
 Yza5JhIWMSaYwbNwag==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MBlgy-1ssEmK3QSK-006jhX; Mon, 19
 Aug 2024 20:05:04 +0200
Date: Mon, 19 Aug 2024 20:05:03 +0200
From: Christian Heusel <christian@heusel.eu>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/vmwgfx: Disable coherent dumb buffers without 3d
Message-ID: <f0e9f76d-c10b-444d-aed3-20fc71eeb8d8@heusel.eu>
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
 <20240816183332.31961-4-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ifdveldrmwazhoxl"
Content-Disposition: inline
In-Reply-To: <20240816183332.31961-4-zack.rusin@broadcom.com>
X-Provags-ID: V03:K1:6Uwtrz96JdZujZZuER3x34/NT3gYUuqWN/fiHwjlyc5YR8LGdSc
 fHv9qXqljs+z1KWGz6XbZ0MGZ+HKZAde2Pj21hWNM5XqcM90jauQgedCgK7ZKwlCTUjT/JP
 7b4lIHMeLguwM1zDEkdRkBlq4oF32xJXxitoJxXSg1t7DtSYrPckpBZLiaE4N6+71Nrhw3R
 mrZrzCRvNrtXPmvyEppTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UbMkRbRh3vU=;2vSX5w3CsJaUapyQWuW2EZg2EQ2
 eZCE1fofxg+e1AHcTjTOHQ0BxTiDoFKjNZISzzPBGJw7Fx+DM5gY7YejRVTQdbvQEIvPNVH7o
 6agV47oV20yBoVxn92DiKRvkkp/EqjI6Fa+zj339mlFNoLS4Nq8pBXX+5U3L9wfQPB7494Vgc
 mnXbT/1lqqdo8RxakD70r1IfLov/fHFY9LpmxT3g1GmMTCgLetI6VTwoDR4yJUlbIHbQ/BybE
 n8Zag7jidVtCyxS0CBi98vBoOlysPsRR4yNluJO+XGAHxqF5jmck5FIG847jxUa53tghfvDW8
 Qm7Zbun870mn2vx222n9vE8tnOqnO5TEpF3lIcTsT3ow5rwZklk9H/LLjM+C2VQL9zMpf0LNR
 rlqrZdZdMgsCjSFvo9oC8jkJNe6B7MMns0vZ8Adt8iAb2qGaluRA1Xyg95P1kk0mSlpCyBkuW
 htNFXgbBW2iovsdk1d1bUfTXefbRIbYilH9zFe6fyFGP0OLhhQE2sZGLsIFcUZ1tlGU713zrU
 WFrwsX7/Iav908tqrCDKBkjVr7fpct9EqVTlHTjraGf5rwzBgelzyT6ZxZfr0Z/yetw5eUzJ+
 HibO0g2lc7j6vGqyC1MlG+oITHgsXc5H0fjdrPoqfooY2+q/psSKd8eFt/x26mdMM7QYeCWeo
 EmzxiZGHsfZAqTAHVRFsniIXmaGqzY9kf6xebibfKl6FOYOY5oJ7ZyvIcpvzQl+RCwQODhzLO
 lsGscI6KZQD7plwnBPkKS8nEemYQAbIsw==
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


--ifdveldrmwazhoxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/08/16 02:32PM, Zack Rusin wrote:
> Coherent surfaces make only sense if the host renders to them using
> accelerated apis. Without 3d the entire content of dumb buffers stays
> in the guest making all of the extra work they're doing to synchronize
> between guest and host useless.
>=20
> Configurations without 3d also tend to run with very low graphics
> memory limits. The pinned console fb, mob cursors and graphical login
> manager tend to run out of 16MB graphics memory that those guests use.
>=20
> Fix it by making sure the coherent dumb buffers are only used on
> configs with 3d enabled.

Hello Zack,

just FYI: somebody on the Arch Linux Forums tested the suggested patch
and found it working:

https://bbs.archlinux.org/viewtopic.php?pid=3D2190679#p2190679

Cheers,
Chris

--ifdveldrmwazhoxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbDiU8ACgkQwEfU8yi1
JYUoXg//fI5+kMtwg+UzC2lw0QKOixwt35LGbjXzYvcGMO9RSuEOs7eEUvjIM9NZ
Szp/8uQIN8BzC1ncvE5Bd9d39zBek5JEf3bomy+ncuMjSSnZmWXtxk201+aezCZI
uQvICS0YF8ItIsT84BrD1wHDS424kQKqxsqo7KTzHXyh8LNOsMKsbCLQsaQYm2Ty
pC6eXCxX/2Kv2rngyk50WxgbW7o8gHx5ZIG9JhA0j64w7GUEcdYePapqdprTUisB
GTSbPAus3eZ04/L5ORFo6Ir1G9fdj4+tWvoQuygLB8lLudVtv4dNx+us6VWpgpDX
ImJYhTWKXqSJ7BJrr4L4UyahcZgi0aOGcVHafW6b+knXL/YnGLtvG//i87ycFebS
UBAibiw6bLMrIR5DZwsawI9OIv/WY4sq/dET9GdjKUrUneLmecrjo5U2zTEMuYM0
UCZ3s8qmFkFBDbdLEMdh572QzMZ9OxWqEREhh6Z3x8Jr0YXdEMrU8musXu0ivA0T
DFKIWomazpgPz8yq0ZwNJAzje1r/eC1P4ibdsYOA98txv3WQyID/U2Uj/MEmVg7E
tP7eOfo+AI7jXQq7flR+sESmU6V6DGPhbbObyZ7k4TZjLE5hbSJPZub7tAThd2TI
cuiggSppYWvQjLjKf3Ozq8/7hUU9WGHu0+DCPPuvhLYPVAUf6bw=
=y1Ha
-----END PGP SIGNATURE-----

--ifdveldrmwazhoxl--
