Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487AA9077CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C3110EAE4;
	Thu, 13 Jun 2024 16:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="ZWKw+J5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FB010EAE4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:06:07 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-705c1220a52so1167616b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1718294767; x=1718899567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uqGnZ+c4YFN0N7zN/JWhDm1d8eu9Jyayi93lGFPybto=;
 b=ZWKw+J5yxlfTz2TtjSltXtRgvbPQuS4hKIXS6rD1dYjmzjdvtTIqcZUqpIXuXghtV/
 yd96D3Wy2Tp/zOr7OiFQb85kFnQugMYqqIWx7ROzB52BX+p9lyLxtNRqol5UcVCGvTid
 ZiyK9wxiiG5nzOhsENUG0nBwCIUYC0fI7yx0vrWxrU6VDRv/HOmS5f+e7Wtn9joSKxNb
 IOOkWthx9KtoNaPDOee+vITKQWelRqgU7qSoOg6mb+tjl91fH9ESkb0t09hsYjUPdb5k
 /NS6f6jfK+zZxMRKq3k275HetjhF4m08dFtlWrEyjAA/KLBQMC5RP6hCTErnCw+LphiU
 PMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718294767; x=1718899567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqGnZ+c4YFN0N7zN/JWhDm1d8eu9Jyayi93lGFPybto=;
 b=bJtHdHIh43hD+MzIJ5o/+HVnwKsaLfwvMwXx6ks1L8T8MRRnrbfbXiVzik28bdyg8g
 ZsU8GzOe31b/bqEUYVkv4Xs7O5rpyFhjGSrmnnkTf4ryl6pFvkxkY7OE7Fa0htoKYgxT
 7yKHb2ifVb+s3tMl+eRVUGJMNwpbKPG24Ba/icSS3/Hn0BzTwfTVT0SnzS69Ra85teMc
 MUsNEtPYnTQPLSLwVee/En27DMb9UafSil/W8l9A13k+zLSuoEJ53Xu7L8hkEQhfM3de
 Rkt/d/0cmdSalO+3D+tUHBR+Q1HQiY+IUFd3vhpmYxJEKb+YiKW5Wd1wrGLuLI3sjuYK
 tolw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw5Zm83u5zPMhT3KeYvk9x6vbglahW22hqyivSypVk6s3yR5UJF56+s3TMW23DuQNq0g6vB7w+x5JvwrZp+aG9s0NZFI/j7rujdhHNmzjc
X-Gm-Message-State: AOJu0YwI3ja9e99GzisvcPl9412i/AVkhb+/BUaDKdLi2s0rkYk35+tm
 4zw3YVq2BJNiEw6S1YP6frCfZzfh8DQYByxhBgOEhRXAtGV5dCTQBImZLN8afA==
X-Google-Smtp-Source: AGHT+IET2qh2Oc/d7fOd9cHK6r8rP4JLeKrTcQsyevjxJ54kpmSDUO4GhIBrfGipWSvnGafLtsNg2w==
X-Received: by 2002:a05:6a20:914e:b0:1b8:a0b3:c9d5 with SMTP id
 adf61e73a8af0-1bae8283459mr294562637.41.1718294766898; 
 Thu, 13 Jun 2024 09:06:06 -0700 (PDT)
Received: from jppaulo.semfio.usp.br ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fee2d36f25sm1265737a12.72.2024.06.13.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:06:06 -0700 (PDT)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: luanicaro@usp.br, paulormm@ime.usp.br,
 Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display/dc: Remove dc code repetition
Date: Thu, 13 Jun 2024 13:05:45 -0300
Message-ID: <20240613160549.139004-1-jppaulo11@usp.br>
X-Mailer: git-send-email 2.44.0
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

Code is repeated in functions optc1_enable_crtc
(dc/optc/dcn10/dcn10_optc.c) and optc2_enable_crtc
(dc/optc/dcn20/dcn20_optc.c).

So, remove it with the creation of a macro.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 .../amd/display/dc/optc/dcn10/dcn10_optc.c    | 29 ++-----------------
 .../amd/display/dc/optc/dcn10/dcn10_optc.h    | 27 +++++++++++++++++
 .../amd/display/dc/optc/dcn20/dcn20_optc.c    | 29 ++-----------------
 3 files changed, 33 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index 5574bc628053..facdeeb41250 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -41,6 +41,8 @@
 
 #define STATIC_SCREEN_EVENT_MASK_RANGETIMING_DOUBLE_BUFFER_UPDATE_EN 0x100
 
