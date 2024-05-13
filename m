Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B100B8C45D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08C10E4B1;
	Mon, 13 May 2024 17:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c28MOotl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3410E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:16:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84CF860E8B;
 Mon, 13 May 2024 17:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1F0C113CC;
 Mon, 13 May 2024 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715620617;
 bh=C4pydozvCLgHAegk7pVKowcfeOvctSMz+rreMANDENw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c28MOotl2UL4cuYO1fr3PLKZkNiYDRd99O/sHJOvGq/uDuK7ZbuQPPtsGxIKIWXaJ
 t8YSzJC/dIJZYSIZ2jvrr+M3TW8OIe6XrnX20Xa5kLD59vK8tT9wAJEK7Qf3nqrc1j
 ujvzWR1k0CuW2OaiCC9wLeT2qYZhGPYpX43z6p7YgDAcI68xe82CZD2UQTyfFEzKg1
 s+Sp7k2hKOdq2QePvGX3+5FFEywT4MkUhapb5ZOBcfx00ve43LenGCcbyX6wWjKqis
 8y4FOVLPJrJt/B/K0bEPlf2oIVcVMCVBc/TbkikWJy5aTEkeN3r+8iWR2y17PFWEOd
 4s6l9N5E0M21Q==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Cc: Robert Foss <rfoss@kernel.org>
Subject: Re: [RESEND 0/6] drm: struct drm_edid conversions
Date: Mon, 13 May 2024 19:16:51 +0200
Message-ID: <171562056637.125309.5270184136862630693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1715347488.git.jani.nikula@intel.com>
References: <cover.1715347488.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 10 May 2024 16:26:03 +0300, Jani Nikula wrote:
> Resend of the remaining patches from [1].
> 
> BR,
> Jani.
> 
> [1] https://lore.kernel.org/r/cover.1713273659.git.jani.nikula@intel.com
> 
> [...]

Fixed checkpatch issue in "drm/bochs: switch to struct drm_edid"

Applied, thanks!

[1/6] drm/bridge/analogix/anx6345: switch to struct drm_edid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=37f3821c7cc8
[2/6] drm/bridge/analogix/anx78xx: switch to struct drm_edid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8aa8781ba3c1
[3/6] drm/bridge: anx7625: use struct drm_edid more
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7c585f9a71aa
[4/6] drm/i2c: tda998x: switch to struct drm_edid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=78e90e003b96
[5/6] drm/bochs: switch to struct drm_edid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5c465601d423
[6/6] drm/virtio: switch to struct drm_edid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac15c653fb09



Rob

