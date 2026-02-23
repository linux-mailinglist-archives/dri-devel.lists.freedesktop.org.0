Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FsQEkCmnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E617C0E0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1531110E436;
	Mon, 23 Feb 2026 19:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7wH2lTr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjPcKMI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE3610E436
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGvHHg3478511
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=; b=m7wH2lTrbckyyAoH
 Nq0YgUrLHzRpU0f75e++hvwWcg9D/K/6fCSJP00SPtZZ8W5UHstqCNf11HNUsD30
 7nRwYxUv7bSMcvbUjpe0Zaq+1cv650nIJtRQ8duA9LojrHVLgp+IQ9+8PtFKlSnW
 GpQ04ITdzq9W6yvDUUWEFtuc+JuxCz7Gl6zcRERzlYtt899rtAwXc21vyQ+d79E8
 dC6+dCgc+WDc3xPJ5cY8CSfV6sfMO4NTFfEG/y7WjaSoWEuV517kUo0le0Konli0
 a3Ds8fp5jJNkxAd9zD6VG0iFV4s9HKr2bb03+xQAYduExkf4NHC983wP6oIiHbyD
 aCl38Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9re8g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ad4a8c1f5aso34368215ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873852; x=1772478652;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=;
 b=RjPcKMI8BMiGqCzwbRrBvtOjVz0HM3NM3QmkDspWYGslz1LpFSP69606DpNZxrrxJ9
 ma5U1RZUt4BKhEM14YrAYiANX7xhutZWfvhGb1/Yg2gNYlJdhGcrbA6UDVQF8U4lNLim
 QoDtECsa5006THZqDNZcsgwlt0GiHOzzoffHgdlvAoR46bVqUH4W47iAZDsKIXmI/BOJ
 iA0KwDoRqutXSJXOjsoHNYr15/ahpqoUOy2QteBImWKpuAkA8fDJ21en+52kFyx9ynUU
 N3Y0Vnf9aGX9yvcdWIAmCqgYigRudUq704XjdOLQmfMkx2ruuP/XgEJGvFAUn5DZ18wC
 ryhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873852; x=1772478652;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cJ0oJqnbxwoxgHJVLtPPhyhuNFvTLFXLHOGqp8GIsxk=;
 b=azML0X8uh25oYoA5r0JXV8aNLaXt53wLG3DBDx0K0KjvXlbJ30atJLDO7RNwvOrdaV
 nL3Pma8FUEokgnj/xvQpad13IHhLZ0I+cBrUwuyDU02ebaziyp/oUlbmu8q2kmELairX
 mv2MdUiwT0Ts4JlNRap67UrbaysD5Pv4B0UU6Mb/tCxayeL+rTYqyYH1estBJQOwSIb9
 NapOt40heUql6yc7b5AHsZFGD3pI1pYt45PvUhvRLgR0rPp4rB3GU48PdQzlsj7+1FhU
 IAJ7LsB0YgV4SWtt8gMVTmn2gNgGzcakjp7ODRXMeEnyK11SV10EgBr1DGopp98+w96X
 OGKw==
X-Gm-Message-State: AOJu0YzNrOrjmbA43Ork7cqZ78V6ZrrX84mu1Zh96EfXpw8nKmEx7B5O
 4BumfHzZDShTDkOlDK6Rv+DbL8ZR/ZksV3NYioVdHKtxnH+ysAxryjbr6u51qNC57xSTD/abct7
 kT+5+Ch4n3q4IrkGESLRKuWkEp3aj4b80PRn0DhMqlYqMlKn21xgDnS+z3gqvu1VcAz2JeSY=
X-Gm-Gg: ATEYQzytaV8fwVNrZoGUWsJRrtqrK8WSLLWs/gQizEKgHm+JqN6lM+9gs6Ktcs1l/88
 /EHmCEvXVkW2KQR6bary8wKJKEI75UKpYaxFRgNU5idbC2Eyz9KKmS7SCptnWTvV7KJ/dCAtUXT
 0gx2j/Axgw/GlgDMllNSojbjhCb+kamsnUsolNqBiYHz6AII8bzGrYdJtc7r4n734InIMiOIPfm
 PsNdQaZMj3wo829fSDCZMIaARb1JnzRFshbBh0w3FD+T7zyiTpYVbvERc3dLvG5aF7qMeClrZUC
 gqGmX2CE+U356pRecxZyXHZAKEXOs3uuTJD0RIhmjyfsy9brwrwkkXLMoc0kjH+zbqAC47j5FdS
 VZIQRhnjCzrOzyY8i8TcGikSoInU25irM39suzx7j6AsI6GKj6aReaw==
