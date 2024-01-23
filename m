Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C41838E19
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 13:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5D310E7A3;
	Tue, 23 Jan 2024 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF8A10E7A3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:03:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8DF2CE2E47;
 Tue, 23 Jan 2024 12:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2A8C433C7;
 Tue, 23 Jan 2024 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706011374;
 bh=jSyQomysxmQFF4FXTse/TNYzaMJ3yJzv3a0uIbVl41M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kT02OqjhhG1/NwWPCLLshXa8KKtIlwuflvNINLEJBipf5QXDaj6ENlsvI4WKbVdWe
 3ZLTF7g4vwKD1BxDNclqCRzJ9FPeTR/eZjN0/g1gMsASq3zFxn5sybVXPs6tUmrZPZ
 R7rFwRLQ5apGqfurFCq/+sDBWYPaSDJrU3sHYsdXfUd7AEzCEki2pxjyvARNLsV0K2
 HjNG5ELF4iy6Ol6E/oSF9O7hY5xcu2ZmmJaymkmB/znTVQDDm1awzhHcwgq1D0ideY
 VHKhyHbkKOGjnsS6U4FfMpiYgj1hoN6FZhc4KJcnpOLFpVob+NAxNPcnXK80+4/YXI
 jQB8seas42Ppw==
From: Robert Foss <rfoss@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Peter Rosin <peda@axentia.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Boris Brezillon <bbrezillon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jyri Sarha <jsarha@ti.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
In-Reply-To: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
References: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
Subject: Re: [PATCH 0/2] drm/bridge: sii902x: Crash fixes
Message-Id: <170601136965.3255303.18345118012936200208.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 13:02:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Jan 2024 15:31:06 +0200, Tomi Valkeinen wrote:
> Two small fixes to sii902x for crashes.
> 
> 

Applied, thanks!

[1/2] drm/bridge: sii902x: Fix probing race issue
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dffdfb8f5de1
[2/2] drm/bridge: sii902x: Fix audio codec unregistration
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bc77bde2d3f0



Rob

