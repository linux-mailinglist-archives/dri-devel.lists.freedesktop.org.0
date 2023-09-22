Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8807AB884
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650410E6F5;
	Fri, 22 Sep 2023 17:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E21310E6F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:54:19 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690bccb0d8aso2049399b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695405259; x=1696010059;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YRKN2/xBrWvsqRPQDODOVPiV3fGRN8WGAkKDB21KTao=;
 b=SbUSFNl+7m+WU5i+wDPdQjFktYY1ZO3ItAZ0i5XW0NglkjOUTkpsI8oDWYPoj+Bmd6
 3/7xE2QjiAuBl28dYro+SRqWC0G/3v81aktmQUOgubG3pBarHZOffk7/7a0x+njpTfMz
 vrqgLJfeG5QngLPwEWDJqO2L02ymv5W26e0bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405259; x=1696010059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRKN2/xBrWvsqRPQDODOVPiV3fGRN8WGAkKDB21KTao=;
 b=Bq9IA9EFTRHHlj9lRPHI3ycwq5gC8UJN7MQHDff8+RZXWonCr5nUE0N0+zOsKuirDl
 UJ+qZ/boMvPqrWx3aCkx1J7JoUj6yFyViLvwAxqzdCYX3eAi2oU9yzvek0bNPXo8gU9K
 oYdzfmY9Bc/pGU4kiBpccAqsh2JFkRDpCl5jdd8PODThx/MIwFJxZZP+cNA9by7xffTC
 Cnn82h44l+86CY+VAjgeEEEzdvf7gqJtI96xJLXopAgRu/bL47cqYhR/3Ra0Ey/wqVS2
 rsj/XuoE51kOxMXRkry/5afrikCwTOsvznCCnUofILfZR5GWkI+gMoG9Z6npe4ZzF68a
 tKpQ==
X-Gm-Message-State: AOJu0YypmU7tNO5wdKwYu5BHlSub2j/RlGQ8MAuQxZRPFoeML532Z6ro
 FxBWXhWgCuM+iwXGNApGz+Bdcw==
X-Google-Smtp-Source: AGHT+IHaCKf2H2xl/vEMZDs+B2JWCIWeEjv/kL2lXURkoNqtvf0o9Oh8l386aSVv3+k7z5cEewn2EQ==
X-Received: by 2002:a05:6a20:7f91:b0:135:38b5:7e58 with SMTP id
 d17-20020a056a207f9100b0013538b57e58mr339189pzj.37.1695405258962; 
 Fri, 22 Sep 2023 10:54:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 kb14-20020a170903338e00b001bb3beb2bc6sm3779500plb.65.2023.09.22.10.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:54:18 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Annotate struct ivpu_job with __counted_by
Date: Fri, 22 Sep 2023 10:54:17 -0700
Message-Id: <20230922175416.work.272-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=m5lQ9Sc4/fHR/XZEOUiHgj1+UhlsVXVLOdUWy7uMxzY=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTJ38ytmDtxaYz7ESHW4iJMEWaDISXcxNUPY
 fkE4hcFocOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UyQAKCRCJcvTf3G3A
 JvleD/4vxM9D+I+pVT/pVESSzmlw2BdKA8ww1Ze0HR9ifWWboneaUfZDM7gMmUqspaDaCL7H+g1
 Rn59P2QOYB61Ua67yMFGDFiUuQBLWULgd1+hbwV4iCPXLeeDtKF6KS2H13CtmCKui3/sfLZm2bb
 AkHVoh2LqFCxR8NejyT0txBBbE98UFkfbNFQQNg7vzNgFDdDP1XOzXL/ujf5ZQ3FZoryHa4Py53
 Ys46mRjWXc4AuqPpqMfIYAZDVvki6i5Rbox2zSFtRUDpkPf8cI63lIvws23RphDJutzGtV32jma
 ZtVA96fnHaAjIGOyC8Z8x3p06lYhtpUKpIUGHdb35Tc9T6j2oGdfHyvgeUXdNV8FfBvOsUs6Zvs
 xAHKumyqUUKvgP+MrI7ENxu/s4pST3zlfSU82orWyLgvis4FaeD7IZ7h7iIr/7L1CtowukN62UL
 YKBMNCIKulmCuOS2YmNefWgVp3lrwxBZPdkwOrrVwMtfjnyqRB+9jqt3BgtIgxEMhtJAyyHcrzi
 Nh9MKqcBUV0Mkc39kL+ed9pk7kHv67HEmvOPUeUSPr5hnKPfXCyzgJ6Dm8lrt3w6X6yQfhj7Z7F
 FZgjOe1Xd6JGHlvkbLkNyp+RHwdyr4ovCQzLTrPvdrWX49N4f2ID9UdrVZnPwPFQlD6cFKQ9lqg
 CfmV4zY GUVf7B9A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 Oded Gabbay <ogabbay@kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ivpu_job.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/accel/ivpu/ivpu_job.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index aa1f0b9479b0..5514c2d8a609 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -51,7 +51,7 @@ struct ivpu_job {
 	u32 job_id;
 	u32 engine_idx;
 	size_t bo_count;
-	struct ivpu_bo *bos[];
+	struct ivpu_bo *bos[] __counted_by(bo_count);
 };
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
-- 
2.34.1