X-Received: by 2002:a17:902:e851:b0:2aa:e238:e20c with SMTP id
 d9443c01a7336-2ad742acbf0mr84551505ad.19.1771873851715; 
 Mon, 23 Feb 2026 11:10:51 -0800 (PST)
X-Received: by 2002:a17:902:e851:b0:2aa:e238:e20c with SMTP id
 d9443c01a7336-2ad742acbf0mr84551275ad.19.1771873851123; 
 Mon, 23 Feb 2026 11:10:51 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:10:50 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:06 +0530
Subject: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=21201;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=7mQ77ZyIRIZpix+MEkpRhzH3l7JakwhyX4cr6888lx8=;
 b=kvlxSsSTu5ZFmzliiB7GHjfovysmfYNJDznymXxqrq4DKVH4R7zB3Cd4/b/ittKmcGlRKuQuV
 gyFRiLS4ygnDvG4K6x8v13GqxZIcQ/jiEPHYypkTCOfQsqiHh7x6/CX
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699ca63c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8l03lAX63Vq187oFkXoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX4CTUGgmrB9SN
 s3N7z+DV/oF8o9rMLjh008uJuSBhO1M1Ssfbbh5pEAVXOmK2N747oJ7NaOg3hMPnTBVIrwor3kg
 LQg7sni7c1XseWWX73wmhLHAGGMCMlcewXHPmKx0EHSrz/WBWtlHXhQl/u2fC6zFKskgeJUDCsS
 0QUbZKk8kguCHjmbyy03nPyaoc9ZG4lQ9pykpnDLSQGgXDkinRklQxZ+/yNBgST0EK0OuCae7gD
 2XFGAmZ0sx7No1mnrpFK85R6mDEH0MHxsKlHzpYzkgTLWhs6E94hch0kxBHnGmv8d54qSZLOjvz
 6cxtHpBSfiPhVvHd6tjreJcjO6mf63OaHL7i1E2K6HPGF10Mbdcgue4aOcW4ZZBmtUeHp0dCoJ0
 +8ea5aD7wU55ecJSbPJWI/c+PAxb8OV0d+So2MmwnOibvBUGqNWM6XH18kyFIrRvPafXRksSE9K
 Z0EnrDuQ8ToM6NHH3yQ==
X-Proofpoint-ORIG-GUID: hUHg30RGS2I2pcD5EfQSWQOLrLfEdVgT
X-Proofpoint-GUID: hUHg30RGS2I2pcD5EfQSWQOLrLfEdVgT
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: AE8E617C0E0
X-Rspamd-Action: no action

Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
it with the existing per-process memory manager and IOMMU device model.

The implementation extends qda_gem_obj to represent imported dma-bufs,
including dma_buf references, attachment state, scatter-gather tables
and an imported DMA address used for DSP-facing book-keeping. The
qda_gem_prime_import() path handles reimports of buffers originally
exported by QDA as well as imports of external dma-bufs, attaching them
to the assigned IOMMU device and mapping them through the memory manager
for DSP access. The GEM free path is updated to unmap and detach
imported buffers while preserving the existing behaviour for locally
allocated memory.

The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
which records the calling drm_file in a driver-private import context
before invoking the core DRM helpers. The GEM import callback retrieves
this context to ensure that an IOMMU device is assigned to the process
and that imported buffers follow the same per-process IOMMU selection
rules as natively allocated GEM objects.

This patch prepares the driver for interoperable buffer sharing between
QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
lifetime handling consistent with the existing GEM allocation flow.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   1 +
 drivers/accel/qda/qda_drv.c            |   8 ++
 drivers/accel/qda/qda_drv.h            |   4 +
 drivers/accel/qda/qda_gem.c            |  60 +++++++---
 drivers/accel/qda/qda_gem.h            |  10 ++
 drivers/accel/qda/qda_ioctl.c          |   7 ++
 drivers/accel/qda/qda_ioctl.h          |  15 +++
 drivers/accel/qda/qda_memory_manager.c |  42 ++++++-
 drivers/accel/qda/qda_memory_manager.h |  14 +++
 drivers/accel/qda/qda_prime.c          | 194 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_prime.h          |  43 ++++++++
 11 files changed, 377 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 88c324fa382c..8286f5279748 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -13,5 +13,6 @@ qda-y := \
 	qda_ioctl.o \
 	qda_gem.o \
 	qda_memory_dma.o \
