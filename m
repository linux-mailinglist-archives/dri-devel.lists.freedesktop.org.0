Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD082E6A19
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 19:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D341189701;
	Mon, 28 Dec 2020 18:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2D4896EC;
 Mon, 28 Dec 2020 18:51:25 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id q22so15390712eja.2;
 Mon, 28 Dec 2020 10:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+le7aA/2+xijmCC6yqV0fNAJrARDNIoK5ZCFA7a3blo=;
 b=N7y0UXpQ7DReSMgvUxtCTF57Ciwl3JpI33FtTX+fmZq+WcKWnXLPriOhk/MM2WzwB4
 CSkZaeF/BxPeRiUbunK9fxg3Xv/NPCAfhmhT6I9TrWfTvQw8wOm2hmUUhpOlTAo6ePwg
 /HxKlBcM71cP0Syw/+Ld4wh4M6PyTPEUY19m3LJrJmxmMYgsVCypYVXThj/H38uQcqk1
 wVUbfA48gMT0agE9TM6ZREXlTvg6jlgvrASrUvEImnsReF81tFfpvjgzDVuuHCxumRt5
 EpACOgGo1jXeZS5QQsVu1w/BfmAeHRtSfKDTsW0rNWjqinIFwSpmVFWvaiTOQQ221c4d
 6G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+le7aA/2+xijmCC6yqV0fNAJrARDNIoK5ZCFA7a3blo=;
 b=uJaBVxtlwpChxmkLw9MXpB5HHs2Wos2I2xFv1rXppaCBnqzwbOvspSOExXt0gUjCLw
 xYlw9bcNlzDQIyWJa8oN4CwrCltlhYkQXtAtIIgae+L767vQO7AEUCfr4QxuCe/CCaFU
 /Pn5gfOG6AdMgmXlYB2jnIjmaINEkRE3wj/ogEKqOHmGaHtHwCkMZcsBqW9NmUkPcfrw
 473xn2++e2D8b6VccuymRSbcYCETIlnbuvR5zKigNJw4aJwyWyqWqKmZN3fuvwL6WtNw
 GK+9cRpvOMoaGJXPuJM+rCFo8kzk8Yc3EoDB5upJZm2JFJUcop8JI8DgzTHRYVimVzUE
 uW4A==
X-Gm-Message-State: AOAM532v9K4YSUSOJ5QaAP20ehlPz/hnCgtGM8dfPACk3QWnAYD3jyrr
 vHXAI1ayCZqEDK1ns92oyS1mn2SnVK8=
X-Google-Smtp-Source: ABdhPJxSPgJNfU8risx3YZNjFzPxgJzjGlHLAuBeSbZCEqdzljIVqZ09jihcnmaBF+goMA+XMKHlRQ==
X-Received: by 2002:a17:906:1741:: with SMTP id
 d1mr33095602eje.182.1609181484014; 
 Mon, 28 Dec 2020 10:51:24 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8030-6e00-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:8030:6e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id x4sm37031432edr.40.2020.12.28.10.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 10:51:23 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-8/10/11.
Date: Mon, 28 Dec 2020 19:50:59 +0100
Message-Id: <20201228185059.3949-3-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hw supports fp16, this is not only useful for HDR,
but also for standard dynamic range displays, because
it allows to get more precise color reproduction with
about 11 - 12 bpc linear precision in the unorm range
0.0 - 1.0.

Working fp16 scanout+display (and HDR over HDMI) was
verified on a DCE-8 asic, so i assume that the more
recent DCE-10/11 will work equally well, now that
format-specific plane scaling constraints are properly
enforced, e.g., the inability of fp16 to scale on older
hw like DCE-8 to DCE-11.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
index 8ab9d6c79808..f20ed05a5050 100644
--- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
@@ -385,7 +385,7 @@ static const struct dc_plane_cap plane_cap = {
 	.pixel_format_support = {
 			.argb8888 = true,
 			.nv12 = false,
-			.fp16 = false
+			.fp16 = true
 	},
 
 	.max_upscale_factor = {
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index 3f63822b8e28..af208f9bd03b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
 		.pixel_format_support = {
 				.argb8888 = true,
 				.nv12 = false,
-				.fp16 = false
+				.fp16 = true
 		},
 
 		.max_upscale_factor = {
diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
index 390a0fa37239..26fe25caa281 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
@@ -402,7 +402,7 @@ static const struct dc_plane_cap plane_cap = {
 	.pixel_format_support = {
 			.argb8888 = true,
 			.nv12 = false,
-			.fp16 = false
+			.fp16 = true
 	},
 
 	.max_upscale_factor = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
