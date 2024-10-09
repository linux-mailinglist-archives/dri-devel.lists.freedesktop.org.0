Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AF99706C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 18:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069A610E780;
	Wed,  9 Oct 2024 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dSJeT52O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3310E77F;
 Wed,  9 Oct 2024 16:05:15 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53993564cb1so7892723e87.2; 
 Wed, 09 Oct 2024 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728489913; x=1729094713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IIa5sZ1sQN4F9/EAh7jCAPDk1gS2+mafy4s61EUtTUw=;
 b=dSJeT52OH5GuzKLsmckkkPmBh/6/5QOW1Vd6X3dA6Nn6aj0tJXf7wM8sPfvZctCjxc
 iC4sFMcmkXS7IPmlsOYiDsPrYDkp4EXfJCja/JFBzZLw7cJpfVlVTmNFXa00frZqi2Aq
 LI7hLU21XMR7XXKr47rdwmYsyOzrUiuuyNpBwL7X/mxU238P+n8552sTsyKnoZPEVDrD
 RmI92Sntyhrg+f9nKCJx7YbklKWFFtW8nyogatV4LThS+ZHQbjcoUNUv5d5/fk/cVQux
 L9d4kZD5s4NLBrCg31uvBAeftFeWLi57VCJtFfoUTPamGmTCTIGyzb7zU+DCXtPXzZiW
 f6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728489913; x=1729094713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIa5sZ1sQN4F9/EAh7jCAPDk1gS2+mafy4s61EUtTUw=;
 b=IMHAQidOcC4KD1syfE6qSWwI3gy6me3926SIRWKu2TP/RDcDxf92N1lKnYwWVZLKLS
 2JTPgzCpNJX61+2FcXyTUxjceK5T1g0a3CELaKH7VuOrd5S62Wphz6q9m2nO8IBSD7vr
 szEgcN2pyMxwKIV+qAud+DVnYmWsCvUi0h1sbwC5DfVuR7izrMR6We0Sw2e61Hn7BTWy
 aKwkx93FP5KNcvzssPXza9qCx4juXxRo9I4MQcyOwStJHepuXsVO1vki2dqt6si0pdvR
 nHznWnP15kaQW5B7kngFpkRBe3zBDfGezaQ+zlCpmJ6yo1EY3ZoUvIGJbri+Q9AT2pIQ
 jFJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFnfTn09FcbSPxLkumH3+7dFQkdfrA0H0Sw7vppl/oCpTTd3FyAmyVZGdT5bPkYbbH7nqQT3RP2rk=@lists.freedesktop.org,
 AJvYcCXf5SlGpACpaohfqPVpw1w5kFlJrupJiSC+JfJwiYAPkCP1Y9U7xJ7lRKJD9tl6vbZa7aqHg5TJaN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaLNgJsD1REbZcSdhUz5wefpujn7jv6V3vhuhc7kvAMWEcqHux
 pW56m+Vt8pX3j4UDV7hMfxEY7vjjJO5EdpY2z9Y0CwqYp2U7YEgr
X-Google-Smtp-Source: AGHT+IHIlkFtmtsRJ++tKxL+GXbAqdTfJNdHb/CKldkqVa2DzJdvODeH4o865Vxvc5KYCgRQ2o8PaA==
X-Received: by 2002:a2e:8e6f:0:b0:2fa:bb5d:db67 with SMTP id
 38308e7fff4ca-2fb187aeb2emr16410001fa.32.1728489912522; 
 Wed, 09 Oct 2024 09:05:12 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598947sm5582859a12.11.2024.10.09.09.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:05:11 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix inverted logic on snapshot->copy check
Date: Wed,  9 Oct 2024 17:05:10 +0100
Message-Id: <20241009160510.372195-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Currently the check to see if snapshot->copy has been allocated is
inverted and ends up dereferencing snapshot->copy when free'ing
objects in the array when it is null or not free'ing the objects
when snapshot->copy is allocated. Fix this by using the correct
non-null pointer check logic.

Fixes: d8ce1a977226 ("drm/xe/guc: Use a two stage dump for GuC logs and add more info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 93921f04153f..cc70f448d879 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	if (!snapshot->copy) {
+	if (snapshot->copy) {
 		for (i = 0; i < snapshot->num_chunks; i++)
 			kfree(snapshot->copy[i]);
 		kfree(snapshot->copy);
-- 
2.39.5

