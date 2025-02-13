Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30332A35133
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4010E157;
	Thu, 13 Feb 2025 22:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910DE10E157
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:17 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72700b5056bso752417a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485517; x=1740090317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eTQnFsqbcvmvatv+aySiG7hGLvYa4g1Z3Z6TofLd/w=;
 b=bchbMuhfRlnLNvxQHuJc/qmpMjn1MpOzvBcgf4P2A+XFMsS0akKcZI7bOIoHCDcqzU
 5tVvvffiuA1/dNGKLuFfg6/+Wwl6u9MJz/UfBRs8ibHIW+2B2Jh+7OdFx+I8FIAehwLL
 HhZYQpBLOXe3RYSA3GhZjjFsfu1sEN6RnLlRcarM+pUkZnnYwzgZEDjwXmEr89dM9vRj
 To1DOJndo4UU3E8g4ZEKIGlUNVKGPScv3Gph/KAQLLLP57YXRl8mWoEolq/4rMMqixZ+
 mVeEA1BnMp+G1AeW5q8krHJuOccsGCD8Wm0DBtc6/NpuPkXCDhGJBYJ8x+x0chdWSzyY
 ybgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeuPZHvd2t//9eLnGu4c7OuV4MfR2PdMFJQNDlOIYrIMuA5qqHtfcnIjU6Ca5YurEDLM9YCqStVuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC69yn/r4RWRX/L/tKCdMvDUjKEs3xa0b/6c6lx5L/Vx04dGx5
 iL5fbs6vz1IrjhnpBQ8oIechIipmusytWwQAgu9GsPNzAXMloaI4
X-Gm-Gg: ASbGncuXVaXlTmOFIczb5pGvYBOEK+yakHxIrihB9vhTqSIrqSKrtZzsBZa7whP04bM
 xXM/auSkXTTPM3ubYX47+MuadmpfGcLYr8SN/n2gIq/FqXL6+gJAtHUlHjF5zexigbXctBzHc2h
 Ek16c8TSD2i+RVOWLTIgBmqDulGGqZjv711nQBKUkQDe7ndLDcXKalQItqpVDc+RAgvUefoFYO3
 rQLYGyFY6afJKjRoKJxCSn9NdHQtORrjxfh3nZyt/YaCSs6+uBzX60SKmhDZ3bm66xhVdvgls6/
 6yoFY5rTQkFV8Zi7
X-Google-Smtp-Source: AGHT+IHipVy8Ez4Nu22Q47V+pVq+mOtomnXSTAzpHpquTaE6egG89MM7IbaCk2ntH6Fzt5ZgWkCvcw==
X-Received: by 2002:a05:6830:6e8c:b0:71e:15f7:1a3a with SMTP id
 46e09a7af769-726fefd3a0emr2801644a34.2.1739485516705; 
 Thu, 13 Feb 2025 14:25:16 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:16 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paco Avelar <pacoavelar@hotmail.com>
Subject: [PATCH v3 4/5] drm: panel-orientation-quirks: Add new quirk for GPD
 Win 2
Date: Thu, 13 Feb 2025 22:24:52 +0000
Message-ID: <20250213222455.93533-5-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213222455.93533-1-uejji@uejji.net>
References: <20250213222455.93533-1-uejji@uejji.net>
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

From: Andrew Wyatt <fewtarius@steamfork.org>

Some GPD Win 2 units shipped with the correct DMI strings.

Add a DMI match to correctly rotate the panel on these units.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: Paco Avelar <pacoavelar@hotmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 9e6708cd1..e6148cc31 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -339,6 +339,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
 		},
 		.driver_data = (void *)&gpd_win2,
+	}, {	/* GPD Win 2 (correct DMI strings) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "WIN2")
+		},
+		.driver_data = (void *)&lcd720x1280_rightside_up,
 	}, {	/* GPD Win 3 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
-- 
2.43.0

