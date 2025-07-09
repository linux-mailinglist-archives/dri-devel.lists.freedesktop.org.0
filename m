Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF6AFDDA0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 04:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48EA10E200;
	Wed,  9 Jul 2025 02:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ChWNIxx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4746C10E200
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 02:45:09 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso4372748b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752029109; x=1752633909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPq+2uwW5apwANEY0SAy/z4/pBz0JuDXsQOXkU84O0M=;
 b=ChWNIxx94In5Q+yirdQVkXSfhnxEHkIliccOdDZ6Zlo8k++jeUO3P5vJKxwsmQXRIB
 Bx3gyulfni+wI8ghJ6Z9k8NPZxOVbK24/IUb/MTlxNQDlUm+Ymm30ULZshT18A7kdmiQ
 ITqWEeOz1K/e6VVRDUfdzE2pVqnE19uIwHaF4bxn1i3z2k7W+Jws5WNodC7iYw7Rd1jD
 wiylbLdYXjmcfJdga2JX9Fkbb0sdMfGN+4gM/dTM8E86s3m4ojHDkQiXx2IK1I6pfx6G
 HoThPkzQPtTfQ6WybKsFD8BUKuZ5aSgClF/YMd3+dmAFmwa8+Bq91YcT2ZgKYqBnrH0A
 40Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752029109; x=1752633909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPq+2uwW5apwANEY0SAy/z4/pBz0JuDXsQOXkU84O0M=;
 b=Se27Q7KSvj8QM6fdzVCdttkdx9raMcyvCYltHt3LX6K8sEe+mPPHP3xPQMUPbrpKng
 M4yRnlddvm4WaNM+8gw6m0BWH7ETPsVOT5cIUC4BTU6f3jnxHh+eOwai1M5WF6r1lRoG
 uotPrPdft/fEhqQewqkGoZ63lmYljFcj8RSM2BON88XaQmFKEseH+pr81aUd+fhcktDH
 2XcuFH4aQ7pRaXuAPDQGpSFzsAa4xgUl6LHHh+U4zQyKC9y01EhMZOE91078nqETqZVp
 q9ArFjGMVOu1gQwZLOXBpDqYvLrmKVKbvo5EmFmraF6HW0mxO1jJ0ngKuz9JttDu9NU/
 Icxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0GH3GnBUuuXwfpif1YPcvfEbzn/MABUjR87wbuOcvyJvxntQfRKS4unIiJ83zFvEJPTwlbWNB7hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRxinQ2f/lqIvDxoeODhhZfptnjmunHVUhnFIcZuokKUBSk53C
 xJvzOoxSnGrAtgwEdeUnd1b/rg4FLslWbN8IhSvGUFJ3dxyr/dA+PvWQ
X-Gm-Gg: ASbGnctSfTeZZw5z854kWm8xU8cLS4P5DgO0irk8ftuznM7+Q6Iu22CraftN+Tb6tEr
 4vWA8A4eritb1hM0+FfN/46PmHjqqoUl2ARAQs/wYW9YNP/8p0/IL3yVmmI2fDC4t+qZHkUXYiu
 L7ATrjC7IF7KH7JsZgIdNGesapBRnxB+hxPuKBnLjYYi1EIKDVh+MFte3r8tmSzfHCtKtcJBnru
 rZFvLlbs30ml9uCYbVkp7S1D0iDTU3DMTjm8RbbII59obHH42AkpOo9hQyW5cesyGKNCqVtW5a9
 NCk06IBTlmfizcdNgrb5SAHgQb4giWL6pXSdLxhv7xgjXdQsoIcOTQyGW9cCgw==
X-Google-Smtp-Source: AGHT+IH+kdEVZvs9IAFbHwWw/WF5McIPt9LcfUjjAjzh/4FnuSalS1e/sXDSWzZtol1ZOl8HqeNVpA==
X-Received: by 2002:a05:6a00:ac8:b0:748:ffaf:9b53 with SMTP id
 d2e1a72fcca58-74ea666190fmr1263828b3a.16.1752029108518; 
 Tue, 08 Jul 2025 19:45:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce417f206sm12092598b3a.76.2025.07.08.19.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 19:45:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8EB9E410194B; Wed, 09 Jul 2025 09:45:03 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usage
 in literal code block
Date: Wed,  9 Jul 2025 09:45:01 +0700
Message-ID: <20250709024501.9105-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245; i=bagasdotme@gmail.com;
 h=from:subject; bh=v5gWJHZSziQ9AK4ivNXRbjP5Rm/JcvFHiODpyoVd+Gk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm51/Z53YsLvGWmMfnpq8p+i6L/rxLu7T034YfIl8zXD
 T/rwnoOdZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiE8IZ/vv97ebV6XSa7Ob+
 teACe8RxsyrBF3beIv7TDe/P/iDzKomRYcsD5ZjsB2xqks158UX/dz4+dv6xy4m7yw7e4/YtcVi
 bzAUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Stephen Rothwell reports multiple indentation warnings when merging
drm-msm tree:

Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unexpected indentation. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

Fix these by wrapping drm_gpuvm_sm_map_exec_lock() expected usage
example in literal code block.

Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250708192038.6b0fd31d@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4ab4..f62005ff9b2eef 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2430,7 +2430,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
  * will be newly mapped.
  *
- * The expected usage is:
+ * The expected usage is::
  *
  *    vm_bind {
  *        struct drm_exec exec;

base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
-- 
An old man doll... just what I always wanted! - Clara

