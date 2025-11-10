Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E60C4801D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E30610E449;
	Mon, 10 Nov 2025 16:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBa5zTP8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk7XjZiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE1910E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFPwWp4071288
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1R8nfY6V5GV8tiqWGT/OdoAsKAZCP1AEd9LYyTc+98Y=; b=LBa5zTP8fNiyNNOU
 /KNx1rDMULa9R55azfCn5VGwgJanZk+6xn3EEx64R3WfkijpXZ5ttk11pImIa/us
 XUtK6glzngbZj68gNVNSKs4/sQTr72nlYXFX5B2VrfOqV1QP8E1FN2gWsuq9UKGR
 I+1LXuohctUXnl0o4dNMjFVmzlNZCnkT/MWWH42z4SF6YcszrCb6ztvoUoIcwVTK
 lauRzQRXAmztvQ+7uWooxYpWXtE+E32rwjPRFazVODSw2wD1vNA36WizVY3IqWiV
 twkI5Ln+fUpK+Ad3IXxyZei7PF3P/K/DVmwlaHBTwhINBMpub0sVkQnBdJLdpeyL
 2/mmAg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr8vu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3439fe6229aso1551414a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792715; x=1763397515;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1R8nfY6V5GV8tiqWGT/OdoAsKAZCP1AEd9LYyTc+98Y=;
 b=fk7XjZiEAVpI8WFzc87at/C/1KrJWJUGFz00xx46BvmBZAXq05zhQvw2KhP/q2TsI5
 af8lGsBN/qsAVIETyP7ToifL1xCb0OYDzfH+TSw6cPhlIt8hyWj75r9d3GjbC5vpXOnj
 ZVjEjTwy3mz/rfo87kVtHYzNHjG8+ZKyWw1WdUamHxgv/ydLDYFpi1rWi3mL/xb+efkM
 HlMEFHot9HEvdt+gJNqzd32pw2QcZocEigYb0Hoiy+3NjB1YksYz/r1kknG27ytRMBmX
 aY+8yRwWaQw5Og0/JAJRf4GBbWauzlzXTtvvETDX8URLaHfqN+U2zXnp8OSdA9jz0AXY
 D/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792715; x=1763397515;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1R8nfY6V5GV8tiqWGT/OdoAsKAZCP1AEd9LYyTc+98Y=;
 b=EvfBTdSV/UFwPHvRXeh2dEVlhq7OHRZLeM8GbjonFm+pT0ziPIau98TiczV2G0Nb6D
 6oWHKW3NQc+AwLdcscxoA2GADSERzvJ349/lF4FxD7yWja+q8dNu8zS27+GHGPkkehG0
 UUzMDfToZeyMsEYQFGSfXHSutxlPTNyNzmAOJSbDlruehCYpF9VcO/dFghUPvlRavFpO
 uugzeV2A01dEvKvfx5seZjlsyOr4o/jiTn79rDQc8EY3cypDTG6Wewjv7kW4cqabUHFY
 LGC2VBB3+eDE1oXta9KF9Sv+7ukzfwwpgrsi0RXh3ItwSz1ee2maBtA1/NBN3gdD94qQ
 Pd3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw0V/1cKZWggGCFWJ7I0TIgR+Fejf7f8CQv6VP1XvEeyfKPwx2rb5nBQJ8w//eSQP0snsOBbiOo3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDQ+eyevFu/1COyqfdcQ+55IwUZWH0jZp+GMKYsPVAkZc5uTvA
 pAJwwEDEtAmAs02jKrfqj70pFgtFbtT6PFqhVv7iAc1l1cwBM+FHa5d9VNt1RcY6HDQf7PvYiky
 PSq/dhgNe78X3rM29hWCm/ISSyjukyElHHRhZjld7gSCFcLZ4vKxxbt766iJpWgZEImp17bk=
X-Gm-Gg: ASbGncsUTHuUxeqtBGxJrH3BU7afkhphWKtp26FzKHEqIX+PVS5GWr+r6jmhS7yAfkT
 FAYLbqigDp7Pjcetmjepk0gNgftkpgAhn54hRc/FHaUkvr6yfSHcU/0nYTZ62YXLZalCdH7lUiA
 KHidNGy4i1zwbME1yroQYKgzfhQV8IMDDmxIbA9BUFLQkuXVM1BTzTCb0R+tlrNOlRK1ptBlDFO
 WwihMufYoI9+UuvJgAZhVzoYc/uyo3KVc+IpjYvqi6XPeXVvIG6y/DGfFz8kaLjNpP8I8OcAYn6
 Er8DgP72+3gyZHn4RAzwx16YEmDQ6HxXDOGZp2Y5Zk6Z9KuczQN0dyaV6NgFNo9/9rT3Ah0exro
 MFDhKFa3egWZznRNK2iz2mqs=
X-Received: by 2002:a17:90b:1801:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-343befa5f52mr28026a91.1.1762792713499; 
 Mon, 10 Nov 2025 08:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJD/9f/apnYennnjOKGJG4g+RCbCwCOwYuIS7srgG6rnqB0iODbQ+p1Of9xaZFME+eONGwfA==
X-Received: by 2002:a17:90b:1801:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-343befa5f52mr27942a91.1.1762792712282; 
 Mon, 10 Nov 2025 08:38:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:38:31 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:09 +0530
