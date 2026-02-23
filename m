Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II3MOiKmnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345A17C0B8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25B110E433;
	Mon, 23 Feb 2026 19:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWUZysgp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLE6zmN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9FD10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NDsXew185758
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=; b=mWUZysgpZBnQX/2G
 wuG7JAfjNH9xkMP2RD774Ch7eQXXEEW6DfNmwI/9kicOHEhE19zCZxZmUcBH7R+I
 9/NK0RB+ZeuScc97Z/gXQLpe6J0bI2VTyxZbvCLyjQ0uB+SRcmH5Lub7h/CMjK7E
 Ys43tdgyPA0x89FJOtZJr2VQNIjcj0s6jBlNrfRtlxnzVtfc0lglwOQA8uFgggJF
 4XFg/0kBYW52B3t/sjYGv1wnZZnX5wgZUQrkUerqMNNTknAyy0Nr1/qJwo0/uIpi
 N7/lr9IgLGiqdxcPUqkWSaNUCc/qA4KwA/wuZqAUgB2s0yaz/HQehzulI6Y8jxld
 +g+sgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69h14j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:10:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2aad5fc5b2fso39181005ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873822; x=1772478622;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=;
 b=GLE6zmN3Z4tvagnzMZtkEyVqy45nzX4z9GYpjms3zlINfwVQQRPKroYq0IjN4Bua+F
 h5UljC6WZ4YL04YcEIGhWHgbWPoWL2tPg7XxJPtccKwk28NVlEVq1BmlZ/NluJjM+wrN
 TeLsIhCNzP01boojmDV1wVZJDRD/Q/M0o1Tj+0p80Tj40njQ/67QbN0GmaSkZjaXlf0F
 plxgmHi2j07NkdT1PKVICjVDFg9ca43AOawgA73/kddjkh83/bq+jUxqNhrwuyr7XOks
 pJfPOlspgHPPuAScDYb6k9SID186jmtLM3847yCOHOQ3ytHUfrC3Dz6CQgWGms8qAk7/
 5L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873822; x=1772478622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=;
 b=piB09Yf9EBhQHa+KnlnFYoEbkFNTh4/VKhBfHLtCsC0HnjbiwKXUjuL4TCGVhi+P0e
 bQOna0unphE5F4Lqd5AcYEJkLWh+CC73ZK9T1iheoShcrrPznEKAxfWUWrFJXDCcgarW
 2E8GGkVh0kJpapUkWSV06IxiBVWcwBwdB6jVhyqgQ3NMIqCoQ4JYqUU7UglG9XA8gSwI
 7N6hyMeOcJcXfO3KqjRp2Dr/i80CqEEc0+FHKUeVluukQU5R26TmCy4JE2JMoqVpMoxj
 +rcmi9e+3G8EQSe2ughww5K9rzcBLxF/Kkv5G6S5vpLJKvpRjLmVHqqRVhMwcQYwKdEi
 sPUA==
X-Gm-Message-State: AOJu0Yzd2UhGDFOagEWgzG0YImmD7JK46WJu2oUhMccNmrkbUPpM7KSR
 3KigbwvrDU7b1t4txjeRa4vpZTEixm0k64k3sFmfAahWBLYu2GdU7A7fgWXXlbH4I40l8Uy+fcI
 xCgcmOSsQRkRcTc89dekN4kc4YgqvuXbgaOcnALAoeeBJ5M0V6n99C+oL86WbHnkJtHjcJPk=
X-Gm-Gg: ATEYQzwy+hiVOHUG/BO5FyXo1LiiqQ7aUK2IOosCBUDZ7de2q7/raQOZLQOVRicAG48
 PhvWydxQt6DZEer4bqov6fmxnkIkZWRgT20f6U0ILcCEk2mwovKQvyactEW6OGJPCuqryhl9K+N
 EWycAU86ndXhVkmqqFoNmWzv4I4NcvjOjrj+rqGlpUCgLG2rpoZgKs2X2mndWjoJo86BKf2QK0L
 IyHPmqdYelh+PrJAL4e5lny/TuG1KBCrCl0dq12FoLx3fSW+t4luY0gASU4AFWfejmeZZ1LEFr1
 GCG+K/EG8RIRjEFc2f/oIKQDIGuYVqE6nJycBLH6iZOHCkJvahxjgKk3ViEX8OocN9AvXBEqt5q
 RDynwT0g8exxwJq2XWQxDMZJuDvQUG6aP6w1ZSU1zXk5KIgYimP1uEA==
