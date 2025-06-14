Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1AAD9F8A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 21:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38EF10E157;
	Sat, 14 Jun 2025 19:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400DE10E02A;
 Sat, 14 Jun 2025 10:37:21 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4f64cdc2dso208369f8f.1; 
 Sat, 14 Jun 2025 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749897440; x=1750502240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
 b=ZfU2pChhZbTD4zV0Q94r01ab1yfbsSjgE3gexMdIacAE+XOIgjeU4xUGzUD2rZxudp
 6riKp9CZwonoymqJvTWggGmSpNRNIpO6z+WhJfRxX8xcGMwJkSkrpLY1lQnSHs8PsrGK
 eJ0M3gKG/IFvY0ONbxno8dTHyHTDtMjHv7cQ0adVjWS02nEEtz6kwki5R8DSnVL/pw+s
 fgs+WItEDAKWFpmCSNo/aG4UqAvSx1lyK6oF6tDVKGrQi8RNNWBZPYDC4JfhXYJuAdNe
 UIAv97pdwnTy0RNzZyArd8ivVBx7ITGwN0xSDHWc6F9qIXzRIG5Avku/sqy6KADDtlWy
 y9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749897440; x=1750502240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
 b=NANi5ndaaNLhoWHmvUo0HITEqUr5VplZPg2Supe9QvlOeYmS5IPpdlKtvCUSwtna52
 pjWfLTs/Xip9QkzmeNrAMsYyRIziJQtIS8uaZiz9lqt+Un7xkB8Noj42yUBFuG4glSEa
 uJG4/SFndBi74cseV0/YL1DS4yYLdNXoNgVGzPatmEbs1I3kNwjpgPeFzrXoV94PmwzB
 iF1eEHpVVN0zQ8c5Mh12OjF1ACWuttaQiuFa24EdVzgjYyauxdq6wSEtw7FAkNOaFbX3
 YnjIpSE1bUPDyPIOjeEaSXAAH+Kr2Iiw1lYvrWUZjoTt54JyIeeS0/pWxa3+1ww4ePWG
 agIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/r81j/zdxZbvrVaNH+mxVYm7pPqcSA/0SH7Psl4hU0YaWaXGHVMiOaF0nPxXMEiCTkQrJ9+kTMQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvCxA+i+xrrFDNINBU86pXx94wtiHuZEPjHbn0YFWBn2Qmyku0
 TkaL25Z/VgJ22mHUV+VrsQhjRTOAjxpub7aDIoIADLcK2SxrtD610L74
X-Gm-Gg: ASbGncuOu9HW+y76kxs6Damcj5YISXAu63Kbtwtxoa1LbViiQMrT4O5M4q4FfHLbtUd
 PJvzzofDhEO+UL39OBOSNEqH2J1BRWYnzHnyeiw2XygjEARiF4qCceaGMbAYca2I6waevSCG9CV
 hGryueGl+sRAD2liWErrdZkvXbLnXBFsLd935cLkHpUks9d/qAww3B11kG/PtKCx/WRjZu9m6Sw
 xubyyvNiAL8iJQPbv9bchq8xLIFMGLfsQJKGm7AoPAy7wAebctbDYqKYx2Qd9BtTkTw/UWB+7m4
 0G6TDaJKeVlbIbbhtfUGKo+2AYVZYwwDjmv1zYM0J28XW/l0wJIrKeUvPvJKHUq5OPWAZtjITDv
 jiQcYB0h3iP/hg6SJLRDvC7nSM2fuMlmLPg==
X-Google-Smtp-Source: AGHT+IEO2WJsG7rm3hmH9d2SJMbbIL0GVTNr61YBvUZhyy9Qp55TsFSXVuwBOr+Ocv8M12TzoBRQiA==
X-Received: by 2002:a05:6000:2f84:b0:3a5:2ee8:ee1d with SMTP id
 ffacd0b85a97d-3a572e99672mr881171f8f.16.1749897439458; 
 Sat, 14 Jun 2025 03:37:19 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e24420csm78091745e9.20.2025.06.14.03.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jun 2025 03:37:18 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.com,
 Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd/display: Add kernel-doc for mpc_funcs.mcm and rmcm
Date: Sat, 14 Jun 2025 13:37:09 +0300
Message-Id: <20250614103709.72045-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Jun 2025 19:49:17 +0000
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

This patch fixes documentation build warnings:
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 
struct member 'mcm' not described in 'mpc_funcs'
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068
struct member 'rmcm' not described in 'mpc_funcs'

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 6e303b81bfb0..ac2957c9fdd2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1038,6 +1038,16 @@ struct mpc_funcs {
 	*/
 	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
 
+     /**
+	* @mcm: Multi-Channel Mode configuration operations
+	*
+	* Contains functions for programming Multi-Channel Mode features:
+	* - 3D LUT sizing
+	* - Bias/scale programming
+	* - Bit depth configuration
+	* - LUT read/write control
+	* - LUT population
+	*/
 	struct {
 		void (*program_3dlut_size)(struct mpc *mpc, uint32_t width, int mpcc_id);
 		void (*program_bias_scale)(struct mpc *mpc, uint16_t bias, uint16_t scale, int mpcc_id);
@@ -1050,6 +1060,11 @@ struct mpc_funcs {
 			bool lut_bank_a, int mpcc_id);
 	} mcm;
 
+     /**
+	* @rmcm: Remove Multi-Channel Mode configuration operations
+	*
+	* Contains functions for removing or resetting Multi-Channel Mode features
+	*/
 	struct {
 		void (*enable_3dlut_fl)(struct mpc *mpc, bool enable, int mpcc_id);
 		void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_id, int hubp_idx);
-- 
2.25.1

