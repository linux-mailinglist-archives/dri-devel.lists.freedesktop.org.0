Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0CB119B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 10:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A0B10E04E;
	Fri, 25 Jul 2025 08:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY/CE9Xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5BC10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 08:18:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmm29001023
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 08:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rOii7MGkkRxuEthlnIkJ3V
 qYWoMw7XRGP6le2MbMdvc=; b=dY/CE9XvZpju1XNLwjq/9bF+oyIIUzXfTgC9u2
 e7GAV2x0pQZq4TL3uUBp6Nhmr3Gi8LY1FqGrHmRr62x+RE3N5i/3y9ldVI7msJTJ
 NxeKMZn7bBxXBnH8qW4/2qFsvPFRfhlaf2lVlPStXGL5usKSYUnv+sg6SPJU3sz+
 cP0BQicWgJWCe25sGidIgkt7j31RapmVLa8jaisBjh9oAW3RLCqb3zQyabMgxuud
 CIZqXGynAwMDqIxBTbuKD1qdopGK2IxKQWksdxT9qOLDYHH+JwS7PvUGyAbLnINS
 TXqJEu/g5sEq2ts6bAgnuwsk/5VYFpjPe1v8HiLLK0kTAR6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2xhb6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 08:18:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7494999de28so2932277b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 01:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753431527; x=1754036327;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rOii7MGkkRxuEthlnIkJ3VqYWoMw7XRGP6le2MbMdvc=;
 b=nH2DGEllnTlDzzqH4hIH8w2Wc6tsdPFEU7dcQhIN7jH5IwMxi8THZIPLWTGVCN1m44
 97MwPtkR0uBlcm4uA1AWBdfZGx/kpycX9qQ5EPWKc8Gq+4jFMcKMotxVmybCgIwOUu/s
 nLblufqWbBgVT9zVnCahCv+N6k+iBtgTg2+B+OqrvXgPHo8Z+jg8Ls96OhgoQmrJrhz2
 imbsbqR16t+0fE+NF/I1YNLZOK6EuIA1RYGBSoKyfXP8ei63hOhQXcbUKJrd/IRZVeiP
 ivkw8wogZT/udQrIas05mc9NTO6aqgWkgDkW/M7aXLuMlbL4fcfcFX53ex2pSHiZbiPS
 egEg==
X-Gm-Message-State: AOJu0YxZy+n5BIN7yG2cVQ0u6uWWpodgSaJN6Y8KeNpJ4ehss35ErIm3
 U2WQ3LFmZ0qGhrJF0L7ajQp3GryAB7X0bxtH5GxyIxlTEkq4iyk+sNzIicZBDNQY9HfiOqVHSo2
 VRaQicz8Of4rwP5zHmlvg5W8h7mbTWUkxrMIthjNvNoyy2vfA9rEZSyUsc1By4gB8TwcIqhO/HR
 0c4A==
X-Gm-Gg: ASbGncuCWuaYQxz096oRCWK7bSu+AV11EjDGlGtlUoTybU3VsUboZQ7/jwAwgPug+Kn
 /QJ+vj1a+W6776p5/7uJwaqUaPwyDQvUSgSEaPnkdkDTpxVbNlZ4u/qV5pS4Cm+Vi1N1GHXHOUJ
 GWfqZGo1FgApei4zgliPWTYvNVh4dSHbyZw8Lxy/2GQiuGZA5QBsBs212AzQLSmjv7xM6UtLe9a
 qqDFXqZXXwUARLc5wuIjriNusRr+ijFTGVztTB6XIeSlEk93igU3YeSXNmgfWUYMU3NZYuV9g5m
 GRBNFwh+rSmj/eX3+DO+Wf/N/vMT57ZJf4Ft0t5VakZUmz2jdbWavrmE8XyIh3W+rw==
X-Received: by 2002:a05:6a00:bd81:b0:748:de30:d01 with SMTP id
 d2e1a72fcca58-76332c4b295mr1454112b3a.10.1753431526763; 
 Fri, 25 Jul 2025 01:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwq9RW78KPOTGyOg3B3MiT3cL0GSn594TQnnNv61xlterTKWyitgm/YGEoWGVyhP339s9uww==
X-Received: by 2002:a05:6a00:bd81:b0:748:de30:d01 with SMTP id
 d2e1a72fcca58-76332c4b295mr1454075b3a.10.1753431526247; 
 Fri, 25 Jul 2025 01:18:46 -0700 (PDT)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761b061b14dsm3322941b3a.117.2025.07.25.01.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:18:45 -0700 (PDT)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 13:48:38 +0530
Subject: [PATCH] drm/bridge: lt9611uxc: extend mode valid checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-lt9611uxc-modes-v1-1-6a13b181927d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN49g2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNT3ZwSSzNDw9KKZN3c/JTUYt0UU8ukFJMUE0sTEyMloK6CotS0zAq
 widGxtbUA1qvMJ2EAAAA=
