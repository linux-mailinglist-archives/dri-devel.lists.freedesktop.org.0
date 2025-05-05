Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59837AA8E31
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 10:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BEC10E0D9;
	Mon,  5 May 2025 08:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="EqsgzOBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25F10E291
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=79u0OVf8LkWKmm3Wdou6FM0hujmZjDHVeYn1Q2NENsw=; b=EqsgzOBIrGjPuFoBjKNtkB308w
 VTwCJi+SJq3zdiiMnB0g/cGN/OfXfz5oX/LxhKDV5Aqw6BGKKn/omiK9PJtN6WdV0rhjCj+gAatKr
 xSiyKBYAagXWW4JtDEWQf55eutefx2YZ5YLRuA6tSsJv6+C1pEzMk+bgCzc0hTfVXmKfz0OoTbN7f
 +0r5DekvMq0MYaohIUjW9LY0b3qwI+V2i2/nvzDvJ232eeDzPtqWrHGF1cJd25OpbsbVRYedbyNOL
 cFk9IVPb6nbOsGrDEm+n87CAg0vkwSLZCRPdirkOIkn0Izc2B+crQtTpEtezTcm/G4wm+Cy7xC2ap
 s712kSyQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uBr9g-0001Ho-BB; Mon, 05 May 2025 10:26:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Mon,  5 May 2025 10:26:15 +0200
Message-ID: <174643357077.1204535.10688043941921762631.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
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


On Tue, 22 Apr 2025 15:04:39 +0800, Andy Yan wrote:
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
> 
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
> 
> [...]

Applied, thanks!

[5/7] ARM: dts: rockchip: Add ref clk for hdmi
      commit: cdc602ad064009470b1c40af51d4a8cd804eaaf9
[6/7] Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
      commit: dd6c77864aa69ba1079998c590b552e35649d51b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
