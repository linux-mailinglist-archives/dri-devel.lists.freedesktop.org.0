Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A3BC1FAD
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B6E10E6E8;
	Tue,  7 Oct 2025 15:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mratWkzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B9910E6E6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:48:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETOI7028050
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=c1qjRY3op/gn+0IA/O7osTr6HSBwDe8NnsP
 7uHQvcXY=; b=mratWkzFMolEnezgEQ82zafjGcVNRzkZbXXyEON0A/UyCRnbgVu
 J4eb/p4Cqnz1qsFLQu0tQtdEQnaOzlmY9hg0N2eyBmrToxqCVawCkiHS0RtdgYrb
 yoJYZmnyj5iAG2hAw2R6OfHZlE7kDHD9vk2wKI/m8kVJA/SyFrlYM1vNJz8Mbt0J
 MqxRZAq+DHdWTrdvmCC20H04PYCur9jpwOvYyuJer5dLyOLBEqrTY9IgoRksc3NT
 cSYYeqbdKul0MUKRVRgL7mTX/4s1YWVABkvNA+KccI13HW2osJKWEg1pPFwBWMit
 WA+rn+KbAxGepArRNpDHd7VpvNeU4vxx6AA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0kgph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:48:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0fcbf8eb0so159539641cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759852138; x=1760456938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c1qjRY3op/gn+0IA/O7osTr6HSBwDe8NnsP7uHQvcXY=;
 b=Go20/8RG9I1mDSDQVsaBCqAvbt6JYHLA78WvC+zPVSoIHbZBITPCCY+0y+MTixkDAh
 +mKcJx2V47lVZfWMeH5LoAgH082hSQPArJwz9XD+n4RqAOS63aF9lsiZi5OKoax57hXE
 v9tYZwEZI0DNatDa+q2uCKGVsc17eHQgSP//SFWW8pibTZXCpoWKkr0ceEgAvUUUgoOH
 K39wLR5vF3BoQgXsERpi7vrg6eM6/eOLFoRVS9R7BpKuTP3HIcyqrts67ICai65tPR3p
 d/Ts6wRa3Frono2U0T/xyvx3FnoIwPLJXVdmR5repcNcu1nPRlHr41Kyp7QUpqBE6ZHY
 /CRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuveExvjFpzIx8JY1QIoSKIAm1P1jUvx2sTfwWLXhEidUFQKdMibBykYhfOYpB1VPMMzpQY37QjSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmByFsKQ4qSaG4jd2baGW3qwqgAvZy1/dLobeDTKKAfwDtMe+C
 qm9f+Y9qTRj0EuuEB1d/R14s+el6IuDeEynnElCn1FKNzsIgEcKvvZVed+4kz3Tj04u9Esv4unX
 1HXc1UQ4z6Awh+K63AIqFRoGKt2h36UZTzinT2H4TUZEOXRU0xIw99wrPeq+PHGDHe9Ux0Uw=
X-Gm-Gg: ASbGncvXXqoF9W1SQk9JjQqKAMlIexRLI+iBGMJEYUAOr0AZFWhNIU6PtVNhW5hlkLx
 a2keQSZW+fK9kcudUY06iqriOcloC17q/rC+kPRO1bVry0XMR9V+QrBpZ5Zy/MQfCfmBGyiH1A8
 mYxCOSTBsCw7e0Snsj6xeDqigXKZ9mg0yVnaYXPCymME5JhViurI5eOCoDXq1V3vcN5Rq/ggEG7
 QG02PwrW0GvRgYYtLoe4K6NsK/d1bEVAXvBv8y6vriTlJBD2mYfJdGvNlM8lwmHPRT7KudbXMtm
 TU/vOYZWW1imT5gEGTEfdemWrAhvmHk6MC+2NrUyD+tOe/84NAZQp2sZl5XEud7jquznoLcBhfd
 VmaoUaFFfAQ==
X-Received: by 2002:a05:622a:58cd:b0:4db:7bc2:92b with SMTP id
 d75a77b69052e-4e576adc4d0mr257098511cf.42.1759852136907; 
 Tue, 07 Oct 2025 08:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRAe8BoC+LGCEdh5x4KPB9T7OtWd3E2I/TUO6+zj8+KMfcpjopZ8RHzlCMwMHMOajcgRmY/A==
X-Received: by 2002:a05:622a:58cd:b0:4db:7bc2:92b with SMTP id
 d75a77b69052e-4e576adc4d0mr257096581cf.42.1759852134856; 
 Tue, 07 Oct 2025 08:48:54 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b32bsm1457499866b.50.2025.10.07.08.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 08:48:54 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Tue,  7 Oct 2025 17:48:53 +0200
Message-ID: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0GXX3UqbdSo0hpBi_nERnI0rz-h6NckH
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5366a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tuiY0EAVXOpYqngSybMA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0GXX3UqbdSo0hpBi_nERnI0rz-h6NckH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX1LuL8N9I/MuT
 WadzsRy+FugJtmgSJlRptZ7h0YAgF5D8yg+ae7gAfdmvoOMcy8DTF1PJSR6T9SYax7DBLF5YnCp
 YbWqGagJQrEBoqPbLAsefye3cCFx9np/HYXUHG3xikyztQsrj0NREbh3jYlpGvLUWG+TcR539oN
 Xr8kQzM3q5gkwIC6bFUZh6RTtBflA6l7Hqh1qOmrX9kfDJSOI7x4aaGEmvO3o5HRvByBSxMg5AC
 Tur9sMhMFM27JOXEls88YfA8OTWog7DfWKFiKuMrdYwn6n+Nva2LWOJIOqRdNW9Yu4fqafxJIFu
 UxENZJRzoKVF5iBge6vlD/2o6UK99FbIfKir3RzcOPXiSKzFFfiHfQs2pMxlM2yeZoKT7/+vS7z
 ngyI0AfFxVplsOuQ+4dlwtanm1aoiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123
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
 drivers/accel/qaic/sahara.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..9765da1f2312 100644
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
+	if (check_add_overflow(dump_length, sizeof(*dump_meta), &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
 	}
-	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table), table_nents));
-	if (dump_length == SIZE_MAX) {
+	if (check_mul_overflow(sizeof(*image_out_table), table_nents, &mul_bytes)) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+	if (check_add_overflow(dump_length, mul_bytes, &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
-- 
2.43.0

