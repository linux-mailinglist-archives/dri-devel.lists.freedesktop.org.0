Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BFA5B97F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0183910E517;
	Tue, 11 Mar 2025 07:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LPJoIPRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A010E12B;
 Tue, 11 Mar 2025 07:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741676545;
 bh=DfdQmhz8vbCPv39uRzeCg19ZNOajPR1ntgBF6+oNJgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LPJoIPRWz/N89oXfAe5rOqflM3A+CGl8AkDYy0zX0wKcp7jGcwZBVqt/Nl/6iWkly
 UGF8QFsmvln6Nx0PH19VBn0aY4ePZ2v6omKzKa9g/loFI85NY86qg+6ppmT3Iqbhhp
 M0BJTM8w0CAREss2+AiAszH236HafDTlqyDTgD1BT94ksQD9KtPKJOvAb+U4TPgIfK
 QcXmgz+Tc8rfLIms4KxqiMN5v5mIcIGVfE9QeS3m+Ajw0vLgz+lhkVXUEAOMK1WI9g
 jIS4HXbvnvc4ONpk7hqYGYngEvJcXWjtlNOenVyDl+ZA5OxYX+BZ7b5PG7aZ8pGunk
 WZtIpz6jAsQog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBl7h5F2cz4x04;
 Tue, 11 Mar 2025 18:02:24 +1100 (AEDT)
Date: Tue, 11 Mar 2025 18:02:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alistair Popple <apopple@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE
 List <intel-xe@lists.freedesktop.org>, Balbir Singh <balbirs@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250311180202.058334d5@canb.auug.org.au>
In-Reply-To: <kk4fmefhwnis4lwlvssgu6t54o5mkahgyz4cm3wjh2hgtriexh@x3xseg5v7nrm>
References: <20250307122954.1ab65809@canb.auug.org.au>
 <20250311131214.530934a4@canb.auug.org.au>
 <kk4fmefhwnis4lwlvssgu6t54o5mkahgyz4cm3wjh2hgtriexh@x3xseg5v7nrm>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+2hsQUYER6lr60l67w3/fL2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/+2hsQUYER6lr60l67w3/fL2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alistair,

On Tue, 11 Mar 2025 16:57:49 +1100 Alistair Popple <apopple@nvidia.com> wro=
te:
>
> I'm not sure what the process is here, but having either reviewed or auth=
ored
> these patches I can add that the fix up carried below looks correct.

Thanks.  This means that people can have a bit more confidence in the
resulting linux-next tree (and so can I :-)) and when the merge
requests are sent to Linus, they can just reference my resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/+2hsQUYER6lr60l67w3/fL2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfP3+oACgkQAVBC80lX
0GyEawf/W7+vuzzj0fSnm+S5FH7jSA1QIbUR9kArWxLNAKFTLaoKzFjwOu3Ii9xK
hSzdS6Rr672C8QpgKciVVP3a2L2yvYNcRo5LxXIy1Fe3wJB+HbWKi9FeWw9TQTa7
y+uKgCUMj/6Jsc0lkJneV5i8SDIT5MRr7oUHwMUS6WBjJvUujCf45nuBYJ0KcINN
T0063JuMfyjsWmpfBrMrvC/Pk1RmyFAojsyPLBImkG+ZNwQc560slfgk7bdSf9/H
pAhSw0UMejBPlSfPByOKOv3vA+At1ScwpLoUbQfQD4VBp+s62GSwuAfCDdi5lzJ2
VWqc6oMUQg5wjK1HYGRil0DNy4fmzg==
=j6TV
-----END PGP SIGNATURE-----

--Sig_/+2hsQUYER6lr60l67w3/fL2--
