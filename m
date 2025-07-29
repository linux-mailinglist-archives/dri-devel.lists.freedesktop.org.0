Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C61B14E66
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 15:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF7F10E06A;
	Tue, 29 Jul 2025 13:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSxBakmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5D810E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8csnL014609
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Pwd1Uen4tLsiNQA5gsPz+U
 2GfwJQb2ufYXc1ajWUN9E=; b=CSxBakmP/PTlEy/xsnBBFGXuhnKoget3Rj3OZC
 g57G2P4woMrQGZNTalO1OEJ5hrlnQJi8BvRbFhSXJql1rBoC4/rTgX054SFlmsID
 UV92el4Wv8tTZQ0xRODmpkqN2PoaLO93MDx7PqU+vKYN+KorwzbBZALK2kTqRyy9
 mV4Az8xMzcZB6Dmd8Pr23Q4i7hHUXcRYJhj3nxaru3//6RCad/ElH85ucw4Vo13o
 PPtiyfVepcyLN8I1zbhTmdFM4fZskehHRPinWpeAvsXUVUrlSbVD0A6pT48weWnY
 dgNUIrPZ/6wnfoGzWjsoRdWZMdqlH1qjS/vY5fy79945qBXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xr6de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2405fdb7c15so14098025ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 06:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753795842; x=1754400642;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pwd1Uen4tLsiNQA5gsPz+U2GfwJQb2ufYXc1ajWUN9E=;
 b=nn6Aof6IXbi1ONIKnwS8wW2OlqoCUroq8gLsXp+arkPYpx4YGdTCiLxLwQ+BRcaZmD
 Tj4dOmJE7rx/GN3u8ConKkMG0jF6+9gLIolR1g2U1yZ90UEROxGv510fdDFJK0vYnOAg
 5FCmnKVOs0dT3eof3XmHAT5Z4Kl8E+55ilFC0IdtBCbLjSA1J62t0G5D1o6UOYQ2HTOp
 YM6GcQuEcUL/xE0YzWE4NnSShAiAZCtkcSATSGL6OCXy1TwOgUww5oRL/eqf78pyxXAS
 V9rUg+1dPZo01cutTyz6vTYIdHcN4wHIKM8LIZrA9Oz3uSD1d+oyGfTxtRtRuu7LqkJC
 IDnw==
X-Gm-Message-State: AOJu0YxQWbs+/q2g+BgQ1k2aV8rLz0SEmxGd1zy7yLV//qqDyu/Dv295
 3vLGp7pg0CxyvQNahK2HMYXbbaBCAHs16LK6GAuVIjGvhWoZlqM+7QiSjiWRYtTJyR8LDqMJRkU
 JTZddVy0ZCaklN/ONlCkLA/1FsrvCeg5ZgEKq0QNLW4fTZa5eWFdJxmGH7BAJ7eQyiySUjg==
X-Gm-Gg: ASbGncuKec+FyDBPezocsibopkOUqcbLy6lLGwoTC7tA9ixvDoNgtHMpiWjnh9v55zy
 b32cLlGoCDVuKRPmy/m6ZmGmuhAtAXoHHvlTP7HGZ7JiYxmZd40h0tu/+skogd02q2a2YoVkS5t
 y5cDLPrLsvWllY6R3epBFuDlXwO76mCW3aibHdaBoG/87/L9P22V5W5qd5tSRTjRL3HdOli2joM
 FG+kmMXVZtz5IBTWOWV2FoGps9Jj55HdmW+/CqfWXd2dUGASN5Ywy6Ar6uItpq1t2kN9fZGe1Mq
 hbsjUuEPRZzuo3XXsYZ0xMPw7JGyhIujYCAtjmhLi5beS5iVpgmp4w0aXQUYiRaO8A==
X-Received: by 2002:a17:903:2345:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-23fb2f04695mr216927795ad.0.1753795842358; 
 Tue, 29 Jul 2025 06:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5t4Sc97KxWI2Rca2EtO4U71cyx1Ik2icwdj8jBwYXMK+EryFm+s1oMsxCnZGJ7OrOvhGfRw==
