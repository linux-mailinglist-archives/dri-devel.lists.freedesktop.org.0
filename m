Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CF62E612
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 21:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5647910E67F;
	Thu, 17 Nov 2022 20:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378710E657
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 20:39:13 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id o13so1531077ilc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBMrn5FpFpyo6XLLEvcLrJTYaTIQkMIKgkloGnkuSUA=;
 b=Hme4cLCtXAaX9LqVE8bdNByEHHkvn6cBFTD9Z299bI4A2Aybw7Uz0dM8tg3n3SkkHg
 x+61Jdtz1YbB0GHTgtPtM66W1lrayEX9ndqwqIDGS4+ZN5QjdDuXuhUUfaB1M/lIUutn
 awlO9fLKxauHwnc51wZYSBzuaBEwGNr5XJJcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBMrn5FpFpyo6XLLEvcLrJTYaTIQkMIKgkloGnkuSUA=;
 b=TBiVmDhzfyz+M9TnJrUaziOq5dKxyzEq3TmVnl7NatVuKgd11bANntXuZtXCMlWg+Z
 2kxTmygPft6Z6fxUEb9BOHtebtZ9t8pfPETkrN5l8MKwoUer4uLpXdMyylMeVfHYvk/v
 8bHnhrFN/KOWGFzqsF6Eq0twIrelbQXcIHWFXo6t7z7EmmPMj+GKFnXykM5EH2sjXciU
 sucLEgkCzpbR92W75Khp/9zwzGRzXqSOWY52Lba3LlMudCHbvUPbwslnB2N5FNxqVt+M
 UFm9eq8AR/+Rlu3pFzK6DFtSB8D3YwfFvZjPKl5TS9Qmq1mYlaCHcOU2KHfe+bJiEqTe
 Ji1Q==
X-Gm-Message-State: ANoB5pndlZQ+QwAVVUla6NsQfrqCsooFuH4/1ecIGWk1L1UTCBJHdF4Y
 yQKKoyy6TXMRy9ijkGJ04F2pxqeOyF1uKQ==
X-Google-Smtp-Source: AA0mqf5DOe5AO4XAr4/ZX3dTaQsRYrztItnwsdC1NGdTpSOzTtm8WSNGyQlclYNxGvJoWToS2a1irQ==
X-Received: by 2002:a92:d9cb:0:b0:2fa:12a7:b8c8 with SMTP id
 n11-20020a92d9cb000000b002fa12a7b8c8mr1990295ilq.286.1668717552319; 
 Thu, 17 Nov 2022 12:39:12 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:b285:6808:3f3e:f538])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00363da904602sm570192jac.13.2022.11.17.12.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 12:39:11 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/panel-samsung-atna33xc20: Extend autosuspend delay
Date: Thu, 17 Nov 2022 13:38:48 -0700
Message-Id: <20221117133655.5.I96ce2a565ff893eddcbee70174c991179311a3ae@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
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
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid the panel oscillating on and off during boot. In some cases it
will be more than 1000ms between powering the panel to read the EDID early
during boot, and enabling the panel for display. Extending the
autosuspend delay avoids autosuspending during this interval.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---

 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index f4616f0367846..5703f4712d96e 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -310,7 +310,7 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 	ret = devm_add_action_or_reset(dev,  atana33xc20_runtime_disable, dev);
 	if (ret)
 		return ret;
-	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_add_action_or_reset(dev,  atana33xc20_dont_use_autosuspend, dev);
 	if (ret)
-- 
2.38.1.584.g0f3c55d4c2-goog