+	qda_prime.o \
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 0dd0e2bb2c0f..4adee00b1f2c 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -10,9 +10,11 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/qda_accel.h>
+#include <drm/drm_prime.h>
 
 #include "qda_drv.h"
 #include "qda_gem.h"
+#include "qda_prime.h"
 #include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
@@ -166,6 +168,8 @@ static struct drm_driver qda_drm_driver = {
 	.postclose		= qda_postclose,
 	.ioctls = qda_ioctls,
 	.num_ioctls = ARRAY_SIZE(qda_ioctls),
+	.gem_prime_import = qda_gem_prime_import,
+	.prime_fd_to_handle = qda_ioctl_prime_fd_to_handle,
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -174,6 +178,7 @@ static void cleanup_drm_private(struct qda_dev *qdev)
 {
 	if (qdev->drm_priv) {
 		qda_dbg(qdev, "Cleaning up DRM private data\n");
+		mutex_destroy(&qdev->drm_priv->import_lock);
 		kfree(qdev->drm_priv);
 	}
 }
@@ -240,6 +245,9 @@ static int init_drm_private(struct qda_dev *qdev)
 	if (!qdev->drm_priv)
 		return -ENOMEM;
 
+	mutex_init(&qdev->drm_priv->import_lock);
+	qdev->drm_priv->current_import_file_priv = NULL;
+
 	qda_dbg(qdev, "DRM private data initialized successfully\n");
 	return 0;
 }
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 8a2cd474958b..bb0dd7e284c6 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -64,6 +64,10 @@ struct qda_drm_priv {
 	struct qda_memory_manager *iommu_mgr;
 	/* Back-pointer to qda_dev */
 	struct qda_dev *qdev;
+	/* Lock protecting import context */
+	struct mutex import_lock;
+	/* Current file_priv during prime import */
+	struct drm_file *current_import_file_priv;
 };
 
 /* struct qda_dev - Main device structure for QDA driver */
diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
index bbd54e2502d3..37279e8b46fe 100644
--- a/drivers/accel/qda/qda_gem.c
+++ b/drivers/accel/qda/qda_gem.c
@@ -8,6 +8,7 @@
 #include "qda_gem.h"
 #include "qda_memory_manager.h"
 #include "qda_memory_dma.h"
+#include "qda_prime.h"
 
 static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
 {
@@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
 		qda_err(NULL, "Invalid GEM object size\n");
 		return -EINVAL;
 	}
-	if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
-		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
-		return -EINVAL;
-	}
-	if (!qda_gem_obj->iommu_dev->dev) {
-		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
-		return -EINVAL;
-	}
-	if (!qda_gem_obj->virt) {
-		qda_err(NULL, "Allocated buffer missing virtual address\n");
-		return -EINVAL;
-	}
-	if (qda_gem_obj->dma_addr == 0) {
-		qda_err(NULL, "Allocated buffer missing DMA address\n");
-		return -EINVAL;
+	if (qda_gem_obj->is_imported) {
+		if (!qda_gem_obj->sgt) {
+			qda_err(NULL, "Imported buffer missing sgt\n");
+			return -EINVAL;
+		}
+		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
+			qda_err(NULL, "Imported buffer missing IOMMU device\n");
+			return -EINVAL;
+		}
+	} else {
+		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
+			qda_err(NULL, "Allocated buffer missing IOMMU device\n");
+			return -EINVAL;
+		}
+		if (!qda_gem_obj->virt) {
+			qda_err(NULL, "Allocated buffer missing virtual address\n");
+			return -EINVAL;
+		}
+		if (qda_gem_obj->dma_addr == 0) {
+			qda_err(NULL, "Allocated buffer missing DMA address\n");
+			return -EINVAL;
+		}
 	}
-
 	return 0;
 }
 
@@ -60,9 +67,21 @@ void qda_gem_free_object(struct drm_gem_object *gem_obj)
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
 	struct qda_drm_priv *drm_priv = get_drm_priv_from_device(gem_obj->dev);
 
