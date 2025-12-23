Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85ECDA183
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 18:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019710E228;
	Tue, 23 Dec 2025 17:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND9GwadF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzbRbkxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613910E228
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:24:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNErwvA461418
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6Tz
 nsuzTKNE=; b=ND9GwadFpMksHEJVz2ZWv6XsZs2pRMoYVywO+zKNqHTZ5vr2V9A
 sP+bkFdEMuwSAFwYc8hcGTI2KN9bO1ua4FZb8pu+xDBVCAtnY+SE9h9lnsJKCs40
 yG+aF76piwcJOD37RMbI2lUJJ0jKKfq7Hwr0pwPd/boUYCPW542zUaNskH6/sw6h
 NBm59o5fzAYTHHDUXae2KLt9/6v7soUV9Ni3UN7KSBrvF8nzmUQZlwRF5abHFoxm
 YqdBm6t61Ye6qA0N1Cw539q8QxRjJWzrNaPq3J9aMOmdo42mxkcd14/bXRk1Rh47
 mhUQ0369qpgz0wagjLvr0Qr0rANLbgOdeCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8frg8c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:24:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0193a239so54381281cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 09:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766510667; x=1767115467;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6TznsuzTKNE=;
 b=FzbRbkxHKnzcJwUIxOGY8fGegTwuK1IAMKIND1RnuJFr473YcxWZOAX0VsEw/bbEif
 eqI9aEjxaZMd2VNSbbFsGULzQT6I+CGW1zexeCB2y+jdzq+3sSm/VxOMM4f25yhNQDmV
 F+s9rdULOEm10IPd9HVVlQ9XSZFVazPTacvPYdRU9yiZf5ebsWWvuMfuxNN0PKUZhkX+
 3p0py2x8RHBUXPE9GEMR37BTycoW842NtZzsQPa9sx0kcX2VgFXjvfuURe2PWQ+rwMSF
 a9oC7wYHIS92YiqNQPvo5McVm49/qfFnUkha/rDyoenAhmBcg64U6jaqcZv4JfyLo8sG
 FzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766510667; x=1767115467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6TznsuzTKNE=;
 b=e9ULmCW8PXJ+PcAtYwZVPqE5z2+AtXiQbmYM0Eb6ktVS/iFunCfQT/t6zQcYMN7gwg
 SDy1cbD1TdC1I5hgq/0Ygt1PpNrzymJnQVZGI7t+64wgb/BL4iCAA8/KlmuFUbpPNoaE
 qKK6VQ3elyxaTHqKFzjjstw6CP4Vg5llJwtNlg1yY+HnE86c49cBfc1OncS1B48dZ5r/
 HZRCgrU9pA6ih7lj/SvoeTjp3ogQgEJeTQ41xqaIkTSXw0p5mSBjniIu0iDycrR4bqMi
 P07nS8/C2YbKodMtVs4p1RFA8WGNCcTBNj57EvM4UO4vpXY4E5cZOJmoeE6qWgDw7uu0
 GnAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmMDIoamjCUYOD9r5JDxaFAdUo1solBrMJsMHLLyARiQFjn/pWk9JUJaITrPqAd2WTXSNpli079ug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyGD+jDVGNsxREOlO2lc4RgUn5dC/3yz4/TBITo2CYtQ61XPwf
 AGy9xZDTXKcwTKoDtqbyoXt+J1HToIkjR6pB9DzOQ8EWE+LfpIkdHgRhJ9jSrh9kkWcPmiZtDnq
 cmADLTeWOf+XSlQTl/GRlym7gnrJU9MyZPgSir8M+xYlyP0nA/ZEy9DhiQCEyAbv0pesIneg=
X-Gm-Gg: AY/fxX48RKgtmobSUnsCr9zdhS6LQmu4dSCbLsA5P3jiWX5ONsOJiqA3E6GS3h7OaP7
 INFQgrbgOUyZQTmpIlDdkxFEYQZJoJ1mtjSfOGMvk5rOWqLxKJcj5l4kXKkTdL4G5s6lbVXBTJv
 0CiA2MW+bwRhBh6OMmAAKtPRKHiYWHvcJNChKIs1acZLSpjEY7LhnD6v3zp78n5yIU13QXd9hYV
 KNlW+PocLLCTWXpOyLZdOEuRFKSskVc8q89ADEceBbSt3wViiispBsxd51PaDQFRTdxqrvUSFnK
 cAX01i6RWTLbaOCwtG/D9q2EAnYI8gOqoskC2HnAoGYA7puLVZOzfC2/Pe/B3EEXiz+Uz6uRiek
 L88wMmazHai4jNUSU1Q/DmYSOzY2Lag1qB1gbx86dH3G4Qm7bWA==
X-Received: by 2002:a05:622a:588c:b0:4f1:cd0c:80f6 with SMTP id
 d75a77b69052e-4f4abd6225emr259716721cf.49.1766510666683; 
 Tue, 23 Dec 2025 09:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESYr/AwoMzjuB3Nqy//uC8TSZdjQCi/iCS/jRegkiv6laMO6vTreal4sdu6FYx4jrMPNBU0A==
