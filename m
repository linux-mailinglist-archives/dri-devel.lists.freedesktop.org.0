Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69957FA3B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB0B10E2CD;
	Mon, 27 Nov 2023 14:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B26C10E2C7;
 Mon, 27 Nov 2023 14:54:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c59a4dd14cso48276261fa.2; 
 Mon, 27 Nov 2023 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701096881; x=1701701681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VSEG4sTiIvOaqG5bPt1ilhvbIlmU0KB6Os6E4jKcDYY=;
 b=UghI6OablC1xZBRNlh9GHci4VTRAebfCJ2cmUbaryt7h/rz1d+ubSo0zOZvoQeai2h
 FQ30++PkVn9JAWnvCP4V8xnwKfA4jEzNroyT8EdjVBiz/5yVHYBByHlpw1lTRtp1pHR0
 i0FBylsiYGcVnz1lQy19ICB4JDlZB0hhOjS9dBTcM+1+ZIhLbbop6XVem8dGZSXBO8si
 khCfwzjOYOjjl/wNMPND9VPOT35qk4qFZ6TM0mA9Dc7lhYYb/PyiJkfBqPFLaRE3V7Ni
 YLHAbKWS2CdxXIgAAB5DkDhhnyL7vKlEo6kC33PZmruiX4oRrH0KfU3QhvOBLh66qnT7
 lmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701096881; x=1701701681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VSEG4sTiIvOaqG5bPt1ilhvbIlmU0KB6Os6E4jKcDYY=;
 b=pPr1eXT/o5UcurfuptaSiTc8dc9ZYnA9ds8+mC5GPlI3b3cz1HTF51XI/re0HbYQpy
 VVr1dEybnMWUreXd4r+AAeKdhUFYRFTWUliYwpTk/2y5maA8iWBd8+pTmASfwcjkVd7w
 UHm9TzKLgDnKXClo/M1SyN0AYFfvhFFuLaK+Q8m9LE3bHM/n94zpdER6zy00YqOuTyL8
 E3k902gddWQx4ftXO/Yz6rbz3Skunb9KTgAxFdVBxZwO+lL3/5Sbv7t+hqxOZcba2qap
 P5zoCGRabCk9V0iktuo9cLjILklUMSlvzXUIBcvD4JaAu8Fh5qxlC2oxSxuftfz9tcUh
 8qKw==
X-Gm-Message-State: AOJu0YxT8qD3PnV9LyIkIYRNaaT2mppxBoEX9D45FLNot+7NCd1G7AE/
 B0y++T9TDbf0/oIMdeJqYcw=
X-Google-Smtp-Source: AGHT+IHs0EIiKLSWsOIceGS/WBtO2H21E+asFh5ZpwSqtA9J2gylk2jPiKWwEEY67g6K+/9G1z/0YQ==
X-Received: by 2002:a05:651c:21b:b0:2c5:1490:1687 with SMTP id
 y27-20020a05651c021b00b002c514901687mr4916598ljn.33.1701096880939; 
 Mon, 27 Nov 2023 06:54:40 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:158f:ed00:5d13:a893:4139:6a08])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a170906074d00b00a0c3b122a1esm2888763ejb.63.2023.11.27.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:54:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jani.nikula@linux.intel.com, kherbst@redhat.com, dakr@redhat.com,
 zackr@vmware.com, marek.olsak@amd.com,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Mon, 27 Nov 2023 15:54:37 +0100
Message-Id: <20231127145437.15060-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127145437.15060-1-christian.koenig@amd.com>
References: <20231127145437.15060-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index aa0dd6dad068..ddc8fb4db678 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_BUSY;
 		c++;
 	}
 
-- 
2.34.1

