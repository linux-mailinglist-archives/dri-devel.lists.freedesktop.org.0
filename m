Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86E7CCF118
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 09:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE82410EEEA;
	Fri, 19 Dec 2025 08:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0lLJabq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAe830eQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7141210ED9C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:58:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4cU5b3700913
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Tvyp/AmwSW1CvZSmgTm8pY8m1F7QTDycgR/
 F/l258Ms=; b=W0lLJabq0zdpb6yb0M0srQSrSenneNgg+3l2hfAp2jnZ+LYlpUH
 zIaIqPcFhXaF74BFMu2/5QLkB2pcfM8mcGsMbeLCaNO2z5SEnaH4FZslm9KKxJFr
 jzMZm4J03g2bmbHCoBoPdKQ1/VBj6MusFkV4w2aHkoIaKjZzu3Fj3vAlX4/P5qSF
 TMAujzadzEeKIQ9eAp4x2zlY1Zo/9/ifWVGpYz/mKvbEoSP2Y6ETURATb+y4RDoF
 AK5Ii4aU37EFBo55wkf3zk9qbr8DIQIm8dQoapXixsYLJQ+ms4YL6YlR+sBr52Fb
 kWC7ulyKaUbZuX5Gjm/7+Q49EZY5c1cJwZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ehxm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:58:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f35dcb9d4fso50255611cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766134721; x=1766739521;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tvyp/AmwSW1CvZSmgTm8pY8m1F7QTDycgR/F/l258Ms=;
 b=eAe830eQkLfP+AuE88SiUwk/lu4TFGi2O5vehdwamc+E6vAzY+LkC/y4R3S9MysMzl
 S4TzN5Qclejc7dUTYledjmSbJSpBPcS7qiPVs2+gYbILdU/a0gu5MKzXPu3ZZPkAB0PJ
 tmAD6cbUjTtatLeAwpdnXCdZgNmf2GeWpdthSUtpTFUXHfGbIWIujyARuf4sfSBrA580
 emIN+/irpKegi4/616EPQMsfdkFEpfnL3Fh8oWFRagZcgXNMbHLRZFROqOA9vrgvA6f/
 PWKWOTm3KHGEd9JglCKmm7iCOYrI0h8TYjlTFfUWl6PH7FOtPeTodVW/WCKTwgJCaXTS
 UrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766134721; x=1766739521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tvyp/AmwSW1CvZSmgTm8pY8m1F7QTDycgR/F/l258Ms=;
 b=iK3YXo/d7EZsVIq1O6+d7JRxERSZ8k8eTOAb+VsYQc2v4XtU7MolZC4mRxVs1jos06
 kBdFtbUjaWejmu+zedSBwgzQNDHSxkxuSzvzxawolMS31QZMXAU+oK66pv8dIYXTwRCM
 Diri9BMAlJ7vACdWIR6I3a25Ll+iDtHAM0ea/QWUX1R8onlI2O+/FY6uzjn/N1sPRx1y
 HRxbjBlK4+GeVJSNzngCAxDLZv9peYr2ONrT5Vg/2Zdtp23FIFrImHTubuPOoAxoXFmr
 CoT6ji5SQeSYylIrOGE18nXXarhF7Jk42woMiE/x6VcWD3S+lgsTyO6oVI4r5xMB+L4f
 mPaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMtViG7r8cJd/O8MSV7CeLwmGO5GycgbYQpBTqzGPRotE/jV64NghrsgyVPUp8OIQDhWWo2BUW+DY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ9h21bWKyqnZpM/qtCi5yIS7xCQny6iQXpDCEqNdzUEoLEhG9
 jJe43oXl+FX/AnMXagSZtDJ+33zPigEjKv8fO+h7mcZa1tFvkZ6bFwJvUlyaNyH20jWA5UsYzxK
 QuZUtHwHpr466j1qeIA+HWSBFbBcNe+9sbXAz/wn3HnQLYm/82CZ8VUGw3cVLRY7z19M2ruA=
