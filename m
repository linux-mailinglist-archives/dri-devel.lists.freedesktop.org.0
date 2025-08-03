Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10DB19C61
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3633210E035;
	Mon,  4 Aug 2025 07:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CGJZE+/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9170B10E0CB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 09:26:41 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b34c068faf8so3565432a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754213201; x=1754818001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xf+CB48o0krzq5HXF8wTrlbGY9U2aGX2mTek/fztxU4=;
 b=CGJZE+/UCjUaWvjwmkxdrfRysoJQ/652EdMRTHWS1o71cstFLTOvt4tAyHYuRedKdZ
 hz8I8bVh8J8QaMRH36WMW/FqkhpSjhHQQJDtIigVyZCMgd/vDBpdmLIX/6WeG5ANAGix
 C+Edd5LtIz35Xf+GQz3ds4Xv0D9v+cgPm/eNBwdos6/jU33za/+qhFCXZZxOnXnj8j2G
 66j8AJByNehQ+PS1HEg5YH4EE/CzkFB6sAY8XTNB4njtoZpKwSXVLvANA8/Zi69WGsu9
 hJL7PwUnf4FDd3ol9vgxVgIf1QyPklVxJTqcTj8Zyv/u7wLRKDjCCHX2yYhB+CbKO5qN
 I7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754213201; x=1754818001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xf+CB48o0krzq5HXF8wTrlbGY9U2aGX2mTek/fztxU4=;
 b=bSSUmnsUdH5UY8Mw30k9Pykb2IQUQ/csor/hgsjljaHWRITl8wW/fTdMdA7DM2IOYG
 /a//ISfohXzusX9LAAV/F1+RAYr7Ym5uYdfeDuJ/I/vH2aXLO0RMTfjarg/FgMb44x5N
 idlRpfSJE8I14iCf/AJgm4XlyMeubYuTBA9qjC9op0X6wdOovKCMzC7MM4k/uBX0S8wD
 ZhZI6OdxMKhSW4mVJRwZcZdjFH0H5SG9MB2zs9qVqu6xymPL7n02ykQA0otOfgm/UsqJ
 nIEshM69S7IXUYUtBXmzzT3mMoyaiyC9Rc+8Yw2/sFsCy/EYwIFpn09impwx5gcI1zbT
 7kYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6LIZdX2D0MLVpXFv56vbPejLxuWrDz+E3FCktAu9hExsZrSjykct8GVnPIs/SIVUv1COTvXtWWI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlbkoQZKzCym+y+Dg0C5DIHFO91NTt/RSATtjgtQlVY46HuANZ
 n8UBIMW0yqJrRJWQ/VfJF+c62aZYLaTZ4L8izh4h3RZcINtNgiJmzj2+
X-Gm-Gg: ASbGnctSGPzHn6LgDu+nfvChe8ULFewzh45JVXk2xXD1E+m8mKDhqrscENZ4ZWogayB
 eGHs0ZQeIrh7KHsT1QtdHLZZ/VShlrKpv74OnSrn7QWOJ3J5QV0XxTNy9lbSRbvRofqdAEjiXbv
 69NrtWMz1qco+WzWiaLRJCzrqE73g7CXMkYsofUXZGtEmv1530XQZ/JGsHyIVYO8ueuvvIFdgHD
 3maOAwbAazMBwFPJOi1XtB7r12PlVjj6sEuEWW/3IvXPHS/q9l49UVowUn4tQtSkWAg3Wvakq4+
 WKzW/x9m57FYOs+c7+Z6kp2LoYO83z/kquMOM/ngX7mnkFxw5lIpGnPU2BeRhLGFPZ5HlSSrPcj
 ueBJARL0fjdj74wBv4kDbbouinNTVJAumgQ==
X-Google-Smtp-Source: AGHT+IFfWcED3Joe1pUA/sM9Vt4NU6PNW1ZV+CjXMBQyJNJMXMktKo40ISTWSvawGpK7dyzxPJDdKg==
X-Received: by 2002:a05:6a21:2d8b:b0:23f:f431:9f77 with SMTP id
 adf61e73a8af0-23ff4319ff1mr5785966637.22.1754213200742; 
 Sun, 03 Aug 2025 02:26:40 -0700 (PDT)
Received: from server.. ([103.250.145.182]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcee7sm8017807b3a.66.2025.08.03.02.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 02:26:40 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gpuvm: Fix kernel-doc formatting and typo in
 drm_gpuvm_sm_map_exec_lock
Date: Sun,  3 Aug 2025 14:56:15 +0530
Message-ID: <20250803092622.27532-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Aug 2025 07:22:19 +0000
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

Add `.. code-block:: c` directive to resolve Sphinx parsing issues
like "unexpected indentation" and "definition list ends without a
blank line" during make htmldocs.

Also corrected a typo in the return section from "negative error codec"
to "negative error code".

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..fb46f531fe7d 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,6 +2432,8 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is:
  *
+ * .. code-block:: c
+ *
  *    vm_bind {
  *        struct drm_exec exec;
  *
@@ -2473,7 +2475,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
  *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
  *
- * Returns: 0 on success or a negative error codec
+ * Returns: 0 on success or a negative error code
  */
 int
 drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
-- 
2.43.0

