Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0476CF4836
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3417D10E259;
	Mon,  5 Jan 2026 15:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7TQd3qY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJVN/i8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB2110E259
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:51:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6059cn6S610492
 for <dri-devel@lists.freedesktop.org>; Mon, 5 Jan 2026 15:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=+oJLVBcbdzw6ywDggKDtuWpHTYQyHyIMvNK
 2XVlueQQ=; b=U7TQd3qYT2j6DkIWCWwzpEMpTSJ0iTQlX7BJeC0KJObhNqXqF+w
 5ZVZ9xRe4/txy1Xwrhi8/sKdwFiUxpqHrz5wVVAETwDxz7v+x/Wcl58ZSYd5j7Np
 fGVpuqxWXBWOfQ7TOD3vmBmLm+9S9OX8DLslIg7xzt6IlHIXHnpsv6d/z4DOEpTU
 qkkj5v/aSWfOWqJ8cz4q8QepnYpkTKIa9vyIzIdXbAFGYRBEy1EHEG/SIyTSG28G
 vaolz/RFHWZnfzxZFLJIr7JmezCKIwRqIlUP/Aqg2XIajlhEm5gulOWpA/xxpW4J
 tsytXk7IxsKWwfGZ9vZRSyvW35yeO/fY+fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0xmt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 15:51:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee09211413so582131cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767628296; x=1768233096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+oJLVBcbdzw6ywDggKDtuWpHTYQyHyIMvNK2XVlueQQ=;
 b=iJVN/i8rhyQKT3JmU1kfQBuE4Jl9bez1YJiGT2kpzPM5tLH/0Es7G/qGcohIlo8v08
 Gr2ThNZ6srLBnjTjJt9vM4VgmtGtOULWGAxW5o6dqOTeOBrYp0LfJQEuDF7PV6FMlOKE
 PHpuJqaElBzCgGKZQqw8gHQa0h8olANLqwPGOPpSQjuidnImQFQkFkiW5c6xBOz9z7o3
 7v798m765VnngfHyd4k3Iwp7Mus2WlCkrO/5F3tFYoCdQN9qIqY6HVpbXgmgZGAYxEd8
 t6zPONUeXkJNrJIteIPnvqn256r+q3PlZGuH9NiB8uLBWmo4dTpooxuooM+7ePfzbU3B
 X8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767628296; x=1768233096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oJLVBcbdzw6ywDggKDtuWpHTYQyHyIMvNK2XVlueQQ=;
 b=pipB7D5JzRynMiI0zTpP+BWApDhvgW9nl7gWWLZqJfd3WJnbxdfQL+iIrm16GDrZkn
 2GVpf0bKscRtTxPxRQ8FAnGHprCvgHSgJ8zSkhtX+ScGkz6orVN+lOeOgp9ze+rHNfVg
 yiEZtWbTeAsajSyIkYOt10Eq0pDKbKdK53opJUm3TZA2mztiGD/UmsFkoNWlPdGyGuR1
 vyK9LhGCNMwNddI/3czV1G+QtL9jj3LiF+XbKIqu+l1n7K4H/RbooGupIGWT7BJALh5g
 jX8zN6ejXujwkzBasXGqf1hID5qeIe6HbH1OMJAabInIVhnOv0Df7itULxE6X7lmQAF6
 GHBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg+IBMyuQXs03KpO9VDyE4+aiJBqiL5ag4xrIaYdArooUUM6rZVPWLZQdZXCdrDJ2x+TB53jWlhyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIoObpkZiEvsV4Xp95cZk9v1CCaWG735yWTgFmb+K2mKXxzPAT
 pU0FnIU1XfFxoTUsb0AavxWFMiGtJXVRA7TIXPZ4WNutW5/kUqYuGj2UUEg9s8KIGmS+qx6nMZl
 gX5tjZa65IJbHOcqVKKoK1dzbtL0LF5ygfsXx14wa6A97d4FRWN8e813yLpb+0H5PogML0Es=
X-Gm-Gg: AY/fxX5BkwEG8UTTltVJ+yv9VwKfdpjtZLNRlSwX4LyA2weh+IVFE9QcVDQeGGN4upk
 2O7rNHq9JrsrFEzGGDD0qy28MjQIDDH2xPPDuN1CsEf9X6DmQrR9NAy2bDHI/S20QdfpQyZhEEF
 4yAvLXnQxtyrKCZM/xn5Pga3IwLZ64oALjSrMUG7nd9k9Cv63phpTCqPG7AgP6EbkmYoHjg0Uu+
 6ugdCDiQMhIupfvxLLXebItzCW9LFs/l4q8Tj6tgUYbdpkQvi1ySVIK76e7mkWCQxFYQmd/ug+Y
 +PYlXXu2M9w4KJ82FuVyA60VmpFEoWLxVsglJkMgcgYg4Pf2+rnLAhQX/eiHF5J7HSb7OY6sncw
 nGnRHVSW2RC76OWXVpSYaay11pD6xETjcHErWuds7mMsEbEORj0aIb0Lj+E7IpS2x6eDNYQHhuE
 9d0bVopPiX4DFiRF/XpIQ9zrL5
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id
 d75a77b69052e-4f4abd0fbf7mr801986091cf.36.1767628296334; 
 Mon, 05 Jan 2026 07:51:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8cNREa6elc2YWR6fRye0D91+x/QYT9zwEypZ0m3WtQ0cVjG4Dej3saxftu4tKvR4scf49bg==
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id
 d75a77b69052e-4f4abd0fbf7mr801985721cf.36.1767628295825; 
 Mon, 05 Jan 2026 07:51:35 -0800 (PST)
Received: from shalem
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65075a240efsm126204a12.7.2026.01.05.07.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 07:51:35 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: edp: add BOE NV140WUM-T08 panel
Date: Mon,  5 Jan 2026 16:51:34 +0100
Message-ID: <20260105155134.83266-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LoeZj9Rus7ceV8FmLRywdUM_EH7WKzab
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bde09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=bhLjP5cL-QquzIq1CNkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LoeZj9Rus7ceV8FmLRywdUM_EH7WKzab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzOSBTYWx0ZWRfX5SlDMYJoyjjv
 qW8IIVjK07Dxq2JUu7niJaE20Hn76+IEeCypIk19CHnaUOdoWPyyO/V160wwD1AeuVbaXTXCrIb
 9Of8a6/HO33OOHK5eTPhgLg7KFxUzOhqQ5CUUVqF8t/ribUoWU+sFgXN2ox0CkcRUM10DNdROCl
 KNwVu1nTSfBAoJif8ngxASExZIPH84GBrUV+nf/hOZCfNR0nEKduqCbqzwpmn3C5rT9JPzLpvap
 7GHQSpALi5kl4nF7LZsLPGiEZscBe5Y8Cy06KpX8nUK91fi6sexh8C01g4at+FZPiervVVLGtHH
 ZhXMY+gSHd5nCRCkm+d4PkW6JS9Qw1pX/YLKg+BH7Cdl6dTgRhonJFppI9Ck3rehFZ3ycYx4Mfu
 H3rlwCCtm0yyOML6u9dvEjHKxdkwWglWHycUuAbo98zaCmbUz4sdP4Sp6jsIyzcqTt6kKFCuu/S
 VdCgwpACTLkUX3I+gAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050139
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
Changes in v2:
- Change Subject prefix to: drm/panel: edp:
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

