Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27AB0F413
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99A10E7CC;
	Wed, 23 Jul 2025 13:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke4SeYrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDDF10E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9OORK016083
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WTQFEIPLe1Tpen98i92mSH
 rOdL5Ab+xN4wlWiokaT5c=; b=Ke4SeYrxSPuS3KhWMpA1fQDAXHQ28aH6A3J2XM
 jC9GLrMYFnTk/tUuAizSb8UUCt70kr3tRk60m9n21xNsRndAArbSe1YfAv63Yr66
 +E9V9hLlI3mrDkbpjOGF37hd4yTiQMIbZu2xM2hGxY/hOPTkSemVUsKffcITZSvS
 Sd/UiLsCTrM3zilRL+WM0eLvNmciZsmcmnLAxNUFCwLJSJa8JX+NKHunuQtak9Dz
 M1kKp7b7YdZMKICEGOuZW1f9QQq6yM2AXqCCAOFLHx0/fbU01rUhCPAsSZ/H+mvB
 0QilctERmpLqkI5t3ZP7P9/sOAO9Pu2X9TtCPOJl0+m3o4NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbmvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e095227f5dso1045233885a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277626; x=1753882426;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTQFEIPLe1Tpen98i92mSHrOdL5Ab+xN4wlWiokaT5c=;
 b=UKNKp7E4QnwbIfJjNwj7SPC7YQn4WYq1hsxpSvagZC8o+hDZlyBeZebz2Wiow6yEk3
 XMlnQUUhdQFFMtNR/RU0CpAQkvkwGeda4skXz4xQNkdoig5iLPI0WL433PVGRdIa8JV4
 80y3KFbWPHIDDYI1jjFhaJwwiIOzKwpq7IJiCug1s/JOJAtW4bYaa9WipwlZ17doapmi
 VK1wcCFSlK2vlntzaIsj1IrrcBlR7UiYmi6DEtgxD2e/u7iNS35Jb/8xxVgeQuQ8M3ZL
 wmJNGE7KqmOlV2Fj4mUCHOUWSQFk6p+AYnlUskrAFuuf57CYEhY5Zs5GJlhW9I6qICks
 o/4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYbfCZkoNT/4zH7xoopk3l/T2K3F0vZxD1BJAZh9NEWJrfEP65tenrC1cpJPmRLSV54FCzLfFLw+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/kUArG1IXtxpnGFANfXEKrMvmL/FzCXIZaaMeCGTgoVVHdGz0
 Hv7rVSs9ttI6UtdWxSLaBz/woaiBuOB6tmfZF4Vg+hWzqGhmhu1CGtGbNwO9Ks+F8DZInuXrCak
 GeWSV2pk0lEooNBvPj19+kqA3W4lNHRQysHOAZp1FDI7a2GQe8teEqToTjnILsN2lK00bOV0=
X-Gm-Gg: ASbGncuOlYjcABVuBbyiKsKJkchkppLDfsutN6v+OryJzTTUye+xyS6hI7FhuvEtz9m
 Juy2NG5k0sJSwY0iD7hwT+RgXUoh+UWYQuv9H0IYKtGgbextPTYU4LzHlWHNGcLbmeFteQ2SRxl
 48RC8q2XWpzpWWVrY7N86b78eiVciygBa1tZoPYoIinZ1DUJtUP3J3r5D9mU9urlxVeu2ZE9Ixe
 alK2J6zEPspd/6FYuIOtjmHdPktMGwSN/5vRbERhcGB2+EGxbLKSe06wXhLDHJdJmQ74d/RnqdP
 uQz0zE6Pu4ACbQM7EC2rNYKFFOaExnKs2mdNle5oJUWthMvB8IFlgE9o0JYZcqCInlxp9bin09F
 iEHiiRzSDSJ85C1Sr8EIW9Zy++Ro6M2LgcWlWzyUaZvmfhhD1h4Rc
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id
 af79cd13be357-7e62a0961b5mr389689585a.7.1753277625778; 
 Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIbu3Pi8x0OiP43SauVb8JeZIBxt/dr12pb52JW+xXRmOZK0s8yrai9klZTjw4uI2IfxS83A==
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id
 af79cd13be357-7e62a0961b5mr389684285a.7.1753277625278; 
 Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c76csm2304535e87.122.2025.07.23.06.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:33:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:33:43 +0300
