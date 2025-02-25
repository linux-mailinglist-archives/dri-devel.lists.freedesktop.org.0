Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D27A45081
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5F10E810;
	Tue, 25 Feb 2025 22:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxGrX6x8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B9710E810;
 Tue, 25 Feb 2025 22:52:48 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-220e83d65e5so116903595ad.1; 
 Tue, 25 Feb 2025 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740523968; x=1741128768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxsB6aMdBT4Hx4H6RblTo/4XJIt/eXGQbiNeASQfp+4=;
 b=mxGrX6x88btBP3Ljah4DHyod5UorbvQ7gLITf9IjHmrS3DakF4RZVI+5+IkyT3CbC5
 5eTYUCJjf7t/xXNKAl627rlexpv+UR5xoGXkHTI7VCKKPK1dGX+8H6jETAhT95t6bEy2
 +o1gZZ5IY1IIONm0YbB0eM4l2eJG/BCwkJ5bQy6P53+bSKkUnKwz2F/KA0SX/CV0U5qb
 QiRcoT3IXu1qr6m1yltqKYwwJBfsXnxermgvKzrDK5uVYt3lOaa+RkvFa/fxMh62DQ3Z
 WhdIpEzJSVzsOZuRhblXTVFyrL9v6yLEjSe+pogDwBvfiuKoUzPk8wWITJAeaUhZuGgO
 hC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740523968; x=1741128768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxsB6aMdBT4Hx4H6RblTo/4XJIt/eXGQbiNeASQfp+4=;
 b=fiPZmt8qjzau9oN8BuJPTQxWzwoggSYyv9KpQqTMtdRuRZXPyJXIeKzpnhzQLOApVE
 bMe9Kn7EiR2a9w9ntQiTn0kQXm72b8PwzEl2ilq7S5/WuOUlCeRvWrq0BPB5abK3FAxK
 ELwMg4zendtOWdejY2FvE6O922ERnKUOfz1HYF6yQnONE47vvS7cIxGZgB+6nd4h1jaQ
 /LdW3WX/u9RbGq6+A1gwLs6NCGwazXFEGRC3B3piBFiIy3PjugAmwaRT0mKus+rNopg0
 l3rXi+89GXKb8I5xYJP70LDGnLOpb2dcXyYIubU6f7NnfLKVonSlcBEiIiUWumLbkwWK
 W90A==
X-Gm-Message-State: AOJu0Ywneexma/M5NDC1yBemQvjawNWA7r/W7e0F/3DrllXuMt7p1ALg
 GcXu7j8Z1Hyo7Khkj7WPCLhAbEq6dsS3XtQtKtM0lYDW9g14uH57gxKWvw==
X-Gm-Gg: ASbGncujGedAc9xIRUAJ31xpdbXtTgxosTtyNwosmWXzRJfgt/c65FKhajfAIQcq8Bz
 NIN6k5pcomsizZutBcQB+JZDhyltNdi0XZ66ZYq0CtK9eQ3gS1JsF9rAqewh2GCYV1IkusQRsDH
 TKPYF7xFq42R5dbYgEiQIaathMhZ43Y0A+SW/2pmpxx0AVjU9R8vtAYxh1SsWETZPIhkTCPLb+W
 VHVlkzHm9rdG8KgF1MVoe8Bv1nvOBXaC6WcuKIlc53J+3soroY8zetDkn4YCkLk1SA+n263aFQ6
 S2Chxxp7Yps58bMkTSgOOtKAtxnMaRtRQW7t+J2JK6dZYY/2tURcERZmTfUwO8McWLS/vTu4x0D
 l
X-Google-Smtp-Source: AGHT+IE96kce529uDgDYL6+xVtBIYKH6aY66S2u6/reMukc5S8jwhotL/L+R/0JeO62YdHg51R5X+w==
X-Received: by 2002:a17:902:ecca:b0:220:f06b:318 with SMTP id
 d9443c01a7336-22320080b32mr19996865ad.14.1740523967658; 
 Tue, 25 Feb 2025 14:52:47 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0b2975sm19402755ad.259.2025.02.25.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:52:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Expose DRIVER_SYNCOBJ_TIMELINE
Date: Tue, 25 Feb 2025 14:52:43 -0800
Message-ID: <20250225225244.26625-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Initially we didn't want to expose the cap, as it would expose a bug
in the vk driver (turnip) with older mesa versions.  This was fixed over
a year ago (and cherry-picked to stable release branches at the time),
see https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25981.
So let's go ahead and expose it now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 37db92c8cecb..70373e0fd4a6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -812,6 +812,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
-- 
2.48.1

