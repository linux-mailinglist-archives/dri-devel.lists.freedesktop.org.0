Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4ED2CADDD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63786E02B;
	Tue,  1 Dec 2020 20:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0F16E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:56:31 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s2so1853628plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 12:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eM5B4nr3Cj96c0CMfrS63GcaQxQ7JoKbUXWDaO/w/hc=;
 b=jUifm+7nuTwCtKljBq98E3+TtyCZjBN4r9vPGtA31KmOsul01hRCH97eUQXC8GwbH/
 C7i2rq9nkTRhgrCCtcZ3S8D+p6rmrYPGAkI8qxzpck3qL0M1i729OQVh44jnWLEebkeg
 yiaS6qnZVJTF8Mmd5RmWbKpwhyf/lYAdIGlDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eM5B4nr3Cj96c0CMfrS63GcaQxQ7JoKbUXWDaO/w/hc=;
 b=Foe8zMiixtpE7m3OqagLinI/lAjJw5E4KFWtNw5JhaLegjoInv+cTuk/HsVbR7UtNN
 KYwSg93ulXVemlsQ1+rMY64rBx9b6BoMswunambiyrlK7+iYfmf3DSbHkzFP2M5ETBUI
 krIvYZ66knmoWYa1MwFZ1I5ixQEpv3FoM4z5IFZCVCZT1ozoZQoWjKKuxrgvyBfe16pl
 wZmF6tocE3B8A+BySk3IV+QURk0HxGdhzeTtpVYHGIoHhBn3Dgx9EeokECywRKH+KNSd
 zUr8XZk+WT3BygyEfAbngLOc1lGT/MSfFTmyQHpKZdIw+YmLtJxo/S0Yoh47cqWdCxby
 h7eg==
X-Gm-Message-State: AOAM5302j0IYXv5dDxoSNa9UhvqLHHwPJmwnQTKsgjcNYFyoB5ZNUCkb
 TdKs3XAf9Uqe9jsnc++cfhxSZQ==
X-Google-Smtp-Source: ABdhPJzfzvwqmVM12Vqk1uIjHAiXcS/yoSMaRMutHljDGn8QBGiS4fmDmcSk67ItGQUDkZMQd6Ntfg==
X-Received: by 2002:a17:902:8e81:b029:d9:f1a8:54ac with SMTP id
 bg1-20020a1709028e81b02900d9f1a854acmr4434841plb.69.1606856191096; 
 Tue, 01 Dec 2020 12:56:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id l1sm534205pju.48.2020.12.01.12.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 12:56:30 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2] drm: panel: add flags to BOE NV110WTM-N61
Date: Tue,  1 Dec 2020 12:56:11 -0800
Message-Id: <20201201125554.v2.1.I8a7bfc0966e803ab91001c9e6d01a736950c4981@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I forgot to add these when posting up the support for BOE
NV110WTM-N61.  Add them now.

Fixes: a96ee0f6b58d ("drm: panel: simple: Add BOE NV110WTM-N61")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---

Changes in v2:
- Apply to the correct struct

 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 216cde33b5c4..1db4c10b4480 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1407,6 +1407,7 @@ static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
 		.vsync_start = 1440 + 3,
 		.vsync_end = 1440 + 3 + 6,
 		.vtotal = 1440 + 3 + 6 + 31,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
 	{
 		.clock = 138500,
@@ -1418,6 +1419,7 @@ static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
 		.vsync_start = 1440 + 3,
 		.vsync_end = 1440 + 3 + 6,
 		.vtotal = 1440 + 3 + 6 + 31,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
 };
 
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
