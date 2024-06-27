Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714291B106
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375DE10EB30;
	Thu, 27 Jun 2024 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="OKdIIg9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C0710EB22
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:00:11 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-706b53ee183so657267b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719511211; x=1720116011;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vT0amGwlyAC8k8Kw/r8wtgGR1gR7pflMV02NL/G058g=;
 b=OKdIIg9oUHwCYjT4gc7OcZmJ2rc2DiRifk/kJL4o+X9MWK0842lKHOeiqcg/7VFJ5P
 HcwDof02geuIvtn7IxC8Y+y3b6MMPR3REUphyyo4bAFfPi7c9Z8UhmyeHEHq1rCwB6pC
 MmPdHplHn7lIbZgiBNuAL3qwAV465f2UZ+H79Y+p5+IWJcmny9f2DVQQAsVm4mWtsZcl
 GkVNNNmmqoeOLBCcM5PhjoZJrf3t7SZm9IHuEpEWfQferrIGG/y0mrvVu2sR9sc9jQ7+
 7dYHuoV1UgFEJCO3yrxK0tDYeHPHzO4QuM5Nds+w9Tz1GwBOP5Uy3rYAvUg36j0eUHrI
 nVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511211; x=1720116011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vT0amGwlyAC8k8Kw/r8wtgGR1gR7pflMV02NL/G058g=;
 b=jL04KRIOZQ83h5c2I4DIP7VDG1IM/UEAtzEQuDP7sayi4lNmx4u/oS2oU4zfFve+DS
 hB6SY7N+mzvyG8oL+eIFlS1O8KrKn1kiRfPqmvr/GizYn9jtGfWPRgvR258NaBg1rurB
 M7k8V+7DdyYA0NZPc6kosg+Xbk0tGHcmJEZ+xGjbTyIoLJoVuYaVuJ7qMpM7sUHkMgkx
 owuUMeok62N/M7JUgNV80B+gQHyEa/yFzYbodl9zpBB6rg8dkTHxYq39rtJtRTLoab/c
 9fqktC4qfHzEnKLSCHu1TB4jN7UGRbWumL9x5dpK+jiBKG2zw3MF3uqFC/m04T6CjFcm
 pdtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo6EgUAYi3MU0w0hgpwZGHmRQUAi62Wmzuz2HYH++s0pcV4GN1GEipiOBZumRw0bdGxq7f7mcS4UkyyrbgBxYbwT5tfu7bNk4++AoQirZ3
X-Gm-Message-State: AOJu0YxmCC4PpInNV+Nq6WbR70hd1HU68fkAhlaPbF+O8EQqCOFJc7oh
 YvlYOBTscRQOhpb53CTGYoKOFhxTXlbahRXbcRgvUxIrM3daiZwgOPoSnpE7+g==
X-Google-Smtp-Source: AGHT+IEVZbegkTkHIwCs4fEpExpIBikkAoMtG1beygbZS81J9sVcWUApDU7aKdJw9eeYpy34AsB93g==
X-Received: by 2002:a05:6a21:6d9e:b0:1be:c41d:b6b7 with SMTP id
 adf61e73a8af0-1bec41de2acmr7026768637.19.1719511210927; 
 Thu, 27 Jun 2024 11:00:10 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a352c0sm1718018b3a.171.2024.06.27.11.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:00:10 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH 1/2] drm: panel-orientation-quirks: Add quirk for Valve Galileo
Date: Thu, 27 Jun 2024 10:59:46 -0700
Message-ID: <20240627175947.65513-2-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627175947.65513-1-mattschwartz@gwu.edu>
References: <20240627175947.65513-1-mattschwartz@gwu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

From: John Schoenick <johns@valvesoftware.com>

Valve's Steam Deck Galileo revision has a 800x1280 OLED panel

Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
Suggested-by: Matthew Schwartz <mattschwartz@gwu.edu>
Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b35a8cf6978afbbd55c80d2d53f4f
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d127127e7cb..ac8319d38e37 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.45.2

