Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN98BiqmnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E217C0C2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D357410E432;
	Mon, 23 Feb 2026 19:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mr0aOAlt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9t4SAbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381310E434
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NDsG42184939
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=; b=mr0aOAltrI4uJ7Y/
 eX9yHYbh93qOBnF0O2Jqi5e+eWUymu4EHSr+IRSR6gTZxrvMqgHZ6o1FClrysAH3
 pMZrf70/KSN/FcBb2TvAafzdorTIV4pVb4LiUtBBsF0Km8bD0I4tL6M7YTD+PGca
 4CNb3QtHn2c06AyXuTJyxX4vRMNwVn7Hxqo3Hio+v8Wbu7rCaEj44wddHPe6RanH
 GrilYYSFJwxyqM62A14LM/3SDVGNbRisSdICQwZWw3r+AMJwc8gQQsG3/33xl13e
 HPu3/IMadAw3RB4Z9G9QTr+krQ0RRdQjJBoCxtyld2upIJwRwgKRcmHlx4IB8xP8
 jzK1Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69h14w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a79164b686so60897625ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873829; x=1772478629;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=;
 b=G9t4SAbZxNEZg/QkzsB+aqQii4DEaVoHvLeRZfHG8lNVAtD2a74H0XkdDqi1L3lg02
 zJehYbX8Xcabm5mWVDUwNrPVYx/Y1Xvg4amQj9dIJbcvK8jgIo1gqwnkGh2qBeR2SWIe
 J3esnPiuTOuK4rKC10dXMG1A7VXIB2UcWy9ezyfZJwrGa2eWgXD3/T1h3Fg9k77KqxVB
 qTg8yYri854vzpGNqiZeP/FkpPrzseDb5SktMjxeCuqUPemPgr9ph6CG2rZcXsBKLd6e
 e/8xHyIFm0r74fIq6M2dvXBH1bm+Xsomg83g4sPq4y40p/oskfeJSnugzK5DudUB4G6y
 nJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873829; x=1772478629;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=;
 b=HJ3vaojTRnNOEARYx1/EPHD63wghVtLOfH7c/hH2lwgsIzGDPP62mSDTbqgNsitbdT
 froHNx+T2mSCFWpzpsCkkYFaetLjOoDmzUE0qB0T5O+5qzzWRZ+QQ5cg/aTT4boDLrUA
 BxPGQfmJGGgJKYtDE1/icvmwYwuZbaz/6zosvS1mZZozwiXU2NzM7uQrL7iRYyIdU0HL
 2qBSgXHirUHn/2wtaQlHT+9P/1xw0siSDMdcrs7rOFonwsQwmXoDmk0Eu97m+a8RYQE9
 7XZ+uMuLOVSh3V3IcIuF/Y5+baOzzv7X0HVqW2jIjSJQfSv/Wkx6dqGlWnJfY0xcYOY8
 Y28Q==
X-Gm-Message-State: AOJu0Yz7rJpMUFU1y9W+lrwlXWk5lzzF3lv7jyzSeeEPmZ1p34xBl3j+
 ZGDbpaBkRKDQfKPLKDaImjz+JkgbB/rrZmydm9VjvcIzySbBaRzuYCEGA30BfCqK5wLr0Pc/i+I
 ra5/b1JhQQJUfd+FeucI16/jnBipkIu/bvAdPsQl/ebfb29xSlB43ieWogEQWks19heiHl3k=
X-Gm-Gg: ATEYQzz36mFxj1yMa08RRy46q/9c5jirxurRKh26Grdodoc1rhI7hXxbkXW+QQ3YJo9
 462ycTN6oGtJD0pQyOl/iKFBAEyxpUjA+WDhCoiRaIAT73ROG7qS8S7ZT8iKcH98Yj5viwHK3zh
 bYkkej9lHvTe3pIDUEs7IKnw0A5CKZjh6NYghQeY/C88dazfqAH7Ns7sGMnYFDt0SVpKYoX4xm9
 jtUk30jYjUg5Ct20/S/mQE+dgSMny9dVGMKMpxZQQytWyAGZpTXjTc8Us8e0AVtbOoT+3bw0Aur
 Yhe2T0JflwDDETWk4ZtUzUWs/5elAsG5Abw3cpWnCnzGwh5KpDlvNc6sKKzIuy221dL2+Tnc5jx
 l7tEB1sqA5MdLfajBnK6CmWBvCvWg5zLslPZx8+jhEqLg2LRvi9Jn/Q==
X-Received: by 2002:a17:903:2f8c:b0:2a9:451b:422 with SMTP id
 d9443c01a7336-2ad74439669mr84594725ad.14.1771873829354; 
 Mon, 23 Feb 2026 11:10:29 -0800 (PST)
X-Received: by 2002:a17:903:2f8c:b0:2a9:451b:422 with SMTP id
 d9443c01a7336-2ad74439669mr84594305ad.14.1771873828808; 
 Mon, 23 Feb 2026 11:10:28 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:10:28 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:03 +0530
