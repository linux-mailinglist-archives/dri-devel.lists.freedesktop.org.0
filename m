Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626C8ACA6B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB1410F554;
	Mon, 22 Apr 2024 10:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="XhedbwYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5892D10F554
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=twF0f
 VgcdFbRYd/8dnq/6sOb23kJ0H7GRTQUDCTRWBs=; b=XhedbwYIfrJsCpytTVmBT
 SkUg6r7FCcyJ9FMdWtN6caV/Kl7evm6meMcy8/oktADqbZ0x8dMXHvrAKukQMqsn
 wODY0j/7hUPTieJA1v75vb2jp6MHjppMUbinip34iTpv0yw7th47gygJgAipiIT6
 FXbpeDxdRNrDxEpLV7gXLQ=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wB3fymbOSZmRwO9Bw--.23790S2;
 Mon, 22 Apr 2024 18:19:10 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/1] Fix the port mux of VP2
Date: Mon, 22 Apr 2024 18:19:04 +0800
Message-Id: <20240422101905.32703-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3fymbOSZmRwO9Bw--.23790S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3FksUUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwDIXmXAkyK0RAAAsB
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

From: Andy Yan <andy.yan@rock-chips.com>


The port mux bits of VP2 should be defined by RK3568_OVL_PORT_SET__PORT2_MUX,
this maybe a copy and paste error when this driver first introduced.
Hi Heiko:
   Maybe thi is the problem you met when you porting the dsi2 driver.
I previously sent you this patch when you ask me about this issue on
email,but I'm not sure if you received it.


Andy Yan (1):
  drm/rockchip: vop2: Fix the port mux of VP2

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

