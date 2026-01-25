Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AILSCuL+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4D803BF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7A10E365;
	Sun, 25 Jan 2026 11:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK7hJNF/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiNWx0g6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5C10E35D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P2pDio3557044
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=; b=IK7hJNF/YSzESpjM
 QCwjiC/Zn3LCw3Wv3gZyLzFtZlAyHAxaJA9WKHdncxmRTWQYeQUH/OPdoC/xoC0m
 KDCjjSYeFjtSD+LAE0ql3RukYCeJ/OfidOcIPd4Qz23TRf6hu23T578ATn4pbjyw
 +AFw1ZkPRZ6xcYpfIGH9BIvD2FSWciaLGGJEVXabkp9o8216rba5DcHHuoyeU3s5
 VtuKQIaPz6VmAz3J0UpZ0FJkicjChbM9cc5aPmzcShc7W/zS0CAf+OUuXCuCOMO1
 ANj2CNabk73M6hm8zKygxAT9Not+24ISIteh5g3Jviw8MKQW1SGyRiU1xCVTkoou
 f20okg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q20fs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8947d47793fso201064316d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340630; x=1769945430;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
 b=fiNWx0g661iTvdd+GI3fLxnwhwYFHFZ8Z76LWT0M3PWi0tTMzI1XiPB4RtE03HIJ5t
 YpmX0OueJm8vQHR8mQN7SzyJrP4KsUhWInhxIvLkOVxMu5xOvEL4HVx4kxpV8VutqK0/
 gZIuZsoshgkOX1HirUHSCX2PtcJLlgDBijxOwCTg59cdD3kTRzu2ozEITxoM/c6xOtNz
 eGoI86lMzouSAv3pKvBCWOq9aStP8eqSPupyQB78FH9zlgkBz/Fl/YE6M6/nOYxV92bj
 Ho0OwiDf1swV4kELRVB7qxVEmm5uNG+Vcj01r+iWAH0/hhTsEbfvCVdZWx5ZUyuOOubO
 F51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340630; x=1769945430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
 b=uJpHBGlTRnCMYasNCcDkqtL6M8pP5DSc3L8vH+enKEEbLZQH/8AqvAuFHNLYjP3kkC
 rChi1O62zsSfIHL9bWynHQ10fvPiyxZfqO80r2pW9mOhAYQP76ZDDhPe0HvO7Jkm52FS
 7FmyuuZ1Hxhw1ZuqtkfCmkeAEvCd+IeCnlDN5EMxMDAeeWk1dS5coqebaltNbjfRnReH
 10rEpq9c28OAsM5n7qBbUfV8NzQZ06TzJ29qxcawdMJD939lxQYV41UVm863/xJ1gDSl
 MIraY5zlwcM2WNku0Y0/KcKRQ12koaT8wVhqJpf8sn5UXWRaBBm0u7tjlP07v8rK6sUJ
 X39A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeL74Byr0s+gjcXF44Jxb+VYvHFtxXg9e3LgRP8VsU9f8OJK/d+WYeg4XGWSENOJ3JMwNI0IcaCio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbqH5/TPfbIMuj8A9eG3ZjVOlEF4rnXRBbSoQ58/vK9gFRF0yw
 JDyoj2TxXhzyq0jiJ8WnHo3YIwnjzwlB7sl+H4+rYmHjMDuSVFsQpZORZoyNCn4WtbmB9KG7wX9
 tD6Y65QOvvYkxmcgQvCBt9XZuzd5d+uSGVaJAzwfdCVrK9vwdHskD69rEWHjf4KvsjLlUPE8=
