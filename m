Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F189EDA55
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2981F10EA8C;
	Wed, 11 Dec 2024 22:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="jqhFX5Xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E010EA8C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J4uMrsFePi+DBZGlK5bC9jVrtcVa4XLjgvOYdofBgAk=; b=jqhFX5XjB/uFDDyAKv3HRztSoj
 04+EpIK8Wy8R0kLFcrvEvVJ3CXHLSU4O0LAzyunfRuJTWluoX/By3EFoPcR1z+HTClA9Sla1E2W4h
 JWKcWX1fnjsXPpGHTyHDyd2M/Yx/bYbpNupYoPe08Jv+P+Dp9LCxfwFu6Ack0xgu9YahDdG9eb3WZ
 MGMPBlrNKG4PCMnNdQowdxBMIgyd4mtcGg0ddjfqI5i4hx3MaB/cGLcqmGvDfFNE7WI0JLCH0S+y/
 oWuBcILHtr7MSRIvvKSAIdLPlrWh6dVemfTyjv308c+UEiGlXh5V2LdtrzOucZgrM/kRiV3Sn16Qx
 sneBq5Og==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tLVSi-0000ON-0w; Wed, 11 Dec 2024 23:45:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: Simplify clock handling
Date: Wed, 11 Dec 2024 23:45:39 +0100
Message-ID: <173395708761.2509957.6810456712864653104.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241202-dw-hdmi-qp-rk-clk-bulk-v1-1-60a7cc9cd74e@collabora.com>
References: <20241202-dw-hdmi-qp-rk-clk-bulk-v1-1-60a7cc9cd74e@collabora.com>
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


On Mon, 02 Dec 2024 22:27:34 +0200, Cristian Ciocaltea wrote:
> Make use of the recently introduced devm_clk_bulk_get_all_enabled()
> helper to simplify the code a bit.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: dw_hdmi_qp: Simplify clock handling
      commit: 19851fa2ba9824bede16f55234f63d9423897c3d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
