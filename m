Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D32F5D7F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEA26E160;
	Thu, 14 Jan 2021 09:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A139899B7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 07:48:06 +0000 (UTC)
Received: from zhangzhijie.loongson.cn (unknown [10.20.41.29])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxBb0r9_9fujcEAA--.4490S2;
 Thu, 14 Jan 2021 15:47:55 +0800 (CST)
From: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 sunpeng.li@amd.com
Subject: [PATCH] drm/amdgpu: Repeat assignment to max_slave_planes
Date: Thu, 14 Jan 2021 15:47:55 +0800
Message-Id: <20210114074755.45539-1-zhangzhijie@loongson.cn>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9AxBb0r9_9fujcEAA--.4490S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1kuw1xWFyUGr1UJry3twb_yoW3Awb_KF
 1UCr98Wr4YyF1Dua4jyr15uFyIvr48urWkZ3WqyasIvwsrXr1fAr47CF18Gw1UZF4xta4D
 Ar4xWFnrAasrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
 6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2xR6UUUUU
X-CM-SenderInfo: x2kd0wx2klyx3h6o00pqjv00gofq/1tbiAQABAF3QvM2NOAAAsJ
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:32 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index 3f63822b8e28..9a86d43a6233 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -1272,7 +1272,6 @@ static bool underlay_create(struct dc_context *ctx, struct resource_pool *pool)
 
 	/* update the public caps to indicate an underlay is available */
 	ctx->dc->caps.max_slave_planes = 1;
-	ctx->dc->caps.max_slave_planes = 1;
 
 	return true;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