Subject: [PATCH v2 03/21] drm/msm/adreno: Common-ize PIPE definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-3-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=131443;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5IaguxYaqbD6PYA1KDlVNdHxKZhKutZ0CMhjYb3En5o=;
 b=+3jgt9zZ4JvI2LOxS2kpcLe4BNfRYWWapUqSMy3wfinoybr9/6w5njMhK28jLqwzP9gJLwBSu
 c0boU4MkVaQDqT4p5iQAN1fL8GUkW4yHbaR+XSb1kwJn2qzTrP/WYXu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX9HbPmh8PkJX8
 cN6dAaSvtRIjKpZXNVsMQKXJY0ZdV99gK1TA+ayZ25k32ebbZ9VhYqqNVdY71HxQCtv4xKs1qmt
 NzvXjMOG5HtF5MK0R9zodKtO6kaTwq/y7Hd412Mn+JRM2K7icOb2aicrRqW9NTxf64qhfbhOKX9
 7st3X0Wk0O4S40szNbvgQDMbgyKrVqD7xK1LpysRa2gCRKh6O6QKx/QRUfOju2XXudWrXP8FY+b
 1fMAKsepfhzqOrsGlBxGfGnbf+Yo5tNEb7rIbnXmM1cjRlFCd6cu1wjdUK2hO4tGzlCV2TrIOzz
 mu4KB0H0GvGA92sdaPz2dCKpfkWi68nroTbcatqFaJcHIVFfFHm1RJMiKcZy015njWB+WYEF4qN
 IbGRIxK871K1nu3ukBiXWz4Q8J021A==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=6912150c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Ver-QhWlg-VMwr2Uht0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: JO6MUYtC-9cS768QbBgQZWK634Sl3KJs
X-Proofpoint-ORIG-GUID: JO6MUYtC-9cS768QbBgQZWK634Sl3KJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Newer gen's introduce pipe enums which do not exist on older gens, but
the numeric values do not conflict. IOW, they are backward compatible.
So move its definition to adreno_common.xml.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
 7 files changed, 617 insertions(+), 613 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 1c18499b60bb..4c5fe627d368 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -575,7 +575,7 @@ struct gen7_sptp_cluster_registers {
 	/* statetype: SP block state type for the cluster */
 	enum a7xx_statetype_id statetype;
 	/* pipe_id: Pipe identifier */
-	enum a7xx_pipe pipe_id;
+	enum adreno_pipe pipe_id;
 	/* context_id: Context identifier */
 	int context_id;
 	/* location_id: Location identifier */
@@ -801,10 +801,10 @@ static const char *a7xx_statetype_names[] = {
 };
 
 static const char *a7xx_pipe_names[] = {
-	A7XX_NAME(A7XX_PIPE_NONE),
-	A7XX_NAME(A7XX_PIPE_BR),
-	A7XX_NAME(A7XX_PIPE_BV),
-	A7XX_NAME(A7XX_PIPE_LPAC),
+	A7XX_NAME(PIPE_NONE),
+	A7XX_NAME(PIPE_BR),
+	A7XX_NAME(PIPE_BV),
+	A7XX_NAME(PIPE_LPAC),
 };
 
 static const char *a7xx_cluster_names[] = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index 04b49d385f9d..087473679893 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -82,85 +82,85 @@ static const u32 gen7_0_0_debugbus_blocks[] = {
 };
 
 static const struct gen7_shader_block gen7_0_0_shader_blocks[] = {
-	{A7XX_TP0_TMO_DATA,                 0x200, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_TP0_SMO_DATA,                  0x80, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA_1,               0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_0_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_1_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_2_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_3_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_4_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_5_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_6_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_7_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_CB_RAM,                    0x390, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_TAG,                   0x90, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA_2,               0x200, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_TMO_TAG,                    0x80, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_SMO_TAG,                    0x80, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_STATE_DATA,                 0x40, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_HWAVE_RAM,                 0x100, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_L0_INST_BUF,                0x50, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_8_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_9_DATA,                 0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_10_DATA,                0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_11_DATA,                0x800, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_12_DATA,                0x200, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_1,          0x200, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_1,              0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_STPROC_META,              0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_DATAPATH_META,            0x20, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INDIRECT_META,            0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_TP0_TMO_DATA,                 0x200, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_TP0_SMO_DATA,                  0x80, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA_1,               0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_0_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_1_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_2_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_3_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_4_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_5_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_6_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_7_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_CB_RAM,                    0x390, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_TAG,                   0x90, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA_2,               0x200, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_TMO_TAG,                    0x80, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_SMO_TAG,                    0x80, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_STATE_DATA,                 0x40, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_HWAVE_RAM,                 0x100, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_L0_INST_BUF,                0x50, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_8_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_9_DATA,                 0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_10_DATA,                0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_11_DATA,                0x800, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_12_DATA,                0x200, 4, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_1,          0x200, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_1,              0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_STPROC_META,              0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_DATAPATH_META,            0x20, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x40, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INDIRECT_META,            0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
 };
 
 static const u32 gen7_0_0_pre_crashdumper_gpu_registers[] = {
@@ -303,7 +303,7 @@ static const u32 gen7_0_0_noncontext_rb_rbp_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_noncontext_rb_rbp_pipe_br_registers), 8));
 
-/* Block: GRAS Cluster: A7XX_CLUSTER_GRAS Pipeline: A7XX_PIPE_BR */
+/* Block: GRAS Cluster: A7XX_CLUSTER_GRAS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_gras_cluster_gras_pipe_br_registers[] = {
 	0x08000, 0x08008, 0x08010, 0x08092, 0x08094, 0x08099, 0x0809b, 0x0809d,
 	0x080a0, 0x080a7, 0x080af, 0x080f1, 0x080f4, 0x080f6, 0x080f8, 0x080fa,
@@ -313,7 +313,7 @@ static const u32 gen7_0_0_gras_cluster_gras_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_gras_cluster_gras_pipe_br_registers), 8));
 
-/* Block: GRAS Cluster: A7XX_CLUSTER_GRAS Pipeline: A7XX_PIPE_BV */
+/* Block: GRAS Cluster: A7XX_CLUSTER_GRAS Pipeline: PIPE_BV */
 static const u32 gen7_0_0_gras_cluster_gras_pipe_bv_registers[] = {
 	0x08000, 0x08008, 0x08010, 0x08092, 0x08094, 0x08099, 0x0809b, 0x0809d,
 	0x080a0, 0x080a7, 0x080af, 0x080f1, 0x080f4, 0x080f6, 0x080f8, 0x080fa,
@@ -323,7 +323,7 @@ static const u32 gen7_0_0_gras_cluster_gras_pipe_bv_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_gras_cluster_gras_pipe_bv_registers), 8));
 
-/* Block: PC Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BR */
+/* Block: PC Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BR */
 static const u32 gen7_0_0_pc_cluster_fe_pipe_br_registers[] = {
 	0x09800, 0x09804, 0x09806, 0x0980a, 0x09810, 0x09811, 0x09884, 0x09886,
 	0x09b00, 0x09b08,
@@ -331,7 +331,7 @@ static const u32 gen7_0_0_pc_cluster_fe_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_pc_cluster_fe_pipe_br_registers), 8));
 
-/* Block: PC Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BV */
+/* Block: PC Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BV */
 static const u32 gen7_0_0_pc_cluster_fe_pipe_bv_registers[] = {
 	0x09800, 0x09804, 0x09806, 0x0980a, 0x09810, 0x09811, 0x09884, 0x09886,
 	0x09b00, 0x09b08,
@@ -339,7 +339,7 @@ static const u32 gen7_0_0_pc_cluster_fe_pipe_bv_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_pc_cluster_fe_pipe_bv_registers), 8));
 
-/* Block: RB_RAC Cluster: A7XX_CLUSTER_PS Pipeline: A7XX_PIPE_BR */
+/* Block: RB_RAC Cluster: A7XX_CLUSTER_PS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_rb_rac_cluster_ps_pipe_br_registers[] = {
 	0x08802, 0x08802, 0x08804, 0x08806, 0x08809, 0x0880a, 0x0880e, 0x08811,
 	0x08818, 0x0881e, 0x08821, 0x08821, 0x08823, 0x08826, 0x08829, 0x08829,
@@ -355,7 +355,7 @@ static const u32 gen7_0_0_rb_rac_cluster_ps_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_rb_rac_cluster_ps_pipe_br_registers), 8));
 
-/* Block: RB_RBP Cluster: A7XX_CLUSTER_PS Pipeline: A7XX_PIPE_BR */
+/* Block: RB_RBP Cluster: A7XX_CLUSTER_PS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers[] = {
 	0x08800, 0x08801, 0x08803, 0x08803, 0x0880b, 0x0880d, 0x08812, 0x08812,
 	0x08820, 0x08820, 0x08822, 0x08822, 0x08827, 0x08828, 0x0882a, 0x0882a,
@@ -370,7 +370,7 @@ static const u32 gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BR Location: HLSQ_STATE */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BR Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers[] = {
 	0x0a980, 0x0a980, 0x0a982, 0x0a984, 0x0a99e, 0x0a99e, 0x0a9a7, 0x0a9a7,
 	0x0a9aa, 0x0a9aa, 0x0a9ae, 0x0a9b0, 0x0a9b3, 0x0a9b5, 0x0a9ba, 0x0a9ba,
@@ -381,7 +381,7 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_LPAC Location: HLSQ_STATE */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_LPAC Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_state_registers[] = {
 	0x0a9b0, 0x0a9b0, 0x0a9b3, 0x0a9b5, 0x0a9ba, 0x0a9ba, 0x0a9bc, 0x0a9bc,
 	0x0a9c4, 0x0a9c4, 0x0a9cd, 0x0a9cd, 0x0a9e2, 0x0a9e3, 0x0a9e6, 0x0a9fc,
@@ -390,21 +390,21 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_state_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BR Location: HLSQ_DP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BR Location: HLSQ_DP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers[] = {
 	0x0a9b1, 0x0a9b1, 0x0a9c6, 0x0a9cb, 0x0a9d4, 0x0a9df,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_LPAC Location: HLSQ_DP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_LPAC Location: HLSQ_DP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_dp_registers[] = {
 	0x0a9b1, 0x0a9b1, 0x0a9d4, 0x0a9df,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_dp_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BR Location: SP_TOP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BR Location: SP_TOP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers[] = {
 	0x0a980, 0x0a980, 0x0a982, 0x0a984, 0x0a99e, 0x0a9a2, 0x0a9a7, 0x0a9a8,
 	0x0a9aa, 0x0a9aa, 0x0a9ae, 0x0a9ae, 0x0a9b0, 0x0a9b1, 0x0a9b3, 0x0a9b5,
@@ -414,7 +414,7 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_LPAC Location: SP_TOP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_LPAC Location: SP_TOP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_sp_top_registers[] = {
 	0x0a9b0, 0x0a9b1, 0x0a9b3, 0x0a9b5, 0x0a9ba, 0x0a9bc, 0x0a9e2, 0x0a9e3,
 	0x0a9e6, 0x0a9f9, 0x0aa00, 0x0aa00, 0x0ab00, 0x0ab00,
@@ -422,7 +422,7 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_sp_top_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_lpac_sp_top_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BR Location: uSPTP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BR Location: uSPTP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers[] = {
 	0x0a980, 0x0a982, 0x0a985, 0x0a9a6, 0x0a9a8, 0x0a9a9, 0x0a9ab, 0x0a9ae,
 	0x0a9b0, 0x0a9b3, 0x0a9b6, 0x0a9b9, 0x0a9bb, 0x0a9bf, 0x0a9c2, 0x0a9c3,
@@ -432,7 +432,7 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_LPAC Location: uSPTP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_LPAC Location: uSPTP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_usptp_registers[] = {
 	0x0a9b0, 0x0a9b3, 0x0a9b6, 0x0a9b9, 0x0a9bb, 0x0a9be, 0x0a9c2, 0x0a9c3,
 	0x0a9cd, 0x0a9cd, 0x0a9d0, 0x0a9d3, 0x0aa31, 0x0aa31, 0x0ab00, 0x0ab01,
@@ -440,7 +440,7 @@ static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_lpac_usptp_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BR Location: HLSQ_STATE */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BR Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers[] = {
 	0x0a800, 0x0a800, 0x0a81b, 0x0a81d, 0x0a822, 0x0a822, 0x0a824, 0x0a824,
 	0x0a827, 0x0a82a, 0x0a830, 0x0a830, 0x0a833, 0x0a835, 0x0a83a, 0x0a83a,
@@ -453,7 +453,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BV Location: HLSQ_STATE */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BV Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers[] = {
 	0x0a800, 0x0a800, 0x0a81b, 0x0a81d, 0x0a822, 0x0a822, 0x0a824, 0x0a824,
 	0x0a827, 0x0a82a, 0x0a830, 0x0a830, 0x0a833, 0x0a835, 0x0a83a, 0x0a83a,
@@ -466,7 +466,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BR Location: SP_TOP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BR Location: SP_TOP */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_sp_top_registers[] = {
 	0x0a800, 0x0a800, 0x0a81c, 0x0a81d, 0x0a822, 0x0a824, 0x0a830, 0x0a831,
 	0x0a834, 0x0a835, 0x0a83a, 0x0a83c, 0x0a840, 0x0a840, 0x0a85c, 0x0a85d,
@@ -477,7 +477,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_sp_top_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_br_sp_top_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BV Location: SP_TOP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BV Location: SP_TOP */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers[] = {
 	0x0a800, 0x0a800, 0x0a81c, 0x0a81d, 0x0a822, 0x0a824, 0x0a830, 0x0a831,
 	0x0a834, 0x0a835, 0x0a83a, 0x0a83c, 0x0a840, 0x0a840, 0x0a85c, 0x0a85d,
@@ -488,7 +488,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BR Location: uSPTP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BR Location: uSPTP */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_usptp_registers[] = {
 	0x0a800, 0x0a81b, 0x0a81e, 0x0a821, 0x0a823, 0x0a827, 0x0a830, 0x0a833,
 	0x0a836, 0x0a839, 0x0a83b, 0x0a85b, 0x0a85e, 0x0a861, 0x0a863, 0x0a867,
@@ -498,7 +498,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_br_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_br_usptp_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BV Location: uSPTP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BV Location: uSPTP */
 static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_usptp_registers[] = {
 	0x0a800, 0x0a81b, 0x0a81e, 0x0a821, 0x0a823, 0x0a827, 0x0a830, 0x0a833,
 	0x0a836, 0x0a839, 0x0a83b, 0x0a85b, 0x0a85e, 0x0a861, 0x0a863, 0x0a867,
@@ -508,7 +508,7 @@ static const u32 gen7_0_0_sp_cluster_sp_vs_pipe_bv_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_vs_pipe_bv_usptp_registers), 8));
 
-/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BR */
+/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers[] = {
 	0x0b180, 0x0b183, 0x0b190, 0x0b195, 0x0b2c0, 0x0b2d5, 0x0b300, 0x0b307,
 	0x0b309, 0x0b309, 0x0b310, 0x0b310,
@@ -516,35 +516,35 @@ static const u32 gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BV Location: HLSQ_STATE */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BV Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_bv_hlsq_state_registers[] = {
 	0x0ab00, 0x0ab02, 0x0ab0a, 0x0ab1b, 0x0ab20, 0x0ab20, 0x0ab40, 0x0abbf,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_bv_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BV Location: SP_TOP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BV Location: SP_TOP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_bv_sp_top_registers[] = {
 	0x0ab00, 0x0ab00, 0x0ab02, 0x0ab02, 0x0ab0a, 0x0ab1b, 0x0ab20, 0x0ab20,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_bv_sp_top_registers), 8));
 
-/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BV Location: uSPTP */
+/* Block: SP Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BV Location: uSPTP */
 static const u32 gen7_0_0_sp_cluster_sp_ps_pipe_bv_usptp_registers[] = {
 	0x0ab00, 0x0ab02, 0x0ab21, 0x0ab22, 0x0ab40, 0x0abbf,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_cluster_sp_ps_pipe_bv_usptp_registers), 8));
 
-/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_BV */
+/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_BV */
 static const u32 gen7_0_0_tpl1_cluster_sp_ps_pipe_bv_registers[] = {
 	0x0b300, 0x0b307, 0x0b309, 0x0b309, 0x0b310, 0x0b310,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_cluster_sp_ps_pipe_bv_registers), 8));
 
-/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: A7XX_PIPE_LPAC */
+/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_PS Pipeline: PIPE_LPAC */
 static const u32 gen7_0_0_tpl1_cluster_sp_ps_pipe_lpac_registers[] = {
 	0x0b180, 0x0b181, 0x0b300, 0x0b301, 0x0b307, 0x0b307, 0x0b309, 0x0b309,
 	0x0b310, 0x0b310,
@@ -552,84 +552,84 @@ static const u32 gen7_0_0_tpl1_cluster_sp_ps_pipe_lpac_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_cluster_sp_ps_pipe_lpac_registers), 8));
 
-/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BR */
+/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers[] = {
 	0x0b300, 0x0b307, 0x0b309, 0x0b309, 0x0b310, 0x0b310,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers), 8));
 
-/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_VS Pipeline: A7XX_PIPE_BV */
+/* Block: TPL1 Cluster: A7XX_CLUSTER_SP_VS Pipeline: PIPE_BV */
 static const u32 gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers[] = {
 	0x0b300, 0x0b307, 0x0b309, 0x0b309, 0x0b310, 0x0b310,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers), 8));
 
-/* Block: VFD Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BR */
+/* Block: VFD Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BR */
 static const u32 gen7_0_0_vfd_cluster_fe_pipe_br_registers[] = {
 	0x0a000, 0x0a009, 0x0a00e, 0x0a0ef,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vfd_cluster_fe_pipe_br_registers), 8));
 
-/* Block: VFD Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BV */
+/* Block: VFD Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BV */
 static const u32 gen7_0_0_vfd_cluster_fe_pipe_bv_registers[] = {
 	0x0a000, 0x0a009, 0x0a00e, 0x0a0ef,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vfd_cluster_fe_pipe_bv_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BR */
+/* Block: VPC Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BR */
 static const u32 gen7_0_0_vpc_cluster_fe_pipe_br_registers[] = {
 	0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_fe_pipe_br_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_FE Pipeline: A7XX_PIPE_BV */
+/* Block: VPC Cluster: A7XX_CLUSTER_FE Pipeline: PIPE_BV */
 static const u32 gen7_0_0_vpc_cluster_fe_pipe_bv_registers[] = {
 	0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_fe_pipe_bv_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_PC_VS Pipeline: A7XX_PIPE_BR */
+/* Block: VPC Cluster: A7XX_CLUSTER_PC_VS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers[] = {
 	0x09101, 0x0910c, 0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_PC_VS Pipeline: A7XX_PIPE_BV */
+/* Block: VPC Cluster: A7XX_CLUSTER_PC_VS Pipeline: PIPE_BV */
 static const u32 gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers[] = {
 	0x09101, 0x0910c, 0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_VPC_PS Pipeline: A7XX_PIPE_BR */
+/* Block: VPC Cluster: A7XX_CLUSTER_VPC_PS Pipeline: PIPE_BR */
 static const u32 gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers[] = {
 	0x09200, 0x0920f, 0x09212, 0x09216, 0x09218, 0x09236, 0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers), 8));
 
-/* Block: VPC Cluster: A7XX_CLUSTER_VPC_PS Pipeline: A7XX_PIPE_BV */
+/* Block: VPC Cluster: A7XX_CLUSTER_VPC_PS Pipeline: PIPE_BV */
 static const u32 gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers[] = {
 	0x09200, 0x0920f, 0x09212, 0x09216, 0x09218, 0x09236, 0x09300, 0x09307,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_BR Location: HLSQ_STATE */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_BR Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers[] = {
 	0x0ae52, 0x0ae52, 0x0ae60, 0x0ae67, 0x0ae69, 0x0ae73,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_BR Location: SP_TOP */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_BR Location: SP_TOP */
 static const u32 gen7_0_0_sp_noncontext_pipe_br_sp_top_registers[] = {
 	0x0ae00, 0x0ae00, 0x0ae02, 0x0ae04, 0x0ae06, 0x0ae09, 0x0ae0c, 0x0ae0c,
 	0x0ae0f, 0x0ae0f, 0x0ae28, 0x0ae2b, 0x0ae35, 0x0ae35, 0x0ae3a, 0x0ae3f,
@@ -638,7 +638,7 @@ static const u32 gen7_0_0_sp_noncontext_pipe_br_sp_top_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_br_sp_top_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_BR Location: uSPTP */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_BR Location: uSPTP */
 static const u32 gen7_0_0_sp_noncontext_pipe_br_usptp_registers[] = {
 	0x0ae00, 0x0ae00, 0x0ae02, 0x0ae04, 0x0ae06, 0x0ae09, 0x0ae0c, 0x0ae0c,
 	0x0ae0f, 0x0ae0f, 0x0ae30, 0x0ae32, 0x0ae35, 0x0ae35, 0x0ae3a, 0x0ae3b,
@@ -647,28 +647,28 @@ static const u32 gen7_0_0_sp_noncontext_pipe_br_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_br_usptp_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_LPAC Location: HLSQ_STATE */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_LPAC Location: HLSQ_STATE */
 static const u32 gen7_0_0_sp_noncontext_pipe_lpac_hlsq_state_registers[] = {
 	0x0af88, 0x0af8a,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_hlsq_state_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_LPAC Location: SP_TOP */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_LPAC Location: SP_TOP */
 static const u32 gen7_0_0_sp_noncontext_pipe_lpac_sp_top_registers[] = {
 	0x0af80, 0x0af84,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_sp_top_registers), 8));
 
-/* Block: SP Cluster: noncontext Pipeline: A7XX_PIPE_LPAC Location: uSPTP */
+/* Block: SP Cluster: noncontext Pipeline: PIPE_LPAC Location: uSPTP */
 static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 	0x0af80, 0x0af84, 0x0af90, 0x0af92,
 	UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+/* Block: TPl1 Cluster: noncontext Pipeline: PIPE_NONE */
 static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
@@ -676,14 +676,14 @@ static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+/* Block: TPl1 Cluster: noncontext Pipeline: PIPE_BR */
 static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
 	 0x0b600, 0x0b600,
 	 UINT_MAX, UINT_MAX,
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
+/* Block: TPl1 Cluster: noncontext Pipeline: PIPE_LPAC */
 static const u32 gen7_0_0_tpl1_noncontext_pipe_lpac_registers[] = {
 	0x0b780, 0x0b780,
 	UINT_MAX, UINT_MAX,
@@ -703,172 +703,172 @@ static const struct gen7_sel_reg gen7_0_0_rb_rbp_sel = {
 };
 
 static const struct gen7_cluster_registers gen7_0_0_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_br_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BV, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_bv_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_LPAC, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_LPAC, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_lpac_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_rb_rac_pipe_br_registers, &gen7_0_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_rb_rbp_pipe_br_registers, &gen7_0_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_gras_cluster_gras_pipe_br_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_gras_cluster_gras_pipe_bv_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_gras_cluster_gras_pipe_br_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_gras_cluster_gras_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_pc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_pc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_pc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_pc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_rb_rac_cluster_ps_pipe_br_registers, &gen7_0_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_rb_rac_cluster_ps_pipe_br_registers, &gen7_0_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers, &gen7_0_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers, &gen7_0_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vfd_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vfd_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vfd_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vfd_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
 static const struct gen7_sptp_cluster_registers gen7_0_0_sptp_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_noncontext_pipe_br_sp_top_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_sp_noncontext_pipe_br_usptp_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_lpac_hlsq_state_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_noncontext_pipe_lpac_sp_top_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_lpac_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_lpac_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_SP_TOP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_0_0_sp_cluster_sp_vs_pipe_bv_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_lpac_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers, 0xb000 },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 772652eb61f3..9bec75e830a3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -96,87 +96,87 @@ static const u32 gen7_2_0_debugbus_blocks[] = {
 };
 
 static const struct gen7_shader_block gen7_2_0_shader_blocks[] = {
-	{A7XX_TP0_TMO_DATA,                 0x200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_TP0_SMO_DATA,                  0x80, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA_1,               0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_0_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_1_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_2_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_3_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_4_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_5_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_6_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_7_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_CB_RAM,                    0x390, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_13_DATA,                0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_14_DATA,                0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_TAG,                   0xc0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_INST_DATA_2,               0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_TMO_TAG,                    0x80, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_SMO_TAG,                    0x80, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_STATE_DATA,                 0x40, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_HWAVE_RAM,                 0x100, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_L0_INST_BUF,                0x50, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_8_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_9_DATA,                 0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_10_DATA,                0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_11_DATA,                0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_SP_LB_12_DATA,                0x800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
-	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x180, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM,            0x200, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_1,          0x1c0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM,                0x200, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x38, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x10, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INST_RAM_1,              0x800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_STPROC_META,              0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_DATAPATH_META,            0x20, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_INDIRECT_META,            0x10, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE},
-	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_TP0_TMO_DATA,                 0x200, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_TP0_SMO_DATA,                  0x80, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA_1,               0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_0_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_1_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_2_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_3_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_4_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_5_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_6_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_7_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_CB_RAM,                    0x390, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_13_DATA,                0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_14_DATA,                0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_TAG,                   0xc0, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_INST_DATA_2,               0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_TMO_TAG,                    0x80, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_SMO_TAG,                    0x80, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_STATE_DATA,                 0x40, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_HWAVE_RAM,                 0x100, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_L0_INST_BUF,                0x50, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_8_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_9_DATA,                 0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_10_DATA,                0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_11_DATA,                0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_SP_LB_12_DATA,                0x800, 6, 2, PIPE_BR, A7XX_USPTP},
+	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG,  0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM,           0x1c0, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM,           0x180, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CVS_RAM_TAG,        0x40, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CHUNK_CPS_RAM_TAG,        0x40, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CVS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_ICB_CPS_CB_BASE_TAG,      0x10, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM,            0x280, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM,            0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM,            0x200, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_1,          0x1c0, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM,                0x200, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CVS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_CPS_MISC_RAM_TAG,         0x10, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_TAG,             0x80, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG,    0x38, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x64, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG,    0x10, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CVS_CONST_RAM,       0x800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_GFX_CPS_CONST_RAM,       0x800, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INST_RAM_1,              0x800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_STPROC_META,              0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BV_BE_META,               0x10, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_DATAPATH_META,            0x20, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_FRONTEND_META,            0x80, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_INDIRECT_META,            0x10, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_BR, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_BV, A7XX_HLSQ_STATE},
+	{A7XX_HLSQ_BACKEND_META,             0x40, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE},
 };
 
 static const u32 gen7_2_0_gpu_registers[] = {
@@ -490,170 +490,170 @@ static const struct gen7_sel_reg gen7_2_0_rb_rbp_sel = {
 };
 
 static const struct gen7_cluster_registers gen7_2_0_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_pipe_br_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BV, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_pipe_bv_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_LPAC, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_LPAC, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_lpac_registers, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_rb_rac_pipe_br_registers, &gen7_2_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_rb_rbp_pipe_br_registers, &gen7_2_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_2_0_gras_cluster_gras_pipe_br_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_2_0_gras_cluster_gras_pipe_bv_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_2_0_gras_cluster_gras_pipe_br_registers, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_2_0_gras_cluster_gras_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_pc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_pc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_pc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_pc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_2_0_rb_rac_cluster_ps_pipe_br_registers, &gen7_2_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_2_0_rb_rac_cluster_ps_pipe_br_registers, &gen7_2_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers, &gen7_2_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_rb_rbp_cluster_ps_pipe_br_registers, &gen7_2_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vfd_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vfd_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vfd_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vfd_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_fe_pipe_br_registers, },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_fe_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_br_registers, },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_pc_vs_pipe_bv_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_br_registers, },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
 static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_noncontext_pipe_br_sp_top_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_sp_noncontext_pipe_br_usptp_registers, 0xae00 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_noncontext_pipe_lpac_hlsq_state_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_0_0_sp_noncontext_pipe_lpac_sp_top_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_NONE, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_br_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_ps_pipe_lpac_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_DP,
 		gen7_0_0_sp_cluster_sp_ps_pipe_lpac_hlsq_dp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_lpac_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_ps_pipe_lpac_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_HLSQ_STATE,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_hlsq_state_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_SP_TOP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_sp_top_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_br_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_2_0_sp_cluster_sp_vs_pipe_bv_usptp_registers, 0xa800 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_TP0_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_ps_pipe_lpac_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_br_registers, 0xb000 },
-	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_TP0_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_0_0_tpl1_cluster_sp_vs_pipe_bv_registers, 0xb000 },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index 0956dfca1f05..70805a5121be 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -118,97 +118,97 @@ static const u32 gen7_9_0_cx_debugbus_blocks[] = {
 };
 
 static const struct gen7_shader_block gen7_9_0_shader_blocks[] = {
-	{ A7XX_TP0_TMO_DATA, 0x0200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_TP0_SMO_DATA, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_INST_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_INST_DATA_1, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_0_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_1_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_2_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_3_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_4_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_5_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_6_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_7_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_CB_RAM, 0x0390, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_13_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_14_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_INST_TAG, 0x00C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_INST_DATA_2, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_TMO_TAG, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_SMO_TAG, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_STATE_DATA, 0x0040, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_HWAVE_RAM, 0x0100, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_L0_INST_BUF, 0x0050, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_8_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_9_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_10_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_11_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_SP_LB_12_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
-	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_L2STC_TAG_RAM, 0x0200, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_L2STC_INFO_CMD, 0x0474, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0180, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_MISC_RAM, 0x0640, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_MISC_RAM, 0x00B0, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_MISC_RAM_1, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM, 0x0200, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0008, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM_TAG, 0x0014, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM_TAG, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM_TAG, 0x0004, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0020, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x03C0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0280, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0050, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0008, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM_1, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_STPROC_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INST_RAM_2, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_DATAPATH_META, 0x0020, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_INDIRECT_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
-	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_TP0_TMO_DATA, 0x0200, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_TP0_SMO_DATA, 0x0080, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA_1, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_0_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_1_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_2_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_3_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_4_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_5_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_6_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_7_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_CB_RAM, 0x0390, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_13_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_14_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_TAG, 0x00C0, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA_2, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_TMO_TAG, 0x0080, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_SMO_TAG, 0x0080, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_STATE_DATA, 0x0040, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_HWAVE_RAM, 0x0100, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_L0_INST_BUF, 0x0050, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_8_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_9_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_10_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_11_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_12_DATA, 0x0800, 6, 2, PIPE_BR, A7XX_USPTP },
+	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_L2STC_TAG_RAM, 0x0200, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_L2STC_INFO_CMD, 0x0474, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0300, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0180, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM, 0x0640, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM, 0x00B0, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_1, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0200, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0008, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0014, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0010, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0004, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0020, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x03C0, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0280, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0050, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0008, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_1, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_STPROC_META, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_2, 0x0800, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_DATAPATH_META, 0x0020, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INDIRECT_META, 0x0010, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_LPAC, A7XX_HLSQ_STATE },
 };
 
 /*
@@ -226,7 +226,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pre_crashdumper_gpu_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'GRAS', 'GXCLKCTL']
  * Block   : ['PC', 'RBBM', 'RDVM', 'UCHE']
  * Block   : ['VFD', 'VPC', 'VSC']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 196 (Regs:1778)
  */
 static const u32 gen7_9_0_gpu_registers[] = {
@@ -290,7 +290,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gxclkctl_registers), 8));
 
 /*
  * Block   : ['GMUAO', 'GMUCX', 'GMUCX_RAM']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 134 (Regs:429)
  */
 static const u32 gen7_9_0_gmu_registers[] = {
@@ -334,7 +334,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gmu_registers), 8));
 
 /*
  * Block   : ['GMUGX']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 44 (Regs:454)
  */
 static const u32 gen7_9_0_gmugx_registers[] = {
@@ -355,7 +355,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gmugx_registers), 8));
 
 /*
  * Block   : ['CX_MISC']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 7 (Regs:56)
  */
 static const u32 gen7_9_0_cx_misc_registers[] = {
@@ -367,7 +367,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_cx_misc_registers), 8));
 
 /*
  * Block   : ['DBGC']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 19 (Regs:155)
  */
 static const u32 gen7_9_0_dbgc_registers[] = {
@@ -382,7 +382,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_dbgc_registers), 8));
 
 /*
  * Block   : ['CX_DBGC']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * pairs   : 7 (Regs:75)
  */
 static const u32 gen7_9_0_cx_dbgc_registers[] = {
@@ -396,7 +396,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_cx_dbgc_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 29 (Regs:573)
  */
@@ -417,7 +417,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_br_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 29 (Regs:573)
  */
@@ -438,7 +438,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_bv_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 2 (Regs:7)
  */
@@ -450,7 +450,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_lpac_registers), 8));
 
 /*
  * Block   : ['RB']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 5 (Regs:37)
  */
@@ -463,7 +463,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_rb_pipe_br_rac_registers),
 
 /*
  * Block   : ['RB']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 15 (Regs:66)
  */
@@ -478,7 +478,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_rb_pipe_br_rbp_registers),
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_HLSQ_STATE
  * pairs   : 4 (Regs:28)
@@ -491,7 +491,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_hlsq_state_regis
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_SP_TOP
  * pairs   : 10 (Regs:61)
@@ -506,7 +506,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_sp_top_registers
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_USPTP
  * pairs   : 12 (Regs:62)
@@ -521,7 +521,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_usptp_registers)
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_HLSQ_DP_STR
  * pairs   : 2 (Regs:5)
@@ -534,7 +534,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_hlsq_dp_str_regi
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_HLSQ_STATE
  * pairs   : 1 (Regs:5)
@@ -547,7 +547,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_SP_TOP
  * pairs   : 1 (Regs:6)
@@ -560,7 +560,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_USPTP
  * pairs   : 2 (Regs:9)
@@ -573,7 +573,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_usptp_register
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_NONE
+ * Pipeline: PIPE_NONE
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_USPTP
  * pairs   : 5 (Regs:29)
@@ -587,7 +587,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_none_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_USPTP
  * pairs   : 1 (Regs:1)
@@ -600,7 +600,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_br_usptp_register
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_NONE
  * Location: A7XX_USPTP
  * pairs   : 1 (Regs:1)
@@ -613,7 +613,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_lpac_usptp_regist
 
 /*
  * Block   : ['GRAS']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_GRAS
  * pairs   : 14 (Regs:293)
  */
@@ -628,7 +628,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gras_pipe_br_cluster_gras_registers), 8
 
 /*
  * Block   : ['GRAS']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_GRAS
  * pairs   : 14 (Regs:293)
  */
@@ -643,7 +643,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gras_pipe_bv_cluster_gras_registers), 8
 
 /*
  * Block   : ['PC']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 6 (Regs:31)
  */
@@ -656,7 +656,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pc_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['PC']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 6 (Regs:31)
  */
@@ -669,7 +669,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pc_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VFD']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:236)
  */
@@ -681,7 +681,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vfd_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VFD']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:236)
  */
@@ -693,7 +693,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vfd_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:18)
  */
@@ -705,7 +705,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_PC_VS
  * pairs   : 3 (Regs:30)
  */
@@ -717,7 +717,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers), 8
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_VPC_PS
  * pairs   : 5 (Regs:76)
  */
@@ -730,7 +730,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers),
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:18)
  */
@@ -742,7 +742,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_PC_VS
  * pairs   : 3 (Regs:30)
  */
@@ -754,7 +754,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers), 8
 
 /*
  * Block   : ['VPC']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_VPC_PS
  * pairs   : 5 (Regs:76)
  */
@@ -767,7 +767,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers),
 
 /*
  * Block   : ['RB']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_PS
  * pairs   : 39 (Regs:133)
  */
@@ -788,7 +788,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_rb_pipe_br_cluster_ps_rac_registers), 8
 
 /*
  * Block   : ['RB']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_PS
  * pairs   : 34 (Regs:100)
  */
@@ -808,7 +808,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers), 8
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_HLSQ_STATE
  * pairs   : 29 (Regs:215)
@@ -828,7 +828,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_SP_TOP
  * pairs   : 22 (Regs:73)
@@ -846,7 +846,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_USPTP
  * pairs   : 16 (Regs:269)
@@ -862,7 +862,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_HLSQ_STATE
  * pairs   : 21 (Regs:334)
@@ -880,7 +880,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_HLSQ_DP
  * pairs   : 3 (Regs:19)
@@ -893,7 +893,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_regist
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_SP_TOP
  * pairs   : 18 (Regs:77)
