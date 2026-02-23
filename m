Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMV6DgymnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7917C089
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91310E42B;
	Mon, 23 Feb 2026 19:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq9pokng";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dP1sw4gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93D410E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGvRjE3478625
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S6BW4dW2ywZ4/HLGr+6fZIss9z/qAzeM/An5n/lWr58=; b=mq9poknge6nqd1Pz
 FhwEFp/IEuDflgfU8tkXGOKs2V0mgnNOfGGqdgAWfQttPsjES87vukG79mviTV4u
 4JzVcUfOSL/NX2BuW7IXdpynwBMjh9T5Lnfd8C/wjOrnhAdQEqrE3X6A/LcHK9WJ
 IKUmlRtt6PXW6ugzeI+B4dKbHiByVCMkRCT4s+vcSM0b0kN62F+T1W3whZANAapq
 0NtkLnAyYWWVnoA6bk0I5a0TUW03XvdhCTXnTOtnoqLF+dXAeM9tskxFQP6/+QhB
 iqGxD3Z76Sow1PJOz+o9RiQmq/Zuh6lNXx0DCX1uGDVpl9/xgI8aG9oL4XaZSSyJ
 dr7WYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9re5v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a943e214daso320104765ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873799; x=1772478599;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S6BW4dW2ywZ4/HLGr+6fZIss9z/qAzeM/An5n/lWr58=;
 b=dP1sw4gzqBJO0yLu95jrJvr2+pmfp1+yXnjFTD+/uu/xIJwM0Xz/KagAftCJ+4Hpuc
 HwhhgOwOxQ1YVflCgADrkI64+FzDzt6X2VRrJtBHIg0EVVjoEbYL9aCXFDAaluwoZuVH
 aF/nYO+G5XLjCgb/Ng0mZSy5mzQoegOTd6FlpK57eSt9pd5TkVe18mEfBknS+iSDAD9S
 gcKCqnyMuPzmCo+/r5n/GDzcY2zIL/Cdlgn6AMPWClZLDYoVapHZH9JysU9Ke18Bo8y2
 6umciTTyArcGSW0zLIlWwZV9fbHFk8NgzOzgJ2bMFRS47SS9a6YikzJBmpMGFv9lfy3Z
 htnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873799; x=1772478599;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S6BW4dW2ywZ4/HLGr+6fZIss9z/qAzeM/An5n/lWr58=;
 b=ZzJ+o/DL+sGj9IL7/+81MdUx5kar2/EOMBJ1505lU3f5OYIeT+LWGB0bCPB/V7OlgW
 Wooa5LXMp4gzcROudlwLF2SCi8MFV9oJi96wV9a1fjMgJQsBAJUnigPE5oi89hqUjO4K
 Toqbq2njRiTsI665OuhlzFmbR40f1XCGwtUsz9f5JyOvEVeScz+iTaA2KyRazOzGldm4
 N7GSOP3AkVT2PaqMWPdcoVWXR7yTkecIiGF/hfD/BF8JZeZTCzbwmJ+2FpD4OoVk1RdH
 bOKRhsZ5Y3Zug6lxXdGOJv1Z0sXLpNCyXAvN4Ifn/SIBOt2bcJnIuk9y+nwpZQKnAs9T
 4K2w==
X-Gm-Message-State: AOJu0Yysv+NSfyURVJpTKiZAHvNKzfatWvlz4AYvA1vEWU/mvrPDwLIl
 ZnRcclt4L52Ge50rzhCrsxL60AXJamLLMT+dLbbwnU3ymBCoRYz6nELNQH+tAQ/VhtoQWh5OWxF
 2v1P2hS1riDOVSr7hu9gAb0dX2+4wryPtWjPG2aOCPW3qQ6gzUZ8qbXfsJt3TbpXRrEsiT1Q=
