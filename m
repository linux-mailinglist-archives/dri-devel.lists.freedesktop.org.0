Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C092A12E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9A110E1C0;
	Mon,  8 Jul 2024 11:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AQ3P9aJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275F410E1C0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:29:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49EBECE09AF;
 Mon,  8 Jul 2024 11:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F01C4AF0C;
 Mon,  8 Jul 2024 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438174;
 bh=GkCDMScZ6xpPh//+28LseBKWHp7NenvPRkRlPOyiXaY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=AQ3P9aJ3/nsJP/gxsJdYkabVnOJqkLRhAA21oT31xuTKC/ofpfe99ZIb9HYUbCO0C
 oUaKDVUvsUm9c/LBO03mzxdCaxSyA4Mej1R0dHUc9e7bffP8l2c89X+CbQRCnKus61
 8acdxZsjHz424SY6QDNR1+CcxyiUZRyifShwhwg7kMlrTXGPxTpvE25kMxl0PkRWdm
 gtI/Pp42ApdL6GCZoD4FqzFLHv6EfBygowOf+CbwaHiw4KfYhqx/yii+aj8rkyWzAT
 H6v7RAAqIC1yIErVBEX/NTnIH09fv61SCETr86YpjTOLc+5kuoXdLZXPrXt842YocM
 RlqixABE/x1jA==
Message-ID: <d687969d9a0d35a9566ba051b5061426@kernel.org>
Date: Mon, 08 Jul 2024 11:29:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 7/9] drm/tests: Add test for drm_framebuffer_lookup()
In-Reply-To: <20240703172228.11166-8-gcarlos@disroot.org>
References: <20240703172228.11166-8-gcarlos@disroot.org>
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

On Wed, 3 Jul 2024 14:22:26 -0300, Carlos Eduardo Gallo Filho wrote:
> Add two KUnit test cases for the drm_framebuffer_lookup function, one for
> the base case, that tests if the lookup finds the correct framebuffer obj=
ect
> and another that tests the lookup for an inexistent framebuffer.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
