Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FD68B076
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712210E276;
	Sun,  5 Feb 2023 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FAA10E282
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:56:47 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOgRM-0007OK-9T; Sun, 05 Feb 2023 15:56:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: John Keeping <john@metanate.com>,
	Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: avoid duplicate mappings for IOMMU devices
Date: Sun,  5 Feb 2023 15:56:20 +0100
Message-Id: <167560896726.1025063.3569913562158180840.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221110172415.2853420-1-john@metanate.com>
References: <20221110172415.2853420-1-john@metanate.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022 17:24:14 +0000, John Keeping wrote:
> If a buffer is allocated with alloc_kmap, then it is vmap'd on creation
> and there is no reason to map it again in rockchip_gem_prime_vmap() when
> the existing mapping can be used.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: avoid duplicate mappings for IOMMU devices
      commit: 0020d4cfa3eea0e5fad23af49411217da854fc83

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
