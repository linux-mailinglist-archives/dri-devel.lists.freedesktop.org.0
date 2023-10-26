Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAB7D87C1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D9610E847;
	Thu, 26 Oct 2023 17:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC010E837;
 Thu, 26 Oct 2023 17:44:58 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-41cd4446cf5so8030871cf.3; 
 Thu, 26 Oct 2023 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698342297; x=1698947097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1MkdQcJQtKVDVaI8kmUzIfVjDktyryYzfKLcGyylpFM=;
 b=Qw8Mt+8p3X/sDP9ePKMaV4XJqtGkbMFcgiYBwjNjZwlli51gCdZ9bLsaNYW4vGbyd0
 UlxQxWX/wxRCYDG5sj46v3ZfRu/LM2EnADTVjb4OQF2ob78Tls82Wr+I8+l7zQmMNVPm
 EmCYrGQP36DeJsmjNq+1dxwbTXEB7Coz/eqp0v6SS79lChsHA2r86mPaSYuzxMXc8pkH
 LVj+ZB3H5LtwGkLX9RFHbUxtvd+VQtX5UkNp1af+DY0u5tt/+b5jFFV6WgZPv5fMT58Q
 f+MDyCuV4z3Qw0sc9oT4Gh3KZkcJNGsHU8EN528Jc+D6xiH5S6MWN2HBynq+5q6OOCow
 buDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698342297; x=1698947097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1MkdQcJQtKVDVaI8kmUzIfVjDktyryYzfKLcGyylpFM=;
 b=DFccXsswksDxGPzLgwvmYqMWGmqc/P1/aYmcGW4F9mu6oBCxuygFuE2uqRO8xQu3uS
 2DfHeOBUs41u5VZodwyY7Z6u0+0LAzESygUUZY/Uw1rA5R7xL4oLTtITg2w6QZ1/BC36
 kASMu+fUKdqeLO9Rh8y2ZL/5WpvsQC8Lky5xTvsXgGjL9s6ncmDIvL2kP5KlTJUCU5Ez
 8BlXpFx5xbFyc5o+D41ldJxsqDLyEQziTWuV75qgzZvFfpEfcS1qoaHyyEeFtGHuZTrw
 PLZ3QtlUWda9L9YbE7GsbBCUbiuVuAoyzCaaTnR9qOm5Y7XrcpF2afJQ56WVsKdjOMEn
 2a7w==
X-Gm-Message-State: AOJu0YzoTVJ9kcckIGDtBWjTRNIcbHg3thWVTCgPkA/UcvR16daR2qOm
 zYmpQFc2k/RnUxCOw8mMjtk+T/SoJFxP8JggBy0=
X-Google-Smtp-Source: AGHT+IHh8lhJGjzo+e8UJEYsXFkEs3s+UZYOV235CP7TIeWs5EdUiFesOCXrW3VpJjOoHJTyAa8THA==
X-Received: by 2002:a05:622a:154:b0:417:b00f:9c8a with SMTP id
 v20-20020a05622a015400b00417b00f9c8amr325269qtw.27.1698342296969; 
 Thu, 26 Oct 2023 10:44:56 -0700 (PDT)
Received: from localhost.localdomain ([64.231.246.137])
 by smtp.gmail.com with ESMTPSA id
 d20-20020ac86694000000b00400a99b8b38sm5168630qtp.78.2023.10.26.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 10:44:56 -0700 (PDT)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Update the GPU Scheduler email
Date: Thu, 26 Oct 2023 13:44:39 -0400
Message-ID: <20231026174438.18427-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-check-string-leak: v1.1
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the GPU Scheduler maintainer email.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4452508bc1b040..f13e476ed8038b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7153,7 +7153,7 @@ F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
-M:	Luben Tuikov <luben.tuikov@amd.com>
+M:	Luben Tuikov <ltuikov89@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc

base-commit: 56e449603f0ac580700621a356d35d5716a62ce5
-- 
2.42.0