X-Gm-Gg: ATEYQzxmJJQujXNRi0mGh4L+tUYG0+RAYCrc/X4jVqhh7p74W0e7pJ//a5udhtVhZp8
 u9hMCiiPpcet5bGxp2KtMQeeIkBkdRBxs3NjjN2oQBplp0U8UzOhAAJlVISVADIiqmOmdBGb7F6
 iElmI0bVmYATiUoCFFJOFTyTIPKWdHkIJHvjvqI+SvwgOM91xPnvtEPFoFycxAqs+eUuzQB7nHx
 EoKc/LOcLRAQgkAnH9iQvlgYxRgJ9ncm8a4S9WK9NO6ejb2kdKpEvlaS7h47drBf49bfDRq+EKY
 4duQdYp05WRNc1YiLKIKGMzpBwh5AQXk4mELeZ6lgD+mnid9xam1nR4DnJHo/iXyfwwYPpGu2fq
 5n12JbeynmsQ9HYz7qwoPe6RTh5nbBE+awMrmDMMSrqJXSDxMnLge2A==
X-Received: by 2002:a17:902:dac5:b0:2aa:dcc0:36d with SMTP id
 d9443c01a7336-2ad744d7624mr110779055ad.29.1771873799074; 
 Mon, 23 Feb 2026 11:09:59 -0800 (PST)
X-Received: by 2002:a17:902:dac5:b0:2aa:dcc0:36d with SMTP id
 d9443c01a7336-2ad744d7624mr110778655ad.29.1771873798552; 
 Mon, 23 Feb 2026 11:09:58 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:09:57 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:59 +0530
Subject: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=9471;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=uRWna2Wq0flfgEETgNxem/WYArV8Nkok4tKoQHjzWxQ=;
 b=5Gq8HlCmEWPXaf0QjCVSjVbZM3q73FJhDAA8QQPaPrkGylytixRivMHddlns2VOXK2u9KdDaN
 r9hVhi2dLOKDnCHIi3ALabBCCdj5bicbfHHwdS1UY5AJknWjHqIJ77d
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699ca608 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xNUCdPruuQ-iWW5F5X8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX7XqhW0wzjGiX
 Jnf9aH4L78vfw8af69q/wENmsf9uc0P0o4iedGprFeDGD7XkQOGrJBMk6blK8GZRdTEdGa+SU1o
 eaYBmfbS7LN8RbNRAVDhP5CuwPIQ1kRv8p9y0MUINI1Xeb2qPxaG8GgOsKUKTJAfHlGGNlAPISn
 C0+rjZ58XB3GeCFh2VWWuId1s+MLz0q+4AqWy/NER9iNmG6MWdBW1gVf82JpvlqbYpte5k5NP7f
 /8ZHDBFEUL6nIUDTfM8Z6SK5gQcALHWWxmWXeg3XUXcgbf0Y424yekHlNSX1KTaiEPTTW/TI6jl
 243v4eHPFgdjdO5snmkTTuGuoxp/NlyKAnK7toILpbDWUief8uA0aTsdfVr5M83I/hZTBVxFibV
 GClB6pTgd+Y7b5svTHqQtiw1Ou7jQer67x2isLhzglS5l0TQoE0XvkA3U5mmwvow+RZWyGfTzBs
 L+IZcthluMSFmjwORwA==
X-Proofpoint-ORIG-GUID: 2g1nj2NEKQeK6vkNpzyWTkJopFywybbw
X-Proofpoint-GUID: 2g1nj2NEKQeK6vkNpzyWTkJopFywybbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
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
X-Rspamd-Queue-Id: CFA7917C089
X-Rspamd-Action: no action

Add support for creating compute context-bank (CB) devices under
the QDA compute bus based on child nodes of the FastRPC RPMsg
device tree node. Each DT child with compatible
"qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
device on qda_cb_bus_type.

A new qda_cb_dev structure and cb_devs list in qda_dev track these
CB devices. qda_populate_child_devices() walks the DT children
during QDA RPMsg probe, creates CB devices, configures their DMA
and IOMMU settings using of_dma_configure(), and associates a SID
from the "reg" property when present.

