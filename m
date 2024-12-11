Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200259EDA54
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120210EA4D;
	Wed, 11 Dec 2024 22:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rxk48gwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADFC10E986
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hTTJ7OXYyAx1ZfgndTqE4h/ckOFQ/YcOcAae/xgQEag=; b=rxk48gwtwxdly6V7kB9jzrpiHP
 MHVGl65qKQC+teywOmweE8tYOCUobbt6HUZXL/4IBedWNWsIhmmdYWNioXllEWuH0HDWaCHKAP3C/
 XvvR1DhmrKg+EJ7MZXHxQO6epJgNCk5Kg1OvGIZA1gPiC3jm0apA5YCoRiYXpRy7E+bTBMI+bxIva
 tfUMM3WSfVeQV+MnBlEgSz039UVtbHKuELZczrjjcbHvmMrakp1uKkvQ6Cev/CVw0y3nsKx5Acoy6
 OuPHNGQYFskLSOdc2yC2gEHRyrgqNv01AAefVYe3mFCXIedNyTlsob1yJJ+NBuq0it3elEty/1VAm
 MwtRSJWg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tLVSj-0000ON-3w; Wed, 11 Dec 2024 23:45:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Piotr Zalewski <pZ010001011111@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
Date: Wed, 11 Dec 2024 23:45:41 +0100
Message-ID: <173395708760.2509957.1013367330408721282.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206192013.342692-3-pZ010001011111@proton.me>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
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


On Fri, 06 Dec 2024 19:26:10 +0000, Piotr Zalewski wrote:
> Remove color_mgmt_changed check from vop2_crtc_atomic_try_set_gamma to
> allow gamma LUT rewrite during modeset when coming out of suspend. Add
> a check for color_mgmt_changed directly in vop2_crtc_atomic_flush.
> 
> This patch fixes the patch adding gamma LUT support for vop2 [1].
> 
> [1] https://lore.kernel.org/linux-rockchip/20241101185545.559090-3-pZ010001011111@proton.me/
> 
> [...]

Applied, thanks!

[1/1] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
      commit: 9c22b6ece2e5c2308f41ba4bec27cfa158397fa7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
