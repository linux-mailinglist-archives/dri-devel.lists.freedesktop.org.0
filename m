Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561484F2954
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 11:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A430710F21C;
	Tue,  5 Apr 2022 09:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833DD10E088;
 Mon,  4 Apr 2022 23:33:07 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bx37so11210928ljb.4;
 Mon, 04 Apr 2022 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYcF2JgiKO3iyobrkCuRU5Bwnqu8GY+UYkhCntyAAkw=;
 b=W1gAsjOXHXd5TL2PafVBKwCAzkY5HfXPciUHtw1CalSECJqoaulG5OpfGOFU6p8NDy
 WyRAfCqNTNvossP5rgO2UsgamRarvNLZT5iTzFh+Yk2lgq+pO3AWFoogPTY0QXJIZht+
 nWcPj56EJ/8wIcZhixgkbOh2IcPoFJDoyROWr67l5a2t1Wmqwsu4xiUbmzNr6v9k7Q1K
 jiL6q6HTyO+QfkeKgAUnGrUtID/t7HGLmaKMegtkckswGfLDe7qTLDDffudxsi6Y+sjD
 Ik3iqZXbJAAS8DSuF1v31KJmP2FzQiUS+ZJN/Otf7Tk68v0BMaGss7YgRr4x/dLdXa6p
 5cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYcF2JgiKO3iyobrkCuRU5Bwnqu8GY+UYkhCntyAAkw=;
 b=hHx8V0uowSYDV+XtTlx2tgSQ6L7DWHoHK0fA1ouyKU5D+q1+yWSypzMprFYrNVgFrf
 YsfZPDLaxCcp9G3H9UzZyBaOHASsjB7YB6LupQ78w6fa9vwE1ow0kMhQ07ek9760s4bN
 cGgVA2FFmeKzZrKApFI4o0MVHzkiWcHSVNEJXNvwc9iY05h4CwCdXfLyVdWMnH//UiFe
 cAAjJHyyk1UmC2tGLINP7SUn6jUhJNnBeFor72HvoBkTJQu6pi4aJqXUrJG3brFirVO4
 HXWtkG92VbnckKBDF4tJFHe2QtmiAjCK04gJW5CRZGQURHVLzWVov4G1LZZr854H+R7j
 8yJA==
X-Gm-Message-State: AOAM5300atNjj8f3lvEnckEJ7xJNUG+jm4KVDAGVDBUyhpODK+Hh3AHw
 fMuP3gRn9Jh0OCW8h3ueK3w=
X-Google-Smtp-Source: ABdhPJwRP8euVP8PJVykYTC47Km7db9gS6a+mK1PxM84xFd0Qefdqyn7QAmC+Mm+J/tUMjvzOrUWvg==
X-Received: by 2002:a2e:9d91:0:b0:24b:a3:d784 with SMTP id
 c17-20020a2e9d91000000b0024b00a3d784mr292752ljj.461.1649115185641; 
 Mon, 04 Apr 2022 16:33:05 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:1093:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 e11-20020a2e984b000000b00249b8b68f61sm1196639ljj.74.2022.04.04.16.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 16:33:05 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Junk code
Date: Tue,  5 Apr 2022 02:33:04 +0300
Message-Id: <20220404233306.2207-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Apr 2022 09:07:16 +0000
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
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Claudio Suarez <cssk@net-c.es>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable igp_lane_info always is 0. 0 & any value = 0 and false.
In this way, all сonditional statements will false.
Therefore, it is not clear what this code does.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 2b0cc793291c..100bad2f5901 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -769,7 +769,6 @@ amdgpu_atombios_encoder_setup_dig_transmitter(struct drm_encoder *encoder, int a
 	int dp_clock = 0;
 	int dp_lane_count = 0;
 	int connector_object_id = 0;
-	int igp_lane_info = 0;
 	int dig_encoder = dig->dig_encoder;
 	int hpd_id = AMDGPU_HPD_NONE;
 
@@ -852,26 +851,6 @@ amdgpu_atombios_encoder_setup_dig_transmitter(struct drm_encoder *encoder, int a
 			else
 				args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_DIG1_ENCODER;
 
-			if ((adev->flags & AMD_IS_APU) &&
-			    (amdgpu_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_UNIPHY)) {
-				if (is_dp ||
-				    !amdgpu_dig_monitor_is_duallink(encoder, amdgpu_encoder->pixel_clock)) {
-					if (igp_lane_info & 0x1)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_0_3;
-					else if (igp_lane_info & 0x2)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_4_7;
-					else if (igp_lane_info & 0x4)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_8_11;
-					else if (igp_lane_info & 0x8)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_12_15;
-				} else {
-					if (igp_lane_info & 0x3)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_0_7;
-					else if (igp_lane_info & 0xc)
-						args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LANE_8_15;
-				}
-			}
-
 			if (dig->linkb)
 				args.v1.ucConfig |= ATOM_TRANSMITTER_CONFIG_LINKB;
 			else
-- 
2.35.1

