Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0D91C7AA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6710E0A8;
	Fri, 28 Jun 2024 20:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="EmwXJwsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCEE10E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:58:58 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-711b1512aeaso777146a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719608338; x=1720213138;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rye0EiFm+y+n48tR08Db7FMxQ3LsbJVQj2rHhzZ+sco=;
 b=EmwXJwsbbxu/BhuStv9xOGAf1JNX1CNfBz0a4XMWrlfjGki1FzxDGMZqpZmZYkKX3s
 ZAry+FoZCgerwKU/yy3Qy27H9Vn4vmeZYrVZgzxmJtQjxEg4mvxXifbBfXy8WIdTkgRp
 vKYd+gQNErj+Bo3j8yEhzx+pF1PqOYJ9R9a+1ah9UmZG1OFnhCQxSEhtbkkRsxw78LDe
 gVzn+OC/1MWUo8tygOTq+Z0orhra6nqsXyHTiiLASRfus2yvp+kltKHcNUOTS04yNFnI
 c4iJM80lZqkrIOyjm/09ZoVJw/mnSuI0uuk6OvUP+SQu4/SJ3ZrM0CNClRHmllmYAi+1
 bYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719608338; x=1720213138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rye0EiFm+y+n48tR08Db7FMxQ3LsbJVQj2rHhzZ+sco=;
 b=Waf1n1TDZ9omYNLabCvgpggKBaBjHa7NeA3UH6QhyiPRU44ftUmNfLbVOTFkN8Iohf
 gScP2Zc6gHYcXritBBYjOyjBnq5H/Y4cttJa9Y1NbzST3bfIEyhwFWPk3jx/tVBHIEom
 1DXyvkvBP9MXpdv6aaG3mNmL4ROB2MbIpNG7fqL8k7cufaetBFAonhRXW9hN4DxdFlkO
 e9um0f5Wa/ahvKFJpI30t2l29FwN7DqzPljpur2foSW8mOtOjVic20kANAuRxtKrEKrA
 qrHdDROmpf0oThJjrK55NG6WLWaPyd1sZW6gyWJ7KeRgX+P5QHwCin1ofc26H59YMLiG
 Yngw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTP8/PAXpAA0flu5jCXN/79YFz0YOo6eyE0Nk/aQPMUxzxHG9Ve28bo7SxHMwku/PQH9o3ZEgUy//Xu3yDfnhZsvcpFpwO0iHxeM2icaDX
X-Gm-Message-State: AOJu0YyzKZ20iWWz0ZKISEZivRIezv1p+WAOHB7eQTL3XnLmQ3LYuNNV
 2fPvNxNHbca3gMFNZ8jsMjT/acl1Ohwm2dcRaICUsJPqtMhWgghGYoJBBJshUg==
X-Google-Smtp-Source: AGHT+IFxcOZjCVKeJGUxY9sk7tLOxg5KrpbtDuxwmb3yPHYRKFjrg4zi+5dpufDNlzWlKN+XkJYPEQ==
X-Received: by 2002:a05:6a20:7195:b0:1be:c81d:7314 with SMTP id
 adf61e73a8af0-1bec81d7620mr7419100637.8.1719608337668; 
 Fri, 28 Jun 2024 13:58:57 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1568f4esm19709635ad.191.2024.06.28.13.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:58:57 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, John Schoenick <johns@valvesoftware.com>,
 Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v4 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
Date: Fri, 28 Jun 2024 13:58:21 -0700
Message-ID: <20240628205822.348402-2-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628205822.348402-1-mattschwartz@gwu.edu>
References: <20240628205822.348402-1-mattschwartz@gwu.edu>
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

From: John Schoenick <johns@valvesoftware.com>

Valve's Steam Deck Galileo revision has a 800x1280 OLED panel

Signed-off-by: John Schoenick <johns@valvesoftware.com>
Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
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

