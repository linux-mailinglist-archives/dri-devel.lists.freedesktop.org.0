Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFDF61231B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 15:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F010E289;
	Sat, 29 Oct 2022 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A7D10E246
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 13:00:57 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oolSE-0006ID-NZ; Sat, 29 Oct 2022 15:00:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: John Keeping <john@metanate.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: fix fbdev on non-IOMMU devices
Date: Sat, 29 Oct 2022 15:00:46 +0200
Message-Id: <166704843772.1532410.11915201216204142960.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020181248.2497065-1-john@metanate.com>
References: <20221020181248.2497065-1-john@metanate.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Oct 2022 19:12:47 +0100, John Keeping wrote:
> When switching to the generic fbdev infrastructure, it was missed that
> framebuffers were created with the alloc_kmap parameter to
> rockchip_gem_create_object() set to true.  The generic infrastructure
> calls this via the .dumb_create() driver operation and thus creates a
> buffer without an associated kmap.
> 
> alloc_kmap only makes a difference on devices without an IOMMU, but when
> it is missing rockchip_gem_prime_vmap() fails and the framebuffer cannot
> be used.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: fix fbdev on non-IOMMU devices
      commit: ab78c74cfc5a3caa2bbb7627cb8f3bca40bb5fb0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