Subject: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6604;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=cPe6XiIaqlleCllXAqlYjNWCbV9gcpzWtKPjZ8WPpf8=;
 b=ZymVL6dioZif6Wgr4wJm47EDwZKmJDJvKkln1f30mqSxFcv/WXANZRzJ6HZOt0B38TaPvWsjI
 2zkyvEL7H+3AOLdSQuIn9G6ImRaRh4RXlXJ9NOWvLTJOVVCdBtH+0mj
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699ca626 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xFwpPJ--XgJ2TdNcX9IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0BEaZH53Z6ZFQIN2m3E2Qgbunu4vSxLz
X-Proofpoint-GUID: 0BEaZH53Z6ZFQIN2m3E2Qgbunu4vSxLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX8npqvrG6VFto
 ljlbHpCWUFtb3ekWpi5kY7gns2J/4JMHNmZCJt2K82hvjlouqzwS01eSA9o8/+6l8iBNYzfJ9tQ
 Ie2IEvVf8gyeKJo+XReYqoM68PUzZJOCzo6/STDgsL5xSGQVmJ6IXZMS36pLL0k6gjDi53OMJtO
 PeNMatQCJaoXe78j/xGTifA4arGRw9DyYZcwM2F+ixQWFo6am1i2w5F/YnRkvQSPu0zaBaTEK6L
 8RJWdQbA1lO7ACxwtHDHykvD9beiAklO3w5pmiVhjtCU3U9k2H+pZ3mrANMCNdOHqyhIqoUiN/o
 2u5iNnDNl6FMvgcBralH6SxUQQhblqoMtag2FKZhFSjxsmtggHLrQ19Mvo013QV9NexLDtGfGwE
 FXapN37xsxknDsYQr3ceCLFBPeSbEjy17+P5/Kk2dKWKqQisjvYD9eEnM9v6tPZsSn/7KyOMHtJ
 iz3z3P6FbeNlc4gJuQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
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
X-Rspamd-Queue-Id: B21E217C0C2
X-Rspamd-Action: no action

Introduce a basic UAPI for the QDA accelerator driver along with a
DRM IOCTL handler to query DSP device identity. A new UAPI header
include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
a DSP name string.

On the kernel side, qda_ioctl_query() validates the per-file context,
resolves the qda_dev instance from dev->dev_private, and copies the
DSP name from qdev->dsp_name into the query structure. The new
qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
userspace can call it through the standard DRM command interface.

This IOCTL provides a simple and stable way for userspace to discover
which DSP a given QDA device node represents and serves as the first
building block for a richer QDA UAPI in subsequent patches.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_drv.c   |  9 +++++++++
 drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
 include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 7e96ddc40a24..f547398e1a72 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -10,5 +10,6 @@ qda-y := \
 	qda_rpmsg.o \
 	qda_cb.o \
 	qda_memory_manager.o \
+	qda_ioctl.o \
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index bf95fc782cf8..86758a9cd982 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -9,7 +9,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/qda_accel.h>
+
 #include "qda_drv.h"
+#include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
 static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
@@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
+static const struct drm_ioctl_desc qda_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+};
+
 static struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
 	.open			= qda_open,
 	.postclose		= qda_postclose,
+	.ioctls = qda_ioctls,
+	.num_ioctls = ARRAY_SIZE(qda_ioctls),
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
new file mode 100644
index 000000000000..9fa73ec2dfce
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_ioctl.h>
+#include <drm/drm_gem.h>
+#include <drm/qda_accel.h>
+#include "qda_drv.h"
+#include "qda_ioctl.h"
+
+static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
+					struct qda_dev **qdev, struct qda_user **qda_user)
+{
+	struct qda_drm_priv *drm_priv = dev->dev_private;
+	struct qda_file_priv *qda_file_priv;
+
+	if (!drm_priv)
+		return -EINVAL;
+
+	*qdev = drm_priv->qdev;
+	if (!*qdev)
+		return -EINVAL;
+
+	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	if (!qda_file_priv || !qda_file_priv->qda_user)
+		return -EINVAL;
+
+	*qda_user = qda_file_priv->qda_user;
+
+	return 0;
+}
+
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qda_dev *qdev;
+	struct qda_user *qda_user;
+	struct drm_qda_query *args = data;
+	int ret;
+
+	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
+	if (ret)
+		return ret;
+
+	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
+
+	return 0;
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
new file mode 100644
index 000000000000..6bf3bcd28c0e
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QDA_IOCTL_H
+#define _QDA_IOCTL_H
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <drm/drm_ioctl.h>
+#include "qda_drv.h"
+
+/**
+ * qda_ioctl_query - Query DSP device information and capabilities
+ * @dev: DRM device structure
+ * @data: User-space data containing query parameters and results
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler queries information about the DSP device.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+#endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
new file mode 100644
index 000000000000..0aad791c4832
--- /dev/null
+++ b/include/uapi/drm/qda_accel.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_ACCEL_H__
+#define __QDA_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * QDA IOCTL command numbers
+ *
+ * These define the command numbers for QDA-specific IOCTLs.
+ * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
+ */
+#define DRM_QDA_QUERY	0x00
+/*
+ * QDA IOCTL definitions
+ *
+ * These macros define the actual IOCTL numbers used by userspace applications.
+ * They combine the command numbers with DRM_COMMAND_BASE and specify the
+ * data structure and direction (read/write) for each IOCTL.
+ */
+#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
+
+/**
+ * struct drm_qda_query - Device information query structure
+ * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
+ *
+ * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
+ * allowing userspace to identify which DSP a device node represents. The
+ * kernel provides the DSP name directly as a null-terminated string.
+ */
+struct drm_qda_query {
+	__u8 dsp_name[16];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __QDA_ACCEL_H__ */

-- 
2.34.1

