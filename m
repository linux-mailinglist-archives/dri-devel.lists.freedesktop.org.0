Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD1343BE5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 09:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF41889C60;
	Mon, 22 Mar 2021 08:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 906 seconds by postgrey-1.36 at gabe;
 Mon, 22 Mar 2021 08:31:35 UTC
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F589FFD;
 Mon, 22 Mar 2021 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=AOj1KLDMOWvHBGXOOf
 nN3WKopE7N9vEYfmfmtmIwbrQ=; b=LIy2BIyA2+Zhlqp5krdHEz4pnj48Czlezb
 HzyExMuPooTogFvLgYr1ZkUy1WLbqd+t1v8dv8Z/GWWjh7agnspnfkPDHT7mw2Ua
 OUKDqIZ8OPzuacJk0eqhnSLAzFLBKSWBES9mGf7QBLW8+rS1ftvDywoQsQiMWgSe
 GJqGgHuoY=
Received: from wengjianfeng.ccdomain.com (unknown [218.17.89.92])
 by smtp5 (Coremail) with SMTP id HdxpCgBHfDk6UlhgLSO1BQ--.5281S2;
 Mon, 22 Mar 2021 16:15:56 +0800 (CST)
From: samirweng1979 <samirweng1979@163.com>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, kenneth.feng@amd.com
Subject: [PATCH] drm/amd/pm/powerplay/smumgr/smu7_smumgr: Fix some typo error
Date: Mon, 22 Mar 2021 16:16:06 +0800
Message-Id: <20210322081606.25116-1-samirweng1979@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: HdxpCgBHfDk6UlhgLSO1BQ--.5281S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1UAr4fAFW3tw13Wr1xXwb_yoW8GrW3pF
 s3Cr43Z3yxA3W7Ka1DWa17Xry8C3W8XFyqkFsrC3s0934YgrnYvF98Gayavw4UGa4xCw1x
 t39Fg39rW3WIv37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b5JPiUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: pvdpx25zhqwiqzxzqiywtou0bp/1tbiHRxdsVSIp0RWJAAAsg
X-Mailman-Approved-At: Mon, 22 Mar 2021 08:38:13 +0000
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
Cc: wengjianfeng <wengjianfeng@yulong.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: wengjianfeng <wengjianfeng@yulong.com>

change 'addres' to 'address'

Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
index aae2524..0de9e0e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
@@ -97,7 +97,7 @@ int smu7_copy_bytes_to_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address,
 	addr = smc_start_address;
 
 	while (byte_count >= 4) {
-	/* Bytes are written into the SMC addres space with the MSB first. */
+	/* Bytes are written into the SMC address space with the MSB first. */
 		data = src[0] * 0x1000000 + src[1] * 0x10000 + src[2] * 0x100 + src[3];
 
 		result = smu7_set_smc_sram_address(hwmgr, addr, limit);
@@ -127,7 +127,7 @@ int smu7_copy_bytes_to_smc(struct pp_hwmgr *hwmgr, uint32_t smc_start_address,
 		extra_shift = 8 * (4 - byte_count);
 
 		while (byte_count > 0) {
-			/* Bytes are written into the SMC addres space with the MSB first. */
+			/* Bytes are written into the SMC address space with the MSB first. */
 			data = (0x100 * data) + *src++;
 			byte_count--;
 		}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
