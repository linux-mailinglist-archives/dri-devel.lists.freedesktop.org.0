Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE4B4463E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 21:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A8510EABE;
	Thu,  4 Sep 2025 19:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BAQ/matM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD38910E042
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 19:17:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A802760247;
 Thu,  4 Sep 2025 19:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7A5C4CEF0;
 Thu,  4 Sep 2025 19:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757013428;
 bh=4cyZJK5eWDP/Os6zTLIOjZf3POA/Dw2ry2+a0/RupNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAQ/matM+PqMMACKj9h7Bzj61ss27I49ThmK0YjHCe39lYfGQ4bTj/nu3jK2yREMt
 f0DhoPVqOlFzQ/EhJaQM4pQ8pVn9wfMNHSooHmMXZ55RRgmVxLwZZSGEvYhrpmbpX7
 NS//yBebW+8myAVveojmau8n8ZCLinNGb14vsSzsHmsDvThT/kbVElT7kW1dYarhaU
 uhBuEWdKiC57zM7jfYPh+LmA8LMQm4BuDO/A4Q91offvA8G4S8HiUWusqDfc/I6CX5
 +n8vyQcXDLFtsaXzi0cL7HpoEnVs9vHzzor103Thyfh13/RfZj3LdJiGfb/v56z7lf
 lr99Pg4HaF4bA==
Date: Thu, 4 Sep 2025 20:17:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Yakovlev <vovchkir@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add compatible for
 STARRY xr109ai2t
Message-ID: <20250904-utopia-boggle-3d26664bbbf0@spud>
References: <20250904002232.322218-1-vovchkir@gmail.com>
 <20250904002232.322218-2-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sAVWlh9d1DjThvII"
Content-Disposition: inline
In-Reply-To: <20250904002232.322218-2-vovchkir@gmail.com>
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


--sAVWlh9d1DjThvII
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--sAVWlh9d1DjThvII
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLnlrwAKCRB4tDGHoIJi
0tUnAP9L1WfnoP9hrgMwAnX4lKp7VleNEjUU2M4rmDu17AJbeAD+IFdcN7Kru1QB
/l0Hp/v6QSwcBhJgRdTsZPjmhKxNFwg=
=KRbg
-----END PGP SIGNATURE-----

--sAVWlh9d1DjThvII--
