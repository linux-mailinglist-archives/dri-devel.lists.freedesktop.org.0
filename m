Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ElFODimnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2017C0D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB6210E434;
	Mon, 23 Feb 2026 19:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqkqPx5D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6evuhvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E010E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NC2lAC3151910
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=; b=OqkqPx5DajaGaPNQ
 9oi4JyZMGMa3uC/V148Ftz8x1qGnU5jAn3Hp0OyelszklsQjRnTYsvyORjcrM5J9
 kM2n5nqoKGR3lemZUd6RdrKRRqFvGW+Q1Ht3tEGVxFO/2U6dEhXf8cn5HZ2X3kXl
 Kkizh3UFar+DJHRqvmO0AMqAGaxwp0V1dX2VUyrwQCIw/4H0tBsl02lEtqFDdgtC
 VthsA6QRlGvoQIhZwQfqW6jdByd9tRb8EMbf3I8v1Q5yINNnEVDs5ZwLyY9LMi9G
 O4Oz+2umASGPUZxESnS87u4K/HjCdhLsQ3y9P+KMc0qpOIZj+mZGE2SJvRACwM8/
 zPRv3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89c27-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2aad3380076so28166415ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873844; x=1772478644;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=;
 b=h6evuhvhYiDWNYgWzGuXPav4BXYGrRD9ICjVJptwbhIPImF68HdaR5ZYbEthpulOxS
 GWv4gmgi/kOIwbnsc/Od7YTZOXNiY3ltUJd0dI7jGMU8N0KG99OH7H3gox8K3r3+woBT
 cq77ZvlGXM3EpEsCoCHMJZuggrpxlByugQ/+Nj7+E2G7xoisQXZDRPycrr/W8oqC4lmT
 dVb84warKm5TMoMzzmNuNHMsWu2odULxXRCiI7bjbsY/Rt0+LzntyCr9nXDOWDYwmO96
 gOVmCIpkOHpAXFDrWTqlqRsMnzeRVkYmnvAS43UnUw3LcglWwQRP4SEbdxZxp5QSaeQp
 DDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873844; x=1772478644;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=;
 b=q7fwzJ5MwadrV91yTCcfYaYZR5Fly4t+Vsutt62BDmxrdhf+WU1Zc1JFxY43oR+XWM
 IjTEZwHMLh/qNNHv0bCKYqTfUUjy72VKVeA1ZSRM0GGT5FMyX3ot3GFAj6kKmAwYfOSr
 UQYKWtfMbf2/rzWmCnoAucyLDSNqrn7TtE+98lJZIutmcX74AC3r3TyN8Tr/Yln2Jx2Q
 dpRJZhaiqKX9JKj3VzoBgGK1mBd2gowk/q+LMKZWF9AHsMBaHehbfAte0N3hFSgeEzwz
 tis4XF51CJVUbeCHjI/Vi3qfZAcfCPvCE1epnwQpwnugsgjBEB0c3vO60erZrA89KNOv
 V4iQ==
X-Gm-Message-State: AOJu0Yxnck2Huy7AlZoC5x2RNveR+YuwME+zNVN/kCx8PPw/mg+9Tf9F
 ivt7FhpxAB/83Vcg27M756ZNRavOTtw1NPfq6TV5eNH4IIxAa21aXqVTvDZvBhtxq6sz1afvTOY
 jstzsTAd8yo9gpyLieQ1Tpk0N6ndzv2bpjuaJvM76ykc5/SawY1ZrCu3BaVDXvblTYiqggvM=
X-Gm-Gg: ATEYQzy6Ls+zswE92aEIztNUgMHfXIZ0FL3OeSZJPpq8EwVTFNXFrcoS/xWsiNAqMqe
 LHLYK/jnGNOMphtQ9TfjnRoXPVGilXkyzl+HOfTFKOxrkBMkmB4i2brlL84fdCcQkjdrNaiGBre
 UG4zUvR88C0DxhObW9cWewhHqM6irzC6qaqqKMv2UGXlNHDi0P3P+awBhYC60QyNrhOQwDrG0o7
 uPX6nuEsSStsl8smsTQ+hsYsh2YPvCESzlVoyhvzsRZnpCPnPVOND27Vdb7dLV0Ulvk96hRhrgz
 55Q0r8BGB5BX+7lb3183UwLlcIPn6qOq/sYayLag36NukcbjrQ7F3jwi7G3U011NaZwTHkNKuST
 dCl9zsQXX0wyPsovhlko83LhuvB7drP3q3+xFdISTnPnKwyw2dpiU/A==
X-Received: by 2002:a17:903:1107:b0:2a9:320d:285e with SMTP id
 d9443c01a7336-2ad5f7b8baamr123910565ad.27.1771873844288; 
 Mon, 23 Feb 2026 11:10:44 -0800 (PST)
X-Received: by 2002:a17:903:1107:b0:2a9:320d:285e with SMTP id
 d9443c01a7336-2ad5f7b8baamr123910275ad.27.1771873843731; 
 Mon, 23 Feb 2026 11:10:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:10:43 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:05 +0530
