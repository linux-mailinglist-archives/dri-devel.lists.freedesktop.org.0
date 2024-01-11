Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63F82A96A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3210E81A;
	Thu, 11 Jan 2024 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ABC410E070;
 Thu, 11 Jan 2024 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=B6dg5XI085eV8ar8x1
 7LtMcKlb86pt7nPrHs8KNxFgY=; b=ElB+FNBRtpWItIqntaJc7jA4kVs/jsGUyz
 hO0Ec1dg89ejF4rANJDabVD4WmheS2MAS1m2ISB8MZq7lu0SlHA4u7eGNnv3djcx
 dyN8ynObSqmfSDb4uD1g7Fo6PNWtglSiMe3t/5i5sAzOPh+tvqpTFKemSKxn0Nje
 N78NCc/R0=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wDX_6BkWp9lAXydAA--.35605S2;
 Thu, 11 Jan 2024 11:03:01 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, airlied@gmail.com, Xinhui.Pan@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in kgd_pp_interface.h
Date: Thu, 11 Jan 2024 03:02:59 +0000
Message-Id: <20240111030259.6956-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDX_6BkWp9lAXydAA--.35605S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kGF1xAF1xGr18KF13twb_yoWkJFX_Ca
 18Xw17XrWUXF9rA3ZxZF4xKry7K3W8CF1xXa43K3WSyF1rZw4Sqay7WF1UZ3WfuF4DGFWq
 kF4rXryFy3Z7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHBdixWV2zz9UwQAAsa
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/kgd_pp_interface.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 36a5ad8c00c5..82de10502e1b 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -244,8 +244,7 @@ enum pp_df_cstate {
  * @PP_PWR_LIMIT_DEFAULT: Default Power Limit
  * @PP_PWR_LIMIT_MAX: Maximum Power Limit
  */
-enum pp_power_limit_level
-{
+enum pp_power_limit_level {
 	PP_PWR_LIMIT_MIN = -1,
 	PP_PWR_LIMIT_CURRENT,
 	PP_PWR_LIMIT_DEFAULT,
@@ -260,8 +259,7 @@ enum pp_power_limit_level
  * @PP_PWR_TYPE_FAST: manages the ~10 ms moving average of APU power,
  * where supported.
  */
-enum pp_power_type
-{
+enum pp_power_type {
 	PP_PWR_TYPE_SUSTAINED,
 	PP_PWR_TYPE_FAST,
 };
-- 
2.17.1

