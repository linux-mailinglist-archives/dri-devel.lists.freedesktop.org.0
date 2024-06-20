Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C125910A69
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6D10EA9D;
	Thu, 20 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mdSAYBcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D910EA97
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:49 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52c82101407so1705399e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898407; x=1719503207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSzAIXdwy4hWi+X/Rh/oiZMnWSSx6T+i+P8fleORqxk=;
 b=mdSAYBcT775+7qzOsoKeqWrPVbcYqMi3ip1O72jEOQBw6LkGzDhYI/h9nv5eRdUUpM
 mBuXDEB2y2C6ptEPMW+MZsdtEsQ9jxHUbNHzKXAh4p6mMeCPGUlloAyEAfKlTF4REiv0
 gznA78/0ZuUcj1cSAGrN6cnJu0s+ZYZR3XWSnLrz2QJy8EP3jXq61NzTB3toQUBX1+Tf
 5wyWSEh7Jqg5QoGojTYRvAu5wP/zpNh1J03DvAzJNNXRQpLgdjTXIdqjxgRwQNcNwE4Y
 PnfOUpLjMJYIyR503Ojrs7h/nHGHnSwpn8LaL+V4dUACzvxL2P1tffwP/E1ypd5F59sc
 WNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898407; x=1719503207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSzAIXdwy4hWi+X/Rh/oiZMnWSSx6T+i+P8fleORqxk=;
 b=xLbDmtWhyKjGxgrCjIh2JMXfDtvxuuNq+pE+My1dYYzgcT6wx2Ly+IrC4sxt1DliCU
 M9M5SzBaofVTHecDCeKoaSPUNTpoewC16Q/0xjol5OvzFI9o7GLf48I6VkW1131O6cOX
 4vsZJzTF6rjAOLr5otm3WuH7qxynKMkIlmwdyxLbe1VzDlDiW/J0l30FURpEhcC2gWW/
 iXLUS05MYAFVVF1MATwHIaTt0Lb5gJxIgIPVKlk3LLpKPmZDt5GGaU45aQ7vOv8Wed2H
 5gqVjxBi1hK2u7junqckOaJiASAWb9zoB/gj1GD6uTI6Hlu7WcC9/SG/G0V3nFrW12eW
 vCKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURhR7aEw9Q1xbrj5gDLKwdGC7lTqdgEolEMtPinE26dXnGQAoFMlssb7mCh7Fl7AMM3V6yr/4C7fuT4bS/1lx2NrDtwcXO3SJz4V0X4Xpw
X-Gm-Message-State: AOJu0YwT1wuCd/OwdU0TTpia8lbiBHJ+w7jmAbWcliyXE+29qs5UFI0U
 OoXNnxUMicMfWPS8vVyQ2heayhVLXcfuyLXG4hHvcW234GXi2HIJBc/mc3r7/KatQhzjOd13Odv
 LZFHyukzhyvDwyaxK2Ptrq26bTjoGjqsG
X-Google-Smtp-Source: AGHT+IGCq9Wvh6pSaisUtrVnfldBU9ww7tRw1x9XZLs5oWsQBJZcWfC36k/Q0ilPSJBi1/7WYu2LJtxLNsUs
X-Received: by 2002:a05:6512:108a:b0:52c:cd77:fe03 with SMTP id
 2adb3069b0e04-52ccd77ff08mr4549832e87.14.1718898407573; 
 Thu, 20 Jun 2024 08:46:47 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 2adb3069b0e04-52ca28265b3sm228868e87.26.2024.06.20.08.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:47 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 13/31] drm/vc4: plane: Use return variable in atomic_check
Date: Thu, 20 Jun 2024 16:46:14 +0100
Message-Id: <20240620154632.4125308-14-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The vc4_plane_atomic_check() directly returns the result of the final
function it calls.

Using the already defined ret variable to check its content on error,
and a separate return 0 on success, makes it easier to extend.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 16197c4b4b33..d078a2d21eea 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1386,7 +1386,11 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	return vc4_plane_allocate_lbm(new_plane_state);
+	ret = vc4_plane_allocate_lbm(new_plane_state);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static void vc4_plane_atomic_update(struct drm_plane *plane,
-- 
2.34.1

