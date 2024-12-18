Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF89F6B67
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 17:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2A10E13B;
	Wed, 18 Dec 2024 16:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="b9NzLt6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4FB10E1CD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obxeOv5xS3pelA9rBXGzBgBDhhTmHuY1TLuS9kkDxuM=; b=b9NzLt6aR6WEi8aZiCa9QDGKFj
 b5YEFDWiz6NiZ/qWC1v+BzaqszvXu8Kb5OgZXrYqdP0anWHF4JBVyLg9NinBO32bGdfqkt3gwJwDR
 fRNc4miuzUebN8mYkOL65cCvvEFLUj6dqdSPA/KR1aON1oqT1f9iB2ll85DvYVuPYu5MQCSjvkAgv
 1N4ffaWNDWZo0e0llTBpcoBDmUQEbNbsV4hjDvKgtQCu/AFDRnQk/ml3nEcoHrFvRfgBzNpgF7Jma
 YtBaW72DPcF240N1J5K/8fi3nUvaF6nHqYGNCRbAsfGDN/ff/tt0r2iwcz/D/sG3qRq2XU4B0OCEY
 ChVAMQRg==;
Received: from i53875bfb.versanet.de ([83.135.91.251]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tNx8C-0002kl-87; Wed, 18 Dec 2024 17:42:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, krzk+dt@kernel.org,
 s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v6 00/16] VOP Support for rk3576
Date: Wed, 18 Dec 2024 17:42:29 +0100
Message-ID: <173454013836.591676.16677827979094919661.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214081719.3330518-1-andyshrk@163.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
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


On Sat, 14 Dec 2024 16:16:59 +0800, Andy Yan wrote:
> Thanks for the basic work from Collabora, I can bringup a HDMI
> display out on rk3576.
> 
> PATCH 1 is a carryover from the working when add support for
>     rk3588[0], is very usefull when some people want me
>     help debug some issue online, so I really hope it can
>     be merged at this round.
> PATCH 2~8 are bugfix of rk3588 alpha blending which report and
>     test by Derek
> PATCH 9~13 are preparations for rk3576 support
> PATCH 17~18 are real support for rk376
> 
> [...]

Applied, thanks!

[03/16] drm/rockchip: vop2: Set AXI id for rk3588
        commit: 7b256880fdb2d7f23393b87bb557090f049e686a
[04/16] drm/rockchip: vop2: Setup delay cycle for Esmart2/3
        commit: c766998ba6df126ab6934d32ff2ff080316ec630
[05/16] drm/rockchip: vop2: Check linear format for Cluster windows on rk3566/8
        commit: df063c0b8ffbdca486ab2f802e716973985d8f86
[06/16] drm/rockchip: vop2: Add check for 32 bpp format for rk3588
        commit: 7e8a56c703c67bfa8d3f71a0c1c297bb1252b897
[07/16] drm/rockchip: vop2: include rockchip_drm_drv.h
        commit: 77b1ccb2a27c7b3b118a03bf1730def92070d31b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
