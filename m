Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N9CK+a6hWmOFgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60694FC525
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED19410E664;
	Fri,  6 Feb 2026 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QbALdKBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53A810E6B9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:56:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61672Psk3430938; Fri, 6 Feb 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=k
 FtjyrjnTgI2d2/1Rshhag72oRsujxc+LiAFMKwOmMs=; b=QbALdKBuXBh/r6Vc+
 KK62IgAssowxbBWq2VxjrkTgfbJTuZmqho7op3bJfkw907wPbBS/w0qscuwQOh5j
 gBJRxNV78tRdwcB1C7vjglyYLh04lKQVdSK0LR8wz8u3Mos/XzINsUZ2QzyQAKLL
 3PA+GDnqAc4TR5lh2xG/zV1Rha7ftiMhD0ZrqAfMIhF5sCBPuG9uafrLxcjLD/9t
 zNNqMzXo5PtNyAL37z8GHHFkbXO+4eYSVy7rZYLYsZUvj9GHBBh5usG6W2ALwrTY
 mEO/NOOvjbyhf6k2NpjrGKnpWBwHRtBu2b/LkMsSQV1F3qpR1rjeNG9lFRedL3UE
 iq1qg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4c4je3s2n5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 09:56:32 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:56:31 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 6 Feb 2026 09:56:26 +0000
Subject: [PATCH 2/2] drm/imagination: Add PVR_GPU_ID_FMT to format pvr_gpu_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260206-bvnc-cleanup-v1-2-f3c818541fbe@imgtec.com>
References: <20260206-bvnc-cleanup-v1-0-f3c818541fbe@imgtec.com>
In-Reply-To: <20260206-bvnc-cleanup-v1-0-f3c818541fbe@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=yJ7P/Wy9o6odDdmjvuxN/nO0tjNOm7u94ehiOkuCuGs=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS27jpXFvDuqsLGhgDR0Os+2RK5+plnuax5Pa4vVD+kx
 Xhnw9OAjlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZhIeC8jw1rbDLZIq7XO88Mb
 SiRbVFlvROUX+m6Imeu+UyHHzfveZ4b/yTEi+fybFLLX55xMXLpHUP5bnfXqxI11JVxtzpuZq71
 ZAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Authority-Analysis: v=2.4 cv=TpLrRTXh c=1 sm=1 tr=0 ts=6985bad0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=SGYt_DqNckTIVf0CK1AA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NiBTYWx0ZWRfXyEdSAyxyn//q
 yG1s/FpkSVOSjmhF4zu29nVhmvLZWOGMd6IUTlGgInQKg0CJs/niDVJKR4ZdRWsNPvBO0TpeVT7
 l658ePt1HAWjGmosJxxrFUzNiB5wKlMksZ1KllIrftE1oiYc/WgCuTs53q+8xVbCktjGrrgwYp5
 GUae/flA4z1G4VlVrrHv8uaf9O/12YBIDPf/wBV392T/Rlrebhit2iVZuiN9A2jqnEHRWxBCDsJ
 3NmH8jfNQX6leLkYeSauBxilLOxSvTBr4P7JEqAgqZWos4Tke7rjx8aMelKul2x9ZxPCh2qDNvZ
 DeVfDPBpHew6bpizlK1GmHX4r/0wqf7KLwWlEBSIeQcEbExfc+zY7sKDgw2tyWcYgLu+iazOfpq
 gfnhH9T+QsWROKkPN3Jlpf5awY/C+1FcbyWzShHhD08C/NwvxO22nIjrS8UUkjFFr7drRix4X0K
 UOu48izDJ1epoaaAJ4Q==
X-Proofpoint-GUID: L8Oi0LpbWnTcm2bqG6c8VFFzyueeYsDA
X-Proofpoint-ORIG-GUID: L8Oi0LpbWnTcm2bqG6c8VFFzyueeYsDA
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
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 60694FC525
X-Rspamd-Action: no action

