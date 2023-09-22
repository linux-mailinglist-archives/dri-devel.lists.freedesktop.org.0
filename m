Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C931D7AB833
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10EF10E6CD;
	Fri, 22 Sep 2023 17:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B321C10E6CC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:51:43 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c46b30a1ceso21924475ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695405103; x=1696009903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJoQ4rDttwSQzl+h8GPO+G7mapr3BtySN8HDbnxSAIA=;
 b=caPjb9v+lj3Q43QrQXHjsmL8BzhdJYBtHebbZTkRngVpkNQmFylQWfyKzKqopS38st
 jTAK0bEY7CNQfCHJCgZT4sVIk0kFlIlawZtoxIKCT5w4/AFi9TpF0kK7uu1NVEBtZ02K
 DeT20QxEpA13CMXgs2jzR+gcBOfa8Vcz1luyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405103; x=1696009903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJoQ4rDttwSQzl+h8GPO+G7mapr3BtySN8HDbnxSAIA=;
 b=XVF+GUjUaihnFrLPy4g0oGXEofbvomIGr/xYECIvpNT/M9gh+q4+ZV8HR5MaAr16Xo
 uiiB2N0B6wfPlmHhrMGo03sSFdgzQmnYcX8Vr651xkb8GzMXPAqm1JjWkNYSD39w9soL
 AA3rET4f+JTdNAB9cybT2BVmSqFVXSoyy8bz2H+pF/JKLtLF3SXydwZGmkJ6DwOj9ACZ
 H8xBuDRmBpAcxDr70JGL7Mn+gFrXzVSQOD/3MEnqU7y7F5qhBPzZr4L8b6q9cLQLW7W8
 2E2DSWIrmBmZ4lNthodIEcgL5GvFmo0s9/T3/8yXA8h7Fq4ITzMG4gMRxrOTtYs1tdia
 s1IA==
X-Gm-Message-State: AOJu0YylHnUG23UOUPpKg5FqCgknBlFwWOvPQpmurTKLQOygymLpKraa
 nVHPrXcUV/jmyEMhBPK1p5g8HQ==
X-Google-Smtp-Source: AGHT+IE0vw3tENlyJ7OADDBoRIfgRk/i//iN/tovYi2O/PZ45AZp8cZKFhBRGB/lpULSf1SYlKBaxg==
X-Received: by 2002:a17:902:f7c7:b0:1c5:dd24:f0bb with SMTP id
 h7-20020a170902f7c700b001c5dd24f0bbmr158735plw.63.1695405103381; 
 Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 ji21-20020a170903325500b001b392bf9192sm3789240plb.145.2023.09.22.10.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: mmp: Annotate struct mmp_path with __counted_by
Date: Fri, 22 Sep 2023 10:51:41 -0700
Message-Id: <20230922175141.work.450-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=H1/vE1vzDEkKr/pR9G2TlDq8I/0Pjxfcmq4WIBG2rX4=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQtbAyYSxB3rtoiVITScXMw9/igQbzzli6cd
 9NaF66HGJGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3ULQAKCRCJcvTf3G3A
 JgFvD/9aVhNFMXOLfYvQuvtNWdczuksf82WmWUjZ3XxnXA2fVtRIrmINsMubWXN5BqlzWb54JAd
 2JvpfxjAjclOiZQ1TaC+xCzUTkoEbnWszJAT778l3qNuM+FynSmS8WJqcyfFWae6qACzw/UexAD
 JDEdStWGpO05F2Y+sgcCmf6rvfJS8A3MiilSGKaXl+xUHsXWS2iEBwRa4eiIE70ykhfR0HAMdXS
 L5qBSDWbXjlq0mui0yKkhE6H+xAA95ChwfuiVfcSp3s7uA5qT12D1BC9Cxy9TwGWQc/gzstl0q5
 Act4VdII0lEJtWXvl4Sj9czaYZOIflGtUky/NbxfaXdyCXBldJ15O3hex7Gy+a7jRwaFIO5lP1l
 VrXKQwNlknIw7kLZsuScN9wJEkwbAkNtn2dNeXWJRIVDRZlEDYch+nmd1ma+pDKFjLccKHNVCyn
 srI+NBBV0w6HIUUfyqXhVfXNhpxbawfW88qpoywu/N71xmeTIdAbcNhW4F7jFKwwFPOz8+ib6PB
 htPR2uKXF1fwz05xPScZwFqkbtuiB5nzGhfpttxqXo6HjJpg3OuRsjckExbw4ipKW2dbuANjPVL
 n1Saavvp4yFM7FKZDSNxqVP/nSKD8kjtleMkQzEEJwmM4S/b0Fm0MbxtSCIKC/ed6tHkllPeipu
 NODokxp /mmGU/PQ==
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
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mmp_path.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/video/mmp_disp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index 77252cb46361..a722dcbf5073 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -231,7 +231,7 @@ struct mmp_path {
 
 	/* layers */
 	int overlay_num;
-	struct mmp_overlay overlays[];
+	struct mmp_overlay overlays[] __counted_by(overlay_num);
 };
 
 extern struct mmp_path *mmp_get_path(const char *name);
-- 
2.34.1

