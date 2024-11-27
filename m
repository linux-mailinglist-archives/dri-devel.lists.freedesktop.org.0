Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E619DAF4C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 23:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764510EBFA;
	Wed, 27 Nov 2024 22:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYPvXoB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026D710E420
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 20:36:12 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-29afb4ab611so124988fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 12:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732739772; x=1733344572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pcXmUZCuBPhhv9UOmrEGOEpDu8UHlHBCzJTdy/kxlo=;
 b=dYPvXoB/X7eHhjoiBcRfKc14z/LI5uB4WqqZZm5cZvvkiX4kZBVbeG7N41kFLCpc8B
 S4KQ9ek1SfPDvMV+jenpkVVkHX2JkveYyDA2EwCaZlpVCkMjdn4zZTPTJe3CFCH6jAjg
 tkszPbTeiPky8ADgpIlWx/HEdtfHnenXYYVzqccR7tjUFKCrh2+J30RRH/NUK9UhTSkE
 2iXLkGTTjJSduC6zIBFavm0ttgTnZsdDjVcw4gLHnzkIKBUQ2jjTg6Kc2pf9XxBhfcaZ
 niPKanT98XsqKtH8t0emQQvt0IWa3mZ1S3wDseJyVj1BcluYAgBpkLEQdNwXYQOIccVQ
 W4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732739772; x=1733344572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pcXmUZCuBPhhv9UOmrEGOEpDu8UHlHBCzJTdy/kxlo=;
 b=QU6Feo1rDx2IujAdAO9t8LAXwX5iMbMSn157RC1+Z4LLDRVFaEaYwDFN6TbtMstGYd
 5iChacbZDboYx7gUoSOXSxs6eP60997clpufXS2xCxK2dMnjamx53x3ahzePsPVSJozy
 0ZGHKkOPgc8tkPabuJPYLo74IjO8FvjzzP9hXHXF0eYjAv2dX9CZ48TEqbqWFbC43QxE
 jRk6O0uHl5oIjNrvNpI/JSoROrNnVbYolhOInQgdlqHTWUcnmP0d5+Ug75pF2GBX0+MW
 JRXmmdrdbmTvmRRd6jfd7duc6LN8ZvH1+Ya4GAdCz8YEgmF2ZOuNkDUvPcm0BZKpwo24
 E+0g==
X-Gm-Message-State: AOJu0YxyN+fxKsKabHCrFGBwQFdi9RJtqdOZTHvBIvdPGWEHaiAS+Ohr
 yvKDmS8PY2P15khDKJ50xBLtfzS9pRzmU4g8cszFUhK3gRPM1TkC
X-Gm-Gg: ASbGnct8kz/uSYRbckpprUq09DrtqMeUmg+YWLwObmXr0Z+IH211YEEaW0Zs4G89cZ2
 E3o5tjvE/gyrgca0EWQgurqhTt0f5D9LI02cxHyixbe8p8kt39xrm4OYGJLmsgTnLbzbzRZ39tn
 zEmpxy4D0V87BdTFt3fr40Hmr5nWtLa42WmGlo0wLC6A92VZ/XOk8halorBgemp7iOLUmgLqWHx
 9Fx9UeayiMyDSApf8dhPEpc9D7A38cdDA428jwuz5SVEGnCsqXN7kvjGD8sj9d0Sh0oBN2eahk=
X-Google-Smtp-Source: AGHT+IGknsZTNpYummwD6cRDXQTmOcxwkFHC7zIvyVNfVkn7FqqmuPMLFYu3uyfB6sOvhYr3Ms/Luw==
X-Received: by 2002:a05:6870:b48f:b0:296:e598:f28c with SMTP id
 586e51a60fabf-29dc3f9ef1cmr3604802fac.8.1732739771227; 
 Wed, 27 Nov 2024 12:36:11 -0800 (PST)
Received: from localhost.localdomain ([173.216.50.143])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29de901ee76sm5532fac.21.2024.11.27.12.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 12:36:10 -0800 (PST)
From: Guy Chronister <guyc.linux.patches@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Guy Chronister <guyc.linux.patches@gmail.com>
Subject: [PATCH] drm:panel-orientation-quirks Added DeckHD support to panel
 orientation quirks for Steam Deck This commit introduces a new quirk to
 handle specific orientation issues for DeckHD panels on the Steam Deck. The
 quirk ensures the correct display orientation for these panels,
 enhancing the user experience on Steam Deck devices. Tested on my Steam Deck
 to ensure reliability. Feedback and further testing are welcome.
Date: Wed, 27 Nov 2024 14:35:45 -0600
Message-ID: <20241127203545.17475-1-guyc.linux.patches@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Nov 2024 22:47:27 +0000
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

Signed-off-by: Guy Chronister <guyc.linux.patches@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3f2e2b851cbc..c412273799cb 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -456,6 +456,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) with DeckHD */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.45.2

