Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188A910A65
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89411892D2;
	Thu, 20 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ET8i+r80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382FB10EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:52 +0000 (UTC)
Received: by mail-wr1-f97.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1007646f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898410; x=1719503210;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IejuEvDg3UZebEkM2deAMur0Xg0FlZvwzGhAHWmDqis=;
 b=ET8i+r80nLK9Rz+nh5fk4z2Dlr/AsdyvL597CsOB2yNtbwvCbOsQeqnsPko732OK29
 JBxwSAiRRDKnhexs0/PJIiiYerqARhIzYRCqybYxPRQMgq59oB4VUXAMhKK+pTEtRhVj
 Q96QujJeFtF4UXgbsp1LSqjWw+fPyuH4SoTKU+Yi/pLLqsvwakK8KHOvAv3Usj+QF53x
 tK5+aKkuHP+SugztsxTEDcqpdZx/HxoW87mOS5a+B8Cdb1Y6aHaWwBMpU1RkFEuCPCsC
 MDMadkFCO0jGSTiiuWAB1DOvLTTWmkVfKmwFxItLypS7j/8121k66iYEF4Mko5v3rxmc
 W0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898410; x=1719503210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IejuEvDg3UZebEkM2deAMur0Xg0FlZvwzGhAHWmDqis=;
 b=oamRA+7UqimndOHW0Z/Pl8RJqzDlY/XO+Bfb7Q5PdIIiCdP97sjJFqoK+/aSaCna7C
 DXustaWLR8M8TgmvKI9Rw98MmjNGoP8eNq5nY7WPVQRTIFs+z0KcZgUhbxHw0cJItjY/
 m3gy3esyZ7+tEWoVel8M6Vqnap7rn8r2BSwfg6gGukJis7QMBsvyGhd8HToRS8TX4fOZ
 BWoaiN6xyTqoMib0XyTyH9qbzpEtZ4dbnwoxEV5j/kO/wsqapInBAkIhSEuW2OcV3kIf
 Hho9E3EA4KfcWNUNqGxUwTvSL4r60d81J1yeYrO0o0N3Bf0kNx+q8dqFaIbiwZwntwCH
 7T/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU6HuDk8KPiyQyE9MZdeo5KHAPkDxo0lrw4MWFVpMb+JlV3971QWmTLUX/XX0zELIKcldiGT5f2mVdVHEMMhtPyDru06VoZJsNTxDNVTTH
X-Gm-Message-State: AOJu0YxXQHfb4L3HqaM+Jf/qlHH2lRXlA6brZ5IJxuOFFBkhbi9TT80/
 SHbbLJs8rekdLB6zQIYkVkBf0BsRIpzkEx9Ulc5oI5agjNwpFSuEPwHhYttDxHwlLM0iXffMmt0
 24oWpOQ7vXmtQBPwiD5xlFUgbiJs63e0J
X-Google-Smtp-Source: AGHT+IEnarisfZ4jDi3bDIQ0iNAiP/RiMIvj6ba+grJ8Pq7aPfvZ1fH1rlf0lZDGomxkICzFipm6jwhfKsP3
X-Received: by 2002:a5d:63ca:0:b0:35f:2030:d42c with SMTP id
 ffacd0b85a97d-363175b8160mr3851193f8f.17.1718898410502; 
 Thu, 20 Jun 2024 08:46:50 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-360750dafdfsm868577f8f.66.2024.06.20.08.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:50 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 15/31] drm/vc4: Don't write gamma luts on 2711
Date: Thu, 20 Jun 2024 16:46:16 +0100
Message-Id: <20240620154632.4125308-16-dave.stevenson@raspberrypi.com>
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

The gamma block has changed in 2711, therefore writing the lut
in vc4_hvs_lut_load is incorrect.

Whilst the gamma property isn't created for 2711, it is called
from vc4_hvs_init_channel, so abort if attempted.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2c69b74b25a7..5d4a76215a2e 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -222,6 +222,9 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (hvs->vc4->is_vc5)
+		return;
+
 	/* The LUT memory is laid out with each HVS channel in order,
 	 * each of which takes 256 writes for R, 256 for G, then 256
 	 * for B.
-- 
2.34.1

