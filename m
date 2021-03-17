Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4933EAAC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 08:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC189A74;
	Wed, 17 Mar 2021 07:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2529489A62
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HhDgB
 qjBcvhk9CXs4aaWu4TwFYv97w8AoJIatOGi19I=; b=US64WvfuweYjELoxrxu9I
 LVTMj2SXNE59ryxPTwN0aoWvBnVLYVTwPmTexdAptIzmkPCey1DWlMEP1OSWt2zM
 4FLKSQoPcnBm+/6UfZDZXB70qIEOAH5v2c9Jwj6yuDfyae35IQ9Tl2APb7Uc2GIx
 gLI+B7CIzTTGe5hboyM3l0=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
 by smtp9 (Coremail) with SMTP id DcCowAC3IwHaslFgA0SmBg--.14447S2;
 Wed, 17 Mar 2021 15:42:22 +0800 (CST)
From: zuoqilin1@163.com
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] display: Fix typo issue
Date: Wed, 17 Mar 2021 15:42:28 +0800
Message-Id: <20210317074228.1147-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: DcCowAC3IwHaslFgA0SmBg--.14447S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyrGF43Ary7XF4fGr48JFb_yoWftrb_C3
 WfZrs8uayUZ3Z0vr1akrn8ZrWSv3WYvrW8X3y0q34Fyw12yr1UGrsrWryxXw15XF1UtFWD
 Xa18XFn5ZFsrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0UEf5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/1tbiZR5YiV8ZNQXaRgAAsA
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
Cc: zuoqilin <zuoqilin@yulong.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zuoqilin <zuoqilin@yulong.com>

Change 'befor' to 'before'.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index f94025e..45187ff 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -846,7 +846,7 @@ static void intel_dsi_pre_enable(struct intel_atomic_state *state,
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_INIT_OTP);
 
 	/* Enable port in pre-enable phase itself because as per hw team
-	 * recommendation, port should be enabled befor plane & pipe */
+	 * recommendation, port should be enabled before plane & pipe */
 	if (is_cmd_mode(intel_dsi)) {
 		for_each_dsi_port(port, intel_dsi->ports)
 			intel_de_write(dev_priv,
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