X-Gm-Gg: AY/fxX4jo88mZLynyz2o1K7wSApBsdtfTv3xwKmUccB7KeZCe2kpv3SRZ7p2z36HCzS
 eYIFczWuNRB1OcSvNZ5BtjUI+pjDV+hOQ7FOOzBD53HMWAPjXwdlgo/D6ciTyHNcSWsphmp4o/Q
 ExstdwgEMOldeK0znYYkZzZuq/KK5t685oLhlkxntCfZiv7af2jAZ/HaFL0S44bAEDHbgaVirvr
 d8D9d6fUFTmgm+4Y/gxgWzcxxt8Xja5gyrtf26nzr75IFXz4ppKDhibOZy6h8OCL6V2ZR68fqNs
 6RZShi5Y3gmNOWcdmWSDWyEoIiuRAV2t+4D+i7qEODb5Fd0F+CTifC/MpGf3P0PGBHvEo4rBPX7
 lCDqiCKxBjp+X7oN8NQGtznV1N+EE9IFfpD69KZn+jyOL8f2eCT3IFSzuaM7OxJPYwgvpEG+g1n
 LJuvg6p6r0ZcLXziayhDK+AafG
X-Received: by 2002:a05:622a:6982:b0:4f1:b3cc:2d04 with SMTP id
 d75a77b69052e-4f4b45ddc56mr400851cf.44.1766134720829; 
 Fri, 19 Dec 2025 00:58:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcFOWgRm+377RZGNzz98ENNnPnojItHEvYN8dZfwyAyiVdtqZZyByXIq0fXvGlVbRKoeSDzA==
X-Received: by 2002:a05:622a:6982:b0:4f1:b3cc:2d04 with SMTP id
 d75a77b69052e-4f4b45ddc56mr400741cf.44.1766134720466; 
 Fri, 19 Dec 2025 00:58:40 -0800 (PST)
Received: from shalem
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b803fb79aa6sm76475366b.31.2025.12.19.00.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 00:58:39 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu/drm: panel-edp: add BOE NV140WUM-T08 panel
Date: Fri, 19 Dec 2025 09:58:38 +0100
Message-ID: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1w_6Tuxs7PbWV6SBDbkmRC6GvFrIvJ6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3MyBTYWx0ZWRfX0v7pVXwU0yij
 MH4IEnwndk1rJKVsq7MmL1cYk7eXeC5oYmi521t8LneS5Wz9y6LTLpRD6/jqxZB0M1syvSNPC39
 XhCtArUOHb0g0kZqAQo//iyCJDC7Umg++8RP1Ip1ChZwvzxnrvXDHoBTJhHtXAhK6FZ9OZO8huK
 BWBIQqBWy/BDuu9MXqAeLLWy7NNFdr6zWETjVqEnKatYZ8ZeZs6yBd2M2ZZVxeOGtn+YgvSkbpq
 6nFNK2tpwHaBFMGie22Y95nTyZwmyYeBWmdsdrcQtfqfGWeQDZF1U9N4A40vJEdZVJLg5WpZ7dz
 1aloSeuHHFCqug0Hy2fXR194fwOoUdB43yD3Egt0LwQZnNWjhDJn1Ya0olMa9Cjqzkl5s5XSgTF
 fz3ATsIsw/4o14u0mTwBaTezpQPeh2MlA6D8ArGhp/Wib501Ay8hBcx6fM6WRujB9CdGLHVGL5S
 h8VXcLDrwmVGne7sm/A==
X-Proofpoint-ORIG-GUID: 1w_6Tuxs7PbWV6SBDbkmRC6GvFrIvJ6v
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=694513c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=bhLjP5cL-QquzIq1CNkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190073
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

Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.

edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..7b8e5cd41594 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1730,6 +1730,12 @@ static const struct panel_delay delay_200_500_p2e100 = {
 	.prepare_to_enable = 100,
 };
 
+static const struct panel_delay delay_200_500_p2e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e50 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1975,6 +1981,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
-- 
2.52.0

