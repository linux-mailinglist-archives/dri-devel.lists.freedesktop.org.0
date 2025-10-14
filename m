Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE623BDABD9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 19:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775410E22F;
	Tue, 14 Oct 2025 17:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbTfr9HC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A679C10E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:09:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFS4v7006274
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=9/aGIvQBh2tgVTJBx/k6X5qPb12sbo+I0ay
 iwi1WVb0=; b=JbTfr9HCB77lwiJlMPZUendaEQ4Nh0o6NR5n99i9YgA+SBB7NwN
 fzxMvy0hDqe9wm7cV/iWekLsEX93t0/sLyTMOjs4FwHn60PWphXtaekO2mU0sX2j
 YfTt6IGCg2avMlI1vs9y8RB/D1ZeaD+vty1RuseNBoB6lsjUDa1wu9SPVvfdNPkD
 w/QNQLywPU3kqBniiQG45ABDhQYM63Fd8EUDVTdfbbThx4P0Xjjf8Zh1IdT1M9l1
 vTj4XDA7Dm8vvJ98NVeRYDzy/bUUDV/SPJe6CWdUBX3twRZaUX2YH44XrDtegGTd
 ooK3t2o1J5lQJwdr1rPWMMcYNLWeL4TZUmw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj1ckc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:09:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5d5eb99cf08so14870324137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760461769; x=1761066569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9/aGIvQBh2tgVTJBx/k6X5qPb12sbo+I0ayiwi1WVb0=;
 b=ukthgB9DfkcWq4VLNYIYNAbtByCwAjtSIkwT5UepdXx8qKVaz0u4GRwoHrjOvGb3zq
 AW2tqoXlz0JYyc7vrBwVKaTURTIyjoELDgZOiD7od8XiuZUvRzgGd0bT/Z1zUbLER4++
 zH86R18yHVwZBhxBkGENX7/OjoJU0uh+CNs4NzMgovW49zvaoJWg3E0hcrXKGm5eiByQ
 Gv4dCJGi4xw1CgEHMWgdKb7MoDJ5Xj8i9Hfrm3AcYH4N8NCyoeIF6ArLKwfrCK4x2vDU
 EObozYzy08QsGuPvGYi1kbYjfT/Om6az+KD44OfGgHqQTQgVtUID4TXAPivuXpgH3LI1
 f2SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdeVJHJuJMcZEp2fGz3xi8+c+JCZDfwaMVr7YroQd9mWY0k0eBBhZ2EjwzBPrNdK/JlpdFAbs0RWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgHWR8Qj8slCI4jRhgX1QJwh6hA/j98csaQVPjM2APKtYlc4Xe
 oFFZe9ie0LbuHeoam0jguBY+KsNsiBnX3SqFYQHYBK8bp4EouR+/0GtFSeQcYPV4UVdELooy44U
 RwZUEHLGdgooVO9kftmQLo89HDi4pAdMwyYl+agEGV2reqjeSDfWcQ4A4R1mcXFwYv+OmRjA=
X-Gm-Gg: ASbGncvsxoOgRRmjSqYr5NKqIrA17phNNRZepNsSQOHVuAwRic9shRk3IzbCWjxFoCf
 tEgqkA/tQ6i9EwHDNEmohjABD1YOGKSlQqKlKHPyQqanJBcb/twt2lLFmkMaXcsREMs1mCJX0kD
 eQzFFim5MTOYINW0utlvJcPMfYOjKnH5n3IQaZ+QOqLPPVCSw9rt9x4NkoXTNYQrG4pa+NmYUxu
 Mw3OGm4muoHOdgw2s3Kqrq5mWVyWdYubcRTUwV7oCsgiKVoeZyH2e0R2zBy0ELPP2D0RaSuEWbV
 sI3p2LcLFRUKc6WkgD3fNMJhH7tRujYlp1Nt7HLpJmqEXX1KRhOtMuHvdONAGue8UqfcuLBrffy
 /XD72
