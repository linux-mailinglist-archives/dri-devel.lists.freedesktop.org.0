Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C6AA600D
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 16:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E4510E355;
	Thu,  1 May 2025 14:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FWLMTJMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EAD10E355
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 14:32:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45AD144515;
 Thu,  1 May 2025 14:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D622BC4CEE3;
 Thu,  1 May 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746109924;
 bh=LdsVNnkJrHoLXbSbUPMDpxSQ6NufQT5IcMdgtFRep4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWLMTJMZOZ3qliqI4m2QyJHE0D+y0U3OZ+gBzsurwZ/3G4nS9NbINvQOlQXViPEGL
 195xHGu2sz2XFr93Vv/u/0u5I8C2HCBQzlau1qDVYAOpmJJ3BI/kFm4cu+vTSMmLVA
 +kmHG0roQT8PvEWjgbllblXYuwCKyhWtGg3NzhoBZY+KvWr4e1KIrRGahTO4YKQuGF
 gHyAuFSMnIh0au3LcKoUatsxfiUntGIYJfPPnmvf7g2fU4cPRKbTGv3C0SXXdHvzEd
 LvIF2U/zV8HMer+dy/qL5vkhBc08C5pG79Mrk2H7INdino9x970zi8vhaitw1npsBV
 uluww+Bp0YuTQ==
Date: Thu, 1 May 2025 15:31:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quentin.schulz@cherry.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Message-ID: <20250501-groove-decode-7c02f67c8752@spud>
References: <20250430082850.244199-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vv97M0+otrzJGnBd"
Content-Disposition: inline
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
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


--Vv97M0+otrzJGnBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:28:48AM +0200, Heiko Stuebner wrote:
> Working on an upcoming board dts, I noticed a dtc check warning
> about the port node and at the same time the kernel-test-robot
> noticed the same warning with a overlay I added recently.
>=20
> So allow the port node in the binding of two leadtek displays
> to fix that.


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Vv97M0+otrzJGnBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBOF3wAKCRB4tDGHoIJi
0omYAP41/ajL1HV2bP3vX446tkfOhX4TMOtMoa2YlBB84At9wgEAvxkF9+TChQ7r
YhDexXpjgmdSgVJ8yXv6eSalclm7Kgc=
=0TIm
-----END PGP SIGNATURE-----

--Vv97M0+otrzJGnBd--
