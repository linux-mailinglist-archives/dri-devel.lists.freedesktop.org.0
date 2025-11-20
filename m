Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A8C76793
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267210E7E6;
	Thu, 20 Nov 2025 22:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="OBm2keIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8079710E7DB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=OyW98MyVGluZyeY1kwgWwup1uQtdsCROzoZ+Bj7trA4=; b=OBm2keIBPeVxXl+78MDMqh3qqc
 wNc1Ueesv/PDgbLlCqouIVleCKjusPwyFQ8/yj77Ku6fK02e6xZQOm06yBeCD+W2+X/1rHnEygAhl
 /rt0b79HeoXK7/8K7BZG9TiP25tYxrnaGdH7ry8RdQyiOiGAjHMcYKfros3O1PBg72arfQgxeVYPZ
 VPp7xjEhbA3l1rxKsL7wc3bwZ4jw6rvUJea8DbwrnT9df4I0SCCqkdpmAhih3d5a4yMT/dmXuDaQX
 P0B0UmvEg8cdac1QlC7/7UqcdVRYRP51d8bTTc3TREsCshxJkJOfYH2aiWdKJr4oAtBAaQSFHb24l
 BLkzUNew==;
Received: from [213.192.12.196] (helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vMD3X-0007Je-V9; Thu, 20 Nov 2025 23:23:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com
Subject: Re: (subset) [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs
 for RK3368-Lion
Date: Thu, 20 Nov 2025 23:23:00 +0100
Message-ID: <176367711171.9778.9000322898026906278.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
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


On Tue, 21 Oct 2025 09:42:45 +0200, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.
> 
> 
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
> 
> [...]

Applied, thanks!

[4/9] arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
      commit: 8319be65e860a2881e5213ed95e03992037bf5c1
[5/9] arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
      commit: f54b09d46f72e4548e14476ba771231b0ec2b0af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
