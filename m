Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE3B0F3E0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFACC10E174;
	Wed, 23 Jul 2025 13:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbU9twkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC38F10E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9LF3k007868
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=tWG9Dumj/u2sl28Vz4MuVl
 d5C6QI9r+ImLKTNYl6w7s=; b=BbU9twkPFMHVO/SFlrrP3+Ksf/2+0K8h5zZ3BH
 s3iws3Tl8SCPAp/+Y4amI53WANmwyx2vmC+QA4S+ObxDiU03FvjQv8rvvX9qP87c
 0NIUpyYr7VWk32olhsRNnYJnKHe6mQL3UVUhJ0q8LHISEHynmIdH9wMhPeyMZJ90
 gOQyAPkRIR4z8jwYZTyOYJ7XLNJRqmn95PExRiANjCBsYmE+J8v3KzQPajWT9ZeT
 MEgXG4cqipvvRWvAg0iKukmgGkZ+ADUSXXEg/5WvW095c3idUU6tghwvZpZlN5W1
 C+KbHQp+GTfmNr5wpAzY0yd/0GOevyiIhvA/awRunHiTN5uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qd8fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so122125796d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277021; x=1753881821;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWG9Dumj/u2sl28Vz4MuVld5C6QI9r+ImLKTNYl6w7s=;
 b=eXsgF4zTJ/zjzhhk1P0MEA+Dil6MAxbIjIB72Q0+/dEHAlbPqp33ohFdqtNwPLRn1j
 xT1JPXCILkx8mbh/BoMIEn/nPYEfi3wO+sBH0+lOTzIhWWEwpjYW3DBwU9kePCL1Huan
 hTHOKez2c95SADsIJ3N91AvWZ8vwaYXbW7ehcdTYIFmChC71htqLTpZyIFkY+bNR7xJD
 x6bgWrcwPT423KPjPHq9a5Bm2PFo/+g3voM6ayHRtEsnd7g9psjhnFKc04DAH+XgfHCH
 iMuiBLABT0K60j5VYu1s8Ho12652IekW+Nkyk2km9089NdJC7glvRlQdiL7xKDtFztWN
 NlyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0qmU1UhBFsX+8fd5UOdsvkquz/AKUSouKDvW+4k4n6oW3ZWjAyFQLH4Lt924pIbgyMqQgLb/1bKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0mCAh6anqXemfKpHUyV2gXoJfulmD8SfwR4XbcvfHWnh7QhBi
 myV9dh/iIr3dRo796WAaL4LUjqqIlbPIvDB7r+faORDEPbyV0/YtSntgUCWHLVSLZ5wPrbXUoiA
 dchliTjMVS06j7+wx4wNbihUBHZMIRu/VDr4nP5F6+fy0MnPsPkfCDyNPyTLNj+M7QoQjPjk=
X-Gm-Gg: ASbGncu20cFDIOzNsFsvGGKiwXu9pgQRZMFbXYdgcvyFJHg3AQ4+HX8KUyzY3Fdod7k
 eMTJ/pHErUPUgwFXCJwlp7EsOBDc63v1aOFONw6CPPm4DrW680PY1yqCiJV3sljsYBLFmmcPwkd
 PFYISHMZtv8ElT2a5QtnB2KrMwiotN7lvGCHrdoneBLk+4tLRi47CJxUytOwyxzEh6ISN7js3cx
 9OTE8civ4v+1EVXZVaO5DYgunqgih2wsd/5iizFH+FluItO0mX81mH3mcEDmRR70sBJzXHkNHYO
 0MbLkxCXNc4aGvtP6MCgXKLIGz+nV0KL6nvpr9piV/sn1Ad9+zHjuzGnBD+K4nnjvsg/l+jhPUZ
 r6QU04GYPoASyEINZGgmxZ2JR31jTmRG03iKAlWo2F0UoADMpICAs
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id
 6a1803df08f44-70709b0ea25mr11477716d6.25.1753277021127; 
 Wed, 23 Jul 2025 06:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9onlt4Azln72h1nDQG0ZF4ChtAfnqCYnLW93SKDW+UJYzjfRVMDoSUYaJ5uhPs4CUJcl8FQ==
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id
 6a1803df08f44-70709b0ea25mr11477336d6.25.1753277020608; 
 Wed, 23 Jul 2025 06:23:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4ee536ccsm387931e87.179.2025.07.23.06.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:23:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:23:37 +0300
Subject: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjigGgC/3WMyw6CMBREf4XctSV9WEld+R+GRS0XaSIUe6VqS
 P/dims3MzmTzFmBMHokOFYrREyefJgKyF0FbrDTFZnvCoPkUvOGH9hyeTo2hV8rp40wslHIFZT
 LHLH3r013bgsPnh4hvjd7Et/1jygJJhgqo7W0lu+7/hSI6vtiby6MY10C2pzzB6AKU5CvAAAA
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=anIv7UBD8VLP4vJM5h2MZC00iJTIhwQ67w6K2o8NnI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOJaxaCr/gcCZWyHuVgzn/MgGo//mAlSYqc6X
 HFfMWJc15SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDiWgAKCRCLPIo+Aiko
 1ceJB/4xh1Vu3lQYPxaXIi48J72Xok30pM63ksfuWfGthvySMgGbAcQYPIUvf9S00BGBXPRHJX2
 pOPZ7+tKVnnlJjTCrbJ+QGijPcp+Y1hdN+h6QIO9sZi1X0BqSF6aoAWPz+vphJN/1floLXmFqM3
 zc2by4aBVCZgzQBrX5LpKRtjfUfQryJJdhQ24lLnWtxSC07olg+nrTGowKG2ohKQSk8cFeJf2/z
 Zca+1Tld0AjzbA3HsP6T9BQQA9BQy9QgQU2cGcCJkLPLqP2nrJdelJ49C4mjO6aDp1cqKs046jt
 pUteGkrTOb1KQoncaPackjaFXSxAq27VYTVi1foDgRiC2K5h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfX3D/fitXnObSM
 sL8VbOudUARC7QXXQbOGFhrZP9+B1+x3PFrbSXRQvpe+gGJK9BCxs1y1lwQEuE/I4c9YTWIq0mN
 ArrDrRjO+X3pkRzf20rxHtq1a3ok7XV89D14PMHjxZ4KTWMfxx8YEbYwuIZ/MzVz0/aTmrzB7ht
 KdCBALlwMevQNGhSkBz9q5c2xex8y+JO5Yw7v5nm8Dcft4oRRnzabtHyEzvKxczcpRLWqGRTOaC
 iVNOrutmRI/yYFQURf16XsoyY0pHH2Q5OvBcFIArfEPOTz7co51oQL4yIEnNGZLljDIjvGbqNa7
 H7y4jfo8q4XX2Zrr4D5OxD+Ax2v+MRASP7xpFtyrufD+cLeQjeUfr+B0uxcQiybbfREoccli8FS
 GvUaauyJ+IeNUakVNXIpxuxA5dBnyeOZNYRQZtbBk0i+aQ7QEqlktIMj5kYisa6023nmh4YZ
X-Proofpoint-ORIG-GUID: Y5bZ9u9jJM9SLGqN7tBg0AUU74oiXPbe
X-Proofpoint-GUID: Y5bZ9u9jJM9SLGqN7tBg0AUU74oiXPbe
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880e25e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230115
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
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

