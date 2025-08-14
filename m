Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEBB2614E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E712710E2A8;
	Thu, 14 Aug 2025 09:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="r2nCGCuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019910E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=05/vse8ASg1P0/ndE2WSZb4gOfA6W4MnqPW426TsnGA=; b=r2nCGCuyVC/DLCAypokD2yGjuf
 uoMbh4ejTqfrC1NXM7+9nH4NcB6kP7qhVOza6dAii9HF3fygtAt3YYOwmbs7nXgvGsRK4AOoYXlle
 SGxyG+07r6Uev6efb2C/vcujg22EIaaqDrhO7y44v8CSLwTNlr8SvcH9E9gWtJvWEAw+vp8kt6XDk
 TpQX2Cuh8sac73oJJAliw2ls97feDEq+cEct2y4B36jHSgqOfkk8kpxcB26GAY7b38HgUwuqGH1ki
 ilcjyr93XUHOYPJNdokZslNyLI/Hf8Rdua39dFoeoZg1T0zcCIIb48dHgLtZPeGo+erQ1RV1RBuxZ
 CixnDSCA==;
Received: from i53875b38.versanet.de ([83.135.91.56] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1umUXD-0002c8-8Z; Thu, 14 Aug 2025 11:46:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rudi Heitbaum <rudi@heitbaum.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: cdn-dp: select bridge for cdp-dp
Date: Thu, 14 Aug 2025 11:46:07 +0200
Message-ID: <175516475519.1500001.13265929847217022418.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <aJrlUzV1u4i65NRe@8eba3d7b3083>
References: <aJrlUzV1u4i65NRe@8eba3d7b3083>
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


On Tue, 12 Aug 2025 06:55:15 +0000, Rudi Heitbaum wrote:
> Select drm bridge connector when building cdp-dp.
> This was missed in previous commit causing build failure.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: select bridge for cdp-dp
      commit: ea177a1b1efc6e42e73ee4a17581842cd254e006

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
