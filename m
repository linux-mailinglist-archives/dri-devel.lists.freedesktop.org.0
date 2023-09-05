Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E371A79236C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1267010E52D;
	Tue,  5 Sep 2023 14:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFA510E52D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 14:20:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACCA0B810D1;
 Tue,  5 Sep 2023 14:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB61C433C8;
 Tue,  5 Sep 2023 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693923615;
 bh=rlMXztTsnFKQ5FdtU+qNDKYNfX/0zFqzn0aF2XsO+nI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Nj43H9G9C8xAEOMJhbXk/x6n3BJ/BO2aXDwzaai1he4vaWLaOmgi2sYPXZN/Ayz7/
 Fph4qAH+HPCLeJCg6m0+4pFkR0fUwD7ix7uncJf+bWluFb12BkojfyaDQK15Xh4eSQ
 Q3Gpak0ChwbMB2Xj2hyRP8Y+mGquU4tb7ZEn1QSNZP3TTIfGogfcFbf4IWcuT6TSGj
 1k0f3c+qZiH1Gl4+fU4OqEJc4T/0hbhw9SaaqXE+luuR7CIt8a1YkjjopqoGstcsya
 64CYsYuQ2VvTw82Uf+n/hnb+OZy4gfVisGU08ajgqP5V6e00opHuusSQO6JfjSCjV0
 9+tagMxIMZ7UQ==
From: Robert Foss <rfoss@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Match data improvements for it66121 driver
Message-Id: <169392361254.1000124.5770510493227185107.b4-ty@kernel.org>
Date: Tue, 05 Sep 2023 16:20:12 +0200
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Aug 2023 20:18:15 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for it66121 driver.
> 
> v2->v3:
>  * Removed fixes tag from patch#1 as nothing broken.
>  * Added Rb tag from Andy.
> v1->v2:
>  * Split the patch into two.
>  * patch#1 extend match support for OF tables compared to legacy ID
>    lookup and fixes tag.
>  * patch#2 simplifies the probe() by using i2c_get_match_data.
>  * Dropped sentence for dropping local variable as it is integral part of
>    the patch.
> 
> [...]

Applied, thanks!

[1/2] drm: bridge: it66121: Extend match support for OF tables
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c11c1a50573e
[2/2] drm: bridge: it66121: Simplify probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=29ff3b7e23af



Rob

