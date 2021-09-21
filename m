Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B52413127
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEB86E921;
	Tue, 21 Sep 2021 10:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD5F6E922
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:04:11 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mScdC-0001rd-RH; Tue, 21 Sep 2021 12:04:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie
Subject: Re: [PATCH] drm/rockchip: dsi: Fix duplicate included linux/phy/phy.h
Date: Tue, 21 Sep 2021 12:03:33 +0200
Message-Id: <163221857584.2031971.9461320682192946569.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1629454729-108701-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1629454729-108701-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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

On Fri, 20 Aug 2021 18:18:49 +0800, Jiapeng Chong wrote:
> Clean up the following includecheck warning:
> 
> ./drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c: linux/phy/phy.h is
> included more than once.

Applied, thanks!

[1/1] drm/rockchip: dsi: Fix duplicate included linux/phy/phy.h
      commit: d90def98f90fb166191f19b41620e1a54b6dac75

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
