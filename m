Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB217AB9137
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 23:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBB510E965;
	Thu, 15 May 2025 21:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GcqflcHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3440B10E965
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 21:11:28 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-609e7f3caf3so1092981eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747343483; x=1747948283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zsrbCQbXdTBMHnkFh4svvgR8i1h1hl4ZIoZzKn+642g=;
 b=GcqflcHdEC4UefQeie6sZWtsz6QObv4HDo59m1BDgPyhnbC9NHWlaGQU7j1T2mZQYS
 CjHuFGNbJd6dPNKH0j57x2gsHn2M6S2PIIKryMI9XHDjwIaNiyLSSUDEjNQysDyRzLvS
 cEnK2G/lgTOXhPuAwV6aCpfyn3lnuW+yp3Djbtc9xzJ3Z4jk2w7ujpkLOKtETDuQq3Ra
 osKZVeoNjRBqPbN1TDmCoxzIloev2p2stjb9J1ABwd36XCUa8/+/Px2lh1iowuq7jDlK
 Al3rXfBmuKi9ObAY+IwiktigNzaXJsAGLfS7R52m93KEzPch47POCFBlilwSV6kOQ/th
 pa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747343483; x=1747948283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zsrbCQbXdTBMHnkFh4svvgR8i1h1hl4ZIoZzKn+642g=;
 b=KYG+td+Uk4ZWfdOaMj89hmLkhw7D8syniZd0DwfZIP+dce9qWYR51SyGMoFsgLJJEi
 u2uC3fHt2EyhT8jqAcPc9O7nbwSd6kowxEkWrPxnH3gHfR7o+8u6lOBB7ljh575ZWpjy
 z4naMHAkrO2qUVFq8iri/G3z+JPV+BGiexlGKZjbIK6/UY3aHjvO2N7VMvwRbV41RAel
 54FejudJYrk20I7Q9rpaxdL94gCQA6zC+iStvHnEy0ha8P0W5e3QQo7cXl4isDi0iAXB
 nvKDm8uer5NLuQIiPhr2yNQkXPGBa5v2EmhaOnkojBlA4aZLjTcpxYwErCn3Ztk4fl4U
 9Www==
X-Gm-Message-State: AOJu0Yx0K8wKs+RM+/QD1rgdhWX27hkDorhN4WnfKk58yici43P4hlr4
 fSoomucgozitJHfT9uVkgd/AU4WWzjbhJBAA0XUuFv52Qq9Kfq7pC5WzjYAv7Q==
X-Gm-Gg: ASbGncuCMN273YpPPwWSmIChx3p244EVaYuYdFnHMl78Ad5qc7OiLQWVkjiBlKE3lAQ
 n0RDEfCFRIF4EorwoRsYW9bbBV8r/O+cSrU5DKUzbLJe/k+l06E2b/OcvRIQafbTGzsLranoDK0
 0LSlgOTAhi5dZbOkhhaLYM4XSkPAvD7k+lv3+eMdfu/nNO1RmQCn5dPug7yV7vYLvGBP+wMAw8m
 1be9YSGqR0MtvEvrMJKIPQ+dAarDGuU9NJKlRWjCd67vX9xY6sFy3qMSAU84i6RegcQhvDQYLb9
 WbACIqhBDUI9U0WySHHBdztu5FmvyTQ1a5Cs7wkviDc/xnIzLeNNVHFRbmoI2vy9xdHwuucCPAP
 mXMd6CbpzJ73+Vds6RGOpiA44nA==
X-Google-Smtp-Source: AGHT+IGXAwZ1lMKkYKPVqm106lsiF8QexIHxQXcdvdh4KcFq2Lq7wgLaksOTSGOb37VGrFzEV43asw==
X-Received: by 2002:a17:90b:1c05:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-30e7d4f91ccmr1021115a91.1.1747343472751; 
 Thu, 15 May 2025 14:11:12 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d4892a1sm261094a91.14.2025.05.15.14.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 14:11:12 -0700 (PDT)
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
Date: Thu, 15 May 2025 14:11:10 -0700
Message-ID: <20250515211110.8806-1-robdclark@gmail.com>
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

v2: Actually get the panel name correct in the table

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..28c38672c898 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1916,6 +1916,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0964, &delay_200_500_e50, "NV133WUM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
-- 
2.49.0

