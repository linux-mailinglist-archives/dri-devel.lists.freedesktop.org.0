Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0186B88
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 22:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503689228;
	Thu,  8 Aug 2019 20:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id A45D889228
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 3FB5510A2E9F;
 Thu,  8 Aug 2019 13:31:39 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mzTS905xNkZ7; Thu,  8 Aug 2019 13:31:38 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id E7C1510A2D5B;
 Thu,  8 Aug 2019 13:31:37 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 75E102FE2547; Thu,  8 Aug 2019 13:31:38 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 03/19] drm/vc4: Get rid of the dsi->bridge field
In-Reply-To: <20190808151150.16336-4-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-4-boris.brezillon@collabora.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 08 Aug 2019 13:31:36 -0700
Message-ID: <87tvar2yc7.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <Chris.Healy@zii.aero>
Content-Type: multipart/mixed; boundary="===============0002633338=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0002633338==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@collabora.com> writes:

> Now that we have an official way to request custom encoder/bridge
> enable/disable sequences we can get rid of the extra ->bridge field
> and use the encoder one.

Patch 2, 3 are:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl1MhqgACgkQtdYpNtH8
nuhQ5A/+MglLAi8GT7UE6eca++MQT1UYTC8vWY3OGDs0BQq5gVUyMA4r160P1E7b
L1RYEcflp0ldY53YcbWPSVcXsATRykvBiNbsqvQaySEdgHEt01NnXiYJtr5nGAMA
YaSjXeNWwtJAEbS7U9mlyqY2XE3QJLoH/vDPIrV7Xn6Xb4dHAuBIciENfhv0cl2U
r/MAKv+Xzp/czy66V+X8MTXUU1XvjQYM5oGSqth/0cALaMR6aDW3eYdRWS/JwIgT
CWljrWCWIkSBQWeEvLkp80UE7I5MDbY6OVs0GqNtU34zM/vSFsTwWLjoeenFu7g+
Me2FZ/cKiYYhyllY1Y01oUCc7DxZHf0Pv9xncU4D1mouBAWyzxClonSho8OrWsCF
wSSoGpr1YSYuJ56YVKzSseq+cJCRXpsjzDgkwnXgLfp53RwtXh6/dI92gcGZx0x8
YHwWBeDijx97ID+TUyuE1TMkv/0AHoQ8/MpZ5wUi56zcw5RH5u2emlbA9X8xpn/Q
uWXYDYJmeCbryPQDDmz26YUznbDQaLXgGIUpUh8YyYM5fRXt5XW0ug+5IEKnePw3
B6aONoDFAzYOTCNjxk493qoMOEE2TKVlwZF7chCAseAEkqBYLaXYKyblyQQqhlXU
fpvZ7lof/ZMyrjJz4ER74y/XqxkOlRqcUQJwGVGBAmowk5p8408=
=Q4rg
-----END PGP SIGNATURE-----
--=-=-=--

--===============0002633338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0002633338==--
