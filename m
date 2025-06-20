Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08738AE1C1F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 15:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0010EB58;
	Fri, 20 Jun 2025 13:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fOvXj3rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51810EB58
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 13:27:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8BE844144;
 Fri, 20 Jun 2025 13:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10046C4CEE3;
 Fri, 20 Jun 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750426058;
 bh=7iO3Spwl78oqvR7sBJ2s9rW+W2FFODb7uMsgMUDC2CQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOvXj3rcFOvEn7+6z2VCgBASlxMhFXHKU0pYL1+VPMPsw2hcdVW+WTzTp5F8GHa+R
 u0LhsP5h1Em5JyH/IPLhFcL4OeNNPJk6899oXGLsDhgfFKRNZLVBbA9p214KlHqfOx
 C/Uc+tZGtio6132bYstHc81NMVl65Oi/HPNqtYCizlTw7ayFFyQr+HKWDyzmNus1xP
 +9QEmVgYIdUaFamjX53zwHgJOfe7SYq0yO6FQ8ChzilK5h3ygRfq09C+TQfIsF4XKv
 0GoONah3IfiinYalyMqwADfFD4eP1rGE3Qt87rnpopKK9/PppSeF9UU10H5hKMkfNo
 rZHz0DLhR+zMQ==
Date: Fri, 20 Jun 2025 15:27:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
Message-ID: <20250620-groovy-imposing-reindeer-e52ed0@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bdw7jb5mvkrn4ozs"
Content-Disposition: inline
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
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


--bdw7jb5mvkrn4ozs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0

Hi,

On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:
> Put the panel reference back when driver is no
> longer using it.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

When I asked you to provide a rationale for why you think the
drm_panel_put() call belonged where it does, it was pretty obvious it
needed to be done for all patches with the same issue, not just a few
random ones.

Maxime

--bdw7jb5mvkrn4ozs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFVhwQAKCRAnX84Zoj2+
dhZ7AYDOISUO6C76OQb9MnRtqKLlnfKoNLnLbNNJpHKiYfBhR0RN5gz9giVgJRKz
6JU4aXoBgPNzjBXU7e39cZGKgNcl1PHMh/B8GaoCK9FIE1cDbftlr/Xb8NYNNyEU
Z311rJJ3bA==
=G9Cw
-----END PGP SIGNATURE-----

--bdw7jb5mvkrn4ozs--
