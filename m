Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB17BEC63
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51ED10E00F;
	Mon,  9 Oct 2023 21:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0210E00F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:11:32 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qpx08-00058Z-80; Mon, 09 Oct 2023 22:37:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/rockchip: dsi: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon,  9 Oct 2023 22:37:13 +0200
Message-Id: <169688381987.192795.14551398550755679911.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421081303.122452-1-yang.lee@linux.alibaba.com>
References: <20230421081303.122452-1-yang.lee@linux.alibaba.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Apr 2023 16:13:03 +0800, Yang Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: dsi: Use devm_platform_get_and_ioremap_resource()
      commit: 253a1d33e5cfdf62525f5d6ed2bf03acbadd1582

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