Subject: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6899;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=2RxOxXc9zqZvtJxNIuKIxSb9BnPuUuUrWmkgeMbTfW8=;
 b=OdNLCIrevKeJOr4Sn7iJQ7EA64taPtlHsqOdk0FAznWQBx7+UrSyEBkaxLabf/n4ZADVR797g
 gmHDCtzQkxDCDFwH4r3tYY2PYPpjtmNKwQNMzhCaFXo/sq/VV+FDLok
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX0T1K646Cx65B
 Pk0PMZIeQNR1kaDxWOHyu0DVDgs5yxTSXRpdMcDOr50m4VnKD3Wlv4eM3rFWfyZtD1NwfHJKD2N
 Mf51tIZbMG5vA4VBWO2+3bGMkKdGm2yVhsFntk+f0/WV7ysBIoQRZpzwxAyGMM7nzaWE6bkd5fm
 2b6C3/Q939b1EAnMkSWvx97W67Bqs5gF5wBwhKFEnK/kzTTSAbmYtg/YyB/X8pdYauz1PM9EzuL
 xhW9fqU6oF/aRDnJEyHahxBm0qgdErSn7oy5io9tgoDlq8QznUHSNLFE3sx3tSdlT6KGAvAgeAy
 efOlhOgrOXceNtPoIvieCIakwZvBcVAfZiLrSx2LpeHUxoaWJMT2M5+7+oIsP2GdUSoBH/V8FXb
 C8h33Qx4VY1J5fUGH/voUcoknBXKNPkO5PfpAMI745GnCoOmSW7PTMgs36Q5/CkbqTsbiJLnF5/
 qpSHu4AAYx5LmnyaAGw==
X-Proofpoint-GUID: _yNeIWka9tJzWqjz5fksLBtrFeB2sLH9
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ca635 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mxALtX23GHkpHf8IwecA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _yNeIWka9tJzWqjz5fksLBtrFeB2sLH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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
X-Rspamd-Queue-Id: 96D2017C0D9
X-Rspamd-Action: no action

Add two GEM-related IOCTLs for the QDA accelerator driver and hook
them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
a DMA-backed GEM buffer object via qda_gem_create_object() and
returns a GEM handle to userspace, while
DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
given GEM handle using drm_gem_create_mmap_offset() and the
vma_node in the GEM object.

The QDA driver is updated to advertise DRIVER_GEM in its
driver_features, and the new IOCTLs are wired through the QDA
GEM and memory-manager backend. These IOCTLs allow userspace to
allocate buffers and map them into its address space as a first
step toward full compute buffer management and integration with
DSP workloads.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c   |  5 ++++-
 drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 19798359b14e..0dd0e2bb2c0f 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -12,6 +12,7 @@
 #include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_gem.h"
 #include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
@@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 };
 
 static struct drm_driver qda_drm_driver = {
-	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
 	.open			= qda_open,
 	.postclose		= qda_postclose,
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index caae9cda5363..cbd5d0a58fa4 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 void qda_gem_free_object(struct drm_gem_object *gem_obj);
 int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
 
+/*
+ * GEM IOCTL handlers
+ */
+
+/**
+ * qda_ioctl_gem_create - Create a GEM buffer object
+ * @dev: DRM device structure
+ * @data: User-space data containing buffer creation parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler creates a new GEM buffer object with the specified
+ * size and returns a handle to the created buffer.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+/**
+ * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
+ * @dev: DRM device structure
+ * @data: User-space data containing buffer handle and offset result
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
+ * which can be used to map the buffer into user-space memory.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 /*
  * Helper functions for GEM object allocation and cleanup
  * These are used internally and by the PRIME import code
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 9fa73ec2dfce..ef3c9c691cb7 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
 
 	return 0;
 }
+
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_create *args = data;
+	struct drm_gem_object *gem_obj;
+	struct qda_drm_priv *drm_priv;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv || !drm_priv->iommu_mgr)
+		return -EINVAL;
+
+	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
+	if (IS_ERR(gem_obj))
+		return PTR_ERR(gem_obj);
+
+	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
+}
+
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_mmap_offset *args = data;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
+	if (IS_ERR(gem_obj))
+		return PTR_ERR(gem_obj);
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret == 0)
+		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+
+	drm_gem_object_put(gem_obj);
+	return ret;
+}
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 0aad791c4832..ed24a7f5637e 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -19,6 +19,8 @@ extern "C" {
  * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
  */
 #define DRM_QDA_QUERY	0x00
+#define DRM_QDA_GEM_CREATE		0x01
+#define DRM_QDA_GEM_MMAP_OFFSET	0x02
 /*
  * QDA IOCTL definitions
  *
@@ -27,6 +29,10 @@ extern "C" {
  * data structure and direction (read/write) for each IOCTL.
  */
 #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
+#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
+						 struct drm_qda_gem_create)
+#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
+						 struct drm_qda_gem_mmap_offset)
 
 /**
  * struct drm_qda_query - Device information query structure
@@ -40,6 +46,36 @@ struct drm_qda_query {
 	__u8 dsp_name[16];
 };
 
+/**
+ * struct drm_qda_gem_create - GEM buffer object creation parameters
+ * @size: Size of the GEM object to create in bytes (input)
+ * @handle: Allocated GEM handle (output)
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
+ * a new GEM buffer object.
+ */
+struct drm_qda_gem_create {
+	__u32 handle;
+	__u32 pad;
+	__u64 size;
+};
+
+/**
+ * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
+ * @handle: GEM handle (input)
+ * @pad: Padding for 64-bit alignment
+ * @offset: mmap offset for the GEM object (output)
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
+ * the mmap offset that can be used with mmap() to map the GEM object into
+ * user space.
+ */
+struct drm_qda_gem_mmap_offset {
+	__u32 handle;
+	__u32 pad;
+	__u64 offset;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