X-Gm-Gg: AZuq6aKvCdh00JwDwtBZnBJjMLlmvTlDIBInuRUxnITtIImc8mGQGJkAZOy5EW6hCdn
 Pz0aCa4yzNzPmEfhNDNEUhqtRWXcMTbFMgZIHtpZrFD25vSsDDWR1q3U+ond/BPOvCCUv4EAO31
 a59T/Wd4h7S0yO/DUojki/wpsGkRij2fOKkBQVWccg4+qk4EdjUkkVnbJiC4anPYopu/soBd7XF
 WLGipwu8ZWrmDAwAyRLq0BMkain8//jsjNTfTLXgLm8KvKsX6kWz3BTdeHr6K9HdY470vrgEnjN
 pHnINTRyOc+AaIQpfyzcmv1EYMK4HjZ7NdVvaV7lNOsnQN5gTIrfaGUkaxgS1A+6uTwOjPJnpgi
 +ehbI/f6aNHFuJjzYNr5/mdfPSeyVMzkym6eom0Re7Yb1yPHTlw8rHmkoIHRgdoLd6rDOVga7kt
 lf22naYQ3DX559A2JoJoNsqp8=
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id
 6a1803df08f44-894b06ad66amr15500606d6.7.1769340630492; 
 Sun, 25 Jan 2026 03:30:30 -0800 (PST)
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id
 6a1803df08f44-894b06ad66amr15500386d6.7.1769340630091; 
 Sun, 25 Jan 2026 03:30:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:09 +0200
Subject: [PATCH v4 7/9] media: iris: don't specify bank_spreading in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-7-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/WiNKO4Sq9OFCR4Oxxq1utFJduJzlxUaxF
 iLJ3B7neHKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1diAB/4xcXqMX5BQ30Uqy0GElXqb+H6h1SGsxLW1W75gDkcFTb0gkECJ5GVJCiRaTWCVNf6uRZk
 QL7XCT2MX9SPDnbh9Ut90scwoFRPKEtso2OSQhAILE/ixRT1LO40bqbL+AJ6lwTMcC4ve0qzJ56
 eIrauPAWrJXJs8a+NAcLps6u4aE6jKyhyYUXt9DJZc4BugdJS52Xng+ImzTY3RxC5QvGChJTWJ9
 I4ogNAFvNkXFTNJQUIKi/CA8XulwdkwBmevA3ej0qfFhHiyze6OjFRvAkBUjjlssecdVUHVcYgV
 mYzkgtdyv5xBfv9OCl5Ig/FC9ZWYiMXg2gF/M6CLuWRkCAkR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pLp8xU3qmd_Ep1NM_1U8YQCTsTR7M48j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXzJO7yUhJ9HSx
 Yi9vuioLInwuOrZM5GYQMPPlzYzZVjldhv2FT+LCDy2oCrezhbSRAThDmmRtoIoTKvxGXHvrsnB
 /Xo2APxKW6GySVnP66i9nzhs+u5rXMrzIpo1YGwMb465dYMknh09dwcTLBo605uYvjC61U8h3hg
 O+1xT3KLQS3+6MjuzLWgAuNUqREfWPIqZEpyyWRIQ2toE3bbE/gl/k8Iv5ub6R2IzfNsD9tOQ1V
 wtd4psIDYkhLq6RoYpvEJAnb1wh7oWz1/phm1taUQqOIhk6nIM2vszMbqqmt4+zxkaXcL7493qp
 qHt2b2Tm9o/S74etm0QoGhUfyQJm1hEW9H4jIH0kBWEUaNf+1gJvSYDktDtoqxqwBH+pXfO+vSu
 HkELDyHgBROWeSzAG8KVwWy3hG6kLxMC/+ETI8en9POVsGOTYucxEoLx889x6LpqfyH7xtf2S3J
 T2fOfjfqv7W4bNlU6fQ==
X-Proofpoint-ORIG-GUID: pLp8xU3qmd_Ep1NM_1U8YQCTsTR7M48j
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=6975fed7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fFUJnxvTdpzArna8SyMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BEE4D803BF
X-Rspamd-Action: no action

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e217f15ef028..07c58cf3a14a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 8072f430bd26..4e617176dee4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3

