Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP9EJhwPrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4F22B7AE
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4248310E3BA;
	Sat,  7 Mar 2026 11:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WekjT8zM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDzMi/l6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7710E354
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6274ltEJ1249902
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=WekjT8zMSpAi5+2F
 NOC5OFX4Hs7Lvw67uEwHoXkTlsSG9brO0irqbmk5NV+pK6evVNNk31KGWrOem33d
 lwy8sOLdr6VKl7gUlygdv/+fsJXXiNHrea0cqIOeMe9ZzIiGtE14uJZP1sYtBDTk
 a9yK+cr+GE9TsHDNzE49XRpZMM0FUU1R8C182+F4yLpw243CUPdPb+cUYR+XykkS
 fKObjn1Fvl1V9jWgXOrBWiv7XAactbecX84059nCJ+6ebDoAcvltOSyolj7Ya3pG
 YL9wGJO33LUEyBQdHuEPqFIXJttvP+lG68vka83+W9yZA/YHMG0sfnFf7tdSQXJB
 foSrtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda98j0u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae57228f64so67097215ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883735; x=1773488535;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
 b=bDzMi/l68ct9+GX1XvdiINrNzvobUdFiz/TC/8Sn+nv7ztRf7FoDdw9Hds/xJN9nus
 mIn1tXenq4dETTqybFSB45QOJQ32+Qa4GAvZdRgtuJ4UH21Eju6bL9O9F9k+Nqqbnhmh
 GZs5m6nHiG5PbZCh5NxItJCDWVOXQNwt+b55I3BrvaM/D2BXVXjq3UZubovK7CtkdvPK
 7VAlBWXxIuBmg69CCv66cnU2vZz2fHEYGTigmgmtVo4uWs+cEQ77CUv/k9qe0YDoU5pN
 GASVkLscUEVhuDOoYjr+WGO2FnDvGsA4XzGgD6dMcHse/6mztIRsz1ehmzHOjpw43FlA
 lrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883735; x=1773488535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
 b=YZCw6KzjaJDdee8xJVt5TzH0DNv2X5/e6J/fw3OQduWhZMVE9c8t7kmyp1lNEqz0tH
 g+ezavH2dhW8pu0haWj3fJ8JSFLmaBE6QWJ4CGk1R227hcqXPAiwbJ3G85xdPawZHIvs
 k2UTt9rKnm7VEzUYFo3CInW5pY9NPhWIWjHIUoAmlYFEuzRFvfWlSTva56yxwiVFc5uM
 RckJkmVVjagZWbo/J/oEE8+6ExVhXB5NwpDJrtqKH+rvxfj3ne+0yXGaeUFMsbQlrvgh
 NcxjcBcN17rpOmwaGRnUVnrtWZ+6B3djTZu8YwVSk+4fue2NA30l+NTOmUGGs5dXbo97
 VLAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeR+9viv89nLptChslgK4z1JsO0za8zy+y6/efhiF+DfRDObMQABUF252pficBq3G2I7g8YwrjMfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylmG0cCU3ZzGqVeVZOAiuxuZpu46J1hzQlRkRqj4KKOcPr5lXQ
 dBsZJMNFRaXUt75O+Ayk+Cp2I4MLP6qQaGvTl7l4okCa/2jkKXcbsgon7/nGusnIMEZEzuGMQwA
 HbqrzIygINFJx8+lalHDnkDIFmnsP6ZjPON52eoQTgQOxK5oNFF6zbojSAA5QYF0U9X9qzfw=
X-Gm-Gg: ATEYQzyHXfY7ngYpvnSmod18eWSYLQ2MvGVK4+jk/Gl0joKPqAJGqhHeCStzkfuoPJd
 W7We20jlLB/EqonVkk/RvuTvwZ9zpKUJzpypWryXmpCDZjlmFG6FH2jDklIoeZ9ZcYHX4UK4w0a
 s8Broqkg65rNwzo1J5P5vIlCuj5tnUFMBVTrP6EqNIHCsbicDPaRCmlIRgLV+rHcuEARY2Zwxu5
 bk3UOUGGy8G0tO/KW0RYu8muNtyftt50/rQHxlg1w8roxZS02rV3e6JUoJhxfmfzTGqU36bMIZU
 XBAuiKNo/NHK96sd5USe7GrQSdV66dYyBUGxGHBF6S9iKBbYy26+W9f9OCFseC29fynPLCh2Kj+
 weZoVcojc2gbN3E8ACT3H+vEONnNviIxdMlG/bCJeLljicBi3J4s=
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id
 d9443c01a7336-2ae82398d80mr52195425ad.16.1772883735201; 
 Sat, 07 Mar 2026 03:42:15 -0800 (PST)
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id
 d9443c01a7336-2ae82398d80mr52195255ad.16.1772883734674; 
 Sat, 07 Mar 2026 03:42:14 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:14 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:25 +0530
Subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=AaVGqgpWF7eVrREnt5Y5EO03kCIUBYl4kZdPLgZDVTiiCm1Kho2b7UaZcoD4cMrp/CaoDgmiD
 nVWAvjGkYNWD1NS4wgwp5xWhVrRF461rQtmOaVvcy6WrppQya1xF2rq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfXx+UCmlRvmShX
 SSDFgTJGHy3uxL/1S9FEAP7bKzHnOmdCRBsC4axMfX/FRQYgfRfaDNDbXxKelOdbrPU3dLuv4yJ
 VVcrOr/jW2Gv6GPg+X+hgzJdl1zhqhMm4kRT1eQHJBCz8VSOHdX9beKX82/8t61Vf3Kz6YptRe6
 PYNVRQiQY+mt2BGmG43+Vmu2dF6twV1rmcI5Ese6qTSArH8jhCnWb4mr9LIPmEkqtLZK0/tXa6z
 f+9N9VovvhpYC74qzSp3/EJhGPKbO1L76ZQxQJcuGYjiawR+hVWrZiiRZpfnC/RQXb5C22VmyFT
 hU7rXxXHbCmRdhamC4DdS0MlhS5t6L48n3Yc8rztwUWmjqs7AEI2Zvd5q3aU4YNJBpir52qSHz8
 wYhfXxhxMrfiLoTFKXEa5vxbMdIvkMxvF9c+du2JO6CVNVvzq2fFEcaLEOxQCOg+bwLKm7+GEib
 x6kw9OmzQEHr2/fN6ng==
X-Proofpoint-ORIG-GUID: HfXmlvjh3BizmuQ3NsbDasf67yWSqJJf
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ac0f18 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: HfXmlvjh3BizmuQ3NsbDasf67yWSqJJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
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
X-Rspamd-Queue-Id: 4AA4F22B7AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1

