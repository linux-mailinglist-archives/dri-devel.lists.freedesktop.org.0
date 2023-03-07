Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E479D6ADB96
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3805710E05B;
	Tue,  7 Mar 2023 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4580310E05B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:17:02 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pZUNL-0004AV-Ns; Tue, 07 Mar 2023 11:16:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/rockchip: dsi: Remove the unused function dsi_read()
Date: Tue,  7 Mar 2023 11:16:39 +0100
Message-Id: <167818417706.10390.2172000059064022458.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230208023429.73696-1-jiapeng.chong@linux.alibaba.com>
References: <20230208023429.73696-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Feb 2023 10:34:29 +0800, Jiapeng Chong wrote:
> The function dsi_read is defined in the dw-mipi-dsi-rockchip.c file, but
> not called elsewhere, so remove this unused function.
> 
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:362:19: warning: unused function 'dsi_read'.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: dsi: Remove the unused function dsi_read()
      commit: 59585c79f87794c92f040c264b274e86d8522e22

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
