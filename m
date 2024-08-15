Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95B953901
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 19:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2D10E4A6;
	Thu, 15 Aug 2024 17:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Pvls6HWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC3B10E4A6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIqbPZiRjTrgtxDOdljm9mWZF6jTEwBez60mkfjEyt8=; b=Pvls6HWN8l5GaiaDcc4IV0GFI0
 Pus+1D2WrPk64VPX8x33SMmVLSB3wXemWYDEjQ1e/Qa9ntKX17Y+yCYRlG6svngd78oKxCXbwG0Rh
 WG7bS7uAYSEsv66cguoIuGyGLzfI8htBJvzRdSr0aUNImX0ZcoeM0ZYRsm2PUQmYrkvk/JhGyP9rc
 LsOFL6aSrmSYu7gzD0EL40sxCCVcdjJYP1ToLsPCEad1KnRR0trriP2lUiCF3FtNBv/1e6UrCYdWl
 qw/GSaQwOCyFMBAmsC72zyzymTBh+X3C3g0VOra/TAOt4aZJMdnalJ7+HBacznfCoA/TiprlZmrq3
 OaK6ScQg==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seeK3-0006A2-RC; Thu, 15 Aug 2024 19:31:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/13] rockchip: Enable 4K@60Hz mode on RK3228,
 RK3328, RK3399 and RK356x
Date: Thu, 15 Aug 2024 19:31:38 +0200
Message-Id: <172374306461.802599.8555618948226226004.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
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

On Sat, 15 Jun 2024 17:03:51 +0000, Jonas Karlman wrote:
> This prepares and enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228,
> RK3328, RK3399 and RK356x.
> 
> Patch 1-3 fixes some issues to help support use of high-resolution modes.
> 
> Patch 4 fixes reading of EDID on RK3328 when using a forced mode.
> 
> [...]

Applied, thanks!

[03/13] drm/rockchip: vop: Allow 4096px width scaling
        commit: 0ef968d91a20b5da581839f093f98f7a03a804f7
[04/13] drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
        commit: a5d024541ec466f428e6c514577d511a40779c7b
[05/13] drm/rockchip: dw_hdmi: Allow High TMDS Bit Rates
        commit: 1213b65e436d64611cf74ef8f005b22f6793275f
[06/13] drm/rockchip: dw_hdmi: Add max_tmds_clock validation
        commit: 5f5f657a9c3efe16a2e1455b840c5009f9c75af5
    Fixed the double rk3228 in the commit message.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