There are currently two different combinations of format specifiers used to
print a struct pvr_gpu_id, one using %i and one using %d. Both of these
are technically incorrect since the components are stored as u16.

Introduce macros to simplify and correct the formatting of these values:
 - PVR_GPU_ID_FMT: A pre-constructed format string fragment, in the style
   of PRIu32.
 - PVR_GPU_ID_FMT_ARGS(): Accepts a &struct pvr_gpu_id and expands the
   fields into appropriate format arguments to be used with PVR_GPU_ID_FMT.
 - PVR_GPU_ID_FMT_ARGS_PACKED(): Accepts a packed GPUID as a u64 and
   extracts the components directly into appropriate format arguments to
   be used with PVR_GPU_ID_FMT.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c |  4 ++--
 drivers/gpu/drm/imagination/pvr_device.h |  6 ++++++
 drivers/gpu/drm/imagination/pvr_fw.c     | 12 +++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index f58bb66a6327..e032ebe1e505 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -362,8 +362,8 @@ pvr_build_firmware_filename(struct pvr_device *pvr_dev, const char *base,
 {
 	struct pvr_gpu_id *gpu_id = &pvr_dev->gpu_id;
 
-	return kasprintf(GFP_KERNEL, "%s_%d.%d.%d.%d_v%d.fw", base, gpu_id->b,
-			 gpu_id->v, gpu_id->n, gpu_id->c, major);
+	return kasprintf(GFP_KERNEL, "%s_" PVR_GPU_ID_FMT "_v%d.fw", base,
+			 PVR_GPU_ID_FMT_ARGS(gpu_id), major);
 }
 
 static void
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 58f0eae05ad9..4213eb8dd7cd 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -53,6 +53,12 @@ struct pvr_gpu_id {
 	u16 b, v, n, c;
 };
 
+#define PVR_GPU_ID_FMT "%u.%u.%u.%u"
+#define PVR_GPU_ID_FMT_ARGS(gpu_id) (gpu_id)->b, (gpu_id)->v, (gpu_id)->n, (gpu_id)->c
+#define PVR_GPU_ID_FMT_ARGS_PACKED(gpu_id) \
+	(u32)FIELD_GET(DRM_PVR_BVNC_B, gpu_id), (u32)FIELD_GET(DRM_PVR_BVNC_V, gpu_id), \
+	(u32)FIELD_GET(DRM_PVR_BVNC_N, gpu_id), (u32)FIELD_GET(DRM_PVR_BVNC_C, gpu_id)
+
 /**
  * struct pvr_fw_version - Firmware version information
  * @major: Major version number.
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 779a58fe6ee8..b258c5a4f433 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -125,13 +125,11 @@ pvr_fw_validate(struct pvr_device *pvr_dev)
 		return -EINVAL;
 	}
 
-	if (pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id) != header->bvnc) {
-		struct pvr_gpu_id fw_gpu_id;
-
-		packed_bvnc_to_pvr_gpu_id(header->bvnc, &fw_gpu_id);
-		drm_err(drm_dev, "FW built for incorrect GPU ID %i.%i.%i.%i (expected %i.%i.%i.%i)\n",
-			fw_gpu_id.b, fw_gpu_id.v, fw_gpu_id.n, fw_gpu_id.c,
-			pvr_dev->gpu_id.b, pvr_dev->gpu_id.v, pvr_dev->gpu_id.n, pvr_dev->gpu_id.c);
+	u64 device_gpu_id_packed = pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id);
+	if (device_gpu_id_packed != header->bvnc) {
+		drm_err(drm_dev, "FW built for incorrect GPU ID " PVR_GPU_ID_FMT " (expected " PVR_GPU_ID_FMT ")\n",
+			PVR_GPU_ID_FMT_ARGS_PACKED(header->bvnc),
+			PVR_GPU_ID_FMT_ARGS_PACKED(device_gpu_id_packed));
 		return -EINVAL;
 	}
 

-- 
2.52.0

