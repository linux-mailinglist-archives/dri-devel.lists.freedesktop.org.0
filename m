Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C58D4F8D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 18:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9411B6E4;
	Thu, 30 May 2024 16:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BFEzzJSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11C11B0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:03:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 018FDCE0F1F;
 Thu, 30 May 2024 16:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFFCC2BBFC;
 Thu, 30 May 2024 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717085018;
 bh=QedpZOUtub6b2uP1dAyZa8uMB11yxZb4Topvy1A3AG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFEzzJSnC+e8gLcDobEpQdKZ7COOI2E6MtYwiDOmxa0DtvyWCHsqh8++WO4/ZL8Hs
 Re7tlTPBI9AnFwUd8an9asWn+JsLHO23VzxA6ikMBuPdGRzja0meeoEJgRXQp2MUEf
 MTbH2fF34sBk8RWCxP8b3qFMiLgk4yWEjsHlBbDT/NhE85UueG14p7GAZDWxl0b/QS
 BOiVIekKsKdO60dWasVCrxc9zXjaMSVMY37UNCP5/wLEt5/BZV+2DDHb4wqEU2riUi
 xVBuzz/J4A8EPRy2G1qzIRPijo5Lp8WGSSqIPbso8Bl4oQJLYC4WYwZHG94Nbv2Rsp
 GdM4JjEPHXCLQ==
Date: Thu, 30 May 2024 17:03:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240530-kinship-lucid-71610ff9cd93@spud>
References: <20240530082318.40516-1-ryan@testtoast.com>
 <20240530082318.40516-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xDGbntgEI+ewx1OI"
Content-Disposition: inline
In-Reply-To: <20240530082318.40516-3-ryan@testtoast.com>
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


--xDGbntgEI+ewx1OI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 08:22:22PM +1200, Ryan Walklin wrote:

> +            port {
> +            	endpoint {
               ^
You accidentally added a tab here:
/stuff/linux/.git/worktrees/linux-dt/rebase-apply/patch:71: space before tab in indent.
            	endpoint {
warning: 1 line adds whitespace errors.



--xDGbntgEI+ewx1OI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlijVAAKCRB4tDGHoIJi
0hB3AP0QOFPwMF0B78COvjak+gYYwyU54j/GgCbmc0iIUt3PIwEA9yE+E//XfLzE
luCPROuxrnU85ncZmVfF+e+6bQdLng0=
=bQn5
-----END PGP SIGNATURE-----

--xDGbntgEI+ewx1OI--
