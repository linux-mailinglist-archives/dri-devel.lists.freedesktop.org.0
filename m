Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37A953A6E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 20:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E6110E4EC;
	Thu, 15 Aug 2024 18:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZWAUDhK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9C810E4EC;
 Thu, 15 Aug 2024 18:56:38 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7c3d9a5e050so913399a12.2; 
 Thu, 15 Aug 2024 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723748197; x=1724352997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P2ijR5sS9+P33OT+BK82QSH+TCaValD97AwdFX5nob4=;
 b=ZWAUDhK67hK+baBPIA1eStHYucElLqHRMX82GyCvwf8wn/F4rkWW0QaG+4R8qsCThR
 YaBfzhs32wJJhDMcgyzRu0kYZ78I8ddcXotXIaGPW4OEyxM7IZNu5dEIgcLFKlzMsHVe
 1F2cAYGP5uH2rYEMFGOHZp0XR6bQhOUKQk8Ym1+SujWFmX0GXIcg2TshIflct4B0r5cM
 pCGj8wckxCirAuIfs4qDbiqPJKYK+LCftdfOokmVcIC0NeWpdeymc6D1VtYeSUM3RsHY
 vxkJsZkSw3JmZW+eNYSoRi8S0pC7WWb6zWCJswCOtDIBIM3thRvGAQSp7FI4kDBrbizd
 Mj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723748197; x=1724352997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P2ijR5sS9+P33OT+BK82QSH+TCaValD97AwdFX5nob4=;
 b=P5TWiDbfbxM2JqhhlkBsxQunFun3NyPGnymBTLoCkNRS2yUWb2UqA+wWmkGYZcchB0
 wpcsSZFWyRJbgIB8aUcRYcycuRDJPFJghmwlqjwheD8OdJA7/ljPb/B9RU8rnI4jTu8H
 2HBoh5JNKK1O3i6gx+PnARjien3k7jcficV1VbGGdkwptHMIJkWV7i/XpF5RMD1ARJtl
 8Pam1cA3Ifgl8RdVkQ7WXbz3h5Q5O2m1Oiwh3RdVQS+j3NX+3f+k9lHxOmBr3+ougFdQ
 uJosgqEUyADCdRW462GaGRyNP7mR7+b/nY3N+25KAsNfYo+vgcZubylLfsOHDZ9hNaBZ
 BYxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2NQMqYQBUpcZ5E9Hs/0welqNGS2YTeve05oB0deTCbnEXic2+EsrZ40/fKfyJLLuALMDgl34h3cfpOmGZpq9c9Us7Qvwp6mvF3i9IBKLzJ5TiInZAfkBSJ1PQBAzLO89YZIQFl26A55knWED+ow==
X-Gm-Message-State: AOJu0YzX4VyowaaSkYMRnoU8GclCF+oDj3zrjEkWhA5fKIwcQbvj+8sH
 lxMIZotosf0RxYgH0bw7UZpNXgcc5XIhVN9v5lRVriUtMXO4PdWy
X-Google-Smtp-Source: AGHT+IFwYGOOjKTUC0Iff1yvkbw1tOY+wLVqX8NH0HF16cxeKgHLMG2BxroguqvE3YR036a9umE+eQ==
X-Received: by 2002:a05:6a21:648b:b0:1c6:ae03:6607 with SMTP id
 adf61e73a8af0-1c904f742dfmr893637637.6.1723748197433; 
 Thu, 15 Aug 2024 11:56:37 -0700 (PDT)
Received: from ubuntu.. ([27.34.65.188]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61a93aesm1448242a12.17.2024.08.15.11.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:56:37 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, hRodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Dipendra Khadka <kdipendra88@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix warning: symbol 'dcn3_14_ip' was not declared. Should it
 be static? in dcn314_fpu.c
Date: Thu, 15 Aug 2024 18:56:27 +0000
Message-ID: <20240815185629.65725-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Sparse reported following warning:

'''
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.c:36:30: warning: symbol 'dcn3_14_ip' was not declared. Should it be static?
'''

Since the symbol dcn3_14_ip is not exported,it is declared as static.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
index 21f637ae4add..b7463e70b6e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
@@ -33,7 +33,7 @@
 #include "dml/display_mode_vba.h"
 #include "dml/dml_inline_defs.h"
 
-struct _vcs_dpi_ip_params_st dcn3_14_ip = {
+static struct _vcs_dpi_ip_params_st dcn3_14_ip = {
 	.VBlankNomDefaultUS = 668,
 	.gpuvm_enable = 1,
 	.gpuvm_max_page_table_levels = 1,
-- 
2.43.0