+#define OPTC_SRC_SEL_FIELD OPTC_SRC_SEL
+
 /**
  * apply_front_porch_workaround() - This is a workaround for a bug that has
  *                                  existed since R5xx and has not been fixed
@@ -517,32 +519,7 @@ void optc1_enable_optc_clock(struct timing_generator *optc, bool enable)
  */
 static bool optc1_enable_crtc(struct timing_generator *optc)
 {
-	/* TODO FPGA wait for answer
-	 * OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE
-	 * OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK
-	 */
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	/* opp instance for OTG. For DCN1.0, ODM is remoed.
-	 * OPP and OPTC should 1:1 mapping
-	 */
-	REG_UPDATE(OPTC_DATA_SOURCE_SELECT,
-			OPTC_SRC_SEL, optc->inst);
-
-	/* VTG enable first is for HW workaround */
-	REG_UPDATE(CONTROL,
-			VTG0_ENABLE, 1);
-
-	REG_SEQ_START();
-
-	/* Enable CRTC */
-	REG_UPDATE_2(OTG_CONTROL,
-			OTG_DISABLE_POINT_CNTL, 3,
-			OTG_MASTER_EN, 1);
-
-	REG_SEQ_SUBMIT();
-	REG_SEQ_WAIT_DONE();
-
+	_optc1_enable_crtc(optc);
 	return true;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
index 2f3bd7648ba7..aea80fa6fe91 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h
@@ -604,4 +604,31 @@ struct dcn_optc_mask {
 
 void dcn10_timing_generator_init(struct optc *optc);
 
+#define _optc1_enable_crtc(optc)					\
+	do {								\
+		/* TODO FPGA wait for answer */				\
+		/* OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE */	\
+		/* OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK */	\
+		struct optc *optc1 = DCN10TG_FROM_TG(optc);		\
+									\
+		/* opp instance for OTG. For DCN1.0, ODM is remoed. */	\
+		/* OPP and OPTC should 1:1 mapping */			\
+		REG_UPDATE(OPTC_DATA_SOURCE_SELECT,			\
+				OPTC_SRC_SEL_FIELD, optc->inst);	\
+									\
+		/* VTG enable first is for HW workaround */		\
+		REG_UPDATE(CONTROL,					\
+				VTG0_ENABLE, 1);			\
+									\
+		REG_SEQ_START();					\
+									\
+		/* Enable CRTC */					\
+		REG_UPDATE_2(OTG_CONTROL,				\
+				OTG_DISABLE_POINT_CNTL, 3,		\
+				OTG_MASTER_EN, 1);			\
+									\
+		REG_SEQ_SUBMIT();					\
+		REG_SEQ_WAIT_DONE();					\
+	} while (0)
+
 #endif /* __DC_TIMING_GENERATOR_DCN10_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index d6f095b4555d..012e0c52aeec 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -37,6 +37,8 @@
 #define FN(reg_name, field_name) \
 	optc1->tg_shift->field_name, optc1->tg_mask->field_name
 
+#define OPTC_SRC_SEL_FIELD OPTC_SEG0_SRC_SEL
+
 /**
  * optc2_enable_crtc() - Enable CRTC - call ASIC Control Object to enable Timing generator.
  *
@@ -47,32 +49,7 @@
  */
 bool optc2_enable_crtc(struct timing_generator *optc)
 {
-	/* TODO FPGA wait for answer
-	 * OTG_MASTER_UPDATE_MODE != CRTC_MASTER_UPDATE_MODE
-	 * OTG_MASTER_UPDATE_LOCK != CRTC_MASTER_UPDATE_LOCK
-	 */
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	/* opp instance for OTG. For DCN1.0, ODM is remoed.
-	 * OPP and OPTC should 1:1 mapping
-	 */
-	REG_UPDATE(OPTC_DATA_SOURCE_SELECT,
-			OPTC_SEG0_SRC_SEL, optc->inst);
-
-	/* VTG enable first is for HW workaround */
-	REG_UPDATE(CONTROL,
-			VTG0_ENABLE, 1);
-
-	REG_SEQ_START();
-
-	/* Enable CRTC */
-	REG_UPDATE_2(OTG_CONTROL,
-			OTG_DISABLE_POINT_CNTL, 3,
-			OTG_MASTER_EN, 1);
-
-	REG_SEQ_SUBMIT();
-	REG_SEQ_WAIT_DONE();
-
+	_optc1_enable_crtc(optc);
 	return true;
 }
 
-- 
2.44.0

