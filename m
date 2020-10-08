Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5228839D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D166EC65;
	Fri,  9 Oct 2020 07:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.lineo.co.jp (ns.lineo.co.jp [203.141.200.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED446E112;
 Thu,  8 Oct 2020 08:57:33 +0000 (UTC)
Received: from [172.31.78.0] (unknown [203.141.200.204])
 by mail.lineo.co.jp (Postfix) with ESMTPSA id D24C480535E2A;
 Thu,  8 Oct 2020 17:47:46 +0900 (JST)
From: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH 5/6] drm/etnaviv: Fix typo arbitary
To: Lucas Stach <l.stach@pengutronix.de>
Message-ID: <db33738b-9b6d-c11e-c603-99a0f8ae3c3f@lineo.co.jp>
Date: Thu, 8 Oct 2020 17:47:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Naoki Hayama <naoki.hayama@lineo.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix comment typo.
s/arbitary/arbitrary/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c6404b8d067f..5077004f7fbf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1811,7 +1811,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	/*
 	 * We treat the device as initially suspended.  The runtime PM
-	 * autosuspend delay is rather arbitary: no measurements have
+	 * autosuspend delay is rather arbitrary: no measurements have
 	 * yet been performed to determine an appropriate value.
 	 */
 	pm_runtime_use_autosuspend(gpu->dev);
-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
