Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F62517A6C
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 01:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9571710EE02;
	Mon,  2 May 2022 23:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE8810EE0F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 23:07:27 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nleSf-0005bu-2T; Tue, 03 May 2022 00:24:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Robin Murphy <robin.murphy@arm.com>,
	hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: Refactor IOMMU initialisation
Date: Tue,  3 May 2022 00:24:03 +0200
Message-Id: <165153020898.255051.11175155714135351840.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <94eee7ab434fe11eb0787f691e9f1ab03a2e91be.1649168685.git.robin.murphy@arm.com>
References: <94eee7ab434fe11eb0787f691e9f1ab03a2e91be.1649168685.git.robin.murphy@arm.com>
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
Cc: linux-rockchip@lists.infradead.org, s.hauer@pengutronix.de,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 15:32:50 +0100, Robin Murphy wrote:
> Defer the IOMMU domain setup until after successfully binding
> components, so we can figure out IOMMU support directly from the VOP
> devices themselves, rather than manually inferring it from the DT (which
> also fails to account for whether the IOMMU driver is actually loaded).
> Although this is somewhat of a logical cleanup, the main motivation is
> to prepare for a change in the iommu_domain_alloc() interface.

Applied, thanks!

[1/1] drm/rockchip: Refactor IOMMU initialisation
      commit: 421be3ee36a497949a4b564cd1e4f7f9fe755f57

Additionally tested on rk3288, rk3399 and px30.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
