Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F07D4C7C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C1F10E0B8;
	Tue, 24 Oct 2023 09:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Tue, 24 Oct 2023 08:13:45 UTC
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D53A10E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:13:45 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-05 (Coremail) with SMTP id zQCowAA3PYVeezdlt5+TAA--.2862S2;
 Tue, 24 Oct 2023 16:07:58 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com
Subject: [PATCH] drm/tegra: dsi: Add missing check for of_find_device_by_node
Date: Tue, 24 Oct 2023 08:07:38 +0000
Message-Id: <20231024080738.825553-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3PYVeezdlt5+TAA--.2862S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryfGr18Wry8Jry8XF1xAFb_yoWDGFb_Wr
 y8Zr98W3409r4kArsrZrya9Fy2yF9Y9FW2vFyjva4fK345J347XryjgryxurZrua1qkFyD
 G34UWF4rZFsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbf8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3
 JVW8Jr1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xR_mLvJUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Mailman-Approved-At: Tue, 24 Oct 2023 09:33:30 +0000
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
Cc: linux-tegra@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add check for the return value of of_find_device_by_node() and return
the error if it fails in order to avoid NULL pointer dereference.

Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/tegra/dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index a9870c828374..4101b2e01211 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1543,9 +1543,11 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 	np = of_parse_phandle(dsi->dev->of_node, "nvidia,ganged-mode", 0);
 	if (np) {
 		struct platform_device *gangster = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!gangster)
+			return -EPROBE_DEFER;
 
 		dsi->slave = platform_get_drvdata(gangster);
-		of_node_put(np);
 
 		if (!dsi->slave) {
 			put_device(&gangster->dev);
-- 
2.25.1

