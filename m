Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3539612316
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 15:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A0410E246;
	Sat, 29 Oct 2022 13:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEE10E287
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 13:00:53 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oolSF-0006ID-FO; Sat, 29 Oct 2022 15:00:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Tretter <m.tretter@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/rockchip: vop2: fix IOMMU warnings after reenable
Date: Sat, 29 Oct 2022 15:00:48 +0200
Message-Id: <166704843773.1532410.14430431906857992267.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221028095206.2136601-1-m.tretter@pengutronix.de>
References: <20221028095206.2136601-1-m.tretter@pengutronix.de>
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
Cc: Chris Morgan <macromorgan@hotmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022 11:52:04 +0200, Michael Tretter wrote:
> I was observing a lot of warnings that the IOMMU has blocked accessed by the
> VOP2 when I disabled and reenabled the VOP2 by shutting down a DRM user space
> application (namely Weston) and restarting it.
> 
> The reason for the warnings was that the address of the last framebuffer was
> still residing in the read register of Smart0-win0. After enabling the VOP2,
> the Smart0-win0 was still enabled and started reading from the address.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: vop2: fix null pointer in plane_atomic_disable
      commit: 471bf2406c043491b1a8288e5f04bc278f7d7ca1
[2/2] drm/rockchip: vop2: disable planes when disabling the crtc
      commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