X-Change-ID: 20250725-lt9611uxc-modes-d59bd4d49442
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753431521; l=2557;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=zyhJxPfXpMmi2COtUu9ttkMzXYAuqP7gbFB20nI0k3o=;
 b=9n09GzXcDXSrR8ET5z6AngkHodMfDku99fU/IXasovqiMd9l7WI3wJs10LWuTOg/ofupW2kMg
 EIvOf0VJEZYDWXhIPuhMyBhOdbSsnKWXUIlRzyiCQ0S5boLKAUWLHht
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Proofpoint-ORIG-GUID: o3TZcLEei4IpU8jkAdMoxiWkEDJ-phXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3MCBTYWx0ZWRfX97ZMP9yWj2lW
 /3B5QHXjzVrsGFfY/jrtlKM2z34DYqPEhnaoZ6/nMc8GuIVC4hoXH8Px79mWacp1JYewe5bTj0i
 U5xYioXWKierqHFX9tEFvHNpIPjcewrYbmcNxeVbnofDLDEZX/HMkj+lZzI2xstTQSjxPzt4JJy
 daPzLhNKsQSWbF+Tdj55LKaZHVQAWyOivZFxQrOnFFKaL2jYAB2muWhvqe/PW2IqNDhuolzOkO0
 J53Ad3oKEm8u/RwXJw+kOPHkcUFZKa4t/yiV3TtwTkwLdSDcyr4pUIlbnRzgh7P1rLC8G2T2DNG
 cVpyH07dI5+UucNTyEOt6BvjC1WIBPVmggeULSuSCWDN/BPd2NXG1UcqVYVWGTRdwToD9OQnRi1
 t+tyJX/Q0CyEFyKLKj8OrMJfhkHLGaSZc9iPbPV9cdw4Hbu9dHxpALZInLlmeYvnUTo1hvvv
X-Proofpoint-GUID: o3TZcLEei4IpU8jkAdMoxiWkEDJ-phXN
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=68833de8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XkeAo-KRTqvWKc-2E_EA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=991 bulkscore=0 impostorscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250070
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

Currently valid mode checks are only for hdisplay and vdisplay,
add htotal and vtotal to filter only specific modes.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 36 +++++++++++++++++-------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f4..cfe389b4c25c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -89,7 +89,9 @@ static const struct regmap_config lt9611uxc_regmap_config = {
 
 struct lt9611uxc_mode {
 	u16 hdisplay;
+	u16 htotal;
 	u16 vdisplay;
+	u16 vtotal;
 	u8 vrefresh;
 };
 
@@ -98,22 +100,22 @@ struct lt9611uxc_mode {
  * Enumerate them here to check whether the mode is supported.
  */
 static struct lt9611uxc_mode lt9611uxc_modes[] = {
-	{ 1920, 1080, 60 },
-	{ 1920, 1080, 30 },
-	{ 1920, 1080, 25 },
-	{ 1366, 768, 60 },
-	{ 1360, 768, 60 },
-	{ 1280, 1024, 60 },
-	{ 1280, 800, 60 },
-	{ 1280, 720, 60 },
-	{ 1280, 720, 50 },
-	{ 1280, 720, 30 },
-	{ 1152, 864, 60 },
-	{ 1024, 768, 60 },
-	{ 800, 600, 60 },
-	{ 720, 576, 50 },
-	{ 720, 480, 60 },
-	{ 640, 480, 60 },
+	{ 1920, 2200, 1080, 1125, 60 },
+	{ 1920, 2200, 1080, 1125, 30 },
+	{ 1920, 2640, 1080, 1125, 25 },
+	{ 1366, 1792, 768, 798, 60 },
+	{ 1360, 1792, 768, 795, 60 },
+	{ 1280, 1688, 1024, 1066, 60 },
+	{ 1280, 1680, 800, 831, 60 },
+	{ 1280, 1650, 720, 750, 60 },
+	{ 1280, 1980, 720, 750, 50 },
+	{ 1280, 3300, 720, 750, 30 },
+	{ 1152, 1600, 864, 900, 60 },
+	{ 1024, 1344, 768, 806, 60 },
+	{ 800, 1056, 600, 628, 60 },
+	{ 720, 864, 576, 625, 50 },
+	{ 720, 858, 480, 525, 60 },
+	{ 640, 800, 480, 525, 60 },
 };
 
 static struct lt9611uxc *bridge_to_lt9611uxc(struct drm_bridge *bridge)
@@ -237,7 +239,9 @@ static struct lt9611uxc_mode *lt9611uxc_find_mode(const struct drm_display_mode
 
 	for (i = 0; i < ARRAY_SIZE(lt9611uxc_modes); i++) {
 		if (lt9611uxc_modes[i].hdisplay == mode->hdisplay &&
+		    lt9611uxc_modes[i].htotal == mode->htotal &&
 		    lt9611uxc_modes[i].vdisplay == mode->vdisplay &&
+		    lt9611uxc_modes[i].vtotal == mode->vtotal &&
 		    lt9611uxc_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
 			return &lt9611uxc_modes[i];
 		}

---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20250725-lt9611uxc-modes-d59bd4d49442

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

