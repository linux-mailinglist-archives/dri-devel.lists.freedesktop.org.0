Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E551649DCD0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B5510ECB4;
	Thu, 27 Jan 2022 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1231 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 07:13:03 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD010E429
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 07:13:03 +0000 (UTC)
X-QQ-mid: bizesmtp37t1643267572tjg1zcey
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 27 Jan 2022 15:12:41 +0800 (CST)
X-QQ-SSF: 0140000000000090E000B00A0000000
X-QQ-FEAT: JWRRigPlP3C2ST/VISuYxlpF+8MYFF6xQgFjVx5xL6ysOicrVfE4j/Mykv4bw
 eMPUQ14VMRRTqTiYBuu4yLyawDhm5PMBmWELTsdVhz36s4RfcUBshcVWnU8X+ZJ4uEk5nDr
 Z61h9ujLRT1Twa34a5XabVQ2QdcFv1NAJ8cY8euDpICwNxWEsvrslOXV4gqHZAC5dweZZqq
 eP4233FhCsVQoAuGChRYCsgIVffHA+OK8DiMSKun5hE0W/9inKwY7KWTq9Usu0KoONb9rcU
 6TX9ooMkkzoCeOuKAfCWt0V5aHfBtExXXmzG16AwSS1yTZWYvInFLO6/S4osWGU+4HJdy5o
 Wb4e9H9lGnmNLZ2RKTIIt43N8hMItkD8tNjh+fm
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: fix spelling mistake "disbale" -> "disable"
Date: Thu, 27 Jan 2022 15:12:39 +0800
Message-Id: <20220127071239.30487-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
Cc: tangmeng <tangmeng@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake. Fix it.

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..a642c04cf17d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -544,7 +544,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 {
 	int r;
 
-	/* trigger gpu-reset by hypervisor only if TDR disbaled */
+	/* trigger gpu-reset by hypervisor only if TDR disabled */
 	if (!amdgpu_gpu_recovery) {
 		/* see what event we get */
 		r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
-- 
2.20.1



