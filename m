Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D5B3F019
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 22:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5ADA10E05B;
	Mon,  1 Sep 2025 20:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cax/6wFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09A10E05B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 20:53:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC894600BB;
 Mon,  1 Sep 2025 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BD1C4CEF0;
 Mon,  1 Sep 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756760021;
 bh=EmEPDFeBBJxotEJAdRweNgxFgd00ZCenQukoIPB92JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cax/6wFl529KhgAtAeHnm/zGOt1M5B4Q5BqFpnj3fSmO5hLNcDbTPz8cBvcYAn1Je
 2uWy3w6ZLKjjkxqi4U6cM/tSmmOPw6V40BxCcB126yzz4m1KNY0uSPtvFU53FKcaXm
 O6vgKrRWpqExHgEefovwHz7RX/tfE/YiDzXPlANfSj95b/zr8fumVQ9l7JK4BpPzvo
 0tIA8oBykMQnbDP3flII/mK0bBNFg8voQT1sI0QqNXe9r6Sv0dBCOst9sbbbsDXfUX
 2RXwWZWt5Gi/6ucV+OuSONPU1oX/ZUzZh41bx31FaMqc4YIP+xGk7VP09AwYjSrbvC
 OzqhBe2kcR9NQ==
Date: Mon, 1 Sep 2025 13:53:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aLYHx6NgfLovbBAG@gen8>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
 <aKjWiU4fQw3k77GR@x1> <aK-BwY8c-OR_WqNk@thelio>
 <aLDQjq9U_mDvMTJo@gen8>
 <a329ff82-ca79-41ac-b61e-e843103f55a6@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gSZ+C/ozphYAjkpf"
Content-Disposition: inline
In-Reply-To: <a329ff82-ca79-41ac-b61e-e843103f55a6@imgtec.com>
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


--gSZ+C/ozphYAjkpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 11:16:18AM +0000, Matt Coster wrote:
> Hi Drew,
>=20
> Apologies for the delay, I was on holiday last week.
>=20
> I've just applied the non-dts patches to drm-misc-next [1], would you
> mind re-adding the dts patch to thead-dt-for-next?

Thanks for the update.

I've now pushed the dts patch back to thead-dt-for-next:

[3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
      commit: 5052d5cf1359e9057ec311788c12997406fdb2fc

-Drew

--gSZ+C/ozphYAjkpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaLYHnQAKCRDb7CzD2Six
DFx1AQDhO4oxK/8VUlhe2hYNiss5b+vRMU1sBAHKoo06bhapNQEAj2PyvDIqT8IF
nKIS+EVxulnWrJ7yeHXsijpV3oST8wM=
=NHPw
-----END PGP SIGNATURE-----

--gSZ+C/ozphYAjkpf--
