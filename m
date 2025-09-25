Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006EBBA1292
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 21:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367BC10E2D9;
	Thu, 25 Sep 2025 19:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VVt2Kqu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122FB10E2D9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 19:25:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E3996120B;
 Thu, 25 Sep 2025 19:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA09C4CEF0;
 Thu, 25 Sep 2025 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758828300;
 bh=b6y3E0Pu+opi8bzUWKgkUqsnKvWRIRG8kX5WciKJSW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVt2Kqu2ERuWAgl+4m/877EKbd51UL66OPOPQThE8HD0FWaK0G6FEJ/KhVEa7qSGF
 kRGDHk+etLeOvrpqTeKXKopRLuIIkDonqmL148ZQ5Hxrt+lPon+vfBCB+hfy1DW3OP
 id/5LrWBKRzz5ej305OxqPg9AjUVEACnZ8SirvvNe1FsXVLeJ3GZjrWkkrjp8aTIgN
 GC7vL8NfQ2prIhOThp4Sl1g/95qV3Nm0JmBxL/e96UR3bAczNVxQEVfJyl1+tw8M7o
 dDQM0lC0ow1BlhncvVMYCXG/GQagnG4x1vgJqrnvpvWrJJgZi9CvNrTvs2iOt6lu5E
 3lmnXI6MCc2Xg==
Date: Thu, 25 Sep 2025 20:24:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Dodge <bdodge@arcticsand.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: arc,arc2c0608: Convert to DT Schema
Message-ID: <20250925-demotion-decree-22fe36d9757e@spud>
References: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Sv4rOuQC8mDbAU4F"
Content-Disposition: inline
In-Reply-To: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
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


--Sv4rOuQC8mDbAU4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Sv4rOuQC8mDbAU4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWXCAAKCRB4tDGHoIJi
0ouaAP9rp7lf/wrbmh12i3bUlNaxg7uk+gWlydlfQrQA3rD3AwD/ddi57BTrxPYD
u9N3vE39RVkhR8/MuNONSlqy/k0r5gE=
=I25W
-----END PGP SIGNATURE-----

--Sv4rOuQC8mDbAU4F--
