Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D7A4804B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 15:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8E310EAF0;
	Thu, 27 Feb 2025 14:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="bQZIi9oE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE4110EAF0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gl2YGr8BLw/wNus1iEMG6KY7DRu+t64YQRFArFZ0uP0=; b=bQZIi9oEBCJISZINLmrQvKI0d7
 4NQ27FI0uRR5OcXcSNQ4h4j7WAHVabJpGI0/LWHCO9fqwIqcG83F0XHpL0blaiLZNtl9BBdBMJNg6
 68lTa1OULh4hvJVJZlfl20dg6uqkW0M1lL9hvuSAtabL8hgXBGcjbkAus+lLVSEroIo+ZPQEgawvV
 E8GEXGgC/AnEVaegAG8vy2YomFZmgTNCc2EH70JpZTfBeCS5biT9jm7J+KxE0ytXPrNxWycTziuYk
 +nLf6HQi2SSmPQjzBvvf9fb27jpD1mG+ll37fXeKxo7vksc8A72irQdCR+z4F26gcU6buiQ7LHlzf
 WJABAuNw==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tneT4-0001In-99; Thu, 27 Feb 2025 15:02:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org,
	Heiko Stuebner <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 0/2] Fix the shutdown callback of a drm component device
Date: Thu, 27 Feb 2025 15:02:15 +0100
Message-ID: <174066492648.11813.12373419424939960288.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220234141.2788785-1-heiko@sntech.de>
References: <20250220234141.2788785-1-heiko@sntech.de>
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


On Fri, 21 Feb 2025 00:41:39 +0100, Heiko Stuebner wrote:
> Probe deferral can cause the platform-data we access to be freed already
> causing ugly splats on system shutdown.
> 
> Fix this via a small component-helper and adapting the rockchip-drm
> shutdown handler.
> 
> Heiko Stuebner (2):
>   drivers: base: component: add function to query the bound status
>   drm/rockchip: Fix shutdown when no drm-device is set up
> 
> [...]

Applied, thanks!

[1/2] drivers: base: component: add function to query the bound status
      commit: a6ba2dad0aa4f623ab0def8b6e6888ac00639055
[2/2] drm/rockchip: Fix shutdown when no drm-device is set up
      commit: 4444e4d789d64f053435713e5984f0ef31a7633b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