X-Received: by 2002:a05:6102:1492:b0:5d6:2bec:755e with SMTP id
 ada2fe7eead31-5d62bec9904mr2583461137.28.1760461768777; 
 Tue, 14 Oct 2025 10:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXAfETHk/CmL+i87ZoiPrIrtzgvDwckjo6RH7ob324bDEk0qZkd9yIqKWCVtoEhfHJcvnN/w==
X-Received: by 2002:a05:6102:1492:b0:5d6:2bec:755e with SMTP id
 ada2fe7eead31-5d62bec9904mr2583447137.28.1760461768317; 
 Tue, 14 Oct 2025 10:09:28 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f358sm11452431a12.10.2025.10.14.10.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 10:09:27 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Tue, 14 Oct 2025 19:09:27 +0200
Message-ID: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX++I/gy/pb5aR
 NXJmdQXieg7QSOpCBLr4chfdJsOmDaGD7gzQydtWa5XaMVqM0kG6R9kuAeW2+igqmCfB4k2Wozg
 us0K1wzFffuUvEXRwxC/0zookwggX4G+1CymvRLiJsDC8ty55+Y6iTN4aVxbvKm2j2digsKXkDB
 D4kt7j1if4iApyiwTyqdsAueFTAmn0jOZUhtusKwJESMrl9eIcxBaoJ81DcB3R4nWYpeRB8T6u4
 /CbvoQm4D18R3zouhb6FPXoaYPL3zhmmh7aZtLJtf8cfq37gwog0kHsJmm6rhE9+P7EGsMTj9pl
 A9NOVIJtyAl7gD/bkdtntdL6Bk1jbBSpD4tnaa1t2UPrrC/KXsXaOUNeapsCXu+hyKNIOWoQpIo
 OZ3W8NO/X+0e0KuZd+kmQQ4jwHT9vg==
X-Proofpoint-ORIG-GUID: di9thyL-ZflMKNKjcYZcXlJBcU1KQo05
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee83c9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EJfbDqG2qL1ptMKNElEA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: di9thyL-ZflMKNKjcYZcXlJBcU1KQo05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Use check_add_overflow instead of size_add in sahara when
64b types are being added to ensure compatibility with 32b
systems. The size_add function parameters are of size_t, so
64b data types may be truncated when cast to size_t on 32b
systems. When using check_add_overflow, no type casts are made,
making it a more portable option.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Use explicit casts with check_*_overflow() calls
- Replace min() with min_t()
- Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/sahara.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..0591faa25e00 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -538,6 +538,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 	struct sahara_memory_dump_meta_v1 *dump_meta;
 	u64 table_nents;
 	u64 dump_length;
+	u64 mul_bytes;
 	int ret;
 	u64 i;
 
@@ -551,8 +552,9 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 		dev_table[i].description[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
 		dev_table[i].filename[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
 
-		dump_length = size_add(dump_length, le64_to_cpu(dev_table[i].length));
-		if (dump_length == SIZE_MAX) {
+		if (check_add_overflow(dump_length,
+				       le64_to_cpu(dev_table[i].length),
+				       &dump_length)) {
 			/* Discard the dump */
 			sahara_send_reset(context);
 			return;
@@ -568,14 +570,17 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 			dev_table[i].filename);
 	}
 
-	dump_length = size_add(dump_length, sizeof(*dump_meta));
-	if (dump_length == SIZE_MAX) {
+	if (check_add_overflow(dump_length, (u64)sizeof(*dump_meta), &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
 	}
-	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table), table_nents));
-	if (dump_length == SIZE_MAX) {
+	if (check_mul_overflow((u64)sizeof(*image_out_table), table_nents, &mul_bytes)) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+	if (check_add_overflow(dump_length, mul_bytes, &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
@@ -615,7 +620,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 
 	/* Request the first chunk of the first image */
 	context->dump_image = &image_out_table[0];
-	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
@@ -663,7 +668,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
 
 	/* Get next image chunk */
 	dump_length = context->dump_image->length - context->dump_image_offset;
-	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
-- 
2.43.0

