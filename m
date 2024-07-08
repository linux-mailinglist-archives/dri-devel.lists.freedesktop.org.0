Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA892A0F9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BD410E12D;
	Mon,  8 Jul 2024 11:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TqWXbu9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9C10E12D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:24:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F156760B8D;
 Mon,  8 Jul 2024 11:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50325C116B1;
 Mon,  8 Jul 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720437888;
 bh=/2fJEyPZMgnn4zfOvE38fjlcORhVUDhvBr2A+sFrBks=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TqWXbu9HZDIN5iMDit3pRYoZaGee0QayTuONQG7FyrWXTCuq1fLmBx6hAgHk8xwau
 gP993+NUC4dfRkz+wBFXabsMYO/42zKWiqryaaDegiMgDb8rvC+KEV0Uyi8owQhPYA
 2sRX51IaUdyQuwe5U3tKajySDnqMfk9tMCErpEmO5wJWVsm5eGiiFNWGZ5mtMD6OdG
 h1cyJDhFeiRmiDoL3WyCSemDNODj1eS3ia/jBN88XW3YZ0bPH6+327ZrhFCxiJmSnF
 +6hGRxat3NylctHWK69AeEgkDeQpIPv4SSiEUgIMfPgSvq0L8C+GGAqXe3fZWD0E4/
 9kuDv0WDh+G0g==
Message-ID: <95c770cf69b4219c10d4ebd04b2a707e@kernel.org>
Date: Mon, 08 Jul 2024 11:24:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 1/9] drm/tests: Stop using deprecated dev_private
 member on drm_framebuffer tests
In-Reply-To: <20240703172228.11166-2-gcarlos@disroot.org>
References: <20240703172228.11166-2-gcarlos@disroot.org>
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

On Wed, 3 Jul 2024 14:22:20 -0300, Carlos Eduardo Gallo Filho wrote:
> The dev_private member of drm_device is deprecated and its use should
> be avoided. Stop using it by embedding the drm_device onto a mock struct.
>=20
> The new mock struct allows to share variables and even further mocks
> over the tests in a cleaner way than using dev_private void pointer.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
