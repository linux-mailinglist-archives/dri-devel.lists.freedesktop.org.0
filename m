Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC73A4EF37
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7EC10E15E;
	Tue,  4 Mar 2025 21:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="U4fHcHpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9691210E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eqkQ8jxL06OZOj6WptzRpdH3n3jo9zyINbgB/IlYG8I=; b=U4fHcHpD4mm0027TZsBlsn8aCP
 t6vPvt66OTGQpQnQ3zUengcnEtst/6IplDjIY/XQ1pUucRlneEW57FeWxKJCNgxxSZXTggoq/URBv
 +8SPKcYHjg1SVpabIfeAB3FLWkPYT3qRfUJEb0n/U5M4C4P/hXdhocklCNksnSR1KnkOn/9diW8a/
 QXEb55JGJ94fw/co7ufVsrKjsWVzUmlmyyFf5yYyy+7RAxdPf9vTz9Jfb55qm44Vhd5yabbgSyWhZ
 GPgaw/rZk5eZlkFNaISUWJ7nZYUY/aZLF/B8gkKbcE2vVZtxjj+Ud0T4zXg/X80BahofLh/0yPVE0
 PZ/smrig==;
Received: from i53875a38.versanet.de ([83.135.90.56]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tpZZL-0006E9-C4; Tue, 04 Mar 2025 22:12:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: lvds: probe logging improvements
Date: Tue,  4 Mar 2025 22:12:41 +0100
Message-ID: <174112269652.340957.10714067153847883727.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304124418.111061-1-heiko@sntech.de>
References: <20250304124418.111061-1-heiko@sntech.de>
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


On Tue, 04 Mar 2025 13:44:15 +0100, Heiko Stuebner wrote:
> Getting the panel already uses dev_err_probe to stay silent, when
> the panel just probes later, and the lvds defers.
> 
> But the phy needed on px30, also has the capability to probe after
> the lvds. So make the rest of the lvds probe/bind logic also use
> more modern logging than DRM_DEV_ERR, that is deprecated anyway.
> 
> [...]

Applied, thanks!

[1/3] drm/rockchip: lvds: move pclk preparation in with clk_get
      commit: d4f5efb9139cad34823f265053c57baf6af3c70c
[2/3] drm/rockchip: lvds: Hide scary error messages on probe deferral
      commit: 37c18639504aacbd31371f562fabafdb890bcd2e
[3/3] drm/rockchip: lvds: lower log severity for missing pinctrl settings
      commit: 4006be2f77cd26d065133b338dc51f59857d20f0


With some freedesktop.org hickup, I forgot to send the "patch applied"
mail, when I applied the series this afternoon, done now.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