On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
devices, removing them from their IOMMU groups if present and
unregistering the devices. This prepares the ground for using CB
devices as IOMMU endpoints for DSP compute workloads in later
patches.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |   1 +
 drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_cb.h    |  26 ++++++++
 drivers/accel/qda/qda_drv.h   |   3 +
 drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
 5 files changed, 220 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 242684ef1af7..4aded20b6bc2 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_drv.o \
 	qda_rpmsg.o \
+	qda_cb.o \
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
new file mode 100644
index 000000000000..77a2d8cae076
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-mapping.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/iommu.h>
+#include <linux/slab.h>
+#include "qda_drv.h"
+#include "qda_cb.h"
+
+static void qda_cb_dev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
+static int qda_configure_cb_iommu(struct device *cb_dev, struct device_node *cb_node)
+{
+	int ret;
+
+	qda_dbg(NULL, "Configuring DMA/IOMMU for CB device %s\n", dev_name(cb_dev));
+
+	/* Use of_dma_configure which handles both DMA and IOMMU configuration */
+	ret = of_dma_configure(cb_dev, cb_node, true);
+	if (ret) {
+		qda_err(NULL, "of_dma_configure failed for %s: %d\n", dev_name(cb_dev), ret);
+		return ret;
+	}
+
+	qda_dbg(NULL, "DMA/IOMMU configured successfully for CB device %s\n", dev_name(cb_dev));
+	return 0;
+}
+
+static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
+{
+	int rc;
+	u32 sid, pa_bits = 32;
+
+	qda_dbg(qdev, "Setting up CB device %s\n", dev_name(cb_dev));
+
+	if (of_property_read_u32(cb_dev->of_node, "reg", &sid)) {
+		qda_dbg(qdev, "No 'reg' property found, defaulting SID to 0\n");
+		sid = 0;
+	}
+
+	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
+	if (rc) {
+		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
+		return rc;
+	}
+
+	qda_dbg(qdev, "CB device setup complete - SID: %u, PA bits: %u\n", sid, pa_bits);
+
+	return 0;
+}
+
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
+{
+	struct device *cb_dev;
+	int ret;
+	u32 sid = 0;
+	struct qda_cb_dev *entry;
+
+	qda_dbg(qdev, "Creating CB device for node: %s\n", cb_node->name);
+
+	of_property_read_u32(cb_node, "reg", &sid);
+
+	cb_dev = kzalloc_obj(*cb_dev, GFP_KERNEL);
+	if (!cb_dev)
+		return -ENOMEM;
+
+	device_initialize(cb_dev);
+	cb_dev->parent = qdev->dev;
+	cb_dev->bus = &qda_cb_bus_type; /* Use our custom bus type for IOMMU handling */
+	cb_dev->release = qda_cb_dev_release;
+	dev_set_name(cb_dev, "qda-cb-%s-%u", qdev->dsp_name, sid);
+
+	qda_dbg(qdev, "Initialized CB device: %s\n", dev_name(cb_dev));
+
+	cb_dev->of_node = of_node_get(cb_node);
+
+	cb_dev->dma_mask = &cb_dev->coherent_dma_mask;
+	cb_dev->coherent_dma_mask = DMA_BIT_MASK(32);
+
+	dev_set_drvdata(cb_dev->parent, qdev);
+
+	ret = device_add(cb_dev);
+	if (ret) {
+		qda_err(qdev, "Failed to add CB device for SID %u: %d\n", sid, ret);
+		goto cleanup_device_init;
+	}
+
+	qda_dbg(qdev, "CB device added to system\n");
+
+	ret = qda_configure_cb_iommu(cb_dev, cb_node);
+	if (ret) {
+		qda_err(qdev, "IOMMU configuration failed: %d\n", ret);
+		goto cleanup_device_add;
+	}
+
+	ret = qda_cb_setup_device(qdev, cb_dev);
+	if (ret) {
+		qda_err(qdev, "CB device setup failed: %d\n", ret);
+		goto cleanup_device_add;
+	}
+
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry) {
+		ret = -ENOMEM;
+		goto cleanup_device_add;
+	}
+
+	entry->dev = cb_dev;
+	list_add_tail(&entry->node, &qdev->cb_devs);
+
+	qda_dbg(qdev, "Successfully created CB device for SID %u\n", sid);
+	return 0;
+
+cleanup_device_add:
+	device_del(cb_dev);
+cleanup_device_init:
+	of_node_put(cb_dev->of_node);
+	put_device(cb_dev);
+	return ret;
+}
+
+void qda_destroy_cb_device(struct device *cb_dev)
+{
+	struct iommu_group *group;
+
+	if (!cb_dev) {
+		qda_dbg(NULL, "NULL CB device passed to destroy\n");
+		return;
+	}
+
+	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
+
+	group = iommu_group_get(cb_dev);
+	if (group) {
+		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
+		iommu_group_remove_device(cb_dev);
+		iommu_group_put(group);
+	}
+
+	of_node_put(cb_dev->of_node);
+	cb_dev->of_node = NULL;
+	device_unregister(cb_dev);
+
+	qda_dbg(NULL, "CB device %s destroyed\n", dev_name(cb_dev));
+}
diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
new file mode 100644
index 000000000000..a4ae9fef142e
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_CB_H__
+#define __QDA_CB_H__
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/list.h>
+#include <linux/qda_compute_bus.h>
+#include "qda_drv.h"
+
+struct qda_cb_dev {
+	struct list_head node;
+	struct device *dev;
+};
+
+/*
+ * Compute bus (CB) device management
+ */
+int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
+void qda_destroy_cb_device(struct device *cb_dev);
+
+#endif /* __QDA_CB_H__ */
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index bec2d31ca1bb..eb732b7d8091 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -7,6 +7,7 @@
 #define __QDA_DRV_H__
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/xarray.h>
@@ -26,6 +27,8 @@ struct qda_dev {
 	atomic_t removing;
 	/* Name of the DSP (e.g., "cdsp", "adsp") */
 	char dsp_name[16];
+	/* Compute context-bank (CB) child devices */
+	struct list_head cb_devs;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index a8b24a99ca13..5a57384de6a2 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -7,6 +7,7 @@
 #include <linux/of_device.h>
 #include "qda_drv.h"
 #include "qda_rpmsg.h"
+#include "qda_cb.h"
 
 static int qda_rpmsg_init(struct qda_dev *qdev)
 {
@@ -25,11 +26,42 @@ static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
 
 	qdev->dev = &rpdev->dev;
 	qdev->rpdev = rpdev;
+	INIT_LIST_HEAD(&qdev->cb_devs);
 
 	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
 	return qdev;
 }
 
+static void qda_unpopulate_child_devices(struct qda_dev *qdev)
+{
+	struct qda_cb_dev *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
+		list_del(&entry->node);
+		qda_destroy_cb_device(entry->dev);
+		kfree(entry);
+	}
+}
+
+static int qda_populate_child_devices(struct qda_dev *qdev, struct device_node *parent_node)
+{
+	struct device_node *child;
+	int count = 0, success = 0;
+
+	for_each_child_of_node(parent_node, child) {
+		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
+			count++;
+			if (qda_create_cb_device(qdev, child) == 0) {
+				success++;
+				qda_dbg(qdev, "Created CB device for node: %s\n", child->name);
+			} else {
+				qda_err(qdev, "Failed to create CB device for: %s\n", child->name);
+			}
+		}
+	}
+	return success > 0 ? 0 : (count > 0 ? -ENODEV : 0);
+}
+
 static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
 {
 	/* Dummy function for rpmsg driver */
@@ -48,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	qdev->rpdev = NULL;
 	mutex_unlock(&qdev->lock);
 
+	qda_unpopulate_child_devices(qdev);
 	qda_deinit_device(qdev);
 
 	qda_info(qdev, "RPMsg device removed\n");
@@ -83,6 +116,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (ret)
 		return ret;
 
+	ret = qda_populate_child_devices(qdev, rpdev->dev.of_node);
+	if (ret) {
+		qda_err(qdev, "Failed to populate child devices: %d\n", ret);
+		qda_deinit_device(qdev);
+		return ret;
+	}
+
 	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
 	return 0;
 }

-- 
2.34.1

