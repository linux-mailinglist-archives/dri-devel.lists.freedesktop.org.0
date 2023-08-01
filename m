Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5185676B434
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283D710E3F6;
	Tue,  1 Aug 2023 11:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F1310E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:59:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C429C61576;
 Tue,  1 Aug 2023 11:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB31EC433C8;
 Tue,  1 Aug 2023 11:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690891160;
 bh=6AHpkW+1Vl/pIzsm+KzIZOLB+nxZCt4ZJydu7QiZDjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bvKF6P7N0m3zB0nnePyxPnqDHStcVAcph1SwLx0+grePPtgnTZkfrH+Fplm7rCBKp
 h3n0nQ/UsSvLX8Plk1e3UVqTo8ZwD+N+zyEellIcLUP9sD8c8+x6xNeZhcXv62Tu7Q
 KSMbKT2G3GaS+fnhS5MrjdxtvBM4fyxEZQuJNPoR2prZrNgo0D2Y/WtFiOQP0q0oby
 AOUofNC93tdVQ4juvzFjTgPfP6pDdobkv8ule29qz6CY95lirubFicboI7WUE7QY6Q
 D8FR7qkTgvU+bULj8KDUb/Y7T0Qrl+01Zo/MrswIU5jeQ4pzh7JkVzjcMnmWlDSxoE
 vg8kR/Vw1bvOg==
Date: Tue, 1 Aug 2023 13:59:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 7/7] drm/vs: Add hdmi
Message-ID: <gkavtc4qkwwgpre5to4sjvd3e6s3a2mo6qoychxid6buiu2c2v@xx47v5erxsvn>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-8-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3xwzbtwdfjoxzmbg"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-8-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3xwzbtwdfjoxzmbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 01, 2023 at 06:10:30PM +0800, Keith Zhao wrote:
> add hdmi driver as encoder and connect
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>

You've ignored most of the comments I made on the previous version, so
please go back to that mail and fix everything you've ignored.

https://lore.kernel.org/dri-devel/ayygsdwzogu4ygkobs7zkroxicxtixtp5bxayn5vz=
k4qlkwt6x@yo5s2qwt77mo/

Maxime

--3xwzbtwdfjoxzmbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjzlQAKCRDj7w1vZxhR
xW+vAP9NEuZQurYGyBDJt6E4rkErtbkDJOx6fO0bKpk2+IjzDwD/eSkZ7tV0bwjK
r1MKgVz2slSLf3AktsOtIlI162uxrQ4=
=9TvY
-----END PGP SIGNATURE-----

--3xwzbtwdfjoxzmbg--
