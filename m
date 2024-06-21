Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C81912971
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0144A10F1FE;
	Fri, 21 Jun 2024 15:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="s3pcarYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com
 [209.85.218.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740CD10F1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:40 +0000 (UTC)
Received: by mail-ej1-f100.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so274089466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983299; x=1719588099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGXXtdK5itWY2uJwGaO+JZpa8r9M+Ht3RJhNVWjut8E=;
 b=s3pcarYie6/9WZ+PCwk+yEa1oMY+C9BilFdxj43vjg5lxLobsGPmFbat8Ffm7TAwF7
 /i3OUz6yGg5len4O1QAOW2uqY9FIJyLRtsqr4SXDTdoIopKnUiSIvfjgGqGKKhdBx9H4
 qtzZitmMbw5vrxOactedlfvUTyXS3vVKmeUG40lGAPUVVAaL4sPCQW1RwFy8Ut5aPNPr
 WeXyUSrtHoj4GRgv2iokJZBogMjRD0lOg9KXCwXyb5CNaFyrKnuoKb9AMAojr1VLWXg/
 4VglBt5f1Pk9QCwVsTyNGHK9bS0UxjEPi8qVQH9KRKhIIzFsYZH0s14xcjy4nYj8EH2v
 myDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983299; x=1719588099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGXXtdK5itWY2uJwGaO+JZpa8r9M+Ht3RJhNVWjut8E=;
 b=bKt6oQx/b5FCql6MESCT8BpU8bJmLqhnOBwtmfG30LIo2Ap4VuHupnutLmzkKeJd0q
 idnEJn4K2CasmilWd4vcg8oGH72DDh+n+a7Drq4pe8XpMBDgG6wMutneP43rC3r1Lbaa
 +EGZb5Q2veyUVwMNUI960v4qJcGYMLDHJkfK7OQVR2DUDtPiGZ7U4zffVGIYgJ7oVaLI
 I9fnNSo+6uyJei6QIH+B4DWLxO/LuL5MZtsBo4IYJYVrnO6Jp07cpGS+EMp0xvd7N4bK
 aOeGxuOJoyCarya4+IOwErOhfAJciRb6wkoOG4bxTRA4qHmyK0MgrleYrVWpAh0CQtg/
 OVYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV59I1/z8GhDNU73f1AXIpCDRMp3ScUqXNK5Ako5dG3pFiYINYMWDHxnscEXgpzCvgOeXd3edvwE/Nu185YQRJK7GKb0KV5VZ+0jR4QIl4p
X-Gm-Message-State: AOJu0YxBocmbh8oqTBTK+nX2513NXk1m3u7xT19X/araOSRge5WfGxN0
 5FGP7iqJdJi5VCdyLy2YQQDAQFyLR+khojmWtrDxx++0tGmdMY/Nrnq54RAcDZiYv/R0EJENBMU
 7o/aMBb59RNI96OrreNqAIhKWemWyUwfa
X-Google-Smtp-Source: AGHT+IGzMpeFfE65xhnyabua6GB3MH7epsKsmcWMZgim0uny8znuNcMs36NLDL5TCKo4S6ohSoYoaghw3n8s
X-Received: by 2002:a17:906:2584:b0:a6f:4804:d41a with SMTP id
 a640c23a62f3a-a6fab7790admr609796766b.55.1718983298899; 
 Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf4860e8sm5682866b.114.2024.06.21.08.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 14/31] drm/vc4: hvs: Don't write gamma luts on 2711
Date: Fri, 21 Jun 2024 16:20:38 +0100
Message-Id: <20240621152055.4180873-15-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
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

