Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B485E300
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D8F10E81E;
	Wed, 21 Feb 2024 16:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kHUHABLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0021310E81E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:25:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3969A61564;
 Wed, 21 Feb 2024 16:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFDDC433C7;
 Wed, 21 Feb 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708532729;
 bh=dG9DsUBKNvtePLZ9PWNfjmPztmVh0FDOnEtn/qZsPTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kHUHABLwZhLb/90D8DOnF2BezvFj85peclBHivE4BZxvT3n9fKbdUdi9jyOaiCQEN
 xNzphvUOFHuWInAC+/tpjdlrUEH4luAUt0d48UTq7XlcvEfLnR7v4ft5mVgutUaCqe
 jvMR1lkKsgz82wTEfP6AEpiUEIpdVpbalksOr9QOX7ZBe4f+oUM3Srbm/GfVs5mHpY
 +zUV+dKr7rocE2O5Zq8QhVenFuWyMUpkbxy4/v/ej6sgkRRjXs2w9a0ZiBsqSaeGkr
 Pa1bdR4HS9gHahzO9zQ/Y0CCQrir/hBICrnJQ2DFuLzFStJkjvJw+NzMpGmwdJMroC
 nyEsZe8b0Hy1Q==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v17 0/5] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Date: Wed, 21 Feb 2024 17:25:16 +0100
Message-ID: <170853270350.761953.5548304576754745596.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
References: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
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

On Sun, 18 Feb 2024 16:48:35 +0000, Biju Das wrote:
> This path series aims to add support for RZ/G2L DU DRM driver.
> 
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
> signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
> 
> The output from DSI is connected to ADV7535.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
