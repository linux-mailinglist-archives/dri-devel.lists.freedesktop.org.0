Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA95296EC15
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883010E182;
	Fri,  6 Sep 2024 07:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ox/iFnjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909910E343
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 22:39:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-206aee4073cso13747965ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 15:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725575963; x=1726180763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rCDYYiCppuB7n7e+YXIEe54LH8OdKy8Qsr87xme6vNA=;
 b=Ox/iFnjRT2MJI5uKvr9M8D7ntKuT98fZuNKIAjLEgfx1IOJ2zQRrxZA4jWWz/B8qpY
 keuQISiEK9oVWgqEIjZ0qbMPpWRlHrohGE8FNXdTUdGFXIz8gJ4fOAYy/WlDshg9VjaS
 zphvx32lJa8M9mEPOFe9rNSoxs/D8h04McQTVetDzfFIgUEddEuzfvICeHSu+McK1jsA
 ZWGZ0qrE3W7QahAV8LTq7idqkHGKEzB9gQLzjbJmf5r24OtHGLclSIladUHuwOlQsxMt
 mWstalojEjDoVSYFfc9fzYn5683ulF/fFUCGa+xMZROKOt7QpmBeaPe4YMBoiCi8hIbA
 mp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725575963; x=1726180763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCDYYiCppuB7n7e+YXIEe54LH8OdKy8Qsr87xme6vNA=;
 b=PSpfdcqMjmQErjzEPZIRRze1MYItPh3w9wp4DYARPxz5daV/Zv379b7KqaYOCOuP/L
 et6XT9fbN1xmKcSBkpXI/t0SvuyNSVBn30ZRN+iqbdSbgUCz7vsYTIJFpBApLfNMfH9/
 PUJsliXmjFarrX2+wNF0p3SnjziUc7i3kxgsouenRJoSRd19AM+de9WhfbomRszKLxGB
 MNkllYu0iQWkZjmW35+ztzf+Scwl12rMLl751eldAG9eGnspxjgbbjiomSHIMwh2bjhz
 GgvxMGvI2hYzT6LbtBOX2rEbQpbLDPlBUKq0APDImXxkmARlw4sp03GDBEJF/9peqJ5V
 IivQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX58lpv14rf/QDDMGJGJcfwRrx16W0qEp2xR2QBD7+4Rd/hc71BJRFtRRNQHZhN8N2aPx5qn6j0cTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo3+ZmsMVhyY3DdoqMct6bdXLI3uhaSUQLYtj/sg/aus1nS0Ty
 E0wWbwZm9+2Bq6n9Rs7vxQ0BHlI6xacEdNFgLE8ITCJ34EHJuZ1v
X-Google-Smtp-Source: AGHT+IFdDlOtC7QKiZljAYe/nH8z6tsEcq87j6lrJJXzigssQI2/0okjfjiTxKTZxUmFaIUPQUJsvQ==
X-Received: by 2002:a17:902:f610:b0:205:eec:5755 with SMTP id
 d9443c01a7336-206f0526051mr8889545ad.23.1725575962683; 
 Thu, 05 Sep 2024 15:39:22 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea574dbsm33185335ad.214.2024.09.05.15.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:39:22 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: include rockchip_drm_drv.h
Date: Fri,  6 Sep 2024 06:38:50 +0800
Message-ID: <20240905223852.188355-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Sep 2024 07:36:24 +0000
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

Include rockchip_drm_drv.h to fix the follow sparse warning:

drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
warning: symbol 'vop2_platform_driver' was not declared.
Should it be static?

No functional change intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 18efb3fe1c00..c678d1b0fd7c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -14,6 +14,7 @@
 #include <drm/drm_print.h>
 
 #include "rockchip_drm_vop2.h"
+#include "rockchip_drm_drv.h"
 
 static const uint32_t formats_cluster[] = {
 	DRM_FORMAT_XRGB2101010,
-- 
2.43.0

