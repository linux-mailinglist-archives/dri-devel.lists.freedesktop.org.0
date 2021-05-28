Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A53946CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13FE6E546;
	Fri, 28 May 2021 18:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032456E52E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:09:55 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmgvf-0006Ve-5R; Fri, 28 May 2021 20:09:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Thomas Hebb <tommyhebb@gmail.com>
Subject: Re: [RESEND PATCH] drm/rockchip: dsi: remove extra component_del()
 call
Date: Fri, 28 May 2021 20:09:45 +0200
Message-Id: <162222530163.2887132.8458225826944784611.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <201385acb0eeb5dfb037afdc6a94bfbcdab97f99.1618797778.git.tommyhebb@gmail.com>
References: <201385acb0eeb5dfb037afdc6a94bfbcdab97f99.1618797778.git.tommyhebb@gmail.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 18 Apr 2021 19:03:04 -0700, Thomas Hebb wrote:
> commit cf6d100dd238 ("drm/rockchip: dsi: add dual mipi support") added
> this devcnt field and call to component_del(). However, these both
> appear to be erroneous changes left over from an earlier version of the
> patch. In the version merged, nothing ever modifies devcnt, meaning
> component_del() runs unconditionally and in addition to the
> component_del() calls in dw_mipi_dsi_rockchip_host_detach(). The second
> call fails to delete anything and produces a warning in dmesg.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dsi: remove extra component_del() call
      commit: b354498bbe65c917d521b3b56317ddc9ab217425

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
