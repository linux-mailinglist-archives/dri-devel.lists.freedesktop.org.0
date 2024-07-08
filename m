Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3378A92A12A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404E10E187;
	Mon,  8 Jul 2024 11:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEF2/a1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E5E10E187
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:28:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AA887CE0B2B;
 Mon,  8 Jul 2024 11:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86CAC116B1;
 Mon,  8 Jul 2024 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438120;
 bh=hREiMa8eOerDDuDI1lgvkM9c2TUJQF19INz8wcgUkU8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=WEF2/a1ePrAoWAh+rOPdRXM6ZCBLWcPanRkBbBCUtUV7ReJKVcrMpbnXKcloNSPiw
 QCCcFiyoz22mpkNMpAUS1kpBAHeYhxTzr9Qp9VKnabsPnI83oLIbLuvjINDczavWHi
 VOGkXcXZEUtK3jXBGOqqelSpp9q0uQ5sa+XZHMZSH4LkhjDvq9NDprLLMHriCjCS5I
 Xse0B0cWWehTgrOHFIXumXPPPmJUsXxst5ViifoENheVScrblz9B55BWaU2sEB9kt4
 HSbvyZ1aZ48c2BXR8itKQgN+MDhs6jDF/GTTbQ/hiBZIV/h+MESxuRqFnoJsa/LAXI
 XVLpP3qXrb+Iw==
Message-ID: <53f28cb00fb374c3366f17814fe0ae63@kernel.org>
Date: Mon, 08 Jul 2024 11:28:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 5/9] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
In-Reply-To: <20240703172228.11166-6-gcarlos@disroot.org>
References: <20240703172228.11166-6-gcarlos@disroot.org>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?b?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Arthur
 Grillo" <arthurgrillo@riseup.net>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, "Tales
 Lelo da Aparecida" <tales.aparecida@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Wed, 3 Jul 2024 14:22:24 -0300, Carlos Eduardo Gallo Filho wrote:
> Add a parametrized test for the drm_framebuffer_check_src_coords function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
