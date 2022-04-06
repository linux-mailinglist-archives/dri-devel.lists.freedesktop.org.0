Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B64F5532
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 07:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE3E10EBEB;
	Wed,  6 Apr 2022 05:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC75F10EBEB;
 Wed,  6 Apr 2022 05:51:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYDCv2qclz4xNp;
 Wed,  6 Apr 2022 15:51:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649224299;
 bh=FI2yK1w4BoxDLceAwBGSkRpmSZfiLC52c+HFR+YTcCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tiaTpjp/qW7eHcK49V+/LajlejZwX3CwONOlMM6PuebxYbRAAEI868g8TzoBpowjd
 PJD3ad4dNW3WiPGRjh/+0stYdae4f/eJRpLI1FIExaLVqho461FsBaSlGqMCg9P8XO
 xKyG0bwXuoqlhm5HLpaExgaqfnSa5ukpJ4+v+Xa7F0jpu48bZ0CC5OLfuEpXRmLMRG
 qIsaVlKvlSJUfyWZXZven0N1LTLHWtpP/3d4VjoUJNwaurUwXqx0o9ifBSwTfYclJO
 niRGHo3ZP1GCINR4zjGIR6pgoWulrsBabtFNOu55xXFR7udAnH5awt3geuwrWm/NZ1
 0nPnsWPoIhx+w==
Date: Wed, 6 Apr 2022 15:51:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20220406155138.61a8d85b@canb.auug.org.au>
In-Reply-To: <20220406154431.567414c3@canb.auug.org.au>
References: <20220406154431.567414c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ICUojPUEsse9a.hRFPw8grO";
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ICUojPUEsse9a.hRFPw8grO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Apr 2022 15:44:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (KCONFIG_NAME)

This was an "htmldocs" build.

--=20
Cheers,
Stephen Rothwell

--Sig_/ICUojPUEsse9a.hRFPw8grO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJNKmoACgkQAVBC80lX
0GyYEwgAi2Imi3EmsiOg/zkGfnhxmHGLL2KeL8kX/wT/RCLY57XKvK2wt/Sc/PCu
ZANpi2cD7vQa0UT93sHz03g07mzqI7UEnO8cP7uOD+9oSCcy2FaUDKAzcXsIIBPq
nS3HLdn5UExItZxnkY685cAHWUY27rHgAT//lkqL0DXVO9kJGSkmtZGepvEZh4pa
P9f/rzodnxaaT7eAuzmfLb1q9OtQb7N38QOX2S0ZTd9o5mh5sDAVhEdRug4Y+9nU
tJ5Vj8qpTigEVk7HQtigjy6/17vv2Hjgv8aRTxWboTMfqXHgLDgHtyHKknA3ylX7
c4FHkGeX1YnJ/pA4x5N/g30ZuNpWqA==
=6WJm
-----END PGP SIGNATURE-----

--Sig_/ICUojPUEsse9a.hRFPw8grO--