Subject: [PATCH v3] soc: qcom: ubwc: provide no-UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v3-1-81bdb75685bf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALbkgGgC/3XPSw6CMBAG4KuQri32QVVYeQ/josAgTaSVtlQM4
 e4W2Bijm07+ycyX6YQcWAUOFcmELATllNEx8F2CqlbqG2BVx4wYYYIcyQEP5bPC2myVVyKnOTt
 yIBzFlYeFRo0rd7nG3CrnjX2teqBL9w8UKKYYeC4Ek5JkdXM2zqX9IO+V6bo0PmjxAvswGP8yW
 DROTAAFEFkpxQ9j3o600A/xq367FJXSAV6GlC8SDaPfd9J5sHF+fgPOz8vXIgEAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SBUY/V4xLs/7I4TRnpBK02us0MpTJs5s79N5xrPclI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOS4B8xLRc/tP2mWUM8pLag/D25jq2Lvgx7GI
 NfVsxwYFzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDkuAAKCRCLPIo+Aiko
 1Qw2B/9Px8qUpaP6FZLiIa1oy9vHbRSAdE/D598x7ufikpHqguT389LRl/BhbSAJ/REpVvOaVv/
 TCr69PwL/Cr68jpyQJ0+ryJ0kwnppxg6lUSI/IKbZ6eF2FD+TvD9Uc7KpAMKogSY0JxOUzNpF9b
 esuvlWT7zaErklWT39eNRobaxclJ5RrfG9hSlD/yVfqTgV+ds/+yXyVw4MglBRgmGA2T+SNrcwj
 /SwbJdfRmR7ZHW1IYyLQ+5MvurVxNH+kyp9Rw2VCHbXfuuiFvgNnXTh5oh6Qdjc18EwY4U/uC1U
 IGWJLjAV2MEVZM4NupwE6ot0slIQoxmqnsaH8Y47t8w7nGx0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bF66Qh2I_6JD_QyecsUnG-zz9h0RSu7H
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880e4bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HI9FvKZQ5624IJQzk6MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4RVVIJ1wHS3G
 SNLyD5+TlAj/dWKf77OQfR4LqKZg8vtezR9DsZIiANexWgLbhRkcf3nUluVz25nCK01lihs3pg0
 +WKQ6bBhdYzziCzaVPguLzrPvXQY14G44sAvXnscmgLiDgOWd9grEM8r3+u7tHW1zkNgp7Vj9SX
 OkScWMoq2iN8ZOjZs6XQ9DiDgJBfiR/wUMw1TXe5ZqUoPBfQu/ZQvNN0tIA97+TdggIKMy3SXLo
 b5aiqahS5zPqFFhQHHrW5jhDe7w56x+5apakVq57GdrfNEe3aqrh18w9R7nAV5cG0S2+tBcscLH
 tW3p3zvUIAzBXYAKsjlugF0BVQEKmwYMCFqKIRYtZd0CgKX/O/ToF1JGMNqGUqGiNUq8olbThF+
 5ywKTjsdcz/R3iZEoJ20m4chWD6WxVxtdmcQzGXaRifAPW7LuxiGu0SV611RqEUhD7ldgF8/
X-Proofpoint-ORIG-GUID: bF66Qh2I_6JD_QyecsUnG-zz9h0RSu7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116
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

After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
database") the MDSS driver errors out if UBWC database didn't provide it
with the UBWC configuration. Make UBWC database return zero data for
MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
Changes in v3:
- Just picked up all R-B tags from v1 (forgot those in v2)
- Link to v2: https://lore.kernel.org/r/20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com

Changes in v2:
- Added APQ8026 to the list (Luca Weiss)
- Link to v1: https://lore.kernel.org/r/20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9002fc9373ce349c129889ab58f87cd59591de63 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -12,6 +12,10 @@
 
 #include <linux/soc/qcom/ubwc.h>
 
+static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+	/* no UBWC, no HBB */
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -215,11 +219,18 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
+	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry

