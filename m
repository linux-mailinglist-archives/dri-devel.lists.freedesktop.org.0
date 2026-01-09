Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B236AD07C22
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0489710E3A0;
	Fri,  9 Jan 2026 08:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="o/eFLIvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7950710E3A0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:20:23 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-430f527f5easo1466232f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767946822; x=1768551622;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zyry+szf9M9K8ZoJdoLtp8bdGl2dJDUUhxBOiIqV+fg=;
 b=o/eFLIvIx6VJBC+aI1qCZcvgdlGSUbYgh1qtMsu8pIXTyyjENlqf6v3b1TQYbD8RsT
 BApZ/3ZDs4z4rgxHGjKhji+Rrrlg2B+4P3KtM0UHtyNj6GVYGgSso/Fm3OvWiEyngqBp
 qwm3qsVFaXvKuViN8UqUah4rWQTRP47OfnR5ckMm6mwxpjciz4KJT4ffoRknF0OrvLxw
 qaWtHebYnlusRqMojLagGe0BqraKemLx591nZoGsIMBs3nBhIMTtpDvJ48kKyPoZJoFP
 Zn4EphbFo6wVQ7+lY+UjvXIpxPS09zNGEqnqcPxNuV8O/TP28h5Hu2gTImDValJUCNqG
 alGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767946822; x=1768551622;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zyry+szf9M9K8ZoJdoLtp8bdGl2dJDUUhxBOiIqV+fg=;
 b=IWtC06uXpP9h9gV5NwW3tbc+8N4NnJ5mVRSrlcz9oXHWJZJ+N8tEAWyl4g55iegd4S
 3hqQRGH7kJe8LOJ5a1HEV4f4/HTuib6T9h76bT7ViLAvvNwnUbKGXbRzSMAlDEdze10C
 eBUbLIJVkAKvBLg3gkWOlXdTvVlgV+sZOVFy87majWQGravJW1PEcIhSKDEVl5539zmC
 E80V5A4Wcmdl+q44SNaTToMwPquSDceh2Sv3tkpIEvpYpWl20gqP7dG2M8Wf6GROTh3R
 iACmVNKgfr2UfPbic3iXXIfLpyTNj/N4M3UuOGRJpVAKxAkTnL+/teszGYKgRZB+PeI2
 Rozw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Fkskf2ntK2fZPyg/YETzrSloyPmnr/v0Nm7PWRFZN+Du1KqPnV6DWrMxm6FvgxgDB+qgwBHoPtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHgVslSU0rUhVXEPqA409dYCpUmJq6984lsp7oRRD8UoVNhxan
 t7AvMErqkaOPldwCUQjBWTnha0tpInrYuEOjFnxasM8o6Gqe6d9IeE6199twqtD7rNp6+7w5b6n
 9/dGq7arFfCsrq1+EzA==
X-Google-Smtp-Source: AGHT+IH8/dxnFkIPXI5oH6OCxXDjMpSEFjD+Jve3O5XrIh566SkPJXqi/4GrJctYsg/eEDEY2rX+Mxrfi2nwKBM=
X-Received: from wmot14.prod.google.com ([2002:a05:600c:450e:b0:479:2d82:5535])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198a:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-47d8484a113mr111305585e9.5.1767946822104; 
 Fri, 09 Jan 2026 00:20:22 -0800 (PST)
Date: Fri,  9 Jan 2026 08:20:18 +0000
In-Reply-To: <202601091113.0b0WuRML-lkp@intel.com>
Mime-Version: 1.0
References: <202601091113.0b0WuRML-lkp@intel.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324; i=aliceryhl@google.com; 
 h=from:subject;
 bh=1tZFHv16ZwL+7SKnmUSQAUFEBTMTAOwSnIDQecX4Q3E=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpYLot7X73B4sGZrWfHFlDRnVAcjmhZlZf6QzFU
 f6Z9C0QNSqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWC6LQAKCRAEWL7uWMY5
 RpkQD/9aqpRA3ZLxzulyknkdjstWLk1KiYjiealHIgUZdFDW0rYeHeBzEfDLpJ8b1GRI6H6zhso
 xESviPCfPyzVhiBR6zyT2Rzn0/PCSM2SDc2aQl1WO3oadL+vEBVdUXN4L4hKwQ6SSxIfCbi6pBZ
 5Dp2ckM4IAXcN1Mh3wbBrT/sjEpNYEXK/9U6TDXfHECzKta3sJ2lysB6C7AEo9gm6CaNAywDVGW
 ZltLkRyUzDvZyIl5ihoJIAl6IhDwA7R8emT3+xH9Tb+gXtrb3ibLq+Y6q1dMYCUQclqLkvGU2UZ
 W+VceUZb3eN5hsVxdYabyWhW7sAspA5t1gnXSKUHvhdU+oEKL7DAdmhkCh4P2/1vrGmSspam/eq
 PWzaI1QU8lrE+G9g+mmlHBw15qqYaeVU/yBCoCz2XyRf4aTkvWvTKzjaQFwAq9Jkmw+7bKPTfg5
 RfdnCiAjN5NRL8eI7wiosZUq43NxW99+KBbaStBVbadsehvcLg8gRiAyPwCFGqAh0yo2G+YzJ9R
 sqAbQgWf/M0PgsF5VYzFVp/SRY1idQrvl53v/MJNeW3+ONCsSlvVX7YfhXlMpicVXy2ZTpxk6wC
 iOlpC+BhEc3zU/hWQ4yIRyCKXpHIFpBf9sFip0cVNB0uR+uMIivNNuuERjcPPvu7eclSSZJMeSF
 RVGfFz930NlKcSQ==
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082019.3999814-1-aliceryhl@google.com>
Subject: [PATCH] drm/gpuvm: fix name in kernel doc of
 drm_gpuvm_bo_obtain_locked()
From: Alice Ryhl <aliceryhl@google.com>
To: lkp@intel.com
Cc: aliceryhl@google.com, bbrezillon@kernel.org, dakr@kernel.org, 
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

When renaming this function, the name in the docs was not updated. This
causes a KernelDoc warning. Thus, fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@intel.com/
Fixes: 9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Does anyone know what the config option to enable these warnings in my
own build is?

 drivers/gpu/drm/drm_gpuvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0bb115b6b59c..c75b4877ab92 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1815,8 +1815,8 @@ drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
 
 /**
- * drm_gpuvm_bo_obtain() - obtains an instance of the &drm_gpuvm_bo for the
- * given &drm_gpuvm and &drm_gem_object
+ * drm_gpuvm_bo_obtain_locked() - obtains an instance of the &drm_gpuvm_bo for
+ * the given &drm_gpuvm and &drm_gem_object
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
  * @obj: The &drm_gem_object being mapped in the @gpuvm.
  *

base-commit: ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0
-- 
2.52.0.457.g6b5491de43-goog

