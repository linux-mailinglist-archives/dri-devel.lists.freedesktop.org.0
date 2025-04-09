Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EAA8215B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368E10E82A;
	Wed,  9 Apr 2025 09:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="djWdzQU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4310E82A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 09:53:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01A7068432;
 Wed,  9 Apr 2025 09:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D87C4CEE3;
 Wed,  9 Apr 2025 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744192407;
 bh=SSJ8+LNI9Ymj03X2elhN3Ny3K+NdOwrpogHRolCuDig=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=djWdzQU3aKU1sVuiGi3dARZouB6OSwbkTkV7zKyRC9t9no8iON9JZM3BeQfaJDDWx
 nB5czlqQknCOcMXUdHPEjYJ2BLXar7iKBmX5UY46pWOIyoYmLbUWLv/EcJ13Fs2PDB
 GeZu6FOcEBCXjhDES0vG4V7nz8mxHzG4aLCgH7xtd+I21s1RBEbB8+T3snZaybaCXC
 sgJRsl4wfl4KQFbTWB5cZE6vA5fzZWwplh2cCbsYKfRrOqCSByPMdwSG4d4oCwEYwq
 oiT5cnzePuL3k2Dp+VUBb/92kJcBot7ffDTUtZFiFzqHIoVFTKyjjC/bJ0WaJ7ObaT
 xZ9pawpqMdorA==
Message-ID: <7718bcfa86013d711e209f65ee398c3d@kernel.org>
Date: Wed, 09 Apr 2025 09:53:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 2/2] drm/ci: Add jobs to run KUnit tests
In-Reply-To: <20250409061543.311184-3-vignesh.raman@collabora.com>
References: <20250409061543.311184-3-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, daniel@fooishbar.org, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com,
 helen.fornazier@gmail.com, linux-kernel@vger.kernel.org, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 quic_abhinavk@quicinc.com, robdclark@gmail.com,
 sergi.blanch.torne@collabora.com, simona.vetter@ffwll.ch, tzimmermann@suse.de,
 valentine.burley@collabora.com, "Maxime Ripard" <mripard@kernel.org>
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

On Wed, 9 Apr 2025 11:45:39 +0530, Vignesh Raman wrote:
> Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
