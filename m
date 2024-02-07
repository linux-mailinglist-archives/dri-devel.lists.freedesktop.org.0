Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24884CE6B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 16:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7610EDDA;
	Wed,  7 Feb 2024 15:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HmzJMu7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42810EDDA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 15:52:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D887BCE19DE;
 Wed,  7 Feb 2024 15:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF34C433F1;
 Wed,  7 Feb 2024 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707321148;
 bh=cHYNDEi3WlHG4angWaXSJlNb7gbznKoIJltmiX4Cfa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HmzJMu7cKmZvdytEdbGNsrv/J2EM5eMY7C8ep99MQMYPXPSfn5RXk6Pl+W5hxQjgj
 5cLwXKOmxQ/tmKF1MbH05iRh3y/HS4iLUc5HifLrxW9uA3yXZNRc6eNEPyJgqVc0Gv
 9yzu21BUaTqV+u7tAOPY/QHvCFi6V+H4WOkZl2Tk7KNGGAuokp6i37yNSprn5+qaR5
 ZQ7BWDjoMTCfchTu6lEgIg+r7D5wm+Jw9AhbuJk1UszZ0E8mXr/LNG0YrnarhABAiH
 kzb6YDDJUpErLBcGRtQRMLk4K/6nvS9ickaC2GYnuW/6jWuefkwskvwVmUoOOSkWcL
 3WEGQiJt7qE0g==
Date: Wed, 7 Feb 2024 15:52:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 manikandan.m@microchip.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, geert+renesas@glider.be, arnd@arndb.de,
 palmer@rivosinc.com, akpm@linux-foundation.org, gerg@linux-m68k.org,
 rdunlap@infradead.org, vbabka@suse.cz,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Message-ID: <20240207-raving-chatty-7961fb5c5d43@spud>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tvxf/pUyWbuFS5ma"
Content-Disposition: inline
In-Reply-To: <20240207102802.200220-2-dharma.b@microchip.com>
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


--tvxf/pUyWbuFS5ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

$subject: dt-bindings: display: bridge: add sam9x75-lvds compatible

If there's a respin for some reason, please update the subject to match
what the commit is actually doing (adding a whole binding).

Cheers,
Conor.

--tvxf/pUyWbuFS5ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcOnMwAKCRB4tDGHoIJi
0ue9AQC+O1AcM535fj1ORbNpOe2LbZVdJ/keOqbM5p7WIHcV8gD/aJgptEm38mUu
e4pTQU4ClUkiAFbmRHcNmXKC7rhfiww=
=057J
-----END PGP SIGNATURE-----

--tvxf/pUyWbuFS5ma--
