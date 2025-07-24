Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4AB10AFF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CD010E06A;
	Thu, 24 Jul 2025 13:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="G0bWLgCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0E510E06A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=oslcU2z5E9VNKbs5VzEQgy0a5q5NibBzjbcK3BaZxXM=; b=G0bWLgCGIKAEYwjd5FPaoCKZUD
 PYSktF7e05P9oNthQAXoGLcRrn972qSx5o3jR79UmzuBSAvXZzwlnEhOwX0sAiHRhLToBG9qUR2BS
 XPvmNdO0PnSfvjJsd+m+PZCy3zcQBLK1o26OccU51QRsx9wS4LKO+CBzHixeyN1/67JBTRw+0RWEF
 b68x7MYQ7gBfVCeRI8WBL83E1i3amGXGrc9EQssqseaaTVSP+a924HfxiK8wk0PtmhBzxX6FqIB6S
 tx7LkuIdJNq8+HHTtcMwgQU2VSHoHKZceQyR3htodYZfkCkBOWLEzb3fO/NqR+bAhruuSYOi/JGed
 C/YCK6KQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uevi5-0005on-NF; Thu, 24 Jul 2025 15:10:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Date: Thu, 24 Jul 2025 15:10:08 +0200
Message-ID: <3890785.kQq0lBPeGt@diego>
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to apply a better API for the encoder initialization.
> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
> PATCH 8 is to apply the drm_bridge_connector helper.
> PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
> PATCH 12-13 are preparations for apply panel_bridge helper.
> PATCH 14 is to apply the panel_bridge helper.

for future revisions, please provide a changelog on what changed since
the previous version, I guess ideally here in the cover-letter.


On my rk3588-tiger-displayport-carrier this works like a charm
Tested-by: Heiko Stuebner <heiko@sntech.de>


