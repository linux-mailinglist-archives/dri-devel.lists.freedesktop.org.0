Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14867B2E4CF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2FD10E359;
	Wed, 20 Aug 2025 18:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sy2n40jy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2698610E359
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 18:20:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1E024517B;
 Wed, 20 Aug 2025 18:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36407C4CEE7;
 Wed, 20 Aug 2025 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755714051;
 bh=RbplsefrmVx9yxbUrzJhLU2rhn7lzNQM/8FC1eNUedA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sy2n40jywwGVjo3BrwA4p9agmRVoRXDTjg44ZgGe4F8rj/UV9lGrjrs8KiPd0pLVJ
 YkW/dVr1f/bkW3+FMQrjTiiW/lNB9irIufkZzwZLcjTtZrnTYNRs5GQeeJa16nlQa1
 U/MNjsjeJOlbGaN55bx8cqT4lWUokFQcsxWFAJ3DL5nf991R3jPK6M3oAh/pAQ4oHI
 6IWP+YXgmPoMp2/JRL8MuQt0wbPGToGllbBQE1F3ZgYw6gbUGFTtH8G9UqP2i/EJI0
 edaX2vB2YewK/KETxgYmBVDbCOBTUn7Lt1JqJL7sD2H4xInKZI1oMrA9GBI1I1taNa
 nHS6X2TKGRp3w==
Date: Wed, 20 Aug 2025 19:20:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Message-ID: <20250820-agreeably-tinker-63ca6b0b652a@spud>
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
 <20250812145256.135645-2-mike.looijmans@topic.nl>
 <20250812-designing-tyke-db85527b373d@spud>
 <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
 <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
 <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
 <1b517073-cadb-41e4-b470-54a6ad93dd59@kernel.org>
 <3a4448a5-a01f-4d4e-a890-56eb9357abd3@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/ZOkBy57ISHRxPqm"
Content-Disposition: inline
In-Reply-To: <3a4448a5-a01f-4d4e-a890-56eb9357abd3@topic.nl>
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


--/ZOkBy57ISHRxPqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 11:37:24AM +0200, Mike Looijmans wrote:

> I actually planned (I have implemented it locally already for v3) for the
> driver to check the chip type and complain if it doesn't match the
> devicetree. If the wrong device is there, the most likely cause is that the
> input and output buses got mixed up. That would also justify having separate
> compatibles, right?

It's not the kernel's job to verify the devicetree, it should be assumed
to be correct. You're ensuring that when another compatible device
arrives later on that a new string in a binding will not be sufficient
for the device to be supported and driver changes will be required to
make it work.

--/ZOkBy57ISHRxPqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYR/QAKCRB4tDGHoIJi
0o2sAP9EAzYIeuLIPvdoHl8WRMoGk7q1EJo0Ubj8CI5znYzYXwEAl2Co+1KKffuW
r9QASGtzznRJwItPEkgRfk7EDrfnAAA=
=EItT
-----END PGP SIGNATURE-----

--/ZOkBy57ISHRxPqm--
