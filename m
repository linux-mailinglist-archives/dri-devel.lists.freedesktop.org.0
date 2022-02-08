Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B24ADF08
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195FF10E888;
	Tue,  8 Feb 2022 17:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCE010E888
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:12:32 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHU2U-00034v-M7; Tue, 08 Feb 2022 18:12:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: vop: Correct RK3399 VOP register fields
Date: Tue,  8 Feb 2022 18:12:25 +0100
Message-Id: <164434033775.248576.1440613083224554584.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119161104.1.I1d01436bef35165a8cdfe9308789c0badb5ff46a@changeid>
References: <20220119161104.1.I1d01436bef35165a8cdfe9308789c0badb5ff46a@changeid>
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
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 Mark Yao <markyao0591@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022 16:11:22 -0800, Brian Norris wrote:
> Commit 7707f7227f09 ("drm/rockchip: Add support for afbc") switched up
> the rk3399_vop_big[] register windows, but it did so incorrectly.
> 
> The biggest problem is in rk3288_win23_data[] vs.
> rk3368_win23_data[] .format field:
> 
>   RK3288's format: VOP_REG(RK3288_WIN2_CTRL0, 0x7, 1)
>   RK3368's format: VOP_REG(RK3368_WIN2_CTRL0, 0x3, 5)
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop: Correct RK3399 VOP register fields
      commit: 9da1e9ab82c92d0e89fe44cad2cd7c2d18d64070

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
