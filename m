Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C298BDFC5C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AF910E891;
	Wed, 15 Oct 2025 16:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4doWy8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003A10E891
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:54:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAW6sN002496
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=UMM9PuJ2lRpfyxHawkG9j4m1D9oD1iAKwRU
 T2udZ5x0=; b=Y4doWy8pxA9wf1/0BSOrHyAf3DfePZ+8ca4jGUyoLJmiBUbp8CZ
 8i70Y+H9FuS0v+f3AB57ieeQCFPDGXe3CAugvqO3U11S+zkNAbpF2P9SRDvTd7fX
 Q8cnvATEjS41o4WnAaGtdIZbWHu6hmNfgDjy1iEd+YW6yoEZx0LH7tGZg3xzSjet
 TAaLt84jgfOZcy7Fq/51Jg6fBnZrvvWYPwlGSU6IgC7knFGIXWMiMW5SfjNB9/fi
 Wdwwp3Bt+RVe21SBD9UBSwBn2f79LTEyqSO4X/6nRtvAnuobmsRsS/+DdwQYfhsh
 zjGohuyuGqSdzDqUaOxCkl5m1NdY15koKHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8dajp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:54:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87a0e9be970so395455756d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760547251; x=1761152051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMM9PuJ2lRpfyxHawkG9j4m1D9oD1iAKwRUT2udZ5x0=;
 b=jcMlD4e9H18UmuRK0lO/GKRD7LD9WVxYp3treT21AnhjIO6dvmKdo5izBExoHazXWN
 GcGZuxAxoq8078FkqRmFFNbTEzmVe0LzjrK/YtZz1KVeqGaNYJYvbkrx+4OvgFbL4RGm
 Tq+jK8yrgKFXu/8KVws44gpedjCGXRPsvY+2b3zc9fpOngyAQ1wjT6ux/azK/YwJyFgz
 1itY2djQTn42iLjFmq0jV/3oghCfgM9eSf6lwt3qPXmxXAWTwNIMeu4qyELZOBMqjtq2
 sqI6U4z8Q+9gsUuBHMIrlyW2mYPHwKhgN8XY1Tqz/14GAB9yclRD82hm8M6SglmJrKKA
 0VNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVATuYuIOG7NsUliiwkGp/9ONfkIVDWtEAQuwcDBDg9JqLfyNgCX71U4OWp1oILSPdht1AT6w+l8Jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJGdqD5BWU23dQw3YDGdKp0gITZuCzgFr6TijWO70YpetRG9b/
 R41oI2HKH0sHPnjzQs9W80wB+XM+dZar8xVU/feEigI9MYE8ikVCgUXESmqsufnbYxAKrppntom
 AZNqwqTXtyYiegSGYKsIuOs+7c6sLG3V7gQ+ipj0RCkEtsKTaQsTC8uR84Lz2PQtvupdiseU=
X-Gm-Gg: ASbGncu/C61CuItVMgw2BklysWY4wut+gKUIE8e14Y+IgHFb3kUyxXr7Rss0a2TklGl
 ye9ydEv960m6sXsNz+GCp4RTPRSzQYh+1eukFVCByu3cuhV5YS2lVTO25nN/p0AUG4iRCoa4adG
 +byMuVSCIRH/NbtTqDVdfETWLfPZqyKPqhlfWE01t7BN6fQv4KM7lbWYmGf69c9i5QEf0urqV3w
 AhzdT5djHEm3OMn04ufv5tuSetBwprL+Tan8MOVm9bLXwkLSQ9B+RX9nlBWkAzKivD4vZMEbnNn
 ZjyOI2iauhkFdFauDB5K04wH9RZYpO5M61Ubl4iLwSa5Nvvpt6kheQnNKqmNE1BYx3S5ICfgnqv
 VDJ+p
X-Received: by 2002:ac8:5905:0:b0:4dc:5ab:6d7b with SMTP id
 d75a77b69052e-4e6ead65026mr360871721cf.65.1760547250507; 
 Wed, 15 Oct 2025 09:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdnfbBlKzfjih9LMH5x6zwOdq1Ehq7XA62QcL8Ycn259PSie/gSkvXaQIk9+WUoeS5VTiJ6A==
X-Received: by 2002:ac8:5905:0:b0:4dc:5ab:6d7b with SMTP id
 d75a77b69052e-4e6ead65026mr360871411cf.65.1760547249913; 
 Wed, 15 Oct 2025 09:54:09 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccd6b9596sm270960566b.80.2025.10.15.09.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 09:54:09 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Wed, 15 Oct 2025 18:54:08 +0200
Message-ID: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oeW8tWtwNEhp0vVrMQxjh9T-XEo0_OfB
X-Proofpoint-ORIG-GUID: oeW8tWtwNEhp0vVrMQxjh9T-XEo0_OfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXx3Z0pgWzLnG5
 92YLFKrO/++P/+QmWSXerxSxrlhgYmFsj3VxqSaDgOGeiseA0GbM3d1n31pvOsvpRlLAC7SfDWT
 t6HrBt78Ky0+OxtgKaHfU5lpue2FI9W0PT4s2un+baRqL9cSZYp6NFFmoAB4KOvLpvrU85S42wd
 IUcCpRS3Jje7ud13fP6g6gpKTXzuMxPkMgVlbuehh5i0ntQPIrG77pYhLZsY1qlpkny5TxCRYwo
 cH1kQFZwwSOn6qC8vPkfGKQm4NPrEw6FiD0htxWxZzLK9eXZbug1R5lY3w6DXfqMSAuFsBeHOvp
 hhyHp7f37L33/oib8jRoyBvMtXMqIHsmGgrbJ3JKMpcIEUtisVIPUJCM/cnQpuvheQ/Cr+m+SYr
 nYMKdfkEuS/VdgOBfDxYNCKrXy52Qw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68efd1b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HRjgDChM0F6sfIyO2f4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
Changes in V3:
- Remove the min() to min_t() changes
- Link to V2: https://lore.kernel.org/all/20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com

Changes in V2:
- Use explicit casts with check_*_overflow() calls
- Replace min() with min_t()
- Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/sahara.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..351348f06755 100644
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
-- 
2.43.0

