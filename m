Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F9AC016B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 02:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8510E803;
	Thu, 22 May 2025 00:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PDWvcrVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5A10E803
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:32:48 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b074d908e56so4808398a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747873966; x=1748478766;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cJQlCBgMKxVnCGlA5AHtUXhzdwlV+fBHPvTlZQt9ZHs=;
 b=PDWvcrVbBHhteZ1g+qP7M9YkC4R+C3GZdNJ0NytIMXaJsAMZLmTD1Wo+G5O9rIPiLZ
 ZJscGhOTHOzyHFKPsrQ4RNoZ9oGAv/oAy7fLaeYYFL0upVjL8jWiJJ+c4Z84ibBX7ad6
 uxs+WQpvBa4iSTn/gckzK59ujWnU7BKpzsdeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747873966; x=1748478766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJQlCBgMKxVnCGlA5AHtUXhzdwlV+fBHPvTlZQt9ZHs=;
 b=Eklj5I2o3kJwq6htS+8Dg9Tb0I57J1hQAQ0fCUq5xyvhTr1fc9aNBXUUNaw4jHuvm7
 NfK1Ya1P6wQfcFvCZ2p9TS92ngfWmAF/Ml8jTNHrc9MOlsJMtDjzXX1KE8ZoesUPHT5D
 zy1+NIf9QaSBzdcWmDACpN3na7ezUZaloNqV9xqFzx7Pc3JFeJ9OdgCNvPDbrD+c+ruX
 1GbBSwmga23K4CfF/yg2xcIDu0UnWvEM9YL0p74SWbG+G4Nv/oDiPAJELunP6s7fTEE4
 o1/BqW1oPk3s+PCSckitRW7GWvleLlc0jjPzR1tPxmXYYEdhPPL5fTkjpuhLHm0C+KrI
 rLoA==
X-Gm-Message-State: AOJu0YxeV9/CV1li4Mvr2P9mJMZsHcGkvERJFHuSEhWLdKvZ+RVbVot5
 MaSY/nnQI9DwJBcdMfYJhbaCEB2KsQqkzHlApVMaaeSwBRRqx3AoVvzhXg9DjCrI1zToHhXmear
 +mIk=
X-Gm-Gg: ASbGnctFCz9eSloznmEzYShWTfFHfxuM54JehjPHNfiiSc+XCo4NSzzVY+73+2yJtgZ
 fHMoPxFD7clxWGbpv6cKWCc1oEBXe31YrN/AW+vrkZ1/kc1jNlqxoz7KCJQMr38LrXiQNO4C6z1
 rmUE/osH0MbbQrWg/BNIZja6CcgaVfU0HFnSvbk9xvkBTeKlNmLXZQDVWaXXdQXrm+hI0s+vPRg
 UQrpsU1XMrl9HnsFnzQMX+Am/ikxWn7Dgmv26uMkwM74/6DV+McoGtiM9uRmYvIkVlqX8fNvM7W
 va5xTYiyEA5xOHxrbnxJXHf3D0rZ/LNz+MZy4JqmVFoNNE09lmvsTPFIjGEZRUsc0HWGpUwn4h2
 eZYBEaul2t8z49gB2ppvdpERXDna7oe9AE8M3HvLzFZLIKA==
X-Google-Smtp-Source: AGHT+IG9arK5ea9sb8GlR9SitolOFjKDHPUKWGdQpJsDF56tIan8HGB+TbCaWPto7usl6Lqv7NWNZQ==
X-Received: by 2002:a17:902:ce10:b0:225:adf8:8634 with SMTP id
 d9443c01a7336-231de37f1c7mr271557825ad.51.1747873966455; 
 Wed, 21 May 2025 17:32:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2a00:79e0:2e14:7:2f59:8b3f:3a15:ff9a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e97801sm98574755ad.133.2025.05.21.17.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 17:32:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable` description in
 comments
Date: Wed, 21 May 2025 17:32:05 -0700
Message-ID: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
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

It's unclear why I originally wrote in the description of
`prepare_to_enable` that "This is not specified in a standard way on
eDP timing diagrams" and then also wrote "It is effectively the time
from HPD going high till you can turn on the backlight." It seems
pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
wrote this or I was looking at some strange panel datasheet that I can
no longer find.

Update the description of the field so it's easier for people to fill
this in. Couch the description with "usually" in case there really was
some weird datasheet where things were specified in a different way.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9adbe0f11421..74f5f9006a5b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -113,7 +113,7 @@ struct panel_delay {
 	 *     // do fixed enable delay
 	 *     // enforce prepare_to_enable min time
 	 *
-	 * This is not specified in a standard way on eDP timing diagrams.
+	 * This is usually (T4+T5+T6+T8)-min on eDP timing diagrams.
 	 * It is effectively the time from HPD going high till you can
 	 * turn on the backlight.
 	 */
-- 
2.49.0.1151.ga128411c76-goog

