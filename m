Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81698EA75
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F15B10E7BD;
	Thu,  3 Oct 2024 07:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGQ3uGRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0410E166
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 10:14:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso4410847a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727864044; x=1728468844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ITkNe+vNpHw1xzRexboVGuwiuVidOEjpkGuzCecQoQ=;
 b=PGQ3uGRjPSddHmK42GgKuxLHwVj7vlGLRSUM+qebrtv7V2kiEpc+U8Myceu3DZBfvK
 gCoPpbWa1G42/6j3n8SfwcOH1GGJ4UuR6xeIl+Wlg8AlSvqKBlZDvwgofkXmgSY8fn8M
 byiZxYV6tw2/wE4CgLJ7VjDJiB3E9pqkDGpxx0AOj1pucnRZFfmM6zkwff3jRbiPBpwT
 lJrrAVtEao8YjQlQMbBgo51kbvwYpec7R6+dP35mO5T1CGotOVBxl+vKaEhUvNkHhvoR
 MhWb7k+LVMj+mOfpS3i1JmMfdkhExO7NcSmOEJ54ntXZsooz8uejjs7fM8U3romJvZ+5
 G3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727864044; x=1728468844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ITkNe+vNpHw1xzRexboVGuwiuVidOEjpkGuzCecQoQ=;
 b=EE/7nbE8ngllJMvLHYvSXQxyUAHamFExThtSvlcxKVjYrzzE2AbFt+Z5RxzihdW1DF
 XDyiX8soK95dHs+OTdunFrCXXIFEJ9eTbetYrYKW1DEaVTQxQX1fS50Garh017glTSYT
 NmCJk/DKNn0KM4PZqoBStZM4WeaiKNuc3smdmciMypfR0/5VjXTzb2e5tdeRw5uwQC3A
 dhHYxPYAYS4RJX8eORmwiJRFZ68s51H1SblzMbh7rgfrojAbGmMphdfXqFWZ1B2KtFT8
 suA5w5BYVKbbnm6FlzDg2eMhKI/VYXHIPRRN58wWv7hT42wR1MV4cl4tFlBfbgHRUorO
 uWlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV77lJbXkfD+dswYAjZaidrMKJVpZGkv6FdhVmmBXbCBj+3hyeb/HgYZbGY+zUgFtu7cxCyRvVVPB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX9R5TsQkGl7jPvc3R4RxF860S09BV1sa0uW1hcMiUB/g5BtV3
 XgBPw1Tft8KYpSPLnTpAV7uiga+5CezhdcFyYPA3WtZnqDXO7L6c
X-Google-Smtp-Source: AGHT+IHsEpxiZKr1A+amXk6qtyBogBEtwHQBxLPLnv6JkIZs9mofhd/Q4z4wixB8pY4oRE0ZobmECQ==
X-Received: by 2002:a05:6a21:3417:b0:1cf:4596:d486 with SMTP id
 adf61e73a8af0-1d5e2d42f0emr3893725637.47.1727864043756; 
 Wed, 02 Oct 2024 03:14:03 -0700 (PDT)
Received: from Archie.mec.ac.in ([210.212.232.142])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9c4e5ad46sm352374a12.36.2024.10.02.03.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 03:14:03 -0700 (PDT)
From: KK Surendran <kksurendran95@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 KK Surendran <kksurendran95@gmail.com>
Subject: [PATCH] docs: Fix typo
Date: Wed,  2 Oct 2024 15:43:44 +0530
Message-ID: <20241002101344.137636-1-kksurendran95@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Fix typo in Documentation/gpu/rfc/i915_scheduler.rst -
"paralllel" to "parallel"

Signed-off-by: KK Surendran <kksurendran95@gmail.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index c237ebc02..2974525f0 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -26,7 +26,7 @@ i915 with the DRM scheduler is:
 	  which configures a slot with N contexts
 	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
 	  a slot in a single execbuf IOCTL and the batches run on the GPU in
-	  paralllel
+	  parallel
 	* Initially only for GuC submission but execlists can be supported if
 	  needed
 * Convert the i915 to use the DRM scheduler
-- 
2.46.2

