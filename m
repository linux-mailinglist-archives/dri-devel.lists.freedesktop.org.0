Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D387C66600
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 22:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A98910E06E;
	Mon, 17 Nov 2025 21:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="JOPgBi/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297D10E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 21:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=jQoqXyszkPiSBiq+rU2orebDLuZROYRw4j6EhNzg7rM=; b=JOPgBi/GEewTXo2hRxi6cycLfR
 zTKaPBBvqlGCHGgFcKD+s3r5y7pPj9gEEmOjeeRIi3KMEPXHr9tWJkPFkEtJ8BJf8KkhbimYGeyQs
 m/KvIMXiJWBB3OxFW6OGYmhAFZe28YdcN8DcRvWmnvoio8OnpZY4kgUWcQbRT2rNNrIbOF3jWeqkG
 hr/4G7EpeGcvgMB65Hqx9QG/A4aTnLF59gLF0odGPgBQxYbAxQy3uHXjGtrPoHINZ6fUN9d7PgjCA
 hWjf7rKn4Y+0mxtweIMTIEL7QxW1dDVrNGVfxwaymqaMxV1X2nWenOx2cinwpV6nZMNOws9PCMixE
 2bhR+AQQ==;
Received: from [31.12.4.86] (helo=phil.schlosswilhelminenberg.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vL7Fb-00018K-3L; Mon, 17 Nov 2025 22:59:07 +0100
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
Date: Mon, 17 Nov 2025 22:59:04 +0100
Message-ID: <176341673264.751370.3773925290539740879.b4-ty@sntech.de>
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

[3/9] soc: rockchip: grf: Add select correct PWM implementation on RK3368
      commit: 048213a38e7ac1591f725e370c152cc80dd84105

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
