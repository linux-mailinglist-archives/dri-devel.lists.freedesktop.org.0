Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68CE915490
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7E10E27D;
	Mon, 24 Jun 2024 16:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WwWhdeMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214510E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:44:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so38710945e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719247445; x=1719852245; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8kHPT/Sbn+YowQq/I8VGD+WkhOqD5j84bm9SVl0pb1A=;
 b=WwWhdeMTg0tAnhAvi1G8cKgkNV59KYQOe6GIiUB5dljRe+ExaOXkp0738JN03uA48F
 QB0iwx902z3Fir/k8TT4GCAyTmP5mQh+c+VftBQzrpDHrWKcBpkeMlK6lxrrMCVp6TqE
 4lbG9ipQBNhjDH4mMdnjZ0+QWj5wxJqYjFoZDd8jakWywCSKL6k0OxQcynP1rI2ZsYmV
 lKBU10Sa0DtVuJr9asm0fMqVfQVJ/Sg4/gUW2IqN2XQb1sAK71TJlR15OxqTtT/M0XvU
 HvDpCwbf1oB7w/eY/qhpLSgPGZeKVQTcXmi/48a+vU7MoHGsnkTrc6S8UdV/VQXsA43P
 FkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247445; x=1719852245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kHPT/Sbn+YowQq/I8VGD+WkhOqD5j84bm9SVl0pb1A=;
 b=upELFrBKVgopcCVTUSckMo3XvhG6CTcqERhN2W3YrJjtdtxvueHvt60nvr9ZO1fYen
 dIu/vg5JFeD1zoN6/1mw/oFitUDd1AMEHA5g+VPVBOWGQsDmpPAcy3N/dYMaE3HF+eOc
 KpzZ68UNfY9zuII1HLWJ7GFbp7lPbRsLYAgT+cjU4bDOD8LsMH6l7vLFjqY10tUokjpn
 NkMr34em9cNOhII0nm4IfUgKtmrua2vRi7FHHmQq00WGR0wkDF5JkXKhbTbBqz1qG0TU
 BfULsiejUEbX2X5w5Z4/WEzGjYgGbQDLl7ATa5obbPodrznx5qUr9QFiktK8kK12XOgp
 B4EQ==
X-Gm-Message-State: AOJu0YxxuYo3rGou9ynpKfg8qwzV8XDGau/34//DczqkgL507r1c99Y1
 kHuV7FvZI/MXdHBZbYhCtn8f9CSU1J6rp8yhFgYrOKj4legDaC/T
X-Google-Smtp-Source: AGHT+IH+MF/1j+d+mvD3UvJmt7w30GJxIqwd74Gd3nbm7skLi+nadm6az73r+6Ot9QMhLZdiwI26aQ==
X-Received: by 2002:a05:600c:450d:b0:421:7198:3d76 with SMTP id
 5b1f17b1804b1-4248cc58b99mr34106605e9.28.1719247444697; 
 Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at.
 [84.115.213.103]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:46 +0200
Subject: [PATCH 1/3] drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-1-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=718;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j/Zhl07/mGungCEQOMBPhb09WEiiiTeekEFTk2ivabw=;
 b=nsHPwkldRVFX0qaLEQCcbPwptfpdpZshqISZVJXbL07KghajM9UUXAa/ztlPZoq/H7lrAeLum
 wFs+M1/owgeDqHH9yoZFm/ngRVpRlYSYb9NOtW91UJ8iIKqf8x5MLG9
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

None of the elements from that header is used in this file.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 02dd7dcdfedb..1418992311c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -17,7 +17,6 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
 
-#include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"

-- 
2.40.1

