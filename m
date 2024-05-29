Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED48D3339
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B7A10F77B;
	Wed, 29 May 2024 09:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UcTIx9cc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B2112895
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:39:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 43A0BCE13C3;
 Wed, 29 May 2024 09:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102FCC2BD10;
 Wed, 29 May 2024 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716975557;
 bh=KVi1M2jGDXQWV9SyAfyW/g1fP5Rqb+cZFLy7giEhG6U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UcTIx9cc5jUA9EYiZfyOhIzHi1q2HtZBEDYcMfA1rlf28zuK+HIWYM7MZ3d9IRa5B
 ScGr3u993Nv7KXJf2jEsG1AnkQiWE21FtdvLPTyXBGLDS57t35t0BC52uNWKC/jeyo
 2pRSPNBg5E3uKi1HwcE9pPXt4nJEvPBvSIW963uG0Ey32zKppun8K6khNvyWxZmHz9
 LAiFAi4D5FPsa6shXGsm98mqCBxNo1ZKQfhqcHhtV2wRmKC1ILoWRR77LrYBGzAKZI
 x9u5R0e2YaXzsmXpRB5zd9azCgoXrLawIuyyWaiJXsvAkp83Pxsf/D4C3+NXF6n1G9
 pQvjqXBMYCKfQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>
In-Reply-To: <20240529080013.2325748-1-mripard@kernel.org>
References: <20240529080013.2325748-1-mripard@kernel.org>
Subject: Re: [PATCH] drm/display: Fix HDMI state helper dependency
Message-Id: <171697555494.2603162.8033022966833815798.b4-ty@kernel.org>
Date: Wed, 29 May 2024 11:39:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 29 May 2024 10:00:13 +0200, Maxime Ripard wrote:
> During the life of the series that introduced the
> DRM_DISPLAY_HDMI_STATE_HELPER option, we reworked the Kconfig option
> dependency setup to rely on depends on with commit f6d2dc03fa85 ("drm:
> Switch DRM_DISPLAY_HDMI_HELPER to depends on") which got reverted later
> on because it was creating too many issues by commit d7c128cb775e
> ("Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"").
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

