Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE86912684
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64010E6E1;
	Fri, 21 Jun 2024 13:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WBbUllaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com
 [209.85.208.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C09A10E6E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:19:37 +0000 (UTC)
Received: by mail-ed1-f97.google.com with SMTP id
 4fb4d7f45d1cf-57d10354955so2210608a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718975976; x=1719580776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ywqgUozraqYshx47u4jI8RUlSAv6wf2P9H7IH0f1xAo=;
 b=WBbUllaHR/U8c+xvgp+Tu6IgAa31k+sx3Dkn2eOSUCUwEXOnXsJ7i4/GFpmqibmHEJ
 sVcWSCCjyLiI+xDLBCApVQZpdVYgX6AfcANoGVAirhInZNepk77mQ+YgrXXhTm/sT+yD
 uNFJqdWZXVoiiebmwrqek7Jpfj+WmrXHY6qRiyHJUrGUw+GwvS8/4ivOzwuaINXTU7+1
 G3E9khUCM7jbmcJwGdu69Nqp1PnD9IGfNe8pfuDewv9O+omBe4ZBaqstkRvmLRZMzYyc
 7ETcPQEtBGWXCA+BqNOFXl5gZbBtaKq5plmj6RhUzaCxk+Le84X5Tq2tOvq/8LgIv42o
 sYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718975976; x=1719580776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ywqgUozraqYshx47u4jI8RUlSAv6wf2P9H7IH0f1xAo=;
 b=q08n4Qjp3Crbio0ntOuoSWSe55LkrJ9gvAFeaKJsvIurD7HXaV+/8FQyVy9VmY/3Lz
 ea/MtQHmAag5KecFJpek7evhBNRLILveRJYW9nBl+2k8EU1VN19I1wUz2k7+p0EL+s8Y
 lpozhSo6RMxGUUJ/nwyaNaXApVIJnfBGp/6LnHnszEBahlOz/eqVrMPzC9QXRfLbKEKh
 uTRMsmI43lZhmfSWZNMLMLLE0cLBKbmFdMjEFzn0recRI01POiBO7QKzyvcydjYg0m+Q
 GC2PTXifLuaXDvwHOcsY4lK7Iil1ah3Eg0JTWfcexTepec1i4I2oYtOR93GtGsNLGGH0
 8pEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU4NdD1IDlCCvbgiq2WDNF8o1ABAJLq4pGPIA9GIcER4xzsLk+EMz2rJvkrUiaaYsgB/XD4g36zGLr1Ss8Gqobi9/6tq5C2P5Q0KpNSo9l
X-Gm-Message-State: AOJu0YxxP/+DXfsSiLIPzXD1FnbbhiUMxKTNFc5ZakS9lgz0TQeiDES/
 L0TvuHDeH4HAmYuUxjIf7GlUvT8ImeoBd/5nTEAJol7QAAUiBGwjsS7v/ouOaIg2Z0ca3JTsBdz
 LCVyCTN7mBXSsPYjexDkrM6WQQvoorH5G
X-Google-Smtp-Source: AGHT+IE8U46ju+ybrG/Rx2Vzp4N6v27VN6j8n+u25aLnXW0S9ZEwDZZhxgamy3ur/j4ffUnG/J7SLhtrZvnR
X-Received: by 2002:a50:c35a:0:b0:57c:4db6:c0fc with SMTP id
 4fb4d7f45d1cf-57d07e7acdbmr4405556a12.10.1718975975405; 
 Fri, 21 Jun 2024 06:19:35 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 4fb4d7f45d1cf-57d303c64c4sm28772a12.0.2024.06.21.06.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 06:19:35 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 1/2] MAINTAINERS: drm: vc4: Add Raspberry Pi as maintainers
Date: Fri, 21 Jun 2024 14:19:25 +0100
Message-Id: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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

Add myself as maintainer for VC4 alongside Maxime, and
our internal review list as reviewer.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---

v1->v2
Changed the internal list from M to R.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1566c647a50..8dabcb16d29f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7520,6 +7520,8 @@ F:	include/uapi/drm/v3d_drm.h
 
 DRM DRIVERS FOR VC4
 M:	Maxime Ripard <mripard@kernel.org>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 S:	Supported
 T:	git git://github.com/anholt/linux
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.34.1

