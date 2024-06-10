Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E470B901FA7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25C710E3EB;
	Mon, 10 Jun 2024 10:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XDevtlI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7286610E384
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DBE5260686;
 Mon, 10 Jun 2024 10:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B652C4AF1D;
 Mon, 10 Jun 2024 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718016373;
 bh=OZzw3rDNyqrxI631FqQQD5pS7djLOOM/VvVOVFyL/VY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XDevtlI6JD74OBfchpbh+8zzEKDrgzN9aoAfVnpqzS9XW4Psx3ne4gakQBAhBDcLl
 qDDg/CmpTz980hYogxSjYRHzITXgrMAiGG7bGEfy0vlOVh5ni8pHxqJMLRWedstj++
 c1dnlHsQpQUa3vYwP1cf6vIzGSbZk5xXw5uhykbF1zOjnDvHL7xnNvWhX4PWkQbjhM
 6IGt9yyctZnfAU8aC2CvGYZ/vC7qoswO6vM4n/0wB95h/zU4XvIaa7j5/zcOujRaeq
 nIVOD95yXUvWoFn2Tf9E1yDaO9HOaMft3aNaFmXyLa0+WaPe1l+L8ZXQf8Wbt/Hu7k
 EP/Y+Xe3+firA==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20240224150604.3855534-1-megi@xff.cz>
References: <20240224150604.3855534-1-megi@xff.cz>
Subject: Re: [PATCH v2 0/3] Move blender setup from individual planes to
 crtc commit in sun4i-drm
Message-Id: <171801637114.423417.15912541590264684056.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:46:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 24 Feb 2024 16:05:57 +0100, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> This series refactors blender setup from individual planes to a common
> place where it can be performed at once and is easier to reason about.
> 
> In the process this fixes a few bugs that allowed blender pipes to be
> disabled while corresponding DRM planes were requested to be enabled.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