-	if (qda_gem_obj->virt) {
-		if (drm_priv && drm_priv->iommu_mgr)
+	if (qda_gem_obj->is_imported) {
+		if (qda_gem_obj->attachment && qda_gem_obj->sgt)
+			dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+							  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+		if (qda_gem_obj->attachment)
+			dma_buf_detach(qda_gem_obj->dma_buf, qda_gem_obj->attachment);
+		if (qda_gem_obj->dma_buf)
+			dma_buf_put(qda_gem_obj->dma_buf);
+		if (qda_gem_obj->iommu_dev && drm_priv && drm_priv->iommu_mgr)
 			qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
+	} else {
+		if (qda_gem_obj->virt) {
+			if (drm_priv && drm_priv->iommu_mgr)
+				qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
+		}
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -174,6 +193,11 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
 	if (IS_ERR(qda_gem_obj))
 		return (struct drm_gem_object *)qda_gem_obj;
+	qda_gem_obj->is_imported = false;
+	qda_gem_obj->dma_buf = NULL;
+	qda_gem_obj->attachment = NULL;
+	qda_gem_obj->sgt = NULL;
+	qda_gem_obj->imported_dma_addr = 0;
 
 	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
 	if (ret) {
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index cbd5d0a58fa4..3566c5b2ad88 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -31,6 +31,16 @@ struct qda_gem_obj {
 	size_t size;
 	/* IOMMU device that performed the allocation */
 	struct qda_iommu_device *iommu_dev;
+	/* True if buffer is imported, false if allocated */
+	bool is_imported;
+	/* Reference to imported dma_buf */
+	struct dma_buf *dma_buf;
+	/* DMA buf attachment */
+	struct dma_buf_attachment *attachment;
+	/* Scatter-gather table */
+	struct sg_table *sgt;
+	/* DMA address of imported buffer */
+	dma_addr_t imported_dma_addr;
 };
 
 /*
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index ef3c9c691cb7..d91983048d6c 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -5,6 +5,7 @@
 #include <drm/qda_accel.h>
 #include "qda_drv.h"
 #include "qda_ioctl.h"
+#include "qda_prime.h"
 
 static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
 					struct qda_dev **qdev, struct qda_user **qda_user)
@@ -78,3 +79,9 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 	drm_gem_object_put(gem_obj);
 	return ret;
 }
+
+int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv, int prime_fd,
+				 u32 *handle)
+{
+	return qda_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 6bf3bcd28c0e..d454256f5fc5 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -23,4 +23,19 @@
  */
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_prime_fd_to_handle - IOCTL handler for PRIME FD to handle conversion
+ * @dev: DRM device structure
+ * @file_priv: DRM file private data
+ * @prime_fd: File descriptor of the PRIME buffer
+ * @handle: Output parameter for the GEM handle
+ *
+ * This IOCTL handler converts a PRIME file descriptor to a GEM handle.
+ * It serves as both the DRM driver callback and can be used directly.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+				 int prime_fd, u32 *handle);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
index e225667557ee..3fd20f17c57b 100644
--- a/drivers/accel/qda/qda_memory_manager.c
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -154,8 +154,8 @@ static struct qda_iommu_device *get_process_iommu_device(struct qda_memory_manag
 	return qda_priv->assigned_iommu_dev;
 }
 
-static int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
-					    struct drm_file *file_priv)
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv)
 {
 	struct qda_file_priv *qda_priv;
 	struct qda_iommu_device *selected_dev = NULL;
@@ -223,6 +223,35 @@ static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_man
 	return NULL;
 }
 
