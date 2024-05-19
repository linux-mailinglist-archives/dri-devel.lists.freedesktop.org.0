Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DF58C941A
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2755410E218;
	Sun, 19 May 2024 08:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M2baIs6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1910E072
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 03:10:51 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f4603237e0so958624b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716088250; x=1716693050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lFSZbZfTC226eQMjp0sS4xniwqBXpfweUGcjqkUYZ2I=;
 b=M2baIs6ptOv5fkiL4My2gAJwKnmV6n2dKHsHFs17YsLYyQqTAB9aqZEp35UFBiZQ1Y
 raSdAynecYXUdPSebspyHoDQmZBepStcUgCmuR4XFJjRXE1ZxijUn3CR0Ley/eHAFxKx
 3sSd1Uu6fSRL+Ai1306utpxls4pd4sKRPjD6ZnXZBzgENe+H/if1DU7jpyt3AbNaT175
 0mksi6vXu4MmR4RujASoATMrqUeNzoJMG5dKIVmkit4/Zfz+rNarrQonogzIay3icf0d
 TW/QxSMYiVCFxK51IlrOagSLfUYOf0y50sMEWaUx7XcirxsN/F650EqLsfwpmmN+kYtR
 kurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716088250; x=1716693050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lFSZbZfTC226eQMjp0sS4xniwqBXpfweUGcjqkUYZ2I=;
 b=JAyUATy7yOBSm2ceUJl3oZGU0ov1O1HN0g1i8HaTzf35UgF5hv9A00Qy/uM+DoRwOm
 Xth7qOWnoOhe48nGusPi22ay7Bgfr7HPxojYRIBJEXDG/Xb4SWxWlqUD49K8gHiK+pRD
 R3/semhkLE1QPeIL017USlpjfDy2Wnm7am2M0HN3BHp/MA/FBRzmFoWVWxZT7ZH2qWlD
 E+3DxmMkKcpShYK1ltSNAMrLfh8ptz3EQhBTLB+TXBMfJHn+dTNmI+eG3RTTOZstKd6B
 ixFpiVvNUPKGczvwC43/CXjkMOqtsC72NGsacfJybMWqak+wWtCd4eoWZl5lIx/yRADO
 0tqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+uJhzOKl6FW/x/MyPH2w0poa6vQMOtPUCRSKynp5iLzhvIwIlIQz4R0j1Mr2nWdFIhV5htB92C/7TTSIZyUWm83kLmqD2R4hDk7Lv3YfR
X-Gm-Message-State: AOJu0Ywa1tCgQ6i8/GLDIxV1zQ6PVFPSjN/oQkNHPad6uJ8n0PoucVLk
 DpFulQpzDB+nVifzt83/L+4Jj/1IXDRlgUbovi+jD9WqNTQieLm0
X-Google-Smtp-Source: AGHT+IH28eff2ZIUcVS0Dp/+G5i8Aj5IcetQJoyI2wjeZ1HW4+g7K+rPcKbEzCzdIFGIFMoPbyHv4g==
X-Received: by 2002:a05:6a00:398d:b0:6ea:dfc1:b86 with SMTP id
 d2e1a72fcca58-6f69fc15becmr3972824b3a.12.1716088250419; 
 Sat, 18 May 2024 20:10:50 -0700 (PDT)
Received: from mari.. ([2804:431:cfd3:a689:b983:dc6d:a9d1:7485])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6677f912880sm1025131a12.60.2024.05.18.20.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 20:10:50 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: MarileneGarcia <marilene.agarcia@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/dp: Fix documentation warning
Date: Sun, 19 May 2024 00:10:27 -0300
Message-Id: <20240519031027.433751-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 May 2024 08:41:57 +0000
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

It fixes the following warnings when
the kernel documentation is generated:

./include/drm/display/drm_dp_helper.h:126:
warning: Function parameter or struct member
'mode' not described in 'drm_dp_as_sdp'

./include/drm/display/drm_dp_helper.h:126:
warning: Excess struct member 'operation_mode'
description in 'drm_dp_as_sdp'

Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
Changes:
This documentation comment should refer to the name of the 
variable to solve the warnings. As operation_mode is the 
name of the enum, and the declared variable name is mode.

Thank you.

 include/drm/display/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8bed890eec2c..8defcc399f42 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
- * @operation_mode: Adaptive Sync Operation Mode
+ * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
 	unsigned char sdp_type;
-- 
2.34.1

