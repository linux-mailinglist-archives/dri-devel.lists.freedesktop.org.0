Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBF5EE90
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 23:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E8D6E1F1;
	Wed,  3 Jul 2019 21:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2F6E1F1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 21:32:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fDpY6pyGz9s4V;
 Thu,  4 Jul 2019 07:32:21 +1000 (AEST)
Date: Thu, 4 Jul 2019 07:32:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190704073214.266a9c33@canb.auug.org.au>
In-Reply-To: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562189543;
 bh=vcfEUN/OJ3FmHGsLAuzadqK55t4/uLDhFaOEhdyst7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aB7R7tl9cIWWDzrZOvEGwccHaqmKG7yk7h4eEkKNTOUnCjEK5L980pe9PmuU+9Wko
 Mu+kpBTpaBamhVHsRgeicTgZLyRxbKBUJMi7Fo4nKqHKMxcw76rx5UdZUnX36EN5Ss
 yErFzZZXXDAIiEi6PtvTWib03Cwz+AnnYS8dVu6IXYwtRnBVjijseJwJKcm1et5Utd
 OV2jP9CktQlEvDJvxWz4rp7DDJdQJ9wQnkB32T8AIXRVHw6iqIubYeR6gsjjpSdD9K
 F/KgB3PljSRgprGwdO/g0PpaCQ6phbyZRHjlO4CzSSKGwPWgrK/hG+uiPWsIjIEHHb
 eYvRxhB9abG2w==
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1052551455=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1052551455==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QCzYje/thezhTNHZAHbS5n."; protocol="application/pgp-signature"

--Sig_/QCzYje/thezhTNHZAHbS5n.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, 3 Jul 2019 17:09:16 -0400 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> Go ahead and respin your patch as per the suggestion above.  then I
> can apply it I can either merge hmm into amd's drm-next or we can just
> provide the conflict fix patch whichever is easier.  Which hmm branch
> is for 5.3?
> https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/?h=3Dhmm

Please do not merge the hmm tree into yours - especially if the
conflict comes down to just a few lines.  Linus has addressed this in
the past.  There is a possibility that he may take some objection to
the hmm tree (for example) and then your tree (and consequently the drm
tree) would also not be mergeable.

Just supply Linus with a hint about the conflict resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/QCzYje/thezhTNHZAHbS5n.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0dHt4ACgkQAVBC80lX
0GwOLwf/bLqfP05XRzAft1l6aLoPjQIG+JOwKAInxBLdWUC0kQXWzxw3AQWDl7WL
l/VowMzvzxqjHGFW5VN3kSrajP6gkSFW3yS0jK4e3Zihhw3x69anzN5VkyUiEByN
IiYHHCYnCCSxrPjAR6JWidX/upjA0+clsMdPC3JHWENnRKvTsixi6iDO/2rsEnUp
bJeXOdZXuX3cteMU7IuZHFpPDdmzJrIfz8uDQrr0AoptLamWXSTr6ep2G+oeTlhS
tBf+WCTf5TLtu5jElnEJIWLi+3UDmtFYj90xE8JHgnjS3Ks09JB4wovgIj/vyriV
TQALMjcIlQq1iRRyIYe+rd6y6V5R5Q==
=FgfH
-----END PGP SIGNATURE-----

--Sig_/QCzYje/thezhTNHZAHbS5n.--

--===============1052551455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1052551455==--
