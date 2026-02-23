Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PCOJhumnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751717C09E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731E10E431;
	Mon, 23 Feb 2026 19:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="neotoJCg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDEdcJ5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3E410E431
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGRJ9T1640607
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=; b=neotoJCgxz1Qc9dM
 Q45RYB0v+pAkJHn//z12naDQwQxnAf7z/aAe939zG5kG6aS1WnjGZopw5NFerlSk
 /rk5qCjcb4dJ9at47aMuc6wekdDCU1fvrKCGfSUrgL8xcdmuVRxZMb6hrWj2cjj2
 jJSI+At3e/oLYB1t0NiL8Bf5G1w5iPZFFJVUoEhKkjdJK9hzewrarM9yZc9niNNj
 y/8N5Zk/eXYlKlVaetNbLoM50ena0zUyON+6R4qdwwhmytvjJ+JoTgZUiuKtMIkP
 0CapXAOBT9pS57mUWZAQxk1OrXGyZIJONvWlBxcol1kyyHubox+bmooXsRZFnaJK
 n8A1uQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rheg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aad5fc5b2fso39180375ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873815; x=1772478615;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=;
 b=VDEdcJ5z+L5M6u5pLj0JgFQLA73WBKKd85R+VvH+5+8IlRZR/8J9oiw9YkiMypSl8N
 KVRkTv5S4j5bX/63w4hMC5hib3rMSMjc0+0U9wh+j1Hz7XvlPMnOO+KIVEmb0TkUhTib
 pX0PZrl+pCwBvPZxckqp3m68IydOOCU5Qo3174lJhl8rIxbEIlmbOBqZE2uTrYcKGczR
 +mTsqTJegeDxyvwuQqm8/9R0DMcEQYfcMjIo6HHRMUiK7UT963Nujmut4NoQXv+S6ucX
 +p7IVBB+nUPvKv6z1OvvSkNPyVpoPD50yNI4PMqfpf7fc67/Zs+fDWT6S5gm4avaJlAM
 FAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873815; x=1772478615;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=;
 b=JKLNP+dFK5coM6OZczfsXwWjHhtGsHQdMdfm6rFi+SMF92ipxD7Yegzh2RZwF+cGQC
 heNPw6IMkWo5k914clySkGUapcWfdzZbbFPnG0kBkgOxxhb53yvWGcQ8if/84JxKVkBX
 eS0lj0GgrfdRKHHUM7zqReRerHp0o1hKwXOSOd51VcJ8SPDNYXATA3QMC3a6L+j4PLth
 ItwYW6Na6ukfV5ezcE8MdYDT6EdDDhXEgpNsY0nkcYmzelbKz6Rs6G1QS+xKrD/776/r
 ic3IjOP8H36VCQgRSIzT+iZPGk5DnV0tRKT5oarnXah8pwISscxfADeDzcQrYlMXSQig
 Eciw==
X-Gm-Message-State: AOJu0Ywqo/nNVSNKt5IVRywNL+4Vn19tgOTd6hnqhNX62iE7cRyygWOf
 GDua61j1qjYrEEAhFpwOVDzG0hSepqw500Lgp9IDBmrFaIKaqRhQonG0cnvDZH2VYxZpJX86Z+l
 imdToi/8o3sFUVRrnhn7ylYkOxoJhBwdB2K4QkAeUgEwm1YgdDiUyqhRE/RTHz9o8quXVWFM=
X-Gm-Gg: ATEYQzwBgX/blH5mEC6JeHepv354fvvhN0bFHjeoHfQWvXUWTq/4QDm4ILcLWbTHfQB
 nonq1CfG3pESa6wBG3gwjWFdxDU2ItZ6GrYUBNgjPbwJ7Rxin79mX/cOhuKILfFi1X0JbkdZ2Qd
 0nfSw8wftchleFmQZMxBiNfwgwbKucsclIrKYnadbq1jZ2VpXtwJtlbRDX9fbw92Sj95c2vW2Bf
 V2nBoreYiUGYWCJv2xkds5DBXtGjJvWF9o22kICjKJvbMgl5hberHlRY5lWPVEoiRmJRqSXUbNV
 /GIHsCZt6O7WJNQ8sy9EKynpGiK82P4OSjdSZukiMIoRI2Gb1rBmn0SDX65vjbsz282UaYmTHsr
 15o1sbuBwKGbkvMhOmuYrnKnGFlFYJ8/MKXrxFywOMfpSGGbuSyWT/g==
X-Received: by 2002:a17:902:ce0e:b0:299:e031:173 with SMTP id
 d9443c01a7336-2ad744e0f75mr96632975ad.35.1771873814486; 
 Mon, 23 Feb 2026 11:10:14 -0800 (PST)
X-Received: by 2002:a17:902:ce0e:b0:299:e031:173 with SMTP id
 d9443c01a7336-2ad744e0f75mr96632635ad.35.1771873813959; 
 Mon, 23 Feb 2026 11:10:13 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:10:12 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:01 +0530
Subject: [PATCH RFC 07/18] accel/qda: Add DRM accel device registration for
 QDA driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8182;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=eflhBKeXg5zwxShiL+GaVvttYv9N4fOm9mLw1I2A+H0=;
 b=BhxckZcN/OtS9rXcw34lRFsN71y8kr2IKGaSslRspRMkvDtNq/DG+ssbzCenfyQVMQMZh6zGt
 y3aGCpGgyOyCJanPJPw7P061BJPRJLydGxTVXmRz2lS2TbdWeizB3TC
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: SmMX-_KgvAbt5zKn-95xD3T0D8hsQI8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX1UElGpXc/EZq
 PHdM/QBPY2DAiGrYkmQtHGZPBfQRKs9NME+GpiRvh85gGOzznsOvFyyxH282lAmI+qvb0Snr92q
 7Wao7CUuSox/ZbyAH5X0LJg/M780Af6GIPrKkXLdP0BXGKay5KJwQZThT7u+xOSzeMBDBXNa0Ry
 gMh49fBftAhhFpSJ2aMz/0KFd8HH3/iKzX1Nl7v96w9hflcJSlNgCcfc8NS0XG9VzMuYXm8fWRE
 3yQlTyYnLwi0FS9DBx6+dma4yB+gJs8MtiyXcIjncDEIto0vGfsbQaQoW0/gtanzPr0rWysjNJl
 lAkCqW5AiLDJTRBZRcOJ/Gagsc+Z+151bm3e46BLCqqM3zwNOHSl8EDHj+XC8qRhN0J2mrXM6hA
 a1X6WIQ73+gEh1hdVpBxkNlePcrzTr4rrmECi6DUeaR2SDSd9CxFAjsj7eFlKn01qiNaLLFo0YK
 koqgBJQ5lhbyjqpHvSg==
X-Proofpoint-GUID: SmMX-_KgvAbt5zKn-95xD3T0D8hsQI8I
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ca617 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rdCUcgxLdif9O8q6BpAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4751717C09E
X-Rspamd-Action: no action

Add DRM accel integration for the QDA DSP accelerator driver. A new
qda_drm_priv structure is introduced to hold per-device DRM state,
including a pointer to the memory manager and the parent qda_dev
instance. The driver now allocates a drm_device, initializes
driver-private state, and registers the device via the DRM accel
infrastructure.

qda_register_device() performs allocation and registration of the DRM
device, while qda_unregister_device() handles device teardown and
releases references using drm_dev_unregister() and drm_dev_put().
Initialization and teardown paths are updated so DRM resources are
allocated after IOMMU/memory-manager setup and cleaned during RPMsg
remove.

This patch lays the foundation for adding GEM buffer support and IOCTL
handling in later patches as part of the compute accelerator interface.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h   |  33 +++++++++++++-
 drivers/accel/qda/qda_rpmsg.c |   8 ++++
 3 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 69132737f964..a9113ec78fa2 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -4,9 +4,31 @@
 #include <linux/kernel.h>
 #include <linux/atomic.h>
 #include <linux/slab.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
 #include "qda_drv.h"
 #include "qda_rpmsg.h"
 
+DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
+
+static struct drm_driver qda_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.fops			= &qda_accel_fops,
+	.name = DRIVER_NAME,
+	.desc = "Qualcomm DSP Accelerator Driver",
+};
+
+static void cleanup_drm_private(struct qda_dev *qdev)
+{
+	if (qdev->drm_priv) {
+		qda_dbg(qdev, "Cleaning up DRM private data\n");
+		kfree(qdev->drm_priv);
+	}
+}
+
 static void cleanup_iommu_manager(struct qda_dev *qdev)
 {
 	if (qdev->iommu_mgr) {
@@ -24,6 +46,7 @@ static void cleanup_device_resources(struct qda_dev *qdev)
 
 void qda_deinit_device(struct qda_dev *qdev)
 {
+	cleanup_drm_private(qdev);
 	cleanup_iommu_manager(qdev);
 	cleanup_device_resources(qdev);
 }
@@ -59,6 +82,18 @@ static int init_memory_manager(struct qda_dev *qdev)
 	return 0;
 }
 
+static int init_drm_private(struct qda_dev *qdev)
+{
+	qda_dbg(qdev, "Initializing DRM private data\n");
+
+	qdev->drm_priv = kzalloc_obj(*qdev->drm_priv, GFP_KERNEL);
+	if (!qdev->drm_priv)
+		return -ENOMEM;
+
+	qda_dbg(qdev, "DRM private data initialized successfully\n");
+	return 0;
+}
+
 int qda_init_device(struct qda_dev *qdev)
 {
 	int ret;
@@ -71,14 +106,82 @@ int qda_init_device(struct qda_dev *qdev)
 		goto err_cleanup_resources;
 	}
 
+	ret = init_drm_private(qdev);
+	if (ret) {
+		qda_err(qdev, "DRM private data initialization failed: %d\n", ret);
+		goto err_cleanup_iommu;
+	}
+
 	qda_dbg(qdev, "QDA device initialized successfully\n");
 	return 0;
 
+err_cleanup_iommu:
+	cleanup_iommu_manager(qdev);
 err_cleanup_resources:
 	cleanup_device_resources(qdev);
 	return ret;
 }
 
