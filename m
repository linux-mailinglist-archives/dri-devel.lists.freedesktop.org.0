Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B228B7CEB2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123C10E420;
	Wed, 17 Sep 2025 07:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TW14klv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2B310E077
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 06:25:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-25669596955so64863095ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758090304; x=1758695104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o4wyrSqJyB4cA3v/v5NTU3+JE/mrTp9rWbEkkkvfz28=;
 b=TW14klv3/3Wr/h21FPbSvu/p2nkKAQZgxVI22V6c39A09nVkSDI0jtg9Y4sLyg2zy7
 NO0+8Qi19LPT9vA/um5wZmFPbvM+7tgJI6nycVjk6eK7wBUvb9Kz3amzMOvh+OowXe4F
 1paXwdoaN3IpSQHidyWq4hn5sqwf1AxXimcZjUlFMq1yaea53OP7f1Ymo/pHw47w64L2
 vMwdHPD9ocQaL67cMbJpqv75MNpGTNmAE3OCODLcHjES9QF3W033Ljc+u5dGTTxerdaX
 JJc5wHtGzmAy24qwDu1GAp0XAcgpFH9/WZGvFRt90R40Csd5jPfm78HMmrVUfbyqNAjT
 OvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758090304; x=1758695104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4wyrSqJyB4cA3v/v5NTU3+JE/mrTp9rWbEkkkvfz28=;
 b=AWP+zhJ3RqtoCrj21sJDSjR53lWSOhyzAmFds+eSE+vxvIzbdppy70FKlzVW1AtDa1
 ike1ZRtsL59X/bW1GA/XABziKshwtLtFp0Ltg3KKqpCWGqm/h1I/2BK0XXSOcQWjMnew
 0la65ZvSbuSHw4Zgr7YbKi5+b+N4vb1x1YRmH+tPuLLw49RNDcy5/LPT07syPeT+2evE
 e1gm1/tjkRhX+asSw7gd0UuHwE85uoHbDTAe/BZw3nyhVCzfx65lZGz/vJzhar3w8q0V
 FuGSBmkgwn7d8fQOWWr3SvuZIAhsfuHipvQST+Vpx4Fwj719AfQy4CP7b12wa5an1KDN
 jK/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsoR1t32RxwXBXv0bvPVrskDll+fP4st5MXhEblYHWTn6LmuzrpTMrKLoHiMUeP3FOZoijDrKxKoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3F5lnhpaTCDaNnS+Cgtndxs6oDb/+W5Sq8elFuKk/F1InAsoA
 /sMg3aHjs8pNnuq+GrPcfcY3V+N7kYAI9ivelT2Xe9UYxNB4dQQjago8
X-Gm-Gg: ASbGncuA4jOuieAgXm+Nf5gakt1m+pu6/XcRwMxk8cT8dzaPXRdN/zb7P/ag9U8EcyO
 B/pafJlevges8pi5PX19qsfLuHR0sVtnqMXmYc2VME2w9IhtbL50fdmTOPmDntZRgrZiUSQRM66
 1S9Njo5+QNh+foZlCGbbiQ2t4CJq3y9+E+1ot18T6oumawu702uMdP2FtRBi3gIrSwbQa5BaQNk
 ub+C5GBP5gbKbPIsXJro9MxU5QwO5ndeUv++obM9b3z/vrh8upaRxPHKUHPBYx+sHEoI7N2wn4D
 BqjtOvSin0lLOCg+Keki1TBLlP4Xu5bQTodYufMlRRZIWcdIWuBYcUV1aXTmkb/oSugYEio76+7
 Jfwlb5Buo6xLFBbW9/g==
X-Google-Smtp-Source: AGHT+IG4yhx/jw9zlmBHFiucCMISe3PpQu1zuHcOTs77I7QUK32j+zfTSaEaEBRwZZIrm3ySJSWT5A==
X-Received: by 2002:a17:903:987:b0:267:6754:8fd9 with SMTP id
 d9443c01a7336-268137ffe09mr11586945ad.39.1758090303761; 
 Tue, 16 Sep 2025 23:25:03 -0700 (PDT)
Received: from fedora ([119.161.98.68]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-264eeab7c22sm91296235ad.17.2025.09.16.23.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 23:25:03 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: dakr@kernel.org
Cc: Nirbhay Sharma <nirbhay.lkd@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs: drm/gpuvm: Describe map member in drm_gpuvm_map_req
Date: Wed, 17 Sep 2025 11:54:20 +0530
Message-ID: <20250917062420.69986-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Sep 2025 07:25:20 +0000
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

The kernel doc build (makedocs) threw a warning because the @op_map comment
did not match the 'map' member name in the struct.

Fix this by correcting the member name in the comment from @op_map to @map.
While at it, improve the description from simply repeating the data
type to explaining the member's purpose.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..1c851c3f778e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: The GPUVA map operation and its arguments
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.51.0