X-Received: by 2002:a05:622a:588c:b0:4f1:cd0c:80f6 with SMTP id
 d75a77b69052e-4f4abd6225emr259716051cf.49.1766510665991; 
 Tue, 23 Dec 2025 09:24:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8080e2177csm448974766b.68.2025.12.23.09.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:24:25 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Update copyright headers to yearless format
Date: Tue, 23 Dec 2025 18:24:25 +0100
Message-ID: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FVgMHJhRCuCSZqwYzeE2lFUKP4Qs75Z3
X-Proofpoint-ORIG-GUID: FVgMHJhRCuCSZqwYzeE2lFUKP4Qs75Z3
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694ad04b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZGpvmaf78dKCArbXv7wA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX3mMoPCHENokV
 KN7GRqLsqgsXaF+V0GIDtQCvbtnvTMps7SwTgmYvnQXwBvcckNtXWtuDQjWte0ugG/vBsBO1aIi
 dcOWRloydPASOUPer7xlCBpuv4x7l4fJSa923S90NH9JvcYDvRwtjWNSlDwLzGBviAWEqF45onT
 ns1QzNrMJzh+EMHrNnBtNmF5rpp9n0XSVWYXP02H7jq40abpi/N7DjRpSDspXsqbUEdyaKycTGZ
 TQRDfmcYgh1gf25GkTC6N7sgtzYwN+VbNUl93nocwrj13a/yju9lODoR0vMc19QOsyCqQk4ldlo
 UoymvQ2NWd3bE5gHbf0zlz+QdC+JgSTwrUJ/lEh6j/H7xaVbgAxIaEmPi9Dr8FL2GvkNPyqFNar
 Ie/AbMYhGHiUrqn6afpVPkAMfr/jSEb95ePz3aSHjL4UvRA+uoha3Mc7L7QgDNqg1NL5SOFh7TL
 3BkBPhdYWmlzHS3mMKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230144
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

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Update copyright headers in accordance with Qualcomm's current
legal policy.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c | 2 +-
 drivers/accel/qaic/mhi_controller.h | 9 ++++-----
 drivers/accel/qaic/qaic.h           | 9 ++++-----
 drivers/accel/qaic/qaic_control.c   | 2 +-
 drivers/accel/qaic/qaic_data.c      | 2 +-
 drivers/accel/qaic/qaic_debugfs.c   | 2 +-
 drivers/accel/qaic/qaic_debugfs.h   | 2 +-
 drivers/accel/qaic/qaic_drv.c       | 2 +-
 drivers/accel/qaic/qaic_ras.c       | 1 -
 drivers/accel/qaic/qaic_ras.h       | 1 +
 drivers/accel/qaic/qaic_ssr.c       | 2 +-
 drivers/accel/qaic/qaic_ssr.h       | 9 ++++-----
 drivers/accel/qaic/qaic_timesync.c  | 3 ++-
 drivers/accel/qaic/qaic_timesync.h  | 7 +++----
 drivers/accel/qaic/sahara.c         | 2 +-
 drivers/accel/qaic/sahara.h         | 2 +-
 16 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 13a14c6c6168..c23f1d7cdea7 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/delay.h>
 #include <linux/err.h>
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
index 8939f6ae185e..c1940c839246 100644
--- a/drivers/accel/qaic/mhi_controller.h
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef MHICONTROLLERQAIC_H_
 #define MHICONTROLLERQAIC_H_
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index fa7a8155658c..83948358ada1 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef _QAIC_H_
 #define _QAIC_H_
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..ac0d3b59900f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
 #include <linux/completion.h>
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 60cb4d65d48e..5da5dceccc3f 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..5289d33744ba 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
diff --git a/drivers/accel/qaic/qaic_debugfs.h b/drivers/accel/qaic/qaic_debugfs.h
index 05e74f84cf9f..59a002bab07c 100644
--- a/drivers/accel/qaic/qaic_debugfs.h
+++ b/drivers/accel/qaic/qaic_debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_DEBUGFS_H__
 #define __QAIC_DEBUGFS_H__
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 4c70bd949d53..4c884e8aa346 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index f1d52a710136..de8fe90a6a2c 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
 /* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
index d44a4eeeb060..7b3fe9585ed9 100644
--- a/drivers/accel/qaic/qaic_ras.h
+++ b/drivers/accel/qaic/qaic_ras.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
 
 #ifndef __QAIC_RAS_H__
diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
index 9b662d690371..ac6249877e62 100644
--- a/drivers/accel/qaic/qaic_ssr.c
+++ b/drivers/accel/qaic/qaic_ssr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
 #include <drm/drm_file.h>
diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
index 97ccff305750..af074edbf967 100644
--- a/drivers/accel/qaic/qaic_ssr.h
+++ b/drivers/accel/qaic/qaic_ssr.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2020, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_SSR_H__
 #define __QAIC_SSR_H__
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 8af2475f4f36..956544df0c18 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
index 77b9c2b55057..6aeda1d62a35 100644
--- a/drivers/accel/qaic/qaic_timesync.h
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -1,7 +1,6 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_TIMESYNC_H__
 #define __QAIC_TIMESYNC_H__
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index fd3c3b2d1fd3..9fea294e1d7b 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
index 640208acc0d1..08037281c80e 100644
--- a/drivers/accel/qaic/sahara.h
+++ b/drivers/accel/qaic/sahara.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __SAHARA_H__
 #define __SAHARA_H__
-- 
2.43.0

