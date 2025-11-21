Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10332C7A7B3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA9710E046;
	Fri, 21 Nov 2025 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="xTjb5GwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991B510E046
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:21:11 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALDF1od2084765; Fri, 21 Nov 2025 15:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=cUI8x8tlTW4WITKaHukUBnk
 8FgzA/J6Fv3dVVrF41uU=; b=xTjb5GwXOw7McINAuRfz0MxpN7Ix8SDxbEjY6gg
 8RgZrlyyvJL2wYt2eLpPGCkafU3J3Ka4/zYBdsqVJWN9xNXooab1lGFrYCxBa79Z
 UOujM+lq+gQXVn5PXnqkq/aqt+3RvRKqySbyepSYd2GOt0k7a+tTeVV+HzKyItpE
 EBTIP0RJHiKE4qe7IVbPqAzoQQAoWr5sGamOkuitVlUfaYaVvIGgbZYVQhaOf3ab
 g0bCGdHHnyUKjvgoIUjbXzho9mVBGFRLOwZEZX7GD7vdjxZwGpAEVK4cemG7sSQd
 jnQWVuUCiGr9Ii6sni/cdAags/bEaw2OUYhmGJTaYK3Mdvw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4ajemdrfjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Nov 2025 15:20:44 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 21 Nov
 2025 15:20:43 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.140) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 21 Nov 2025 15:20:42 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 21 Nov 2025 15:20:31 +0000
Subject: [PATCH v2] drm/imagination: Document pvr_device.power member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAD6DIGkC/4WNTQ6CMBBGr0Jm7Rim0oKsvIdhAe0As4CSlqCGc
 HcrF3D5Xr6fHSIH4Qh1tkPgTaL4OYG6ZGDHdh4YxSUGlStNlBt0KWQZF//igM5b7OWNXUutdqW
 +daaHVF0CJ33OPpvEo8TVh8/5stHP/hncCAlL4+5VQbbKq+Ih07CyvVo/QXMcxxdlqAVMuQAAA
 A==
X-Change-ID: 20251106-device-power-doc-fix-ba1a5d753b6f
To: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Matt Coster
 <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=3gkJaZCcpu4K3MLaihj2SNKYBcepSHWcP1C63geNMa4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQqNHttiVfhvrvmyaq0B8c1DjWcC2Cr4T/zdN+1fMGKN
 foxs49kd5SyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEpqxi+CsUUZf/Y9un7VK3
 eLs25ng81OiKbWk+nfdh/uc5dj/nNegyMnQGm9qVLKhhe9/grt9RdOOXkWlSea3L2/j+vNcf0/d
 J8QMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.140]
X-Authority-Analysis: v=2.4 cv=Q6LfIo2a c=1 sm=1 tr=0 ts=6920834c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=A05BHC2L4TQA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=r_1tXGB3AAAA:8
 a=_lh_yHDS7RhGSOQShCAA:9 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: pqml80yeW8AJCF_VxZJ62M1tI41xyrdY
X-Proofpoint-ORIG-GUID: pqml80yeW8AJCF_VxZJ62M1tI41xyrdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExMiBTYWx0ZWRfXzTflOlYPbvhY
 LqshQictj4WKo/DV6582vDwtMwaD8B3j3uM8IqUzBq5Y47LCpGJ2oJ1F8fwWZI8HngCI7C3MjK8
 vFaYtJgKA+dpVEnD1ql0uBwRlcWZwxvUQwgtXlzaJWnq1AZMIWpqKbS4aw4PI921XhW8kyz/9by
 5Ds895xh+9eNQvZnTWSlUarAIvTPDlRf2QXANRgaaMZxU/b5VIQavJpNAVIBD0pjWGLKM1V5np8
 0f2DcVnG+roxysH+ncui1H8OHPv6J2kJoP6gwBPPHgYK7ttVLFzDsDekUb1kUMg9Bo1LgIN58Dq
 fmu0JSnjGqEEGmGlGLlxNCOPHxS8ksbWbdbG+y9SNjfAzWtOpq7eoCwvo0KCQYUv1tRyKDRQrym
 //Eic5te8FYHqbTXwjaJxuNHDQfoZg==
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

Automated testing caught this missing doc comment; add something suitable
(and useful).

Fixes: 330e76d31697 ("drm/imagination: Add power domain control")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20251106152448.453b53ad@canb.auug.org.au/
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Based on the build target indicated in the report, I tried (and failed)
to reproduce the reported warning using:

   make W=1 htmldocs

I was, however, able to get the reported warning (and verify that this
patch clears it) using:

   scripts/kernel-doc -none drivers/gpu/drm/imagination/pvr_device.h

Does anyone have any ideas why my invocation of htmldocs didn't seem to
have the same effect? Is it just simply that the relevant doc comment
isn't pulled into any of the rst docs; in which case how did the
linux-next build catch this warning?

Changes in v2:
- Add a proper commit description.
- Link to v1: https://lore.kernel.org/r/20251106-device-power-doc-fix-v1-1-76d9841c8084@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ab8f56ae15df..ec53ff275541 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -146,6 +146,14 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @power: Optional power domain devices.
+	 *
+	 * On platforms with more than one power domain for the GPU, they are
+	 * stored here in @domain_devs, along with links between them in
+	 * @domain_links. The size of @domain_devs is given by @domain_count,
+	 * while the size of @domain_links is (2 * @domain_count) - 1.
+	 */
 	struct pvr_device_power {
 		struct device **domain_devs;
 		struct device_link **domain_links;

---
base-commit: cead55e24cf9e092890cf51c0548eccd7569defa
change-id: 20251106-device-power-doc-fix-ba1a5d753b6f

