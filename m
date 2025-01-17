Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA733A14BD1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B369310EABE;
	Fri, 17 Jan 2025 09:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="KItksaI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CA210EAB9;
 Fri, 17 Jan 2025 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPJ6kjT2KUa371l28txauwNyjykZPJKUwUkZ2naKUOk=; b=KItksaI/ehu5V3y5xnqu/n/2jj
 6ZudIoUHs2JCLG0PaMOjDgpTmR62RJIlhL8Yd9RDfUdgsD5/g2m/mEm3V5tzW5zcPJMnNWcHf+sh9
 KWmRinvSp41YMaec6ZWA1GthwCAdJoSzoxOXA8St0/K/J6DfpDGz+57DEvIIr2nq+VNzvTeaJQAem
 Mh5TnLMmcG8qmgRPZn4ajVIfnIf2EkCtT1U6GvjIk5v+gZhAvrENJGvYRN4qGm1dGQODT5DrXHDQu
 fxreyTL+5SJxqCedDZtPq/yYO1J3wiUGTzGHR7A81vcRbuUoA5obQgbvktraVxSG4Z8sISQmedrD5
 yUdi5F8Q==;
Received: from [194.136.85.206] (port=33082 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tYiJO-0004tv-2S;
 Fri, 17 Jan 2025 11:06:42 +0200
Date: Fri, 17 Jan 2025 11:06:41 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Alex Hung <alex.hung@amd.com>, <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Message-ID: <20250117110641.7040f712@eldfell>
In-Reply-To: <20250116105622.577533fc@tisha>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com>
 <20250116105622.577533fc@tisha>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2AYt4dGga0HNm7b1Cf3+1lP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/2AYt4dGga0HNm7b1Cf3+1lP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2025 10:56:22 +0200
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Thu, 19 Dec 2024 21:33:37 -0700
> Alex Hung <alex.hung@amd.com> wrote:
>=20
> > From: Harry Wentland <harry.wentland@amd.com>
> >=20
> > The BT.709 and BT.2020 OETFs are the same, the only difference
> > being that the BT.2020 variant is defined with more precision
> > for 10 and 12-bit per color encodings.
> >=20
> > Both are used as encoding functions for video content, and are
> > therefore defined as OETF (opto-electronic transfer function)
> > instead of as EOTF (electro-optical transfer function).
> >=20
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com> =20
>=20
> Hi,
>=20
> why would a display system ever use BT.2020 or BT.709 OETF or its
> inverse?

Sorry, this is more for my own curiosity, not an argument against the
patch. Since hardware designers decided to incorporate these curves
explicitly, what use was in mind? It's likely something I have
overlooked.


Thanks,
pq

--Sig_/2AYt4dGga0HNm7b1Cf3+1lP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeKHaEACgkQI1/ltBGq
qqcG4RAAqf9Nv3xxuyphVwhsx0JActJhcuesyQywDeSH04WT4G9DLGqPudpyYy7G
LksCjnm5/k3+7jW8DvrChCZt3WdhrWHlKIKecCSLsOqRqzeD5ooRySL6lNmVr8TR
8v1jDcAP+yGgOrx1WHyVn0J7F0NIG2BZKnQktJiRDPRGFe9EKMwLR/6F+2SbMuFy
vI2Uz0e2Bno1bPi+3sqL8pXtIy3XVvjVIxD4eD6HQ3GjPIq0hB2ylpf9nlUhGFYI
rHQ0wZHY8E9EVbB7OReIBu4bMqv2havwDIl10zPNHeImaTfXMImUk/TmslmGCj+3
bC3o3lVyFYhJ6SH8HmR5UvkNzSZ/rYl5kbX9NC8Z6k/UQRfR7F3zD3Ee9foPLjMb
ohxri+EnLCft0GufeSvnmtFI4d4GNxwOh6LUvStZ0sKYEsHNodhVo1LBQOQw5jdY
GTDFefW9jE7GJT9354PDEvIAj39iHiAYe7kEpMT3cPeYlf/2aZ8lmTZ3zX9Uxh/K
U737TW/Ci9pFHR5NkUVHBNx4zy5UwPWajDxTysnf+/atHuOJ7XJ4ogWu+CUh+2Nw
Qv9fvaeYGvToi9808GhaJQvG8OsIjHGU4PL7Ky0svJwSsHr1xClvNHdKjDCKcnEq
ABrlWAvkZkLR0PwhKf5ATpLYjRyHdIvclsd5lWDEOjXAYfvscgY=
=1ZwL
-----END PGP SIGNATURE-----

--Sig_/2AYt4dGga0HNm7b1Cf3+1lP--
