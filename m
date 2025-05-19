Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DEBABC3EB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8B10E266;
	Mon, 19 May 2025 16:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ux0OAwzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641610E266
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:10:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F7724A304;
 Mon, 19 May 2025 16:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57595C4CEE4;
 Mon, 19 May 2025 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747671037;
 bh=8Gfs1ppaN2jlWBdNlgUpnLmCuisZo8JpB/m7e1EOfY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ux0OAwzsDhwEUzAgkYnF1PBlXBNY6/IoCrn18FzOxHABKpbXVPdqB/F05wVxnJi/L
 MlZfa298W9L0UwoSlLPSOqLLs3UmFc3YwUt2v1OKWKNMZNg5Iou6qkVl8aQxWb+zBw
 MXuhC6BIghUZOGzqYiW3cVf9Pio9XGDImV+ZL9u665zImRAbTKd/GTrHVtp7O7q/fd
 4DkuDjCcYityBt6kZfId6BQhugdI/032oTdCFCPMHpNCzVr0iVYiJCrOssmCc19hIH
 m97TkiLH9BUIaPwlKrxlhh7swkUzHiIonUfghBOq63e070hZ5Ige8DSZf+ONWROGT0
 KdS9NfvBn+dJA==
Date: Mon, 19 May 2025 17:10:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add Rockchip RK3528
 compatible
Message-ID: <20250519-tweak-showplace-264a15576e76@spud>
References: <20250518225418.682182-1-jonas@kwiboo.se>
 <20250518225418.682182-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zE6C03YwwDfltbjP"
Content-Disposition: inline
In-Reply-To: <20250518225418.682182-2-jonas@kwiboo.se>
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


--zE6C03YwwDfltbjP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:54:11PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 SoC has a Mali-450 MP2. Add a compatible for it.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zE6C03YwwDfltbjP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtX+AAKCRB4tDGHoIJi
0no8AQDkDSkDoPmDYFg2jj31yNSF71G37/q7Z+IxLIzuuuABUQD+IxyTT4p/MLMI
izTE/i5XxqvB776nHAIckmO8hCXKmgI=
=b3XN
-----END PGP SIGNATURE-----

--zE6C03YwwDfltbjP--