X-Received: by 2002:a17:903:246:b0:2a2:d2e7:1601 with SMTP id
 d9443c01a7336-2ad74541768mr90428455ad.48.1771873822021; 
 Mon, 23 Feb 2026 11:10:22 -0800 (PST)
X-Received: by 2002:a17:903:246:b0:2a2:d2e7:1601 with SMTP id
 d9443c01a7336-2ad74541768mr90428265ad.48.1771873821476; 
 Mon, 23 Feb 2026 11:10:21 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:10:20 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:02 +0530
Subject: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6299;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=6EHrB7O8xO1KO3JeXaSJmhEvz4UF48aY+wHefteIn5o=;
 b=PQoJ0WQ74WdOsWKY6SUsnfL5qbidltdPL4pFBld3IPPhdFunIRAZUD0aVWSiqeKX4Q+C1O8us
 HJ7xauW+RB+CD3tKcCU67VQ4JDbx2VlgLnYZovthqbqOs1Z9EiYO/B8
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699ca61e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eDbiE4MX-y_Gg5q49BQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Xy3aFk8dV89HvPghR-njTtiCKWewvT2q
X-Proofpoint-GUID: Xy3aFk8dV89HvPghR-njTtiCKWewvT2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX0eY0N+1u6cVF
 L3whmAyxfKek4LsOVDOAwiAZZPv1/HD0kapBoV3JXDCwfv+D1cVTOg7zkrI87yTlsjF+IeG/ybf
 W00fXRo+IZ9sOKdbF7NSJvrhl9WFgIqzm4X9dS9CThroDOcrToiEcfvCXZx17F5nsdvskhxD4bo
 yB9JCHqZCOa50DxeOZEhKPASNbXPDbJKLWY7IjCdjWB8fPUgs4yz+fsBeF0Z+It+orW8kcRhmLr
 P5JW9Bi6fivJcl160NH/CL05a9PUhXkqOlEQTuP0D1u/iajRw0ONMD8WjT5YEYuJYeVYlzavMXa
 2x8DzSKP2IaQu6UIox8UaMO7mH9Bue4vPD20WzgaPV5oRoZg+GtfaPWgLrOu5M5uA5M1hnGT2h9
 efrcLkX7U6PUJewRTAVPwMUVaC7C8EJ+fLCSqIHEvgrcLX5fpqIyZ75JPYZuXD2KcP/LnhYTxjU
 sOcmeSPDEHRBItFyW3A==
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
X-Rspamd-Queue-Id: 8345A17C0B8
X-Rspamd-Action: no action

Introduce per-file and per-user context for the QDA DRM accelerator
driver. A new qda_file_priv structure is stored in file->driver_priv
for each open file descriptor, and a qda_user object is allocated per
client with a unique client_id generated from an atomic counter in
qda_dev.

The DRM driver now provides qda_open() and qda_postclose() callbacks.
qda_open() resolves the qda_dev from the drm_device, allocates the
qda_file_priv and qda_user structures, and attaches them to the DRM
file. qda_postclose() tears down the per-file context and frees the
qda_user object when the file is closed.

This prepares the QDA driver to track per-process state for future
features such as per-client memory mappings, job submission contexts,
and access control over DSP compute resources.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h |  30 ++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index a9113ec78fa2..bf95fc782cf8 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -12,11 +12,127 @@
 #include "qda_drv.h"
 #include "qda_rpmsg.h"
 
