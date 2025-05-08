Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3049FAAFDFB
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7A110E1F5;
	Thu,  8 May 2025 14:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MTEP5tt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B43F10E1F5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78CBC60008;
 Thu,  8 May 2025 14:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B7C4CEE7;
 Thu,  8 May 2025 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746716335;
 bh=fEgNDPZrZNRyp3TGc3Har21nplk6tkcYVw2UUifqo54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTEP5tt7dNliBCcHOOehxob60rSum9Pbopo0WW8zhGJmIR/skT0dHEUbjSMHOa5j5
 nkrWCrmrU/vpJtrphT12athhSc/LYItlxYymDwk+M5ZxWaGk+8rFa14ff0K9y1n0YF
 qxVAL1MK8Ve0cCk+iMok9KexF8KxRC17H7APMHEkKTCmfDVUAMkoCMfTPO07V9d+BQ
 NOIpvydqdoc6f+Ep2kiPZ7XWFBnRzNHJRKzcQ4EBKhDCdRC+dbEBz2l7oswsHNdDUf
 HjjBVNycYgbbL26y5K8EK2OmUg5CwcGMcrIq6gjE6fPDEDqTrwicHmACD6MVBoEatu
 toDiCKh04/HbA==
Date: Thu, 8 May 2025 15:58:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: convert truly,nt35597.txt
 to dt-schema
Message-ID: <20250508-pointing-trench-90eb0fca2136@spud>
References: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/C3efKQmUrRpGzA/"
Content-Disposition: inline
In-Reply-To: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>
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


--/C3efKQmUrRpGzA/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 11:19:21AM +0200, Neil Armstrong wrote:
> Convert the Truly NT35597 2K display panel bindings to dt-schema.
>=20
> The vdispp-supply & vdispn-supply are not marked as required since
> in practice they are not defined in sdm845-mtp.dts which is the
> only used of these bindings.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/C3efKQmUrRpGzA/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGqgAKCRB4tDGHoIJi
0plcAP9PfwMqhB1ZBVYPcbM9C6x4f7ivdciqlQXAntONfN3cCgD9FRtCjp4Vm2hY
Bvgvm2z2A8grzWSWgajDMBmWwPo94Ag=
=gzfj
-----END PGP SIGNATURE-----

--/C3efKQmUrRpGzA/--
