Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C413AAFA4B2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0BD10E280;
	Sun,  6 Jul 2025 11:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcHFTlJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAFA10E280
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:01:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669cb2D023337
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=iBkeT8jgV8DDHWz2j7uQm7
 EkBsDsU0+qy3wFBTJJlVw=; b=CcHFTlJ2hVn1ZdHJrE633A5X6LJbJI4amfya/c
 d1En8TNq0DyqNAp/PoED0viNHBbKVCvUiXyF5R2TL0FkhdkgS3Wwpc3KxTiZWubg
 qFIyZb2TwXUgduwRQ/fDWrxkwlC5GjfSNgSRCyLtJStSbFyq0XqvTgKJPHfUx00x
 efHUxpInjFyCbN+1qefNzY+2Z201fKLJv0hU+Zdl7SjRdt1LpYqfNWkEFkW2cmkY
 NLUvNklYaAwRnspLT0rCJR0urroe0UOIrfOUuMpc01cDNEaT3bnyxLhAEgMRlOEp
 BmexJKfqgZJsDQBb2/SRDSHxEKX0mll0whMSou271AtBE5Nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv973g78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:01:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d399070cecso400209385a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799666; x=1752404466;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBkeT8jgV8DDHWz2j7uQm7EkBsDsU0+qy3wFBTJJlVw=;
 b=LJKvpf2H/634qLUuuCLj2EMXDN86CQeIpNC23pydzNMIJPq/H/PuJFmhTKkmgONUB4
 zJNt+dg4PeOwqgSu03+0Gr7+UJ7uC5f/cFZ2hjDGKNCi1x88fUxeq9s5sOwd3HX8D/ml
 Eejh5vY+TGimLVH0Xum8pFd9hrRrc8lAvmx3MvomZzRz8bFHaTzsFWqL1BujtAOL0xF2
 KFbOZgYLMwg1zvh4uMRbk4eTYjsF5i7i0FQ0Il/A8FgOwxEDuAfQXqxeMtXtkDsSwMAK
 ueCeckdw3nrLE4j63oGY/Vg+6GT2PlTzgY/TMZmBObDYZc397HO9ZLrTYn5oEY3iCbxe
 OC6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu7OKBtJNmjEE6aIqjOfNbSYozEwJ7WXr42FmAJxFLw4NKLV3Jy092yQRUbkUimBl5nZrqojxgYk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx96ZqyxcXdksURy4YK9ellbk0kmdkTC2Oq7wBAhUkAyrhl6jLS
 ETxjwJGe8FL2z76q0Ac4RwQX1LNlGjThKYLUrvtw2Aa0W+047DhJBVLErNm3Rw/s18bq8sYUIDM
 6IAcmjymyhIpj4cM8i8H4/scLmWw3/pVOB9zIduBq28ypWM6et2HqPv5Ycuo9A6fsYAUudxckIE
 zEZbAc1Q==
X-Gm-Gg: ASbGncuhkZkXRx2UMD+8+CBdiWtPGd26uKTTBPiYJ0np/QXaBIikYHtB2gkvNFK9eQP
 TMTwjSQ5FnxNMMe+/RvBGTwPJE11TTUlfcDvwRKkna4pnRNEV4B/l7LFJXRKjF645ZyVgo7V9kK
 wJCOEn5eAG/RLDEPX8iZtw/Q5bM3wjskSENUR3b0iLjOB0i1n/kUEylAU3PZx7sFVP8lvcYucI4
 /uTyNN29DooqfII7GvhG9ss3PtkPXuIANTYy+DrodKkSMscYpPn6t+Ue2CHk5FbINp4HaEs3YSN
 DbQ/B1Qw7zuBqwqMR+RKZO8w5PZEdpnz53UQGiyJlGjs/sBAaTPwx2WfrYQdfWJIPZufa8jfnOn
 1zP8Dv9K6ESK6BafkdCAHs6kWSzib63LYqVI=
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id
 af79cd13be357-7d5df14bb09mr1044683185a.41.1751799666289; 
 Sun, 06 Jul 2025 04:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gImjD2nsMnKReqqrIWQr2EGvWEGZNMfKWWv1Nw71shiwoTzApW5p2PGgEryZvEgvDr6gSQ==
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id
 af79cd13be357-7d5df14bb09mr1044677285a.41.1751799665710; 
 Sun, 06 Jul 2025 04:01:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c5217sm919138e87.229.2025.07.06.04.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:01:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 14:01:03 +0300
Subject: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG5XamgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3dKk8mTdvHwIbZxsamloaWRunGpgrATUUlCUmpZZATYuOra2FgD
 cZVdAXgAAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Oyxx5vC4JJMIeKLgfiqO0VgbZzJrI+W4ASpsNXhvHDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaldwGJtJi/2g3gwU7E39wmCa7dctEke23ckhY
 j0jw0CQ0w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpXcAAKCRCLPIo+Aiko
 1SdKB/0fDLUAWxjOoVOqFGJSDDaDSWQnR+ljIRvQihrg5mT+csnQcQXRooXVO5N6rwJKAj7gEZO
 W4EWv36XjveZrnkPtQE1o+MEBLZr2F50RE6wEUZ/9uK37xxft0v6ixn9pooxiKTCh+JYRfaH7+i
 6MQ/ysLTgab6KR3Qc5shfVNjgKty3UmE3jLMQpEWjgeNwO26QJvNcxCklWGH4vJ/0ln1Bms70tt
 t/2DRNfdWHFXC3tKYHsIZULrZw7L2i7B/1vQArrnW1y5OpoW0LkrTTnqn4i1p4/jcw0A7U9n/qC
 EpiHXAdBa1fvquFGbF1dKvs+tLWk9XGNL5eKgp11OsPz6aHc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a5774 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2OCBTYWx0ZWRfX8W5ZHlg2p+zN
 XjNYkpFpeGvnZaMvgPm8WlN5pUJIRyJCtSe5nY7Z+fi+eNi1c7ep3jGoGLeEa36+TfgbeC87dr7
 GNgbVzL5yVsu7dAbrF3yVABsz5kYNiUTGONd2gFyW+pDsukfOv7X2HsQFiPEULUGXIdg2jc1b1i
 lhwepwB3OIIl+3oSbrvWTjZHz1YYjnd7fv4To3BLohYRtMwrjbsqLDPqhdBnSWqpGiCydjCdMES
 lpKve+Gm9FphBzqLkYUqQTA75Nq0BeZvVhGye6ktIPcfI4WIksoag+mXfiyJBjWzRItIfh+4Gn3
 nO6hOYcCdIyp+Rud2zB1fnU6xRAw29qGtsWRlNraNjez9RMP/3BUjTLm2/VKUnUk2iJTXBJoAJa
 jKL69LkpZvalxrpVqfoiZ7y8fyCg94f6So0ghkWF8MoY3wx40uVtaf7n9+1C4MAPaPu3ule3
X-Proofpoint-GUID: 0G-3uAoUR1dA4pVl6WRKNWzObXDwjfgq
X-Proofpoint-ORIG-GUID: 0G-3uAoUR1dA4pVl6WRKNWzObXDwjfgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060068
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
 drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
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
@@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
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
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry

