Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKsuB9z+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A141380381
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C610E362;
	Sun, 25 Jan 2026 11:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqrwAWTS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2Kcvfmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A5610E362
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P3Mgn72842100
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=; b=ZqrwAWTSQABX2npi
 TVIHRRRAO64dO8G/rheiBW9cDNHF+Tt3eW0tjfIPQfhQtjN9wCkIumkHfhgBdHo5
 3xGpFhJYsGZsmRVVV/hayuQD5N3Pejw6g3FYJ+C1tURa/x5wE96/6gLZpp74HbcR
 u+5nh0G2gbKFn+WSC0tDRC+osTk1bhrSTuO2Z95iWpKyRHT5glW3FzodXo61advE
 bKq0JnqxjNAfew6LySMuJ/IE3+uQxXVRTNApunhfLnRqLKAYiZ2Vqze0FICkL63c
 gGli5QmgDSsEvWrOt26g3I7/Q+zSHIXJvvV682Wr2euf9UjtlOrPQ4emV9hlKU3V
 CJRRQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f210v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb9f029f31so1320057485a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340628; x=1769945428;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
 b=F2Kcvfmyrt6o92Jv7AsKNyIH6x7M7fTSN89nbGn6X95rHRoEbJ+eURTQyaY/lYbdOS
 IkPg17zwIUc7Vuk5hA9mH7c0qPaMhxNSzCgQ+5TtFQ6w8xkZqiZtsOIO1MzltZyG5dT4
 MP8fRqk9sqcNVxkDU5torVaC13EkaGvcErjIH74CQwI4M/C9+mWMn2ooy9qa9A1OnWLj
 mwpB/cfK0oh+sLDIh4k8aCjUd+EwIxKJOMzIV0lPvki+H8Ied2mtRCCJDDwHosSfTYI/
 FqT1QkwDPgConSZmeByb605fkwHd8OHzcDMr/rwHYS3DoUD1Mso77SwgrKBcrcD+s56O
 vy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340628; x=1769945428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
 b=Shwfbahqp3HhSOftRWvzjH24CmYtZLg2FsNFbyw2BnDAypQ7HbIKyQ2/KMA2NpRbMo
 RTVgogkcEZTpg/D6Mr/H/SLGLit1AfZM3WH+c00Ny56/RLw0ND1wkYWc1NpdewcnSSi7
 CZP/uHEpOb8crTGIPjDrfrMdByxJVOVgNk/Mxd8UQCjOm0mGGAHZWVItDimerChnQQ4l
 53YMARVAfn0L/Ly50DAuOW2LeBv5q7lPlfDVaNrwgNBuQbZAsuu29Bao+PlPnRXdRU30
 ZQ12XkngnS7kJIE5OSv0VzBI0VBkERAVuSNfVsmjeKlqVnKJ8E2qAqdgaRkXDewkUFvU
 EZDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyAgKQ+pDcqp0k/QjO7DqcYDhN75RF4ppNSmBos6HsfmYhDef0VJYVUor8a6sMMpm+k/fRRhMSHgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyLSPfcoJ50yiUVOuxczqYG28iznXoTBrZHWrYglkKtkAkNn5I
 tm/2dZ0RmssTTTxJ1ab1FrTbh3yZ2IW0BMXCEajICTuSG9MukjbJPaDKLakHNR8F4F6BYISVQRX
 b652goWFuBcv1Tb/4NacTpPEJpukY+GCxqzG9lIGCOKnf5JPKB7fIQHeQbl+ol0PaSLzXL28=
X-Gm-Gg: AZuq6aJ6O703TrRHeUdKK08Sj4+ifw5krrGdXkgkUFSNWiJs1/3+SqlN3SNq0FE0IjY
 HpWECUqGFbZh+fTLIxWrFvKvoOXpk6Fwzd/HhqCNyZFrCAQvdMgywYnCIN6yhxq37OUlCxxtZMi
 wRBJ5PLnaEQytUXfOAX6CTeM7uahcdbMGwB3QXKcGjsIkc1FsiBNt2TbrcbrSyyvGrf7+SGsuMy
 bKM3lncFl8zMwS6YAsG2jMI4aEHjtv/IRvzWQB6wu2eBNDjEkocwaEgC16ntT0Sqm6FZWc2aQQ1
 7MUbXTYxu/5IxtQLXsiCL5MtSKA3pyYRwmgSlrgpIL37x6w61upiwqUv+YIDKPjv9avPAeZCviS
 xyBC48wVb5WTPY0hfXFT5M4ZbX/VA8xitEL+pA/suZ7l0sADz8Vr6fHpyw4+g5vapa0hloE/p11
 ZNDI3rdgBMsMnvdzB1g5kKM2M=
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id
 af79cd13be357-8c6f95fd92emr156262185a.28.1769340628078; 
 Sun, 25 Jan 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id
 af79cd13be357-8c6f95fd92emr156258385a.28.1769340627680; 
 Sun, 25 Jan 2026 03:30:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:08 +0200
Subject: [PATCH v4 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-6-1ff30644ac81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/r+/CRSOtjlesB321W8+/NVuCWNV5b7blO
 3tD6mjH262JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UMeCACfr6fMyFR/w1e2kdiDjfvPQe/y223f1zEgA73d6AKI50kP2ZsaBhG04vLvbeVPTzZdQzv
 ftfQdeTefNyGINHx3JGZaX2evrbO2fKqgIAQlYUvmvpCyB9XoyKxgpIPmAr1VjKAxRKPugxxW0Q
 rgGGaUDtSRlhjpMJmO7TDFGanZK4Q00jh4OprV9iM3qwhWGCldRVI2N68bR3QOVoHT7s3j4VruK
 aodCfVgHUClwmn33Ad23lKsNGaIfPKi9WKfLMsFT4qIlCAzQnYwQsBdZ5OSfeTVecqQ0g1yq/+D
 kjhB3WEiz30ELAQL5J/Q7KCz+A5wRoERB3HoDGvxSBZqpC9K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6975fed5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4H5-pPW84uT1T8hsIVgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1eRt6dMVCoaM-aQZihZkfr1r80XMY9Cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX1CGquqYsCx45
 EgJ8zGFonhOqI5D+rxrSDc5saeVJr5SQa3KQfYYsTQ5NHElSyByxTeeZ0ioDJVkXUwV1k6XkdDD
 ct5onOpC61Fd2+G0MOyNLK/JyJgghWmnGe5ihgl5UL5JPgJrb8lu8RGJtjEwjFqThOri5fet3dA
 UWaIbZzylocXxjM64mVtm0usr5HaId11e8a+C9aCPl+LP7BRLTgJjHapFEncpmB67yVrlo/gwaP
 /cU3zqfJgRbvT6Wzovzx0+leND6Xuw1wUEjx7J6PH/FmhrC1kHfcrTT3GJMVgbPqRQ60YWmJENk
 nXLR0eGFSUo4fjeaDfAhjruSb2UCYjuKBIJcgepa5rTCE0Wyk6029MmHn7R/Xadywfab0AJbi5E
 nMTw6eHgN+MCc4vMP4FbVGREmvxjKVxPRU5TcJL275Bc8YYPTRlHLO7KjijBs8DCYgsugqXA692
 Y/b0vl3XB2nCvgy1EMg==
X-Proofpoint-ORIG-GUID: 1eRt6dMVCoaM-aQZihZkfr1r80XMY9Cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A141380381
X-Rspamd-Action: no action

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5639eb5a75b6..e217f15ef028 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,9 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index bdeb92e0b7bc..8072f430bd26 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,9 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3

