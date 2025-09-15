Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BAB58404
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D00310E526;
	Mon, 15 Sep 2025 17:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="teYt+F55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3910E526
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:52:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 58EDD44013;
 Mon, 15 Sep 2025 17:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9434C4CEF1;
 Mon, 15 Sep 2025 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757958762;
 bh=QVjtWRQj//qcsIk5ldU0SmXs/R0deh67fLAsxifApOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=teYt+F55IKAnrnN0DZru8mB8wI5H4tTsk7wt33eSj/xn6gfkjRBn4gLKUSBL9UYr5
 UZ1GCuBUvYn9PHoAbzvjfFvik9bz0u9zyDfuaey9guJ0I3KYuHEuRNqlmA3qrrhOY8
 CegsA90hjs/Q+XEWmrv/tbYvqQN+UKZtUSLRjRS511mPcTv92vkYztU1QNfywHwQA0
 A7VXZbH7r+oPzFg4UFr5AJbMBdvCb8+HcKh+vh9PtlXC7WlrApvgWecqzGPqAgvJuS
 PGfXC48ip+Q9Zw9B3cYeuQ4jAGsp52T3c841rbLTGv7gGrSs7++GuOBo1Eh3lFZtru
 eYNflOjXdhjOg==
Date: Mon, 15 Sep 2025 18:52:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250915-deodorize-proxy-b18e41fa8668@spud>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-2-olvaffe@gmail.com>
 <20250915-numerate-makeshift-c076500aaec3@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zj/IpRh5L7G4umUF"
Content-Disposition: inline
In-Reply-To: <20250915-numerate-makeshift-c076500aaec3@spud>
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


--zj/IpRh5L7G4umUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hmm, actually there seems to be a more complete binding proposed here:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com/



--zj/IpRh5L7G4umUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhSZAAKCRB4tDGHoIJi
0h7OAQDrJvvwez35Fxek/+gxVlWQMSUkdCozpI6UIMXqKSSfyAEAgfq/22/qmjlG
oPynLEW/PzKMbJDGm3gR2kAUCl+J9gQ=
=LQXY
-----END PGP SIGNATURE-----

--zj/IpRh5L7G4umUF--
