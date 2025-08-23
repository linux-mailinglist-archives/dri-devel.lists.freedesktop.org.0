Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43DDB32BF5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 22:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3010710E05D;
	Sat, 23 Aug 2025 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ltRxjwpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41A10E047;
 Sat, 23 Aug 2025 20:25:00 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-24615b3445dso18423175ad.0; 
 Sat, 23 Aug 2025 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755980699; x=1756585499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jluHiqgaZQZWMzm5WgOiIg71d7mItf5bX9RJ5F/RYN0=;
 b=ltRxjwpQdYcj9etIfDLuOh5aKZeQPPOSxDtDrxUh1FoTn9fIwjgZHIGGXSsUc1jLEH
 ZH7wvgY4g4bsQ1WzbXw6wfft29bSM6TzaSTnBrNa494YMhzJUkBfMWte1HhSrqgD1QNk
 24k//SpCBLs2CzuffhL979GJayPRqP9e25YcCXVzTd/X4VhcH/feAmOl/VS3ReaSogeG
 9a8UPePCz6wkGi1D9dYCBgEQlGunL60k+Yw8R+/QDZt1GvQapdrzcqUAuBvsF9ji2F+F
 x+LX/a1K8vnkLVS+1V1F/cyMEGlfyr5Rs1TY9n5VoZ15meBRTCJfmPxOQmNsMK1ieVkF
 wQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755980699; x=1756585499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jluHiqgaZQZWMzm5WgOiIg71d7mItf5bX9RJ5F/RYN0=;
 b=UE94Jzx6gJ9zqGy7M3o3kFXhBEfUUdfgbxbo1yIlpGIHu/Ltaj07fiw3ufgpkkNdzG
 Q8ezQYlCGWOQBuQlaStktVn5ZqtEI1d5LU24RDc6oBte3/Tp2I+Bh1+luUJW24H+fVIq
 WX/4bn0NpWBKGTyTlwU8Pv7UFa1YB/0qclcGRxoIML1bqSgRdz4PMAoUer70T9hCF55e
 4kbtPExT+ggPQ5PV6TucJQgtOghG1T0Wtz0B0SiyU4cS4nMsfYRL9Ky5iNy183O2ftaV
 dGV8x9CH+5AZUxhI0qkFkAWRKertPKh5jWTF/sbzcW3DQTQZJDxPghvDfvcTE5HPzq+v
 dtXQ==
X-Gm-Message-State: AOJu0Yxg7cdOOGnFApiTgvkcSLZkoKJNT2UxsjYG/S7ewIsIG+q+cQQF
 FgJRM559R02pY4hI0hGrUg8IEEH0wiJSQI7+LySni5XKvc4ZoWH7ZFmZAqoR+QlWF4c=
X-Gm-Gg: ASbGncshRqwjdumVWqtcWlB8qL/ZaF7lLUn+9cIn78XzIyiD48KzopYvEkOcDMRoYg2
 ofZ15YUAFa397QfXKElMlTGe8VN3ZDwpeoZNocICeHLzVvt03Js+wdHHL1cgChI5vYPg2P2IKY8
 b/11+B7wTS2tXV56+IWKTba5BjCN+8DeYxHQVxKULowKuYZH/6jQ0Si6QkzFDAJsDUt1OnD4lQl
 /8ilzZQzhWFNPzUc5slMW0ToZ/ADHBeIKRAFcM481NL8SvD1fhmhg28Vj+RSTWua1ZKxKH/jlDX
 NJAd2pRsmPpRn94tyD2WsRraKBUiypVNGYtD+nVKorw9Z7F8J4oHGVy5Z0i94VHCRw96x/2epO5
 wyPoY+88Dxg==
X-Google-Smtp-Source: AGHT+IGdNe2acobe7hoYy/3SG0sU0woB1Ddr0YVeZCAUQFiiD1P+atEHJGDMr/DnmavEr02jQpM7Fw==
X-Received: by 2002:a17:902:cec2:b0:240:9f9:46a0 with SMTP id
 d9443c01a7336-2462ef05828mr94011855ad.38.1755980699439; 
 Sat, 23 Aug 2025 13:24:59 -0700 (PDT)
Received: from localhost ([2a09:bac1:3680:98::10c:23])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24668889dbbsm28386195ad.132.2025.08.23.13.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 13:24:58 -0700 (PDT)
From: "Kavithesh A.S" <kavitheshnitt@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch,
 "Kavithesh A.S" <kavitheshnitt@gmail.com>
Subject: [PATCH] drm/amd/display: Document num_rmcm_3dluts in mpc_color_caps
Date: Sun, 24 Aug 2025 01:55:40 +0530
Message-ID: <20250823202540.487616-1-kavitheshnitt@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Fix a kernel-doc warning by documenting the num_rmcm_3dluts member of struct mpc_color_caps.

This is my first patch submission to the kernel, feedback is welcome

Signed-off-by: Kavithesh A.S <kavitheshnitt@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 59c077561..06f05979b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -234,6 +234,7 @@ struct lut3d_caps {
  * @ogam_ram: programmable out gamma LUT
  * @ocsc: output color space conversion matrix
  * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
+ * @num_rmcm_3dluts: number of RMCM 3D LUTS supported
  * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
  * instance
  * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
-- 
2.43.0
