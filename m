Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C0901FA3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821710E384;
	Mon, 10 Jun 2024 10:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J3OHPHQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C0A10E2A5;
 Mon, 10 Jun 2024 10:46:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07FBD60A72;
 Mon, 10 Jun 2024 10:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CBEC4AF55;
 Mon, 10 Jun 2024 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718016370;
 bh=RohZKedQ8hCwuKle3kQFh2lbTizbfj4MBLXRuGSRmRM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J3OHPHQGBrYfPeQOOtj4IP5MiWBphZe+qsdqv3lleSov7MH2WxgFpTkL9PVN7sPoT
 fTuN8K0eTQATNSv/okqHfaDloiryZtOPhpuZBjfBAaUpc/x9Dh8r/CAkeMysNrk1ez
 /ochIONg5jGcJj11/yTnf48DuSKPaCN9Hmsu49gITXlIjnd2Udydk6wxvg63wkcJ4V
 b/lWVQo+5aPaJ9f9g/6LHlilKqsf25g7P0PJoYSn72a9n7BB0/7PDgoWD0+WsNZrNN
 7gyrce364V7+DaYpbkT7LYYiP4GJmkOxfhznfUu5TgvJ0KUp1BN99pJ2KyRCtxK984
 c62U6qSjheVkw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dave Airlie <airlied@redhat.com>, 
 Sean Paul <sean@poorly.run>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com>
References: <20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com>
Subject: Re: (subset) [PATCH] drm: add missing MODULE_DESCRIPTION() macros
Message-Id: <171801636830.423417.18054042484903735990.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:46:08 +0200
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

On Sun, 09 Jun 2024 11:42:53 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/gud/gud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/i915/kvmgt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