+static int setup_and_register_drm_device(struct qda_dev *qdev)
+{
+	struct drm_device *ddev;
+	int ret;
+
+	qda_dbg(qdev, "Setting up and registering DRM device\n");
+
+	ddev = drm_dev_alloc(&qda_drm_driver, qdev->dev);
+	if (IS_ERR(ddev)) {
+		ret = PTR_ERR(ddev);
+		qda_err(qdev, "Failed to allocate DRM device: %d\n", ret);
+		return ret;
+	}
+
+	qdev->drm_priv->drm_dev = ddev;
+	qdev->drm_priv->iommu_mgr = qdev->iommu_mgr;
+	qdev->drm_priv->qdev = qdev;
+
+	ddev->dev_private = qdev->drm_priv;
+	qdev->drm_dev = ddev;
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret) {
+		qda_err(qdev, "Failed to register DRM device: %d\n", ret);
+		drm_dev_put(ddev);
+		return ret;
+	}
+
+	qda_dbg(qdev, "DRM device registered successfully\n");
+	return 0;
+}
+
+int qda_register_device(struct qda_dev *qdev)
+{
+	int ret;
+
+	ret = setup_and_register_drm_device(qdev);
+	if (ret) {
+		qda_err(qdev, "DRM device setup failed: %d\n", ret);
+		return ret;
+	}
+
+	qda_dbg(qdev, "QDA device registered successfully\n");
+	return 0;
+}
+
+void qda_unregister_device(struct qda_dev *qdev)
+{
+	qda_info(qdev, "Unregistering QDA device\n");
+
+	if (qdev->drm_dev) {
+		qda_dbg(qdev, "Unregistering DRM device\n");
+		drm_dev_unregister(qdev->drm_dev);
+		drm_dev_put(qdev->drm_dev);
+		qdev->drm_dev = NULL;
+	}
+
+	qda_dbg(qdev, "QDA device unregistered successfully\n");
+}
+
 static int __init qda_core_init(void)
 {
 	int ret;
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2cb97e4eafbf..2b80401a3741 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -11,13 +11,35 @@
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/xarray.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_device.h>
+#include <drm/drm_accel.h>
 #include "qda_memory_manager.h"
 
 /* Driver identification */
 #define DRIVER_NAME "qda"
 
+/**
+ * struct qda_drm_priv - DRM device private data for QDA device
+ *
+ * This structure serves as the DRM device private data (stored in dev_private),
+ * bridging the DRM device context with the QDA device and providing access to
+ * shared resources like the memory manager during buffer operations.
+ */
+struct qda_drm_priv {
+	/* DRM device structure */
+	struct drm_device *drm_dev;
+	/* Global memory/IOMMU manager */
+	struct qda_memory_manager *iommu_mgr;
+	/* Back-pointer to qda_dev */
+	struct qda_dev *qdev;
+};
+
 /* struct qda_dev - Main device structure for QDA driver */
 struct qda_dev {
+	/* DRM device for accelerator interface */
+	struct drm_device *drm_dev;
 	/* RPMsg device for communication with remote processor */
 	struct rpmsg_device *rpdev;
 	/* Underlying device structure */
@@ -26,6 +48,8 @@ struct qda_dev {
 	struct mutex lock;
 	/* IOMMU/memory manager */
 	struct qda_memory_manager *iommu_mgr;
+	/* DRM device private data */
+	struct qda_drm_priv *drm_priv;
 	/* Flag indicating device removal in progress */
 	atomic_t removing;
 	/* Name of the DSP (e.g., "cdsp", "adsp") */
@@ -39,8 +63,8 @@ struct qda_dev {
  * @qdev: QDA device structure
  *
  * Returns the most appropriate device structure for logging messages.
- * Prefers qdev->dev, or returns NULL if the device is being removed
- * or invalid.
+ * Prefers qdev->dev, falls back to qdev->drm_dev->dev, or returns NULL
+ * if the device is being removed or invalid.
  */
 static inline struct device *qda_get_log_device(struct qda_dev *qdev)
 {
@@ -50,6 +74,9 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
 	if (qdev->dev)
 		return qdev->dev;
 
+	if (qdev->drm_dev)
+		return qdev->drm_dev->dev;
+
 	return NULL;
 }
 
@@ -93,5 +120,7 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
  */
 int qda_init_device(struct qda_dev *qdev);
 void qda_deinit_device(struct qda_dev *qdev);
+int qda_register_device(struct qda_dev *qdev);
+void qda_unregister_device(struct qda_dev *qdev);
 
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 5a57384de6a2..b2b44b4d3ca8 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -80,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	qdev->rpdev = NULL;
 	mutex_unlock(&qdev->lock);
 
+	qda_unregister_device(qdev);
 	qda_unpopulate_child_devices(qdev);
 	qda_deinit_device(qdev);
 
@@ -123,6 +124,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
+	ret = qda_register_device(qdev);
+	if (ret) {
+		qda_deinit_device(qdev);
+		qda_unpopulate_child_devices(qdev);
+		return ret;
+	}
+
 	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
 	return 0;
 }

-- 
2.34.1

