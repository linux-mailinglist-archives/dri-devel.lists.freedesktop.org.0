Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD405B033D5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7210E1C4;
	Mon, 14 Jul 2025 00:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiBFiTjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09DE10E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLCWbv028873
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=FiBFiTjoRgGWwliv
 A6NRpzvOrEY2F2d1GiOU+gG2D98jldeZyZNBG22V6PrZlHFWpEl/xLQCPSRcULzO
 q0cJQxFLngWl3AwSZMCPnGNa/dyB2lt71XzCbGo/Kk4XG7jH/bHUFmn6ikqJBcsV
 y9j/g6P1dkTPEDY0Uxig5mgd2UjorcNhxy+w+Yz+A92pb4IKFcmPc4b4dVhAPcMa
 RhCmpNIj3t7qJm2/gAZtqZhyogUUhXXtStWx7Ay9TJSE5KaK/JLz5eVVIm9t0LVk
 NrqkvD/GYdR1qL/7LBW+gUho6lXnuv4YVKTAqx4lBs6xgtFsV+iAGI2eUnhFg7S9
 FKvmGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmtsqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2c37558eccso3248154a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454226; x=1753059026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
 b=CISzgxoH6HbYRaXCvzDDCPDc6gIJnXvLFMan1obd7Sww5GXIj3H9I/2UbCtZLCn5c/
 1TebTpZd/nXxabX6fYCZnO6qbeC0WC7LhwwprHS3Z44qYqhHyUx1buOlitNMVQcbSeZw
 rSjGtOE7P1unnGMh2Yx5nIgaB4nLVeFN1nRYPaoiF1tifXgh4fqHxR5GEZ3LuiJXDVn8
 uCrCGvlST5DYJQ3uJm+DbHrXtZn/o7ViJNhbzOgbrLSWpL4S0BCpZ9TuDLzlYZmX3o/5
 jIMhq3uNte8/IlfR10zWgkY2qgUWL00aTFna/TQqyZXn+GP3GXJsTX6+qmcutp12PQeH
 mIeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdmoMavmkPIhed7WZQVnYpOVGw2EfhkqTijc20y5a7L4lc5cihVm7RKWlZ3fD/hEVAtj5yfio+yBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJncNqQ9p3NTiXFVhcDYce84YBztRQWsTmV6rSS6xlr4mjhBGs
 cEjgD0jkQvGgYX/lts4+NgRBk60vm6vgk1paUQyChR8rrZcbTth5M68slqsrCOn4wa5aCZieFOw
 RdvogZcsO9lCfLXJYcb5orafNA19FrHOES67pxOVUekJZF8nJwJenDBsa56zHSorxGypYNg==
X-Gm-Gg: ASbGncv29xBF8d1nLXhFcvV7c/urxp2pCW2L+y7yzZYV0ZTZ4zkXWU+k8A1nkuJ5yUd
 WpXkbXG54TqJaXVzK2qKPVQ5EXQLy+SnHa6YqZWw8UjbtKYc34teodf9VQHvRtCKMxE3krbt0hs
 fXBdKixHZ/lXGhVJc+Ol+ugQmQnlwp6bCBvg7dZvKbUqniDU9ySEpwWuWnD3n21ns8en86jxwac
 l3xohHkMx9QwGAsxmIMxGMw0LkTaNGK4RlpiDOR9/BCSsZouO3myP4mH3GZxMmtVx7Dv5x/40CT
 tjGJY1m/VCIxxyXuxDXVMyQrbGtkGXI7PCADkigUWlkq6weB+DuIkRhLJ2it5Aq6riWhyOY8YY1
 /9w1beTgA9BNMo4rDD0/IG94=
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id
 d9443c01a7336-23dede4f2b0mr147211545ad.22.1752454226427; 
 Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSKkQ1vcVqMqiNeyFPoUR8IIMJMh4dpPpOY24o/EK6hmUwpEmfMEVSQBsWp82yDp7UsudZ3w==
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id
 d9443c01a7336-23dede4f2b0mr147211335ad.22.1752454226033; 
 Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:17 -0700
Subject: [PATCH v6 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-5-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: W_r_dxRsdvL2L7oZe5y9MDcJ2npmxd8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfXwjOJ2e4Q+J5S
 9SkP53rZU8L5F6WoLfcfUSa0uYFE86ZHVapsQY2Te9hBfz8Tq/dLGeQdHWnEcbsgK6ontNNaMaf
 8ceCFEInHlIiMAv8OYpDQn/+UF2MVFOCd0IgX9otpfIcvJEU4Q/xHlpYfiC1XUgXIMbqMe6XL57
 HDIoHIrwGExZ1o8I3Slto0eSJ9y8GCT05JN18F4iAFVa0TLvUYNZK0tcvxa1jQFQjN0WOxSjqdR
 C8hED+a2rUTyCyDETGUEJ8YrAAF2wDnYD/3m57d7m8ZBN81KYL8kEBhoJbAstubhhw6p6/PtxKF
 De0e2xKWvf3fiJd24VQNqu+oGt9fLwXqqM1I5eRLi+rdwSIR4GMYCP2PII+Lp2yELZtENAA0dwD
 gNlWWD+dLO2OONNJBm4Xg5RcQPCepxRUNoexZGEBLJVQmJCtriVDl2zFyUp/nN6YpKJJQcOx
X-Proofpoint-ORIG-GUID: W_r_dxRsdvL2L7oZe5y9MDcJ2npmxd8O
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68745453 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002
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

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