@@ -910,7 +910,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_USPTP
  * pairs   : 17 (Regs:333)
@@ -927,7 +927,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_HLSQ_DP_STR
  * pairs   : 1 (Regs:6)
@@ -940,7 +940,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_re
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_HLSQ_STATE
  * pairs   : 28 (Regs:213)
@@ -959,7 +959,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_SP_TOP
  * pairs   : 21 (Regs:71)
@@ -977,7 +977,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_USPTP
  * pairs   : 16 (Regs:266)
@@ -993,7 +993,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_HLSQ_STATE
  * pairs   : 14 (Regs:299)
@@ -1009,7 +1009,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_state_r
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_HLSQ_DP
  * pairs   : 2 (Regs:13)
@@ -1022,7 +1022,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_dp_regi
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_SP_TOP
  * pairs   : 9 (Regs:34)
@@ -1037,7 +1037,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_sp_top_regis
 
 /*
  * Block   : ['SP']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_USPTP
  * pairs   : 11 (Regs:279)
@@ -1052,7 +1052,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_USPTP
  * pairs   : 3 (Regs:10)
@@ -1065,7 +1065,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_BR
+ * Pipeline: PIPE_BR
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_USPTP
  * pairs   : 6 (Regs:42)
@@ -1079,7 +1079,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_BV
+ * Pipeline: PIPE_BV
  * Cluster : A7XX_CLUSTER_SP_VS
  * Location: A7XX_USPTP
  * pairs   : 3 (Regs:10)
@@ -1092,7 +1092,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: A7XX_PIPE_LPAC
+ * Pipeline: PIPE_LPAC
  * Cluster : A7XX_CLUSTER_SP_PS
  * Location: A7XX_USPTP
  * pairs   : 5 (Regs:7)
@@ -1117,180 +1117,180 @@ static const struct gen7_sel_reg gen7_9_0_rb_rbp_sel = {
 };
 
 static const struct gen7_cluster_registers gen7_9_0_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_br_registers,  },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BV, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_bv_registers,  },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_LPAC, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_LPAC, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_lpac_registers,  },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_rb_pipe_br_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_rb_pipe_br_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_rb_pipe_br_cluster_ps_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_rb_pipe_br_cluster_ps_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_gras_pipe_br_cluster_gras_registers,  },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_gras_pipe_br_cluster_gras_registers,  },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_gras_pipe_bv_cluster_gras_registers,  },
-	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_gras_pipe_bv_cluster_gras_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_pc_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_pc_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_pc_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_pc_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vfd_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vfd_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vfd_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vfd_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers,  },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers,  },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers,  },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_fe_registers,  },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers,  },
-	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers,  },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
-	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
 };
 
 static const struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_state_registers, 0xae00},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_non_context_sp_pipe_br_sp_top_registers, 0xae00},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_non_context_sp_pipe_br_usptp_registers, 0xae00},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP_STR,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_BR, 0, A7XX_HLSQ_DP_STR,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_dp_str_registers, 0xae00},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_lpac_hlsq_state_registers, 0xaf80},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_9_0_non_context_sp_pipe_lpac_sp_top_registers, 0xaf80},
-	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_non_context_sp_pipe_lpac_usptp_registers, 0xaf80},
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_NONE, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_none_usptp_registers, 0xb600},
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_br_usptp_registers, 0xb600},
-	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_lpac_usptp_registers, 0xb780},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, PIPE_BV, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, PIPE_BV, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, PIPE_BR, 2, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, PIPE_BR, 3, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
 };
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 9459b6038217..369b96d7f7c9 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -249,7 +249,7 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<bitset name="a7xx_aperture_cntl" inline="yes">
-		<bitfield name="PIPE" low="12" high="13" type="a7xx_pipe"/>
+		<bitfield name="PIPE" low="12" high="13" type="adreno_pipe"/>
 		<bitfield name="CLUSTER" low="8" high="10" type="a7xx_cluster"/>
 		<bitfield name="CONTEXT" low="4" high="5"/>
 	</bitset>
@@ -3267,7 +3267,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xae6c" name="SP_HLSQ_DBG_ECO_CNTL" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xae6d" name="SP_READ_SEL" variants="A7XX-">
 		<bitfield name="LOCATION" low="18" high="20" type="a7xx_state_location"/>
-		<bitfield name="PIPE" low="16" high="17" type="a7xx_pipe"/>
+		<bitfield name="PIPE" low="16" high="17" type="adreno_pipe"/>
 		<bitfield name="STATETYPE" low="8" high="15" type="a7xx_statetype_id"/>
 		<bitfield name="USPTP" low="4" high="7"/>
 		<bitfield name="SPTP" low="0" high="3"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml b/drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
index 661b0dd0f675..8d195ee5d284 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
@@ -93,13 +93,6 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value value="4" name="A7XX_HLSQ_DP_STR"/>
 </enum>
 
-<enum name="a7xx_pipe">
-	<value value="0" name="A7XX_PIPE_NONE"/>
-	<value value="1" name="A7XX_PIPE_BR"/>
-	<value value="2" name="A7XX_PIPE_BV"/>
-	<value value="3" name="A7XX_PIPE_LPAC"/>
-</enum>
-
 <enum name="a7xx_cluster">
 	<value value="0" name="A7XX_CLUSTER_NONE"/>
 	<value value="1" name="A7XX_CLUSTER_FE"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
index 218ec8bb966e..06020dc1df44 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
@@ -397,4 +397,15 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value value="0x7" name="TEX_PREFETCH_UNK7"/>
 </enum>
 
+<enum name="adreno_pipe">
+	<value value="0" name="PIPE_NONE"/>
+	<value value="1" name="PIPE_BR"/>
+	<value value="2" name="PIPE_BV"/>
+	<value value="3" name="PIPE_LPAC"/>
+	<value value="4" name="PIPE_AQE0"/>
+	<value value="5" name="PIPE_AQE1"/>
+	<value value="6" name="PIPE_DDE_BR"/>
+	<value value="7" name="PIPE_DDE_BV"/>
+</enum>
+
 </database>

-- 
2.51.0

