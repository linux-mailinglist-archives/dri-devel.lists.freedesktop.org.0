Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BDAC0FF1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CB110E174;
	Thu, 22 May 2025 15:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="yW972FJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292910EA7D;
 Thu, 22 May 2025 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TwLTAEDyNcudBXYvw/tho6uI9nq/7fWz5Bh7ADaTRbo=; b=yW972FJVoPSvLZlqys4NGLUB4F
 z8L4S7YxuQ9SyddzpgJn02FjlmMlDkrdo2VbQSbN6wDgGmyYcs5PK+C4/pGTP2ovAgrvfoAuek4O4
 FtFbZ02aMGd1nhBbNaMh6MvcxXXw3DVHcYxpHySjEYhpuefB6vKOnDdCN5Y45crnFdJiE7i5/k0I/
 rfpPAwhJLx1tD5o/lfZ4cqwOwGp4uIYRdnupm3mZ8MYB+vnFVEIDXF2KZQ2tJQQR66xXhtpJ/9MGJ
 YOpx3fu9dqaSAFH9C5BaL8lyjWPqW8XRFGgyQYoa85lR5S2pmVLouSqLzAt8LMqgebKttqrhmFG4Q
 izgNsv0g==;
Received: from [194.136.85.206] (port=37380 helo=eldfell)
 by whm50.louhi.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1uI7pR-00000004Eno-0QeB; Thu, 22 May 2025 18:27:28 +0300
Date: Thu, 22 May 2025 18:27:20 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, Daniel Stone
 <daniel@fooishbar.org>, Alex Hung <alex.hung@amd.com>, Misyl Toad
 <misyl@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Message-ID: <20250522182720.4811a8ba@eldfell>
In-Reply-To: <45db460c-35b1-4618-9193-5387bdfc7766@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
 <20250522105741.6aafc955@eldfell>
 <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
 <GU-BDO4CzKoaYho7e7l7uEcE32cTt406VF-JQN50yxsvw0g6xGWuQhQDXPANhy9_71s7P6vduHxXsHned9-FCdKqEv80c7HHuNsRAdcwnKs=@emersion.fr>
 <45db460c-35b1-4618-9193-5387bdfc7766@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0GeV.hNdzP7V=9MS1Cz4Z=O";
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

--Sig_/0GeV.hNdzP7V=9MS1Cz4Z=O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 May 2025 09:54:50 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-05-22 09:49, Simon Ser wrote:
> > On Thursday, May 22nd, 2025 at 15:28, Harry Wentland <harry.wentland@am=
d.com> wrote:
> >  =20
> >>>> What we should
> >>>> do is reject YCbCr-type buffers with the color pipeline until we
> >>>> implement support for COLOR_ENCODING and COLOR_RANGE as a new
> >>>> CSC colorop. =20
> >>>
> >>> Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
> >>> really a good idea instead of making the color pipelines handle them?
> >>>
> >>> Wasn't the original plan to hide all such legacy plane properties when
> >>> userspace signals color pipeline support? =20
> >>
> >> It still is. But handling the color-space conversion via a new
> >> colorop with two properties: COLOR_ENCODING and COLOR_RANGE
> >> seemed to be the most straight-forward way of dealing with this. =20
> >=20
> > I think everybody in this thread is suggesting that the old plane
> > COLOR_ENCODING and COLOR_RANGE properties are rejected and will never
> > be accepted again with the color pipeline. I think Harry is just saying
> > that a new colorop can be introduced with encoding/range properties, but
> > this is completely separate from the old props?
> >  =20
>=20
> Correct. Thanks for clarifying.

Oh! Ok, that's cool. I thought we were talking about KMS plane
properties and not a new colorop.


Thanks,
pq

--Sig_/0GeV.hNdzP7V=9MS1Cz4Z=O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgvQlgACgkQI1/ltBGq
qqdCLg//Rz6dQ/KF8zaXzFnTmDwGELU+8rHCPGGaCvtOD3i1N04RXQtb1QSm1je/
Qs/Ai38jFr4XtEhbDwgBcIzDPWwyiWk8jVOfWqYpBfW+COSiqKmK/fKSIoZGyz4Z
aBFxSJffZNwIPMLoWJaJyuU49XdFL1URNTVJ77In+NptezCJ5GsGUwnStm9SPa7Y
uCxry3KRhTiJ9mIf2EwnwcNSeIYdSQwx6+qWPfryiq1S1IuoUfQ1Gdua26bDmt++
eFuKMxkRkGhpJW7ntXoV4BSIiFK5aFoWYPun3KdELQvszDWFI9JBtGoEi/UThKaw
yvRHZHAvDNW1msblf5jUwHH7o/fF62Ix8OQfhWz+70yt/AAwunijl9ltc1EupWoy
Kfr0fMJzM/gQpcAvUxlsvnWGJSkEt9nJCdGSHg5ht8+Rl2trlSpZ6jnwjYZn9/gV
LhUzyrq9GKSRGIJbo7AYQixzohKpgvvluddkWUQm+dZ6gsnV/TuwVYNJrC0ABwHj
ILukYeMa8cFmj+R0ePug+LEgWEgOp3GfCpl+hFYll+jrfabvHC6bOnH9WQDIfckE
20opCzS8tQ4/iXM/qA7/vXPP7Ol0ZuNZ3W4vjR2ulDt/2xUMldAFD5rA0DpeO2B9
w5z/IMNM+Pa+mhBM6K2tS05SVnmnxbXzGhOoi33DXtP6S1cdM/U=
=6gkS
-----END PGP SIGNATURE-----

--Sig_/0GeV.hNdzP7V=9MS1Cz4Z=O--
