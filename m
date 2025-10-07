Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7CBC2D28
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 00:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2010E707;
	Tue,  7 Oct 2025 22:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJ++I17H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4A810E707
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 22:12:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8o2007126
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 22:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Xg5m10CEppQ0xzXGimFATjslzJR1gZK01TR
 wTSTNwyE=; b=ZJ++I17HsrqyyE3mNJYv9cczfIfkZcZFxzCAk3SlbdAaQnv3ELt
 kXDqWlX6bd/u6VgVpCiv6SsXvc5b+f19Vb4iJ+4uSNokXK9I38coYozW+ySq5cuw
 My82aiVlY2e5Db45eOh7FjMKj3Li6z1eY8SyY873o4ZlLgai6R7wy8Tt6YKCFO7m
 qHnp54D1wezceGp2mCBXbZF2qL9+Pn9Eg1lqfYjUhabS2YzEX8UqSNdvbn+JijTd
 375eqZ8CE7T5sHfmWJ38D7gEfOD/uuIvt1jYHZXXbytqo2j5Fe1x4fV8xYt2i1ot
 ubuu4+OYihZy+hfxgzDwiG6M/4waXHVuoZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7rjmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 22:12:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e1f265b8b5so153524181cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759875134; x=1760479934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xg5m10CEppQ0xzXGimFATjslzJR1gZK01TRwTSTNwyE=;
 b=jTs+ySrqpbcZidbw07bJIu3D+Pm8WYFDR5aM4lA/5/F+C9NVLmZ5jWoXKqDB86NFGI
 FbOsBsqohN0kjrtCAML+j8egA7KjTJZq2yg5/8BEHl9hbiMUpblpxgTQE6XuEGAJ3SWy
 KS/tBtz47rD7+9IEljfmaUWfHr1cmdIQtY5dIgN/cm7SnwTKwHpkyB7YDFwwcKAvZema
 OiG8xMyqGQdetBp6QYB3tkfOnVleYgpzTjwz2fRvBSliVnXlod6dtIbX9IuFBpkHOUHG
 Vup3/5rwaV9+aJxuBMwWkExJ+wM8FyTgEG10KehvLF7CH3wGzmlm4BesdPbAqHaW3UxK
 0HyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRQxxV9NO8TPZ0p0PwRhLQVXKk6PK2WT1TweuLXZdXfN8qUW3dqSMy/eoOy0UFLdFwS3HcO/fVzxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaZb369J/lJznZGaiKnu73YaLIfeOJlFZf0THYfmUAAaE8p0T7
 c1pExnODcMwUiYLWzk+1H4shKkN3w5n5r80wjm4FkZxHeOEhv0qOPJ3ybgLCcpMCz4RPWp/jb+B
 LTTEqRmxgtSXcNURawyAKCGV7wzK6nCJpgj3MV3mZm2ux3+PEP3m66FmV1cRrQKlqmuSXCjM=
X-Gm-Gg: ASbGncsHNaLusr+bZP871nea8QpBMbpoNrRgRG18SQm+GOzVf6Od4TL0CzWCkYz25lx
 hOrJrtuvWW+ev5cTHBqgfLxiDDhd+hmOf8I/XlPbzhK/Qi7mTz5FMm24eGU9jy4Cu31/6YC9XEz
 aDexyOc6gS4GI5IzSsL4jv6O0ajeXd3m2GdvILorbGu99XHTdksYcy/xL1Hq29VlRYfkYHtj98Q
 zzSIPUxDdVk7TnQ1ns0FD9zd129A+Dbrz/gUdAV9uO3rlL0eFHx1HdxQ/3vuY6l2IFgLPRX83uv
 32SsPEDnk7DpDCmb7v3cj01Jr/uybPf7CGVBmDldcHCTiA5Gvm+aGYjV60Z3CYxD1UBAleCV2m1
 YRRGCFkPuKA==
X-Received: by 2002:a05:622a:30a:b0:4b7:a92d:3d99 with SMTP id
 d75a77b69052e-4e6eaccbe4cmr19293451cf.1.1759875133615; 
 Tue, 07 Oct 2025 15:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsW7IJmcCaiKfH0qMCqGiVY2cA1KkP9PYbwomikj5gixk5mB1EP5eChI96s7SbKEPjTn5o/Q==
X-Received: by 2002:a05:622a:30a:b0:4b7:a92d:3d99 with SMTP id
 d75a77b69052e-4e6eaccbe4cmr19293061cf.1.1759875133128; 
 Tue, 07 Oct 2025 15:12:13 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa62csm1451441566b.19.2025.10.07.15.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 15:12:12 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
Date: Wed,  8 Oct 2025 00:12:12 +0200
Message-ID: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX5FuIA3WAnd9q
 XnN0QM35LFkzcKwiCtvZjSi16n4zREPXnvquIXzfutSqOaaDBotuz0EPiTKqeqYi3acvrHCiNtK
 mfhJ5Jvfu58B9iOcz8huitLU/xr+RAeOIIrs5xGvnAPGp7bnV96ukDljZIJmjMRtISc0g+jlbzA
 kia6nj4KBuKGdQgACZClk3DKPuJje6eYV4caPAtspJmfo57wfW8A2ZwzfegozS8Bemy1urajBrJ
 MLGhpQCsTw56MxaQ7tshFnh26DYvcgENkP3VQpxxn4Yd18tr8Gb3sMmrx4fhFYmHrLQf1g1d/N0
 88Xz2sh6FvgwQD8DdjFRrv+rOKR6pGLc567pSftQtCbifLX4DLUI5izoWNaYqFk6yWZm5ng+BCg
 91pt0Jp+OMT/4UQvzlv4HLMhh/mNlg==
X-Proofpoint-ORIG-GUID: 0oV8_VNMD2qNysE4ZF7ye8QpP7eUjubP
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e5903f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NS4B5lQ4yxVAsqoyy1cA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0oV8_VNMD2qNysE4ZF7ye8QpP7eUjubP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

struct qaic_perf_stats is defined to have a DBC specified in the header,
followed by struct qaic_perf_stats_entry instances, each pointing to a BO
that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
not check if the entries belong to the DBC specified in the header.
Therefore, add checks to ensure that each entry in the request is sliced
and belongs to hdr.dbc_id.

Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..bad587b56b1d 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1781,6 +1781,16 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 			goto free_ent;
 		}
 		bo = to_qaic_bo(obj);
+		if (!bo->sliced) {
+			drm_gem_object_put(obj);
+			ret = -EINVAL;
+			goto free_ent;
+		}
+		if (bo->dbc->id != args->hdr.dbc_id) {
+			drm_gem_object_put(obj);
+			ret = -EINVAL;
+			goto free_ent;
+		}
 		/*
 		 * perf stats ioctl is called before wait ioctl is complete then
 		 * the latency information is invalid.
-- 
2.43.0

