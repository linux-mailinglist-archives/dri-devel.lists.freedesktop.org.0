Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEF7EC71F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1298310E05B;
	Wed, 15 Nov 2023 15:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB99810E059
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:26:54 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ce2c71c61fso3753976a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700062014; x=1700666814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1HJYXNya0VUmq+cPipu8J3xs7ouSTliH+WFcewq36Q=;
 b=jqs3j821G2BHs1vbM1S3iRj/q0ZaurFHUd1f8CvEatlWY5Mu5ya0xWSjV4Mf8EDg1H
 G1djHE1guBMTlGZ/YOwYLx3HmGvt049QFQWi4gBSr/OrweXRF85LBl3euv+M7QWMvYyG
 /gEP2vvhvLD2m7o5/SWzDxgTTlr3rphO+g83YUSkjXkwHporLaEbG5qUEe0cjbJKj/gc
 6PtTadOtVBrKeWyc9xyo93AnK5Ir2VtNy7PHt8thwzsKhjLCUtETSgrdUutRNleXQm3w
 jZlM5qrf1yFym3v0LGqEtJyIBUb8CG2qqXZXuLkpU6XPpVzXbiCwhm5L75tAenMFoVef
 mGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700062014; x=1700666814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1HJYXNya0VUmq+cPipu8J3xs7ouSTliH+WFcewq36Q=;
 b=w1CttMjf33ybZo6lLcqjHQDuQbpdb+Mf8Te9J1IJOCVx3BItGB43nLvxpbfTBaD6B3
 UxkyPeS8ZYV3eHglmBZZ2zNbH+4edu9VaNJ9XpIuta59VPgi+5P9D/3dxyNCg0Wa25aA
 hLLhFhGXIZjXwpxaTNKNE7oG611Uv5/NsU2cGWmE1ft68oOF/avsPOCPOj03uN7No18A
 qi0jHyTJLT4G/DjMcNk95EnZfB00WUUyVw7FyIZFU33xdVSSWPd9l9KRykEjDX/+1giq
 Xf9kk45esu+fE3+njocBARxO+a2MF4xMYKvtz4yjagBK0EeH0dxSjortRahAkF/GNWwh
 T3Dw==
X-Gm-Message-State: AOJu0YywrRZ0RV1fxNPjqFJSG7VmPFRmOfZL2IKSAqiRMLE3NXUQBzYK
 u1HQKovvImQCwgkXJ4xLRgXQ9ZKPTd0=
X-Google-Smtp-Source: AGHT+IHm9JSBiHjWboei5Jl8iT2kiDQoCe+OliwJULEwxFa6wMDUvT+KPjxEo6WeCthq1WyTLHWwYg==
X-Received: by 2002:a05:6830:2056:b0:6d6:4d74:8450 with SMTP id
 f22-20020a056830205600b006d64d748450mr5524611otp.25.1700062013916; 
 Wed, 15 Nov 2023 07:26:53 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056830101200b006cdf9935af2sm398012otp.53.2023.11.15.07.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:26:53 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/panel-elida-kd35t133: drop
 drm_connector_set_orientation_from_panel
Date: Wed, 15 Nov 2023 09:26:46 -0600
Message-Id: <20231115152647.2303283-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152647.2303283-1-macroalpha82@gmail.com>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Stop calling drm_connector_set_orientation_from_panel() as its now
called by the panel bridge directly when it is initialized.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index f1fc4a26f447..29b4ee63d83b 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -211,11 +211,6 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
-- 
2.34.1

