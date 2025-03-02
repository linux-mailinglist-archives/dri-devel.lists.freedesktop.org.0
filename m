Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F6A4B41A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 19:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8204F10E1AD;
	Sun,  2 Mar 2025 18:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Jsm3b1oD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B26410E1AB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZ/DoE1yc97NpsQpvLoLxdu9zmvqzr+lgS2ZIi9J6sU=; b=Jsm3b1oDc70U9C/3D7TLrx3JRr
 jCsY8BfacHx/Z1nUEUfvhKDiTCSutyqnPtxicC4BQnAiQtxIJoVWZ/IY5e0ROIdPweu0njw3HNoys
 Vh9s0LtE7LPkTGiAQMDCuHgHVkAJ219RDxkpZxqKBgwbxOtd91jIvG3Ml0DLg/IM/OnKZ7MxMSNUv
 gXLgcZJi6DHjySSevZLkkwmLZZf5RHFTOpYtM6Wv0fsZBmgdKX+Vce/J9WdgI9GvwWumGStIqXVqm
 3sLNR8ToSvENHcCtY7dIf01oJgsfn8JUiN/k8xJFW951ulY03VWr6yLPqBcdTT8qsSXF9dmy1Jcii
 vbDtfIjw==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1too9a-0004l5-8Z; Sun, 02 Mar 2025 19:35:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v15 00/13] VOP Support for rk3576
Date: Sun,  2 Mar 2025 19:34:56 +0100
Message-ID: <174094048722.1377102.8343744540534603918.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250218112744.34433-1-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
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


On Tue, 18 Feb 2025 19:27:27 +0800, Andy Yan wrote:
> PATCH 1~9 are preparations for rk3576 support
> PATCH 10~13 are real support for rk376
> 
> I test it with a 1080P/4K HDMI output with modetest and weston
> output.
> 
> If there are some one want to have a try, I have a tree based on
> Linux 6.14-rc1 here[0]
> 
> [...]

Applied, thanks!

[01/13] drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
        commit: ff0b6c031ed3ed31024618340c795523a86e6688
[02/13] drm/rockchip: vop2: Remove AFBC from TRANSFORM_OFFSET register macro
        commit: 838a871a4d51b59fe56ac0422b97443203bfa55c
[03/13] drm/rockchip: vop2: Add platform specific callback
        commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f
[04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
        commit: 145c9b36892a07bf5e2525b4938e1a6cc9b41b7a
[05/13] drm/rockchip: vop2: Support for different layer select configuration between VPs
        commit: 5439c4f3cb0ec11a3f3cb70be2b019770f6d183c
[06/13] drm/rockchip: vop2: Introduce vop hardware version
        commit: 301618ed1d8ab7cfaec39b107eded9f263da2299

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
