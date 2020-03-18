Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A314418ADF8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3113D6E0FC;
	Thu, 19 Mar 2020 08:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504D36E96D;
 Wed, 18 Mar 2020 21:05:32 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id a6so101172otb.10;
 Wed, 18 Mar 2020 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HrxoukmfoCKdd5cM13ef2cbkm6CijqM+A0vCb8JlpY=;
 b=OxWGX5hBoMjCNmEUIRvAzViw6sm7jS/vIvpGQdVy4D5Qxq11sgYIe0kFrojcvNa+Ie
 DlZvm7nkKcCgY1pZiGwbALqNH+C8Jbmw/Xa72QiUoW0u8EJdKyBtFlMbUxOybbODnH6j
 2T/z6lR5Clx4kqvTrAnpAd4K//+78+hYKNwK0mKDGFU5Ms0rGpUe11rtn0iGFcRrwi8J
 cj+AVg/J0XxeH7ltJ7d7H20DvT3bnxKCncd0Jtt7TFlCK856FSl2nyK78I6hJuqM54gO
 SkuymP98Cu+w+jFoEDydE+qT8EUzF6bBWaZiOvWZ8dEax0qoQgyoCMtIGlsRQfzfxbUh
 xjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HrxoukmfoCKdd5cM13ef2cbkm6CijqM+A0vCb8JlpY=;
 b=iY3YwAYC+LpyhoZGe8syf8oltj6wrmYIOETHy98Y9ea/C3ssZg+szVl2i7OOzfowmY
 POW4kLbR+HY0CMWYI+baHXBY8MZsjWJSf5AvyaOHmK3H3qqwpxXafRjN238+L8Uge3fT
 2mvu1WcUvHaHxr1zpVvxEnI1Z6jbjMF5i0gSvUG+pOuor+dlWMzC9Ev4fyGj7qXYdIaV
 vi42khP/X4ipSodmWF5BRAXQcYMhsaGgu1i5r+IB+GgFBmTZbQdqK7UihSgnGRucf9kU
 OBo/R4H1dX7NfuW70Q5JhwbrjGknKN0TE44agPxLCbIEPVfgPbY3UVG5GbnDmcn1GfGb
 HovQ==
X-Gm-Message-State: ANhLgQ22IOixnMAClmfpTZ8slosrcoio+Um6FIu4r8RQF4VOb3MdyYrW
 ymDiTESGQlCKA2da0ibm1D19ojen
X-Google-Smtp-Source: ADFU+vv3NUU53aZLuwZTXYPcXO+ZNX43DxBkIqMo6WSd2Kr6F/ivlar/wTzAz9qC/f8rd1H7tHOJTQ==
X-Received: by 2002:a05:6830:1410:: with SMTP id
 v16mr5818832otp.315.1584565531513; 
 Wed, 18 Mar 2020 14:05:31 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 69sm40109otm.60.2020.03.18.14.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 14:05:31 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/amdgpu: Remove unnecessary variable shadow in
 gfx_v9_0_rlcg_wreg
Date: Wed, 18 Mar 2020 14:04:09 -0700
Message-Id: <20200318210408.4113-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0.rc1
In-Reply-To: <20200318002500.52471-1-natechancellor@gmail.com>
References: <20200318002500.52471-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang warns:

drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'
is used uninitialized whenever 'if' condition is
false [-Wsometimes-uninitialized]
        if (offset == grbm_cntl || offset == grbm_idx)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:757:6: note: uninitialized use
occurs here
        if (shadow) {
            ^~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:2: note: remove the 'if' if
its condition is always true
        if (offset == grbm_cntl || offset == grbm_idx)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the
variable 'shadow' to silence this warning
        bool shadow;
                   ^
                    = 0
1 warning generated.

shadow is only assigned in one condition and used as the condition for
another if statement; combine the two if statements and remove shadow
to make the code cleaner and resolve this warning.

Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
Link: https://github.com/ClangBuiltLinux/linux/issues/936
Suggested-by: Joe Perches <joe@perches.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Remove shadow altogether, as suggested by Joe Perches.
* Add Nick's Reviewed-by, as I assume it still stands.

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7bc2486167e7..496b9edca3c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -735,7 +735,6 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 	static void *spare_int;
 	static uint32_t grbm_cntl;
 	static uint32_t grbm_idx;
-	bool shadow;
 
 	scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
 	scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
@@ -751,10 +750,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 		return;
 	}
 
-	if (offset == grbm_cntl || offset == grbm_idx)
-		shadow = true;
-
-	if (shadow) {
+	if (offset == grbm_cntl || offset == grbm_idx) {
 		if (offset  == grbm_cntl)
 			writel(v, scratch_reg2);
 		else if (offset == grbm_idx)
-- 
2.26.0.rc1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
