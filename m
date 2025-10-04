Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC3BB91CB
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 22:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1789D10E0B8;
	Sat,  4 Oct 2025 20:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+n3wsnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EFA10E0B8
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 19:39:50 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso3358970b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759606789; x=1760211589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EwGSliX1mVD9XKBDtx3vbuVXJahwpcA8bWgLzGN9Qo4=;
 b=Y+n3wsnENQQUcLdB24sQbTBoYJqvjnENngvNk319aCg4EI2xXXfIR9LhsKXaZFLBpT
 W518A4wLBzlsFYE7OcQqBwm3SkAKtyfk1IxLLzlPH2kw17+7gle96NCmjEMnZjEAPHm/
 L9fh4vr2xnhPXo/GIF/RYLzaglbh5cql2ebNm1VV4hgC+i6K3B2KusYFcS8X8kMpWjDZ
 /6JbZodlus0++UbrYYH3kHT/53uKQPKL4EGBO/kUg4JsqS+WUEPQOLVKBr55SUgu0Tyo
 4IjCJ9EphUVz7PIA64Vveu4uMa2e6VTYSYU/qaAgyPwwdNbtiJ8gPtakDeXmsCju4Mbm
 FO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759606789; x=1760211589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwGSliX1mVD9XKBDtx3vbuVXJahwpcA8bWgLzGN9Qo4=;
 b=m8b0i6xaM3AA95jiRLdISyFJxH5qKDO0Rwwn+GbK35Mt3WcvoZOim8rIxeg72pg5ur
 OT9xLRXsiULxm1e1uZeExI7OANplZ1nd1Ja2kJlZ1/qc8SEhShbwr+F9AF4TE49NV8xm
 J5eAI/+lyUaQ87P+V8fJXmwNX4MDZOuLstOlgBOAijkfn/n5Nrcx2dWP4JfrPwPo/tkj
 /tnvx9RXeOoA7j6ZOKtQs+QgWgUGVMSdFtNKsA8ZS/lmdmLZSJjpftouLYGfHGnnLyt0
 Jq93tokz+KaF06X521APUtIzA6kL3Xm5ceRxJL10OKtJLBeaFWs6q9i5E4XNQinPN7jU
 +PDg==
X-Gm-Message-State: AOJu0YzaqG3GSNig1oxnmTiun4Xv1Vq7pAjWMGSXOiR1SN0zcfnZn56Q
 3rE2Fw/mCqh0FucDbVuGqPb315rq1CTGXGTVdplTWt/rhAWhGcnYtnbV
X-Gm-Gg: ASbGncucZzuTMDdOr+q0odwm8YftCKYx1TuP39KopPMA/xlzoLQjEt7IXJKlS3AaOoi
 7VV2ASVVRDxh72BaV/8mAEm7e6nx6YClOG5vt5S2jJY7r0kG71s2HPNylksfkxFpfe1pbHx0TOz
 2u31NFuPZrgr6L9LJHiNDfSEi01NfsXNUMGkOuvO9ooR4ITHrJzaiq/L6XM/gXrhJNKXAgisS+m
 cuD/Xjux1uLiZK92fJI70CPy/2FMS3lXjayIuMLdo0C0uIpNgvnD2OfnhAZnzDeMJA25cFBwvWq
 9JDKgAr41GU1cbqpXi06V60CRnt+SMFPVCJSVhbeDVAjbPyRygfFdvR59P2xdpATYj6rysqt4Lc
 gsWwKY0roftrIbfWbR9zoq3gtJQvdSAS1rKNzm0CWLAP3fT+r4OMsj6DuSO0f8w+Eo1MCU1LXhx
 +4yKaiZdyRoHqHc6a1yrfRbwfdjM1SBY9L2RwAopBGAH6GvG07HQ==
X-Google-Smtp-Source: AGHT+IEH2gB4/3w8XRUHtUUFFuezhIFiSmbnR5x6+r4LyWsU3mw2nOMIyBl4ufOiSwukwPVKjaMQnA==
X-Received: by 2002:a05:6a00:2d22:b0:781:1660:76c3 with SMTP id
 d2e1a72fcca58-78c98a4c141mr8622664b3a.6.1759606789550; 
 Sat, 04 Oct 2025 12:39:49 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053584sm8239177b3a.50.2025.10.04.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 12:39:49 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dakr@kernel.org, matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 aliceryhl@google.com, airlied@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req
Date: Sat,  4 Oct 2025 19:38:25 +0000
Message-Id: <20251004193825.1466728-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 04 Oct 2025 20:35:54 +0000
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

WARNING: ./include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

The struct drm_gpuvm_map_req has a member named `map`, but the
kernel-doc comment still refers to it as `@op_map`. This patch
updates the documentation to match the current field name.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..476990e761f8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.34.1

