Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DFD7D5D6E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 23:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198610E4E8;
	Tue, 24 Oct 2023 21:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDA210E4E4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1698184081;
 bh=+KNL7g0g6fROyWFjUkr+boWpQuBKjpa8CR0pq/4D8zM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZCxUosBEYc3Ms/YFf2OU6tOvfLg5nUfAgEjlslRBrH8HFsvnOX7p0RjNIbyXX5+vT
 kLvhpB2z+xJXivQTCp/1CzLBBuTphl6IyheewahXkuCN2rMRrZzdM/w/+rfoJF/HbI
 jUyyTgeI41MvCeTcqYty+7ILZz/AsD5DyKcOQspwfqv/bvfE8KVOJ7cFydPW33Kvgc
 /FQNyobve+T5P+nhvvWAoCcvIR5EDLoGlqBSzb4ImlE5CVUflgsKKbQ7RsPtjiystC
 iEZdea9SYjun90nkUk0ler8hcScISMAwy/oOkG4FSYN9D7OQ9tt+PhiSb3RSKlnW0N
 U7GnVVMtOQW6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFQf85gM0z4wcc;
 Wed, 25 Oct 2023 08:48:00 +1100 (AEDT)
Date: Wed, 25 Oct 2023 08:47:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20231025084759.5685dac6@canb.auug.org.au>
In-Reply-To: <CADnq5_Od1cQFp=5__LexMKzXwtnmcmcAidE-XsLkL3N4oz+5sg@mail.gmail.com>
References: <20231010124357.5251e100@canb.auug.org.au>
 <20231019120618.71424848@canb.auug.org.au>
 <20231024115903.2d73440c@canb.auug.org.au>
 <CADnq5_Od1cQFp=5__LexMKzXwtnmcmcAidE-XsLkL3N4oz+5sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yyBbuB_Al3833GDe2bbEKuu";
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
Cc: Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yyBbuB_Al3833GDe2bbEKuu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, 24 Oct 2023 08:57:16 -0400 Alex Deucher <alexdeucher@gmail.com> wro=
te:
>
> The two patches are in my -next tree and in the PR I sent last week.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/yyBbuB_Al3833GDe2bbEKuu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmU4O48ACgkQAVBC80lX
0GyZpQf/e3wzrXrl45ds0KDXf61j+fkFieASUD2DPn9l+KZ660gcLuc5/90qoVNF
peUQwhGDMDyxVykOvKD0NH/kAtyZCl1kZYBlbG8SHYOenOy7V1G2k2NgSjBpGIVX
u0XmEGi+arBcS5duyT8RhoOjQ1L9rtXXjPeBinPUCuICEORF9BaNFCKDtucLlOyB
EBS/pv8zrwrl9OpSU/XcnFqSDsgy7YegGnIDPDhbK+9MPbvrts/TzbZ+DG5Ckd6e
GKl/gfWS7iAJFdXwDC0AHR6ofkVh9I/0SrHJlhkfkLwAB9M+99luya+KPxCcNoUV
XSuFYEGKPfWLlfe/Rhz5H4VFayxssA==
=2aPf
-----END PGP SIGNATURE-----

--Sig_/yyBbuB_Al3833GDe2bbEKuu--