+static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
+					   struct qda_gem_obj *gem_obj,
+					   struct qda_iommu_device *iommu_dev)
+{
+	struct scatterlist *sg;
+	dma_addr_t dma_addr;
+	int ret = 0;
+
+	if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
+		qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
+		return -EINVAL;
+	}
+
+	gem_obj->iommu_dev = iommu_dev;
+
+	sg = gem_obj->sgt->sgl;
+	if (sg) {
+		dma_addr = sg_dma_address(sg);
+		dma_addr += ((u64)iommu_dev->sid << 32);
+
+		gem_obj->imported_dma_addr = dma_addr;
+	} else {
+		qda_err(NULL, "Invalid scatter-gather list for imported buffer\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
 			     struct drm_file *file_priv)
 {
@@ -248,7 +277,10 @@ int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return -ENOMEM;
 	}
 
-	ret = qda_dma_alloc(selected_dev, gem_obj, size);
+	if (gem_obj->is_imported)
+		ret = qda_memory_manager_map_imported(mem_mgr, gem_obj, selected_dev);
+	else
+		ret = qda_dma_alloc(selected_dev, gem_obj, size);
 
 	if (ret) {
 		qda_err(NULL, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
@@ -268,6 +300,10 @@ void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return;
 	}
 
+	if (gem_obj->is_imported) {
+		qda_dbg(NULL, "Freed imported buffer tracking (no DMA free needed)\n");
+		return;
+	}
 	qda_dma_free(gem_obj);
 }
 
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
index bac44284ef98..f6c7963cec42 100644
--- a/drivers/accel/qda/qda_memory_manager.h
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -106,6 +106,20 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
 void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
 					  struct qda_iommu_device *iommu_dev);
 
