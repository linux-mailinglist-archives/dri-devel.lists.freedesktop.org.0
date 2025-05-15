Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84EEAB912A
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 23:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7B10E961;
	Thu, 15 May 2025 21:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LkFEV/Pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E3510E961
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 21:06:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2317d94c9cdso14095765ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747343184; x=1747947984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=glVvTUmZ1lEPqkPsZ0IswYkeh0jiUIOqzVPrPGI5vCQ=;
 b=LkFEV/PiGnBFNY/k/vjdPu35xIHjwC5qgV4bwZWqUliMeYHJIpxdwx4yvpoueaIX+D
 ABk+9Z3iQ7uVKNy1tnqn7WGE0qbUnO3901ArZVb4xsbFCQvpE9UYjGypg1FedZtX8/VK
 SnaJFZbTSTBYEpGOzinNZzJG1lGARAWhoZZXzGJ/oE8QunUzySVObEWrrDJQHcaS9rDA
 maOsUTk283f+RitQAGZuZi2q3yaY45thO/WwqiL/0PvFkHzKq9qTOtsaST64YSQqtBco
 oExkx4fy4ZiVus92pklyq+6diUP2ZWRgdFupk5v81U5po6g/yi2hAwf8IW8b+ZGGknBw
 oQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747343184; x=1747947984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=glVvTUmZ1lEPqkPsZ0IswYkeh0jiUIOqzVPrPGI5vCQ=;
 b=QJnpt6UM0fyVtTIVqhd8DO3RwqUtdw1t/lotsbng7QyxplbvhD/mHco1+Mx0vZSOA0
 BUnL5m+zdndrY46Ifd11/PCFDujdNn/IpDqJ9idRsbV8CabD6C2vFT4xoiqnODlfPivZ
 LR/17ogVcv5tjJ7V2E6rFzV7KxLBh5/cGExklyk7kJN89DO+HeTgqjHMneXg7xjKYGeK
 zdOmeA+8KHpYVXxBk0LWzuiLpXeFVuyaaN3oxSLKy4g0BrR+aYyNZVyHmZBHpEaHea5h
 sf3Hhb87AqGeXzagZ1x+oVenKo3G76/nweFcwHGhVy0IUINfitePxBUAo6kbcAOw2/iG
 XS8g==
X-Gm-Message-State: AOJu0Yw0OZuNyVQ3rH2VXGOLWnTDaJhzp9nnD8XKUgMSMV1xOogjB5dR
 hBfBkjD3nc53RWTqgbd6lh+RtT5ARzKeZdjm3sfpbwVj+9B2mm4Ows2Kbl0X+g==
X-Gm-Gg: ASbGnctmQNIzKMgq98SwPYvfjalKG3YGEjy2Z9cMcU118vSepfTO/hfSNQIUCecX/94
 BrJy4WwZDinVbKswEXnS8tqc5m+3AtJ4x0JSlo41Br/d5HyIuLvrJn8nPe+HPwMIs7P+zFs/MZo
 39TCL8Wx5mUnxtXUrnPY9NsCVYES0lYXjcrD31ZT+zjyxDHXThD3sGQY1jVXOFVeIaq7UdlDijs
 7A7inwVKmuFoCSHPZYVqZ8ihFjGxHa4hR6wNpIIRLlozErSAwm1jsT9hF1B9mXHjglGMFUtA+/J
 kxXVA2b2mD1w3iNi+gjqAtTpUnUKIbbHMwNghw94+Ks56A5xT0LAlvBGV7Gc5vPD+0xkzwSpYTQ
 8cayZINd4vr36fxiWSyzbuWKF/w==
X-Google-Smtp-Source: AGHT+IGtCDa8JGGZEv5Fo4WJTmdj8+IdkuqNCkKpY6C/TQ/oUVVGOm13unafuIogtRfF2mhwQf2RYw==
X-Received: by 2002:a17:902:f543:b0:210:fce4:11ec with SMTP id
 d9443c01a7336-231d43d7f23mr11109175ad.1.1747343184344; 
 Thu, 15 May 2025 14:06:24 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4adb733sm2146485ad.63.2025.05.15.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 14:06:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
Date: Thu, 15 May 2025 14:06:20 -0700
Message-ID: <20250515210621.7753-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Add an eDP panel for BOE NV133WUM-N61, which appears to be a 3rd panel
option on the lenevo x13s laptop.

edid:
00 ff ff ff ff ff ff 00 09 e5 64 09 00 00 00 00
16 1e 01 04 a5 1d 12 78 03 55 8e a7 51 4c 9c 26
0f 52 53 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
36 00 1e b3 10 00 00 1a 5d 30 80 a0 70 b0 28 40
30 20 36 00 1e b3 10 00 00 1a 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 33 33 57 55 4d 2d 4e 36 31 0a 00 7d

datasheet: https://datasheet4u.com/pdf-down/N/V/1/NV133WUM-N61-BOE.pdf

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..aa7b58204523 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1916,6 +1916,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0964, &delay_200_500_e50, "NV116WUM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
-- 
2.49.0

