Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CA22969A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 12:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73489BAC;
	Wed, 22 Jul 2020 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D3189BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 10:50:01 +0000 (UTC)
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1277206F5;
 Wed, 22 Jul 2020 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595415000;
 bh=w2CgJwPey3KVWQwleXtivdygRth+bNEvTOILhdD+/AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktpV/MHdEMtUX7VhR6Q03U9rnmvRjAn/cCUDCOT90hUt/oZIpp6HGi9jifbCoHlxM
 B3CPB7deqGF5FkbypZhZToKqnJbjQzTMWwl7ewOm6nRUVd9C1xkw+3dynR4Sm63kL0
 a3CqdUq8T0f4r9LBlZ8KNYxZpCPBj0OuG/z7M8TY=
Date: Wed, 22 Jul 2020 12:49:58 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 09/20] Documentation: i2c: eliminate duplicated word
Message-ID: <20200722104958.GM1030@ninjato>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-10-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200707180414.10467-10-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============1544209947=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1544209947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n1iI6MeELQa9IOaF"
Content-Disposition: inline


--n1iI6MeELQa9IOaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 11:04:03AM -0700, Randy Dunlap wrote:
> Drop doubled word "new".
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

For the record:

Acked-by: Wolfram Sang <wsa@kernel.org>


--n1iI6MeELQa9IOaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YGdYACgkQFA3kzBSg
KbadpA/9EQDFCbpqtn7iQvroXO/jn90XPgO/eYkUVHWLS+Wjvnn5pwwQSX2PDYKm
dx12lepK1qRqXevubBe+L1iqPn3D0E9fN76wFuduXdKo2yMlq8o1fjkw4YAbSEmm
oJK0WrVBfSBaCFfGTy7Uh7pc5Tb766msmLYfCC6VY5Rdlr9F9ETmHgI+7S6Lx8BJ
dXai3pSkOYaYGBajVdqRXRemtrE9x29nMbV8k2vFlELR1sRW8LAu4WOJ3SA9PfcP
jzPlcM8IV6nv2jVUvg5jpR9KQ3SHBRkKkmUgClWt/ZnxpqAjCziyimemRq6GmhNK
WIR0JiLChmgtF4XL+vPLBSiBHLKR4RjcpFwhJaAs3xYUymtdag+uTWvy6VfXliRy
rp1wIFSGP/0XynfajB+xXWjtV2CGKn9nmxwUWzCiz7QAikyI920ciFEGXYfhD/9a
opU6msSpxF+Oh25LZo2dR5QT5GZx9p1wkRxBBYYIeeboxv9LlMyLMXATDoCBGW/T
1jwmnIhDOetaTLzs7P2o54/LP32bVBsOfj6mcvZQ5N4ShIVMgHaiXBOUzqike+L2
EHwIHXjxI7NOeKpR5hXdr4JBNLAfyjtC6P0dCS03r2tNfuEizFlH2y7jDYvAcxKJ
5BqXSC1DnU7frboGfq/9qLfWIBUaeK34RIU46gmN/knsgV8y9zc=
=l+uH
-----END PGP SIGNATURE-----

--n1iI6MeELQa9IOaF--

--===============1544209947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1544209947==--