+/**
+ * qda_memory_manager_assign_device() - Assign an IOMMU device to a process
+ * @mem_mgr: Pointer to memory manager
+ * @file_priv: DRM file private data for process association
+ *
+ * Assigns an IOMMU device to the calling process. If the process already has
+ * a device assigned, returns success. If another file descriptor from the same
+ * PID has a device, reuses it. Otherwise, finds an available device and assigns it.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv);
+
 /**
  * qda_memory_manager_alloc() - Allocate memory for a GEM object
  * @mem_mgr: Pointer to memory manager
diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
new file mode 100644
index 000000000000..3d23842e48bb
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_prime.h"
+#include "qda_memory_manager.h"
+
+static struct drm_gem_object *check_own_buffer(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	if (dma_buf->priv) {
+		struct drm_gem_object *existing_gem = dma_buf->priv;
+
+		if (existing_gem->dev == dev) {
+			struct qda_gem_obj *existing_qda_gem = to_qda_gem_obj(existing_gem);
+
+			if (!existing_qda_gem->is_imported) {
+				drm_gem_object_get(existing_gem);
+				return existing_gem;
+			}
+		}
+	}
+	return NULL;
+}
+
+static struct qda_iommu_device *get_iommu_device_for_import(struct qda_drm_priv *drm_priv,
+							    struct drm_file **file_priv_out,
+							    struct qda_dev *qdev)
+{
+	struct drm_file *file_priv;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_iommu_device *iommu_dev = NULL;
+	int ret;
+
+	file_priv = drm_priv->current_import_file_priv;
+	*file_priv_out = file_priv;
+
+	if (!file_priv || !file_priv->driver_priv)
+		return NULL;
+
+	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	iommu_dev = qda_file_priv->assigned_iommu_dev;
+
+	if (!iommu_dev) {
+		ret = qda_memory_manager_assign_device(drm_priv->iommu_mgr, file_priv);
+		if (ret) {
+			qda_err(qdev, "Failed to assign IOMMU device: %d\n", ret);
+			return NULL;
+		}
+
+		iommu_dev = qda_file_priv->assigned_iommu_dev;
+	}
+
+	return iommu_dev;
+}
+
+static int setup_dma_buf_mapping(struct qda_gem_obj *qda_gem_obj, struct dma_buf *dma_buf,
+				 struct device *attach_dev, struct qda_dev *qdev)
+{
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sgt;
+	int ret;
+
+	attachment = dma_buf_attach(dma_buf, attach_dev);
+	if (IS_ERR(attachment)) {
+		ret = PTR_ERR(attachment);
+		qda_err(qdev, "Failed to attach dma_buf: %d\n", ret);
+		return ret;
+	}
+	qda_gem_obj->attachment = attachment;
+
+	sgt = dma_buf_map_attachment_unlocked(attachment, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		qda_err(qdev, "Failed to map dma_buf attachment: %d\n", ret);
+		dma_buf_detach(dma_buf, attachment);
+		return ret;
+	}
+	qda_gem_obj->sgt = sgt;
+
+	return 0;
+}
+
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct qda_drm_priv *drm_priv;
+	struct qda_gem_obj *qda_gem_obj;
+	struct drm_file *file_priv;
+	struct qda_iommu_device *iommu_dev;
+	struct qda_dev *qdev;
+	struct drm_gem_object *existing_gem;
+	size_t aligned_size;
+	int ret;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv || !drm_priv->iommu_mgr) {
+		qda_err(NULL, "Invalid drm_priv or iommu_mgr\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	qdev = drm_priv->qdev;
+
+	existing_gem = check_own_buffer(dev, dma_buf);
+	if (existing_gem)
+		return existing_gem;
+
+	iommu_dev = get_iommu_device_for_import(drm_priv, &file_priv, qdev);
+	if (!iommu_dev || !iommu_dev->dev) {
+		qda_err(qdev, "No IOMMU device assigned for prime import\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	qda_dbg(qdev, "Using IOMMU device %u for prime import\n", iommu_dev->id);
+
+	aligned_size = PAGE_ALIGN(dma_buf->size);
+	qda_gem_obj = qda_gem_alloc_object(dev, aligned_size);
+	if (IS_ERR(qda_gem_obj))
+		return (struct drm_gem_object *)qda_gem_obj;
+
+	qda_gem_obj->is_imported = true;
+	qda_gem_obj->dma_buf = dma_buf;
+	qda_gem_obj->virt = NULL;
+	qda_gem_obj->dma_addr = 0;
+	qda_gem_obj->imported_dma_addr = 0;
+	qda_gem_obj->iommu_dev = iommu_dev;
+
+	get_dma_buf(dma_buf);
+
+	ret = setup_dma_buf_mapping(qda_gem_obj, dma_buf, iommu_dev->dev, qdev);
+	if (ret)
+		goto err_put_dma_buf;
+
+	ret = qda_memory_manager_alloc(drm_priv->iommu_mgr, qda_gem_obj, file_priv);
+	if (ret) {
+		qda_err(qdev, "Failed to allocate IOMMU mapping: %d\n", ret);
+		goto err_unmap;
+	}
+
+	qda_dbg(qdev, "Prime import completed successfully size=%zu\n", aligned_size);
+	return &qda_gem_obj->base;
+
+err_unmap:
+	dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+					  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach(dma_buf, qda_gem_obj->attachment);
+err_put_dma_buf:
+	dma_buf_put(dma_buf);
+	qda_gem_cleanup_object(qda_gem_obj);
+	return ERR_PTR(ret);
+}
+
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle)
+{
+	struct qda_drm_priv *drm_priv;
+	struct qda_dev *qdev;
+	int ret;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv) {
+		qda_dbg(NULL, "Failed to get drm_priv from device\n");
+		return -EINVAL;
+	}
+
+	qdev = drm_priv->qdev;
+
+	if (file_priv && file_priv->driver_priv) {
+		struct qda_file_priv *qda_file_priv;
+
+		qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	} else {
+		qda_dbg(qdev, "Called with NULL file_priv or driver_priv\n");
+	}
+
+	mutex_lock(&drm_priv->import_lock);
+	drm_priv->current_import_file_priv = file_priv;
+
+	ret = drm_gem_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
+
+	drm_priv->current_import_file_priv = NULL;
+	mutex_unlock(&drm_priv->import_lock);
+
+	if (!ret)
+		qda_dbg(qdev, "Completed with ret=%d, handle=%u\n", ret, *handle);
+	else
+		qda_dbg(qdev, "Completed with ret=%d\n", ret);
+
+	return ret;
+}
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
new file mode 100644
index 000000000000..939902454dcd
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QDA_PRIME_H
+#define _QDA_PRIME_H
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-buf.h>
+
+/**
+ * qda_gem_prime_import - Import a DMA-BUF as a GEM object
+ * @dev: DRM device structure
+ * @dma_buf: DMA-BUF to import
+ *
+ * This function imports an external DMA-BUF into the QDA driver as a GEM
+ * object. It handles both re-imports of buffers originally from this driver
+ * and imports of external buffers from other drivers.
+ *
+ * Return: Pointer to the imported GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
+
+/**
+ * qda_prime_fd_to_handle - Core implementation for PRIME FD to GEM handle conversion
+ * @dev: DRM device structure
+ * @file_priv: DRM file private data
+ * @prime_fd: File descriptor of the PRIME buffer
+ * @handle: Output parameter for the GEM handle
+ *
+ * This core function sets up the necessary context before calling the
+ * DRM framework's prime FD to handle conversion. It ensures proper IOMMU
+ * device assignment and tracking for the import operation.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle);
+
+#endif /* _QDA_PRIME_H */

-- 
2.34.1

