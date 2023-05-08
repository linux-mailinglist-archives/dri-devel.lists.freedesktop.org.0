Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8C6FBAB2
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 00:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182B10E30E;
	Mon,  8 May 2023 22:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAE010E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8fPVaXiLVTx7ZwSnC6x76Es48miiHLghcFCp8IrvqdY=; b=LNz81FiZ++bmUVwhjKYvDpnf8R
 vW0MCnzHhCVO9onSTBRqTnIm9gFGhXGEUcQL9zHqA44Bq4vkUmqu0N1/fsSspcxYtoHIsYIcRPSaz
 uPtN2qN5CEsbeHfx9C4KYu8EhnD9KxPwzTA+afd6seAhhXBcPPQH+WQxy9CzPGlaQsUd3SgkBIQAy
 eNyuxpjGpdORusvr54tg32sBVvrtnv1kDsa+n9ZKP5rz2UY5ZZOywdzQJH8wEa5ZdWqlWGFjPYbhZ
 y7mSU5q85irLgwgbqvZNwpGnTrKIak2r6o/bLfm89sG+V5IYv+SN9WxqZu/5NUszGeKVm2ddgeAd3
 k0GbC4VA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pw8uW-004FTw-NZ; Tue, 09 May 2023 00:00:49 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 2/2] drm/vkms: Fix all kernel-doc warnings of the
 vkms_composer file
Date: Mon,  8 May 2023 19:00:30 -0300
Message-Id: <20230508220030.434118-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508220030.434118-1-mcanal@igalia.com>
References: <20230508220030.434118-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warnings:

drivers/gpu/drm/vkms/vkms_composer.c:42: warning: Function parameter or member 'frame_info' not described in 'pre_mul_alpha_blend'
drivers/gpu/drm/vkms/vkms_composer.c:42: warning: Excess function parameter 'src_frame_info' description in 'pre_mul_alpha_blend'
drivers/gpu/drm/vkms/vkms_composer.c:93: warning: Cannot understand  * @wb_frame_info: The writeback frame buffer metadata
 on line 93 - I thought it was a doc line

by correcting variable names and adding function name.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..1636ce3a79f9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -23,7 +23,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @src_frame_info: source framebuffer's metadata
+ * @frame_info: Source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
  *
@@ -90,11 +90,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 /**
- * @wb_frame_info: The writeback frame buffer metadata
+ * blend - blend the pixels from all planes and compute crc
+ * @wb: The writeback frame buffer metadata
  * @crtc_state: The crtc state
  * @crc32: The crc output of the final frame
  * @output_buffer: A buffer of a row that will receive the result of the blend(s)
  * @stage_buffer: The line with the pixels from plane being blend to the output
+ * @row_size: The size, in bytes, of a single row
  *
  * This function blends the pixels (Using the `pre_mul_alpha_blend`)
  * from all planes, calculates the crc32 of the output from the former step,
-- 
2.40.1