+static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
+{
+	if (!dev)
+		return NULL;
+
+	return (struct qda_drm_priv *)dev->dev_private;
+}
+
+static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
+{
+	struct qda_drm_priv *drm_priv;
+
+	if (!dev) {
+		qda_dbg(NULL, "Invalid drm_device\n");
+		return NULL;
+	}
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv) {
+		qda_dbg(NULL, "No drm_priv in dev_private\n");
+		return NULL;
+	}
+
+	return drm_priv->qdev;
+}
+
+static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
+{
+	struct qda_user *qda_user;
+
+	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
+	if (!qda_user)
+		return NULL;
+
+	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
+	qda_user->qda_dev = qdev;
+
+	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
+	return qda_user;
+}
+
+static void free_qda_user(struct qda_user *qda_user)
+{
+	if (!qda_user)
+		return;
+
+	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
+
+	kfree(qda_user);
+}
+
+static int qda_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_user *qda_user;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_dev *qdev;
+
+	if (!file) {
+		qda_dbg(NULL, "Invalid file pointer\n");
+		return -EINVAL;
+	}
+
+	qdev = get_qdev_from_drm_device(dev);
+	if (!qdev) {
+		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
+		return -EINVAL;
+	}
+
+	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
+	if (!qda_file_priv)
+		return -ENOMEM;
+
+	qda_file_priv->pid = current->pid;
+
+	qda_user = alloc_qda_user(qdev);
+	if (!qda_user) {
+		qda_dbg(qdev, "Failed to allocate qda_user\n");
+		kfree(qda_file_priv);
+		return -ENOMEM;
+	}
+
+	file->driver_priv = qda_file_priv;
+	qda_file_priv->qda_user = qda_user;
+
+	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
+
+	return 0;
+}
+
+static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_dev *qdev;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_user *qda_user;
+
+	qdev = get_qdev_from_drm_device(dev);
+	if (!qdev || atomic_read(&qdev->removing)) {
+		qda_dbg(NULL, "Device unavailable or removing\n");
+		return;
+	}
+
+	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
+	if (qda_file_priv) {
+		qda_user = qda_file_priv->qda_user;
+		if (qda_user)
+			free_qda_user(qda_user);
+
+		kfree(qda_file_priv);
+		file->driver_priv = NULL;
+	}
+
+	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
+}
+
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
+	.open			= qda_open,
+	.postclose		= qda_postclose,
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
 
 	mutex_init(&qdev->lock);
 	atomic_set(&qdev->removing, 0);
+	atomic_set(&qdev->client_id_counter, 0);
 }
 
 static int init_memory_manager(struct qda_dev *qdev)
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2b80401a3741..e0ba37702a86 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
+#include <linux/types.h>
 #include <linux/xarray.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -20,6 +21,33 @@
 /* Driver identification */
 #define DRIVER_NAME "qda"
 
+/**
+ * struct qda_file_priv - Per-process private data for DRM file
+ *
+ * This structure tracks per-process state for each open file descriptor.
+ * It maintains the IOMMU device assignment and links to the legacy qda_user
+ * structure for compatibility with existing code.
+ */
+struct qda_file_priv {
+	/* Process ID for tracking */
+	pid_t pid;
+	/* Pointer to qda_user structure for backward compatibility */
+	struct qda_user *qda_user;
+};
+
+/**
+ * struct qda_user - Per-user context for remote processor interaction
+ *
+ * This structure maintains per-user state for interactions with the
+ * remote processor, including memory mappings and pending operations.
+ */
+struct qda_user {
+	/* Unique client identifier */
+	u32 client_id;
+	/* Back-pointer to device structure */
+	struct qda_dev *qda_dev;
+};
+
 /**
  * struct qda_drm_priv - DRM device private data for QDA device
  *
@@ -52,6 +80,8 @@ struct qda_dev {
 	struct qda_drm_priv *drm_priv;
 	/* Flag indicating device removal in progress */
 	atomic_t removing;
+	/* Atomic counter for generating unique client IDs */
+	atomic_t client_id_counter;
 	/* Name of the DSP (e.g., "cdsp", "adsp") */
 	char dsp_name[16];
 	/* Compute context-bank (CB) child devices */

-- 
2.34.1

