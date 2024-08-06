Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72969492F9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E054F10E386;
	Tue,  6 Aug 2024 14:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K9SWzfoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D1D10E386
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:28:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 13CBECE0E7F;
 Tue,  6 Aug 2024 14:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CA3C4AF09;
 Tue,  6 Aug 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722954508;
 bh=+boXmLYjOqKIhuo+Pxlk9RkC7FnDtE0lcqsPWW9QEtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9SWzfoOrfJ6IlogordiXtWykn9daOV2XDKJ2z3fOAJAFSNcrlSCt7eeXbLEWPwv9
 S/zE+R3rCJPwNp/if2nzZ1yul467ut0Lv4/45o75zjafzGcgg0hCcnNZbVmwQeiT6B
 wGj1QqfadlXls8LXCGm9ev6RUm2sRApgZVCn56yi9tPGPd30qb0xm/Zx4TPkAXffwU
 Ju35dzeIAnJI7B3HkQKjkiOhVtdN8cxjQxUB2+E9en5AhrLfqMndF9oj0SAGkOBo1F
 8WWjXpXjVJHQ5lmbK9TqcT93tfwRjDlsGz332J3aQlTPVmY60G6nDorAilq28mh6kZ
 4+aSnOky1gySg==
Date: Tue, 6 Aug 2024 15:28:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/9] ASoC: rcar_snd: use new of_graph functions
Message-ID: <97be3c05-9806-414d-bd96-127166992c3a@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87h6byw8le.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="srqWlU1lK7ancdIA"
Content-Disposition: inline
In-Reply-To: <87h6byw8le.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.
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


--srqWlU1lK7ancdIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:38AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--srqWlU1lK7ancdIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayMwMACgkQJNaLcl1U
h9Ds+wf+PgWlgGI/k2T4toN4PxdGHQGI6pR0qXqXGxXZMeeyGa+O5xMVwKXcA4MK
YepXFEa5pfSzHFosjgHoFBhQhvbHNWbMNS9UC6hEYI1hRSnBRtrkMFtDM2XbR183
abFO1TVlrwT21xNI7XMzQKXW7Eo2cPvqiOYlAvA1XLqUmGwn18ISf0tvkRCR0Yi6
xUPQzpz/+Xk1Ja2dao3ibaynguJ0UdKh4BSOQIn4Mqjr09Q3swpWIKjR+3Jdj+w1
n5gUQ118ZBwwn3A/996z0A+lYjv/a6+s32ZVK2/yLqeLdi5eAUnf2SuEWn7VmMMu
xfpyEU3JXwsDXLM/8XOu/VcufnJ8aw==
=p8Ke
-----END PGP SIGNATURE-----

--srqWlU1lK7ancdIA--
