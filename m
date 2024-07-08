Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A250492A100
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D610E16B;
	Mon,  8 Jul 2024 11:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nNFzNGsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5C10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:25:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D601360B98;
 Mon,  8 Jul 2024 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337A3C4AF0D;
 Mon,  8 Jul 2024 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720437949;
 bh=kSqb0iL0CqG+0cO2oq7V+l6sW4KodeeizttoS/UNVQQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=nNFzNGsCX4ScarE4ivhKoQTJOn+ih3CgZa3S1rU5cx+I6Jzm7sfya3IRnZe7TOgVx
 SX25PitZ+c8QDPZSMZz5DC9K0+CVtcZC0CbpJCszuUoee149nUdVvBQX6oBp5j3Mfp
 Y3aCbnFyl/iD/8zu1UdkXVNOsj5QCnDmOl6Bdd9WGusNovmS+q7al2otg46b2sonp8
 d+2tDwWT63+dO5Fh+o+Xk79zSRDrnN9bfktpDs189H7KFoG7NtophQdLwqN5BaFPZv
 dYwdd/Imptva0U46eanLI464PWLu4DEPLa/HOoW5AIHla/hpfm9/IX9g9IvSHkgSbY
 HSG7QV0yPNX3Q==
Message-ID: <048e4f4036a64a825640d8b607834ff2@kernel.org>
Date: Mon, 08 Jul 2024 11:25:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 3/9] drm/tests: Replace strcpy to strscpy on
 drm_test_framebuffer_create test
In-Reply-To: <20240703172228.11166-4-gcarlos@disroot.org>
References: <20240703172228.11166-4-gcarlos@disroot.org>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?b?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Arthur
 Grillo" <arthurgrillo@riseup.net>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, "Tales
 Lelo da Aparecida" <tales.aparecida@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 3 Jul 2024 14:22:22 -0300, Carlos Eduardo Gallo Filho wrote:
> Replace the use of strcpy to strscpy on the test_to_desc of the
> drm_test_framebuffer_create test for better security and reliability.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