X-Received: by 2002:a17:903:2345:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-23fb2f04695mr216927395ad.0.1753795841971; 
 Tue, 29 Jul 2025 06:30:41 -0700 (PDT)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa39742dsm59750175ad.101.2025.07.29.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 06:30:40 -0700 (PDT)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 19:00:30 +0530
Subject: [PATCH] drm/bridge: lt9611uxc: add support for 4K@30 resolution
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-lt9611uxc-4k30-v1-1-cacab6843f9d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPXMiGgC/03MQQqDMBCF4avIrBvJxMaoq96juIiatqHG1IyKI
 N69QbvoZuAfeN8GZII1BFWyQTCLJeuHGHhJoH3p4WmY7WKD4EJyJUrWT2WOOK8tu74zznJUsmk
 KzaXiEEefYB52PcB7fXYw4xzd6XyCM0T6cKvkp8o/1fnOEFuQIcs1Zg0WWArV3TxROs66b71za
 TxQ7/sX0sibZ74AAAA=
X-Change-ID: 20250729-lt9611uxc-4k30-6175bb8a0570
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753795836; l=1113;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=VT0BBySfU+tF++/5RtcHSfwTueRpJY9UlmQzxDI6Xhk=;
 b=77XtZgHLyDzirOWORoiop7g1Z7hh0TR8UHq6nGaG3rseh8Ykyi1JSQj3IuHuFFHhpg4QPm0Wu
 ThT6olOUbIYBDsClU/e29rcYn9wL9MTr6tu79dyd+n2/5FpTR9lzcW+
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6888cd03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J5JMw0DlW5QzuASz7ggA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: yEpdi-ay40wA-B2vLd2DOUMQxjY8F9Wq
X-Proofpoint-GUID: yEpdi-ay40wA-B2vLd2DOUMQxjY8F9Wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX0CbcjrIMTEiR
 P/tkBdJV0hMdwIA9t8hCqH7hyJQIW6NBCipJGOQvzaP6wDutfQLrnL6PQOMbac6/XCir5jHRQ8I
 23aH/wGlXV+A+RxgKZbHRaTkHYcyjCyxV4v8zodMfMy8NN7CfmYjehQrlaqXIBoCTIshpspzxln
 c2v/YWbY36xwNDzVJEvIFJhbWDE9nPAFjGNmIK//WK5Ael0RCk3hZuYmcsUxSC1EjQQvcH1BgRU
 1RQWhLRBvKsXWvf9zNUxfgp1B5bC2qAAbChoJ8CDAgtlpkQpiJzyOUDPYJXCHBXQQ16wEWfbPZd
 fx/+PIUZaV3oEEfn5eXhEiPRuydFnbWfKxRNWNupCuL08iSi0ae3b5qQqzZbN8i6dOKxnuFvnmZ
 zhvODI8Bs/IDdwug6pj1YGr9Eb18q9/BAZ0Bt/sFOEmAoLOCJnElwzc20yRBzTFp+1LccUbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=976
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104
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

Add 3840x2160@30 mode in lt9611uxc modes to add support for
4K@30 resolution.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index cfe389b4c25c..ac53da6c9711 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -100,6 +100,7 @@ struct lt9611uxc_mode {
  * Enumerate them here to check whether the mode is supported.
  */
 static struct lt9611uxc_mode lt9611uxc_modes[] = {
+	{ 3840, 4400, 2160, 2250, 30 },
 	{ 1920, 2200, 1080, 1125, 60 },
 	{ 1920, 2200, 1080, 1125, 30 },
 	{ 1920, 2640, 1080, 1125, 25 },

---
base-commit: 9744cbe3603db5dbd6e63da9c3bed8df68a6d3ba
change-id: 20250729-lt9611uxc-4k30-6175bb8a0570
prerequisite-message-id: 20250725-lt9611uxc-modes-v1-1-6a13b181927d@oss.qualcomm.com
prerequisite-patch-id: 6c7107d0c8810b85d722fd32e45f736fff81860b

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

