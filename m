Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107A767D36
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 10:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301D510E040;
	Sat, 29 Jul 2023 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880C610E134
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 20:07:39 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bbc7b2133fso16138485ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1690574859; x=1691179659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0dGyL1Lliy4sMGhP4x4gJQppxXscqT/ISt433fAY9RA=;
 b=s6U7BS0q7z0qtro9bHXdVq5BC1p3hXjPrOeucRC0GzbIZcbfMKBhOQl/xLux2UIGNO
 thfzCUO7CbcHfM/k8FL1Al1aUMWLa6qIlYfQ54Q+0FE9cuk73AI/+9sBaB69F/+TxWPx
 Cs448XMcw2U6tumGjfZWiKzBH0PAlkmP/i8SNdHJCbKXbDS/7d3nOiB73e9/iEl2T3yH
 IEpKH8O6ewhE8hZ8RVNDiOSy9A+OUMfPvHdYqAqWRauauDOFTzyZETtJcG4n480k0y2y
 Kpc7UPP7RVUszzo9WRnRaFbWx08EfpD0mhSLvpqUqynZKQ7zFk/6Knb6Hp5Nfak7Epsz
 UkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690574859; x=1691179659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dGyL1Lliy4sMGhP4x4gJQppxXscqT/ISt433fAY9RA=;
 b=UZbL+DrcWY8dO9pNBzMrma5qCMldEwUOFXLe9P96qJg8sZ7KWjc7WFeuniXv90KPZf
 xGywFwOV1PT2+JmgdmTR+vn+2QTWdmv7/lCwuH9WjxitaOY2tiOdxaNnZ93hN1VZ8Diq
 1R7Iltjyfm9BxpDK3KC3ozapUAQBDGX8kGLjorChXnPqYn+ptI5OKbyvsEmJNNBsgYrT
 FNGGI/Hb4SiIxn26lRCrtfmsVt6FWnYkPm2Gxig6qw816NMjA12NpqfjQFZ/jQrqhTry
 PfNkz16D8J3/MQGn4j/LvQqAHETCiIX7HxMDyhB2ckKRRVVu08486wa4OwuFV/shgqho
 L8HQ==
X-Gm-Message-State: ABy/qLadnWdZ4/dQ7qHv874ODPrd3niujAlPn9fv4tvaSP/sjDfgkgXr
 KjdL44/0et+wVfl4fKNR6FKXOA==
X-Google-Smtp-Source: APBJJlF7QzLqxFraslwo86e5wHaek5rbivk5hmKBqyqAKscJabDE4Vi3qBlicb81r5kyjn/cjIZ73w==
X-Received: by 2002:a17:903:11d0:b0:1b6:bced:1dd6 with SMTP id
 q16-20020a17090311d000b001b6bced1dd6mr2871541plh.35.1690574859061; 
 Fri, 28 Jul 2023 13:07:39 -0700 (PDT)
Received: from D100-Linux.hq.igel.co.jp (69-165-247-94.cable.teksavvy.com.
 [69.165.247.94]) by smtp.gmail.com with ESMTPSA id
 l5-20020a170903120500b001b830d8bc40sm3980848plh.74.2023.07.28.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 13:07:38 -0700 (PDT)
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Date: Fri, 28 Jul 2023 16:07:13 -0400
Message-Id: <20230728200714.2084223-1-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jul 2023 08:40:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, taki@igel.co.jp,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add additional pixel formats for which blending is disabling when
DRM_MODE_BLEND_PIXEL_NONE is set.

Refactor the fourcc selection into a separate function to handle the
increased number of formats.

Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 45c05d0ffc70..96241c03b60f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
 	DRM_FORMAT_Y212,
 };
 
+static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
+{
+	u32 fourcc = state->format->fourcc;
+
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+
+		case DRM_FORMAT_BGRA8888:
+			fourcc = DRM_FORMAT_BGRX8888;
+			break;
+
+		case DRM_FORMAT_RGBA1010102:
+			fourcc = DRM_FORMAT_RGBX1010102;
+			break;
+		}
+	}
+
+	return fourcc;
+}
+
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -189,7 +220,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		.alpha = state->state.alpha >> 8,
 		.zpos = state->state.zpos,
 	};
-	u32 fourcc = state->format->fourcc;
+	u32 fourcc = rcar_du_vsp_state_get_format(state);
 	unsigned int i;
 
 	cfg.src.left = state->state.src.x1 >> 16;
@@ -206,22 +237,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
 			   + fb->offsets[i];
 
-	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
-		switch (fourcc) {
-		case DRM_FORMAT_ARGB1555:
-			fourcc = DRM_FORMAT_XRGB1555;
-			break;
-
-		case DRM_FORMAT_ARGB4444:
-			fourcc = DRM_FORMAT_XRGB4444;
-			break;
-
-		case DRM_FORMAT_ARGB8888:
-			fourcc = DRM_FORMAT_XRGB8888;
-			break;
-		}
-	}
-
 	format = rcar_du_format_info(fourcc);
 	cfg.pixelformat = format->v4l2;
 
-- 
2.25.1

