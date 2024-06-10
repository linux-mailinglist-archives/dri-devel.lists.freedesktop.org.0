Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12369901F9E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B4A10E2A5;
	Mon, 10 Jun 2024 10:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jnq1xdTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5110E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0AA8CE0EE3;
 Mon, 10 Jun 2024 10:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891FCC2BBFC;
 Mon, 10 Jun 2024 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718016367;
 bh=jHmfCgTv50mAeFlsqnzidtEUHiaK9qP6a3u139Rj6Ac=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jnq1xdTiz+n9gsuwRh329YAT3+L/0vd3W/QXu3ICCr81VlNaty07ajSF0iicpBbpE
 VdGxZY9UkMqX62xVy4XY4xocQcM3ZxPOt5zuXm9Fp5ojg1lSdl6NYhHVEphLYsDa/V
 MiJwM3Tc+qkNK+LZY0fH9owEphg6oPdN1DPIvY+tp7LZ7pbAvgCxoXxdsqYrV31bZw
 NX043rLwLXzuiVmbXvZcGbjL4FS+Fq1tEsuiRpiCV4OinvPwkumodU7MVntwatlolu
 nNCuq8hi4VN0hqv1dKFWz5ePPsiihXWF4e5N52x5HcpNJIQPflKXPF40wYDZM8J9l6
 6QNzIohSuxr/w==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
References: <20240609-md-drivers-gpu-drm-bridge-v1-1-b582c5c815d7@quicinc.com>
Subject: Re: (subset) [PATCH] drm/bridge: add missing MODULE_DESCRIPTION()
 macros
Message-Id: <171801636547.423417.6877237960333833102.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:46:05 +0200
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

On Sun, 09 Jun 2024 10:06:17 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

