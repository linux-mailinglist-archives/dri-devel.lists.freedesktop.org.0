Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3DD2D2DA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6310E80C;
	Fri, 16 Jan 2026 07:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPXYdylT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGICwe1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2510E815
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMaKRP3192150
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=; b=fPXYdylTR+08QfgM
 AKCjVblPIbGwHjlsNIzSCpT9j0JZc8m1a0PgbPuvcTNlz53dqk4pzfmwW0b+uAe9
 ACU1FuVqEHiYAow1Pmm19b2KyJJ2bfztQ4Dq8Kc34KJ4h++uWDhIsgf+MobwRUoR
 qidaMlvuLUu7UAvJsCu/WgA8MeHsJOvFDK6OAB8zRJo5kVYgRqPDHAsVlEIXYCea
 RQzUirZpmSWicyYOkdGlFD6eooBF6L77W2QnOfkf3Yd85KYYk98gg3QKB1My/UOG
 zXZ1hYhA1wDg/uAvNl2VLOr59ES1eBUM/vDMoL0TQqOk9akfL6QQ/X+6XOS5iiBY
 fHencw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968h80s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a0ec2496so303174985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548470; x=1769153270;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
 b=kGICwe1zrA2XEQN9UWHUO369t2QMvkLV6Rkep2MrW38Y4MiMLaPqXydw+jD2RC+zCr
 JGTR6eUBKmI229KGJA48fKQNUpLzAwyBjo3GPjy4ouJR63nClAlpsAvMBSA1kLPeWZ7q
 v1BVguG0U64YxwT6O1cTSRLQ+DH40bkZy8+wZGZFcnItLT08BoaxYDBZIy/T+BwEQJqJ
 67DG7nof9gsxs9HjRct+Ak9+7p/lzrqhdWAtrBYxN69WZ2ZAZvUghd7jgcaW6jeYxWLi
 cLJ/6H7/95T8a/5HEazCWI/xhILY7rmCN3sqJo6Q8M1YAW9ry/99Tbvw2jPcPh7TJ6sa
 5IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548470; x=1769153270;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
 b=tZ7M7/Z1YF1AFwrtlNN2DUdWTdtyhcwJLlSE7yIAeYibBlUvQhMv/ei5ygjLqfIG/X
 QTyzeV5oFO52/rkITOPOaq+KT5yWqMcwzzUXEOWXEFqnKBNehuqZrcfRajG/NT6cOK5O
 Do78s6r9Mn8zFgBGKNd+gTIzwzvaQ3bPaQVG0A48styjotQ/a0TRTvdyNfXWgoQu7pJM
 suTZcDAzt6+1p0O+nx0i/ToE9y6cRpcloONLcOfCJsHORoHwZu/Io3/EfHz/VFn3VyYV
 GPq3nZEumljXjaek+uRCHhNCHrCUf9jhb/kEGp6Zdbom3/XqDV5vREz7veLbAZeWlhai
 5eeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwGYX3YNbGQemxd3d2EuBEXjk1UveOOxd8rv1ZnsMGmxRbAWrAejKahZKna6SJ7mK+7zsVkflG7BU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoDZdIjCjsrIItS0Q1yj52RrPKR3qcDxMQqG8UH3Y0k4MjwqE6
 nZ9RivS+aDpfcsk/9PmNlUuM2zwgEv7gsy+cRy7vPd/eQOiogTkSlSgTGYUS+qJy2u1P3Shd45B
 M8u09uh1QCpd6BRBQ64AcmyfveMX2y85A4kpk4vKqU2t7eR5KXMs/OilcFPzpywoGki/X76w=
X-Gm-Gg: AY/fxX7QcIMx/qDc/PM//8MTBBgF0z2xCTippJxiFc8L4wfMPc63HRemnU1AR8SG9Ny
 LYLUDtUTEUt/+c+hpNnwiBDrCTpbSdjTNFpIVvdeIoTz6Rt0vxNxtB/sI6FbuEB11mhqDEvx78R
 22frCgI2aiNMoXGEN5sA+wZOabpJgMtovMnRe1q6oPOrSSX2+x4bf7cdnYtnvmr610qtKT2PSub
 ONDBldLy5qc376KC2/Sm6LOut3z/6zpjbZMEuRIbaehtjw4GorqAPo1o/wsKQhrEJTjsvKorpJc
 7ePCzwO0eW+YLPnurwkZvxoTxKyWoWPBWsW/i7remmXxZ0SDFqpoctLh9RWle4gHSuZ2L+Fn/tD
 xOC8DXiDyJNJPqfxW+pY0l1pjESRV0eGkPOZfNz7ZikHIdCK6wRrOSvoe4/JKdLSllO9q+kCFCx
 /fNwqaDTDXKwnSgnf9fVnqMak=
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id
 af79cd13be357-8c6a65fcaacmr291176985a.0.1768548470534; 
 Thu, 15 Jan 2026 23:27:50 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id
 af79cd13be357-8c6a65fcaacmr291173485a.0.1768548470052; 
 Thu, 15 Jan 2026 23:27:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:41 +0200
Subject: [PATCH v3 7/9] media: iris: don't specify bank_spreading in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-7-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TBMGAChYXcRd+cqTtCm5cArhh1vfJdQRxPrvxfqxJi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehq/i+EvcJfs7BD2mcwrDQr+u6wFEl2Q+zxH
 Wsi59FtErqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1RKbB/9E+bGNVmGoLwsG7R05MoYhqO4MfVYSyooQgbTCN2LCKtGri3Yc9J3s/J+5jF0yxyltaKl
 H8HiJ2cgXNl6XfSJ8TAyRPKFUep8Q97W62/e+ENrkIyIjs24cpnb98GLBndH99YvYu9d67jH1U6
 kCQkw/+5SXh7vzrQARfOzIg+4q9rWWQw8OULKJEPzgWFcDQ9EEF05fOnZmn5Zb8l34IBivqU+MO
 5gj54tPrndMakA7aa/Jrc+0OFEJazd7iolQOb5G0brSQ5eLfGBb2Wn/9XE3bz845LpfH1IRrGcz
 iQ2YSw6COpzsLmAckHmEDJ10ZuFegsm4Z8IYO+70spc5cWz8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=6969e877 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OpF63xLRx8LvnmPwtJ7kazj1GICdLvV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX8WbPkfqrIHRX
 MUCQWWOXcYqwt7hZ3DY0lCGWAGGs+WsW6G+QqRbuHZgB1DEKq4aH30OdHKrYBJ0u2D0tJUAUUkS
 w1ofGxB6lWymh7/RtN9+4sEf65QnAGtDHMd1QpKutYzAHROSBOcXRIKbgJwwE5C7ey7Xhvs4MyN
 DOWI8iMchHE86mtVXKx0KZOYrC0w18JmGYee4+cq1yShD7qLnzJSlBjqx5se8d75xTKDKS5z+d9
 wdAL6p1BQuBaKOxMiPX9Knx4kJ/o/O3+f9nAfEywrvfdtb5UkgYLYU2BCri5LWh5/ZfPx/lpJWE
 ML5Dpi4wiIZmbtq3t+8R3wfKUBAMzjnVCzuBvbLYHHOVtbhXRrwKrkI+9b6HrMxlLkWviPel0yj
 ykGV7CU0Y+USqp63yAlob+Hv7VCO+MLwC/LwPm6reV39rJwG9Axj2us2woACOtbaGU+QSOaDvol
 4QSrnhtdk2ybiWcm0hQ==
X-Proofpoint-GUID: OpF63xLRx8LvnmPwtJ7kazj1GICdLvV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

