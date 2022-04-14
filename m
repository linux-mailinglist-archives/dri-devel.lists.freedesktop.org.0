Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA705501B52
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 20:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DD310E153;
	Thu, 14 Apr 2022 18:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Thu, 14 Apr 2022 18:50:55 UTC
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E60A10E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 18:50:55 +0000 (UTC)
Received: from localhost.localdomain (abxj52.neoplus.adsl.tpnet.pl [83.9.3.52])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 126D83F787;
 Thu, 14 Apr 2022 20:45:14 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 3/3] drm/msm/adreno: Fix up formatting
Date: Thu, 14 Apr 2022 20:44:35 +0200
Message-Id: <20220414184442.375113-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414184442.375113-1-konrad.dybcio@somainline.org>
References: <20220414184442.375113-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leading spaces are not something checkpatch likes, and it says so when
they are present. Use tabs consistently to indent function body and
unwrap a 83-char-long line, as 100 is cool nowadays.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a13a3e5a294b..f73f7b5dfd10 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -199,7 +199,7 @@ static inline int adreno_is_a420(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a430(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 430;
+	return gpu->revn == 430;
 }
 
 static inline int adreno_is_a506(struct adreno_gpu *gpu)
@@ -239,7 +239,7 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 618;
+	return gpu->revn == 618;
 }
 
 static inline int adreno_is_a619(struct adreno_gpu *gpu)
@@ -249,7 +249,7 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 630;
+	return gpu->revn == 630;
 }
 
 static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
@@ -259,18 +259,18 @@ static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 650;
+	return gpu->revn == 650;
 }
 
 static inline int adreno_is_7c3(struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
-       return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
+	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
 }
 
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 660;
+	return gpu->revn == 660;
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
@@ -281,14 +281,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
 {
-       return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
+	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
 }
 
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 650 || gpu->revn == 620 ||
-	       adreno_is_a660_family(gpu);
+	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
 }
 
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-- 
2.35.2

